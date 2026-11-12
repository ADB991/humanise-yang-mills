# Radial free Ward identity

Author draft, independent review pending at creation. Source revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent author: hairer-codex-existence-20261111.
Prose: manuscript/existence/free-maxwell-radial-flux.tex.
Stable labels: sec:free-maxwell-radial-flux, prop:maxwell-radial-ward,
eq:maxwell-radial-polynomial-ward.

The earlier canonical free-maxwell-ward-flux chapter proved translation and
rotation and mentioned dilation's trace cancellation, but did not explicitly
supply the Euler flux required by the classifier. This chapter proves that
extra specialization on the SAME Wick stress; no normalization is reselected.

Source correspondence (fully qualified names):
- YM.Maxwell.Free.radial_K, variation_center, radial_flux,
  Lean/YM/Next/MAXWELL/Affine.lean. The drive is fromCenter 1 x. The single
  probe flux is -(j+2)sample p f x. The variation on a homogeneous degree-j
  Maxwell wave is (j+2) times the wave; the prose verifies this by differentiating
  the local dilation and normalized Taylor coefficient.
- YM.Maxwell.Free.metric, Lean/YM/Next/MAXWELL/Derives.lean, is the linear
  probe map (j+2)id. Its polynomial rewiring is the weighted Euler derivation.
- YM.Maxwell.Free.radial_motion, centers_collide, moment_force,
  Lean/YM/Next/MAXWELL/Taxes.lean: actual compact radial flux, same-centre
  two-pulse cancellation, and full Wick expansion. Prose checks all three
  contraction locations and the same polarization factor; no fake radial input
  is inferred from the rotation theorem.
- Immediate consumer: YM.Maxwell.Free.charges_quiet in Magnitude.lean uses
  Statistic.commute_ghost with radial_motion/metric. The classifier author owns
  that application and the parity/finite-capacity consequences, not this chapter.

Canonical inputs: free-maxwell-ward-flux regulator, stress/divergence formulas,
jet differentiation under separated compact collars, and two-leg Wick expansion.
No literature replacement is asserted for this small source-specific extension;
all additional dilation calculations are provided in prose.

Actually read: Affine.lean102–130 and180–248 including radial_flux in full;
Derives metric definition located by scoped rg; Taxes.lean read in full earlier
for the internal-erasure and radial_motion definitions; canonical flux chapter
relevant regulator/jet/three-placement passages. Magnitude consumer found by
scoped rg and assigned to classifier author. No Lean edit/build/axiom replay.
LaTeX, visual validation and independent review pending at draft creation.
