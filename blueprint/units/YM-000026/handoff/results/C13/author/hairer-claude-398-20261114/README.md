# #398: rank-test history and readout on the trace chart window (author note)

- Session: `hairer-claude-398-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/398#issuecomment-6880001901
- Base: stacked on #397 → #395 → #393 (cites `lem:ex-lattice-firesky-clock-fields`).
- Status: **draft, unreviewed**.

## Output

New `subsec:rank-trace-chart-window` at the end of `manuscript/existence/actual-rank-purchases.tex` (insertion only). It contains:
- **Input (R):** the running estimate of `sec:surviving-interval-shooting` with slope matched to s_G, in the form |β − β̂| ≤ |β̄ − β_*| + η s_m.
- **`lem:rank-trace-endpoint`:** |β_{N,p,k} − β̂_k| ≤ β̂_k/8 eventually.
- **`prop:rank-trace-chart-window`:** at every large level and arc b ≤ b̄:
  - For (F3), the constant-coupling auxiliary history of `sec:restarted-rank-history` on [w, k], with costs ≤ s^{−1/400} and β ≤ 4β̂_j;
  - For (F5), the readout with `eq:rank-common-tested`, eventually in N uniformly in p.

  The proof covers three points:
  - **Window:** the length is k − w ≤ y⁴, and the restarted construction uses its length only through n ≤ h ≤ y⁴.
  - **Block ratios:** at most two ratios occur (bracket), so the constants are taken as a maximum over them.
  - **Levels:** the stage thresholds go into the all-stage payment, so the conclusions hold at all large k rather than only at unboundedly many levels.
- **Status:** the proposition assumes (R) and the section's existing local inputs. For (F3), the stage clip and row bound, budget radius and prescribed threshold, and the bounds θ(P_j) ≤ θ_clock(j), Λ(P_j) ≤ Λ_clock(j) and δ(P_j) ≤ 1 remain to be verified. For (F5), the stamp duty must still be proved for the same tested readout.

## Correspondence (textual)

| Manuscript | Source |
|---|---|
| (R) and the endpoint bound | `follows_prices` (`AFTERNOON_INTERACTING_RANK_COMPARISON/Leashes.lean:48`) from `M.wilson.running` |
| (F3) | `NylonSky.use_` → `Novice` from `embroideredSky`/`thicketSky` |
| (F5) | `PoisedSky.charts` (`Charting`/`Tested`), from `mintingSky` in `stagingSky` |
| the restarted history's two-part window h₁, h₂ | `middleSky`/`widthSky`, where h₁ uses (b+2)y² and h₂ uses log(M_s¹⁰), M_s = coverSize |

## Checks actually run

- `latexmk -g … existence.tex` (stacked): exit 0, 1045 pages, 0 undefined references. pp. 861–862 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
