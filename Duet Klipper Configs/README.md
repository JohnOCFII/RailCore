# RailCore 300ZL Duet2 Ethernet Klipper configuration files

*This directory tree contains the key Duet2 Ethernet configuration files for Klipper firmware*

**Update Notes - June 22 2022**
- Added “Exclude Object” section (to allow for failed print items to be excluded — details outside the stop of my config)
- Changed name of bed and Keenevo heater thermistor type from NTC 100K beta 3950 to Generic 3950
- Increased speed of homing from F4000 to F6000
- Switch Bed Mesh algorithm to bicubic 
- Increase bed mesh probe count to 9,9 from 6,6
- Add [force move] section
- Add config includes for mainsail.cfg and timelapse.cfg
- Added calculated bed lowering 50mm after print completes, unless print is too tall to allow that
- Increase speeds for Euclid probe deploy and retract
- Rename Filament Load/Unload macros
- Add MOTORS_OFF macro

**Update Notes - December 26 2021**
- Lowered stepper motor current
- Modified low-end of part-cooling fan activation setting
- Modified bed mesh to be slightly smaller (far edge of my sheets were bent -- avoiding that 10mm area)
- Added LED light controls to START_PRINT and END_PRINT macros
- Added M600 macro (untested!)

**Update Notes - August 20 2021**
- Start Macro bed heater updates of my `printer.cfg`
- 
**Update Notes - June 20 2021**
- Initial upload of my `printer.cfg` still in commissioning state
-
