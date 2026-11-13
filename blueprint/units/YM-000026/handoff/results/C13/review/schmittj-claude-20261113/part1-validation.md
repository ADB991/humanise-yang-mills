# C13 review, part 1: validation record

Reviewer 1 of 3, Claude (Opus 5.5) subagent of session `schmittj-claude-c13-review-20261113`. Commands run in `/home/jo314/ym-wt/c13-review` (read-only apart from this directory).

| Command | Result |
| --- | --- |
| `git log --oneline -1`; `git rev-parse HEAD` | `be0e87d…` (`be0e87db8c520491d25145d3c61f61b97f0ff42d`), Merge PR #105 |
| `git diff --stat bddbedc~1 bddbedc` | 15 files; my changed chapters: `actual-local-compiler-handoff.tex` 53 lines, `actual-mixed-marked-compiler.tex` 6, `allarity-planted-compiler.tex` 25 |
| `git diff bddbedc~1 bddbedc -- manuscript/existence/{allarity-planted-compiler,actual-mixed-marked-compiler,actual-local-compiler-handoff}.tex` | read in full; assessed in `part1-mathematics.md` |
| `git log --format='%h %s' -3 -- manuscript/existence/actual-local-compiler-handoff.tex` | `bddbedc`, `ab138ed`: lines 22–24 and 261–265 (finding F1) predate PR #103 |
| `wc -l` on the seven chapters | 228, 288, 251, 381, 344, 319, 188 (total 1999) |
| `sha256sum` of the seven chapters, compared with the scratchpad list `c13-hashes.txt` | all seven MATCH (below) |
| `grep`/`sed` reads of Lean declarations listed in `part1-lean.md` | statements read at the pin; no build |

SHA-256 (all equal to the frozen list and to `results/C13/chapter-hashes.json`):

- `58c61b500b63cbcc28bbb62983b93e1f0f0b36dedecd161750e54c5809cf9d2f` `manuscript/existence/restarted-rank-history.tex`
- `b5e005215a07c51a80d669f9c81db08991b71d9d7bbb570ccfdd636bd4753aa0` `manuscript/existence/allarity-planted-compiler.tex`
- `c4d10e87049fded9b8cde7a2e8a56c929c5844f2ee103e0979097467d747ec86` `manuscript/existence/actual-harvested-owner-energy.tex`
- `b02d3aedbbb4f79cab3e70b84545464f69fc8f4ec2e3cd7064a4df448000a982` `manuscript/existence/actual-corrected-body-compiler.tex`
- `ae9d04017acbdc8a8f469c1a273f04226c1f1cdccad6eed897a6a76a32d1a848` `manuscript/existence/actual-mixed-marked-compiler.tex`
- `be1617bbc8ae8d38bc18d501cb1b71b8dcb6a2343974fbff48cbb86e728c2fff` `manuscript/existence/actual-local-compiler-handoff.tex`
- `1ccde1f91c9f717d5e0863c42c464834f77f35b59ff4f80ce7d5c54f268e941c` `manuscript/existence/actual-reader-local-gaussian-prices.tex`

Not run: LaTeX build or rendered-page inspection (the review changes no LaTeX), `python3 scripts/check_blueprint.py` (no blueprint metadata changed), Lean elaboration, kernel check or `#print axioms`. The `Lean/` tree was taken as the vendored pinned source; I did not recompute `Lean/SOURCES.sha256`.
