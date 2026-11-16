# Source correspondence and interface boundary

Pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

| Manuscript | Source |
| --- | --- |
| `thm:trace-selected-endpoint`: zero one-point, positive amplitude, all-radius complex limit, exclusion | `YangMills.Hierarchy.TraceTest`, `Lean/ChallengeSpec.lean`; included in `YangMills.Hierarchy.Properties.nonfree`. |
| Exact time pair and grade-four label | `YangMills.Hierarchy.traceTwo`, `timePair` in the same specification. The two times are −r/2,+r/2, so separation is r. |
| Profile normalization | `Mode`, `Mode.kernel`, `Track`, `wickProfile` in `Lean/ChallengeSpec.lean`: real continuous positively homogeneous numerator, natural spatial/time orders, nonnegative mass; finite complex combinations of products, empty product 1 and empty sum 0. No numerator positivity assumption. |
| Conversion of internal trace result to public requirement | `YangMills.publicTrace`, `Lean/TraceBridge.lean`; `award_eq` identifies the coefficient and `Wick.euclidean_excludes` supplies the profile exclusion. |
| Hierarchy/filter before arbitrary null sequence | `YM.Trace.Over.Gallery.lead`, `Lean/YM/TraceExtension/Chart/Line.lean`; `YM.Trace.Over.gang` via `pays_sky` and `Store_l`. |
| One scaling for clock, chart maps and moving-label/shell receipts | `YM.Trace.Over.Scribe`, `Lean/YM/TraceExtension/Chart/Time.lean`, especially `meters` carrying `Gondola` on the same J and filter. |
| Internal amplitude | `YM.Trace.Verse.award`, `Lean/YM/TraceExtension/Verse/Day.lean`: 12(d2²/b0²)lieDim/pi⁴; d2=−b0/2 gives the stated 3dim/pi⁴. The manuscript cancels kappa before numerical evaluation. |

The public type only designates a grade-four `centeredTrace`; it does not force
an arbitrary witness to be the trace of a Ward-normalized stress tensor. The
manuscript's new theorem makes the stronger concrete choice explicitly:
Theta = tr(T)−<tr(T)>_chi unit, for the normalized physical stress on the fixed
hierarchy. It proves all trace-test clauses for that chosen field. This does
not assert that every witness to the weak public interface has that physical
interpretation; the target-adequacy discussion remains intact. Nor does the
adapter `publicTrace` alone construct the stress or the common hierarchy.
Those are the canonical producers named in the endpoint ledger.

The duplicate-proof consolidation is expository: the all-arity marked chain
remains proved once in C13, and the C15 corollary specializes n=2 and the root
allowance to its geometric receipt. No new Lean theorem or formal proof is
claimed for this rearrangement. The independent mathematical review checks the
remaining unique geometry and the absence of circular supplier references.

No new analytic result or external literature theorem is needed for this
assembly: the mathematical inputs are the accepted canonical proof units.
The historical #107/#112/#245 review reports and #337 comment history were
consulted to ensure all previously separated obligations are accounted for.
No Lean elaboration or transitive axiom replay is claimed by this task.

The canonical constructor makes the physical identification explicitly: `YangMills.HierarchyBridge.hierarchy` assigns `centeredTrace := TraceExtension.center F`; `YM.TraceExtension.WilsonTrace.center` is `theta (selected F) F.sector.energy`, and `YM.TraceExtension.Centered.theta` centers the diagonal stress sum. The bridge correlation and `WilsonTrace.euclidean` use this same selected phase and field. See the independent source review for the inspected declarations.
