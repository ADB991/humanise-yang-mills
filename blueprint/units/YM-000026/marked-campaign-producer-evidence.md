# Marked campaign producer

## Status

Draft for independent mathematical/source review. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.

Owned prose: `manuscript/existence/marked-campaign-producer.tex`.

## Declaration correspondence

- `YM.Push.Mark.Forms`, `Cone`, `Payment`, `Campaign`, `Offered`:
  `Lean/YM/Push/RELAY_MARK/{Pi,Rank,Linear}.lean`.
- Slot germ (`YM.Source.Drops.Peg`) and its actual ODE production:
  `Lean/YM/Source/Drops.lean`, `Lean/YM/Work/G02.lean`.
  Signed-coordinate and constant-gauge covariance are `YM.Work.G01.answer`
  in `Lean/YM/Work/G01.lean`.
- Exact equation-ideal generation:
  `YM.Push.Mark.erase_shell`, `split_literal`, `split_verse`,
  `generation_ready`: `Lean/YM/Push/RELAY_MARK/Ideal.lean`.
- Safe functionals and products:
  `YM.Push.Mark.safe_span`, `safe_check`, `safe_all`, `safe_top`,
  `safe_slot`, `safe_observable`, `text_safe`, `stanza`, `coherent_verse`:
  `Lean/YM/Push/RELAY_MARK/{Span,Rank}.lean`.
- Positive force sampling and its kernel:
  `YM.Push.Mark.force_span`, `positiveLinear`: `Span.lean`;
  `YM.Push.Mark.force_kernel_last`, `top_shell`: `Current.lean`;
  `YM.Push.Mark.shots`: `Current.lean`.
- Microscopic force and Taylor reads:
  `YM.Push.Mark.micro_force`, `equation_silent`: `Avoid.lean`, `Wilson.lean`;
  `slot_readout`, `force_reads`: `Pi.lean`.
- Actual invariant read:
  `YM.Push.Mark.mounted_read`, `positioned`: `Rank.lean`, `Gauge.lean`.
  `positioned` Haar-averages the finite-dimensional orbit span.
- Campaign construction: `YM.Push.Mark.shelf`, `marked_shelf`,
  `one_floor`, `unsym`: `Linear.lean`.
- Finite symmetrization: `YM.Push.Mark.Payment.turn`, `Payment.real_`,
  `ortho_campaign`, `ortho_align`, `impression`: `HGroup.lean`.

## Proof content and scope

The manuscript expands the equation-ideal monomial splitting, the finite
annihilator argument for edge-avoiding slot functionals, the Taylor error
and product-filtration assembly, the microscopic one-link Haar
integration-by-parts calculation, the constant-gauge Haar average, and the
finite grade-by-grade campaign assembly. It also proves the signed-group
Reynolds average and real-conjugation midpoint preserve the campaign and
fix the unit.

The proof uses the exact finite-dimensional current-kernel identity
proved in `Current.force_kernel_last`: vanishing positive path forces imply
that the top Taylor coefficient lies in the image of the Maxwell potential
map from on-shell curvature. This is the radial solution-potential space,
not a pure-gauge subspace. The manuscript gives the top-shell radial-limit
argument and uses only this top-layer implication. It also uses the exact
one-link integration-by-parts identity `Wilson.equation_silent`, whose
domination assumptions are supplied by the source Envelope condition.

The actual section producer is cross-referenced to
`sec:local-sections`. It constructs the degree-cutoff section and finite
poses; the minimum factor degree in a pose supplies the powered slot-degree
hypothesis required by the campaign theorem. The finite-dimensional
equation-ideal projection/rank and exact Maxwell potential sequence are
used as structural inputs with their precise roles stated. The chapter does
not claim to close those separate structural producers or the complete
existence proof.

## Checks

- Source declarations inspected at the pinned checkout; no Lean source was
  edited and no Lean command/build was run.
- `git diff --check` passed. `python3 scripts/check_blueprint.py` was run
  and failed because `blueprint/units/YM-000026/unit.json` is absent in
  this task clone; it did not report a prose-record error. No TeX build
  has been run.
