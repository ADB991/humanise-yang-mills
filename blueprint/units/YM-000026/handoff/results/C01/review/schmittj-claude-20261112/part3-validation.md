# C01 review, part 3: validation record

All commands were run in the read-only worktree `/home/jo314/ym-wt/c01-review` at `165fb24` (PR #81 head) on 2026-11-12, by the Claude agent of session `schmittj-claude-c01-review-20261112`. Nothing outside this review directory was modified; no commit, push or GitHub post was made.

## Hashes

`sha256sum` of the part-3 chapters, run at the start and again at the end of the review (identical both times):

| File | SHA-256 | Coordinator list `c01-hashes.txt` | `HANDOFF.md` | `manifest.json` |
| --- | --- | --- | --- | --- |
| `manuscript/existence/atlas-estimates.tex` | `ea8fa9f14eb344dff2357bb1583e7b2ae3f9d7e482a5a6508a563858cb1db1d5` | match | match | match |
| `manuscript/existence/rg-horizon-geometry.tex` | `26ed5ac7d08e70391718cb18fecd787c0f57b34d976540e22c1f6052cf88a981` | match | match | match |
| `manuscript/existence/curvature-horizon-producer.tex` | `49227ddc1fa07dc40accf470e7c8c72d62a059db0e115ebeaa21f45d5adc2529` | match | match | match |

Author records (match the coordinator list): `RESULTS.md` `4f1c45f7c7dddebd661018944510f53ccc06bfefbe0737d749a066e43054500d`, `HANDOFF.md` `e85e1e704c181672f8495e96a2f94daeabf531abbb342af74aaf1da8df5ae212`, `VALIDATION.md` `854248de2e245127965b8ef513943fa4dea68a77e142ed12ce2c801278de672e`, `manifest.json` `e0d8d1dc64c098caa3c0cce40823d6436b27ae3342715211a564e91f5a38c53a`. Evidence files read: `atlas-estimates-evidence.md` `5abc1eb27b41636ced4672229ece806bcf69892d92b9200d57831862564e9b2c`, `rg-horizon-geometry-evidence.md` `fe9a61b00ee04d82abeacbbf8002300f04a0d15c2cf2eebfd7c6eb3c9e17ffed`.

All eleven C01 chapter hashes were also recomputed and compared by script with `HANDOFF.md`, `manifest.json` and the coordinator list: all 33 comparisons match.

## Commands and results

- `git log --oneline -3`; `git diff --stat 18d0327 HEAD`: 12 files, 529 insertions, 79 deletions, as stated in the brief.
- `git diff 18d0327 HEAD -- manuscript/existence/{atlas-estimates,rg-horizon-geometry,curvature-horizon-producer}.tex`: read in full; every hunk reviewed.
- `ls blueprint/units/YM-000026/handoff/results/C01/review`: did not exist before this review. Hence no earlier review directory at this commit; nothing was covered by an in-repository review.
- `git cat-file -t 292c535d58ed4e9e0437be95c6271f383e12adab` and `git cat-file -t ebdeb57914c0e284d85f1eddd0649e4a0c6300e1`: both fail ("could not get object info"). The snapshot commits on which `VALIDATION.md` bases the Checker alpha review and the author build are not available here.
- `git cat-file -t 9d11cca4644bad07126bfa372cc85fb120dee7ba`: commit; `git diff --stat 9d11cca 18d0327 -- <eleven C01 chapters>`: empty, confirming the VALIDATION statement that the target did not change any owned C01 file since the release.
- `git rev-parse 18d0327:Lean` and `git rev-parse HEAD:Lean`: both `328ad19b404d2db2a578319ea3e4eba4b27e34ef`, as stated in `VALIDATION.md` and `manifest.json`.
- `git diff --check 18d0327 HEAD`: no output (pass).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (matches the author's report).
- `pdflatex -interaction=nonstopmode -halt-on-error -output-directory=<scratch> existence.tex`, run three times from `manuscript/`: all three passes exit 0; 878 pages; the only warning in the final log is `Package amsmath Warning: Foreign command \atopwithdelims`. This reproduces the page count and warning stated in `VALIDATION.md`. In this build the part-3 sections are Section 3 (page 25, `sec:ex-lattice-atlas-estimates`), Section 10 (page 58) and Section 11 (page 63). I rendered pages 28 (Theorem 3.3 and Proposition 3.4) and 61 (bed root and cost table) with `pdftoppm -r 80` and inspected them: readable, no clipping, references resolved.
- Lean inspection: `grep`/`sed` reads of the files listed in `part3-lean.md` under `Lean/`. No `lake build`, elaboration, `#print axioms` or kernel replay was run (forbidden by the brief).

## Record statements tested and not reproducible here

- The Checker alpha interim renewal (A1/A2/A3/N1 resolved, 20 manifest inputs, 60 source hashes, 48-page wrapper): no artifact in the repository.
- "The selected source inventory was checked against 60 Lean files": the list is not in the records, so it could not be rechecked.
- The 29-page and 4-page visual checks by the author and parent: not repeated beyond my two sampled pages.
- Historical #37 build and axiom evidence: not part of this PR; not rechecked.

## Unrun checks

- No Lean build or axiom check.
- No independent review of chapters outside part 3 beyond the statements they supply to part 3.
