# Actual all-matched palette warning: evidence

- Canonical task: issue #26, unit YM-000026.
- Status: author draft; independent mathematical/source review pending.
- Manuscript: `manuscript/existence/actual-palette-warning.tex`.
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Scope: finite weighted-response arithmetic, the same-selected-pilot local zero-socket argument, and the source quantifier join that yields the two palette clauses. The global kernel/source/move prices are supplied by the parent unit `sec:actual-global-row-prices`; this unit does not claim to derive them.

## Correspondence

| Manuscript content | Fully qualified source declarations | Pinned source paths | Correspondence |
| --- | --- | --- | --- |
| Active-to-row response map, source, mean, direct row, and auxiliary row | `YM.Next.SectorChange.Rows.move`, `source`, `blame`, `direct`, `eta`; `YM.Next.SectorChange.meanLog` | `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/{Affine,Remainder,Chosen}.lean` | `move` has response-row coordinates (slots and color) as its rows and active link-color coordinates as its columns. Thus the source transport is `moveᵀ source`, the selected mean is minus the transpose of the panelized Gram matrix times that transport, and the direct response is `move*mean + source`. The auxiliary row is `-g⁻¹(gram*mean + blame)`; the displayed defect form is algebraically equivalent. |
| Uniform global kernel, gap, and window-defect prices | `YM.AnalyticBridge.MarginalMultiplier3b1d.kernel_post`; `kernelPrices.margins` | `Lean/YM/AnalyticBridge/MARGINAL_MULTIPLIER_3B1D/Ground.lean` | The parent’s `sec:actual-global-row-prices` records the selected-history application of the actual Gram, panel covariance, panelization, inverse, and gap prices. No diagonal or posed-reader substitution is made. |
| Source-row and move-row estimates | `YM.AnalyticBridge.MarginalMultiplier3b1d.SourceBounds.source_bound`, `.move_bound` | `Lean/YM/AnalyticBridge/MARGINAL_MULTIPLIER_3B1D/Source.lean` | These bound the actual source on frozen data and the actual move map on active coordinates. The manuscript uses the resulting all-period componentwise bound and rectangular row/column price in the finite matrix estimate. |
| Auxiliary-row defect and broad-span implication | `YM.AnalyticBridge.MarginalMultiplier3b1d.signal_bound`; `YM.Next.SectorChange.broad_span` | `Lean/YM/AnalyticBridge/MARGINAL_MULTIPLIER_3B1D/Force.lean`; `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/*` | The defect is `N-Q⁻¹`; the sign in the auxiliary-row identity is fixed by `eta = -g⁻¹(Qm+b)`. With `m=-Nᵀb`, this is `-g⁻¹Q(Q⁻¹-Nᵀ)b`. The coupling inverse bound follows from the selected beta band. |
| All-matched response receipt | `YM.PhysicalNext.InteractingRank.Barge.Sound`, `.dredge`; `YM.PhysicalNext.InteractingRank.Pump.Coffer.noises` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Dredge.lean`, `Coffer.lean` | `dredge` constructs one uniform `Sound` estimate with quantifiers over stores, forests, tags and configurations. Its `taxes` field is the endpoint Pours bound; its response fields are uniform over every pilot, not just a generic or dense subfamily. |
| Exact endpoint palette and Pupil clauses | `YM.PhysicalNext.InteractingRank.Pump.Grid.Pupil`; `YM.PhysicalNext.InteractingRank.Pump.ballot` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Acreage.lean`, `Mezzanine.lean` | The endpoint palette is exactly the clouded panel Gram matrix (`Q_endpoint`). `ballot` sets the nonnegative fee to `ε*fiery/coupling(beta)`, gets the credit clause from `Sound.taxes`, and gets the socket clause from `putAway` using the local certificates below. |
| Uniform selected chart/beacon/annulus package | `YM.PhysicalNext.InteractingRank.Pump.Granite`, `.excels`; `YM.PhysicalNext.InteractingRank.Milk.Beacons`, `.Prognosis`, `.torch` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Mezzanine.lean`, `Wiggle.lean` | `excels` chooses one width and beacon parameter and returns chart, annulus, deep-door and beacon receipts. `torch` gets the CAB plateau key from `YM.AnalyticNext.ConnectedActivity.Jewels.night`, the CAB chart bound from `.guard_broad`, and the mean-switch proposition from `.prognosis`. The displayed subtraction identity is `YM.AnalyticNext.ConnectedActivity.Aff.takes_sub`; its bounds are proved by `.velocity` in `Stint.lean`. `YM.PhysicalNext.InteractingRank.Milk.peers` combines that coordinate estimate with `.full_pose` and `.same_face` to compare the actual portrait of the selected field with the CAB mean: two per-color errors `x^(-7/8)` give `2 dim(G.ColorIndex)x^(-7/8)≤x^(-3/4)`. `Wiggle.shelter` then identifies the CAB-sewn configuration with the actual physical field, by separate trunk, active and frozen-link cases. No CAB matrix/law is identified with actual reader matrices `Q,C,N`. |
| Outposts, port-to-log bridge, and far-door bound | `YM.PhysicalNext.InteractingRank.Milk.blaze`, `.distant_links`; `YM.PhysicalNext.InteractingRank.Pump.DeepDoors`, `.putAway` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/{Shield,Toe}.lean` | `blaze` turns the local beacon receipts on the radius-`B` neighborhood into faces, braid and frame outpost data. The port estimate sums the fixed macrobox face tolls and adds the connector chord; the logarithm chart and injectivity-ball identity then identify the actual tape. `distant_links` applies this to obtain the uniform door-tape bound. `putAway` uses the same store, forest, tag and field to show each of the five mask coordinates equals one. |
| Toe separation and local gauge/chart estimate | `YM.PhysicalNext.InteractingRank.Milk.full_pose`, `.shelter`; seed-tree port estimate | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Pairing.lean`, `Wiggle.lean`, `Toe.lean` | `full_pose` constructs a based gauge chart at the toe. On the nonzero-socket branch the support foot is disjoint from the radius-300B store dome and contains the toe; nested domes imply the toe is outside radius 50B. The local beacon then applies at every site within B. The port estimate sums the fixed macrobox face costs and connector chord, and the logarithm chart identifies the tape. The elementary separation is source footfall(toe in foot) plus inclusion of radius-50B dome in radius-300B dome; no external geometry-port lemma is invoked. `shelter` checks the actual same field on trunks, active coordinates and frozen coordinates. |
| Public selected-history caller | `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction`; `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction`; `YM.Independent.constructionRun`; `YM.MergeProof.solaris` | `Lean/YM/PhysicalNext/Integration/RG05Preconstruction/PeriodConstruction.lean`; `Lean/YM/PhysicalNext/Integration/RG05Preconstruction/Fares.lean`; `Lean/YM/Independent/*`; `Lean/YM/MergeProof/*` | The public selector chooses the selected history once. Its stored `Nest`, `Climbs`, `Freight` and `Makes` are passed to the same universal fare certificate at the actual `Bolt` family; the palette estimates are uniform over every matched pilot in that stored family. `solaris` supplies the eventual invitation conditions for each fixed section/grade, uniformly in period, rather than one cutoff common to all grades. |

## Mathematical content and retained inputs

The weighted-response proposition proves its finite-dimensional inequalities
from the rectangular row/column price. The (M^{\mathsf T}) orientation is
essential: the source map takes active coordinates to response rows. The
auxiliary estimate uses the inverse-defect price and the coupling inverse;
the broad-span implication then turns a nonzero door into the (x^2) noise
bound. The screened covariance’s common Pours cap is inherited from the
uniform global-price unit.

The local socket argument is on the same matched pilot throughout. A nonzero
socket implies the branch where its support foot is disjoint from the
store dome; the converse is not asserted. Toe separation, the beacon on every nearby site, the port sum,
the logarithm chart and the far-door estimate then imply that each mask
factor is one. The all-pilot quantifier is inherited from `excels` and the
uniform `Sound` estimate; it is not obtained by a continuity or genericity
argument.

For the expanded CAB-to-actual beacon calculation, the rates are rho_(r,k)(x)=radiusB(x)^k fiery(x)^r; the key bought scales are rho_(2,25), rho_(2,26), rho_(2,27)≤x^(-7/8), rho_(2,29), and rho_(2,40). The final beacon fee is half the CAB plateau threshold. The local target payment uses delta=a_*/64 and the row-price choice epsilon_0=min(1,delta sqrt(omega_CAB)/(4(1+sqrt(dim(G_color)))W_row)); it bounds the shifted action by 2 W_row epsilon_0 t and splits the target into two delta t/2 terms. The finite subtraction identity is YM.AnalyticNext.ConnectedActivity.Aff.takes_sub,
its two paid terms are bounded by velocity in Stint.lean, the actual portrait
comparison is peers using full_pose and same_face in Milk/Pairing.lean, the
shift budget is prognosis, and the same-field identity is YM.PhysicalNext.InteractingRank.Milk.shelter in
Wiggle.lean. The remaining plateau and broad-chart estimates are the
precise reserve/wedge consequences of YM.AnalyticNext.ConnectedActivity.Jewels.night
and guard_broad; their hypotheses are retained as the purchased uniform
reserve, branch, wedge, and finite-chart data rather than confused with the
actual matrix prices. The parent unit sec:actual-global-row-prices has passed independent review and supplies these selected-history bounds. No external
literature result was used for the finite matrix arithmetic or the exact
source-specific assembly.

## Checks and limits

- Inspected the declarations and immediate dependencies listed above; no
  Lean source was modified.
- `git diff --check` passed for the manuscript edits.
- `python3 scripts/check_blueprint.py` was run and could not complete because
  this clone lacks the parent-owned
  `blueprint/units/YM-000026/unit.json`.
- No Lean build or LaTeX build was run.
- Status remains author draft pending independent mathematical and source
  correspondence review.
