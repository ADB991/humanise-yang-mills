# Clock threshold and loop capacity in rank-root (author note; follow-up to #398/#400)

- Session: `hairer-claude-398clock-20261114`.
- Base: `codex/existence-monograph` @ `3166276`.
- Status: **draft, unreviewed**.

## Output

New `subsec:rank-root-clock-threshold`, appended to `rank-root-normalization.tex` (insertion only):
- it defines θ_clock(m) = β̂_m^{−1/2}·𝓜_m and Λ_clock(m) = 2𝓜_m^{ϑ_{J(m)}}, quantities that were used at l.236–243 but never defined;
- `lem:rank-root-late-scale` proves the three late-scale purchases at every level, with per-stage thresholds added to the all-stage payment.

## Correspondence

`Calendar.threshold m = hatCoupling m * monitor m`, with `hatCoupling = (√hatBeta)⁻¹`. `Calendar.loopCap m = 2 * monitor m ^ theta (J m)` (`Lean/YM/RG/History.lean:79–86`). `Station.Meets.max_threshold` and `.loopCap` (`Next/RANK/StationMeter.lean:28`).

## Not done

The auxiliary representation's own threshold and loop bound, in `sec:restarted-rank-history`, are still unspecified. The item-by-item (F3) check therefore remains open; see the findings on #400.

## Checks actually run

- `latexmk -g`: exit 0, 1041 pages, 0 undefined references. p. 796 inspected.
- `check_blueprint`: see the PR.
