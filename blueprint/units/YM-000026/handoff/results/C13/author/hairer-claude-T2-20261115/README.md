# Input (T) restated as the calibrated insertion receipt (#415, step 2a)

- **Session:** `hairer-claude-T2-20261115` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6886692978
- **Base:** #425's branch.

## Change

(T) in `subsec:rank-trace-chart-window` is now one receipt with four parts:

| Part | Content | Assumed until now in |
| --- | --- | --- |
| (T1) | low-grade reading: T is the low-grade reading of the actual polynomial map 𝓗 | "exact low-grade identity", `sec:allarity-cumulant-comparison` l. 66–81 |
| (T2) | tested estimate `eq:rank-common-tested` | `sec:allarity-coordinate-calibration` l. 216–223, `sec:actual-rank-purchases` |
| (T3) | primal bound \|𝓗u\| ≤ H\|Au\| and bounded degree | `sec:allarity-coordinate-calibration` l. 216–218 |
| (T4) | stamp: the terminal paid insertion bound | `sec:marked-healthy-cumulant-launch` l. 197–199; the (F5) stamp duty |

In the source all four come from one construction, `YM.Next.Rank.East.forge` (`StampDuty`: `head`, `lights : Heating`, `weight`, `coupon`) and `mintingSky`. See the audit `results/C13/endpoints/hairer-claude-T-20261114/`.

## Why T is not A

T = A_{k,N,p} would satisfy (T2) trivially, but not (T1). The free cumulant comparison needs the readout to be the exact low-grade reading of the insertions that are actually integrated. The analytic content is therefore the pin: |A v − Λ(𝓗v)| ≤ ½|A v|, where Λ is the low-grade reading. In the source this is `MarkedStart` clause 4 together with `pins`.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
