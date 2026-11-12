# From mission to local chart price

- Unit: YM-000026, trace selected-scale producer.
- Status: draft; mathematical/source review requested, no whole-proof approval.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-mission-price.tex`.
- Scope: reconstructs the limit passage from the selected mission and the finite-volume mileage estimate to the fixed-test local table price. It does not prove the mission's funded finite-cover producer or the probe/localization receipts consumed by mileage.

## Source correspondence

| Mathematical step | Exact Lean declarations and paths | Correspondence/status |
| --- | --- | --- |
| Mission data | `YM.Trace.Terrace.Mission`, `Lean/YM/TraceExtension/Terrace/PriceLimit.lean` | `terms` says eventually in `i` that `t i` converges along the selected ultrafilter to `x i`; `finances` provides one fixed complexity `m` and, eventually in `i` and ultrafilter-almost every pair `p=(N,s)`, a `Probe C m j p.2 p.1 ... (C.S.a j^5 • t i p)`. Here `j=V_i.k` and `k_i=summit(j)=Stern(V,i)`. The manuscript writes these two clauses mathematically. |
| Finite-volume price | `YM.Trace.Terrace.mileage`, `YM.TraceExtension.Terrace/Meteor.lean` | For each fixed complexity and grade-four field, mileage gives eventually in `i`, then in `p`, the two-site estimate at distinct sites for every tested grade-four transfer, scale parameter `1≤b≤tilt_cap`, interior labels, and probe. The target is `Tau(A) i (-100)`; the estimate is uniform over those finite-volume choices once the fixed test and complexity are fixed. |
| Numerical mileage assembly | `YM.Trace.Terrace.mileage`, together with `YM.Trace.Terrace.concert`, `.outside`, `.pulpit`, and `YM.Trace.Terrace.slides`; paths `Lean/YM/TraceExtension/Terrace/{Meteor,Traveller,HomePort}.lean` | `mileage` chooses the probe approximation and insertion approximation, applies the two reflected-cell product bounds and the exact three-term bilinear decomposition. The exponents are `−200`, `−295`, `−195`, and `−500`, summed to `4 Tau(−195)≤Tau(−100)`. The explicit reorganization appears in `trace-local-pairing.tex`; `concert`, `outside`, and the probe receipt remain substantive upstream producers. |
| Limit from measurements to selected table | `YM.Trace.Terrace.proxi`, `Lean/YM/TraceExtension/Terrace/SkyEar.lean` | `proxi` states convergence of the two-entry numeric measurement to the selected table pairing at the scaled insertion point, after projecting both limiting labels. The mission array converges to the raw marker `x i`; the finite grade-four height approximants converge in raw label space to `Y 4 i w`, whose projection is `X.U i 4 w`. |
| Geometry of the insertion point | `YM.Trace.Terrace.kamago`, `.beaconV`, `Lean/YM/TraceExtension/Terrace/SkyEar.lean` | The nearest-point vector has first coordinate `ceil(b_i)` and all other coordinates 1. The identity `X.r i=a_i b_i` rewrites the physical point as the scale-`a_i` pair with cover labels `(nearPoint(b_i),0)`. The link-period/sparse receipts make these sites distinct. |
| Actual source application | `YM.Trace.Terrace.ear_price`, `Lean/YM/TraceExtension/Terrace/PriceLimit.lean` | `ear_price` obtains the fixed `m` from `Mission.finances`, invokes mileage at the frame level, chooses the selected finite height `T0=(V i).R N s ⟨4,...⟩`, establishes its `Tested` and interior hypotheses, then applies `proxi` and closedness of the norm sublevel set. The manuscript proves this limit-transfer argument in conventional notation. |
| Mission producer | `YM.Trace.Slate.hullage`, `Lean/YM/TraceExtension/Slate/Phantom.lean`; finite-cover estimate `YM.Trace.Terrace.crestship`, `Lean/YM/TraceExtension/Terrace/Ell.lean` | `hullage` builds the origin-convergent array and mission. Its `finances` field is obtained through the finite-cover/funding theorem `crestship` (called at fixed parameter 48) together with selected state and travel receipts. The actual proof of `crestship`'s funding and probe-producing obligations is not included here. |

## Checks and reads

Inspected the exact definitions/proofs in `Lean/YM/TraceExtension/Terrace/{PriceLimit,Meteor,SkyEar,Traveller,HomePort,Ell}.lean` and `Lean/YM/TraceExtension/Slate/Phantom.lean`, using `sed -n` and `rg -n` to follow declarations and immediate calls. No Lean files were edited. No Lean, TeX, or test build was run. Blueprint validation has not been run for this new evidence file.
