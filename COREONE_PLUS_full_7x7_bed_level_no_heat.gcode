; Prusa CORE One+ full-bed mesh leveling
; Probes the full 250 x 220 mm bed (7 x 7 = 49 measured points)
; No nozzle, bed, or chamber temperature commands are used.
; IMPORTANT: Install a clean steel sheet and manually clean the nozzle first.

M17                         ; enable steppers
; M862.3 model check intentionally omitted for CORE One+ hardware variants
M862.5 P2                   ; Prusa Buddy G-code compatibility level
M862.6 P "Input Shaper"     ; declare Input Shaper-compatible G-code

G90                         ; use absolute coordinates
M84 E                       ; keep extruder motor disabled

G28                         ; home all axes

G29 P1 X0 Y0 W250 H220      ; invalidate old mesh and probe the full bed
G29 P3.2                    ; interpolate between measured points
G29 P3.13                   ; extrapolate the mesh edges
G29 A                       ; activate the completed mesh

G0 Z15 F720                 ; move safely above the bed
G0 X242 Y211 F10200         ; park near the rear-right corner
M84 X Y E                   ; release X, Y, and extruder motors (leave Z enabled)
