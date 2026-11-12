# Actual local Gaussian prices — draft evidence

Parent-authored under issue #26, session `hairer-codex-existence-20261111`,
confirmed expiry 2026-11-12 16:40 UTC. Pinned Lean revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Owned text: `manuscript/existence/actual-reader-local-gaussian-prices.tex`.
Independent review requested; not integrated at drafting time.

## Inspected source and correspondence

- `YM.PhysicalNext.InteractingRank.StrongScope`, `scopes`, in
  `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Focusing.lean`
  (full read): exact endpoint. Uniform palette positivity/entry bound plus
  posed mean error x^(-7/8) and curvature covariance error x^(-1/8).
- `YM.PhysicalNext.InteractingRank.Pose`, `posing`, `inland`, in `Pose.lean`
  (full read): actual fixed `spine V o`, same global logarithmic v,
  retimed flag equality, every interior address's B-room/clearance/
  replica bound; w(x)=walls x. The section assumes this precise pose;
  it does not claim a new pose existence argument.
- `YM.PhysicalNext.InteractingRank.{retime,burst_limit,tall_limit,brims}`,
  `Reheat.lean` (targeted first 65 lines): x<=retime x<=x² and exact
  temp(retime x)=phase x; radiusB=ceil(log(x)^2) checked in
  `Lean/YM/Pressure/Seeds.lean`.
- `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture`,
  `Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean`
  (full read): mean and all-row/specified-column comparisons on the same
  official active-coordinate embedding. Specialize r=0,R=1 at retime x.
  Its actual small-window support proof is a separate assigned draft
  `actual-reader-small-window-bridge.tex`; this prerequisite is pending.
- `YM.AnalyticBridge.LocalGaussianLaws.Assembly.{expenses,diminishing,
  fieldComparison,headComparison}`, `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Ideal.lean`
  (full read): exact floor(B/100000) cut and floor(B/60) window costs.
- Same namespace `{priceQ,FreePrice,fromCloseness,freeHead}`, `HeadSwitch.lean`
  (full read): actual no-hole flat matching and full covariance price;
  the manuscript only uses the value-order covariance component.
- Same namespace `total`, `covered_fog`, `covered_mid`, `Taylor.lean`
  (first 135 lines): ordered and symmetrized bare windows identify with
  the cut flat precision on exactly the forest free coordinates.
- `YM.AnalyticBridge.LocalGaussianLaws.Current.cutHead`, TellerFold,
  independently reviewed in the separate tree-covariance section:
  final curvature sandwich is the retained fine-minus-coarse covariance.

The Focusing argument symmetrizes **both** entry bounds before applying
the curl sandwich. Both plaquette rows require the extra +1 margin.
Nonzero curl coordinates lie in the actual active-coordinate image by
the pose's local clearance. The proof uses finite row sums U and
U²(1+K)t^(-1/4)<=x^(-1/8), not independence or a full-matrix potential
inverse. Mean bound transfers using t>=x. All constants are fixed
post-patch and pre-period, with one eventual threshold.

## Reuse and remaining inputs

Canonical local-covariance supplies the positive actual palette, weighted
inverse estimate, perturbation identity and window error.
Principal-comparison-jets supplies the reference inner-radius inclusion;
actual-reader-tree-covariance supplies the exact attached flat precision
and conditional curvature identity. This file proves the cut/window rate
conversion and actual two-row sandwich. It does not duplicate Gaussian
density estimates or the free Fourier atlas.

Actual small-window mean/column proof remains a pending draft dependency.
The same path/floor/symmetry/stationary tower and quantitative paid patch
data remain explicit inputs; their binding is on the selected construction.
Nonlinear reads, mask loss and selected-history telescope are separate
assigned obligations, not consequences of StrongScope.

Literature index and canonical proofs consulted. The short finite matrix
and exponential calculations are proved; no external theorem replaces
them. No fresh Lean build, axiom replay or source edits. No LaTeX build
of this file yet. Independent review requested from the stronger agent.
