# Actual angular actions and normalized stress

Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Author: parent session `hairer-codex-existence-20261111`, within #26 claim.
Prose: `manuscript/existence/physical-angular-actions.tex`.
Status: draft; independent source/mathematical review pending.

## Scope

Consumes physical Ward propagation p=c partial with one real c≠0, global
Still, Brackets, Hyper, and the same-Track derivative/translation/angular
comparisons. That upstream package is actively drafted separately; this
chapter does not supply it or the annular producer. Constructs the exact
same-U rotation action and tensorial stress, then matches the existing
calibrated-action input for Lorentz descent. Uses the same free Maxwell
rotation/Lorentz actions and their known compatibility; no fresh witness.

## Inspected correspondence

All paths relative to `Lean/YM/` at the pinned revision.

| Prose | Source |
| --- | --- |
| Simultaneous finite requests and scalar ratio from nonzero grade4 derivative | `YM.Bid.station`, immediate buysBoth/selects/currencies/services; `Bid/Town.lean`; A04/A05 interfaces in `Bid/Angular.lean` |
| Perfect plane brackets and relative Casimir centrality | `YM.Work.A09.bracket_planes`, `bracket_pick`, `perfect`, `casimir`, `relative_bracket`, `answer`; `Work/A09.lean` |
| Reference bracket and adjoint covariance | `YM.Work.A10.answer`, immediate intertwine/lie_brackets; `Work/A10.lean` |
| Signed/real preservation of relative Casimir polynomials | `YM.Work.A11.answer`, immediate signed_plane/square_action/casimir_fine/evaluate_fine/covariant_transport; `Work/A11.lean` |
| Real polynomial selector on reference End space | `YM.Work.A12.selector_exists`, `works_of_skew`, `for_representation`, `answer`; `Work/A12.lean`; fixed reference marks used by Town.services |
| Non-normal idempotent correction | `YM.Spin.defect`, `φ`, `offset`, `demand`, `rectify`, `stable`; `Spin/Isolates.lean` |
| Small perfect representations vanish on corrected projection | `YM.Spin.restrict_rel`, `enough`, `onto`; `Spin/Close.lean` |
| Near-identity exact intertwiner | `YM.Spin.effect`, `wave`, `Works`, `Tracks`, `realize`; `Spin/Shape.lean`; `Tilt`, `meet`, `extendsE`, `spans`, `Spin/Sheets.lean` |
| Actual action through corrected change of basis | `YM.Spin.Port`, `morph`, `produces`, `team`; `Spin/Lands.lean` |
| Global Ward→actual Port consumer | `YM.Climb.descends`; `Climb/Beams.lean`; actual Ward.global production belongs to separate upstream package |
| All-configuration O(4) covariance, unit/inclusion/vector laws | `YM.Work.A14.answer`, immediate parameterDeriv/cov_parameter/oriented/unit_fixed/vectorLaw/laws_of_oriented; `Work/A14.lean`; plane generation reused from canonical symmetry argument |
| Normalized flux, component rotation and Haar average | `YM.Work.A15.normalize_flux`, `averageStress`, `tensorial_average`, `conserved_average`, `stressLaws_average`, `answer`; `Work/A15.lean` |
| Exact compensated tensor and flux transformation | `YM.Work.A15.rotateStress`, `contract_rotate`, `rotate_divergence`, `rotate_conserved`; `Work/A15/Tensor.lean`; `pull_flux`, `rotate_flux`, `Work/A15/Transfer.lean`; linear flux maps in `Work/A15/Shell.lean` |
| Same-Q Lorentz witness | `YM.Org.Commission.picks`, `Tab`, `mill`; `Org/Twist.lean`; Work.A17 existing canonical label-descent/lorentz-covariance argument |

## Proof boundaries and reuse

The exact angular conjugator here is not the earlier finite-rank kernel
conjugator: this one uses a polynomial in relative Casimir and correction
of a non-normal almost-idempotent. No normality or unitary structure is
asserted for the transported physical matrices. An invariant real form
is constructed only for the fixed reference representation. Polynomial
peeling follows the inspected source rather than importing an unverified
Lie integration theorem. Standard finite-dimensional linear algebra and
probability Haar measure on a compact group are background prerequisites;
compactness of O(4) follows from its closed defining equations and bounded
matrix entries. No novelty or additional external literature claim is made.
Shared background notes/catalog were consulted; no applicable replacement
for the same-witness polynomial producer was present.

No Lean source changes, fresh build or axiom replay. Commands actually run:
focused cat/sed/rg on the named source, canonical label-descent and
lorentz-covariance, and the finite-rank transport section. Candidate SHA256
recorded. TeX integration/rendering and independent review are pending.
