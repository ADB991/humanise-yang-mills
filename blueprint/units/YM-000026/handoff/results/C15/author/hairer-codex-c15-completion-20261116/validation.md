# Final integrated validation

Baseline: 6ad4980123ed279d05c41d3cb59b0d28d356afdb.

- All 23 manuscript fingerprints in final-endpoint-review.md match the integrated files (20 C15 chapters and three changed suppliers).
- Full build: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build-completion existence.tex`, from manuscript/, succeeded: 1185 pages, 6115497 bytes. No undefined or multiply defined references.
- Visually inspected final rendered pages 1070, 1080, 1117, 1129, 1150 and 1166: equations and prose readable, no clipping or overlap on these sampled additions.
- `python3 scripts/check_blueprint.py`: Blueprint structure OK: 4 units. This is a structural check, not verification of Lean or mathematics.
- `git diff --check`: pass.
- Independent local reviews and final whole-C15 audit: mathematical PASS / proof-ready at the recorded fingerprints. Canonical upstream and reconstruction inputs and human acceptance remain distinct.
- No Lean elaboration. Imported Lean source and toolchain unchanged. Generated build artifacts and the original workspace PDF are excluded.
