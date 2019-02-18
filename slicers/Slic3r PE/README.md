**README**

The included Slic3r PE config file creates a configuration suitable for the RailCore 300ZL.  Use the `File --> Import Config` menu option to import this configuration.  You will likely need to rename and save the imported configuration files in the Printer, Filament, and Print Settings areas.

The profile has two things to note:

- The start GCODE includes a two-stage startup.  

  - The bed is heated to requested temp, and the hot-end is heated to 130C.  This is below the temperature where many filaments will drip, which can cause issues in bed probing with the Precision Piezo Orion. Once the hot-end reaches 130C, check to see if there is any filament hanging from the hot-end from previous prints, and pull it off with a tweezers or similar device before the Home-all is executed.
  - A `G28` is called to perform a Home-all
  - After the Home-all, `G32` is called twice to perform the Z-leveling (Bed tramming)
  - After the Z-leveling, the hot-end is heated up to the requested hot-end temperature.  Once heating is completed, a purge line is printed, and the actual print begins.

- There is a conditional in the filament config that adds a Pressure Advance statement `M572 D0 S0.07` to the GCODE if the configuration is used on a RAILCORE as seen by the printer definition.
