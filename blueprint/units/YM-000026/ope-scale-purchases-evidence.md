# OPE scale purchases — source crosswalk

Source revision 3456e5e75cf8d4cd558955a5c7638fba2d68f464. Parent draft; independent review pending.

The final public selection uses constant support exponent 100 (not the simpler Ariva profile 100+j). Source: YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction, Lean/YM/Integration/NativePreselectedPostnumericPeriodClock.lean; Orders=(4,6+j,2+j,100), WithStage preserves prices, h100 obtained by params_eq. Actual increased orders may be maxed by supplier; no assertion of exact final orders.

(O1): YM.OPE.haloUnits, HaloGate, halo_feasible, halo_delay, Lean/YM/OPE/Rough/Gate.lean. B(x)=ceil(log²x), next x=c_G log L+x, haloUnits=(1+L(B+B'+1)^2)^4, fine support+1.
(O2): YM.PhysicalNext.Repeat.Legato.Flick, flickDelay, Lean/YM/RG17/Feather.lean.
(O3): YM.OPE.Log.OnBudget, aux_delay, Lean/YM/OPE/Log/Plans.lean, both adjacent columns with StepStages j or j-1.
(O4–6): YM.OPE.Therm.Offstage, offstage_willing, Poetry, poetry_delay, Lean/YM/OPE/Therm/Request.lean; full Vac.fiat formula from Lean/YM/Vac/Treasury.lean. Width and linear denominators positive by Stage definitions; D_G=real Mat dimension. Statement uses actual source PlaqAxes cardinal, not a guessed factor6 or12.
(O7–9): YM.OPE.Therm.ember_mul, curtain, shelter, same Request.lean. Elementary proofs written out; no substantive external theorem needed.

Purchase order: after Rolls but before Wait.engine; halo→flick→poetry→native numerical/treasury/period→aux→silk/custody→other existing delays; monotone compositions preserve all estimates. Canonical common-scale-selection proves realization. This chapter does not by itself prove the analytic OPE Services/LogPackage/trace receipts. Targeted source reads only; no Lean build/axiom replay. LaTeX checks await integration.
