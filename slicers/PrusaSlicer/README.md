**README**

The included PrusaSlicer config file creates a configuration suitable for the RailCore 300ZL/300ZLT.  Use the `File --> Import Config Bundle` menu option to import this configuration.  You will likely need to rename and save the imported configuration files in the Printer, Filament, and Print Settings areas.

I recommend using the `Expert` setting, which is available in the upper-right corner of the PrusaSlicer window.  The `Simple` and `Advanced` options hide some settings.  

- I use a Bondtech BMG extruder and an E3D-v6 hot-end with E3D Nozzle X coated, hardened steel nozzle.  If you use a brass nozzle, you may wish to lower filament temperatures by 5-10C.
- Included Railcore Bed texture and image courtesy of @veng1
  * Unzip `RCBedandTexture.zip`
  * Navigate to `Printer Settings` --> `General` --> `Bed Shape - Set...`
    * In the texture area click `Load...` -- chose the file `Overlay_no_numbers.svg`
    * In the Model area click `Load...` -- choose the file `railcore.stl`
    * Select `OK`
  * Re-save the modified `Railcore 300ZL` Printer Settings

- There is a conditional in the filament config that adds a Pressure Advance statement `M572 D0 S0.07` to the GCODE if the configuration is used on a RAILCORE as seen by the printer definition.

# Notes for PrusaSlicer configuration updated November 16, 2022

* Generated with PrusaSlicer v2.5.0
* Included Updated Support settings
* Updated Start GCODE that sends configuration varibles to Klipper firmware
* Minor tweaks to speed and cooling settings in some profiles

# Notes for PrusaSlicer configuration updated June 5, 2021

* Generated with PrusaSlicer v2.3.1+
* Added additional nozzle profiles for 0.6mm users
* Enabled 'Verbose G-code" and "Label objects" accross all profiles to aid "Cancel Object" functionality

# Notes for PrusaSlicer configuration updated May 20, 2021

* Generated with PrusaSlicer v2.3.1+
* Eliminated 2-stage hot-end heatup as I realized this was no long necessary after switching to BLTouch Z sensor
* Added `;LAYER:[layer_num]` comment in custom config layer change as RepRap firmware 3.3 and DWC 3.3 will no longer populate the layer chart without it
*  Various small changes throughout configs - Highlighted changed include:
  * Changed bottom and top infill layers from rectilinear to monotonic
  * Travel speed increased from 150 to 250 mm/sec in more profiles
  * Various similar changes in other (but not all) print profiles - as always, tweak as desired

# Notes for PrusaSlicer configuration updated October 12, 2020

* Generated with PrusaSlicer v2.2.0+
* Included Railcore Bed texture and image courtesy of @veng1
  * Unzip `RCBedandTexture.zip`
  * Navigate to `Printer Settings` --> `General` --> `Bed Shape - Set...`
    * In the texture area click `Load...` -- chose the file `Overlay_no_numbers.svg`
    * In the Model area click `Load...` -- choose the file `railcore.stl`
    * Select `OK`
  * Re-save the modified `Railcore 300ZL` Printer Settings
* Tramming is performed two times (down from three) and a Home Z is performed after tramming
* Bed shape increased from 290x290 to 298x298
* Maximum print height reduced from 340 to 320 (revise as needed for your machine)
* Tweaked retraction settings (mainly increased from 0.6 to 0.8)
* Reduced retraction speed from 60 to 45 mm/sec
* Various small changes throughout configs - Highlighted changed include:
  * Changed bottom layers from 4 to 3 in 0.20mm Normal 300ZL profile
  * Perimeter speed increased from 80 to 100 mm/sec
  * Travel speed increased from 150 to 250 mm/sec
  * Various similar changes in other (but not all) print profiles - as always, tweak as desired
* Various changes to filament profiles - also take note that as of PrusaSlicer 2.2 there are filament override settings available for many machine settings

# Notes for PrusaSlicer configuration updated December 24, 2019

* Generated with PrusaSlicer v2.1.1+
* Minor changes to support settings (only in 0.20 profiles, as I recall)


# Notes for PrusaSlicer configuration updated July 5, 2019

* Changed comments on GitHub to refer to PrusaSlicer
* Generated with PrusaSlicer v2.0.0
* Calls True Bed Leveling (G32) 3 times instead of twice
* Increased first stage heatup from 130C to 150C
* Tweaked fan settings
* Other minor changes


# Notes for Slic3r PE config updated March 24, 2019

* Generated with Slic3r PE Beta 1
* Retraction settings tuned for better seams
* Extrusion Multiplier changed from .88 to .92
* Max parts cooling fan speed lowered from 85% to 50%
* Bed moves down 20mm instead of 10mm before final warm-up in start G-code
* Switched to using relative E-distances
