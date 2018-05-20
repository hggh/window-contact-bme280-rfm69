EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:rfm69
LIBS:window-contact-bme280-rfm69-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery_Cell BT1
U 1 1 5B016578
P 1050 1400
F 0 "BT1" H 1150 1500 50  0000 L CNN
F 1 "CR2477" H 1150 1400 50  0000 L CNN
F 2 "battery:CR2477" V 1050 1460 50  0001 C CNN
F 3 "" V 1050 1460 50  0000 C CNN
	1    1050 1400
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5B016625
P 2300 2550
F 0 "C1" H 2325 2650 50  0000 L CNN
F 1 "100nf" H 2325 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2338 2400 50  0001 C CNN
F 3 "" H 2300 2550 50  0000 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B01665D
P 5100 3700
F 0 "R2" V 5180 3700 50  0000 C CNN
F 1 "10k" V 5100 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5030 3700 50  0001 C CNN
F 3 "" H 5100 3700 50  0000 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5B0166FD
P 4650 3100
F 0 "R1" V 4730 3100 50  0000 C CNN
F 1 "10k" V 4650 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4580 3100 50  0001 C CNN
F 3 "" H 4650 3100 50  0000 C CNN
	1    4650 3100
	0    1    1    0   
$EndComp
$Comp
L CONN_01X04 P2
U 1 1 5B01681F
P 6250 3000
F 0 "P2" H 6250 3250 50  0000 C CNN
F 1 "BME280" V 6350 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 6250 3000 50  0001 C CNN
F 3 "" H 6250 3000 50  0000 C CNN
	1    6250 3000
	1    0    0    -1  
$EndComp
Text GLabel 1050 1750 0    60   Input ~ 0
GND
Text GLabel 1050 1050 0    60   Input ~ 0
VCC
Wire Wire Line
	1050 1050 1050 1200
Wire Wire Line
	1050 1500 1050 1750
Text GLabel 5850 3150 0    60   Input ~ 0
VCC
Text GLabel 5600 3050 0    60   Input ~ 0
GND
Wire Wire Line
	6050 3050 5600 3050
Wire Wire Line
	6050 3150 5850 3150
Text GLabel 5550 3750 0    60   Input ~ 0
VCC
$Comp
L ATMEGA328P-P IC1
U 1 1 5B0175B5
P 3350 2750
F 0 "IC1" H 2600 4000 50  0000 L BNN
F 1 "ATMEGA328P-P" H 3750 1350 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 3350 2750 50  0000 C CIN
F 3 "" H 3350 2750 50  0000 C CNN
	1    3350 2750
	1    0    0    -1  
$EndComp
Text GLabel 4950 3100 2    60   Input ~ 0
VCC
Wire Wire Line
	4500 3100 4350 3100
Wire Wire Line
	4800 3100 4950 3100
$Comp
L CONN_01X03 P1
U 1 1 5B017A1A
P 5900 3650
F 0 "P1" H 5900 3850 50  0000 C CNN
F 1 "REED" V 6000 3650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 5900 3650 50  0001 C CNN
F 3 "" H 5900 3650 50  0000 C CNN
	1    5900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3750 5550 3750
NoConn ~ 5700 3650
Wire Wire Line
	1050 1200 2150 1200
Wire Wire Line
	2150 1200 2150 2400
Wire Wire Line
	2150 2400 2450 2400
Wire Wire Line
	2450 2400 2450 1650
Connection ~ 2300 2400
Connection ~ 2450 2250
Connection ~ 2450 1950
Wire Wire Line
	2300 2700 2300 3850
Wire Wire Line
	2300 3850 2450 3850
Wire Wire Line
	2450 3850 2450 3950
Wire Wire Line
	1050 1500 1950 1500
Wire Wire Line
	1950 1500 1950 2700
Wire Wire Line
	1950 2700 2300 2700
Connection ~ 2300 2700
Connection ~ 1050 1500
Connection ~ 1050 1200
Connection ~ 2450 3850
$Comp
L RFM69 RF1
U 1 1 5B018194
P 6550 2050
F 0 "RF1" H 6850 2600 60  0000 C CNN
F 1 "RFM69" H 6500 2600 60  0000 C CNN
F 2 "rfm69:RFM96" V 6700 2100 60  0001 C CNN
F 3 "" V 6700 2100 60  0000 C CNN
	1    6550 2050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P3
U 1 1 5B01827B
P 8050 2550
F 0 "P3" H 8050 2650 50  0000 C CNN
F 1 "AN" V 8150 2550 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 8050 2550 50  0001 C CNN
F 3 "" H 8050 2550 50  0000 C CNN
	1    8050 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2050 5650 2050
Wire Wire Line
	5650 2050 5650 1750
Wire Wire Line
	5650 1750 6150 1750
Wire Wire Line
	8050 2350 7150 2350
Text GLabel 7650 2250 2    60   Input ~ 0
VCC
Wire Wire Line
	7650 2250 7150 2250
Text GLabel 6000 2350 3    60   Input ~ 0
GND
Wire Wire Line
	6150 2350 6000 2350
Text GLabel 7250 2150 2    60   Input ~ 0
GND
Wire Wire Line
	7250 2150 7150 2150
Wire Wire Line
	7150 1750 7150 1200
Wire Wire Line
	7150 1200 4600 1200
Wire Wire Line
	4600 1200 4600 1850
Wire Wire Line
	4600 1850 4350 1850
Wire Wire Line
	4350 1950 5400 1950
Wire Wire Line
	5400 1950 5400 1400
Wire Wire Line
	5400 1400 7500 1400
Wire Wire Line
	7500 1400 7500 1950
Wire Wire Line
	7500 1950 7150 1950
Wire Wire Line
	7150 1850 7400 1850
Wire Wire Line
	7400 1850 7400 1050
Wire Wire Line
	7400 1050 4950 1050
Wire Wire Line
	4950 1050 4950 2150
Wire Wire Line
	4950 2150 4350 2150
Wire Wire Line
	4350 3450 5250 3450
Wire Wire Line
	5250 3450 5250 2300
Wire Wire Line
	5250 2300 6000 2300
Wire Wire Line
	6000 2300 6000 1850
Wire Wire Line
	6000 1850 6150 1850
NoConn ~ 7150 2050
NoConn ~ 6150 1950
NoConn ~ 6150 2050
NoConn ~ 6150 2150
NoConn ~ 6150 2250
Wire Wire Line
	4350 3550 5700 3550
Connection ~ 5100 3550
Text GLabel 5100 3950 3    60   Input ~ 0
GND
Wire Wire Line
	5100 3850 5100 3950
Wire Wire Line
	6050 2950 4500 2950
Wire Wire Line
	4500 2950 4500 3000
Wire Wire Line
	4500 3000 4350 3000
Wire Wire Line
	4350 2900 6050 2900
Wire Wire Line
	6050 2900 6050 2850
NoConn ~ 4350 1650
NoConn ~ 4350 1750
NoConn ~ 4350 2250
NoConn ~ 4350 2350
NoConn ~ 4350 2500
NoConn ~ 4350 2600
NoConn ~ 4350 2700
NoConn ~ 4350 2800
NoConn ~ 4350 3250
NoConn ~ 4350 3350
NoConn ~ 4350 3650
NoConn ~ 4350 3750
NoConn ~ 4350 3850
NoConn ~ 4350 3950
$EndSCHEMATC
