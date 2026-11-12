# Independent bounded review: cross-order Maxwell pairing separation

Reviewer: parent agent, session hairer-codex-existence-20261111, 12 November 2026.
Author: limits_draft in its isolated clone. The independent Astra reviewer
identified the omitted source argument and suggested its source steps; this
separate review checks the repaired argument directly. The parent did not edit
or author the classifier candidate. This is not whole-unit acceptance.

Candidate TeX SHA-256:
`7a02f08973d12c0487f410a3152bb6326127edc36adfabba9fc7c5f06ab7ec5e`.
Evidence SHA-256:
`103c21635c98835b6c3cd214f36b06562aaa228b6b14a787b3d75a439e7129bc`.
Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope and result

Bounded pass for the new general separation argument, its order-one application,
nontriviality of each sheet, and the finite-dimensional dual-span conclusion.
The rest of the classifier is covered by the separate review, not this verdict.
The required radial single-charge theorem is the previously independently
reviewed canonical radial-flux chapter, with unchanged normalization.

Read full `Lean/YM/Next/MAXWELL/Flavor.lean`, `Born.lean`, and `Hidden.lean`;
read the meaning-determining Sheet/Flavor/color maps in Paint.lean, polynomial
wave and normalized coefficient identities in Jets.lean, radial_flux in
Affine.lean, K_sample/K_right_D in Kernel.lean, and kernel_pole in Pole.lean.
All qualified declarations are in `YM.Maxwell.Free`.

- `Sheet h` is the real Maxwell solution-jet space; `Flavor h` is its real
  dual. This is not an identification of invariant labels with all colored
  polynomials. `fill` embeds a chosen scalar sheet in one fixed color.
- `payment` tests the color-resolved pulse against all zero-order coordinate
  probes. Vanishing of those pairings makes every component of the pulse zero
  off its marked point. The compact cutoff derivative is supported away from
  that point, so the current flux vanishes. For any sheet A of order h,
  `wavePoly`/`asWave_jet` give a global homogeneous Maxwell wave whose normalized
  h-th Taylor coefficient is A. `radial_flux` then gives zero = -(h+2)p(A).
  Since h+2 is nonzero and A is arbitrary, p=0. No positivity of an across-order
  pairing, and no distributional product at the pole, is assumed.
- For the inductive step in `ranging`, start with a lower-order probe q of
  order ell-1. Its derivative pairing is the higher-order test, with the sign
  from x-y absorbed in the derivative direction. The hypothesis kills these
  derivatives. `kernel_pole` and Euler's identity yield
  -(4+h+ell-1)K(x)=0. The coefficient is nonzero; lower-order vanishing follows,
  and induction applies. The candidate now has the correct direction of this
  implication. It does not differentiate an already zero higher-order pairing
  to obtain a lower one.
- `Born.has_sheet` argues by contradiction from `Flavor.cell_alive`: if an
  order-c sheet were zero, all its probes would vanish, forcing the nonzero
  zero-order coordinate functional to vanish by the just-proved separation.
  This justifies choosing a probe and sheet with evaluation one at each of
  the distinct orders used in the determinant specialization.
- `Hidden.probe_radius_span` uses all nonzero displacements and a fixed partner
  order. The zero-annihilator argument, the color decomposition and ordinary
  finite-dimensional duality justify the asserted span. It is not a span at
  one momentum or one displacement. Applying the resulting linear map to a
  basis yields all the polynomial partial derivatives, as in `group_meal`.
- In the panel argument the special case h=1, ell=0 is now tested against
  arbitrary A in S_1. Its radial factor is -3, so it annihilates the whole
  order-one functional. The erroneous earlier claim about zero-order waves
  testing the order-one sheet is absent from this candidate.

## Actual checks and limits

Scoped `rg`, `cat`, and `sed` source reads and candidate excerpts; SHA-256
computed with `shasum -a 256`. No Lean edit/build or axiom replay. The parent
will run the integrated structural and LaTeX checks separately. The source
argument has not been replaced by a new proof. This bounded review says nothing
about the global selected-history binding, external trace estimates or complete
existence-proof closure. Machine-readable unit approvals remain unset.
