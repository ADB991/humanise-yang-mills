# Free reference rank and point probes

- Unit: YM-000026, finite free-reference trace rank.
- Status: draft; independent mathematical and source-correspondence review pending.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Manuscript: `manuscript/existence/trace-free-rank.tex`.
- Scope: explain and prove the finite Green-function probes, low-grade signed-covariance bounds, equation-of-motion quotient bound, and the free rank-one closure conclusion.

## Correspondence

| Manuscript result | Exact declaration(s) | Pinned source path(s) | Status |
| --- | --- | --- | --- |
| Grade-four and grade-five low-degree decompositions | `YM.StressFlux.Low`, `YM.StressFlux.low`, `YM.StressFlux.low_moves`, `YM.StressFlux.Low.linear_invariant` | `Lean/YM/Push/STRESS_FLUX/Low.lean`, `Lean/YM/Push/STRESS_FLUX/Counts.lean` | The prose groups the formal monomial helpers as the constant/linear/quadratic/mixed decomposition. The source proves the grade cutoff by weighted monomial induction. |
| Invariant color linear and bilinear forms | `YM.StressFlux.linear_invariant`, `YM.StressFlux.bilinear_invariant`, `YM.StressFlux.vanish_mix`, `YM.StressFlux.vanish_sq` | `Lean/YM/Push/STRESS_FLUX/Color.lean`, `Low.lean` | The manuscript gives the infinitesimal simplicity argument and the invariant-form reduction, then applies it to real and imaginary parts. |
| Signed-coordinate orbit count and three/four probes | `YM.StressFlux.Orbit.stencil`, `YM.StressFlux.Orbit.test`, `YM.StressFlux.finrank_one`, `YM.StressFlux.finrank_two` | `Lean/YM/Push/STRESS_FLUX/Orbits.lean`, `Counts.lean` | The manuscript spells out parity support, representative configurations, antisymmetry, Bianchi completion, and injectivity of the finite probe maps. The coefficient array is formed by evaluating the mixed form on `leg0` and `leg1`; `leg1_cycle` gives Bianchi, and `sum_legs0`/`sum_legs1` prove these probes span the actual radial jet slots. |
| Green-function Hessian and third derivative | `YM.StressFlux.hbase`, `YM.StressFlux.dhbase`, `YM.StressFlux.bare_eq`, `YM.StressFlux.dbare_eq`, `YM.StressFlux.chains_D` | `Lean/YM/Push/STRESS_FLUX/FreeTests.lean`, `Lean/YM/Push/STRESS_FLUX/Jets.lean` | The displayed delta formulas are the ordinary derivatives of `G(x)=(4π²)⁻¹|x|⁻²`; the source uses the same formulas at the base point. |
| Free stress finite values | `YM.StressFlux.vacuum_tests`, `YM.StressFlux.signal_formula`, `YM.StressFlux.signal_grad`, `YM.StressFlux.factor_ne` | `Lean/YM/Push/STRESS_FLUX/FreeTests.lean` | The three row vectors are exactly `(32,64,0)`, `(0,64,0)`, `(0,0,−16)`, multiplied by `dim G·ν²`; the two divergence rows are `(-256,-512,128)` and `(0,-512,-128)` with the same factor. The one-point scalar coefficient is separately read by the skim. |
| Injective free stress basis and table dimension | `YM.StressFlux.free_stress_inj`, `YM.StressFlux.free_stress_bij`, `YM.StressFlux.dim_four`, `YM.StressFlux.tensorProjection_onto` | `Lean/YM/Push/STRESS_FLUX/FreeTests.lean`, `Lift.lean` | Four independent coefficients plus raw-space upper bound give the actual table isomorphism. |
| Two divergence rows and Weyl kernel | `YM.StressFlux.divergence_tests`, `YM.StressFlux.div_kernel`, `YM.Further.PhysicalPeriodLimitF933.tested_div`, `YM.Further.PhysicalPeriodLimitF933.skim_formula` | `Lean/YM/Push/STRESS_FLUX/FreeTests.lean`, `Lean/YM/Further/PHYSICAL_PERIOD_LIMIT_F933/FreeRanks.lean` | The two rows are `(-256,-512,128)` and `(0,-512,-128)` after the positive factor. Zero skim sets `w₀=0`, leaving exactly the Weyl line. |
| Maxwell-reduced target dimension | `YM.StressFlux.eom_nonzero`, `YM.StressFlux.equation_killed`, `YM.StressFlux.dim_free_five`, `YM.StressFlux.vectorProjection_onto` | `Lean/YM/Push/STRESS_FLUX/Polynomial.lean`, `Lift.lean` | The source equation-of-motion vector is nonzero and killed by the Maxwell quotient. The raw bound is three, so the quotient target is at most two. |
| Full free closure map | `YM.Further.PhysicalPeriodLimitF933.free_closure`, `YM.Further.PhysicalPeriodLimitF933.free_rank` | `Lean/YM/Further/PHYSICAL_PERIOD_LIMIT_F933/FreeRanks.lean` | The manuscript's joint skim/divergence map has kernel the Weyl line; dimensions force surjectivity and a one-dimensional kernel. |

## Definitions and exact finite formulas

The coefficient order is `(scalar, diagonal first contraction, diagonal total contraction, off-diagonal shear)` as in `YM.StressFlux.Coeff` and `YM.StressFlux.stress` (`Lean/YM/Push/STRESS_FLUX/Polynomial.lean`). The point response is `YM.StressFlux.signal`; its exact Wick formula is `YM.StressFlux.signal_formula`. The Green normalization is `Maxwell.normal=(4π²)⁻¹` in `Lean/YM/Push/MAXWELL/PotentialKernel.lean`. The scalar skim is `YM.StressFlux.Line.skim`, which `YM.Further.PhysicalPeriodLimitF933.skim_formula` identifies as the real one-point average of the `00` entry. It is not the tensor trace.

The manuscript calculations are reorganized from the actual source equations, not an external continuum tensor-classification result. In particular, it uses the explicit `YM.StressFlux.leg0_value`, `.leg1_value`, `.leg1_cycle`, `.sum_legs0`, and `.sum_legs1` radial-potential formulas; it does not assume free curvature and derivative coordinates are independent. No external citation was located or required for these finite sums. The quotient projection has a source-built equivariant section; the argument does not presume its surjectivity without that source construction.

## Open obligations and evidence

- Interacting-center dimension equivalence and the optical comparison remain in `trace-calibration-producer.tex` as separate selected-source obligations; this unit proves the free reference rank only.
- The finite raw-space classification is derived from the source's low-degree monomial decomposition, color invariance, signed parity, pair antisymmetry, and the radial `leg1` cycle relation. The source reconstruction identities `YM.StressFlux.sum_legs0` and `.sum_legs1` justify that the sampled leg coefficients determine the actual jet functional; the prose uses no independent ambient-curvature coordinates.
- Calibration in scale still requires the two correction directions and their convergence bounds; no scale-dependent claim is made here.
- Commands run: `rg -n` and `sed -n` on the listed pinned Lean files; a short direct Python enumeration using the displayed Kronecker-delta formulas checked the five coefficient rows (three value probes and two divergence probes). Output: `(32,64,0)`, `(0,64,0)`, `(0,0,−16)`, `(-256,-512,128)`, `(0,-512,-128)` after factoring `dim G·ν²`. `python3 scripts/check_blueprint.py` was run and stopped because the coordinator-owned `blueprint/units/YM-000026/unit.json` is absent in this isolated clone.
- No Lean build or LaTeX build was run. No Lean source was modified.
