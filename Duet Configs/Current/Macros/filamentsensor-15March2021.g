; Filamentsensor.g - called from config.g or GCODE files directly to configure filament sensor
; Using this mechanism as sensor results are too variable to just set it once - too many false triggers
; osh - 17 March 2021

M591 D0 P7 C"^e1stop" S1 R40:700 L1.90 E6 A1               ; Pulse-type filament monitor - (changed sensor w/ST 2/19 - enabled 3/17)
; M591 D0 P7 C"^e1stop" S0 R30:900 L1.71 E6 A1              ; Pulse-type filament monitor - (changed encoder wheel 11/29)
; M591 D0 P7 C"^connlcd.encb" S0 R30:1500 L1.2.0 E10 A1 	; Pulse-type filament monitor - (activated pullup 10/25)
;                                                   ; sensitivity 1.20mm/pulse, allowed movement 50% to 1500%, 
;                                                   ; check every 5.0mm, S1 is enabled, S0 is disabled
;
; Calibration: I would recommend setting it to S0 first, doing a test print and entering M591 D0 to get the 
; actually measured sensitivity from the console
