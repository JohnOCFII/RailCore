; Configuration file for Duet WiFi  - for RRF 3
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2 on Tue Dec 25 2018 20:01:03 GMT-0600 (Central Standard Time)
; Modified 18 March 2021 - osh

; Debugging
M111 S0												; Debug (S0 is off; S1 is on)
M929 P"eventlog.txt" S1								; start logging to file eventlog.txt
M915 X Y S10 F0 R1                                  ; log motor stalls (added 5/4/2019)

; General preferences
G21													; Work in millimetres
G90                                                 ; Send absolute coordinates...
M83                                                 ; ...but relative extruder moves

M555 P2												; Set output to look like Marlin
M669 K1												; Select CoreXY kinematics (RRF 2.03 and later)

; Tools
M563 P0 D0 H1                                     	; Define tool 0
G10 P0 X0 Y0 Z0                                   	; Set tool 0 axis offsets
G10 P0 S-273 R-273									; Set tool 0 operating and standby temperatures(-273 = "off")

; Network
M550 P"RailCore"                                    ; Set machine name
M552 P0.0.0.0 S1                                    ; Enable network and acquire dynamic address via DHCP
M586 P0 S1                                          ; Enable HTTP
M586 P1 S0                                          ; Disable FTP
M586 P2 S0                                          ; Disable Telnet

; Drives
M584 X0 Y1 Z5:6:7 E3:4:8:9 							; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S1                          				; Drive 0 goes forwards  	X/Y stepper (front?)
M569 P1 S0                          				; Drive 1 goes backwards	X/Y Stepper (rear?)
M569 P2 S1                         					; Drive 2 goes forwards		Unused
M569 P3 S1                          				; Drive 3 goes forwards		Extruder (forward for LDO motor)
M569 P4 S1                          				; Drive 4 goes forwards		Extruder (unused)
M569 P5 S0											; Drive 5 goes backwards	Front Left Z
M569 P6 S0											; Drive 6 goes backwards	Rear Left Z
M569 P7 S0											; Drive 7 goes backwards	Right Z

; Leadscrew locations
M671 X-11:-11:347  Y20:274:144 S7.5  				; Front left (-11,20), Rear Left (-11,274), Right (347,144)    9/1/2020 - osh - S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

; Axis and motor configurations
M350 X16 Y16 Z16 E16 I1                             ; Configure 16x microstepping with interpolation
M906 X1200 Y1200 Z1200 E860 I30                     ; Set motor currents (mA) and motor idle factor in per cent (docs say rounds to 100, but this is where I'd like them to be)
M92 X200.0 Y200.0 Z1600.0 E836.0                    ; Set steps per mm (25 June 2019)
M566 X600 Y600 Z200 E3600             			    ; Set maximum instantaneous (jerk) speed changes (mm/min)
M201 X1750 Y1750 Z250 E1500                         ; Set accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600       			    ; Set maximum speeds (mm/min)
M84 S60												; Set motor idle timeout
M579 X1.0028 Y1.0021								; Scale X and Y axis

; Axis Limits
M208 X300 Y300 Z320                 				; set axis maxima and high homing switch positions - 9/1/2020 - osh
M208 X0 Y0 Z0 S1                    				; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed);

; Endstops
M574 X1 S1 P"xstop"   								; X min active high endstop switch
M574 Y1 S1 P"ystop"  								; Y min active high endstop switch
M574 Z0 S2 			 								; Z endstop controlled by BLTouch probe

; Z-Probe - BLTouch "Smart v3"
M950 S0 C"duex.pwm5"				   				; Define BLTouch Servo (S0) on duet pwm5
M558 P9 C"^zprobe.in" H5 F90 T6000 A3 S0.02  		; BLTouch connected to Z probe IN pin
M208 S1 Z-0.2										; set minimum Z
G31 X-4 Y36 Z1.75 H5 P25 							; Customize your offsets. (Nozzle X) FilaStruder PEI Sheet: January 29 2021
;													; Tip: A larger trigger height in G31 moves you CLOSER to the bed
; Filament Sensor Setup
; M591 D0 P1 C"connlcd.encb" S1                     ; Filament runout sensor CONN_LCD endstop - basic sensor
;
M98 P"filamentsensor.g"								; Call external file to configure filament sensor
;

; Mesh Bed Leveling area
; M557 X46.5:290.5 Y39.5:246.5 P2:2                   ; Set Default Mesh - NOTE: take probe offset into account - corners only (magnets avoided) - 9/4/2020
M557 X46.5:290.5 Y39.5:246.5 P5:4                   ; Set Default Mesh - NOTE: take probe offset into account - "full" bed (magnets avoided) - 9/4/2020
;                                     				; E.G. If probe offset is 42 on Y, then Y50:290 will take the hotend to Y08 to Y248)

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"bed_heat" T100000 B3950 R4700 H0 L0  ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed_heat" T0								; create bed heater output on bedheat and map it to sensor 0
M140 H0                                             ; Inform the firmware that bed heater 0 uses heater 0
M143 H0 S120                                      	; Set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" A"hotend_heat" T100000 B4725 R4700 C7.06e-8 H0 L0    ; configure sensor 1 as thermistor on pin e0temp (Hotend)
M950 H1 C"e0_heat" T1								;create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S288                                      	; Set temperature limit for heater 1 to 288C
M308 S2 P"duex.e6temp" Y"thermistor" A"keenovo" T100000 B3950 R4700 C7.06E-8 H0 L0 		; Secondary bed thermistor
M140 S-273 R-273                          			; Standby and initial Temp for bed as "off" (-273 = "off")
M308 S10 Y"mcu-temp" A"mcu-temp"                    ; Display Duet2 CPU temp 

;M307 H1 A408.3 C215.8 D4.6 S1.00 V24.4 B0			; Heater 1 - Hot-end - PID tuned @ 240C 1/18/2020
M307 H1 R1.823 C216.1 D6.66 S1.00 V24.4             ; Heater 1 - Hot-end - PID tuned @ 250C 1/24/2021
;M307 H0 A258.7 C744.9 D9.8 S1.00 V24.4 B0			; Heater 0 - MIC 6 Bed - PID tuned @ 65C 1/18/2020
M307 H0 R0.309 C813.7 D17.86 S1.00 V24.4            ; Heater 0 - MIC 6 Bed - PID tuned @ 65C 1/24/2021


; Fans
M950 F0 C"fan0" Q500                               	; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                     	; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                               	; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T40                                  	; set fan 1 value. Thermostatic control is turned on


; Automatic power saving
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" 	; Set voltage thresholds and actions to run on power loss

; Miscellaneous

M950 F2 C"duex.fan7"								; LED Light Bar (left?)
M950 F3 C"duex.fan8"								; LED Light Bar (right)?)
;M501                                              	; Load saved parameters from non-volatile memory
T0												   	; Select first hot-end
M98 P"/macros/LED_Ready.g"					     	; Turn on LED lights