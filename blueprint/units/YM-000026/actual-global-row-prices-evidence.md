# Actual global Gram, move and selected-source prices

Draft, YM-000026; parent author session hairer-codex-existence-20261111.
Pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Prose `manuscript/existence/actual-global-row-prices.tex`,
`sec:actual-global-row-prices`, `prop:actual-global-row-prices`.
Disjoint from limits author's Barge product/Signal/Pupil assembly.

## Exact targets

Namespace `YM.AnalyticBridge.MarginalMultiplier3b1d`:
- `credit`, `kernelPrices`, `credit_post`, `kernel_post` in
  `Lean/YM/AnalyticBridge/MARGINAL_MULTIPLIER_3B1D/Ground.lean`.
  Fixed Pt:Teller G, P:Patch, hp:P.Branches Pt.bind G. Constants
  η>0,K≥1,u,v>0 before eventual x; forall S,T with S.patch=P,
  100(1+radiusB x)≤coarse side, Pt.Funds S T; forall A,F,k,V with
  A.flags=RG.flags(temp x)V. The literal Rows.gram is Q=M^T M on
  active link coordinates; N=per(panels A F)Q and C=clouded(panels A F)Q.
  Credit has Pours Q,C,N rate0 K; Q,C PosDef and Gapped η;
  Pours(N-Q^-1) rate0 (u*exp(-v*(radiusB x/60))). Natural division.
- `SourceBounds.source_bound`, `SourceBounds.move_bound` in
  `.../MARGINAL_MULTIPLIER_3B1D/Source.lean`: same uniform domain. Fixed r≥0;
  0<d≤r*fiery; forall q,Y,i source≤Z*fiery; move Pours between down/front
  anchors at rate Pt.top.width/2. Source includes frozen displacements.
  No differentiated dependence of frozen inputs on V is needed.

## Reused canonical proofs and actual specialization

`sector-gram.tex` supplies selected-row coercivity and weighted row/column
bounds from local predictor derivative and cut-path bounds. Active Q is
restriction of its inactive-completed precision, so zero extension proves
its floor; no fresh small-panel assumption. `local-covariance.tex` proves
weighted inverse decay uniformly for principal submatrices, varying-window
column inverse bounds, residual QN-I, ordered N-Q^-1=Q^-1(QN-I), and
symmetrized covariance floor. These proofs apply to actual panels without
assuming Q or C is the bare/flat Gram. Source `Ground.per_approx` follows
this exact residual route; source `credit_post` combines opaqueCost,
Schur.windows and provides, and kernel_post applies boards.

In namespace `YM.Next.SectorChange`, source
`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean`:
`points`, `meeting`, `panels`, `meetings`, `boards`, `fog`, `opaqueCost`.
Panels require all pairs of coarse endpoints at distance≤B/20. Endpoints
are within1 of parent anchor; B/60+2≤B/20 for B≥120 gives ball inclusion.
No upper-radius estimate is used in the residual proof. Weighted norm counts
include color/orientation/residue multiplicities before periodization.
`Wisps.written` in `.../Wisps.lean` gives actual scalar move entry bound
at rate width, combining local face derivative, path row bound and
`earned`. Anchor counting halves the rate. `earned` in `.../Author.lean`
clears a fixed predictor neighbourhood and uses its actual original tags;
no globally-small configuration is inferred from local smallness.

## Selected background and source calculation

`YM.AnalyticBridge.MarginalMultiplier3b1d.Background` in
`.../MARGINAL_MULTIPLIER_3B1D/Background.lean` (read in full):
- `safe`: no flag in cleared dome implies small plaquette chord.
- `setback`, `spun`: signed coarse gauge and parent-lifted fine gauge;
  reversal moves anchor by≤1 and inversion preserves chord.
- `turned_face`: four-link chord bound in a local gauge.
- `face_base`: each touched plaquette gets its own gauge; path row sums
  and direct term give C*fiery. Global guide estimates come from
  Work.E04.answer/Work.E03.answer with empty-store Plot (frees_plot),
  which does not assert the actual store is empty.
- `bond_base`: local log chart at actual selected predictor, then
  `YM.SectorNext.Remainder.Affine.bond_local` in
  `Lean/YM/SectorNext/LARGE_FIELD_REMAINDERS/AffineBond.lean` at a=0.
  Bound is linear C*fiery, not a falsely quadratic base remainder.
- `base_post`: face and bond cases, subtract the same guide.

Canonical Ct base-stroke proof reused from warning-safety.tex, first subsection,
with explicit actual selected-store/signed-channel correspondence. Its subsequent
mean calculation is not used for the kernel estimates. Further gauge/path/guide/local predictor inputs reused from
seed-tree-patch.tex, seed-guides.tex (especially guide-maximum),
seed-unhit-comparison.tex, predictor-branch.tex, packet-annulus.tex.
The new prose explicitly localizes every chart and preserves period-uniform
constants; path target gauges need not be one common gauge because only
norms are compared.

`SourceBounds.{settle_price,barrel_bound,bump_post,source_bound,move_bound}`
in Source.lean (read in full): all fine directions, not merely active ones.
barrel sums isometrically transported plaquette derivatives against absolute
path coefficients; predictor uses earned and a fixed stencil cardinality.
Frozen `Rows.input` has norm≤2d via patched_small (else zero).
Rows.source is selected restriction of base+bump, with fixed slip factor;
projection to scalar color has norm≤1. Exact constant can be taken
slip*(C_b+2rC_a)+1. No derivative of held Y is claimed.
Read `Rows.{faceKick,bump,restrict,source}` in
`.../GAUSSIAN_SECTOR_CHANGE/Affine.lean` and `Rows.gram` in Remainder.lean.

## Scope and checks

Proves the three literal global suppliers for the forthcoming all-Matched
palette argument; does not replace Barge's Signal identity or Pupil's local
Toned-to-sock estimate. No posed-reader comparison is used as a global bound.
Constants/tails depend on fixed Teller and Patch (and r for source), before
period/stores/tags/field/frozen displacement. Thresholds may be intersected
because only finitely many are needed.

Searched shared background notes for Gaussian/inverse/Schur results; reused
existing canonical finite-matrix and gauge proofs, with no additional external
theorem or literature shortcut. Scoped rg/sed/cat reads listed above; no Lean
changes, Lean build or fresh axiom replay. Candidate not integrated; independent
mathematical/source review, TeX build and rendering pending.
