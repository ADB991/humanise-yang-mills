# C07 review, part 2: validation record

All commands were run in the worktree `/home/jo314/ym-wt/c07-review` (HEAD `e058a61`), read-only, except for writing this output directory.

## Revision and diff

- `git log --oneline -3`: HEAD `e058a61` (Merge PR #108), containing PR #96 author commit `9f8fa0b`.
- `git diff --stat 9f8fa0b~1 9f8fa0b`: 18 files, 763 insertions, 72 deletions. In this part: `compensated-variation.tex` (+14/−4) and `gaussian-differentiation.tex` (+6).
- `git diff 9f8fa0b~1 9f8fa0b -- manuscript/existence/compensated-variation.tex manuscript/existence/gaussian-differentiation.tex`: read in full.

## Chapter hashes

`sha256sum manuscript/existence/{haar-chart,normalization-jets,compensated-variation,mean-action-jets,remote-action-jets,gaussian-differentiation,gaussian-moment-prices}.tex`, run at the start and again at the end of the review:

```
fecd73018a272af1ee6d9245f38d01fc5fc4e71ac343bae684a38e449ff67a05  manuscript/existence/haar-chart.tex
b09f9c2e47a94e33af1c9bc040a01eff22715aeb8a8aaf237d83099e6a955a96  manuscript/existence/normalization-jets.tex
262867e206fc946aa5c7e603a69f1d78a6af2d1176c959a97503627c61296ad2  manuscript/existence/compensated-variation.tex
eb8d4daa19846b281a483d178a0df2a6157c30033c08e05923de39d0b2552db3  manuscript/existence/mean-action-jets.tex
7313d950f675b0141964a8d0eb932a08eeedb3849a168303e3e2fe3731bd267b  manuscript/existence/remote-action-jets.tex
c3ef7b5efd3824e2cbf37fb09433fac8af98f6be474b9e4c9b7c1fff01f27f12  manuscript/existence/gaussian-differentiation.tex
1af91c12763673d51ec84b07d2719babf0552eeaad1e2345b0c9acdc1f3b0d16  manuscript/existence/gaussian-moment-prices.tex
```

All seven match the coordinator's list `c07-hashes.txt` (scratchpad), both at the start and at the end. They also match the author's `review-index.md`.

## Cross-reference check

- I extracted every `\ref`/`\eqref` target from the seven chapters (52 distinct labels) and searched `manuscript/` for the matching `\label`. All 52 resolve. The include order in `manuscript/existence.tex` (lines 93–117) places `gaussian-warnings`, `packet-annulus` and `local-mean` before the seven chapters, and `packet-estimates` between `remote-action-jets` and `gaussian-differentiation`. There are no unresolved forward references.

## Lean source inspection (read-only)

- `grep`/`sed` on `Lean/YM/Gauge/Chart.lean`, `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/{Eider,Pommel,Polar,Steam,Afresh,Brushhold,Interpolate,Castro,Rainbowline,Tint,Impasto,Hallmark,Caps,Coat,Orin,Meristem,Plise,Jac}.lean`, `Lean/YM/Pressure/Seeds.lean`, `Lean/YM/Push/SECTOR_MEASURE/Profile.lean`, `Lean/YM/PCalc/Loop.lean` and `Lean/YM/LocalH/Haar.lean` to read the declarations listed in `part2-lean.md`. Namespaces were confirmed from the `namespace`/`end` lines of each file.

## Not run

- No LaTeX build (no manuscript change by this reviewer).
- No `lake build`, Lean elaboration or axiom check.
- `python3 scripts/check_blueprint.py` was not run (no blueprint record was changed; this directory holds review notes only).
