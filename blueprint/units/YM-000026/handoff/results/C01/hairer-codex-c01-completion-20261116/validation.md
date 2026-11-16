# Validation

Checks performed on the final manuscript hashes in `fingerprints.json`:

- `python3 scripts/check_blueprint.py`: PASS, four units. This checks structure only.
- `git diff --check`: PASS.
- From `manuscript/`, `/Library/TeX/texbin/latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym42-build existence.tex`: PASS, 1205 pages. The final log contains no undefined or multiply defined references.
- PDFKit rendering and visual inspection of pages 35, 75, 77 and 78: the new finite reflection corollary, selected application and curvature estimates render correctly.
- Two independent mathematical reviewers cover all eleven chapters at the recorded hashes. Their final reports are `math-analytic-review.md` and `math-interfaces-review.md`.
- The separate Luna reader's targeted pinned-source correspondence check is in `source-review.md`, including its carry-forward evidence and limitations.

No Lean build, elaboration, axiom replay or kernel audit was run. No checker code changed, so its test suite was not rerun. Historical approvals were not rewritten. The tracked PDF and the user's existing local PDF modification were not changed.
