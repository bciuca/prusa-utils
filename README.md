# Prusa / 3D printer Utilities

Misc gcode for debugging and quality of life during prints. All files are for the Prusa CoreOne+.


| File | Description |
| --- | --- |
| `COREONE_PLUS_full_7x7_bed_level_no_heat.gcode` | 7×7 bed-leveling G-code, no heated nozzle or bed |
| `start-gcode-prevent-oozing.gcode` | Set nozzle temp to 160ºC during bed leveling to prevent oozing, especially annoying with TPU that constantly drips. |

## Notes

### 7x7 bed leveling error and fix
I was getting failed bed leveling for a large print on the very last 49th point. Even after a full Z-axis and homing calibration, I was still getting the error. This was my first large print after upgrading my MK4S to the CoreOne+, which led me to believe I did something wrong during the conversion.

I read a few forums notes that had the same problem. I thought I might have an issue with one of the Z-axis motor threaded rods, where in some cases the thread size is slightly different on the Z-axis motor that shipped in the upgrade kit than what came from the MK4S. That was't the case for me, thankfully. My issue was with how I installed the trapezoid nuts to the threaded rods. The nuts weren't all the way flush on one or motors which cause a slight but big enough tilt to fail the bed leveling at the edges. Everything was fine for smaller prints I did that leveled 3x3 in the center of the build plate.

**My fix**
1. Move the Z-axis all the way to the bottom of the printer
2. Disable stepper motors
3. Remove the M3 bolts from the lead screw on all 3 Z-axis.
4. Manually move the lead screws high enough so that you move the plate up and attach the retaining ring on the bottom back of the plate to the back motor.
    1. Before bolting the trapezoid nut, make sure it sits perfectly flush with the build plate, then bolt it.
5. Move the plate back all the way down by manually turning the back motor.
6. Move the trapezoid nuts on the left and right motors down until they sit perfectly flush with the build plate and tighten the M3 bolts (dont over do it).
7. Perform a Z-axis calibration and homing.
8. Run the `COREONE_PLUS_full_7x7_bed_level_no_heat.gcode` print file to do a 7x7 bed leveling. This diagnostic print runs with no heat or filament use, make sure the nozzle and plate is clean.
 
