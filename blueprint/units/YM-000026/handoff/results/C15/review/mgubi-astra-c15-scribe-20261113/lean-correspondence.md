# Textual Lean correspondence

- Unit/task: YM-000026 / issue56, the full scribe and weighted chapters only.
- Agent reviewer: GPT-6 Astra, `mgubi-astra-c15-scribe-20261113`.
- Human acceptance: unset; contributing account mgubi.
- Exact target SHA-256 and PR105 head: README and hashes.json.
- Lean pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Outcome: no blocking local correspondence mismatch found. This is textual
  inspection of definitions, theorem statements and relevant proof bodies;
  no new elaboration, kernel replay or transitive axiom audit.

The manuscript intentionally presents conditional pieces of the source
construction rather than reproducing the full type of `Store_l` or `gang`.
The source has substantial selected-history, chart, derivative, funding and
physical-algebra hypotheses. The chapter's explicit producer boundaries must
not be discarded when integrating its local conclusions.

## Inspected mapping

Paths in the table are relative to `Lean/YM/TraceExtension/` unless prefixed
`Lean/`. All declaration names are fully qualified; line numbers in the
manuscript refer to the frozen target bytes, and are supplementary.

| Manuscript part | Inspected definitions and results | Finding |
| --- | --- | --- |
| Scribe 36–74: tensor space, divergence, optical map | `YM.Next.UVStress.KernelSpace`, `sym_mem`, `kernel_mem` in `Lean/YM/Next/UV_STRESS/Tensor.lean`; `YM.Trace.Shelves.Optics`, `Optics_pay`, `aprilA` in `Shelves/Lore.lean`; `YM.Trace.Shelves.Hero` in `Shelves/Route.lean`; `YM.Trace.Terrace.crown` in `Terrace/Path.lean` | `KernelSpace` means centered symmetric real covariant tensors, not conserved tensors. Conservation is the additional divergence kernel. `Optics` is totalized off the coherent tail, and only eventually equals `q_i r_i^5 U_5^{-1} D`. The prose retains that tail. |
| Scribe 75–138: two-column isomorphism and stable solve | `YM.Trace.Over.vega`, `Waft`, `steppes`, `quill`, `wend` in `Chart/Limits.lean`; `YM.Trace.Margin.azure` in `Margin/Mallet.lean`; `YM.Trace.Slate.tribe`, `BornZ`, `Vivid` in `Slate/April.lean`; `YM.Trace.bareVector`, `bareCoordinates`, `eom_vector_raw` in `Foundation/Dilate.lean` | Coordinate profiles and quotient line match. Both onto and kernel inputs are needed; the prose does not infer independence merely from a dimension count. |
| Meaning of the free profile/response spaces | `YM.Trace.Terrace.Bowl`, `plate`, `Vbase`, `Stem5`, `Stem5_kernel`, `Vbase_sure` in `Terrace/Vector.lean`; `YM.Trace.Slate.vCard` in `Slate/Limit.lean` | `Bowl` is a real subspace of coefficient arrays; `plate` identifies it with raw covariant labels. `Vbase` applies the reference projection componentwise. Source surjectivity and the equation-of-motion kernel justify the precise inputs used by the chapter; their manuscript producer closure is not certified. |
| Scribe 126–233: calibration | `YM.Trace.Over.RQ`, `TQ`, `BQ`, `river_k`, `pairingD`, `sizeQ'`, `transferX` in `Chart/Dray.lean`; `YM.Trace.Over.PaymentR`, `mere`, `beater` in `Chart/Token.lean`; `YM.Trace.Over.pollen`, `formulate`, `forceR` in `Chart/Laurel.lean`; `YM.Trace.rho`, `rho_vector` in `Foundation/Dilate.lean` | `RQ` is age 1/6 and `TQ` is age 1/5 at `Stern V i`; `BQ` is the arch at the same summit. `PaymentR.lead` has epsilon before a tail uniform over all vectors. `rho_vector=-4(w_0+4w_1)` gives 0 and -4 on the two corrections. `formulate` gives the exact cancellation and second coefficient limit `forceR=-slopeConstant/4`. |
| Sensor interface | `YM.Trace.Terrace.Lease`, `hueK`, `Prosper.alpha`, `Prosper.vote`, `springs` in `Terrace/Lease.lean` | The manuscript's dictionary to external33 preserves spaces, actual sensor map, summit level and age weight. `vote` is an eventual uniform operator bound plus the weighted all-vector estimate. `alpha` is operator convergence. No fixed-vector weakening is substituted. |
| Scribe 235–380: branch arrays and weighted traces | `YM.Trace.Terrace.Moment4`, `Hill4`, `unveil` in `Terrace/Calendar.lean`; `YM.Trace.Shelves.Phase4`, `chartB`, `nearing_h`, `muteP`, `materialB`, `Courtis`, `MaterialSym` in `Shelves/Pear.lean`; `YM.Trace.Over.Year`, `YearP`, `Cloak`, `serene`, `yields`, `blossoms`, `sum_delta`, `OScale` in `Chart/Stage.lean` | `Moment4` is a complex continuous linear map on grade-four coefficients, with centering, arch transport and inverse chart. It is not a fourth-moment scalar matrix. `chartB` is the finite ordered-array symmetrization after the reference cutoff. `muteP` excludes `some true` and permits each fixed natural exponent, in particular 1. `YearP` gives `Phase4=q_i Year`. `sum_delta` is `4 OScale`, not a unit. |
| Scribe shell premises and first limit | `YM.Table.StressLaws.translation` in `Lean/YM/Euclid/Stress.lean`; `YM.Next.UVStress.MeterTest`, `.detects`, `.reads_limit` in `Lean/YM/Next/UV_STRESS/Invert.lean`; `YM.Next.UVStress.tiltScale`, `scaled_identity`, `head_tilt`, `bend_limit`, `comparison_jets` in `Lean/YM/Next/UV_STRESS/Focus.lean` | The integrated tests are joint compactly supported tests on separated configurations with fixed spectators. The finite test family is injective. The rescaled derivative carries one radius factor; `head_tilt` is the integration-by-parts identity used in the prose. The comparison theorem supplies fixed finite windows, grades and arities under `Approaches` and derivative/hierarchy inputs. |
| Scribe shell second limit and scalar ratio | `YM.Work.A05.Observer`, `.test`, `.moving`, `.reads_converge` in `Lean/YM/Work/A05/Read.lean`; `YM.Work.A05.reader`, `tendsto_sheet` in `Lean/YM/Work/A05/Weak.lean`; `YM.Trace.Over.reaches_mutable`, `drape`, `pay_jet` in `Chart/Earl.lean`; `YM.Trace.Over.awake_o`, `year_spec` in `Chart/North.lean` | Observer configuration, spectators and shell cut are kept fixed before scaling. `tendsto_sheet` uses a uniform-on-window bound containing the gradient support; `drape` holds the stress slot open and inserts the normalized moving tensor. `year_spec` excludes zero physical stress and forces the real proportionality coefficient to 1 using that same nonzero complex read. The prose follows these steps. |
| Scribe centering and scalar sector | `YM.Trace.Over.flavor`, `center_plus`, `ZoomValue`, `trace_Year`, `shift_unit`, `july` in `Chart/Nectar.lean`; `YM.Trace.Over.ScalarP`, `Scalar_inj`, `Scalar_onto`, `payload` in `Chart/Scalar.lean`; `YM.Trace.Over.leaderB`, `Scribe`, `Store_l` in `Chart/Time.lean` | The general-table `goal` has no hierarchy/respects hypothesis, while `gallery` does. The prose preserves the distinction. `Scalar_onto` uses the full real symmetric signed-covariant stress table via a diagonal tensor. `gallery` has weighted coefficients and `goal` has `4*d2 OScale`. |
| Scribe clock and universal selection | `YM.Trace.Over.LogZoom`, `zoom_BQ`, `a_clock`, `clock_cost`, `band_cost` in `Chart/Orr.lean`; `YM.Trace.Over.Gallery.lead`, `gang` in `Chart/Line.lean`; `hatBeta` definition in `Lean/YM/RG/History.lean`, schedule `scale` in `Lean/YM/Lattice/Scale.lean` | Clock uses log of reciprocal radius, not log zoom. `zoom_BQ` first uses the frame rate, then arch and summit ratios. `Gallery.lead` fixes ultrafilter/arch/reference hierarchy before every positive null sequence, returning strict subsequence and exact radius identity. |
| Weighted receiver lemma | `YM.Trace.Terrace.plumage`, `permute`, `spend`, `expenses` in `Terrace/Delta.lean` | The proof corresponds to `permute` and `spend`, with `expenses` converting norm convergence to all-vector estimates. The simpler `scout` in that file derives unweighted operator convergence and is used separately by `springs`. |
| Medium and age algebra | `YM.Trace.Zn.RLog`, `Wave`, `wave_sub`, `walt`, `wane` in `Zn/Have.lean`; `YM.Trace.Terrace.AgeK` in `Terrace/Look.lean`; `YM.Trace.Terrace.holds`, `measured`, `dex` in `Terrace/Dusk.lean`; `YM.Trace.Slate.medium`, `canal` in `Slate/Phantom.lean`; `YM.Trace.Slate.washout`, `aspiring`, `legacy`, `rungs` in `Slate/Garnet.lean` | Medium is arch-inverse times chosen response minus reference response. `aspiring` is an all-large-level scalar/vector assertion; `legacy` and sensor assembly are on `Stern V`. Source `washout` permits every real age parameter, not only small positive ages. The chapter uses only 1/6 and 1/5 and keeps their correct subpower estimates. |
| Weighted local price and detector route | `YM.Trace.Slate.penumbra` in `Slate/Pony.lean`; `YM.Trace.Slate.tiara`, `diadem`, `leaseV` in `Slate/Limit.lean`; `YM.Trace.Terrace.Lease_alive` in `Terrace/Lease.lean`; `YM.Trace.Terrace.small_means` in `Terrace/Terrain.lean` | Transport loss age -1/4, local charge age -1, and inverse powers 30/100 agree with the manuscript. `diadem` uses price equality of the calibrated probe, not fast convergence of that probe. `legacy` feeds the same medium to `small_means` with each fixed exponent; the chapter uses 1 and retains detector/local-price inputs. |

## Immediate manuscript joins

The frozen interface files and their hashes are in hashes.json. Their inspection
is limited to the following statements and nearby definitions, not an independent
review of their entire proofs:

- External33: selected formulas, clock/arch ratio, `prop:trace-prosper-sensor`
  and its marked-vector application. Its `n_i` is this chapter's `k_i`; its
  threshold symbol `t_i` is not the scribe sensor-age symbol `t_i`. The
  dictionary correctly identifies the latter with external33's `mathfrak a_i`.
- External34: ordered material arrays, coefficient/moment inputs,
  `prop:ex-branch-moments`, `prop:ex-branch-washout` and three trace formulas.
  Its branch coefficients are principal `(-1,1/4,-1)`, false `(0,0,1)`, true
  `(0,1/4,0)`. The source and consumer both separate the true trace from the
  principal/false fast estimates.
- `lem:ex-trace-small-means`: same selected medium, arch/rate distinction,
  exponent one, finite detector lower bound and rate inputs.
- `prop:ex-lattice-charge-bounds`: field bound and local flux-price bound,
  plus the stated `|m+12 kappa|<=t^(-100)` payment accuracy and transport input.
- `lem:ex-trace-free-stress-basis`: full four-dimensional free stress table,
  not its conserved kernel. The two-column chapter additionally assumes the
  onto/free-vector-kernel statement; its full manuscript provenance remains open.
- `lem:trace-normalized-stress` and the centered moving-label output in the
  asymptotic chapter: same physical tensor, `4d2 O` and unit-removal scale.
- Strict selection and the gallery handoff in `trace-firesky-gallery.tex`:
  exact null-subsequence clause is consistent. Its pre-existing unit/weight
  wording defect is an external repair already recorded by PR107.

## Audit-record correction and limits

The author's part-B correspondence row for
`lem:ex-lattice-trace-weighted-price` names `scout` as its leading source
anchor. The weighted conclusion is instead `permute`/`spend`/`expenses` in
`Terrace/Delta.lean`; `scout` supplies the preliminary unweighted operator
convergence used by `springs`. This is a nonblocking audit-anchor correction,
not a mathematical defect in the chapter. Likewise the older weighted evidence
file's statement that the receiver lemma is in the calibration chapter is
stale: it is now in the weighted chapter. Those read-only records were not edited.

The earlier scribe evidence's phrase “reviewed units” is not relied on as a
current approval. This review freezes only the two targets and the interfaces
listed here. In particular it neither certifies the entire external33/34
proofs nor closes a missing producer merely because an appropriate Lean lemma
exists. No new axiom conclusions are drawn; the source import's existing trust
limitations and separate clean-build audit remain unchanged.
