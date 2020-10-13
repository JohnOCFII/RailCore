**README**

The included PrusaSlicer config file creates a configuration suitable for the RailCore 300ZL/300ZLT.  Use the `File --> Import Config Bundle` menu option to import this configuration.  You will likely need to rename and save the imported configuration files in the Printer, Filament, and Print Settings areas.

The profile has two things to note:

- The start GCODE includes a two-stage startup.  

  - The bed is heated to requested temp, and the hot-end is heated to 150C.  This is below the temperature where many filaments will drip, which can cause issues in bed probing with certain probes such as the Precision Piezo Orion. Once the hot-end reaches 150C, check to see if there is any filament hanging from the hot-end from previous prints, and pull it off with a tweezers or similar device before the Home-all is executed.
  - A `G28` is called to perform a Home-all
  - After the Home-all, `G32` is called twice to perform the Z-leveling (Bed tramming)
  - After the two passes of tramming, a `G28 Z` to home Z is executed
  - After the Z-leveling, the hot-end is heated up to the requested hot-end temperature.  Once heating is completed, a purge line is printed, and the actual print begins.

- There is a conditional in the filament config that adds a Pressure Advance statement `M572 D0 S0.07` to the GCODE if the configuration is used on a RAILCORE as seen by the printer definition.

# Notes for PrusaSlicer configuration updated October 12, 2020

* Generated with PrusaSlicer v2.2.0+
* Tramming is performed two times (down from three) and a Home Z is performed after tramming
* Various small changes throughout configs - Highlighted changed include:
* * Changed bottom layers from 4 to 3 in 0.20mm Normal 300ZL profile
* Now what?

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
