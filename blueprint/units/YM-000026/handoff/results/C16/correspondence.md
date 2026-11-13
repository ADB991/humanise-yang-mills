# Source correspondence and evidence boundaries

Pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual inspection only in this
session: no new Lean elaboration, kernel replay or transitive axiom audit.
All seven chapter initial hashes matched C16 in package-plan.json before edits.

| Prose group | Inspected fully qualified anchors | Path under Lean/ |
| --- | --- | --- |
| statement / A2 | YangMills.WilsonRegularity; YangMills.Hierarchy.Reconstructed, OperatorProductExpansion, TraceTest, Properties; YangMills.JointExistence | ChallengeSpec.lean (definitions read in full) |
| public projection | YangMills.constructed; YangMills.jointExistence | Construction.lean; Solution.lean (read in full) |
| N1/N2/N3 | YM.PhysicalNext.Repeat.Mallow.mingle, lauge, syrup, offerS, Arrives, brevity, adopter, yearEnd | YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/{Stove,Eco}.lean |
| S1/S2 | YM.RG.Supply.Program.exhaust, scaled_lower, scaled_upper; YM.RG.Supply.Wait.ready; YM.RG.Supply.Bar.exists_above, allocated, enters; YM.RG.Supply.Wait.lead | YM/Price/{Waits,Length}.lean (read in full) |
| S3 | YM.Integration.NativeDiagonalClockRequest.envelope, PaidRequests, eventuallyPaid; YM.Integration.NativePostLengthPayment.StagePaid, eventuallyPaid | YM/Integration/{NativeDiagonalClockRequest,NativePostLengthPayment}.lean (read in full) |
| O1 | YM.OPE.haloUnits, HaloGate, halo_feasible, halo_delay | YM/OPE/Rough/Gate.lean (read in full) |
| H2 | YM.PhysicalNext.Repeat.Mallow.Many.warm; YM.MergeProof.Float.Runs, slosh, push_list, spill_in | YM/MergeProof/North/{Afire,Tan}.lean (read in full) |
| B1 | YM.Integration.NativeComponentRecipe.openBook_of_stagePaid, Realized, realize | YM/Integration/NativeComponentRecipe.lean (displayed proof through native flat-delay application inspected) |
| B1 | YM.Integration.ActualRunNativeComponentRecipe.on_run, Attached, of_preselection | YM/Integration/ActualRunNativeComponentRecipe.lean (read in full) |
| profiles/selection | YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction | YM/Integration/NativePreselectedPostnumericPeriodClock.lean (statement, Orders, HStage order inequalities, payment composition and same-length rewrite read) |
| B1 / A2 | YM.Independent.constructionRun, fundedRun | YM/Independent/ConstructionRun.lean (read in full) |
| B1 / A1 / A2 | YM.PhysicalNext.Repeat.Legato.R2I.Funded.gallery, coverage, jewel, logPackage; YM.R2IGoals.Broad, fromFunded | YM/R2I/Campaign/Accepted.lean (these declarations and proofs read) |

The source-level evidence above is not a fresh audit of every internal supplier.
In particular, O2--O9, forced-array compression H1, arbitrary-slot H3 and the
actual run selector's complete existential packaging reuse the canonical
`ope-scale-purchases-evidence.md`, `ope-history-service-evidence.md`,
`public-run-binding-evidence.md` and relevant bounded reviews in
`reviews/draft-review.md` and `reviews/closure-audit.md`. Their mathematical
paragraphs were read and checked locally; their full immediate Lean dependency
trees were not independently re-audited here. This distinction is intentional.

The shared literature index and G01 proposed patches were consulted before
editing. The OS and nonlinear/Gaussian/rank interface notes remain external
conditional evidence, not substitutes for analytic proofs. The C16 repairs use
only explicit elementary arguments and public definitions; no new substantive
external theorem or novelty claim was introduced. C05 #46 and C04 #45/#76
handoffs were consulted for the OPE pointer and remaining reconstruction joins.

Source trust remains that recorded by the separate #37 clean-build task and
G01; it is not strengthened by this author pass. The unmodified pinned Lean
files were used as evidence only.

F7 follow-up inspected `YM.MergeProof.Ribbons.Fibers.{contents,plena,reap,
harvest,recomp}` in `Lean/YM/OPE/Grouping/Fibers.lean` and the singleton
`fire j` clause of `YM.MergeProof.Ribbons.Unites` in
`Lean/YM/MergeProof/North/Price.lean`. Revision 1 (L3): the cell-by-slot
statement used by `ope-history-service.tex` is
`YM.MergeProof.Ribbons.ManyCopies.Unites` (`Lean/YM/OPE/Replicas/Price.lean` 18–19),
which has the same `fire j` clause and the hypotheses `∀ i, 0 < r i`,
`Occupancy (S.ratio.parent ∘ o) N` (`YM.Extra.Multi.Occupancy`,
`Lean/YM/Extra/MULTISOURCE_BOUNDS/Root.lean` 95: at most `N` markers per site) and
`Offer o q r R.p.B d c'` (`YM.MergeProof.Menu.Offer`, `Lean/YM/MergeProof/Fruit.lean` 19:
sites in the crests and the `Ac.Hit` budget); `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN`
(`Lean/YM/OPE/Replicas/Sponsor.lean` 44–57) instantiates `N := Q ((P!).J (m+1))`,
`d := supportExponent(m+1) - 4`. The canonical regrouping chapter was read
in full. `reap` takes the old coefficient at `plena`, so its singleton cell
coefficient uses the entire fiber; the before-grouping marker identity cannot
be substituted for this.

## Revision 1 additions (session ADB991-claude-20261113-33ce)

Source text read for revision 1 (no elaboration):

| Manuscript item | Declarations | Path |
| --- | --- | --- |
| M1 hypotheses in `ope-history-service.tex` | `YM.MergeProof.Ribbons.ManyCopies.Unites`; `YM.Extra.Multi.Occupancy`; `YM.MergeProof.Menu.Offer`; `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN` | `YM/OPE/Replicas/Price.lean`, `YM/Extra/MULTISOURCE_BOUNDS/Root.lean`, `YM/MergeProof/Fruit.lean`, `YM/OPE/Replicas/Sponsor.lean` |
| `eq:common-drift-floor` | `YM.RG.Supply.Large` (fields `kick`, `slow`, `fits`), `Rolls.eventually_large`; consumed as `Calendar.Fits.driftSmall`, `.logCost` in `YM.RG.Supply.Wait.ready` | `YM/Price/Intent.lean` 40–80, `YM/RG/History.lean` 97–118, `YM/Price/Waits.lean` 200–210 |
| `lem:common-loop-capacity` | `YM.Stationary.clocks`, `YM.Stationary.bump`; `Calendar.loopCap`, `Calendar.monitor`; `Fits.thetaRange`, `.thetaMono` | `YM/Next/STATIONARY/Level/Recurse.lean` 1–80, `YM/RG/History.lean` 81–86, 111–112 |
| C12 floor and delay items | `YM.PhysicalNext.Repeat.Legato.paper`, `oyster`, `dusk`, `shower` | `YM/MergeProof/Apres.lean` 1–60 |

The manuscript proof of `lem:common-loop-capacity` follows `bump`/`clocks`: thresholds chosen per stage from `2 P(x)^θ_j → ∞` and `P(x+v_j)^θ_j ≤ 2 P(x)^θ_j` eventually, then `θ_{J(m+1)} ≤ θ_{J(m)}` and `P ≥ 1`. The manuscript bound for the second property (`(log ℓ')² - (log ℓ)² ≤ 3v/x`) is the one in `bump`. `eq:common-drift-floor` is `Large.kick`/`.slow`/`.fits` at stage `j ≥ first`; its existence is `Rolls.eventually_large` (`c/log n → 0`).
