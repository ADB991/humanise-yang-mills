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

## Revision 1, part A (session `hairer-claude-c14-rev1a-20261113`)

Base `codex/existence-monograph` `84a6a93`; see `revision-1.md`. No Lean was built or elaborated: the toolchain is unreachable in this session, and Lean anchors were checked as source text only.

| Command | Result |
| --- | --- |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` | exit 0; 961 pages; `grep -c undefined build/existence.log` = 0; no multiply defined labels. The tracked `manuscript/existence.pdf` is unchanged (build under the ignored `build/`) |
| `pdftotext` page search, then `pdftoppm -r 70` | changed passages on PDF pages 797, 801, 809, 812, 813, 815, 817 and 831; pages 801, 809 and 831 viewed as images, the others read as text; rendering correct |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `git diff --check` | no output |

Changed chapters (SHA-256 before at `84a6a93`, after):

| File | Before | After |
| --- | --- | --- |
| `manuscript/existence/finite-rank-kernel-transport.tex` | `c6da79dfc7cf7bffc4d81b47fc75bcea0a873bc1fd87d8f034b9e64c5811d327` | `5abd0cc495d61893611cf5d42336589fb4f059956befb75937c8b766ca214679` |
| `manuscript/existence/actual-equation-kernel-relay.tex` | `f966d1ee034d43f47215bfe6db561b3e8d88c04c2cf6ed5164996a2a4773156c` | `bf75181d78490ac46b571007134b8c2fe3317d3fb0f53f604f77827ffb1c0785` |
| `manuscript/existence/actual-insertion-derivative-relay.tex` | `b7b0f559a8365e0703462ea5023de1828585b96f874b0f7b02d9494661e8b16b` | `f9dc7e949bec0d37a325e7a27a7337723ce94ceccf5bb93b87f78d4ab974b93a` |
| `manuscript/existence/trace-firesky-gallery.tex` | `6265ab845bd82fe72bcb8fbcdcf9089adb99a43badfae8b0054fa244e4a4f437` | `4dd0bd90b135f8ec8dc3776023e916f074f3b321ad78811c2e3c1ccc4d0c0de7` |
| `manuscript/existence/physical-ward-free-classification.tex` | `784e7d1c0ef6a2f6b909744c609a76bda66991861f7edbe91a36ea8c2eecc514` | `e3356f9ba36869afdce60614e5e2680eed000d93f0b03d9bf7a951336ea381e7` |

The other 18 C14 chapters are unchanged by this revision.
