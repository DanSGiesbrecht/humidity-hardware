EESchema Schematic File Version 4
LIBS:humidity-sensor-cache
EELAYER 30 0
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
L MCU_ST_STM32L0:STM32L051C8Tx U1
U 1 1 5DAE1BEB
P 5750 3750
F 0 "U1" H 6200 5300 50  0000 C CNN
F 1 "STM32L051C8Tx" H 5250 5300 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5250 2250 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00108219.pdf" H 5750 3750 50  0001 C CNN
	1    5750 3750
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Humidity:SHTC3 U2
U 1 1 5DC74C1D
P 1850 5000
F 0 "U2" H 2094 5046 50  0000 L CNN
F 1 "SHTC3" H 2094 4955 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 2050 4650 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC3_Datasheet.pdf" H 1550 5450 50  0001 C CNN
	1    1850 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:Antenna AE1
U 1 1 5DC8AD3A
P 9800 2600
F 0 "AE1" H 9880 2589 50  0000 L CNN
F 1 "Antenna" H 9880 2498 50  0000 L CNN
F 2 "" H 9800 2600 50  0001 C CNN
F 3 "~" H 9800 2600 50  0001 C CNN
	1    9800 2600
	1    0    0    -1  
$EndComp
$Comp
L RF:SYN115 U3
U 1 1 5DCCC523
P 8600 3100
F 0 "U3" H 8200 3450 50  0000 L CNN
F 1 "SYN115" H 8750 3450 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 8600 2750 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/1910111742_Synoxo-F115_C105184.pdf" H 8600 3450 50  0001 C CNN
	1    8600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3100 9800 3100
Wire Wire Line
	9800 3100 9800 2800
$EndSCHEMATC
