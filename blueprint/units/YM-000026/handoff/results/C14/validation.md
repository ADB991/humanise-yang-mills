# Actual validation

Worktree `/tmp/ym-c14-20261113`; branch `codex/issue-55-c14-20261113`.
Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Content and source checks

- Python SHA-256 comparison of `/tmp/c14-start.json` against C14 in
  `handoff/coverage-inventory.json`: all 23 paths/hashes match. Compared each
  starting file with `git show 81538d6:<path>`: all 23 also match the rebased
  pre-edit branch. Final `hashes.json`: exactly four changed, 19 unchanged.
- Python SHA-256 comparison of the 21 files in `inspected-source.sha256` against
  `Lean/SOURCES.sha256`: all match. These are source-text checks, not elaboration.
- `python3 scripts/check_blueprint.py`: exit 0,
  `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check`: exit 0, no whitespace errors.
- Scoped `rg`, `sed` and `cat` reads of the chapters, existing evidence/review
  records, C12 handoff, and the source ranges described in `correspondence.md`.
  Live issue55 was checked before/after claiming and before submission; no
  competing claim appeared in those checks.

## LaTeX and visual checks

From `manuscript/`:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=/tmp/ym-c14-build existence.tex \
  > /tmp/ym-c14-build/build.log 2>&1
```

The existing full manuscript served as the wrapper containing the four changed
chapters and their canonical referenced inputs. An initial build preceded the
last annulus clarification; the final build after those mathematical edits
returned exit 0 and produced 920 pages, 4,660,126 bytes. No undefined references,
multiply defined labels or overfull boxes were reported. The log contains the
preamble's amsmath `Foreign command \\atopwithdelims` warning.

Used pypdf text extraction to locate the changed passages, then Ghostscript:

```sh
gs -q -dSAFER -dBATCH -dNOPAUSE -sDEVICE=png16m -r110 \
  -dFirstPage=P -dLastPage=P \
  -sOutputFile=/tmp/ym-c14-build/render/page-P.png \
  /tmp/ym-c14-build/existence.pdf
```

Rendered pages 783, 784, 790, 791, 810, 814–819 and 821. Visually inspected
783, 784, 790, 810, 814, 815, 816, 817, 818, 819 and 821: formulas and text fit,
new cross-references resolve, and page breaks do not obscure the revised
statements. Page791 was an extra rendered adjacent page and was not visually
reviewed. Scratch PDF, images and logs are local validation artifacts and are
not committed or published.

## Failed navigation/edit attempts and unrun checks

A few guessed source paths/globs did not exist; `rg --files` resolved the actual
`MergeProof/West` and other locations before the successful reads. Two optional
line-reflow scripts failed before writing anything (a Python string syntax error,
then a wrong working-directory path). No resulting edits were used; the final
build above checks the actual mathematical patch.

No Lean build, `#print axioms` replay, transitive axiom audit, independent
mathematical review, or full rereading of every unchanged proof was performed.
The separate #37 source-build work and the inherited source limitations remain.
No tests were added: the changes are mathematical LaTeX and author reports;
structural checking, source inspection and rendering are the relevant local
checks. A clean build does not establish the mathematics or close dependencies.
