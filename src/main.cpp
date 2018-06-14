#include "Arduino.h"
#include <avr/power.h>
#include <RFM69.h>
#include <JeeLib.h>


// reed contact 1 = RE1/P3 = window fully open
#define REED_CONTACT_1 A1

// reed contact 2 = RE2/P5 = window half open
#define REED_CONTACT_2 A0

#define NODEID        101
#define NETWORKID     100
#define GATEWAYID     1
#define FREQUENCY     RF69_433MHZ
#define ENCRYPTKEY    "sampleEncryptKey"
#define ACK_TIME      15
#define DEBUG 1

#define WINDOW_STATUS_UNDEFINED 0
#define WINDOW_STATUS_CLOSED    1
#define WINDOW_STATUS_HALF_OPEN 2
#define WINDOW_STATUS_OPENED    3

#define ACTION_STATUS_SLEEP 0
#define ACTION_STATUS_READ 1

RFM69 radio;
byte ADCSRA_status;
const float InternalReferenceVoltage = 1.1;
volatile short window_status = WINDOW_STATUS_UNDEFINED;
volatile short action_status = ACTION_STATUS_SLEEP;

ISR(WDT_vect) {
	Sleepy::watchdogEvent();
}

ISR(PCINT1_vect) {
	action_status = ACTION_STATUS_READ;
}

short get_window_status() {
	bool reed_status_1 = digitalRead(REED_CONTACT_1);
	bool reed_status_2 = digitalRead(REED_CONTACT_2);

	if (reed_status_1 == false and reed_status_2 == false) {
		return WINDOW_STATUS_CLOSED;
	}

	if (reed_status_1 == true and reed_status_2 == false) {
		return WINDOW_STATUS_OPENED;
	}

	if (reed_status_1 == false and reed_status_2 == true) {
		return WINDOW_STATUS_HALF_OPEN;
	}

	return WINDOW_STATUS_UNDEFINED;
}

float read_battery_volatage() {
	power_adc_enable();
	ADCSRA = ADCSRA_status;
	ADCSRA |= bit (ADPS0) |  bit (ADPS1) | bit (ADPS2);  // Prescaler of 128
	ADMUX = bit (REFS0) | bit (MUX3) | bit (MUX2) | bit (MUX1);

	delay(10);
	bitSet (ADCSRA, ADSC);
	while (bit_is_set(ADCSRA, ADSC)) {
	}
	float battery_voltage = InternalReferenceVoltage / float (ADC + 0.5) * 1024.0;

	if (DEBUG == 1) {
		Serial.print("Voltage = ");
		Serial.println(battery_voltage);
		Serial.flush();
	}
	ADCSRA &= ~(1 << 7);
	power_adc_disable();
	return battery_voltage;
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

	PCICR |= ~(1 << PCIE1);
	PCMSK1 |= ~(1<<PCINT8);
	PCMSK1 |= ~(1<<PCINT9);

	interrupts();
}

void send_status(short status) {
	char buffer[19];
	float volt = (double)read_battery_volatage();

	char volt_str[10];
	dtostrf(volt, 3,2, volt_str);

	sprintf(buffer, "WindowStatus:%d:%s", status, volt_str);
	radio.sendWithRetry(GATEWAYID, buffer, strlen(buffer), 6);
	radio.sleep();

	if (DEBUG == 1) {
		Serial.println(buffer);
		Serial.flush();
	}
}

void setup() {
	if (DEBUG == 1) {
		Serial.begin(9600);
		Serial.println("Starting window-contact-rfm69");
		Serial.flush();
	}
	else {
		power_usart0_disable();
	}
	ADCSRA_status = ADCSRA;
	ADCSRA &= ~(1 << 7);
	power_adc_disable();
	power_twi_disable();

	pinMode(REED_CONTACT_1, INPUT);
	pinMode(REED_CONTACT_2, INPUT);

	radio.initialize(FREQUENCY, NODEID, NETWORKID);
	radio.encrypt(ENCRYPTKEY);
	radio.sleep();

	window_status = get_window_status();
	send_status(window_status);

	setup_pin_change_interrupt();
}

void loop() {
	if (action_status == ACTION_STATUS_READ) {
		disable_pin_change_interrupt();

		if (DEBUG == 1) {
			Serial.println("at action_status == ACTION_STATUS_READ");
			Serial.flush();
		}

		Sleepy::loseSomeTime(3000);
		if (DEBUG == 1) {
			Serial.println("at action_status == ACTION_STATUS_READ - after sleep");
			Serial.flush();
		}

		window_status = get_window_status();
		send_status(window_status);

		action_status = ACTION_STATUS_SLEEP;
	}
	if (action_status == ACTION_STATUS_SLEEP) {
		if (DEBUG == 1) {
			Serial.println("at action_status == ACTION_STATUS_SLEEP");
			Serial.flush();
		}
		setup_pin_change_interrupt();
		Sleepy::powerDown();
	}
}
