# The running estimate (R) on the chart window (#419)

- **Session:** `hairer-claude-R-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/419#issuecomment-6883570454
- **Base:** #411's branch. **Pin:** `3456e5e`.

## Established

`lem:rank-trace-running`: |β_{N,p,m} − β̂_m| ≤ c_R + η s_m for m ≥ m₀(η), uniformly in N ≥ m and p, where c_R = |b − β̄| + |β̄ − β_*|. The proof applies `eq:shoot-running-error` and the drift condition of `sec:surviving-interval-shooting` on the selected schedule. The identifications L_i = L_{J(i+1)} and ε_{i+1} = ε_{J(i+1)} are recorded in `sec:common-scale-selection`, and S_i = s_i because s₀ = 0.

`lem:rank-trace-endpoint` now follows without the assumption (R). The assumption is removed from `prop:rank-trace-chart-window` and its status paragraph.

**The slope.** The trace chart needs only the clock slope s_G, which is the shooting slope by definition. Identifying s_G with 2b₀(G) is needed for the public running consequence (`public-run-binding.tex`, `symbolic-index.tex`), not for (G3). So the earlier wording "(R) with slope matched to 2b₀" over-stated what the chart needs.

## Correspondence (textual)

- Source running estimate: `YM.RG.History.Running`, `Selected.running` (`Lean/YM/RG/History.lean:229,240`). It is relative to the clock intercept. The manuscript allows the constant c_R, which the endpoint lemma absorbs.
- Endpoint: `YM.PhysicalNext.InteractingRank.follows_prices` (`Leashes.lean:48`).

## Uncertain

- That the couplings β_{N,p,m} of `sec:actual-rank-purchases` are those of the shooting histories selected in `sec:common-funded-history`. This is the evident reading, but the notation is not cross-referenced there.
- The bound |b − β̄| ≤ β̄/2 is the shooting construction's condition on the prescribed level-zero coupling.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- The rendered lemma was inspected.
- `python3 scripts/check_blueprint.py`.
