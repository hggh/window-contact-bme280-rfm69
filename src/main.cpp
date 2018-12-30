#include "Arduino.h"
#include <avr/power.h>
#include <RFM69.h>
#include <Bounce2.h>
#include <JeeLib.h>
#include <Voltage.h>

#include "config.h"

// push switch
#define PUSH_SWITCH_PIN 3

// reed contact 1 = RE1/P3 = right contact
#define REED_CONTACT_1 A1

// reed contact 2 = RE2/P5 = left contact
#define REED_CONTACT_2 A0

#define WINDOW_STATUS_UNDEFINED 0
#define WINDOW_STATUS_CLOSED    1
#define WINDOW_STATUS_HALF_OPEN 2
#define WINDOW_STATUS_OPENED    3

#define ACTION_STATUS_SLEEP 0
#define ACTION_STATUS_READ 1
#define ACTION_STATUS_AWAKE 2

#define BUTTON_MODE_NO_CONFIGURE 0
#define BUTTON_MODE_CONFIGURE 1

Bounce push_button = Bounce();
RFM69 radio;
Voltage voltage;
volatile short window_status = WINDOW_STATUS_UNDEFINED;
volatile short action_status = ACTION_STATUS_SLEEP;
volatile short button_status = BUTTON_MODE_NO_CONFIGURE;
volatile unsigned long window_weakup_time = 0;

/*
 * arduino does not map the crystal pin to digital pin mapping
 * LEDs are connected to PB6/PB7
 */
void led_d1(uint8_t a) {
  // GREEN LED
  PORTB = (a<<PORTB7);
}

void led_d2(uint8_t a) {
  // RED LED
  PORTB = (a<<PORTB6);
}

ISR(WDT_vect) {
  Sleepy::watchdogEvent();
}

ISR(PCINT1_vect) {
  action_status = ACTION_STATUS_READ;
  window_weakup_time = millis();
}

void button_pressed() {
  action_status = ACTION_STATUS_AWAKE;
}

short get_window_status() {
  int reed_status_1 = digitalRead(REED_CONTACT_1);
  int reed_status_2 = digitalRead(REED_CONTACT_2);

#ifdef DEBUG
  Serial.print("Reed Status 1: ");
  Serial.println(reed_status_1);
  Serial.print("Reed Status 2: ");
  Serial.println(reed_status_2);
#endif

  if (WINDOW_ORIENTATION == 1) {
    if (reed_status_1 == LOW and reed_status_2 == HIGH) {
      return WINDOW_STATUS_CLOSED;
    }
    if (reed_status_1 == LOW and reed_status_2 == LOW) {
      return WINDOW_STATUS_OPENED;
    }
    if (reed_status_1 == HIGH and reed_status_2 == LOW) {
      return WINDOW_STATUS_HALF_OPEN;
    }
  }

  if (WINDOW_ORIENTATION == 2) {
    if (reed_status_1 == HIGH and reed_status_2 == LOW) {
      return WINDOW_STATUS_CLOSED;
    }
    if (reed_status_1 == LOW and reed_status_2 == LOW) {
      return WINDOW_STATUS_OPENED;
    }
    if (reed_status_1 == LOW and reed_status_2 == HIGH) {
      return WINDOW_STATUS_HALF_OPEN;
    }
  }
 

  return WINDOW_STATUS_UNDEFINED;
}

void setup_pin_change_interrupt() {
  noInterrupts();
  PCICR |= (1 << PCIE1);

  PCMSK1 |= (1<<PCINT8);
  PCMSK1 |= (1<<PCINT9);

  interrupts();
}

void disable_pin_change_interrupt() {
  noInterrupts();

  PCICR &= ~(1 << PCIE1);
  PCMSK1 &= ~(1<<PCINT8);
  PCMSK1 &= ~(1<<PCINT9);

  interrupts();
}

void send_status(short status) {
  char buffer[30] = "";
  double volt = (double)voltage.read();

  char volt_str[10];
  dtostrf(volt, 3,2, volt_str);

  sprintf(buffer, "%d;WinStatus;%d;%s", NODEID, status, volt_str);
  if (radio.sendWithRetry(GATEWAYID, buffer, strlen(buffer), 6, 60) == false) {
    led_d2(1);
    _delay_ms(100);
    led_d2(0);
  }
  radio.sleep();

#ifdef DEBUG
  Serial.println(buffer);
  Serial.flush();
#endif
}


void setup() {
#ifdef DEBUG
  Serial.begin(9600);
  Serial.println("Starting window-contact-rfm69");
  Serial.flush();
#else
  power_usart0_disable();
#endif
  power_twi_disable();

  voltage.init();

  pinMode(REED_CONTACT_1, INPUT);
  pinMode(REED_CONTACT_2, INPUT);

  pinMode(PUSH_SWITCH_PIN, INPUT);
  push_button.attach(PUSH_SWITCH_PIN);
  push_button.interval(25);
  attachInterrupt(digitalPinToInterrupt(PUSH_SWITCH_PIN), button_pressed, CHANGE);

  // LED Pins to output
  DDRB = (1<<DDB7) | (1<<DDB6);

  radio.initialize(FREQUENCY, NODEID, NETWORKID);
  radio.encrypt(ENCRYPTKEY);
  radio.sleep();

  window_status = get_window_status();
  send_status(window_status);

  setup_pin_change_interrupt();
}

void loop() {
  push_button.update();

  if (push_button.rose()) {
    noInterrupts();
    if (button_status == BUTTON_MODE_NO_CONFIGURE) {
      // we are in NO CONIFGURE mode, now switch to configuration mode
      button_status = BUTTON_MODE_CONFIGURE;
      led_d1(1);
      _delay_ms(300);
      led_d1(0);
      _delay_ms(600);
      led_d2(1);
      _delay_ms(300);
      led_d2(0);
    }
    else {
      button_status = BUTTON_MODE_NO_CONFIGURE;
      led_d2(1);
      _delay_ms(300);
      led_d2(0);
      _delay_ms(600);
      led_d1(1);
      _delay_ms(300);
      led_d1(0);

      // configure mode is now switched off go back to sleep
      action_status = ACTION_STATUS_SLEEP;
    }
#ifdef DEBUG
    Serial.print("configure mode: ");
    if (button_status == BUTTON_MODE_CONFIGURE) {
      Serial.println("ON");
    }
    else {
      Serial.println("OFF");
    }
    Serial.flush();
#endif
    interrupts();
  }

  
  if (action_status == ACTION_STATUS_READ) {
    if (millis() > window_weakup_time + 750) {

      window_status = get_window_status();
      send_status(window_status);

      action_status = ACTION_STATUS_SLEEP;
    }
    else {
      Sleepy::loseSomeTime(10);
    }
  }

  
  if (action_status == ACTION_STATUS_SLEEP) {
#ifdef DEBUG
      Serial.println("at action_status == ACTION_STATUS_SLEEP");
      Serial.flush();
#endif
    setup_pin_change_interrupt();
    Sleepy::powerDown();
  }
}

