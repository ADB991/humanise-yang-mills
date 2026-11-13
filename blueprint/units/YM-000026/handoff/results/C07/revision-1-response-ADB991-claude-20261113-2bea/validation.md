# Checks actually run (session ADB991-claude-20261113-2bea)

Branch `claude/issue-48-53b3` (PR #271), new commit on top of `c68df76`.

- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: OK.
- `git diff --check`: clean.
- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` from `manuscript/` (TeX Live from Ubuntu apt): exit 0, 985 pages, no `!` errors, no undefined or multiply-defined references in the log.
- Rendered and inspected: p. 344 (`lem:gaussian-base-density`, new j=0 paragraph), checked as a page image. p. 315 (`haar-chart`, m_G) and p. 321 (`compensated-variation`, chart and inverse) checked by pdftotext.
- SHA-256 of the three changed files recomputed into `../chapter-hashes.json`.
- Not run: Lean (no source correspondence changed; the review found no source correction needed); independent check of this delta (needs another account).
