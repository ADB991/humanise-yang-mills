# Trace Medal prices and assembly

- Unit: YM-000026, selected-scale trace producer.
- Status: draft; the three scalar price conversions are proved. Constructor correspondence is recorded for navigation; construction of the Eve response record and Loader remains in progress in this trace workstream.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-medal-prices.tex`.

## Source crosswalk

| Mathematical statement | Fully qualified declaration | Pinned path |
| --- | --- | --- |
| Target rate exponent, goal and strict negative stop | `YM.ConnectedActivityE6.Target`, `.Target.goal` | `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/OptionCost.lean` |
| Cloud observable and its attenuation | `YM.PhysicalNext.Repeat.Blush.marvel` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Blush/Confetti.lean` |
| Uniform cloud mass price from poster-rate and attenuation | `YM.PhysicalNext.Repeat.Blush.fruition` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Blush/Little.lean` |
| Forced gas function | `YM.PhysicalNext.Repeat.Blush.glyph`, `.glyphpos` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Blush/Little.lean` |
| Tuition formula and rate bound | `YM.PhysicalNext.Repeat.Mercury.volt`, `.tuition`, `.tutored` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mercury/Assure.lean` |
| Record needed by the final Medal constructor | `YM.PhysicalNext.Repeat.Quince.Medal` | `Lean/YM/TraceExtension/Quince/Guild.lean` |
| Eventual construction and assembly of the Medal fields | `YM.PhysicalNext.Repeat.Quince.bairn`, `.decade`, `.fare_pr`, `.force_pr`, `.decorate` | `Lean/YM/TraceExtension/Quince/Bairn.lean`; `Guild.lean` |
| Eve field formulas and selected response record | `YM.PhysicalNext.Repeat.Cub.Eve`, `.logos` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Cub/Chant.lean` |
| Scales and chart producer used in the Loader | `YM.PhysicalNext.Repeat.Quince.Loader`, `.decade`; `YM.PhysicalNext.Repeat.Quince.scales_m`, `.fourrate` | `Lean/YM/TraceExtension/Quince/Guild.lean`; `Grade.lean`; `Dawn.lean` |

## Mathematical derivations

- The cloud estimate uses exactly `marvel = mass × exp(-ε·cover) × poster`. Since target stop is negative, the poster rate `q/4` is negative. Multiplying by the monitor factor therefore tends to zero; attenuation is at most one and the representation mass is nonnegative.
- The forced gas factor is `glyph = exp(-H^(1/5)/2)`. With `t=log log β`, `log H=t²` and `log β=e^t`; hence `log(χ·glyph)=t²/2-exp(t²/5)/2→-∞`. This proves the required positive-price bound after multiplication by the fixed door rate.
- Tuition multiplies a rate-zero power/price term, the inverse goal of rate `-q`, and `exp(-radiusB/2)`, which has every negative power rate. The product has any requested rate; choosing a negative one gives the priced eventual estimate.
- The source constructor `Quince.decorate` intersects the eventual outputs of `bairn`, `decade`, `fare_pr`, `force_pr`, and the `Mercury.tutored` price conversion, then fills the fields of `Medal`. This is a source-route note only; the manuscript deliberately proves the three scalar conversions and leaves its mathematical constructor proof to the continuation with the actual Eve and Loader records.

## Commands and remaining work

Read-only inspection used `rg -n` and `sed -n` on the listed files and immediate dependencies. No Lean or TeX build was run. `python3 scripts/check_blueprint.py` was run; the isolated clone lacks the parent-owned `blueprint/units/YM-000026/unit.json`, so the checker stops there. The next work is to translate the actual Eve producer (`bairn`, including its `tuned`, finite probe, scale-cap and cloud-billing argument) and then verify the selected Loader inputs without treating their declarations as proofs.
