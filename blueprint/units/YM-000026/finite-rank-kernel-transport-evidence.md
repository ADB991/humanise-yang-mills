# Finite rank kernel transport — draft correspondence

Author: independent-review subagent, newly assigned a disjoint author role by the coordinator. This author must not independently approve this unit. Parent review is required. Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Claim #26 remains valid until 2026-11-12 16:40 UTC; live issue comments rechecked before drafting.

Manuscript: `manuscript/existence/finite-rank-kernel-transport.tex`.

## Scope

Proves uniformly bounded symmetry-compatible equation-kernel projections, common countable two-stage compact extraction, silent-kernel inclusion conditional on the actual local relay receipt, finite measurement lower rank, stable kernel dimension, exact equation count, and the near-identity kernel conjugator with induced quotient symmetries. It does not construct Market.Purchases, Scotia, the finite calibrated maps, the actual relay comparisons, or the Cleaner/differentiable hierarchy. No all-arity or public existence closure is claimed.

## Inspected source map

- `YM.Push.Mark.Chosen.stable`, `YM.Push.Mark.Chosen.ker` in `Lean/YM/Push/RELAY_MARK/Step.lean`; `YM.Push.Mark.potage` in `Lean/YM/MergeProof/Potage.lean`: pullback Euclidean orthogonal projection, complementary kernel convention, finite signed average and real involution average. The uniform norm depends on the coefficient frame, not the changing equation subspace. Exact local invariance remains an application hypothesis.
- `YM.Next.Extract.include_projections`, `YM.Next.Extract.Projected.approaches`, `YM.Next.Extract.projected_limit`, `YM.Next.Extract.Tails.relay` in `Lean/YM/Next/EXTRACTION/Relay.lean`: simultaneous matrices and two-stage limits, preservation of idempotence, and extension-by-zero of newly paid rows on a refined index grid. Manuscript uses the stronger global degreewise bound provided by potage, so its elementary compactness proof covers this application's Affordable inputs.
- `YM.Bid.RelayBin` in `Lean/YM/Bid/Drops.lean`; `YM.Work.D04.marked_silent` and `YM.Work.D04.answer` in `Lean/YM/Work/D04.lean`: actual vanishing comparison cylinder, subpower inverse-terminal norm, centered discrepancy and finite-cutoff integrability. Manuscript reuses canonical `ex-column-subpower` for D01/D02 rather than redoing those estimates. It proves the upper-kernel inclusion only; it does not claim D04's transit/pace construction or its complete Spans result.
- `YM.Dash.Bin.quiet`, `YM.Dash.Bin.exactC` in `Lean/YM/Dash/Inert.lean`: all-Shot monitor, not merely two-point nullity, and inclusion plus dimension equality.
- `YM.Next.Rank.Market.Purchases`, `.samples`, `.converge`, `.to_rank` in `Lean/YM/Next/RANK/Bought.lean`: exact purchased comparison scope, bounded fixed-comparison lifts, rooted correction at all periods and sufficiently large mesh, rescaled finite free profile and point measurements. Actual root-bound production is retained; manuscript's precise moment-error input is the conclusion of this route, not a substitute for supplying its arrays.
- `YM.Next.Rank.Detect.watches`, `.measured`, `.reconciled`, `.demanded`, `.stocked` in `Lean/YM/Next/RANK/Monitors.lean`: all-test nullity implies generic-point nullity by smooth bumps; the measured matrix has full column rank; norm-close idempotents have the same kernel dimension; EquationCount yields exact kernel and spanning classes.
- `YM.Next.Rank.Beam.retained`, `.carries`, `.arriving_seed` in `Lean/YM/Next/RANK/Beam.lean`: same extracted lifted vectors and preservation of purchases. Only its finite extraction/rank endpoint is represented here. Full Seed also requires Cleaner, derivative and hierarchy results, explicitly retained.
- `YM.MergeProof.Accent.savings`, `.rated` in `Lean/YM/MergeProof/Powder.lean`: free residual zero gives the free quotient's equation-ideal dimension, while the finite kernel is the calibrated image of that ideal. The source obtains Market.Purchases through Soft.cast_off/wheeled, separately from this dimension argument.
- `YM.Push.Mark.drumroll`, `.thrush` in `Lean/YM/MergeProof/Thrush.lean`: exact `Y = T*A + (1-T)*(1-A)` and `Y*A=T*Y`; no commutation of T and A is assumed. A single late calibrated label isomorphism suffices. Descending to the quotients preserves conjugation and signed action.
- `YM.MergeProof.Scotia`, `YM.MergeProof.reception` in `Lean/YM/MergeProof/Eureka.lean`: identifies the retained producer join (portfolio/campaign, Braze, solaris, marshal, thyme, lofty). Not proved by this unit.

## Canonical overlap / remaining mathematical boundaries

Reuse `ope-filtration.tex`, especially `ex-column-subpower` and the normalized compact test argument, and `all-grade-free-detectors.tex`. This unit supplies the former's exact-kernel hypothesis only for the same projections/tests and only after the displayed local relay and paid measurement inputs hold. It does not infer local projection comparison from general finite-dimensional algebra. The smooth table's null space is identified only once a representative with the same tested correlations has been constructed.

No new literature theorem is asserted: the bounded proof consists of elementary finite-dimensional projection, compactness, determinant and Neumann-series arguments, all given explicitly. Searched shared `blueprint/background` for projection/rank/kernel/finite-dimensional references; no applicable canonical literature unit was found. No novelty claim is made.

## Checks actually run

- `git diff --check`: no diagnostics for tracked changes; new files additionally checked with `git diff --no-index --check /dev/null <file>`.
- `python3 scripts/check_blueprint.py`: fails because reviewer clone lacks coordinator-owned `blueprint/units/YM-000026/unit.json`.
- No Lean build and no TeX build run. No source edits, no metadata approval or public submission.
