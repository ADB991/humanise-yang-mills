# Validation (commands actually run)

- `git fetch origin codex/existence-monograph`; branch `claude/issue-145-e4d9` cut at `ddc3c90`.
- `sha256sum` of the five chapters: all equal the author handoff hashes (`hashes.json`).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: `Ran 22 tests … OK`.
- `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/` (apt texlive): exit 0, 968 pages, no undefined or multiply defined references. The reviewed sections are §131 (p. 491), §136–139 (pp. 521–535). Pages 491–497 and 521–535 were rendered with `pdftoppm`; pp. 493 and 533 were inspected as images and render correctly. Not every page was viewed.
- Lean: source text read with `grep`/`sed` only. No toolchain or elaboration; the Mathlib hosts are blocked in this environment.
- The checks above were run on the base `ddc3c90` before the report files were added. The checker and tests were re-run after adding them (see the PR body).
