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
LIBS:window-contact-rfm69-cache
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
P 2100 5150
F 0 "C1" H 2125 5250 50  0000 L CNN
F 1 "100nf" H 2125 5050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2138 5000 50  0001 C CNN
F 3 "" H 2100 5150 50  0000 C CNN
	1    2100 5150
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5B01665D
P 5100 3700
F 0 "R2" V 5180 3700 50  0000 C CNN
F 1 "10M" V 5100 3700 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5030 3700 50  0001 C CNN
F 3 "" H 5100 3700 50  0000 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5B0166FD
P 4700 5900
F 0 "R1" V 4780 5900 50  0000 C CNN
F 1 "10k" V 4700 5900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4630 5900 50  0001 C CNN
F 3 "" H 4700 5900 50  0000 C CNN
	1    4700 5900
	0    1    1    0   
$EndComp
Text GLabel 1900 1500 2    60   Input ~ 0
GND
Text GLabel 1900 1200 2    60   Input ~ 0
VCC
Text GLabel 5550 3750 0    60   Input ~ 0
VCC
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
Connection ~ 5100 3550
Text GLabel 5100 3950 3    60   Input ~ 0
GND
Wire Wire Line
	5100 3850 5100 3950
$Comp
L CP C2
U 1 1 5B018A0C
P 1650 1350
F 0 "C2" H 1675 1450 50  0000 L CNN
F 1 "10uF" H 1675 1250 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_4x5.8" H 1688 1200 50  0001 C CNN
F 3 "" H 1650 1350 50  0000 C CNN
	1    1650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1500 1900 1500
Connection ~ 1650 1500
Wire Wire Line
	1050 1200 1900 1200
Connection ~ 1650 1200
$Comp
L ATMEGA328P-A IC1
U 1 1 5B0ACB62
P 3200 5550
F 0 "IC1" H 2450 6800 50  0000 L BNN
F 1 "ATMEGA328P-A" H 3600 4150 50  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 3200 5550 50  0000 C CIN
F 3 "" H 3200 5550 50  0000 C CNN
	1    3200 5550
	1    0    0    -1  
$EndComp
Text GLabel 1750 4500 0    60   Input ~ 0
VCC
NoConn ~ 2300 5050
$Comp
L C C3
U 1 1 5B13F6B2
P 2000 4650
F 0 "C3" H 2025 4750 50  0000 L CNN
F 1 "100nf" H 2025 4550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2038 4500 50  0001 C CNN
F 3 "" H 2000 4650 50  0000 C CNN
	1    2000 4650
	1    0    0    -1  
$EndComp
Text GLabel 1800 5000 0    60   Input ~ 0
VCC
Wire Wire Line
	1750 4500 2300 4500
Wire Wire Line
	2300 4450 2300 4550
Connection ~ 2000 4500
Connection ~ 2300 4500
Wire Wire Line
	2000 4800 2000 6900
Wire Wire Line
	2000 6650 2300 6650
Wire Wire Line
	2000 6750 2300 6750
Connection ~ 2000 6650
Text GLabel 2000 6900 3    60   Input ~ 0
GND
Connection ~ 2000 6750
Wire Wire Line
	2300 5000 2300 4750
Wire Wire Line
	1800 5000 2300 5000
Connection ~ 2100 5000
Wire Wire Line
	2100 5300 2100 6550
Wire Wire Line
	2100 6550 2300 6550
Text GLabel 2200 6900 3    60   Input ~ 0
GND
Wire Wire Line
	2200 6900 2200 6550
Connection ~ 2200 6550
NoConn ~ 2300 5800
NoConn ~ 2300 5900
$Comp
L R R5
U 1 1 5B140033
P 8800 5000
F 0 "R5" V 8880 5000 50  0000 C CNN
F 1 "1k" V 8800 5000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8730 5000 50  0001 C CNN
F 3 "" H 8800 5000 50  0000 C CNN
	1    8800 5000
	0    1    1    0   
$EndComp
$Comp
L RFM69 RF1
U 1 1 5B1401F8
P 7600 5100
F 0 "RF1" H 7900 5650 60  0000 C CNN
F 1 "RFM69" H 7550 5650 60  0000 C CNN
F 2 "rfm69:RFM96" V 7750 5150 60  0001 C CNN
F 3 "" V 7750 5150 60  0000 C CNN
	1    7600 5100
	1    0    0    -1  
$EndComp
Text GLabel 5100 5900 2    60   Input ~ 0
VCC
Wire Wire Line
	5100 5900 4850 5900
Wire Wire Line
	4550 5900 4200 5900
Wire Wire Line
	5700 3550 5100 3550
Text GLabel 8600 5300 2    60   Input ~ 0
VCC
Text GLabel 8950 5200 2    60   Input ~ 0
GND
Text GLabel 7000 5400 3    60   Input ~ 0
GND
Wire Wire Line
	8600 5300 8200 5300
Wire Wire Line
	7200 5400 7000 5400
Wire Wire Line
	8200 5200 8950 5200
$Comp
L CONN_01X01 P2
U 1 1 5B140A1B
P 8600 5600
F 0 "P2" H 8600 5700 50  0000 C CNN
F 1 "AN" V 8700 5600 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 8600 5600 50  0001 C CNN
F 3 "" H 8600 5600 50  0000 C CNN
	1    8600 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	8600 5400 8200 5400
NoConn ~ 8200 5100
NoConn ~ 7200 5300
NoConn ~ 7200 5200
NoConn ~ 7200 5100
$Comp
L R R4
U 1 1 5B140CDD
P 8500 4900
F 0 "R4" V 8580 4900 50  0000 C CNN
F 1 "1k" V 8500 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8430 4900 50  0001 C CNN
F 3 "" H 8500 4900 50  0000 C CNN
	1    8500 4900
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B140D43
P 6900 4800
F 0 "R3" V 6980 4800 50  0000 C CNN
F 1 "1k" V 6900 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6830 4800 50  0001 C CNN
F 3 "" H 6900 4800 50  0000 C CNN
	1    6900 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4800 7200 4800
Wire Wire Line
	8200 4900 8350 4900
Wire Wire Line
	8200 5000 8650 5000
Wire Bus Line
	4400 4550 6800 4550
Wire Bus Line
	6800 4550 6800 4350
Wire Bus Line
	6800 4350 8300 4350
Wire Bus Line
	8300 4350 8300 4400
Entry Wire Line
	4400 4450 4500 4550
Entry Wire Line
	4500 4450 4600 4550
Entry Wire Line
	4650 4450 4750 4550
Entry Wire Line
	4800 4450 4900 4550
Wire Wire Line
	4400 4450 4400 4650
Wire Wire Line
	4400 4650 4200 4650
Wire Wire Line
	4500 4450 4500 4750
Wire Wire Line
	4500 4750 4200 4750
Wire Wire Line
	4650 4450 4650 4850
Wire Wire Line
	4650 4850 4200 4850
Wire Wire Line
	4800 4450 4800 4950
Wire Wire Line
	4800 4950 4200 4950
Text Label 4450 4950 0    60   ~ 0
SCK
Text Label 4350 4850 0    60   ~ 0
MISO
Text Label 4250 4750 0    60   ~ 0
MOSI
Text Label 4250 4650 0    60   ~ 0
SS
Entry Wire Line
	8300 4350 8400 4450
Entry Wire Line
	8250 4350 8350 4450
Entry Wire Line
	8100 4350 8200 4450
Entry Wire Line
	8200 4350 8300 4450
Wire Wire Line
	6750 4800 6750 4650
Wire Wire Line
	6750 4650 7300 4650
Wire Wire Line
	7300 4650 7300 4450
Wire Wire Line
	7300 4450 8200 4450
Text Label 7500 4450 0    60   ~ 0
MISO
Wire Wire Line
	7200 4900 5800 4900
Wire Wire Line
	5800 4900 5800 6300
Wire Wire Line
	5800 6300 4200 6300
Wire Wire Line
	4200 6300 4200 6250
Wire Wire Line
	8300 4450 8300 4800
Wire Wire Line
	8300 4800 8200 4800
Text Label 8200 4800 0    60   ~ 0
SS
Wire Wire Line
	8350 4450 8350 4800
Wire Wire Line
	8350 4800 8650 4800
Wire Wire Line
	8650 4800 8650 4900
Wire Wire Line
	8400 4450 8950 4450
Wire Wire Line
	8950 4450 8950 5000
Text Label 8500 4800 0    60   ~ 0
SCK
Text Label 8950 4900 0    60   ~ 0
MOSI
$EndSCHEMATC
