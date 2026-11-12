# Same-history physical stress transfer and Scribe assembly

- Unit: YM-000026.
- Status: draft; independent mathematical/source review required.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Manuscript: `manuscript/existence/trace-scribe-producer.tex`.
- Scope: expose the actual corrected conserved tensor, its same-history
  rescaled field/flux limits, transfer of those limits to the physical stress
  by a nonzero common shell test, and assembly of the physical Scribe record.

## Source correspondence

| Mathematical step | Fully qualified declaration(s) | Pinned source path(s) |
| --- | --- | --- |
| Public construction of a gallery and selected-scale route | `YM.Trace.Over.gang` | `Lean/YM/TraceExtension/Chart/Line.lean` |
| Scribe fields and assembly | `YM.Trace.Over.Scribe`, `YM.Trace.Over.Store_l` | `Lean/YM/TraceExtension/Chart/Time.lean` |
| Corrected physical stress line and its conservation | `YM.Trace.Over.Cloak`, `YM.Trace.Over.serene`, `YM.Trace.Over.cornel` | `Lean/YM/TraceExtension/Chart/Stage.lean` |
| Normalized physical field limit | `YM.Trace.Over.yields`, `YM.Trace.Over.YearP`, `YM.Trace.Over.tweak`, `YM.Trace.Shelves.nearing_h`, `YM.Trace.Terrace.Moment4`, `YM.Trace.Terrace.unveil` | `Lean/YM/TraceExtension/Chart/Stage.lean`, `Lean/YM/TraceExtension/Shelves/Pear.lean`, `Lean/YM/TraceExtension/Terrace/Calendar.lean` |
| Physical flux / trace limit | `YM.Trace.Over.blossoms`, `YM.Trace.Shelves.muteP`, `YM.Trace.Over.sum_delta` | `Lean/YM/TraceExtension/Chart/Stage.lean`, `Lean/YM/TraceExtension/Shelves/Pear.lean` |
| Fourth-order chart map and finite branch coefficients | `YM.Trace.Terrace.Moment4`, `YM.Trace.Terrace.unveil`, `YM.Trace.Slate.Shine4`, `YM.Trace.Slate.tiara`, `YM.Trace.Shelves.chartB`, `YM.Trace.Shelves.nearing_h` | `Lean/YM/TraceExtension/Terrace/Calendar.lean`, `Lean/YM/TraceExtension/Slate/Spite.lean`, `Lean/YM/TraceExtension/Slate/Limit.lean`, `Lean/YM/TraceExtension/Shelves/Pear.lean` |
| Two-direction cancellation and coefficient calibration | `YM.Trace.Over.formulate`, `YM.Trace.Over.transferX`, `YM.Trace.Over.mere`, `YM.Trace.Over.beater`, `YM.Trace.Over.sizeQ'`, `YM.Trace.Over.pairingD` | `Lean/YM/TraceExtension/Chart/Laurel.lean`, `Lean/YM/TraceExtension/Chart/Token.lean`, `Lean/YM/TraceExtension/Chart/Dray.lean` |
| Weighted response and Ward decompositions used in calibration | `YM.Trace.Shelves.gapC`, `YM.Trace.Slate.penumbra`, `YM.Trace.Slate.diadem`, `YM.Trace.Terrace.Prosper.vote`, `YM.Trace.Over.river_k` | `Lean/YM/TraceExtension/Shelves/Lore.lean`, `Lean/YM/TraceExtension/Slate/Pony.lean`, `Lean/YM/TraceExtension/Slate/Limit.lean`, `Lean/YM/TraceExtension/Terrace/Lease.lean`, `Lean/YM/TraceExtension/Chart/Dray.lean` |
| Reference/physical conserved-line rank and comparison | `YM.Trace.Over.reveals`, `YM.Trace.Over.ranking`, `YM.Trace.Shelves.aprilA`, `YM.Trace.Over.ChoiceK` | `Lean/YM/TraceExtension/Chart/Masts.lean`, `Lean/YM/TraceExtension/Shelves/Lore.lean` |
| Proportionality and physical normalization transfer | `YM.Trace.Over.year_spec`, `YM.Trace.Over.awake_o`, `YM.Trace.Over.pay_jet`, `YM.Trace.Over.drape`, `YM.Next.UVStress.comparison_jets` | `Lean/YM/TraceExtension/Chart/North.lean`, `Lean/YM/TraceExtension/Chart/Earl.lean`, `Lean/YM/Next/UV_STRESS/Focus.lean` |
| Comparison-observable trace and scalar-unit removal | `YM.Trace.Over.july`, `YM.Trace.Over.center_plus`, `YM.Trace.Over.shift_unit`, `YM.Trace.Over.trace_Year`, `YM.Trace.Over.leaderB` | `Lean/YM/TraceExtension/Chart/Nectar.lean`, `Lean/YM/TraceExtension/Chart/Time.lean` |
| Effective-coupling washout and zoom/unit scales | `YM.Trace.Slate.washout`, `YM.Trace.Over.zoom_BQ`, `YM.Trace.Over.band_cost` | `Lean/YM/TraceExtension/Slate/Garnet.lean`, `Lean/YM/TraceExtension/Chart/Orr.lean` |
| Same-scale hierarchy / scaling input | `YM.Trace.Terrace.Gondola`, `YM.Trace.Terrace.StarPath`, `YM.Trace.Terrace.Spun`, `YM.Trace.Terrace.Prosper`, `YM.Trace.Terrace.gazes`, `YM.Trace.Terrace.springs` | `Lean/YM/TraceExtension/Terrace/Gondola.lean`, `Lean/YM/TraceExtension/Prom/Zoom/Running.lean`, `Lean/YM/TraceExtension/Terrace/Prism.lean`, `Lean/YM/TraceExtension/Terrace/Lease.lean` |

## Proof audit

`Store_l` packages the outputs of `july` and `year_spec` with the already
selected scaling, hierarchy, and same-history chart. The first theorem is
not a new selection: it obtains `ChoiceK` from `reveals`. `reveals` uses the
three source-provided paid tensor families (principal, false correction,
true correction), obtains the same-history response, and calls `formulate`
to solve the two-direction cancellation. `formulate` proves its matrix
eventually bijective by convergence to the invertible reference
two-direction map, obtains a bounded solution by finite-dimensional stable
inversion, and uses `transferX`/`mere` to calibrate the second coefficient.
The prose gives the exact finite-dimensional inversion and coefficient
extraction. Its calibration uses the displayed principal-response inputs,
the weighted response comparison `gapC`, the Ward comparison `diadem`, and
the paid sensor estimate `Prosper.vote`; the sensor estimate is an incoming
producer boundary for this unit. Likewise the branch calculation reduces
the field and trace limits to the operator convergence of `Moment4`, the
finite branch coefficient limits, the exponent-one `muteP` bounds, and the
true-branch trace identity `sum_delta`. The latter branch limits are the
other incoming producer boundary, not consequences of unweighted field
convergence alone. `serene` checks conservation from the exact cancellation
equation.

For `year_spec`, the physical tensor and the correction sequence belong to
the same one-dimensional conserved kernel. `awake_o` finds a nonzero
reference radial derivative and an observer test. `pay_jet` and
`comparison_jets` give convergence of the identical shell derivative for
both sequences. If the physical tensor were zero, its measured sequence
would vanish, contradicting the nonzero reference limit. Rank one therefore
gives a scalar ratio; evaluation by a linear functional nonzero on the
reference limit proves that ratio tends to one. The field and flux limits
then transfer by homogeneity. This is why the shell test is essential: the
rank-one statement alone leaves the scalar undetermined.

`july` uses `center_plus` to write the comparison trace as the trace of the
recentered physical stress plus a scalar multiple of the unit. `year_spec`
handles the first term; `shift_unit` makes the second term vanish at the
zoomed scale. `trace_Year` identifies the zoomed trace with the diagonal
trace of the normalized physical stress. `leaderB` applies a left inverse
of the scalar embedding and takes the two coordinates, yielding the exact
eventual decomposition and its two limits. `Store_l` then fills the Scribe
fields directly; `gang` uses `pays_sky` and `gravity` to obtain a selected
scaling and chart for the arbitrary-null-sequence clause before invoking
the same `Store_l` at that same history.

The prose reuses the reviewed units `sec:ex-lattice-trace-producer`,
`sec:ex-lattice-trace-weighted-estimates`,
`sec:ex-lattice-trace-crown-buffer`, and
`sec:ex-lattice-trace-eve-producer` for the numerical source prices and
scale comparisons. It does not reproduce their kernel-rank, response-price,
or finite-probe calculations. The physical stress transfer above is the
additional same-history bridge required by the scale/tested-chart argument
in `sec:ex-lattice-firesky-gallery`.

## Commands and remaining audit

Read-only inspection used `rg -n` and `sed -n` on the listed declarations and
their immediate proof files, including the full `formulate`, `transferX`,
`mere`, `pairingD`, `beater`, `gapC`, `penumbra`, `diadem`, `Moment4`,
`unveil`, `nearing_h`, `muteP`, `blossoms`, `year_spec`, and `Store_l`
proofs. I ran `python3 scripts/check_blueprint.py`; it stopped because the
isolated clone does not contain the coordinator-owned
`blueprint/units/YM-000026/unit.json`. No Lean build or LaTeX build was run.

The remaining producer boundaries are precise. The paid sensor package in
`YM.Trace.Terrace.Prosper.vote` and its construction from the terrace sensor
receipts are assigned separately. The finite branch labels, operator limit,
and exponent-one principal/false trace bounds used from
`YM.Trace.Shelves.nearing_h` and `YM.Trace.Shelves.muteP`, together with the
true-branch trace identity, are also assigned separately. This chapter
proves the stable inversion, weighted response decomposition, finite
field/trace assembly, nonzero-shell proportionality, and scalar-coordinate
extraction from those inputs. The public arbitrary-null-sequence selection
is treated in `sec:ex-lattice-firesky-gallery`; this unit reuses that route
and does not replace its scale-selection proof.
