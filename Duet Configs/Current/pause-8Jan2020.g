; pause.g
; called when a print from SD card is paused
; 8 January 2020 - osh
;
M83            ; relative extruder moves
G1 E-2 F2500   ; retract 2 mm of filament
G91            ; relative positioning
G1 Z15 F360    ; lift Z by 15mm
G90            ; absolute positioning
G1 X5 Y5 F4000 ; move head out of the way of the print

