# Actual local reset reorganization — draft

Pinned source revision: 3456e5e75cf8d4cd558955a5c7638fba2d68f464. No source edits, fresh Lean build or axiom replay.

Inspected declarations, all below Lean/YM/AnalyticBridge/VERIFIED_RESET_STEP unless otherwise indicated:
- Projection.lean: `YM.AnalyticBridge.VerifiedReset.coeff_diagonal`, `coeff_bound`, `projection_diag`, `projection_bound`, `projection_eq`, `quad_moves`.
- Isotropy.lean: `YM.AnalyticBridge.VerifiedReset.Averaging.Projects.series`, `total_turn`, `isotropic`, `identity`, `delta_bound`.
- Residual.lean: `YM.AnalyticBridge.VerifiedReset.Residual.payout`, `rebate`, `fault`, `rebate_vanish`, `rebate_sup`, `fault_sup`; actual mask sign retained.
- Rows.lean, Quadratic.lean: `YM.AnalyticBridge.VerifiedReset.Low.live`, `home`, `plain`, `proxy`, `fresh`, `loan`, `fresh_bill`, `fresh_vanish`, `loan_bound`, `loans_identity`. Halo includes kept-row predicate.
- Geometry.lean: `YM.AnalyticBridge.VerifiedReset.Geo.enlarge`, `low_geometry`, `high_geometry`, `lower_budget`, `high_budget`, `rowCost_shape`, `low_vs`; low/high cover constants 85/9; enlarged support increment 81.
- Quotes.lean: `YM.AnalyticBridge.VerifiedReset.Quotes.enlarging`, `channel_mass`, `rows`; exponent +3 early, +1 hit; exact width conditions.
- Investor.lean: `YM.AnalyticBridge.VerifiedReset.Collection.regularNeed`, `hitNeed`, `softNeed`, `Local.quote_family`, `Local.renew`.
- Channels.lean: `YM.AnalyticBridge.VerifiedReset.true_base`, `allGoodPrice`, `sketch_sum`; signed average retained.
- Rewrites.lean: `YM.AnalyticBridge.VerifiedReset.Collection.Local.first_split`, `path_split`.
- Evaluation.lean: `YM.AnalyticBridge.VerifiedReset.Collection.Local.exponent`, `raw_evaluator`, `actual`.
- Inputs.lean, Payment.lean, Advance.lean: `YM.AnalyticBridge.VerifiedReset.Return.grants`, `records`, `catalog`, `settled`, `remainders`, `reset`. Recipe permission not inferred from equality.
- Lean/YM/UVNext/COUPLING_RESET/Regular.lean: `YM.UVNext.CouplingReset.preBound`, `Prereset.flat`, `Prereset.value_income`, `Prereset.income`.
- Precision.lean in the same directory: `YM.UVNext.CouplingReset.unmasked_precision`, `higher_estimate`, `late_cubic`, `pays_cubic`, `pays_surplus`.

Canonical reuse: local-splitting, soft-log-fusion, nonlinear-payment-selection, rg-multisource, selected-nonlinear-offering, coupling-reset-selection. Elementary finite-dimensional Hessian polarization, absolute sum rearrangement and masked algebra developed in the text; no external literature replacement invoked.

Retained frontier: common scale purchases, actual recipe permissions, upstream local channel derivative bounds and simple Lie algebra invariant bilinear form fact are used in their stated places. This is an actual reorganization/Prereset proof for that local return, not an independent Gaussian return supplier. Independent review pending. This file is not yet imported into the main manuscript.

Review repair: explicit natural order/power with p>=1, actual signed clover (StressFlux/Clover stencil and VERIFIED_RESET_STEP/Lines petals_deriv), Squares.analogue_pair/metric_test normalization c_direct I+S(0)^T S(0)=I, and uniform stage alphaBound from UVNext/Precision. Fixed missing TeX backslash.
