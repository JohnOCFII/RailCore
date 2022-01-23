; File     : bltouch-bed.g - for RRF 3
; Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
; Use-case : The BL-touch is affected by magnets. This 4 point bed.g was originally created by Robert Hendricks to probe points 
;          : in the nulls in the magnetic field.
;Edited by : osh - 1 September 2020

M561 						; clear any existing bed transform


; 4 Point Probe - osh			    ; define 4 points in a clockwise direction around the bed, starting near (0,0)
; G30 P0 X45.0 Y46.0 Z-99999 		; X 45-2 and Y 46-42 	 jog head to: 	X43 Y4
; G30 P1 X45.0 Y254.0 Z-99999		; X 45-2 and Y 254-42 					X43 Y212
; G30 P2 X282.0 Y254.0 Z-99999	    ; X 282-2 and Y 254-42					X280 Y212
; G30 P3 X282.0 Y46.0 Z-99999 S3	; X 282-2 and Y 46-42					X280 Y4

; 4 Point Probe - osh			    ; define 4 points in a clockwise direction around the bed, starting near (0,0)
G30 P0 X41.0 Y79.0 Z-99999 			; X 41+4 and Y 79-36 	 jog head to: 	X45 Y43
G30 P1 X41.0 Y263.0 Z-99999		    ; X 41+4 and Y 299-36 					X45 Y263
G30 P2 X280.0 Y263.0 Z-99999	    ; X 280+4 and Y 299-36					X284 Y263
G30 P3 X280.0 Y79.0 Z-99999 S3	    ; X 280+4 and Y 79-36					X284 Y43

; 3 Point Probe
; G30 P0 X15 Y45 Z-99999		       ; probe near a leadscrew
; G30 P1 X15 Y255 Z-99999		       ; probe near a leadscrew
; G30 P2 X285 Y150 Z-99999 S3        ; probe near a leadscrew and calibrate 3 motors

G1 X5 Y5 F4000            	       ; move the head to the corner (optional)

;
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)

; G29 S1; perform mesh bed leveling (or, with S1 load from heightmap.csv)
; G29   ; perform mesh bed leveling (or, with S1 load from heightmap.csv)