# Fourier tails and local jet estimates

- Unit: YM-000026, selected-scale trace producer.
- Status: draft; the weighted convolution, tail, multilinear comparison, and finite ordered-partition estimates are proved from explicit analytic receipts.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-row-jet-estimates.tex`.

## Inputs and exact conversion

The main mathematical reduction is

1. A strip bound \(\sum_z e^{\sigma |z|_1}|q(z)|\le M\), and polynomial growth \(K(1+|z|_1)^n\), imply a convolution bound \(K M(1+(n+1)/\sigma)^n(1+|x|_1)^n\).
2. If the exact and truncated arrays agree for \(|z|_1<b\), their convolution difference has the explicit tail factor \(e^{-\sigma b/2}\), with cost \(C_n(\sigma/2)\).
3. A finite jet killed on the weighted reference modes changes by at most \(2^a\varepsilon K^a\) times its priced derivative bound when each actual direction is within \(\varepsilon\) of reference; the application uses \(\varepsilon_d\le C_1\).
4. The repeated chain rule has one term per canonical ordered-finpartition index. In each term the all-reference contribution vanishes, and the multilinear comparison supplies one tail-error factor.

The displayed \(\delta_k\) and \(C_1\) are the source normalizations, including the four edge components, the lift-size bounds, and the order \(dk\) in the polynomial weights. The article proves these implications rather than treating a declaration name as an estimate.

## Source crosswalk

| Mathematical content | Fully qualified declaration | Pinned source path |
| --- | --- | --- |
| Cover weights, `widthCost`, weighted Fourier strip budget, convolution, and its four-component row bound | `YM.Planned.PrimaryIntegral295.Carrier.liftCost`, `.widthCost`, `.stream`, `.stream_income`, `.field_cost`; `YM.Laurent.Width` | `Lean/YM/Planned/PRIMARY_INTEGRAL_295/Carrier.lean`; `Lean/YM/Laurent/Eval.lean` |
| Exponential tail by agreement on a finite ball | `YM.Planned.PrimaryIntegral295.Carrier.stream_scale` | `Lean/YM/Planned/PRIMARY_INTEGRAL_295/Carrier.lean` |
| Periodized and truncated test directions and local comparison | `YM.PhysicalNext.Repeat.Quince.poleQ`, `.ownQ`, `.clarity` | `Lean/YM/TraceExtension/Quince/Scale.lean` |
| Polynomial growth of actual and reference directions | `YM.PhysicalNext.Repeat.Quince.reachbound`, `.zert`, `YM.PhysicalNext.Repeat.Quince.weigh_inputs` | `Lean/YM/TraceExtension/Quince/Quart.lean`, `Shift.lean` |
| Screened jet zero and finite polynomial directions for each test probe | `YM.PhysicalNext.Repeat.Peak.lit`, `YM.PhysicalNext.Repeat.Quince.city_p` | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Peak/Rays.lean`, `Lean/YM/TraceExtension/Quince/Ride.lean` |
| Exponential-rate summation over ordered partitions and selection of the actual test bound | `YM.PhysicalNext.Repeat.Quince.εGoal`, `.fourrate` | `Lean/YM/TraceExtension/Quince/Dawn.lean` |
| Application to the small-support local chart | `YM.PhysicalNext.Repeat.Quince.mire`, `YM.PhysicalNext.Repeat.Quince.salaryT` | `Lean/YM/TraceExtension/Quince/Mire.lean`, `Soil.lean` |

## Mathematical correspondence

- `Carrier.stream_scale` is the tail estimate in Lemma `lem:ex-lattice-row-tail`. The finite agreement region comes from `marginW` and the exact cover-lattice identity in `Scale.clarity`.
- `Carrier.field_cost` is the four-component convolution estimate. The source's `liftCost` is \((1+|z|_1)^n\), and its `widthCost` is \((1+(n+1)/\sigma)^n\).
- `Quince.clarity` is exactly the passage from the local Laurent mode to its periodized direction, with \(\delta_k=4e^{-\sigma b/2}(K+K)(1+4m)^{dk}C_{dk}(\sigma/2)M\). The article spells out the componentwise tail summation.
- `Quince.weigh_inputs` is the finite multilinear telescope. Its factor \(2^a\) counts the nonempty subsets replacing reference directions by actual directions; the empty-set term vanishes by the killed-jet hypothesis. The source explicitly requires the comparison error `C0` to be at most the reference bound `C1`.
- `Quince.zert` applies the chain rule over `OrderedFinpartition`. Its killed-jet receipt is weighted: for positive block sizes \(q_j\) with sum at most \(d\), the reference directions lie in the prescribed degree-\(q_j\) mode spaces and the resulting jet vanishes. `Cases.compReads` sums over the source's canonical ordered-finpartition indices, not arbitrary permutations with coefficient one. `Quince.fourrate` sums the finite orders and uses the exponential-rate receipts to meet the actual sprite price.

## Open obligations and checks

- The strip receipt on the selected row, the field-growth receipt, the exact same-history/screened zero-jet hypotheses, and the geometric placement/healthy-chart assumptions remain inputs here. This chapter proves the Fourier-tail and jet consequences of those receipts but does not produce them.
- The local chapter does not reprove the construction of the probe chart or the Medal/Loader receipts. Those are tracked in `trace-regular-atom-evidence.md`.
- Read-only source inspection used `rg -n`, `sed -n` on the paths in the table, and the parent manuscript's existing local estimate files.
- No Lean or TeX build was run. The blueprint checker is run and reported separately after this edit; shared unit metadata is parent-owned and is not present in this isolated clone.
