# Evidence: uniform analytic price for the bare Wilson plaquette sum

## Status

Draft, not independently reviewed. This unit proves the finite-volume local holomorphic bound and its finite
plaquette assembly. The link-coordinate ball estimate is converted to the
momentum-strip price by testing the local Taylor form on Fourier modes. It
does not prove the other substantive receipts needed for the full one-step
`flux_cap` theorem.

## Scope and source

- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Main source chain: `YM.Stationary.price_vault` and
  `YM.Stationary.Wilson_stream` in
  `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`;
  `YM.Stationary.brush_bounds`, `pulseSize`, `pulsePrice`, `pulseCont`, and
  `fixed_orig` in the same file; `YM.Stationary.gathered` in
  `Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`.
- The support radius is the four-edge boundary of one plaquette. The complex
  extension is the average forward/reverse trace pulse. `brush_bounds` selects
  a uniform neighborhood of the identity by continuity of the matrix
  exponential; The derivative uses Lie coordinates composed with the exponential at zero,
  and the link-array norm is the sup norm. `stringMat_bound` bounds a
  length-four product by
  `(1+radius(1))^4 * ||1||_F`; compactness of the zero-centered balls
  containing the four-edge products gives the uniform pulse bound.
- `gathered` assembles the finite family of plaquette types. Its exact
  coefficient identity follows from `copies`, `mixtape`, and `local_price`:
  the sum over translated anchors is zero unless total momentum is zero, and
  in the zero case it is torus cardinality times the local coefficient.
- The picture is common to all torus sides and lives in `t` independent
  momentum variables with finite color/oriented-link addresses. It is defined
  by the local Taylor form on the auxiliary side-nine torus (`d=4`,
  `2d+1=9`). The order-`t+1` coefficient identity has the exact
  torus-cardinality factor in the zero-total-momentum case and vanishes
  otherwise; wrapped small-period repetitions are retained by pullback. The strip/derivative
  scale is exactly `recitalScale(t,4,1)=exp(16(t+1)^2)`. The derivative factor is
  `costNote(t+1,R_*)=(t+1)!^{-1} circleTax(R_*,t+1)`.

## Mathematical boundary

The manuscript's proposition is the exact bare Wilson baseline used by
`YM.Stationary.whiteWilson` and `YM.Stationary.tideMark`. It establishes the
local extension and finite plaquette summation directly. The general
countable-atom summation result behind `gathered` is not re-proved here; its
hypotheses and coefficient bookkeeping are stated in the remark, and the
selected bare application is finite. Remaining `flux_cap` inputs include the
non-vacuum row/annulus estimates and the response tickets listed in
`path-attachment-producer-evidence.md`; this unit does not claim those are
closed.

## Checks actually run

- No Lean build or TeX build run.
- `python3 scripts/check_blueprint.py` was run and failed because
  `blueprint/units/YM-000026/unit.json` is absent in this clone; no shared
  metadata was created.
