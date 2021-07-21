; ***********************************************************
; deployprobe.g
; Modified 19d July 2021 - osh
; ***********************************************************

echo "DEBUG: Running deployprobe.g"
; uncomment next line to echo the probe deploy state 
echo "deployuser token = " ^sensors.probes[0].deployedByUser

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)
G91                     ; relative positioning
echo "DEBUG: First Lift Z (8) in deployprobe.g" 
G1 H2 Z8 F4000        ; move Z 8 for clearance above dock
                       ; need to figure out some safety check on this
G90                                   ; absolute positioning

echo "Before If: Probe State = " ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
    echo "deployuser token = " ^sensors.probes[0].deployedByUser
    echo "Probe State = " ^sensors.probes[0].value[0]
    abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"
  
; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
echo "DEBUG: Pass first logic test"
G1 X5.0 Y290 F6000           ; move adjacent to probe dock location
M400                         ; wait for moves to finish
echo "DEBUG: Probe Pickup while loop running"
; uncomment next line to echo the probe deplot state 
echo "deployuser token (before while loop) = " ^sensors.probes[0].deployedByUser
while sensors.probes[0].value[0]=1000
  G1 X5 Y305.3 F3000           ;  move over dock (allow beyond range) F3000 is standard speed
  echo "Probe State = " ^sensors.probes[0].value[0]
  G1 X60 Y305.3 F1200           ;  slide probe out of dock - slowly
  M400
echo "DEBUG: Probe Pickup while loop complete"
; uncomment to echo the probe deplot state 
echo "deployuser token (after while loop) = " ^sensors.probes[0].deployedByUser

;G91                           ; relative positioning
;echo "DEBUG: Second Lift Z (10) in deployprobe.g" 
;G1 H2 Z10 F3000               ; move bed to clear probe from build surface (not needed?)

M400                          ; wait for moves to finish
M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

if sensors.probes[0].value[0]!=0
  echo "Probe Pickup while loop complete"
  ; uncomment to echo the probe deploy state 
  echo "deployuser token (in abort if section)= " ^sensors.probes[0].deployedByUser
  abort "deployprobe endvalue not 0 Probe not picked up!  Print cancelled."
  
echo "DEBUG: deployprobe.g complete"