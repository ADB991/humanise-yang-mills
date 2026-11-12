# Trace rate conversion and local scale selection

- Unit: YM-000026, selected-scale trace producer.
- Status: draft; finite rate summation and the local support-cost selection are proved from the displayed quantities and source algebra. Entry receipts remain open.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-local-rate-selection.tex`.

## Exact source crosswalk

| Manuscript calculation | Fully qualified source | Pinned source path |
| --- | --- | --- |
| Strict power rates, multiplication, finite sums, cutoff and monitor | `YM.ConnectedActivityE6.Rate`, `.Rate.add`, `.Rate.mul`, `.Rate.cutoff`, `YM.PhysicalNext.Repeat.Quince.cutRate`, `.colorK`, `.cornK`, `.εGoal` | `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Numerics.lean`; `Lean/YM/TraceExtension/Quince/Dawn.lean` |
| Fine monitor, subpower polynomial comparison, `fRate` conversion, head packing and moment inflation | `YM.Push.AbsoluteSums.Delay.fineMonitor`, `.monitor_pays`, `YM.PhysicalNext.Repeat.Quince.coinP`, `.fRate`, `.fGood`, `.packing`, `YM.PhysicalNext.JointLoad.Heir.Lute.bulk`, `.covers`, `.overcrowded`, `.guests`, `.fares` | `Lean/YM/Push/ABSOLUTE_SUMS/Delay.lean`; `Lean/YM/TraceExtension/Quince/Glee.lean`; `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Cover.lean` |
| Rust exact pieces and algebraic cost bounds | `YM.PhysicalNext.JointLoad.Heir.Lute.segment`, `.tranche`, `.scratch`, `.core_wages`, `.obscured`, `.booster`, `YM.PhysicalNext.Repeat.Quince.paintW`, `.opalW` | `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Reprise.lean`; `Morceau.lean`; `Cover.lean`; `Lean/YM/TraceExtension/Quince/Pay.lean` |
| Selected finite probe estimate | `YM.PhysicalNext.Repeat.Quince.δℓ`, `.εℓ`, `.horn₀`, `.corn₀`, `.zert`, `.fourrate` | `Lean/YM/TraceExtension/Quince/Quart.lean`; `Dawn.lean` |
| Selected local budget and its scalar output | `YM.PhysicalNext.Repeat.Quince.hail`, `.aprice`, `.samite`, `.uval`, `.straps`, `.march_δ`, `.gkeeper`, `.horizon_u`, `.scales_m` | `Lean/YM/TraceExtension/Quince/Grade.lean` |
| Radius and reach conversions | `YM.PhysicalNext.Repeat.Quince.depthW`, `YM.PhysicalNext.JointLoad.Heir.breadth`, `.scope`, `.headCount`, `YM.Pressure.radiusB`, `YM.PhysicalNext.Repeat.Malachite.radiusD`, `YM.PhysicalNext.JointLoad.Heir.reach` | `Lean/YM/TraceExtension/Quince/Precinct.lean`; `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Depth.lean`; `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Searchlight.lean`; `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Museum.lean`; `Lean/YM/Pressure/Seeds.lean` |
| Fine-level paint cost definition | `YM.PhysicalNext.Repeat.Quince.paintW` | `Lean/YM/TraceExtension/Quince/Sol.lean` |

## Source-to-mathematics notes

- `Delay.monitor_pays` proves the monitor dominates every fixed power of the logarithmic bill. The manuscript also expands the asymptotic comparison: with fixed block side, `betaF=x+O(1)`, `radiusB≤1+(log x)^2`, and `log H=(log log betaF)^2`, so every fixed polynomial in the radii is `H^{o(1)}`.
- `Quince.εGoal` is exactly the finite sum over derivative orders of ordered-finpartition counts, `2^j`, the strip tail, the degree-growth constant to power `j`, and the selected rights fee. The displayed proof explains why every summand has a strict negative rate, and why multiplication by the monitor factor still tends to zero.
- `Grade.horizon_u` compares the actual response-plus-paint cost against `uval`. The manuscript expands the three rust components: segment, tranche, and scratch. The powers in `fuse=8+2p+2pn` dominate respectively `2p+pn`, `2p`, and `8+2pn`. The source's coefficients are `boost=blaze+(blaze+1)L^3+haze` and `aprice=boost*bulk(packing)^fuse+16/D.epsilon`.
- `Grade.scales_m` uses two separate consequences of `chi*U*K→0`: first, `F≤1` from `chi≥1` and `K≥1`; second, `d_* chi U K≤y` with `d_*=1+clocks(1)`, combined with linearity of `clocks(t)`. The head moment is expanded from `meter=2(1+heads)^{m+1}inflate_m` with `m=4(n+1)`.
- The support geometry has the exact formulas `radiusB=ceil((log x)^2)`, `radiusD=b(4b+2)+2b`, `reach=45(1+b)`, `depthW=L(R+2)`, `breadth=q(4B.B+2)+2B.B+8`, and `scope=r*b+breadth+1`. The manuscript proves the bulk comparison used in `Lute.covers` from these displayed formulas; it does not replace reach by the unrelated local cover-radius parameter `r`.
- The scalar response cost `F` is explicitly expanded as segment + tranche + scratch + the `16/D.epsilon` response charge + the fine-level paint term. The paint loom is evaluated at `radiusD`; the rust loom is evaluated at `reach`.

## Remaining inputs and verification

This chapter does not produce `Carrier.priced`, the selected strip estimate, `Ramble.gathered` coefficient growth, the weighted killed-jet receipt, the healthy chart and same-history placement, or the upstream `Li.decade`/Medal construction inputs. It proves the rate and scale implications actually used after those inputs are supplied. Source inspection used `rg -n` and `sed -n` on the listed files and immediate definitions. No Lean or TeX build was run. `python3 scripts/check_blueprint.py` was run; in this isolated clone it stops because parent-owned `blueprint/units/YM-000026/unit.json` is absent.
