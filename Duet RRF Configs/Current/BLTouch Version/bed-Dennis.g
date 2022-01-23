; ***********************************************************
; bed4point.g
; ***********************************************************
; probe is -16.4 in X -29.4 in Y bed is 290 in X 325 in Y
; adjust coords so that probe hits symmetric points on bed and avoids dock
; echo move.axes[2].machinePosition
; echo "Running bed4point.g"
M558 F90 A3                              ; fix probe speed to 1mm/s
G90
; echo sensors.probes[0].value[0]
G4 S1

G30 P0 X18.0 Y65.0 F9000.0 Z-99999       ; probe front left PEI
; G30 P0 X0.0 Y45.0 F9000.0 Z-99999      ; probe front left full glass
; echo sensors.probes[0].value[0]
; echo move.axes[2].machinePosition

G30 P1 X18.0 Y285.0 F9000.0 Z-99999      ; probe back left PEI
;G30 P1 X0.0 Y285.0 F9000.0 Z-99999      ; probe back left full Glass
; echo sensors.probes[0].value[0]
; echo move.axes[2].machinePosition

G30 P2 X270.0 Y285.0 F9000.0 Z-99999     ; probe back right PEI
; G30 P2 X270.0 Y285.0 F9000.0 Z-99999   ; probe back right full glass
; echo sensors.probes[0].value[0]
; echo move.axes[2].machinePosition

G30 P3 X270.0 Y65.0 F9000.0 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors PEI
; G30 P3 X270.0 Y45.0 F9000.0 Z-99999 S3 ; probe near front right leadscrew and calibrate 3 motors full glass
; echo sensors.probes[0].value[0]
; echo move.axes[2].machinePosition
; echo "bed4point.g complete" 