# Multileg curvature lifting — draft correspondence

Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Author: parent session `hairer-codex-existence-20261111`.
Output: `manuscript/existence/multileg-curvature-lift.tex`.

Inspected source (all namespace `YM.Stationary`):
- `Lean/YM/Next/STATIONARY/Lift/Koszul.lean`: `seriesLeg_exact`, `div_var`, `rays_div`, `cartan_remove`, `cartan_0`, `cartan_project`, `cob_step`, `allcombs`, `wall_lift`. Quantitative Fourier division, four-coordinate residual elimination, order loss and preservation of auxiliary subspaces independent of the divided momentum.
- `Lean/YM/Next/STATIONARY/Lift/ManyLegs.lean`: `bypass`, `firm_shear`, `open_end`, `press_lift`, `dimensionShift`, `independent`, `allleg`, `bothleg`. The dimension-shift induction is reproduced, including the restriction at first independent momentum zero, induction with exterior degree increased by two, constant extension and the correction restoring the forgotten Ward identity. The two-leg argument instead uses retained order to solve the degree-zero problem. Source `slim (t-1)` is width divided by t+1 for t independent momenta; no numerical width optimality is claimed.
- `Lean/YM/Next/STATIONARY/Lift/Pathways.lean`: `re_cast`, `real_rescue`, `picker`, `insertPaint`, `strokes`, `veins`, `vertical_moment`, `jet_moment`, `artery_length`, `artery_funded`, `issue_normal`. Arbitrary fixed real projection onto the invariant colour subspace, not an orthogonal projection or a norm-one averaging assertion. Rooted plaquette length includes 4(t+1), and moment sums are absolute.

The exposition shares the elementary one-leg geometric-sum/Cartan proof with `curvature-horizon-producer.tex` and adds precisely the auxiliary-constraint and Taylor-order variants needed here. Operators on distinct tensor factors commute without graded signs in the source's component convention. All identities are for unconjugated complex multilinear coefficients. Realification uses conjugation with momentum reversal.

Literature check: the shared background directory contains only SU(2) simplicity beyond its README, and no multileg lift entry. A focused web query for lattice Poincare lemmas found M. Lüscher, *Topology and the axial anomaly in abelian lattice gauge theories*, arXiv:hep-lat/9808021, and his *Local cohomology in lattice gauge theory* lecture slides. These were navigation leads only; no theorem or quantitative constrained variant has been verified from them and no mathematical claim is delegated to these sources. The source-following finite induction is proved here rather than asserting an unverified general theorem. No novelty claim.

Boundary: analytic Ward data, the required fourth-order quadratic subtraction, and scalar Taylor recording are inputs. The present chapter supplies their invariant curvature lift and moment cancellations, not the production of those data or completion of the global transition.

Checks actually run: targeted `sed`/`rg` source inspections of the files above and the earlier curvature-horizon text; SHA256 capture. No Lean build, axiom replay or source mutation. Initial manuscript SHA256 `d49a1e422b5f2a4ea5ef8537fdf8ff44e03e602a481ef4f4022ddb803ef572b9`; independent review pending.
