; ***
; findZprobeoffset.g
; 21 July 2021 - osh
; ***
M291 P"Probe will be tested 10 times and return mean and standard deviation. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
G28
M400
M401
G1 X150 Y150 Z12   ; travel to X,Y of probe point 12mm above bed
G30 P0 X150 Y150 Z-9999
G30 P1 X150 Y150 Z-9999
G30 P2 X150 Y150 Z-9999
G30 P3 X150 Y150 Z-9999
G30 P4 X150 Y150 Z-9999
G30 P5 X150 Y150 Z-9999
G30 P6 X150 Y150 Z-9999
G30 P7 X150 Y150 Z-9999
G30 P8 X150 Y150 Z-9999
G30 P9 X150 Y150 Z-9999 S-1
M402