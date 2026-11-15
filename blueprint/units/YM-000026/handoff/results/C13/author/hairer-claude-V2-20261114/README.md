# Input (V): steps across a stage boundary (#417, step 2)

- **Session:** `hairer-claude-V2-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/417#issuecomment-6884166455
- **Base:** #420's branch (stacked on #411). **Pin:** `3456e5e`.

## Established

- **(V2) and (V3) were already in the manuscript.** The support exponent is exactly 100 at every stage (`sec:ope-scale-purchases`, which already notes that constant exponents satisfy the monotonicity requirement). The funded history purchases, at every stage j, the transitions to the adjacent target stage j or j−1 (`sec:common-funded-history`, "The order of the choices").
- **(V1).** New `subsec:restart-stage-boundary` with `lem:restart-stage-boundary`, appended at the end of `restarted-rank-history.tex`, a file of another author; no existing text is changed. It lists the data a step uses: the fine representation, the block side L_{J(m+1)}, the purchased local bounds for the pair (J(m+1), J(m)), and the level-dependent threshold and radius. The output is described by the same data at the coarse level, with no reference to the fine stage. So the induction passes across a stage boundary, with the numerical thresholds taken as the maximum over the two block ratios.
- **Input (V) removed** in the first version. This was withdrawn after review; see below.

Source counterpart: `ShowHoursSky.flash` (`PostsSky (J(i+1)) (J(i))`), `adaptive` (`Lease`), `Calendar.deepExp`.

## Uncertain

- The list of data a step uses is read from the text of `sec:restarted-rank-history`. If the "purchased local bounds" also depend on stage profile data that is carried to the next step (for example the clip or the column count of the representation), that would need to be added. These are the (F3) representation items, which are still open on #398.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.

## Follow-up to the review of #422 (2026-11-15)

The review (of 2f4f021) found that the lemma assumed local bounds for the actual profile pair and attributed them to `sec:common-funded-history` without a matching supplier. That section purchases the selected-history reset. The restarted step uses a fixed coupling and new multiplier letters, with its own clips, budget and support data. I agree with this finding, and the earlier "Uncertain" item above was the same gap.

Changes:
- `subsec:restart-stage-boundary` now states three hypotheses for the restarted step at its stage pair: (V1) component bounds, with the unmarked allowance at most δ_n − ω_n outside the multiplier letters; (V2) the path correction, with cost at most s^{−1/200}; (V3) reassembly and forced exclusion with addresswise forced activities. `lem:restart-stage-boundary` proves only the numerical passage across the boundary under (V1)–(V3) at every step. The closing paragraph says that the funded-history purchases and the common support exponent do not supply them.
- **(V) is retained** in `actual-rank-purchases.tex` as an input of `prop:rank-trace-chart-window`, now stated as (V1)–(V3) at every restarted step of the window.
- The branch was merged with `codex/existence-monograph` (after #430, #411, #414, #421). The conflict in `actual-rank-purchases.tex` was resolved by keeping the monograph's (V) clauses.

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`.
