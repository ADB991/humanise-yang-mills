# Evidence: common short-range covariance on every period

Status: draft; bounded local source/math review requested. This unit proves the period-folding, common inverse, cut, and telescope implications at the stated inputs. It does not produce the paid row-width/gap schedule or the `Paying` budget.

## Source pin and files read

Imported Lean source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (the source pin recorded by the repository manifest for this task).

Inspected source files:

- `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Covers.lean`
- `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Enrolled.lean`
- `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/Metering.lean`
- `Lean/YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/TellerFold.lean`
- `Lean/YM/Push/FREE_RESOLVENT/Fold.lean`
- `Lean/YM/Push/FREE_RESOLVENT/Metric.lean`
- `Lean/YM/Push/FREE_RESOLVENT/Flat.lean`
- `Lean/YM/Pressure/Seeds.lean`
- `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Leading.lean`
- `Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Issue/Cut/Cells.lean`
- `Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Issue/Cut/Scissors.lean`
- `Lean/YM/Extra/ITERATION_NO_LOSS/Columns.lean`
- `Lean/YM/Extra/ITERATION_NO_LOSS/Inherited.lean`
- `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Epoch.lean`
- Parent canonical units read for reuse: `/private/tmp/ym-existence-20261111/manuscript/existence/actual-reader-tree-covariance.tex` (`sec:actual-reader-tree-covariance`) and `/private/tmp/ym-existence-20261111/manuscript/existence/free-horizon-convergence.tex` (`sec:free-horizon-convergence`).

Commands actually used for source inspection included `rg -n` on the declaration names listed below and `sed -n` on the corresponding source ranges. `git diff --check` passed. `python3 scripts/check_blueprint.py` was run and stopped because this isolated clone has no `blueprint/units/YM-000026/unit.json`; parent owns the shared unit metadata. No Lean or TeX build was run.

## Exact source correspondence

1. `YM.AnalyticBridge.LocalGaussianLaws.Current.common` and `common_price`, in `LOCAL_GAUSSIAN_LAWS/Enrolled.lean`, form the finite active-coordinate common row from `fullRow` and transfer the bed's exponential width using `fullRow_width`.
2. `YM.AnalyticBridge.LocalGaussianLaws.Current.enrolled`, same file, identifies the repeated forest `treeMatrix` exactly with the restriction of `common.acts`; the identification uses the zero-offset repeated forest and `link` active-coordinate equivalence.
3. `YM.AnalyticBridge.LocalGaussianLaws.Current.cofinal_prices`, same file, transports a positive gap from large periods to every period. `Universal.modulo` gives the quotient homomorphism; `Universal.law` intertwines convolution under pullback; `dot_push` counts every fiber by `card ker`. The manuscript gives this finite reindexing proof rather than treating “cofinal” as a gap theorem.
4. `YM.AnalyticBridge.LocalGaussianLaws.Current.reserve`, `treeFare_pos`, and `earned`, in `Covers.lean`, use the tree gap at threshold `100 * macroR P + 3`, `common_price`, and `FreeResolvent.strip_resolvent`. The source gap is `min(a, K.penalty)/(1 + beta + gamma)`, with beta and gamma exactly the curl and probe coefficients of the finite block estimate. `YM.FreeResolvent.tree_gap` in `Flat.lean` proves this from the finite block curl/probe bound and bed floor. The manuscript cross-references the completed derivation in the canonical `sec:path-attachment-producer`, including its site/axis/plaquette cardinalities and edge-comparison constant; it does not attribute the proof to `sector-gram`.
5. `YM.FreeResolvent.Universal.law`, `.inverses`, `.folding`, and `.publish`, in `Push/FREE_RESOLVENT/Fold.lean`, provide translation-compatible period folding and the single cover inverse row. `publish` uses factorial periods, coefficientwise compact extraction, the uniform exponential majorant, and dominated convergence. It does not use Fourier-symbol inversion. `YM.FreeResolvent.strip_resolvent` in `Metric.lean` supplies its inverse-row exponential bound from the common row width and finite-period gap.
6. `YM.AnalyticBridge.LocalGaussianLaws.Current.rootMeter`, `meter_width`, `meter_reads`, and `onePlateau`, in `Covers.lean`, compose the same inverse with the rooted path rows and identify its restriction, at every admissible native step of coarse side at least 3, with `plane * treeInverse * plane.transpose`. The positive strip width and row constant are selected before the bed and work uniformly over beds satisfying the fixed strip/floor bounds, as in `earned`. `YM.AnalyticBridge.LocalGaussianLaws.TellerFold.cutHead` supplies the exact finite tree conditional curvature formula. The separate parent proof `sec:actual-reader-tree-covariance` supplies the finite curl-through and conditional covariance algebra; this unit invokes, and does not duplicate, that proof. The rooted measurement row maps asked-coordinate vectors to curvature coordinates (rows `dial`, columns `Asked`).
7. `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.Figure`, `.summon`, and `.Figure.joints`, in `Issue/Cut/Cells.lean`, symmetrize the cover representative by the real fixed-point operation. The output covariance matrices are symmetric, so this leaves every admissible tree period unchanged. `Figure.joints` gives the entrywise cut error `cheque`. The manuscript then defines the finite-range comparator to equal the exact covariance on base pairs within radius `H_x` and zero outside; the error is zero on retained pairs and controlled by `Figure.joints` plus `enough_room` on omitted pairs.
8. `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.ShapeCut`, `.ShapeCut.draw`, `cut_bounds`, `order_exp`, and `enough_room`, in `Issue/Cut/Scissors.lean`, retain every coarse-cell cover displacement through the natural quotient `radiusB/10000`, bound the omitted strip by `exp(-s*leastHem)`, restrict retained support to the natural quotient `radiusB/8`, and make cut entries zero beyond that coarse-base separation. `YM.Pressure.radiusB` in `Pressure/Seeds.lean` is `ceil((log x)^2)`. Transpose symmetry must reverse displacement; the manuscript uses `(a,b,z) -> (b,a,-z)`. The internal row labels carry intra-block residues and colors; spatial support uses the `splitCo` parent-base coordinate.
9. `YM.Extra.IterationNoLoss.psi_strip` in `Extra/ITERATION_NO_LOSS/Columns.lean` gives the inherited cover bound `psiPrice(Ω,Ω')/L^2`; its proof composes the fine dual-diagonal row, moving tower row, and coarse diagonal row. `YM.PhysicalNext.InteractingRank.sufficient_rows` in `AFTERNOON_INTERACTING_RANK_COMPARISON/Leading.lean` specializes this to `psiBudget(M')/L^2` on the selected same history. `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.psiBudget` and `.contour_uses` in `Issue/Cut/Cells.lean` give `psiBudget(M') = |TypeFace2|^2 (M')^3` and the exact movement cheque `cheque(TypeFace2,s,psiBudget(M')/L^2,x)`. Thus the `L^-2` is an incoming tower strip factor, not an installation gain.
10. `YM.PhysicalNext.InteractingRank.Paying`, `.confers`, and `.telescope`, in `AFTERNOON_INTERACTING_RANK_COMPARISON/Epoch.lean`, are the same-history consumer. Under a constant consecutive blocking clock, `telescope` combines the paid movement error with the paid cut-row cheque and uses `enough_room` and the exact same-bed `Figure.transfer`. This draft proves the concrete cut and its error implications but leaves production of those payments to the selected schedule.

## What is proved here versus retained

The period-folding lemma is newly reorganized from the exact quotient-map calculation: both the quadratic form and norm scale by the same positive kernel cardinality. The common inverse explanation follows `Universal.publish` and `Metric.strip_resolvent`, with the centered factorial-period extraction and all-period folding steps stated explicitly. Symmetric displacement cut-tail and support conclusions are proved directly from the strip bound and the natural quotient radii. The finite-range covariance comparator is exact on retained base pairs and differs only on the omitted tail. The tree-slice covariance identification is cross-referenced to the existing finite proof rather than rederived.

The following are not proved in this unit and remain explicit inputs: the selected bed's exponential row bound; the all-large-period coercivity/floor receipt and its upstream physical construction; the chosen scale's movement and turn payments; consecutive-level clock plateau; path/capital bounds; and the upstream funding of these estimates. Thus the proposition is a same-history local covariance theorem conditional on actual quantified receipts, not a completed public construction result.
