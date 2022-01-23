; resume.g
; called before a print from SD card is resumed
; 8 January 2020 - osh
;
G1 R1 Z5 F4000       ; go to 5mm above position of the last print move
G1 R1                ; Lower nozzle to last print move
M83                  ; relative extruder moves
G1 E2 F2500         ; extrude 10mm of filament

