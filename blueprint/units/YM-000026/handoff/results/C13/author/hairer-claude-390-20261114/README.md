# #390: corrected leading budget for the allarity recurrence (author note)

- Session: `hairer-claude-390-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/390#issuecomment-6879458799
- Base: stacked on #389 → #387 → `codex/existence-monograph` @ `3166276`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. It needs an independent review by an account other than `hairer`.

## Output

New `subsec:allarity-corrected-budget`, appended at the end of `manuscript/existence/allarity-marked-propagation.tex`. It contains:
- **Reference factor commutes:** exp_*(−D_R) has field-independent coefficients and commutes with every push. So the leading family is D_Q − D_R.
- **`lem:allarity-log-lipschitz`:** ‖log_*(1+X) − log_*(1+X′)‖₁ ≤ ‖X−X′‖₁ Σ_{j≤n} μ^{j−1}.
- **`lem:allarity-corrected-pieces`:** from (M) the moment comparison ≤ H^{−3/2} and (V) the value comparison ≤ H^{−3/2}, the corrected pieces are ≤ H^{−31/32}, and the weighted budget is h = 2ⁿR_e H^{−27/32}.
- **`lem:allarity-upper-retuned`:** the upper calculation with Y = 3T_e c H^{−27/32} in place of H^{−3} gives the same three outputs.
- **`lem:allarity-forced-retuned`:** δ = H^{−1/2} with Z = Y. The purchases `eq:allarity-retuned-purchases` hold eventually (log log s ≥ 36), and the recurrence's conclusions are unchanged.
- **Status:** (M) and (V) remain open inputs. A remark records the possible structural simplification (launch at ℓ) without resolving it.

## Correspondence (textual)

| Manuscript | Source |
|---|---|
| (M) | `Atlas.sizesXSky` (`Prom/Front/West/Mooncake.lean:21`): ‖Answer(…).part q − maxProfile(tested…).part q‖ ≤ bill(−3/2, β̂_k), from `Heating`, `BellSky`, `Wind`, `passingX`, `Meridian` |
| Lipschitz step | `BalconSky.mind` (`Prom/Front/West/Equity.lean:43`), stated as a field (hypothesis) in the source. Here it is proved |
| (V) | `ChastSky`'s `h4`/`hh` in `x_crushedSky` (`Equity.lean:46–68`) |
| corrected budget H^{−31/32} | `warmingSky.hU` (`Prom/Hill/TableGate.lean:34`); the weight aperture ≤ bill(1/8) |
| reference factor | `Read.cylinder D a = Poly.pass(−D) * bareP a` (`Next/RANK/Finite.lean:99`) |

## Uncertainties

- In the source, (V)'s error slot is shared with the Lipschitz slack: ‖C0 − f‖ + H^{−3/2} ≤ H^{−31/32}. I treated it as a separate H^{−3/2} bound.
- I did not check against the source that "the leading family of the upper calculation" is exactly the corrected D_Q − D_R at every leading rung, as opposed to only at the launch level ℓ (see the remark).

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex` (on top of #389): exit 0, 1048 pages, 0 undefined references. pp. 796–798 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.

## Revision (reuse of canonical units)

I found that `sec:allarity-cumulant-comparison` already proves:
- the moment error ≤ H^{−3/2} (`eq:allarity-moment-error` with its scale powers);
- the finite-logarithm stability and corrected cumulant bound (`eq:allarity-cumulant-error`, ≤ H^{−31/32}).

I also found that `sec:marked-healthy-cumulant-launch` proves the healthy local error ≤ H^{−3/2} (the former input (V)).

Following AGENTS.md (reuse canonical proof units), the following changes were made:
- `lem:allarity-log-lipschitz` and the inputs (M)/(V) are removed;
- `lem:allarity-corrected-pieces` now cites those results;
- the status paragraph lists their hypotheses as the remaining inputs:
  - the reader covariance and vertex bounds at ξ = ε = H^{−2};
  - the low-grade calibration;
  - the mixed compiler's row and covariance comparison;
  - the terminal paid insertion bound;
  - the common purchases.

Rebuilt: exit 0, 1048 pages, 0 undefined references; pp. 796–797 inspected.

## Errata after review #409 (session hairer-claude-409resp-20261114)

- `h4`/`hh` are local proof variables in `x_crushedSky`. The declaration supplying one common background per cell is `YM.Next.Rank.Tapes.West.ChastSky`.
- `hU` is an argument of `YM.Next.Rank.Peak.warmingSky`, not a declaration `warmingSky.hU`. Its second hypothesis `hV` (reference coefficients ≤ H^{1/4}) was missing from this record.
- The finding posted on #375 that the leading family is never priced at H^{−4} was too broad. The source prices it at H^{−4} on the upper interval at the smaller weight `loot` (`divySky`) and launches the corrected invoice once at the middle level.
- `lem:allarity-upper-retuned` and `lem:allarity-forced-retuned` are withdrawn. The corrected budget is used only at the launch (`subsec:allarity-corrected-budget`, now 'The launch at the middle level'). The failed-mask and weight-change purchases are the stated input (L) (source `Shift.fail`, `Dock.grant`, `Peak.Meter`).
