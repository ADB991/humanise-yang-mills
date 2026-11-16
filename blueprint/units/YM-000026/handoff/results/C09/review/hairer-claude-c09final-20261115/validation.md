# Validation (commands actually run)

Base `codex/existence-monograph` @ `058a4386`. Branch `claude/issue-50-c09final-review`.

- **Hash identity.** A Python comparison of the eight reviewed chapters against
  `results/C09/chapter-hashes.json`: 8/8 match.
- **Source integrity.** `grep -F` of the nine Lean file hashes in `reviewed-files.sha256` against
  `Lean/SOURCES.sha256`: 9/9 present. This is a manifest check, not a build.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ymb8 existence.tex`:
  exit 0, 1103 pages, no undefined or multiply defined references.
- **Rendered check.** Page 448 was rendered to confirm N1 (the text reads "[z, z], dt"). The
  chapters were located at pp. 442 (stationary action prices), 448 (truncated log), 451 (exterior
  receipt), 483 (Wilson price) and 485 (row price). The remaining three were read in source; their
  titles did not match a plain-text search because of ligatures.
- **Not run.** No Lean build, elaboration, `leanchecker` or axiom replay. The source checks are
  textual. No manuscript, author record or ledger was edited by this review.
