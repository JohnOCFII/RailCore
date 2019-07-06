# RailCore 300ZL DuetEthernet configuration files

*This directory contains the key DuetEthernet configuration files*

Update Notes - July 5th 2019
- Created an Archive directory and populated with my older Duet RRF configs files.  Files with dates previous to July 2019 were used with my RailCore 300ZL with printed Y-carraige and Precision Piezo Orion sensor using the Emma Puggle mount.
- Uploaded current configuration files which have been modified for use with aluminum Y-carriage and BLTouch sensor.  I also switched to an LDO extruder stepper motor with these configs.  Tbe sensor changes required different probing positions and different probe logic.  Some other minor changes as well.  The July 5th files were used with Duet RRF firmware 2.03.
- Please *review files carefully* before using in your environment.  I've got non-standard commands for activating lights, etc.  It is likely your G31 will not be the same as mine.  Please find your own Z-height following the standard RailCore Assembly and Commissioning document.
