# Local paid budgets and threshold selection

- Unit: YM-000026, selected-scale trace producer.
- Status: draft; two elementary selection arguments are proved. The primary, regular, and forced local atom estimates remain explicit analytic inputs.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-local-paid-budgets.tex`.

## Source crosswalk

| Mathematical content | Exact declaration and path | Checked correspondence and remaining status |
| --- | --- | --- |
| Positive local budget choice | `YM.PhysicalNext.Repeat.Quince.foton`, `Lean/YM/TraceExtension/Quince/Cache.lean` | The finite probe family is `Local.tests`; the costs are the probe variation coefficient, regular-cost, large-support-cost, and primary-cost inequalities. The displayed choice (v=y/(2B)), (u=(1+sum q_\tau)v) proves all four at once. |
| Uniform stage thresholds | `YM.PhysicalNext.Repeat.Quince.parliament`, `YM.Push.PriceCompiler.eventually_transitions`, `YM.PhysicalNext.Repeat.Quince.decorate`, `YM.Push.PriceCompiler.collect_upper`; `Lean/YM/TraceExtension/Quince/Soot.lean`, `Guild.lean`, and `Lean/YM/Push/PRICE_COMPILER/Basic.lean` | At fixed stage (j), only `StepStages j i` indices occur (the same stage and its predecessor); the coefficient degrees lie in `Finset.range j`. Thus the eventual Medal conclusions intersect over finite sets. `eventually_transitions` reduces the stage-index quantifier to those two cases, and `collect_upper` replaces all stagewise thresholds by a monotone prefix maximum dominating the previous threshold. |
| Bunk inequalities used by the atom estimates | `YM.PhysicalNext.Repeat.Quince.Bunk`, `Lean/YM/TraceExtension/Quince/Cache.lean` | The four inequalities in the manuscript are exactly the fields `cycle`, `reg`, `huge`, and `main`, with (q_\tau) the displayed `chief` value. `foton` chooses the two strictly positive budgets. |
| Medal inputs and actual Stepper route | `YM.PhysicalNext.Repeat.Quince.Cashbox`, `.mosaic`, `.primaryT`, `.salaryT`, `.gasT`; `Soot.lean`, `Kiosk.lean`, `Harvest.lean`, `Soil.lean`, `Gas.lean` | The selected local `Stepper` is assembled by `Cashbox` from the same-transition `mosaic`. Its basis, regular, and forced fields are established by `primaryT`, `salaryT`, and `gasT`. `mosaic` requires the `Bunk` and `Medal` data, scale geometry, and history hypotheses. This unit proves the budget/tail threshold selection only; it does not reproduce those three local-card proofs. |
| Medal construction estimates | `YM.PhysicalNext.Repeat.Quince.decorate`, `Lean/YM/TraceExtension/Quince/Guild.lean` | The eventual Medal is obtained by intersecting the component estimates `bairn`, `decade`, `fare_pr`, `force_pr`, and `sprited`; their quantitative hypotheses are listed in the declaration. The finite intersection is source-checked, while those component estimates remain assigned upstream proof obligations. |

## Checks and open obligations

- Read-only inspection: `sed -n` on `Cache.lean`, `Guild.lean`, `Soot.lean`, `Kiosk.lean`, `Harvest.lean`, `Soil.lean`, `Gas.lean`, and `Push/PRICE_COMPILER/Basic.lean`; `rg -n` locating the exact declarations and callers.
- `python3 scripts/check_blueprint.py` cannot run successfully in this isolated clone because `blueprint/units/YM-000026/unit.json` is absent; parent integration owns shared unit metadata.
- No Lean source was edited; no Lean or TeX build was run.
- Remaining substantial estimates: `primaryT`, `salaryT`, and `gasT`'s local-card derivations and the five component estimates feeding `decorate`. These are not implied by the budget/threshold lemmas.
