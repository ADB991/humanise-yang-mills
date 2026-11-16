# Validation

Session `ADB991-claude-20261113-e487`. Base `codex/existence-monograph` @ `08e85a788378ae70be357c96f0091ea7f18bbd56`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Commands actually run
- `git log` on both chapters, to find their authors (Hairer checkpoint `a2353123`, schmittj `f8022ce0`, ADB991 `a4a73dc9`), and `git show --numstat a4a73dc9`.
- Read in full: `trace-regular-atom.tex`, `trace-coffer-supplier.tex`, `trace-regular-atom-evidence.md`, `trace-coffer-supplier-evidence.md`. Also the part-A ledger rows found by `grep` (l.15–76), `trace-bill-prices.tex` l.1–60, `actual-marked-portfolio-calibration.tex` l.620–705, and the `ex-centered-sail` passage of `centered-construction.tex`.
- `grep -rn` over `manuscript/existence/*.tex` for `stakes|Treasury|denominator bound|siteFactor|fly`, for `melting`, and for "support exponent at least four". The phrase "finite-volume denominator bound" and any discharge of melting occur only in the coffer chapter.
- `grep`/`sed -n` on the Lean files listed in `inspected-sha256.txt`, reading the declarations cited in `lean-correspondence.md`.
- `sha256sum` of every inspected file → `inspected-sha256.txt`.
- `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests` on the PR branch (results in the PR description).

## Not run
- No Lean elaboration or `#print axioms`: the Mathlib hosts are blocked here, so the correspondence is textual.
- No LaTeX build: this report changes no `.tex` file.
- Internals listed under "Not checked" in `lean-correspondence.md` §1.5 and §2.5.
