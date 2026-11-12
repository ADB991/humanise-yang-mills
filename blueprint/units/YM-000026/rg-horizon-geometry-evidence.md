# Actual finite tower and path binding evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; independent mathematics and Lean correspondence reviews pending.
- Manuscript: `manuscript/existence/rg-horizon-geometry.tex`, especially Proposition `prop:ex-lattice-horizon-roll` and equations `eq:ex-lattice-horizon-*`.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- This unit proves the finite block completion in ordinary matrix algebra, expands the producer route to the actual horizon and tower costs, and records the path-to-root periodization. It does not claim to prove the upstream bed, flight, or path price estimates outside the cited supplier chain.

## Inputs and notation

| Symbol | Meaning and normalization | Source correspondence |
| --- | --- | --- |
| `H,H'` | Adjacent fine/coarse beds; `J=H.full p f`, `J'=H'.full p' c` are the full root maps, including the direct block. | `YM.Precision.Bed.full`, `Lean/YM/PREC/Stacks.lean` |
| `W,W'` | Finite-torus amended metrics `JᵀJ`, `J'ᵀJ'`; inverses `R,R'`. | `YM.Precision.Floor.roots`, `.inverse`, `.symmetric`, same path |
| `D_f,D_c` | First coboundary from 1-forms to 2-forms on the fine/coarse tori; `d₂D_c=0`. | `YM.Exterior.d 1`, `YM.Exterior.d 2`; `YM.Work.F09.answer` |
| `T,A₀` | Actual installed two-form and one-form flight transports; `\bar T` is the actual conditional mean. | `YM.Precision.Towers.Diagonal.transport`, `.stays` |
| `Z` | `R' − TᵀRT − k⁻¹ D_cD_cᵀ`, the actual remainder in the roll factorization. | `YM.Craft.defect`, `YM.Work.F09.answer` |
| `P` | Three-form factor with `W'ZW'=D₂ᵀPᵀPD₂`; its existence and strip/reach bounds are flight receipts. | `YM.Craft.Bleeps`, `YM.Craft.Opens`, `YM.Work.F09.answer` |
| `L` | Odd block side; costs retain explicit powers of `L⁻¹`. | `YM.RG.Ratio`, `YM.Precision.Towers.Deep` |
| `D_r` | Finite exponential strip cost of the exterior coboundary stencil from r-forms to (r+1)-forms, with the cover norm `size(z)=sum_a |z_a|`. | `YM.Work.F08.stencilCost`, `.strip_stencil` |

The manuscript's matrix proposition assumes exactly the two transport identities, symmetric invertible bed metrics, and the stated curvature factorization. The selected flight and bed producers supply those premises. No spectral positivity assumption is needed in the block calculation beyond invertibility of the stated metrics and the factorization itself.

## Correspondence

| Manuscript result or step | Fully qualified Lean declaration(s) | Pinned source path | Correspondence |
| --- | --- | --- | --- |
| Exact defect and factorization input | `YM.Craft.defect`, `YM.Craft.Bleeps`, `YM.Craft.Opens` | `Lean/YM/Bid/Craft.lean` | Defect is `W' (R'−TᵀRT−k⁻¹D_cD_cᵀ) W'`; Bleeps identifies it with `D₂ᵀ C D₂`; Opens supplies `C=PᵀP`. |
| Finite block completion | `YM.Work.F09.answer` | `Lean/YM/Work/F09.lean` | Proves all six roll clauses from Floor, Diagonal, Opens, Bleeps, and Replaces. The manuscript expands the inverse symmetry, projection, curvature Gram calculation, and every transport identity. |
| Exact tower row formulas | `YM.Craft.Replaces` | `Lean/YM/Bid/Craft.lean` | Gives `M_F=J R T J'ᵀ`, `M_N=k⁻¹/² D_cᵀJ'ᵀ`, and the stacked projection-complement/curvature row. |
| Full root-row identity | `YM.Work.F08.fullRow`, `.acts_full`; `YM.Next.Free.full_cover` | `Lean/YM/Work/F08.lean`; `Lean/YM/Next/FREE_KERNELS/Ground.lean` | The direct row and root row are vertically stacked. Multiplication gives `JᵀJ=p.direct I+FᵀF`, with no volume normalization. |
| Tower cost estimate | `YM.Work.F08.answer`, `.strip_stencil`, `YM.Precision.Towers.Deep`, `YM.Work.F08.fineCompose`, `.strip_fine` | `Lean/YM/Work/F08.lean`; `Lean/YM/PREC/Stacks.lean` | Explicit costs in the manuscript reproduce the finite label counts and stencil convolutions in F08; the `L⁻²` donor bound and each added difference power remain visible. |
| Actual schedule recursion | `YM.Next.Free.stageHop`, `.flying`, `.location`, `.destination`, `.loc_land`, `.loc_top` | `Lean/YM/Next/FREE_KERNELS/Rack.lean` | At each cutoff `N`, builds the top train and recursively lands the actual adjacent flights. |
| Beds and unmodified primal/two-form rows | `YM.Next.Free.shelves`, `.diagonal`, `.check_bleep`; `YM.Next.Free.bid_bed` | `Lean/YM/Next/FREE_KERNELS/Rack.lean`; `Lean/YM/Next/FREE_KERNELS/Ground.lean` | `Catalog` supplies bottom/hop receipts and `Credit` supplies direct/length compatibility; `shelves` yields beds, floors, crossings, and curvature receipts on every `(N,i)`. |
| Price enlargement and retained horizon | `YM.Bid.pinning`, `YM.Next.Free.retained_support`, `.retained_presents` | `Lean/YM/Bid/Craft.lean`; `Lean/YM/Next/FREE_KERNELS/Rack.lean` | F06–F09 enlarge/narrow map prices and replace only the tower completion rows; the selected horizon has identical bed family and retains the same primal and two-form rows. The resulting `Suffices` receipt includes rows, floors, costs, crossings, roll, and top. |
| Path attachment periodization | `YM.Precision.Attached`, `YM.Work.F03.layout_physical`, `.ellLine_root`, `.ellLine_mulVec` | `Lean/YM/PREC/Stacks.lean`; `Lean/YM/Work/F03/Metric.lean` | For each physical face, the absolutely summable cover path slots are regrouped by displacement and then by torus face; attachment identifies the coefficient with the root matrix entry. The manuscript states the resulting finite matrix-vector identity. |
| Same-family path attachment | `YM.RG08.Reports.on_same`; `YM.RG08.Supplies.heatSame`; `YM.PhysicalNext.Repeat.Legato.ExtraGates.attached` | `Lean/YM/RG08/Reports/Receipt.lean`; `Lean/YM/RG08/Supplies/Actual.lean`; `Lean/YM/FullVolume/Cross.lean` | The selected history receipt supplies `Attached(H.H N i, (C.path.rep N p i).path)` for every `i≤N` and period label `p`. `with_asks` forwards it through the exact same constructed family and horizon. |
| Selected run binding | `YM.Independent.constructionRun`; `YM.Integration.ActualRunNativeComponentRecipe.on_run`, `.of_preselection` | `Lean/YM/Independent/ConstructionRun.lean`; `Lean/YM/Integration/ActualRunNativeComponentRecipe.lean` | The public run uses the same `R.family.path.levels` and `R.alloy.B.M`; the preselection identities retain the selected profile, kernel, length schedule, and horizon receipt. |

## Actual producer chain and remaining assumptions

The mathematical horizon supplier is `YM.Next.Free.retained_support`. Its input is a kernel and a sheet fixing that kernel; it constructs common `Catalog` and map prices. For each actual level schedule whose kernel and stage match the sheet and whose numerical `Credit` bounds hold, it uses `shelves` to build the actual-cutoff family of beds and initial towers, then `YM.Bid.pinning` to produce a retained horizon with `Suffices` bounds. The `Catalog` is itself produced by `YM.Next.Free.pledges` from the one-flight frontiers and bed price construction, not a free choice of a new trajectory. The detailed upstream analytic receipts in those frontiers and the public payment that supplies `Credit` are outside this section and remain explicit inputs to the larger construction.

The public selected-run route begins with `YM.Independent.constructionRun`, which calls the preselected quote/order/numeric selector. `YM.Integration.ActualRunNativeComponentRecipe.on_run` converts its selected paid numerical receipts to the actual levels and horizon; `.of_preselection` packages those receipts without replacing `R.family.path.levels` or `R.alloy.B.M`. The public flat-sector route additionally travels through `YM.PhysicalNext.Repeat.Legato.Run.again`, the actual full-volume `ahead` producer and its garden/Mauve path. No neighboring Cook/Multi proof interface was substituted. The exact world and non-linear inputs are crosswalked in their respective evidence units.

For the path identity, the local proof uses the actual mathematical inputs `Attached` and `PathData.Bounds`. `Attached.layout` identifies every fixed cover-displacement fiber; `Bounds.rows` gives weighted absolute summability, so all infinite regroupings are legitimate. The selected-history route explicitly produces attachment at all cutoff/level/period triples. The inspected `on_same` and `heatSame` statements do not themselves list the weighted row-bound receipt; it must be supplied by the corresponding paid path input before the regrouping is applied. This section does not infer it from the finite block identities.

## Literature and editorial decisions

No external theorem is used for the finite matrix completion; the proof is an explicit finite-dimensional calculation. The row-cost estimate uses only the exponential-weight convolution inequality: for absolutely summable matrix kernels, the weighted row sum of a composition is at most the product of the two weighted row sums, with one finite sum over each intermediate label. The manuscript writes out the actual factors and counts for the order-two tower construction. Formal helper lemmas are grouped by their mathematical roles (finite matrix completion, stencil convolution, and path periodization).

## Inspection record and checks

Inspected exact source declarations with targeted commands, including:

- `sed -n '35,145p' Lean/YM/PREC/Stacks.lean`
- `sed -n '1,150p' Lean/YM/Work/F09.lean`
- `sed -n '1,145p' Lean/YM/Work/F08.lean`
- `sed -n '1,230p' Lean/YM/Work/F08/Mixed.lean`
- `sed -n '1,155p' Lean/YM/Next/FREE_KERNELS/Rack.lean`
- `sed -n '1,155p' Lean/YM/Next/FREE_KERNELS/Ground.lean`
- `sed -n '1,125p' Lean/YM/Bid/Craft.lean`
- `sed -n '1,135p' Lean/YM/Work/F03/Metric.lean`
- `sed -n '140,215p' Lean/YM/RG/PathActions.lean`
- `sed -n '1,110p' Lean/YM/Independent/ConstructionRun.lean`
- `sed -n '1,100p' Lean/YM/Integration/ActualRunNativeComponentRecipe.lean`

No Lean build was run. No manuscript build was run. `python3 scripts/check_blueprint.py` was run and failed because `blueprint/units/YM-000026/unit.json` is absent in this isolated clone. That machine-readable unit file is owned by the integrator; no substitute file was created. Independent review has not yet been requested for this chapter.
