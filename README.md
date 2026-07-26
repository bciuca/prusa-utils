# Prusa / 3D printer Utilities

Misc gcode for debugging and quality of life during prints. All files are for the Prusa CoreOne+.


| File | Description |
| --- | --- |
| `COREONE_PLUS_full_7x7_bed_level_no_heat.gcode` | 7×7 bed-leveling G-code, no heated nozzle or bed |
| `start-gcode-prevent-oozing.gcode` | Set nozzle temp to 160ºC during bed leveling to prevent oozing, especially annoying with TPU that constantly drips. |

## Notes

### 7x7 bed leveling error and fix
**Symptom**
Failed bed leveling for large prints, usually at the last 49th test point (front-left of bed). 

Before attempting to fix anything in the hardware, try rebooting, full Z axis, and homing calibration, then use the bed leveling g-code `COREONE_PLUS_full_7x7_bed_level_no_heat.gcode` to run just the full 49 point bed leveling test.

If that doesn't work, the trapezoid nuts might be slightly off on each of the motors. The steps below will align the nuts flush with the bed plate. If the bed is still fails the full self-leveling, one of the threaded rods might have a slightly different thread pitch from the other motors (this was an issue with MK4S conversion kits).

**The fix**
1. Move the Z-axis all the way to the bottom of the printer
2. Disable stepper motors
3. Remove the M3 bolts from the lead screw on all 3 Z-axis.
4. Manually move the lead screws high enough so that you move the plate up and attach the retaining ring on the bottom back of the plate to the back motor.
    1. Before bolting the trapezoid nut, make sure it sits perfectly flush with the build plate, then bolt it.
5. Move the plate back all the way down by manually turning the back motor.
6. Move the trapezoid nuts on the left and right motors down until they sit perfectly flush with the build plate and tighten the M3 bolts (dont over do it).
7. Perform a Z-axis calibration and homing.
8. Run the `COREONE_PLUS_full_7x7_bed_level_no_heat.gcode` print file to do a 7x7 bed leveling. This diagnostic print runs with no heat or filament use, make sure the nozzle and plate is clean.
 
### TPU ooze gunking up build plate during self leveling
**Symptom**
TPU (the really soft stuff, 85A shore hardness) oozing from nozzle during bed leveling resulting in lots of dots of TPU on the bed. Bed leveling may also fail because the nozzle never gets a clean read.

The oozing is caused by too high of a nozzle temp during init, hot enough to melt the TPU and gravity dragging it out. The fix is to lower the nozzle temp during init either manually with Tune on the printer, or modifying the start g-code to set the hotend to 160ºC before bed leveling: `M109 S160`. There may be better solutions in the g-code for this but it worked as a custom print profile for this filament type.

**The fix**
1. Replace the g-code in the starting g-code setting in Prusa Slicer with the g-code found in `start-gcode-prevent-oozing.gcode`.
2. Save this setting as a custom print profile for the filament and print settings.
