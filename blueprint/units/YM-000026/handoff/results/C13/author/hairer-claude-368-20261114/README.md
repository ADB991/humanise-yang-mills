# #368: the auxiliary chartlet meets the C09 comparison hypotheses (S1 of #323)

- **Session:** `hairer-claude-368-20261114`
- **Contributor:** hairer (C13 owner), assisted by Claude (Opus 5.5).
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/368#issuecomment-6874162226>

This is draft author work. It needs an independent check by an account other than hairer.

## What changed

Only `manuscript/existence/selected-history-limits.tex` changed:
- a new `lem:selected-chartlet-matching`, placed after the matching paragraph amended in #369;
- one sentence in that paragraph pointing to the lemma.

## Result

The lemma reduces S1 to an input that already exists: the **auxiliary stationary-service input** of `sec:selected-nonlinear-offering` (l.300–315; stationary service on the auxiliary datum, branch identification and thermal transfer). Every other local hypothesis of `sec:activity-jet-assembly` and `sec:parameter-comparison-suppliers` is supplied for the chartlet:

| Hypothesis (C09) | Supplier |
| --- | --- |
| incoming activity budgets | zero array, so zero regular and forced cost (offering l.83–95) |
| sector, shell access, kernel bounds | same block bridge and paths; all-period kernel bounds on every auxiliary torus (offering l.83–99) |
| safety and plateau warnings | `sec:gaussian-warnings`, produced in `sec:warning-safety`; independent of the activity array |
| protected chart | `sec:uniform-stationary-chart`, identified with the plan graph by the assumed branch identification |
| renewed prices, downward map, initial action | zero costs plus fine path and clock bounds; kernel bounds; bare path action |
| preExponent/B ≤ width/2 | `eq:selected-offer-width`: A_c/B_c ≤ σ_c/4 |
| same clipping, path and dictionaries; output identification | identity label identification; output of the local expansion |
| healthy tested supports | not a property of the representation; a premise of `sec:activity-jet-assembly` for each tested family, retained |

## Source correspondence

`Blaze.March.patrol` (`FullVolume/E6/Gest.lean` l.55) produces a `Station` for every `Cash` at the stage coupling. The chartlet `(H n).tiers s (U n)` is a `Cash` on `Pane.orchestra` (`Blue.lean` l.32), and `swaths`/`deposits` (`Auvi/Lands.lean` l.56–75) apply it to that chartlet. So in the source, S1 needs no separate matching.

The manuscript's extra condition, the auxiliary stationary service, corresponds to the stationary inputs threaded through `Jams.Wild` ← `supplies` ← `herds`/`safari` (`Auvi/Entries.lean`). Audit #325 recorded these as D7, "supplied conditionally" (`herds` keeps `supportExponent + 3 < exp`).

## Checks

- `latexmk … existence.tex`: exit 0, 1033 pages, no undefined references. Pages 799–800 inspected.
- `check_blueprint.py`: see PR.
