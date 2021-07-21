# RailCore 300ZL DuetEthernet RRF configuration files

*This directory tree contains the key DuetEthernet configuration files*

**Update Notes - July 21 2021**
- Reorganized folder structure.  This hierarchy contains RRF configurations.  Minor configuration tweaks completed in May 2021.

**Update Notes - January 18 2020**
- Reorganized folder structure.  Separate older versions are listed under the `Archive` directory tree.
- Uploaded my initial RepRap Firmware 3.0 configuration and macro files under the `Current` directory tree.
- All file names have a `-<something>` on the file name.  That usually indicates date of last change.  Please rename the files to remove that `-<something>` before using.
- As always, please review carefully!  My RailCore 300ZL is a self-sourced machine.  It is currently configured with:
  * `TR8*4 leadscrews`
  * `Duet 2 Ethernet (not WiFi) and Duex5`
  * `Keenevo bed thermistor is connected and active`
  * `E3D-V6 hot-end and Bondtech BMG with LDO 0.9 pancake stepper motors`
  * `SteppersOnline 0.9 stepper motors for X, Y, and Z`
  * `Two separately controlled 12V LED light strips`
  * `Sunhokey basic filament sensor`


**Update Notes - August 12th 2019**
- Uploaded current configuration files which have been modified with different settings for motor current, acceleration, and jerk The August 12th files were used with Duet RRF firmware 2.03.
- Please *review files carefully* before using in your environment.  I've got non-standard commands for activating lights, etc.  It is likely your G31 will not be the same as mine.  Please find your own Z-height following the standard RailCore Assembly and Commissioning document.

**Update Notes - July 5th 2019**
- Archive directory is populated with my older Duet RRF configs files.  Files with dates previous to July 2019 were used with my RailCore 300ZL with printed Y-carraige and Precision Piezo Orion sensor using the Emma Puggle mount.
- Uploaded current configuration files which have been modified for use with aluminum Y-carriage and BLTouch sensor.  I also switched to an LDO extruder stepper motor with these configs.  Tbe sensor changes required different probing positions and different probe logic.  Some other minor changes as well.  The July 5th files were used with Duet RRF firmware 2.03.
- Please *review files carefully* before using in your environment.  I've got non-standard commands for activating lights, etc.  It is likely your G31 will not be the same as mine.  Please find your own Z-height following the standard RailCore Assembly and Commissioning document.

