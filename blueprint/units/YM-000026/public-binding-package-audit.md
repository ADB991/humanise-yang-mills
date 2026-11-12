# Public run and common-hypothesis binding audit

- Unit: YM-000026, issue #26.
- Status: source/canonical-prose audit; no new proof chapter.
- Imported Lean source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Parent manuscript snapshot read-only: `codex/existence-monograph` at `a2353123c27d800b4ea92a1cf62ad645d94e91fe`.
- Scope: compare the legacy Roll chain with the public native selector and check its joins to the common-funded, common-observable, common-scale, and OPE-history chapters.
- Permitted output: this audit only. No Lean or manuscript source was changed.

## Finding

The parent snapshot already contains the five canonical proof chapters named in the task. The earlier audit was based on the stale isolated clone and incorrectly treated those chapters as missing. They were read in full from the parent snapshot and are recorded below. They prove substantial shared quantifier, history, scale, and OPE-service arguments; they do **not** need to be recreated as packages.

There are still two source routes, and their existential runs must not be identified. The chain

`YM.PhysicalNext.Repeat.Legato.preFoundK` (`Lean/YM/FullVolume/Roll/Novena.lean`) → `YM.PhysicalNext.Repeat.Legato.freakK` (`.../Roll/Ebb.lean`) → `YM.PhysicalNext.Repeat.Legato.factorGK` (`.../Roll/Ariva.lean`) → `YM.PhysicalNext.Repeat.Legato.meridian` (`.../Roll/Meridian.lean`)

is an alternate construction. `factorGK` chooses an order profile with support exponent `100+i`; `meridian` constructs a run/campaign with `Locrian`, `Jams.Wild`, and the requested kernel penalty. It does not return `R2I.Funded`, the native attachment, or an equality to the run from the public selector. No source declaration inspected transports those properties between the two existential witnesses. The Roll chain is therefore not an input to the common-history proofs unless a concrete consumer requiring it is identified.

The public source route is

`YM.Independent.constructionRun` (`Lean/YM/Independent/ConstructionRun.lean`) → `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric` (`Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean`) → `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric` (`Lean/YM/Integration/NativePreselectedPostnumericPeriodClock.lean`) → `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.plentifulWithPrediction` (`Lean/YM/Integration/RG05Preconstruction/Bardo.lean`). This is the witness to bind to the canonical chapters.

## What the public source actually retains

`constructionRun` calls the selector with the default dynamics, minted custody, `garment10`, the input penalty `b>0`, the trivial eventually-paid predicate, `NativeComponentRecipe.available`, and the native floor/numeric/postnumeric requests. The selector's profile has `supportExp := fun _ => 100`; its output proves the exact parameter identity
`(A.B.a.params i).supportExponent = 100` for every `i`. It separately proves the budget inequality `(A.B.a.budget i).supportExponent ≥ 100`. Do not identify the exact profile equality with the budget lower bound. The Roll profile `100+i` is not the source of either public fact.

The selector's preselection keeps the sheet and quote identities
`R.metals.p = ThroughLaunch.raise s n` and
`R.metals.K = ThroughLaunch.raging s T`, the pre-length floor and native extra-floor, diagonal and post-length numerical paid requests, and the stage-zero post-length payment. It also returns order/power bounds, the treasury and common-period funding predicates, campaign pillars, the funded record, and campaign receipts.

`ActualRunNativeComponentRecipe.of_preselection` applies `.on_run` to that same run. `on_run` derives the kernel, stage, and factor equalities from `R.alloy.B.valid`, transfers the pre-length floor with `R.rolls.large`, then calls `NativeComponentRecipe.realize` on the actual `R.family.path.levels` and `R.alloy.B.M`, using `R.alloy.B.plan`. Thus the `Attached R` returned by `constructionRun` is genuinely same-clock/same-horizon data, including the native flat, dual, sworn, and Redo/Yamen receipts.

There is one actual wrapper-erasure issue. `selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric` returns, in order, the exact penalty, preselection, order/power bounds, the selected eventually-paid predicate, `CalendarTreasuryPurchase.TreasuryFunded`, `CommonPeriodPurchase.Funded`, campaign pillars, `R2I.Funded`, and additional receipts. `constructionRun` destructures this result with anonymous placeholders for the order/power, selected predicate, treasury, and common-period fields. Its stated conclusion retains the same `R,T,W`, penalty, `R2I.Funded (garment10 G) R T`, and `Attached R`, but not those four standalone witnesses.

The missing treasury and common-period proofs are available at the underlying selector call in the proof body; they are not mathematical consequences one may simply recover from the `Funded` record. The correct bridge is to preserve/name the required selector witnesses at the composition step (or add a strengthened wrapper theorem). Do not assert that `constructionRun`'s current theorem statement alone provides them. The same caution applies to any downstream use of the discarded order/power or eventually-paid outputs.

## Canonical chapter comparison

These chapters exist at the parent checkpoint and were read directly. They settle the mathematical scheduling/assembly joins; the remaining task is to bind their inputs to the native selector without duplicating their proofs.

| Canonical chapter | What it already proves | Remaining source binding |
|---|---|---|
| `common-funded-history.tex`, `sec:common-funded-history` | Simultaneous quantifier order for profiles, block lengths, prices/protection, delays, menus, and scale realization; retention of stationary and free data on one realization; exact tail identities after terminal normalization; same local return for every interval; explicit price comparison and continuation of retained histories. It states its analytic suppliers as prerequisites and does not claim numerical scale selection substitutes for them. | Bind its realized profiles, path/history, and purchases to the single public `R,T,W`. Preserve treasury/common-period outputs if the common floor list consumes them; do not attempt to derive them from `R2I.Funded` alone. |
| `common-observable-purchases.tex`, `sec:common-observable-purchases` | Makes observable, differentiated, multi-insertion, and localization purchases on the same selected history, with common dictionaries and finite-volume uniformity; explicitly says it does not choose a second solution of the shooting problem. It honestly leaves simultaneous global assembly to the centered-service/UV section. | Identify its common history with `R.family` and its campaign/paths with `T,W` from the public selector. `constructionRun` returns these together with `Funded` and `Attached`; no Roll witness is needed. |
| `common-scale-selection.tex`, `sec:common-scale-selection` | Gives the explicit slowly advancing scale sequence, long plateaux, period choices, countable and all-stage payments, and ordering of length floors before post-length costs. It explicitly leaves analytic hypotheses to their suppliers. | Match the fixed profile and required floors/costs to the native selected order/profile and actual clock factors. The selector does return these receipts, but the current public wrapper discards some of them as above. |
| `ope-scale-purchases.tex`, `sec:ope-scale-purchases` | Chooses support exponent exactly `100`, proves the fixed-stage halo/block-length inequalities and the stated intermediate-scale consequences; links these choices to the common funding/observable purchases. | Exact support profile is supplied by the native selector's `(A.B.a.params i).supportExponent = 100`, retained in `R2I.Funded.fixed`. Keep separate from the budget exponent lower bound. No Roll profile conversion is needed. |
| `ope-history-service.tex`, `sec:ope-history-service` | Proves finite elementary representation transport, several-insertion allowances, and uniformity above each reference level on one adjacent transition; it explicitly keeps the same background transition and history. | Apply it to the same `R,T,W` and fixed-exponent `Funded` record. The source has `R2I.Funded.gallery`, `.logPackage`, and `YM.R2IGoals.fromFunded`; these are the exact output-side projections. Do not silently drop `W`, which `logPackage` and `fromFunded` use. |

The four common/OPE joins therefore are not five missing mathematical arguments: the canonical chapters prove the shared construction and same-history claims. The remaining prose/source boundary is a short witness-preservation and assumption-map task, with the explicit wrapper-erasure caveat above. Overall construction estimates and analytic suppliers remain separately tracked by their own chapters; this audit does not upgrade their status.

## Recommended disjoint packages

These are source-binding prose/evidence tasks only. No upstream Lean change is proposed in this #26 writing task.

### Package A — Preserve the native selector witnesses

- **Output:** `manuscript/existence/public-run-binding.tex` and `blueprint/units/YM-000026/public-run-binding-evidence.md`.
- **Source interface:** `constructionRun`; `selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`; `allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric`; `NativePreselectedPostnumericPeriodClock`; `ActualRunNativeComponentRecipe.{PostnumericPreselection,Attached,on_run,of_preselection}`; `NativeComponentRecipe.{Choice,Realized,realize}`.
- **Task:** record the exact same `R,T,W`, fixed profile exponent, distinct budget exponent bound, sheet/quote/length identities, numerical requests, actual clock/horizon realization, and native attachment. Name and retain the selector's treasury, common-period, order/power, and predicate outputs if consumed by the parent theorem; otherwise say that the current wrapper drops them. The proof is composition of already-existing records, not a new construction estimate.
- **Dependencies:** the five canonical chapters listed above and the current `rg-construction.tex`, `rg-horizon-geometry.tex`, and their evidence.
- **Consumer:** Packages already present; it supplies an exact source-to-hypothesis map rather than new math for their conclusions.

### Package B — Source crosswalk for common-history and OPE applications

- **Output:** a short subsection in `public-run-binding.tex` (or a crosswalk table in its evidence file), not a duplicate proof chapter.
- **Source interface:** `R2I.Funded.{gallery,coverage,logPackage}`, `YM.R2IGoals.fromFunded`, plus `constructionRun`'s `R,T,W,Funded,Attached` result.
- **Task:** map each actual field to the hypothesis consumed in `common-funded-history`, `common-observable-purchases`, `common-scale-selection`, `ope-scale-purchases`, and `ope-history-service`; point at the already-proved labels above. Explicitly state that the retained `W` is required for OPE service and that trace/observable predicates are on `R.family`.
- **Dependencies:** Package A and the existing canonical chapters; no rederivation of scale recursion, local observables, or OPE transport.

### No package for Roll/Meridian unless a consumer is found

Mark the `preFoundK` → `freakK` → `factorGK` → `meridian` chain as an alternate existence route in the source crosswalk. Replace any citation that uses it as a public-run supplier. Do not attempt to prove equality or transfer between the two existential `Run`s absent a concrete consumer.

## Inspection record

The isolated clone was at monograph `HEAD ecc06d13de67e479666203061918e537316994e3`; the Lean import pin comes from `source/upstream.json`. The parent manuscript files were opened read-only from checkpoint commit `a2353123c27d800b4ea92a1cf62ad645d94e91fe`:

| Parent file | SHA-256 |
|---|---|
| `common-funded-history.tex` | `fb0c5d7126595ba7d49520766021c4d6ec73e439c93839c195c186100d63348b` |
| `common-observable-purchases.tex` | `d0150c0f0ab3c24e8e3de691c45b9b368a4901003719c6d829623e90294e188e` |
| `common-scale-selection.tex` | `5cda668bdb5c961ba13ece9f86d0eb68a416ab3cc722d2f3b0ce04cb897a1053` |
| `ope-history-service.tex` | `0d2bc8b960a72e1aed1ba8fb3561ffe6537a65fdb7664d29b3852276b799df7e` |
| `ope-scale-purchases.tex` | `33aa599c8b458420aeebf0fad62381940f03ccddd79e698a42ff476fbf5e53e0` |

Lean declarations inspected in the bounded audit: `preFoundK`, `freakK`, `factorGK`, `meridian`; `selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`; `allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric`; `constructionRun`; `NativeComponentRecipe.available`, `.realize`; `ActualRunNativeComponentRecipe.on_run`, `.of_preselection`; `R2I.Funded.gallery`, `.logPackage`; and `R2IGoals.fromFunded`, `.investPlan`. Read paths: `Lean/YM/FullVolume/Roll/{Novena,Ebb,Ariva,Meridian}.lean`; `Lean/YM/Integration/{NativePreselectedPostnumericPeriodRun,NativePreselectedPostnumericPeriodClock,NativeComponentRecipe,ActualRunNativeComponentRecipe}.lean`; `Lean/YM/Integration/RG05Preconstruction/Bardo.lean`; `Lean/YM/Independent/ConstructionRun.lean`; `Lean/YM/R2I/Campaign/Accepted.lean`.

Targeted commands included `rg --files Lean`, `rg -n -C 5 'preFoundK|freakK|factorGK|meridian'` on the four Roll files, scoped `sed -n` reads of the declarations above, `rg -n` for public selector and support exponent, `rg -n` across the manuscript/evidence, and `shasum -a 256` for the five parent files. The live issue #26/comments were rechecked through GitHub; parent claim remains active until 2026-11-12 16:40 UTC, checkpoint PR #35 at `a2353123c27d800b4ea92a1cf62ad645d94e91fe`. No Lean or LaTeX build and no Lean-source mutation was performed.
