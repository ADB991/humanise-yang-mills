# Validation record (session ADB991-claude-20261113-e8e7)

Commands actually run, with their outcomes. The checker commands were run on the report branch `claude/issue-276-e8e7`, which is cut from `69b2631`. The LaTeX build was run on a detached worktree of the PR head `5f664eb`.

| Command | Outcome |
| --- | --- |
| `git diff --check 69b2631 5f664eb` | clean |
| `git diff 69b2631 5f664eb -- Lean source \| wc -l` | `0` |
| `git diff --stat 69b2631 5f664eb` | 6 files, +234 −8 (1 chapter, 5 new author records) |
| Independent re-hash (Python, `git show <rev>:<path>` then SHA-256) of every `inputs` row of the author's `fingerprints.json`, `WORKTREE` rows at `5f664eb`; check of `git rev-parse 69b2631:Lean` against its `source_tree` | 17 of 17 match; source tree matches |
| `sha256sum` of the files in the README table, at `5f664eb` | as listed in `README.md` |
| From `manuscript/` of the PR-head worktree: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (TeX Live from Ubuntu apt) | exit 0; 983 pages; 0 `undefined` in the log; one overfull box (1.83pt, `public-run-binding.tex` l. 39–47, unchanged by the PR) |
| `pdftoppm -r 80 -f 826 -l 828` and visual inspection of pages 827 (Lemma 206.1 and proof) and 828 (closing paragraph) | text and displays render without overlap or clipping; references resolve (Sections 159, 161, 240; eq. (1051)) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |

Not run:

- The author's `verify.py`, as such. I reproduced its row-hash and source-tree checks independently (above).
- No Lean elaboration, build or axiom audit. Correspondence is textual.
