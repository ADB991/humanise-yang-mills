# (F3) at the output level (#398)

- **Session:** `hairer-claude-F3-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/398#issuecomment-6884423448
- **Base:** #422's branch. **Pin:** `3456e5e`.

## Established

`prop:rank-trace-output-lawful`: the auxiliary representation P_w at the root depth meets every supposition of `prop:rank-root-output-ticket`(2). That is where the propagation actually uses (F3).

- **Lawful.** Locality, gauge invariance and motion covariance come from `sec:restarted-rank-history`. The density is nonnegative, as a positive push.
- **g ≤ θ_{P_w} ≤ 1 and β ≤ 4β̂_w.** These use β ≥ 7β̂_k/8 (`lem:rank-trace-endpoint`) and the plateau.
- **θ_{P_w} ≤ θ_clock(w)**, since exp(y^{3/2}) ≤ exp(y²) for y ≥ 1.
- **Λ ≤ Λ_clock(w), clip p_w, row price A_w.** The auxiliary history retains the selected path R_{N,w}, which is admissible (`def:path-admissible`, `prop:path-retained-plan`): Bounds(p_w, σ_w, A_w, loopCap_w), and loopCap_w = Λ_clock(w) with ϑ = θ.
- **δ ≤ 1.** The additive value per site is ≤ q_n ≤ s^{−1/400}.

## Assumed

- The auxiliary representation carries the (F3) threshold β̂^{−1/2} exp((log log β̂)^{3/2}). In the source this is `Novice.threshold`.
- The profiles have 0 < c_lin < c_dir/16.
- (U) "The auxiliary history retains the coarse path action of the selected history" reads the phrase "retained coarse path action" of `restarted-rank-history.tex` l. 93 as R_{N,j}.

## Not needed

The (F3) budget radius ⌈(log β̂_j)²⌉² is not used by the normalization estimate. It matters only for the source's interface (`CeremonySky.birth`).

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.

## Follow-up to the reviews of #425 (2026-11-15)

The reviews of d77a01a and f116af7 raised two points. I agree with both.

1. **The same retained clipped path.** The admissibility of R_{N,w} in the selected history is stated at that history's coupling. The proposition now assumes an explicit path-and-clip receipt (P). Under (P), the coarse path action of P_w in the restarted representation is R_{N,w} evaluated at the constant coupling β_{N,p,k}, it satisfies the clipped bounds there with clip p_w and row price A_w, and the tests of that clip are compatible with θ_{P_w}. The Paths step of the proof now cites (P) and no longer uses the retained-plan bounds alone.
2. **No extrapolation to j = k.** The conclusion concerns the output level w only. The Status paragraph says that intermediate levels w < j < k would need (P) and the threshold window at j. The endpoint j = k is the actual, unrestarted representation and would need a separate check. Neither is used.

The branch was merged with the updated #422 branch (bbda7644).

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`.
