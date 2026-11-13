# Validation: session ADB991-claude-20261113-088d

Commands actually run (2026-11-13, this container):

- `git diff c560828 bf3d347 -- manuscript/ blueprint/`: 11 files; the five chapters and six C10 author records. `git diff --quiet bf3d347 97128ab -- manuscript blueprint`: no difference.
- `sha256sum` of the five chapters at `97128ab`: all equal the "After revision 3" column of `results/C10/revision-3.md`.
- From `manuscript/`: `latexmk -g -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex`. Exit 0, 970 pages, 0 log lines with "undefined", 0 "Overfull".
- Rendered at 70 dpi with `pdftoppm` and inspected: p. 473 (§125.3, centred box), p. 475 (§125.5, `q_a` drift), p. 516 (Scope with (T)), p. 522 (side conditions (a)–(c)), p. 535 (dropped data list; block representatives in the pole chapter). Rendering is clean, with no `??`.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: `Ran 22 tests … OK`.
- Lean source read as text at the pin:
  - `S/Spectral/Slabs.lean` l.323–333;
  - `S/FrameEst/Center.lean` l.1–30;
  - `YM/Lattice/Crossing.lean` l.19;
  - `S/Joint/Symmetry.lean` l.80–100, 262–300, 320–405;
  - `S/Joint/Gauge.lean` l.160–200, 225–262;
  - `S/Joint/Regulator.lean` l.501–512;
  - `S/Joint/OnShell.lean` l.300–335;
  - `S/Films/LeadingRay.lean` l.771–786;
  - `S/Films/TraceDifference.lean` l.470–478;
  - `S/Films/RankColor.lean` l.151–163;
  - `S/Loops/Curvature.lean` l.66–70;
  - `S/Loops/HessianMatch.lean` l.70–95, 715–743.

Not run: Lean elaboration, `#print axioms`, `lake build`. Mathlib hosts are blocked here, so nothing was elaborated.
