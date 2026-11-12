# Paid response price

- Unit: YM-000026, trace selected-scale producer.
- Status: draft; the native-price identity, ticket calculation, and inverse-dilation-to-scaled-root application have been corrected and sent for independent review.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-bill-prices.tex`.

## Source crosswalk

| Manuscript statement | Exact source | Evidence |
| --- | --- | --- |
| Native root allowance and inverse dilation norm | `YM.Trace.Terrace.nativeC`, `.alto_norm`, `Lean/YM/TraceExtension/Terrace/Casa.lean`, `Annual.lean` | `nativeC` is the stake divided by the normalized flight, inverse dilation norm, cubic volume scale, and gain. `alto_norm` gives the inverse dilation norm (A_J^{-d}). |
| Rate tickets | `YM.Trace.Terrace.stakeK`, `.hullK`, `.stickK`, `YM.Trace.Terrace.grantK`, `YM.Trace.Terrace.open_budget`; `Lean/YM/TraceExtension/Terrace/Fund.lean`, `Arms.lean`, `Stanza.lean` | These provide rate-zero tickets for stakes, dilation ratio, summit scale, and inverse flight, using basin below summit. `Ticket.prod` combines them; `toll_small` turns the product into the `Tau(70)` bound. |
| Gain comparison | `YM.Trace.Terrace.gainsK`, `Lean/YM/TraceExtension/Terrace/Arms.lean` | Gives `Tau(i,500)≤gainChart(summit(i),basin(i))`. The product identity `Tau(70)/Tau(500)=Tau(-430)` yields the rate in the manuscript. |
| Paid label column estimate | `YM.Trace.Terrace.Bill`, `.majesty`, `Lean/YM/TraceExtension/Terrace/Casa.lean`, `Annual.lean` | `Bill.norms` and `Bill.bias`, with threshold at most one and `AgeK(-1/4)≤1`, imply the column-size bound 2 by the triangle inequality. |
| Actual label producer boundary | `YM.Trace.Terrace.purchasing`, `Lean/YM/TraceExtension/Terrace/Casa.lean`; `YM.MergeProof.Accent.riches`, `Lean/YM/TraceExtension/Soot/Coffer.lean` | `purchasing` converts an atomic paid receipt to a `Bill`, using the resource-transfer theorem `riches`, its `SharpRead` price-duality input, and finite-volume response receipts. Their production remains upstream; the draft currently states this boundary but does not prove `riches`. |

## Checks

Read-only inspection used `rg -n` and `sed -n` on the source paths in the table. No Lean source was edited. No Lean, TeX, or blueprint check was run. This provisional evidence was saved before pausing for the parent-requested reset verification.
