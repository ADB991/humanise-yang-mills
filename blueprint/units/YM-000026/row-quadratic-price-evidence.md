# Evidence: weighted quadratic row estimate

## Status

Draft awaiting independent review. This proves the weighted two-index budget
and its momentum-space Cauchy assembly, conditional only on the ordinary
one-slot path-product estimate explicitly proved in the manuscript. It does
not close the nonlinear/annulus inputs to the full `flux_cap` theorem.

## Source correspondence

- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Path data and row budget: `YM.RG.PathData`, `YM.RG.PathData.Bounds.rows`,
  and `YM.RG.PathData.ellTerms` in `Lean/YM/RG/PathActions.lean`.
- The exact pair atom is `YM.Stationary.gramPath`; its support length and
  color-summed coefficient magnitude are `YM.Stationary.gram_size` and
  `YM.Stationary.gram_charge`; its evaluation as the inner product of two row
  terms is `YM.Stationary.gram_eval` in
  `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`.
- The weighted sum is `YM.Stationary.gram_budget`; it uses
  `budget_prod_finite` and factorizes the two independent row sums. Its
  constant is `gramCost G C = |PlaqAxes| * C^2 * (|ColorIndex|/2)`.
- The local path-product bound is `Work.F02.slotExt_bound` and the two-slot
  atom version is `Work.F02.atomExt_bound` in `Lean/YM/Work/F02/Path.lean`.
  The Cauchy summation chain is `YM.Stationary.all_ages`,
  `YM.Stationary.term_vault`, and `YM.Stationary.gathered` in
  `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean` and
  `Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`.
- The exact application to the path kernel is
  `YM.Stationary.quadratic_write` and `YM.Stationary.column_price` in
  `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`. `quadratic_write`
  splits the local action into the direct Wilson term plus the sum over
  `gramPath`; `column_price` combines the latter's price with the bare
  Wilson picture from `YM.Stationary.Wilson_stream`.

## Mathematical boundary

The manuscript expands the row-square algebra, its absolute activity sum,
the length-two holomorphic bound, strip growth, uniform convergence, and
finite-torus character summation. The countable Cauchy assembly is proved in
the stated argument using its explicit M-test majorant. The application
corollary requires the exact decomposition displayed in the statement; for
the public path kernel this is `quadratic_write`.

Remaining flux inputs include `Films.RankColor.honored`,
`Shape.VertexWeights.setWest`, `OneLoop.Lattice.tideMark`,
`Loops.Curvature.bequest`, `Loops.HessianMatch.quoting` and
`pole_reduced`, plus the annulus/response receipts. This unit does not claim
their production.

## Checks actually run

- No Lean or TeX build run.
- `python3 scripts/check_blueprint.py` was run and failed because
  `blueprint/units/YM-000026/unit.json` is absent in this clone; no shared
  metadata was created.

## Final source checks added in this revision

- The slot extension is exactly the complex-linear extension of the real
  skew-coordinate functionals applied to half the difference of the forward
  slot string and its reversed string. See `YM.Work.F02.colorProject`,
  `slotMatrix`, and `slotExt_physical` in `Lean/YM/Work/F02/Path.lean`.
  The slot walk has length at most twice the declared slot length;
  `slotExt_bound` obtains the exponential bound on a common complex ball
  before any derivative is taken.
- The manuscript explicitly checks normal convergence of the two-index row
  expansion on that common ball, using the product of the row budgets. This
  justifies holomorphy and termwise coefficient extraction rather than
  inferring it from momentum-strip bounds alone.
- The averaged application follows `YM.Stationary.rotPix`, `reflectFee`,
  `pix_firm`, `bleed_cap`, and `bleed_record` in
  `Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`. For each entry the
  transformation is a product of `t+1` reflected-character fees and the
  original entry at rotated directions and rotated momenta. Each fee has
  price `exp((t+1) eta)`; their product is exactly bounded by
  `reflectBill t eta = exp((t+1)^2 eta)`. The final normalized signed average
  preserves the bound and its record identity. `column_price` in
  `ClassicalMatch.lean` uses this `bleed` step to represent `inputSeries`.
- These are mathematical correspondences checked by source inspection only;
  no Lean build, TeX build, or blueprint checker pass is claimed in this
  revision.
