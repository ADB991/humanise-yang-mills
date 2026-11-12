# Free internal Ward-kernel erasure

Status: author draft; independent mathematics and Lean correspondence review pending.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Owned manuscript: `manuscript/existence/free-internal-ward-erasure.tex`,
label `sec:free-internal-ward-erasure`.
Parent author: hairer-codex-existence-20261111. The Luna limits drafter supplied
an initial internal-erasure sketch; parent rewrote the separate chapter after
reading the exact source and will obtain the Astra review independently.

## Statement and source correspondence

- `YM.Org.Two`, `YM.Org.Winds`, `YM.Org.erases`,
  `Lean/YM/Org/Input.lean`: real bilinear skew-matrix parameters, complex-linear
  endomorphism of one finite grade; proper signed covariance, real/unit/alternating
  laws and preservation of each inclusion range; all separated finite word rows
  at that same grade. These definitions were read, not inferred from names.
- `YM.Maxwell.Free.erasing`, `Lean/YM/Next/MAXWELL/AwayTeam.lean`:
  threshold exactly 4 under `G.Simple`; low-grade commutation, low-grade erasure,
  stress annihilation, actual rotational motion, same-capacity commutator and
  full-grade quarter-turn erasure. `brand/address` transport is suppressed in
  prose by identifying the field space with its invariant polynomial image.
- `YM.Maxwell.Free.low_support`, `Lean/YM/Next/MAXWELL/Ends.lean`:
  grade four is the span of the unit and invariant zero-jet quadratic teams.
  Reused from canonical `trace-free-rank.tex`; does not mean every higher grade
  consists of zero-order probes.
- `YM.Maxwell.Free.corridor`, `pair_nonzero`, `two_stat`, `low_motion`,
  `Lean/YM/Next/MAXWELL/Depth.lean`: House identity is used only in grade four.
  The prose expands the private `house_cost`/`bond_rotate_same_list` step using
  the existing explicit curvature covariance, its diagonal values on an axis,
  and Wick expansion. It then subtracts the two skew-pairing identities exactly
  as `low_motion` does. Reflection positivity is used on an axis pair.
- `YM.Maxwell.Free.Corners.quarter`, `quarter_house`, `bracket_orient`, `none`,
  `Lean/YM/Next/MAXWELL/Quarters.lean`: quarter-turn conventions and finite
  alternating tensor proof. Shared-index pairs use the fourth axis and a
  half-turn; four-distinct-index pairs use two quarter-turns and alternation.
- `YM.Maxwell.Free.silence`, `ghost`, `ghosts_out`, `commute_ghost`,
  `Lean/YM/Next/MAXWELL/Statistic.lean`: arbitrary number of spectators at one
  grade, distinguished null vector; proof expands the enlarged stress Ward row,
  finite flux sum, and second Ward row with the rotational derivative at the
  same grade. The null vector itself remains in that grade, allowing strict
  reflection positivity. No uniform external detector theorem is required here.
- `YM.Maxwell.Free.rotational_motion`, `moment_force`, `petal_green`,
  `Lean/YM/Next/MAXWELL/Taxes.lean`: actual compact rotational flux on arbitrary
  Wick polynomials, including the same-insertion and unmarked contractions;
  these are supplied by `free-maxwell-ward-flux.tex`, not newly assumed.
- `YM.Maxwell.Free.circle_ode`, `complete_turn`, `AwayTeam.lean`:
  finite-dimensional rotation ODE promotes infinitesimal commutation to the
  quarter-turn. Prose proves uniqueness by multiplying by the inverse matrix
  exponential, a routine expansion of the same ODE argument.

## Canonical inputs and literature

Reuse `trace-free-rank.tex`, `free-maxwell-ward-flux.tex`, and
`all-grade-free-detectors.tex`. The latter gives strict positivity for all
polynomial classes and, in particular, the axis test used here. Those chapters
remain draft canonical suppliers, not external axioms or reviewed global closure.
The shared background README and current main background file inventory were
checked. No matching literature theorem is asserted for this precise finite
Ward-kernel statement; the proof follows the source main steps. Matrix
exponential uniqueness and the finite basis argument are proved directly.

## Inspection and checks actually run

Read in full `AwayTeam.lean`, `Statistic.lean`, `Depth.lean`, `Quarters.lean`,
and `Taxes.lean`; read `Org/Input.lean` lines 105–175 and `Ends.lean` 1–110;
read the existing free-stress covariance and the strict detector theorem/proof.
Commands used `cat`, bounded `sed`, and `rg` for exact definitions and labels.
An earlier oversized read was truncated and was replaced by these bounded reads.
No Lean build, kernel replay, or fresh axiom audit was run. LaTeX build, rendering,
structural checker and independent review remain pending at draft creation.

Open: independent review must check the explicit House covariance factor and
sign, quarter-turn orientation, precise finite-grade hypotheses, and reuse of
canonical strict positivity and stress flux. This local theorem does not by
itself certify physical angular calibration or whole-endpoint closure.
