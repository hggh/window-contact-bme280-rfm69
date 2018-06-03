#include "Arduino.h"
#include <avr/power.h>
#include <RFM69.h>
#include <JeeLib.h>


#define NODEID        101
#define NETWORKID     100
#define GATEWAYID     1
#define FREQUENCY     RF69_433MHZ
#define ENCRYPTKEY    "sampleEncryptKey"
#define ACK_TIME      15
#define DEBUG 1

RFM69 radio;
byte ADCSRA_status;
const float InternalReferenceVoltage = 1.1;

ISR(WDT_vect) {
	Sleepy::watchdogEvent();
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

void setup()
{
	if (DEBUG == 1) {
		Serial.begin(9600);
		Serial.println("Starting window-contact-rfm69");
		Serial.flush();
	}
	else {
		power_usart0_disable();
	}
	// disable ADC
	ADCSRA_status = ADCSRA;
	ADCSRA &= ~(1 << 7);
	power_adc_disable();

	radio.initialize(FREQUENCY, NODEID, NETWORKID);
	radio.encrypt(ENCRYPTKEY);
	radio.sleep();
}

void loop() {
	float volt = (double)read_battery_volatage();

	char buffer[32];
	char volt_str[10];
	dtostrf(volt, 3,2, volt_str);

	sprintf(buffer, "Test:%s", volt_str);
	radio.sendWithRetry(GATEWAYID, buffer, strlen(buffer), 2);
	radio.sleep();

	Sleepy::loseSomeTime(5000);
}
