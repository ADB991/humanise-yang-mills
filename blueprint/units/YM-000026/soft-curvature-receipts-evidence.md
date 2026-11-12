# Soft curvature and local response arrays: source correspondence

## Status

Draft mathematical unit, awaiting independent mathematical/source review. No
Lean files changed. No Lean build, TeX build, or test suite was run. Source pin
is `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (the upstream source revision in
`source/upstream.json`, not the enclosing prose-repository HEAD).

Owned prose: `manuscript/existence/soft-curvature-receipts.tex`.

## Source declarations inspected

- `YM.Stationary.extra_curves`:
  `Lean/YM/Next/STATIONARY/Shape/SoftTransfers.lean`.
- `YM.Stationary.veneer`, `greyson`, `whiteWilson`:
  `Lean/YM/Next/STATIONARY/Shape/Scaled.lean`.
- `YM.Stationary.orbit_cost`, `term_vault`, `gramPath`, `gram_budget`,
  `quadratic_write`, `column_price`:
  `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`.
- `YM.Stationary.gathered`, `recital_cost`, `local_price`, `copies`,
  `bleed_record`, `bleed_cap`:
  `Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`.
- `YM.Stationary.full_ring`, `crux`, `elem_top`, `tested_area`,
  `priced_below`, `rayDark`, `rayBlack`:
  `Lean/YM/Next/STATIONARY/Shape/GaugeJets.lean`.
- `YM.Stationary.pure_grey`, `LawfulSum`, `whites_on_K`, `layers`,
  `transfers`:
  `Lean/YM/Next/STATIONARY/Shape/SoftTransfers.lean`.
- `YM.Stationary.dough`, `liquid`, `drink`, `drinkCost`, `pintCost`,
  `wedlock`, `cuddles`:
  `Lean/YM/Next/STATIONARY/Shape/Vertex.lean`.
- `YM.Stationary.Dai`, `Spool`, `winding`, `windTwin`, `roller`, `winglet`:
  `Lean/YM/Next/STATIONARY/Shape/Shim.lean`.
- `YM.Stationary.Drinkable`, `Bitter`, `nectar`:
  `Lean/YM/Next/STATIONARY/Shape/Vertex.lean`.
- `YM.Stationary.Mockup`, `Fruit`, `Syrupy`, `loanChar`, `blenderBar`:
  `Lean/YM/Next/STATIONARY/Shape/Rank.lean`.
- `YM.Stationary.tideMark`:
  `Lean/YM/Next/STATIONARY/OneLoop/Lattice.lean`.
- `YM.Stationary.slots_gain`, `leader_const`, `Wilson_stream`:
  `Lean/YM/Next/STATIONARY/Loops/Fourier.lean` and
  `Lean/YM/Next/STATIONARY/OneLoop/Lattice.lean`.
- `YM.Laurent.Width`:
  `Lean/YM/Laurent/Eval.lean`.

## Mathematical content written

1. The atom estimate uses the reviewed row-slot complex extension on a common
   link-variable ball. The degree-r product is bounded by the atom budget at
   width `sigma/2`; Cauchy's derivative cost is `circleTax(R,t+1)/(t+1)!`;
   the momentum strip is chosen by `4(t+1)^2 eta=sigma/2`. This makes the
   term cost exactly a fixed constant times the full `budget(sigma)`. Absolute
   convergence permits differentiation and finite anchor summation. The
   orientation average charges the product of reflected-character fees.
2. The Ward contraction is explicitly the sum over spatial axes with the
   external color word fixed, matching `crux`. The all-singleton term is the
   exact top-partition term `elem_top`; all other partitions use pictures of
   order `b-1` for derivatives of order `b=2,...,t`. Density of zero-total
   momentum meshes extends the identity to real momenta. The entry-ray step
   now follows the `ring_ray`/`rayDark`/`rayBlack` argument: first isolate the
   constant with one coordinate test; then use the identity at `q+w` minus
   at `q` to kill derivatives transverse to a leg; two legs kill the full
   differential.
3. The cubic and quartic streams give order-2 and order-3 pictures through
   four atom estimates and the Ward result. Their zero lower coefficient
   supplies the lower input for the order-2 Ward step. The curvature stream
   contributes the order-1 zero picture, then `veneer` combines the three
   records with ray orders `3,2,1` for `cureCore`.
4. The Wilson-subtracted estimate assembles the metric-face picture, row
   pictures of orders 2 and 3, and Wilson pictures. The order-1 difference
   has ray order 3: the attached Hessian identity and floor/sworn inputs give
   `B(0)=I`, and the Fourier expression is
   `curl*(B(p)-I)curl`, with each curl `O(|p|)` and `B(p)-I=O(|p|)`.
   `whites_on_K` supplies the exact input-series identification and lower
   lawful sums; `pure_grey` upgrades the higher records. The stated price is
   the sum of the metric/leader charges, row and Wilson prices, and the
   cubic/quartic budget.
5. The local response construction now uses the exact source route rather
   than generic polarization. At level `n=0,1,2`, the mixed derivative has
   `n` slots of one split-field species and two of the other. The ordered
   partition chain rule has zero one-block term (`DU(0)=0`); each block term
   uses an order `b-1` input picture, and every mixed picture has ray order
   `2-n`. Its finite coefficient bill is the sum over partitions and basis
   assignments of `b!` times products of absolute split-field derivative
   coefficients. The width loss is `calls(n+2,sigma)=sigma/(n+3)^2`.
6. The finite division peels exactly `2-n` one-link factors. Level 0 routes
   one factor to each of its two legs using
   `q(p,a)=-mode(p,step a)q(-p,a)`; level 1 uses one factor; level 2 uses
   none. Contour shifting bounds the weighted Laurent coefficient sum at a
   smaller width. The array addresses are the finite port keys and external
   color words; the factorization and Fourier character orthogonality give
   the exact finite-period response identity. The output therefore has the
   mathematical content of `Fruit` (uniform `Dai` width) and `Syrupy`
   (the `Bitter` response identity), assembled from the three levelwise
   `loanChar` constructions and their common minimum width / summed price.

## Crosswalk to reviewed units

- The one-slot action bound and signed orientation price are in
  `manuscript/existence/row-quadratic-price.tex` (independent bounded review
  passed; prose SHA at last review: `47159c91e5723fed34bb2e60a77e3558a1d0bc5080077d9ddec2c97ed38284db`).
- The bare Wilson symbol/coefficient price is in
  `manuscript/existence/wilson-vacuum-price.tex` (independent bounded review
  passed; prose SHA: `af0fd47c261b5b740e31e3ee1327081d970fa9e2f3398e0994bcea87c033943b`).
- Upstream dependencies for the selected Hessian identification remain the
  attached metric, floor and sworn hypotheses explicitly present in the
  theorem. The scalar-factor comparison for those conditions is parent-owned.

## Review boundaries

This draft is awaiting the final independent reread of the finite division
and mixed-response conversion. The most recent edits remove a duplicate
Hessian explanation, state explicitly that ray order implies the Taylor
vanishing needed for division, and retain periodicity as a hypothesis on the
input picture entries. No claim of a full Yang--Mills proof or of `tideMark`
closure is made beyond this bounded unit.

## Checks actually run

- Source declarations were read at the pin above; no Lean command was run.
- No TeX build was run.
- `python3 scripts/check_blueprint.py` was run and could not complete because
  this clone lacks the parent-owned
  `blueprint/units/YM-000026/unit.json`; no shared metadata file was created.
- `git diff --no-index --check /dev/null FILE` was run for each owned file;
  it printed no whitespace diagnostics and returned status 1 because each
  new file differs from `/dev/null`.
