# Selected tree curvature covariance — draft evidence

Parent-authored within confirmed issue #26 claim, session
`hairer-codex-existence-20261111`, expiry 2026-11-12 16:40 UTC.
Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Owned text: `manuscript/existence/actual-reader-tree-covariance.tex`.
Status: draft; submitted to independent-review agent for both mathematical
and Lean correspondence review. No self-approval and no metadata approval.

## Source correspondence

All paths below are below `Lean/YM/`. The relevant declarations and their
immediate definitions were read in full, except Station/Affine where targeted
definition and derivative portions were read. No whole source-tree read.

| Mathematical step | Fully qualified declarations | Path |
| --- | --- | --- |
| Counting colour coordinates, full and compressed precision, positive slice gap | `YM.FreeResolvent.{tensor,baseMatrix,fullMatrix,treeMatrix,tree_gap,treeFare}` | `Push/FREE_RESOLVENT/Flat.lean` |
| Actual flat path-row identification | `YM.FreeResolvent.Affine.{identity_track,identifies,channel_qf,channels,duct_zero,pulled_inner}` | `Push/FREE_RESOLVENT/AffineGap.lean` |
| Channel and normalized channel average | `YM.FreeResolvent.Affine.{tracks,channel,block,primary}` | `Push/FREE_RESOLVENT/Affine.lean` |
| Root-pinned forest projection and slice inverse | `YM.FreeResolvent.{potential,representative,roots_pinned,onto_slice,fixes,invariant,treeInverse,covariance,block_solve}` | `Push/FREE_RESOLVENT/GaugeProjection.lean` |
| Curvature solve without a full potential inverse | `YM.AnalyticBridge.LocalGaussianLaws.Current.{right_of_count,holder,holder_value,copper,flux_psd,flux_symm,learned}` | `AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Flux.lean` |
| Coarse column, curvature intertwiner and stationary equation | `YM.AnalyticBridge.LocalGaussianLaws.Current.{psi,neuron,spins,fires}` | `AnalyticBridge/LOCAL_GAUSSIAN_LAWS/TellerFold.lean` |
| Cross covariance, curl equation and final equality | `YM.AnalyticBridge.LocalGaussianLaws.Current.{crossed,through,fConditional,plane,cutHead,conditional_psd}` | same |
| Root-corrected predictor | `YM.Precision.{fixRoot,mean,probe,psi_proj,root_gradient}` | `PREC/FrameResponse.lean` |
| Straightened stationary column | `YM.Precision.{straighten,extracted,centers,stays,Inputs,stationed}` | `PREC/TreeMatch.lean` |
| Meaning of metric/diagonal/attached hypotheses | `YM.Precision.{Bed,Attached,Floor,Towers.Diagonal}` | `PREC/Stacks.lean` |
| Signed curl invariance and geometric hypotheses | `YM.Bid.{pulled,Sworn,Larger}` | `Bid/Station.lean` |

Notation: manuscript `D,D'` are fine/coarse `d 1`; `d_f,d_c` are `d 0`;
`Q` is `probe`, not `mean`; `R_0` is `fixRoot`; `M_f,M_c` are **metric**
operators; `H_f,H_c` are **diagonal** operators. The identities used to
define `J` are `Floor.diagonalInv` and `Towers.Diagonal.stays`. The latter
does not justify replacing a metric everywhere by a diagonal operator.
`W` is the `extracted` installed `Towers.A0` column. `X` is the
zero-extended actual tree inverse, not a Moore–Penrose inverse.

## Canonical reuse and boundary

Reuses predictor-branch, seed-tree-patch and sector-gram for the actual
predictor derivative and flat tree link inequality; uses the already
constructed same precision tower rather than another free model. The
finite algebra follows the main steps of `Affine.identifies` and
`Current.cutHead`. The elementary range/kernel argument in Flux and the
stationarity calculation are proved explicitly; no external theorem is
used in their place. Shared literature index and local Gaussian references
were searched; no matching recorded source was found that would simplify
this source-specific tree/covariance identification. No claim of novelty.

The section retains same-bed path attachment, absolute path bounds,
factorization, signed symmetry, positive floors, predictor branches,
geometric side conditions and both stationary tower identities. It
establishes the exact algebraic identification, not production of all
those hypotheses on the selected public history. It also does not replace
the separate small-window posed-field comparison or the reference cutoff
error. Those use canonical local inverse/residual estimates and the
narrow bridge assigned to lattice-draft. No separate Gaussian reader
sampling or omission of harmonic potential directions is allowed.

## Checks

Targeted `rg`, `cat`, and `sed` inspections recorded in the parent session.
No Lean commands, axiom replay, or source edits. No LaTeX build yet for
this new file; the preceding 734-page build does not include it.
Independent review is pending. Structural check to be run on integration.
