; File     : bltouch-bed.g - for RRF 3
; Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
; Use-case : The BL-touch is affected by magnets. This 4 point bed.g was originally created by Robert Hendricks to probe points 
;          : in the nulls in the magnetic field.
;Edited by : osh - 19 July 2021

M561 						; clear any existing bed transform
echo "DEBUG: Call deployprobe.g macro" 
M401 P0                                         ; This runs macro file deployprobe
echo "DEBUG: returned from deployprobe.g"

; 4 Point Probe - osh			    ; define 4 points in a clockwise direction around the bed, starting near (0,0)
G30 P0 X2 Y36 Z-99999 			; X 46.5+1 and Y 39.5-35 	 jog head to: 	X50.5  Y3.5
G30 P1 X2 Y299 Z-99999		; X 46.5+1 and Y 246.5-35 					X50.5  Y210.5
G30 P2 X299 Y299 Z-99999	    ; X 290.5+1 and Y 246.5-35					X294.5 Y210.5
G30 P3 X299 Y36 Z-99999 S3	    ; X 290.5+1 and Y 39.5-35					X294.5 Y3.5

; 4 Point Probe - osh			    ; define 4 points in a clockwise direction around the bed, starting near (0,0)
;G30 P0 X46.5 Y39.5 Z-99999 			; X 46.5+4 and Y 39.5-36 	 jog head to: 	X50.5  Y3.5
;G30 P1 X46.5 Y246.5.0 Z-99999		; X 46.5+4 and Y 246.5-36 					X50.5  Y210.5
;G30 P2 X290.5 Y246.5.0 Z-99999	    ; X 290.5+4 and Y 246.5-36					X294.5 Y210.5
;G30 P3 X290.5 Y39.5 Z-99999 S3	    ; X 290.5+4 and Y 39.5-36					X294.5 Y3.5

; 3 Point Probe
; G30 P0 X15 Y45 Z-99999		       ; probe near a leadscrew
; G30 P1 X15 Y255 Z-99999		       ; probe near a leadscrew
; G30 P2 X285 Y150 Z-99999 S3        ; probe near a leadscrew and calibrate 3 motors

echo "DEBUG: Call retractprobe.g macro"
M402 P0                                         ; retract / remove probe
echo "DEBUG: Returned from retractprobe.g"

G1 X10 Y10 F4000            	       ; move the head to the corner (optional)

;
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)

; G29 S1; perform mesh bed leveling (or, with S1 load from heightmap.csv)
; G29   ; perform mesh bed leveling (or, with S1 load from heightmap.csv)