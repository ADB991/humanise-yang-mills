# Validation: renewed review of the PR #216 follow-up (session ADB991-claude-20261113-5502)

These are the commands actually run on 2026-11-13. The checkout is a worktree of hairer/humanise-yang-mills at PR #216 head `4c141ec86b5cb20e7d837a343b26bbe91e57394a`, fetched from `mgubi/humanise-yang-mills` branch `codex/astra-c14-leakage-author-20261113`.

- `git diff 44df7abe 4c141ec8`: read in full. Six files changed: two chapters, the author hash manifest and three new author records.
- `sha256sum -c blueprint/units/YM-000026/handoff/results/C14/source-leakage-hashes-20261113.sha256` at the head: 13 of 13 OK.
- Recomputed the SHA-256 of each of the 7 paths in the author's `fingerprints.json` at the head: all match `after_sha256`. `git show 44df7abe:<chapter> | sha256sum` for the two changed chapters matches their `before_sha256`. `git rev-parse HEAD:Lean` gives `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. `git diff --stat 44df7abe HEAD -- Lean source` is empty.
- Read at the head: `trace-calibration-producer.tex` lines 15–30 and 490–600 (including `thm:ex-lattice-selected-trace-gallery`), `trace-firesky-gallery.tex` lines 100–128, `actual-stress-annulus.tex` lines 115–175, `actual-stress-shell-nodes.tex` lines 420–440, and `existence.tex` input order (lines 238–239).
- Lean, textual only: `Lean/YM/TraceExtension/Prom/Zoom/Boats.lean` lines 49–57 (`boatsSky`) and 75–83 (`wakesSky`). Both are quantified over an arbitrary `s : ℕ → ℝ` with `Tendsto s atTop (𝓝 0)` and `∀ i, 0 < s i`.
- `grep -rn '\tag{1}' manuscript/`: 8 hits (N2).
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/` at the head: exit 0, 982 pages. `grep -c 'undefined\|multiply' existence.log`: 0.
- `pdftotext` located the changed passages: O2 on page 833, M1 on page 839, O1 (theorem continuation) on page 840, and M2 on page 856. Pages 839, 840 and 856 were rendered with `pdftoppm -r 70` and inspected. They are legible, with no clipping or overlap, and the Proposition reference resolves to "Proposition 211.1". Page 833 was located but not inspected visually.
- On this report branch, cut from `codex/existence-monograph` @ `69b2631`: `python3 scripts/check_blueprint.py` printed "Blueprint structure OK: 4 units. Lean and mathematics were not verified."; `python3 -m unittest discover -s tests` ran 22 tests, OK; `git diff --cached --check` was clean.

Not run: Lean elaboration or `#print axioms`. The Mathlib hosts are blocked here, and the delta changes no Lean. The author's PR #227 `git apply --check` compatibility note was not re-run.
