# Validation record (session ADB991-claude-20261113-4c83)

Commands actually run, with their outcomes. The checker commands were run on the report branch `claude/issue-55-4c83`, which is cut from `69b2631`. The LaTeX build was run on an export of the PR head `f9ddbdb`.

| Command | Outcome |
| --- | --- |
| `git diff --check 69b2631 f9ddbdb` | clean |
| `git diff 69b2631 f9ddbdb -- Lean source \| wc -l` | `0` (no Lean/source change) |
| Independent re-hash (Python, `git show <commit>:<path> \| sha256`) of every `inputs` row of the author's `mgubi-astra-c14-curve-r1-20261113/fingerprints.json`; `WORKTREE` rows hashed at `f9ddbdb`; PR #216 head and PR #242 head fetched for the two rows that live there | 22 of 22 match |
| `sha256sum` of the files in the README fingerprint table, at `f9ddbdb` | as listed in `README.md` |
| `git archive f9ddbdb manuscript`, then from `manuscript/`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=../build existence.tex` (TeX Live from Ubuntu apt) | exit 0; 983 pages; 0 `undefined` in the log; one overfull box (1.83pt, `public-run-binding.tex` l. 39–47, which the PR does not change) |
| `pdftoppm -r 70 -f 836 -l 841` and visual inspection of pages 836 (joint-curve input), 837 (normalization, prescribed-scale input), 840 (theorem 208.5 and proof) and 841 (completion) | text and displays render without overlap or clipping; cross-references resolve (Theorem 208.5, (1063)–(1067), (1069), (1074)) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |

Not run:

- The author's `verify.py`. It was not executed in this sandbox. I read it (22 lines; it hashes the manifest rows, checks imported-source hashes against `Lean/SOURCES.sha256`, and checks for an empty Lean/source diff), and I reproduced its row-hash check and its empty-diff check independently, as recorded above. Its `Lean/SOURCES.sha256` cross-check was not reproduced.
- No Lean elaboration, build or axiom audit (Mathlib hosts are unreachable here).
- No merge or combined build with PR #216.
