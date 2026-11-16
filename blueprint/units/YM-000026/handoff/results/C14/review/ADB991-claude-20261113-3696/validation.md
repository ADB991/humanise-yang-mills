# Validation (commands actually run)

All commands were run on 2026-11-13 in a detached worktree at PR #256 head `f3a0a4b`, unless marked otherwise.

- `python3 scripts/check_blueprint.py` → `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests` → `Ran 22 tests … OK`.
- `git diff --check origin/codex/existence-monograph...pr256` → clean.
- Author verifier: `python3 -I …/mgubi-astra-c14-chart-curve-20261113/verify.py` → `PASS 15 frozen/current versions; 9 imported-source hashes; unchanged Lean/source diff`. The first attempt failed because commit `73adfb1` (one of the frozen inputs, from review PR #242) was not in the local clone. After `git fetch origin pull/230/head pull/242/head` it passed. The failure was a fetch problem, not a hash mismatch.
- `sha256sum` of the chapter and the five author records gives the values in `README.md`.
- Full build: from `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` → exit 0, 983 pages, no undefined references. The changed passages render on pp. 836–841, which I viewed as PNG (`pdftoppm -r 80`). The new notation, the joint-curve paragraph, the theorem and the completion display render without overlap or clipping.
- Lean: source text only (see `lean.md`). No `lake build`, elaboration or `#print axioms`, because the Mathlib hosts are blocked here.
- On the review branch (base `69b2631` plus this report only): `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests` were re-run after adding these files. The results are recorded in the PR body.

Not done: no combined PR #216 + PR #256 build. No check of any analytic receipt. No review of PR #252.
