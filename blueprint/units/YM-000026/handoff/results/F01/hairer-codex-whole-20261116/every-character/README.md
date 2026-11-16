# Every-character vacuum: author proof

Parent claim/scope extension #26 comment 6920021498; author lane
`whole_assessment382`, base `a62f08fbcccdc92797ab910ace65f3e02ee79a06`.
Owned changes: `phase-selection.tex` and the final continuation subsection
of `phase-ward-inheritance.tex`. No source changes.

## Missing argument supplied

The previous manuscript selected a phase from an almost-everywhere set of
one-dimensional OS ground spaces. The stronger headline requires a unique
vacuum for every reconstructed character. Continuity at fixed time and full
support alone do not justify that upgrade: spectral mass could concentrate
at zero at an exceptional character.

New `lem:phase-uniform-low-energy` proves the missing estimate for every
finite sum of compactly smeared field words, uniformly in the character:
`mu_chi(0<E<=u) <= D_A u^2`. The proof uses locality for the word and its
formal adjoint, forward-cone support, compactness of the character space,
and character continuity of their norms. It explicitly forms the odd-time
average of the commutator, identifies its spatial Fourier transform as a
sum of positive sine-weighted measures, tests against a smooth momentum
bump, and sums dyadic energy annuli. Layer-cake/Tonelli gives the uniform
heat remainder `2 D_A / s^2` after subtracting the full zero-energy
projection, which is not assumed to be the vacuum projection.

New `thm:ex-every-character-vacuum` first uses the existing a.e. selection
and heat-vector isometry to identify that projection almost everywhere.
For each fixed positive s the heat pairing minus the squared vacuum
coefficient is continuous in the character. Full support extends the
uniform remainder bound to every character; only then is s sent to
infinity. Compactly smeared words are dense by Schwartz cutoffs and joint
word-correlation continuity. The conclusion is the Wightman vacuum line
for every character. The proof does not claim surjectivity of the
heat-vector isometry or strengthen the early OS-ground theorem.

The final subsection of `phase-ward-inheritance.tex` now applies the
continuation construction to every character. It invokes the new vacuum
argument after locality and forward spectrum have been obtained. The mixed
theory is still not asserted to have a unique vacuum.

## Dependency order and correspondence

The phase caps/slabs and original reflection construction supply every
character's pre-vacuum Euclidean dynamics. The analytic boundary, locality,
word-domain and translation constructions apply without vacuum uniqueness.
The first part of `thm:field-spectrum` supplies the forward cone without its
last (conditional vacuum) assertion. The new argument uses these facts plus
`prop:assembly-boundary-barycenter`, whose fixed weak-height continuity
supplies norm and heat-pair continuity. Its proof is written independently
by the assembly author; the heat-pair identity is justified from the mixed
Gram formula and independent-height vector limits.

The Luna reader `whole_source` inspected the corresponding pinned source
chain (pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`):

| Manuscript step | Source |
| --- | --- |
| Uniform word mass and finite locality radius | `YM.EveryPhase.word_bound`, `.late`, `.light_bound`, `Lean/YM/EveryPhase/Light.lean` |
| Sine average and positive spatial measures | `YM.EveryPhase.pulse`, `.pulse_positive`, `.pulse_lower`, `.two_average`, `Lean/YM/EveryPhase/Average.lean` |
| Fourier bump and dyadic annuli | `YM.EveryPhase.annulus`, `YM.EveryPhase.dyadic`, `Lean/YM/EveryPhase/Light.lean` |
| Laplace remainder | `YM.EveryPhase.inverse_square`, decay argument in `Lean/YM/EveryPhase/Decay.lean` |
| Full-support upgrade and dense-word rank-one projection | `extends_decay`, `cluster_zero`, `all_plant` in `Lean/YM/EveryPhase/Vacuum.lean` |
| Final every-character target | `YM.EveryPhase.all_characters`, `Lean/YM/EveryPhase/Extension.lean`; the `Reconstruction` structure in `Lean/YM/Nonperturbative/HeadlineSpec.lean` |

The exposition uses the already constructed Wightman space directly. The
source additionally transports the rank-one conclusion back to the entire
OS space using a surjective attachment; that extra conclusion is not needed
for this headline and is not silently assumed here. Fourier constants are
derived explicitly with the convention `hat f(x)=integral exp(-ipx)f(p)dp`,
so the displayed `(2*pi)^3` is not copied from an unspecified convention.

## Validation and review status

`git diff --check` and `python3 scripts/check_blueprint.py` pass (four units;
structural checking only). No Lean build or axiom audit. Final integrated
LaTeX build/render is performed by the parent. These are new author proofs
and require independent mathematics/source review at the final hashes.
