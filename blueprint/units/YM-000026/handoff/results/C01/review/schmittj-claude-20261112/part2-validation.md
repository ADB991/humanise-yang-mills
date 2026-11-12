# C01 review, part 2: validation record

Worktree `/home/jo314/ym-wt/c01-review`, HEAD `165fb245460479233d9e9d3e9b9023ca10c49f54` (PR #81 head). Only this directory was written; `git status --short` at the end shows the new `blueprint/units/YM-000026/handoff/results/C01/review/` directory and nothing else.

## Hashes

`sha256sum manuscript/existence/{free-kernel-estimates,free-kernel-components,kernel-transport-identities}.tex` was run at the start and at the end of the review. Both times the result matched the coordinator's list `c01-hashes.txt` and `HANDOFF.md`:

| File | SHA-256 | Start | End |
| --- | --- | --- | --- |
| `manuscript/existence/free-kernel-estimates.tex` | `8c7528e3defd3f7f058ba99ab9dec3c33298217fc8f46a955e59bbab05b7126d` | match | match |
| `manuscript/existence/free-kernel-components.tex` | `3eeb13b7c5262a54cc601a6d0f0c2d3daebe729affdcec429e58e6827d376059` | match | match |
| `manuscript/existence/kernel-transport-identities.tex` | `07810547a07a90a3a2dd69b3bd1450bb9611e7419245a0c6c362dd58195ad41a` | match | match |

## Commands run

- `git log --oneline -1`; `git diff --stat 18d0327 HEAD`; `git diff 18d0327 HEAD -- manuscript/existence/{free-kernel-estimates,free-kernel-components,kernel-transport-identities}.tex` (all PR #81 changes in part 2 inspected).
- `wc -l` on the three chapters (725, 453, 277 lines, as stated in the brief).
- Read in full: the three chapters, `RESULTS.md`, `HANDOFF.md`, `VALIDATION.md`, `C01.md`, `free-kernel-estimates-evidence.md`, `free-kernel-components-evidence.md`, `correspondence.md` lines 630–665; for interfaces, `atlas-estimates.tex` lines 14–120 and 178–272, `rg-horizon-geometry.tex` lines 160–215 and 285–310, `curvature-horizon-producer.tex` lines 100–130 and 245–262.
- Lean source, read-only: `cat`/`sed -n` of `Lean/YM/Next/FREE_KERNELS/{Strands,Sprout,Wire,Primal,Glue}.lean` (in full), and parts of `{Signal,Scripts,Portions,Feed,Train,Bend,Heart,Pilot,MatrixPay,Moderate,AliasWeights,Chip,Lines,Ends,Cable,Buffer,Priced,Docked,Gear}.lean`, `Lean/YM/PREC/{Stacks,TreeMatch}.lean`, `Lean/YM/CellFourier/Circulant.lean`, `Lean/YM/Laurent/{Eval,Rune}.lean`, `Lean/YM/Work/F07/Read.lean`. A grep loop confirmed the declaration line of every name cited in the two evidence files and in the RESULTS rows for these chapters; all of them exist (`pearl` and `relay` are fields of `structure Secured`).
- LaTeX: built a scoped wrapper (the preamble of `manuscript/existence.tex` plus `lattice`, `atlas-estimates`, `flat-step`, `flat-estimate`, `free-kernel-estimates`, `free-kernel-components`, `kernel-transport-identities`) in the scratch directory with two passes of `TEXINPUTS=.:<scratch>: pdflatex -interaction=nonstopmode -output-directory=<scratch>` from `manuscript/`. Both passes exited 0 and produced 35 pages. The remaining undefined references (`ex-statement`, `sec:ex-lattice-rg-horizon-geometry`) point to chapters outside the wrapper and are not referenced from the part-2 chapters. `pdftotext` located the part-2 chapters on pages 16–35. Pages 22 and 24 were rendered with `pdftoppm -r 80` and inspected: branch identities, weight table and `thm:ex-lattice-wire-tower-strip` are readable. The `align*` at `free-kernel-estimates.tex` lines 536–541 renders with uneven alignment (NIT M7). Other pages were not visually inspected.
- No Lean build, elaboration or axiom check. No `scripts/check_blueprint.py` run (no blueprint unit record was changed). Nothing was posted, committed or pushed.

## Hand computations

The computations listed in `part2-mathematics.md` ("What was checked and found correct" and "PR #81 changes") were done by hand while reading. No computer algebra was used.
