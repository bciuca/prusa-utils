; Prusa CORE One+ Gen 2 factory nozzle wiper diagnostic
; For firmware 6.8.1 with the factory nozzle wiper enabled.
; Enable Settings > Hardware > Nozzle Wiper before running.
; Not for INDX or aftermarket brush assemblies.
; Install a clean steel sheet and clear the bed before starting.
; Watch the Y approach and stop the print if it collides with the holder.
;
; Bed stays off. Nozzle target is 170C for probing and wiping,
; followed by the firmware's normal cooldown to 150C, then heater off.
; G29 P9 inherits 170C; G12 would override it with filament preheat.
; Do not lower the target below 170C: firmware then uses filament preheat.
; No mesh leveling, purge line, or extrusion is requested.

M140 S0                     ; disable bed heating immediately
G90                         ; absolute positioning
M109 R170                   ; heat OR cool to 170C before probing
G28                         ; fresh homing for this diagnostic
G29 P9                      ; stock wiper probing/cleaning using the 170C target
M400                        ; finish queued motion
M104 S0                     ; leave nozzle heater off (no cooling wait)
M140 S0                     ; leave bed heater off
