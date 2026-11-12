# Surviving interval and nearby-target shooting — draft

Pin 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Exact source: YM.RG.Shoot in Lean/YM/Shoot/Criteria.lean (Curve, Lives, Relays, Issues), Reach.lean (narrow, limits, Drifting.pay, gates, steps, successful); YM.Extension.UV in Lean/YM/Extension/UV/Shoot.lean (margin, bottom_gates, trial, advancedPath, pays, all_nearby).

Proof preserves actual fixed recipe/path, all retained extra clauses through strengthened next predicate, band-free returns followed by surviving interval restriction, and one shared path across periods. Nearby target radius min(bar/2,jump0/4). Running bound uses sum of drift errors, then J^-2 small ratio; no false summability claim. Inputs are actual Program and paid stage drift/initial data, produced separately, not assumed to prove nonlinear existence.

Elementary IVT/compact level sets used as reader prerequisites; shared literature index consulted, no specialized reference needed. Targeted source reads actually run; no Lean build, source modification or axiom replay. Pending independent review and LaTeX integration.
