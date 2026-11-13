# Validation: review of PR #216 (session ADB991-claude-20261113-41d8)

These are the commands actually run on 2026-11-13, in a clone of hairer/humanise-yang-mills with PR #216 fetched as `pr216` (head `44df7abe1cd6e903230d58fc7f1a73396d17ba8f`).

- `git diff --word-diff=plain 69b2631 pr216 -- manuscript/existence/<six chapters>`: read in full.
- `sha256sum -c blueprint/units/YM-000026/handoff/results/C14/source-leakage-hashes-20261113.sha256`, run at the PR head: all 13 entries OK (six chapters, ledger, response, five Lean files).
- Read at the PR head: `trace-calibration-producer.tex` (lines 1–420, 495–600), `trace-weighted-estimates.tex` (1–110), `trace-firesky-gallery.tex` (`lem:ex-lattice-firesky-selection`, `eq:ex-lattice-firesky-lift-bound`), `actual-stress-annulus.tex` (115–180), `physical-ward-propagation.tex` (860–905), and the C14 response, ledger diff, validation file and `physical-ward-free-classification-evidence.md`.
- Every newly cited label exists, checked by grepping `\label{...}` under `manuscript/`: 15 labels, each found in exactly one file.
- Lean files inspected textually: `Lean/YM/TraceExtension/Shelves/Lore.lean` (30–56), `Lean/YM/Next/UV_STRESS/Dimension.lean` (18–90), plus grep confirmation of the declarations in `Prom/Zoom/Boats.lean`, `Prom/Zoom/Pepper.lean` and `Next/UV_STRESS/Station.lean`.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex`, run from `manuscript/` at the PR head: exit 0, 982 pages. No undefined-reference or multiply-defined-label warnings in `existence.log`.
- `pdftotext -layout` located the changed passages on pages 786, 833, 834, 835, 837, 848, 849, 852, 856 and 886. Pages 834, 838 and 856 were rendered with `pdftoppm -r 70` and inspected visually: legible, with no clipping or overlap.
- `python3 scripts/check_blueprint.py` on this report branch: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.

Not run: Lean elaboration or `#print axioms`. The Mathlib hosts are blocked here and the PR changes no Lean. I also did not visually inspect every changed page; only the three pages listed were rendered.
