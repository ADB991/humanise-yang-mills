# Validation performed

Author session mgubi-codex-c16-20261112. Separate worktree
`/tmp/ym-c16-20261112`; released base b2f59c3. Source pin 3456e5e75cf8d4cd558955a5c7638fba2d68f464.

- Read CONTRIBUTING.md, coordination/proof-standard, C16/common contract,
  checkpoint, open-edge and inherited evidence records; read live #57/#26,
  overlapping issue discussions, PR #74, PR #63 and PR #72. Posted and re-read
  claim; pre-submission recheck exposed the C05 singleton finding, now repaired.
- Python hashlib comparison: all seven initial C16 chapter hashes matched
  package-plan.json. `hashes.json` records initial and final versions.
- Python hashlib comparison against Lean/SOURCES.sha256: all 19 listed inspected
  source files match the manifest. `inspected-source.sha256` records them.
  This checks correspondence to the local pin, not independent authentication.
- `python3 scripts/check_blueprint.py`: passed, 2 units. Structural validation
  only; no mathematics or Lean verification is implied.
- `git diff --check`: passed.
- From manuscript/, ran
  `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym-c16-build existence.tex`.
  Repeated after the first-stage wording edit and the singleton repair. Final
  build: exit 0, 872 pages. Used the canonical full include wrapper so all
  cross-referenced inputs and labels are present; no tracked PDF was changed.
  Final log has no undefined references or overfull boxes. It contains the
  pre-existing amsmath `Foreign command \\atopwithdelims` warning.
- Poppler was not on PATH. Rendered with installed Ghostscript:
  `gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r90 -dFirstPage=21 -dLastPage=23 -sOutputFile=/tmp/ym-c16-build/statement-%d.png /tmp/ym-c16-build/existence.pdf`
  and analogous ranges 862--864 and 869--872. Visually inspected every resulting
  page. After the singleton edit, rendered and inspected final pages 867--872
  at 100 dpi. Formula layout, margins, cross-references and page breaks were
  legible with no clipping or overlap. This is changed-page QA, not all-page QA.
- A scratch wording command initially used a repository-relative path while
  running inside manuscript/ and raised FileNotFoundError before editing; it
  was corrected and the final build was rerun successfully. Two source-location
  searches found no match in the guessed directory; inspection then used the
  actual YM/Price and YM/OPE/Grouping paths. No result is inferred from those
  failed searches. The first optional GH contents query failed due to unquoted
  shell `?`; G01 proposed patches were instead read from the fetched Git ref.

Not run: fresh Lean elaboration/build, axiom replay, independent kernel checker,
checker unit tests (checker unchanged), independent review of C16, whole-argument
closure review. Source checks here are textual; separate #37 evidence retains
its own scope. No claim of approved mathematical status.
