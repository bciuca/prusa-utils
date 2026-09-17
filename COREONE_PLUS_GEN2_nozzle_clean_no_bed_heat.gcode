; Prusa CORE One+ Gen 2 factory nozzle wiper diagnostic
; Requires firmware with G12 wiper support (verified against 6.8.1).
; Enable Settings > Hardware > Nozzle Wiper before running.
; Not for INDX or aftermarket brush assemblies.
; Install a clean steel sheet and clear the bed before starting.
; Watch the Y approach and stop the print if it collides with the holder.
;
; Bed stays off. G12 heats the nozzle, probes the wiper touchpoint,
; runs the stock wiping sequence, and performs its normal cooldown.
; No mesh leveling, purge line, or extrusion is requested.

M140 S0                     ; disable bed heating immediately
M104 S0                     ; nozzle target to restore after G12
G90                         ; absolute positioning
G28                         ; fresh homing for this diagnostic
G12                         ; firmware-controlled nozzle cleaning
M400                        ; finish queued motion
M104 S0                     ; leave nozzle heater off (no cooling wait)
M140 S0                     ; leave bed heater off
