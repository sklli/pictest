EESchema Schematic File Version 1
LIBS:1dmf,JDM2,frames,pinhead,rcl,supply1,supply2
EELAYER 23 0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "jdmdmf_programmer_low_voltage.sch"
Date "22 JUL 2016"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 131200 -62600 0 2240 ~
DTR    20     4     2
Text Notes 131200 -65800 0 2240 ~
TX      2     3     1
Text Notes 131200 -53000 0 2240 ~
CTS     5     8     5
Text Notes 131200 -59400 0 2240 ~
GND     7     5     3
Text Notes 131200 -56200 0 2240 ~
RTS     4     7     4
Text Notes 131200 -69000 0 2240 ~
       25     9     H

$Comp
L CPOL-EUE2.5-5 C1
U 1 1 57920283
P 19200 16200
F 0 "C1" H 17760 -16808 2240 0000 L B
F 1 "100uF" H 20640 -11592 2240 0000 R T
F 0 "+" V 19936 -16712 1600 0000 L B
F 2 "E2,5-5" V 19200 -16200 70 0000 L T
	1    19200 -16200
	1    0    0    -1  
$EndComp

$Comp
L CPOL-EUE2.5-5 C2
U 1 1 57920283
P 35200 16200
F 0 "C2" H 33760 -16808 2240 0000 L B
F 1 "22uF" H 36640 -11592 2240 0000 R T
F 0 "+" V 35936 -16712 1600 0000 L B
F 2 "E2,5-5" V 35200 -16200 70 0000 L T
	1    35200 -16200
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-5 D1
U 1 1 57920283
P 3200 14600
F 0 "D1" V 2592 -17800 2240 0000 L B
F 2 "DO35-5" V 3200 -14600 70 0000 L T
	1    3200 -14600
	1    0    0    -1  
$EndComp

$Comp
L Z-DIODEZ5 D2
U 1 1 57920283
P 27200 27400
F 0 "D2" H 29440 -25000 2240 0000 R T
F 1 "Z=5.1V" H 29440 -31720 2240 0000 R T
F 2 "DO35Z5" V 27200 -27400 70 0000 L T
	1    27200 -27400
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-2.54 D4
U 1 1 57920283
P 59200 27400
F 0 "D4" H 57600 -30408 2240 0000 L B
F 2 "DO35-2_54" V 59200 -27400 70 0000 L T
	1    59200 -27400
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-15 D5
U 1 1 57920283
P 67200 14600
F 0 "D5" V 70208 -16200 2240 0000 R T
F 2 "DO34-15" V 67200 -14600 70 0000 L T
	1    67200 -14600
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-5 D6
U 1 1 57920283
P 11200 53000
F 0 "D6" H 14112 -56328 2240 0000 L B
F 2 "DO35-5" V 11200 -53000 70 0000 L T
	1    11200 -53000
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-5 D7
U 1 1 57920283
P 19200 81800
F 0 "D7" H 12800 -84392 2240 0000 R T
F 2 "DO35-5" V 19200 -81800 70 0000 L T
	1    19200 -81800
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-2.54A D8
U 1 1 57920283
P 51200 24200
F 0 "D8" H 54400 -24200 2240 0000 L B
F 2 "DO35-2_54A" V 51200 -24200 70 0000 L T
	1    51200 -24200
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-2.54A D9
U 1 1 57920283
P 51200 17800
F 0 "D9" H 54400 -17800 2240 0000 L B
F 2 "DO35-2_54A" V 51200 -17800 70 0000 L T
	1    51200 -17800
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-2.54A D10
U 1 1 57920283
P 51200 11400
F 0 "D10" H 54400 -11400 2240 0000 L B
F 2 "DO35-2_54A" V 51200 -11400 70 0000 L T
	1    51200 -11400
	1    0    0    -1  
$EndComp

$Comp
L 1N4148-2.54A D11
U 1 1 57920283
P 51200 5000
F 0 "D11" H 54400 -5000 2240 0000 L B
F 2 "DO35-2_54A" V 51200 -5000 70 0000 L T
	1    51200 -5000
	1    0    0    -1  
$EndComp

$Comp
L PINHD-1X5 ICSP
U 1 1 57920283
P 54400 123400
F 0 "ICSP" V 44000 -115400 2240 0000 L B
F 2 "1X05" V 54400 -123400 70 0000 L T
	1    54400 -123400
	1    0    0    -1  
$EndComp

$Comp
L DUMMY J1
U 1 1 57920283
P 57600 91400
F 2 "DUMMY" V 57600 -91400 70 0000 L T
	1    57600 -91400
	1    0    0    -1  
$EndComp

$Comp
L LED LED1
U 1 1 57920283
P 115200 11400
F 0 "LED1" V 110720 -5640 2240 0000 L B
F 1 "Power" V 108000 -5640 2240 0000 L B
F 2 "LED5MM" V 115200 -11400 70 0000 L T
	1    115200 -11400
	1    0    0    -1  
$EndComp

$Comp
L LED LED2
U 1 1 57920283
P 99200 11400
F 0 "LED2" V 94720 -5640 2240 0000 L B
F 1 "Vpp" V 92000 -5640 2240 0000 L B
F 2 "LED5MM" V 99200 -11400 70 0000 L T
	1    99200 -11400
	1    0    0    -1  
$EndComp

$Comp
L RES-0207-10 R1
U 1 1 57920283
P 67200 81800
F 0 "R1" H 72000 -79912 2240 0000 R T
F 1 "10k" H 72000 -85960 2240 0000 R T
F 2 "0207/10" V 67200 -81800 70 0000 L T
	1    67200 -81800
	1    0    0    -1  
$EndComp

$Comp
L RES-0204-7 R2
U 1 1 57920283
P 92800 62600
F 0 "R2" H 84800 -65000 1792 0000 L B
F 1 "1.5k" H 84800 -61800 1792 0000 R T
F 2 "0204/7" V 92800 -62600 70 0000 L T
	1    92800 -62600
	1    0    0    -1  
$EndComp

$Comp
L RES-0207-10 R4
U 1 1 57920283
P 27200 94600
F 0 "R4" H 22400 -96200 2240 0000 L B
F 1 "1K" H 30400 -96200 2240 0000 L B
F 2 "0207/10" V 27200 -94600 70 0000 L T
	1    27200 -94600
	1    0    0    -1  
$EndComp

$Comp
L RES-0207-10 R5
U 1 1 57920283
P 27200 88200
F 0 "R5" H 22400 -89800 2240 0000 L B
F 1 "15K" H 30400 -89800 2240 0000 L B
F 2 "0207/10" V 27200 -88200 70 0000 L T
	1    27200 -88200
	1    0    0    -1  
$EndComp

$Comp
L RES-0207-10 R6
U 1 1 57920283
P 99200 24200
F 0 "R6" V 97312 -19400 2240 0000 L B
F 1 "4.7k" V 103360 -19400 2240 0000 L B
F 2 "0207/10" V 99200 -24200 70 0000 L T
	1    99200 -24200
	1    0    0    -1  
$EndComp

$Comp
L RES-0207-10 R7
U 1 1 57920283
P 115200 24200
F 0 "R7" V 113312 -19400 2240 0000 L B
F 1 "1k" V 119360 -19400 2240 0000 L B
F 2 "0207/10" V 115200 -24200 70 0000 L T
	1    115200 -24200
	1    0    0    -1  
$EndComp

$Comp
L PINHD-1X5 RS232
U 1 1 57920283
P 118400 59400
F 0 "RS232" H 110400 -69800 2240 0000 L B
F 2 "1X05" V 118400 -59400 70 0000 L T
	1    118400 -59400
	1    0    0    -1  
$EndComp

$Comp
L BC547 T1
U 1 1 57920283
P 16000 40200
F 0 "T1" V 14400 -35400 2240 0000 R T
F 1 "BC547" V 24000 -41800 2240 0000 R T
F 2 "TO92-CBE" V 16000 -40200 70 0000 L T
	1    16000 -40200
	1    0    0    -1  
$EndComp

$Comp
L BC547 T2
U 1 1 57920283
P 80000 81800
F 0 "T2" V 78400 -86600 2240 0000 R T
F 1 "BC547" V 88000 -86600 2240 0000 R T
F 2 "TO92-CBE" V 80000 -81800 70 0000 L T
	1    80000 -81800
	1    0    0    -1  
$EndComp

$Comp
L 2N7000 T3
U 1 1 57920283
P 48000 56200
F 0 "2N7000" H 33600 -56200 2240 0000 L B
F 1 "T3" H 33600 -59400 2240 0000 L B
F 2 "TO92" V 48000 -56200 70 0000 L T
	1    48000 -56200
	1    0    0    -1  
$EndComp

$Comp
L SPDT U$1
U 1 1 57920283
P 38400 101000
F 0 "U$1" H 40800 -109000 2240 0000 L B
F 1 "SPDT" H 35200 -105800 2240 0000 L B
F 2 "SPDT" V 38400 -101000 70 0000 L T
	1    38400 -101000
	1    0    0    -1  
$EndComp

Wire Wire Line
24000 -27400 19200 -27400
Wire Wire Line
19200 -27400 19200 -33800
Wire Wire Line
19200 -27400 19200 -19400
Connection ~ 19200 -27400
Wire Wire Line
57600 -120200 57600 -93000
Text Label 57600 -108200 1 1792 ~
CLK
Wire Wire Line
86400 -62600 83200 -62600
Wire Wire Line
83200 -75400 83200 -62600
Wire Wire Line
83200 -62600 83200 -53000
Wire Wire Line
83200 -53000 115200 -53000
Connection ~ 83200 -62600
Text Label 102400 -53000 0 1792 ~
CTS
Wire Wire Line
83200 -88200 83200 -97800
Wire Wire Line
83200 -97800 60800 -97800
Wire Wire Line
60800 -97800 60800 -120200
Text Label 60800 -108200 1 1792 ~
DATA
Wire Wire Line
99200 -62600 115200 -62600
Text Label 102400 -62600 0 1792 ~
DTR
Wire Wire Line
54400 -97800 54400 -120200
Wire Wire Line
44800 -97800 54400 -97800
Text Label 54400 -108200 1 1792 ~
MCLR
Wire Wire Line
76800 -81800 73600 -81800
Wire Wire Line
115200 -17800 115200 -14600
Wire Wire Line
99200 -14600 99200 -17800
Wire Wire Line
33600 -94600 32000 -94600
Wire Wire Line
19200 -85000 19200 -88200
Wire Wire Line
20800 -94600 19200 -94600
Wire Wire Line
19200 -94600 19200 -88200
Wire Wire Line
19200 -88200 20800 -88200
Connection ~ 19200 -88200
Wire Wire Line
115200 -56200 67200 -56200
Wire Wire Line
67200 -27400 67200 -56200
Wire Wire Line
67200 -56200 57600 -56200
Wire Wire Line
67200 -17800 67200 -27400
Wire Wire Line
67200 -27400 62400 -27400
Wire Wire Line
57600 -89800 57600 -56200
Connection ~ 67200 -56200
Connection ~ 67200 -27400
Text Label 102400 -56200 0 1792 ~
RTS
Wire Wire Line
35200 -27400 30400 -27400
Wire Wire Line
51200 -27400 35200 -27400
Wire Wire Line
35200 -27400 35200 -19400
Wire Wire Line
51200 -27400 51200 -49800
Wire Wire Line
35200 -33800 35200 -27400
Wire Wire Line
56000 -27400 51200 -27400
Connection ~ 35200 -27400
Connection ~ 35200 -27400
Connection ~ 51200 -27400
Wire Wire Line
99200 -59400 115200 -59400
Text Label 102400 -59400 0 1792 ~
SGND
Wire Wire Line
115200 -37000 115200 -30600
Wire Wire Line
3200 -53000 3200 -65800
Wire Wire Line
3200 -65800 115200 -65800
Wire Wire Line
3200 -17800 3200 -40200
Wire Wire Line
8000 -53000 3200 -53000
Wire Wire Line
3200 -53000 3200 -40200
Wire Wire Line
3200 -40200 12800 -40200
Connection ~ 3200 -53000
Connection ~ 3200 -53000
Connection ~ 3200 -40200
Text Label 102400 -65800 0 1792 ~
TXD
Wire Wire Line
60800 -81800 51200 -81800
Wire Wire Line
51200 -81800 51200 -62600
Wire Wire Line
51200 -81800 51200 -120200
Connection ~ 51200 -81800
Connection ~ 51200 -81800
Text Label 51200 -108200 1 1792 ~
VDD
Wire Wire Line
14400 -53000 19200 -53000
Wire Wire Line
19200 -75400 19200 -53000
Wire Wire Line
19200 -46600 19200 -53000
Wire Wire Line
41600 -53000 19200 -53000
Wire Wire Line
19200 -75400 19200 -78600
Wire Wire Line
19200 -75400 3200 -75400
Wire Wire Line
3200 -75400 3200 -101000
Wire Wire Line
3200 -101000 32000 -101000
Wire Wire Line
3200 -101000 3200 -104200
Connection ~ 19200 -53000
Connection ~ 19200 -53000
Connection ~ 19200 -53000
Connection ~ 19200 -75400
Connection ~ 19200 -53000
Connection ~ 19200 -53000
Connection ~ 3200 -101000
Connection ~ 19200 -53000
Wire Wire Line
99200 -33800 99200 -30600
Wire Wire Line
35200 -88200 33600 -88200
Wire Wire Line
19200 -9800 19200 -1800
Wire Wire Line
67200 -1800 67200 -11400
Wire Wire Line
35200 -9800 35200 -1800
Wire Wire Line
35200 -1800 51200 -1800
Wire Wire Line
51200 -1800 67200 -1800
Wire Wire Line
19200 -1800 35200 -1800
Wire Wire Line
3200 -11400 3200 -1800
Wire Wire Line
3200 -1800 19200 -1800
Wire Wire Line
35200 4600 35200 -1800
Connection ~ 35200 -1800
Connection ~ 19200 -1800
Connection ~ 35200 -1800
Connection ~ 51200 -1800
Wire Wire Line
48000 -120200 48000 -107400
Text Label 48000 -108200 1 1792 ~
VSS
Wire Wire Line
115200 -1800 115200 -5000
Wire Wire Line
99200 -1800 99200 -5000
$EndSCHEMATC
