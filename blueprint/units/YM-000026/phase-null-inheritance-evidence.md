# Original null relations and phase-retention application

Author draft addition; independent review pending at creation.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent author: hairer-codex-existence-20261111.
Changed prose: `phase-regularity.tex`, new `ex-phase-original-null`, and final
application paragraph of `phase-fields.tex`. No quantitative estimate is added.

## Exact content

Original raw nullity quantifies over all finite spectator words of arbitrary
grades at separated points. Inserting such a label in a slab word makes every
dense left/right word matrix element zero. The exterior words lie strictly
below and above the slab, so all points remain separated. Boundedness and density
force the slab operator to vanish; ground compression and every character then
vanish. Multilinearity gives factorization in each slot through the original
field quotient. This proves inclusion of original nulls into each phase null
space before the finite detector is used to prove the reverse inclusion.
No phase faithfulness or equality of null spaces is presupposed.

## Source and canonical joins

- `YM.Work.B03.place_linear_front`, `m_linear_front`, `depot_update`, `pins_m`
  (private lemmas), `Lean/YM/Work/B03.lean`: slab insertion factors through the
  original field class, then whole-word compression respects replacement of
  each class. Prose gives the underlying dense matrix-element null argument
  directly and applies multilinearity, suppressing quotient implementation.
- `YM.Work.B07.state_value`, `state_rel`, `Lean/YM/Work/B07.lean`: phase value
  is evaluation of the same whole compressed word; replacing the null front
  label by zero proves `(state ...).respects S`.
- `YM.Extraction.Retain.lift_detect`, `Phase/Picks.lean`: source uses exactly
  `Q.span` and phase respects; its finite-dimensional proof is the existing
  `ex-no-new-null` proposition. The source proof was read in full.
- Independent bounded C03 audit (reviewer closure-audit) identifies same-trial
  span chain `Detect.stocked` (Monitors), `Beam.carries`, `Purchases.to_rank`;
  source `Next/BOUNDARY/Alias.lean` transports rank only when ALL separated
  correlations agree, and `Synchronize.lean` retains span while transporting
  ordered limits separately. Parent has not independently reread those entire
  files; this portion is explicitly reviewer-inspected evidence, not a new
  parent claim of full source inspection.
- Canonical producers: `actual-rank-purchases.tex`,
  `finite-rank-kernel-transport.tex` (`eq:finite-rank-exact-kernel` and eventual
  basis), `actual-phase-detector-moments.tex` (all corrected powers and
  every-character bounds), `all-grade-free-detectors.tex` (strict detector).
  Their stated same-family/estimate hypotheses remain draft dependencies.
  No arbitrary replacement table or new extraction is introduced.

## Checks and scope

Parent read phase-regularity.tex through its initial propositions, full
phase-fields.tex, full Phase/Picks.lean, B03 source around the quotient/slot
factorization and pins_m, B07 state construction and state_rel, and the relevant
rank/detector prose conclusions. Used bounded sed/cat/rg; two guessed evidence
or source paths did not exist and were not treated as inspected.
No Lean changes, build or new axiom audit. LaTeX/visual checks and independent
review of these exact edits are pending. This short join closes an explicitly
retained local phase-respect input, not the whole existence argument.
