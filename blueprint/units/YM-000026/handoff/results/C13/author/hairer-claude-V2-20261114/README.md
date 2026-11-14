# Input (V): steps across a stage boundary (#417, step 2)

- **Session:** `hairer-claude-V2-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/417#issuecomment-6884166455
- **Base:** #420's branch (stacked on #411). **Pin:** `3456e5e`.

## Established

- **(V2) and (V3) were already in the manuscript.** The support exponent is exactly 100 at every stage (`sec:ope-scale-purchases`, which already notes that constant exponents satisfy the monotonicity requirement). The funded history purchases, at every stage j, the transitions to the adjacent target stage j or j−1 (`sec:common-funded-history`, "The order of the choices").
- **(V1).** New `subsec:restart-stage-boundary` with `lem:restart-stage-boundary`, appended at the end of `restarted-rank-history.tex`, a file of another author; no existing text is changed. It lists the data a step uses: the fine representation, the block side L_{J(m+1)}, the purchased local bounds for the pair (J(m+1), J(m)), and the level-dependent threshold and radius. The output is described by the same data at the coarse level, with no reference to the fine stage. So the induction passes across a stage boundary, with the numerical thresholds taken as the maximum over the two block ratios.
- **Input (V) removed.** It is no longer an input of `prop:rank-trace-chart-window`; the block-ratio paragraph cites the lemma.

Source counterpart: `ShowHoursSky.flash` (`PostsSky (J(i+1)) (J(i))`), `adaptive` (`Lease`), `Calendar.deepExp`.

## Uncertain

- The list of data a step uses is read from the text of `sec:restarted-rank-history`. If the "purchased local bounds" also depend on stage profile data that is carried to the next step (for example the clip or the column count of the representation), that would need to be added. These are the (F3) representation items, which are still open on #398.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
