# Free Maxwell collar Ward identities — draft evidence

Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent session `hairer-codex-existence-20261111`, issue #26.
Text: `manuscript/existence/free-maxwell-ward-flux.tex`.

## Source route and exact scope

All declarations in the following table have namespace `YM.Maxwell.Free`
unless explicitly qualified. The file prefix is `Lean/YM/Next/MAXWELL/`.

| Argument | Declarations | Files |
| --- | --- | --- |
| Polarized stress, Bianchi cancellation and current divergence | `cross`, `force_sym`, `div_cross`, `current`, `current_div`, `exportFlux`, `singleFlux`, `sourcefree_flux` | `Current.lean` |
| Positive regulator and unit approximate delta | `soften`, `source`, `minus_lap`, `source_profile`, `source_scale`, `testing_source` | `Source.lean` |
| Exact regulated elementary pulse and charge | `exteriorD`, `opposite`, `cure`, `cure_charge`, `regulated`, `reg_pulse`, `regulated_charge` | `Regulator.lean` |
| One enclosed coordinate contraction | `local_force` and its `pays_reg`/`continuous_pays` proof | `Contact.lean` |
| Higher probe contraction on the same fixed collar and drive | `pulse_differentiated`, `deriv_flux`, `jet_force` | `Force.lean` |
| Translation and rotation actions | `variation_value`, `affine_wave`, `variation_drift`, `drift_flux`; `rot_point`, `angularLeg`, `angular_flux` | `Affine.lean`, `Angular.lean` |
| Both legs at the enclosed insertion | `collars_equal`, `pulse_hom`, `two_flux_zero` | `Repeat.lean` |
| Exact half of ordered double contraction sum | `front_pair`, `reads_debit` | `Double.lean` |
| Three contraction cases and arbitrary complex Wick polynomials | `Motion`, `straight_motion`, `rotational_motion`, `fees`, `moment_force` | `Taxes.lean` |
| Actual stress polynomial and conservation | `polStress`, `stress_label`, `pol_conservation` | `Stress.lean` |
| Field-table Ward identities with common negative coefficient | `beacon_signal`, `upper_charge` | `Beacon.lean` |
| Reference selected before comparisons | `herald`, `shines`, `maxwell_supplies` | `Lit.lean` |

Also read `Lean/YM/UVNext/FREE_STRESS_CERTIFICATE/Choose.lean`:
`YM.UVNext.FreeStress.ignite`, `fire`, `every_light`; and
`Lean/YM/Pert/Lifted.lean`: `YM.Pert.address_flat`, `address_panel`,
`common_stress`, `same_translation`, `kappa_eq`. The latter proves the numerical
coefficient -1 from canonical stress and the unchanged derivative plan, not
from the mere nonzero coefficient returned by `fire`.

The exposition follows the regulator/main source route, rather than replacing
the source proof by a distributional product argument. The smooth source has
mass one for four-dimensional Lebesgue measure. Every singular product is
integrated only on a compact collar away from its poles. Higher centre
derivatives keep the drive fixed, including for angular motion; normalized
jet raising factors occur on both sides. The two-enclosed contraction uses
homogeneity plus collar independence, with exponent e-5-j-l<0. The Wick
assembly includes zero, one and two enclosed partners and the factor 1/2
from ordered double extraction. The canonical polynomial is real/gauge
invariant and divergence-free; the low-grade rank proof is reused.

## Canonical inputs and boundaries

Reuses the fixed Maxwell covariance and finite Wick moments from the existing
free-reference chapters, and `trace-free-rank.tex` for nonzero stress,
onto divergence and its one-dimensional centered kernel. `actual-stress-
normalization.tex` consumes the resulting fixed reference certificate.
Physical annular Ward representation is a separate supplier on the same run.
No new proof of the entire reference hierarchy/reconstruction or its detector
gallery is claimed here. Reference packaging keeps the same hierarchy,
derivative, rotations, vacuum and canonical polynomial; its record assembly
does not introduce another existential physical family.

Shared literature index and existing Fourier/free-reference discussions were
searched for stress, conserved tensors and Wick flux. No precise existing
specialized match was recorded. The elementary regulator, finite Wick sum and
linear normalization argument are proved explicitly; no unsupported external
result is used to replace them.

Inspection used bounded `rg`, `sed`, `cat`, `wc -l` on the files named above.
An initial guessed path `FREE_STRESS/Choose.lean` did not exist; `rg --files`
located `FREE_STRESS_CERTIFICATE/Choose.lean`, which was then read. No Lean
build, axiom replay, or source changes. TeX/render checks and independent
source/mathematical review are pending. All prose remains draft.
