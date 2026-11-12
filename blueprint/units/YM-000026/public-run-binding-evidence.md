# Native selection and same-family consumer binding

Draft, issue #26; session hairer-codex-existence-20261111. Source pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Prose:
`manuscript/existence/public-run-binding.tex`, `sec:public-run-binding`.
This is a bounded composition argument, not a global dependency certificate.
Reuse `public-binding-package-audit.md`; no alternate Roll witness is used.

## Exact source route

- `YM.Independent.constructionRun`, `Lean/YM/Independent/ConstructionRun.lean`:
  default dynamics and minted custody, garment10, positive b, simple G,
  trivial eventually-paid predicate; invokes the selector below with
  NativeComponentRecipe.Choice/available/floor/numeric and
  ActualRunNativeComponentRecipe.postnumeric. Returns R,T,W,penalty,Funded,Attached.
- `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`
  and its `_of_prediction` version,
  `Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean`:
  retains penalty, PostnumericPreselection, order/power inequalities, selected
  predicate, TreasuryFunded, CommonPeriodPurchase.Funded, Pillars, Funded and
  further receipts, all on the same R. The public wrapper discards standalone
  order/power, predicate, treasury and period fields. Prose retains them at
  this underlying selector call, not by projecting them from Funded.
- Same namespace `allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric`
  and `_of_prediction`, `Lean/YM/Integration/NativePreselectedPostnumericPeriodClock.lean`:
  `Orders := ⟨4,fun i=>6+i,fun i=>2+i,fun _=>100⟩`; fixed parameter support
  exponent=100 and separate budget exponent≥100. The original Sheet/quote
  are chosen before demand, blockFloor and lengths; actual lengths precede
  postnumeric cost. Native orders are lower bounds, not exact derivative
  order=6+i after profile enlargement. h100 uses params_eq and HStage.prices.
- `YM.Integration.ActualRunNativeComponentRecipe.{on_run,Attached,of_preselection}`,
  `Lean/YM/Integration/ActualRunNativeComponentRecipe.lean`: kernel, stage,
  lengths and sufficient horizon are obtained from the actual R.alloy.B.valid
  and R.alloy.B.plan. The floor inequality uses R.rolls.large. Realized is on
  R.family.path.levels and R.alloy.B.M, not another realization.
- `YM.Integration.NativeComponentRecipe.{Choice,available,floor,width,numeric,post,openBook_of_stagePaid,Realized,realize}`,
  `Lean/YM/Integration/NativeComponentRecipe.lean`: Choice comes from
  RG08.Flat.entrance_gate, Cast.assured, Aura.dual_support; floor is the
  maximum of flat/sworn/dual/Yamen.need/Redo.rail. Numeric is inverse width.
  Post is max(Redo.after,Yamen.shade) at actual lengths. Realize projects
  floors/costs, obtains OpenBook via log(exp) on the identical patch, flat
  Delay via Yamen.hatch/stamped, and applies the three original suppliers.
- `YM.Integration.NativeDiagonalClockRequest.PaidRequests`,
  `Lean/YM/Integration/NativeDiagonalClockRequest.lean`, and
  `YM.Integration.NativePostLengthPayment.StagePaid`,
  `Lean/YM/Integration/NativePostLengthPayment.lean`: the former has
  ∀E∃first∀m≥first∀j≤J(m+1) with |F E j|≤1+loglog(hatBeta m); the latter
  is ∀m,F(J(m+1))≤hatBeta m. They must not be interchanged at stage zero.

## Consumer map and retained hypotheses

In `Lean/YM/R2I/Campaign/Accepted.lean`, namespace
`YM.PhysicalNext.Repeat.Legato.R2I.Funded`:

- `gallery` and `coverage` evaluate `attentive` on literal
  `R.T R.tuning.receipts R.t R.accepts R.stories R.doors R.makes R.carries R.books`.
  Canonical proof: original-history-portfolio-attachment.tex; no duplicate
  derivation of service estimates here.
- `jewel` uses W, simple G and the retained same-run sky, locrian and wild inputs.
- `logPackage` uses W, poly, halo, same sky, silk, tic, fixed=100 and logCopy.
  The last clock tends to infinity by composing logCopy with the actual
  deep J. Canonical common-funded/common-observable/common-scale and
  ope-scale/ope-history chapters remain responsible for their estimates.
- `YM.R2IGoals.fromFunded` first takes the coupling extraction via
  PertExtension.Running.extraction, then R.extractible17 on that refinement.
  The selected Final, phase transport, reader and all endpoint properties
  share its table. The combined refinement is g.refine w. Coupling limits
  use Extraction.Order.retained; full mesh uses hJ.fullMesh through from_spec,
  not a conclusion from subsequence extraction alone. Trace uses H.gallery;
  mantle uses H.coverage. Separate OPE prescription quantifiers remain as
  in the endpoint; the prose does not identify all prescriptions.

The prose assumes the analytic interfaces of the canonical chapters and
only establishes identity and simultaneous retention. No new proof of
Pupil, actual reader comparisons, trace sensor/branch tasks, or a global
closure claim is made. NativeComponentRecipe explicitly does not itself
supply the full joint qlocal selection. Formal record names and discarded
wrapper fields remain in this blueprint rather than the mathematical text.

## Checks

Read exact declarations and definitions above using scoped rg/sed/cat;
read the existing five canonical chapters/audit and original-history
attachment. Literature treatment: elementary simultaneous witness retention,
monotonicity and preservation of limits; no external theorem replaces an
analytic supplier. No Lean edits or fresh Lean build/axiom replay.
Independent review and LaTeX integration pending.
