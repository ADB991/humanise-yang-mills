# Actual Wilson startup construction — draft

Pinned revision 3456e5e75cf8d4cd558955a5c7638fba2d68f464. No Lean changes, build or axiom replay. Read targeted declarations and immediate dependencies with cat/sed/rg on 2026-11-12.

Source cluster, all in Lean/YM/Extra/WILSON_STARTUP unless specified:
- Curvature.lean, YM.WilsonStartup.localK_derivative, recover_left/right, inK_low/even/conjugate, fourth, convert_taylor, surplus_jet: actual curvature coordinate Taylor expansion.
- Taylor.lean FlatAt.bound/uniform_flat_price/partial_zero and Residual.lean Quad.jet_flat/reconstruct_flat/unscaled_bound/small_jet: compact-parameter left-derivative estimate. Face.lean residual_price/regular/flat/hess/send transfers to actual wrapped plaquettes, normalized directions and all finite orders.
- Design.lean YM.WilsonStartup.Design.top, ell_sq, normal, budgets, core_top, principal_top; Metric.lean bound_arbitrary and Match.lean readiness/match_top/peak: finite terminal path, direct metric and quartic Wilson jet matching. This chapter proves the terminal path only; changing a preceding stationary plan uses the separate Engine/OnShell/TopStep argument (inspected, not claimed analytically closed by startup).
- Ownership.lean Decent, due, due_large/range/eq, Key.owed_zero/reads; Channels.lean channel_split. Exact local nonnegative debts, signed-frame support/native-site conventions.
- Packets.lean pad, region, parts, charge_sum/range/price/final: actual flags' 2B-ball components, disjoint territory, energetic count |D|<=4|A|.
- Labels.lean Start.dictionary/payload/paid/forcedFamily/moves, Ink.lean regularFamily/accrual_fit/ink/written_sum: exact regular residual and forced entries, symmetry/gauge/jet conditions, per-anchor price.
- Gas.lean Start.active_reconstruct/registered/issues/gas_raw/evaluates: unique actual partition of flags; exact Wilson density.
- Funds.lean Start.PacketCost.coins/hit, Loan.certificate/buys/little/kernel. Connected-support estimate is already proved in canonical ope-grouping.tex, eq:ope-forest-price; application checked with elementary supports pad and spare exponent 1. All common majorants independent of beta on band.
- Clock.lean YM.WilsonStartup.Timing.M/temp/normE/normK/balls/quota, afford/cut/loan/enough. All-stage numerical bounds and explicit asymptotic choices.
- Lean/YM/Further/STRONG_STARTUP_CREDIT/Reserve.lean YM.Further.StrongStartup.seedRate/deep/preReserve and Pricing.lean shelves/before/prices/spending: additional support reserve, stronger M² forcing, pre-realization stage thresholds. General marker and bond-fuel suppliers retained for later service production; this chapter does not infer them from startup alone.
- Curve.lean Start.paid_dist/differenceE/curve/posed: actual fixed-address band continuity.
- Cake.lean Start.digests/oust; Lean/YM/Planned/RECIPE_STARTUP_PORT/Layout.lean YM.Planned.Port.card; Lean/YM/PhysicalNext/SERVICE/Mixer.lean YM.PhysicalNext.Service.origins; Lean/YM/Progress/DIRECTED_RECIPE/Bands.lean Menu.starts; Lean/YM/AnalyticBridge/VERIFIED_RESET_STEP/Downstream.lean Use.from_menu: density and price preservation through fixed packing/grouping, initial curve, actual retained/Starter relation for default permissions.

This supplies the terminal vacuum Origins frontier identified in common-funded-history review, relative to actual revised terminal path. Further single/multiple source startup price production and stationary terminal replacement are distinct dependencies. No external literature shortcut used: elementary local inverse/Taylor and finite connected-support arguments are written directly or reference the existing canonical proof. Independent review requested; not yet integrated.
