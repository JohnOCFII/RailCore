; Filamentsensor.g - called from config.g or GCODE files directly to configure filament sensor
; Using this mechanism as sensor results are too variable to just set it once - too many false triggers
; osh - 22 October 2020



M591 D0 P7 C"connlcd.encb" S0 R50:1500 L1.2 E5 A1 	; Pulse-type filament monitor
;                                                   ; sensitivity 1.20mm/pulse, allowed movement 50% to 1500%, 
;                                                   ; check every 5.0mm, S1 is enabled, S0 is disabled
;
; Calibration: I would recommend setting it to S0 first, doing a test print and entering M591 D0 to get the 
; actually measured sensitivity from the console