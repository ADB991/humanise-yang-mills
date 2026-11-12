# Finite-volume local-pairing proof audit

- Unit: YM-000026, selected trace local price estimate.
- Status: draft; independent review requested.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Manuscript: `manuscript/existence/trace-local-pairing.tex`.
- Scope: prove the finite-volume three-term separation/telescoping estimate corresponding to the selected local price bound; isolate the exact geometric, probe, and growth receipts on which the application depends.

## Correspondence

| Manuscript step | Exact declaration and path | Correspondence/status |
| --- | --- | --- |
| Cell root seminorm | `YM.Cells.Tiling.rootTest`, `Lean/YM/Cells/Tiling.lean` | Exactly the absolute reflected-copy moment raised to reciprocal cell count. Each copy is translated and pulled back; odd reflection parity conjugates the observable. The manuscript spells this as a level-dependent root bound. |
| Product estimate at two distinct sites | `YM.Trace.Terrace.pulpit`, `Lean/YM/TraceExtension/Terrace/HomePort.lean`; its seam input is `YM.Cells.Seam.inequality`, `Lean/YM/Cells/Certificate.lean` | For distinct coarse sites, their fine anchors are distinct; the root bound of each observable controls the separated two-site moment. `pulpit` applies the reflected-cell product inequality to the two anchored translates. |
| Root-bound subadditivity | `YM.Cells.Seam.semi` and `YM.Cells.adds`, `Lean/YM/Cells/Certificate.lean`, `Lean/YM/Cells/Chess.lean` | The source obtains this by expanding the reflected product over all two-color choices and applying the positive tiling estimate. It is explicitly an input to the local proposition; the article proves the later arithmetic. |
| Bilinear decomposition | `YM.Trace.Terrace.slides`, `Lean/YM/TraceExtension/Terrace/HomePort.lean` | Exact identity `pew(F,H)=pew(f,g)+pew(F,H−g)+pew(F−f,g)`, proved by expanding the integrand and using integrability. The manuscript writes and verifies this cancellation directly. |
| Error exponents | `YM.Trace.Terrace.mileage`, `Lean/YM/TraceExtension/Terrace/Meteor.lean`; `YM.Trace.Terrace.Tau_add`, `.tau_mono`, `YM.Trace.Terrace.toll_small`, `Lean/YM/TraceExtension/Terrace/Arms.lean`; `YM.Trace.Terrace.watch`, `Lean/YM/TraceExtension/Terrace/Fund.lean`; `YM.Trace.Terrace.Gate`, `Lean/YM/TraceExtension/Terrace/Base.lean` | `Tau(P,i,a)=exp((a/10000)(log β̂_i)^48)`. Multiplication adds exponents and the function is monotone in the exponent. The source growth receipt gives `4≤Tau(1)` eventually. The manuscript proves the complete chain `t⁻²⁰⁰+t⁻²⁹⁵+t⁻¹⁹⁵+t⁻⁵⁰⁰≤4t⁻¹⁹⁵≤t⁻¹⁰⁰`. |
| Measured marker root bounds | `YM.Trace.Terrace.concert`, `Lean/YM/TraceExtension/Terrace/Traveller.lean` | Applies `journey`, `spine_pitch`, `open_budget`, and the threshold estimate for the rescaling factor to transfer coefficient bounds into root bounds. Exact conclusion at grades and sites is the `t_i(5)` receipt in the chapter. These helper producer bounds are not rederived here. |
| Inserted marker and local approximation | `YM.Trace.Terrace.outside`, same `Traveller.lean` | Combines `journey`, `smithies`, `capacity_cost`, and `open_budget`; yields the root bound for the insertion and a bounded local approximation in the supported window with root error `t_i(−300)`. These component estimates are remaining source inputs in this chapter. |
| Probe and distant-site estimate | `YM.Trace.Terrace.Probe` and `.toll`, `Lean/YM/TraceExtension/Terrace/Meteor.lean` | The probe contains a finite-volume approximant in the analytic interior, root difference `t_i(−200)`, and a uniform two-site price estimate against every bounded local test in the window. The mission source must provide the probe instance. |
| Actual insertion application | `YM.Trace.Terrace.ear_price`, `Lean/YM/TraceExtension/Terrace/PriceLimit.lean`; `YM.Trace.Terrace.small_means`, `Lean/YM/TraceExtension/Terrace/Terrain.lean` | `ear_price` selects the grade-four test, uses mission finances and the finite-volume estimate proved in `mileage`, then transfers it through the separated-site limit. `small_means` uses these estimates for each test, compatible differentiation, and the selected chart to prove the weighted field decay. |
| Selected response route | `YM.Trace.Slate.hullage`, `.canal`, `.legacy`, `.rungs`, `Lean/YM/TraceExtension/Slate/Phantom.lean`, `Lean/YM/TraceExtension/Slate/Garnet.lean` | `hullage` supplies the finite-volume mission for the core-field combination; `canal` rewrites the response medium using that core field; `legacy` invokes `small_means`; `rungs` passes the resulting decay to the sensor receipt. The article proves only the local finite-volume assembly after its receipts are available. |

## Proof boundary

The proposition in the manuscript is newly organized but follows the exact source decomposition `slides`, followed by the two reflected-cell product bounds `pulpit` and the root subadditivity estimate, with the same error powers and constants as `mileage`. It is a full proof of the algebraic and numerical assembly step.

The following producers are not proved in this chapter: `concert`'s coefficient-to-root bound, `outside`'s construction of a bounded local approximation with root error `−300`, the probe's existence and price bound, the finite cover/funding estimate used to produce mission finances, and the selected chart's derivative/orientation passage from fixed tests to the full field norm. They remain explicit inputs, not asserted consequences of the proposition.

## Commands and verification record

Inspected the exact files listed above using `rg -n` and `sed -n`; read full `Lean/YM/TraceExtension/Terrace/{Meteor,Traveller,HomePort,Arms,Fund,Base,PriceLimit,Terrain}.lean`, `Lean/YM/TraceExtension/Slate/{Phantom,Garnet}.lean`, and `Lean/YM/Cells/{Tiling,Certificate,Chess}.lean`. No Lean or LaTeX build was run. No Lean source was modified.
