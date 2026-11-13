# C15 part-A author findings

Session `schmittj-claude-c15-20261113`, author pass on eleven chapters: `trace-small-means`, `trace-crown-buffer`, `trace-price-recurrence`, `trace-local-paid-budgets`, `trace-local-rate-selection`, `trace-medal-prices`, `trace-eve-producer`, `trace-row-jet-estimates`, `trace-regular-atom`, `trace-coffer-supplier`, `trace-bill-prices`. Lean source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. "Verified" below means: I opened the named Lean declaration and read its statement (and, where indicated, the relevant proof lines) and compared it with the LaTeX; nothing was elaborated or compiled. This is author-side evidence, not a review.

All eleven chapters were read in full. All eleven prove conditional statements: each takes local estimates of the selected construction as inputs. None of them is a closed producer of the selected-data facts; the remaining inputs are listed in section 5 and in `ledger.md`.

## 1. Errors repaired

**E1. `trace-price-recurrence.tex` and `trace-coffer-supplier.tex`: the column parameter is a real allowance, not a count.** The text called `c_k` "the number of coefficient columns" (price-recurrence, definition of `c_k` and proof of the endpoint proposition; coffer-supplier, two places). Source: `YM.RG.Stage.columns : ℝ` with `columns_ge : 1 ≤ columns` (`Lean/YM/RG/History.lean`), used as `(H.levels.params k).columns` in `YM.Bid.Duet.Woke.spread` (`Lean/YM/Bid/Loan.lean`) and in `YM.PhysicalNext.Repeat.Quince.ascend` (`Lean/YM/TraceExtension/Quince/Apace.lean`). Changed to "selected column allowance, a real parameter of the stage data, at least 1" in all four places. The inequalities are unchanged.

**E2. `trace-price-recurrence.tex`: the constant `M_d` was misdescribed.** The text defined `M_d` as a maximum of operator-norm products of local gauge variations. The source constant in `fineK` is `Cub.gaugeMeter d = 1 + Σ_{q≤d} 2^q (q+1)^q` (`polarCost`, `Lean/YM/Planned/ATOM_REGULAR_ESTIMATE/CrossEffect.lean`; `gaugeMeter`, `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Cub/Speed.lean`; `fineK`, `Lean/YM/TraceExtension/Quince/Unum.lean`), and it enters through `Cub.speedTest`, which converts a bound on ordered left derivatives along normalized directions into the probe comparison. Replaced by the explicit formula and a statement of what the constant does. `trace-local-paid-budgets.tex` and `trace-eve-producer.tex` now name the same constant ("polarization constant") instead of "gauge-variation factor" and "common normalization factor".

**E3. `trace-price-recurrence.tex`: the truncation argument denied a step that the source takes and that the argument needs.** The text said that absolute summability justifies the tail limit "without differentiating an infinite sum term by term", and bounded the probe of the full presented field minus a finite truncation by the sup-bound tail. That is a bound on derivatives of an infinite sum, so the derivative of the sum must be identified with the sum of the derivatives. The source proves exactly this: `YM.PhysicalNext.Repeat.Quince.line_fare` (`Lean/YM/TraceExtension/Quince/Latch.lean`, induction on the list of directions, `hasDerivAt_tsum_of_isPreconnected` on a small interval inside the open quiet set `dent B`), used in `loom_s` (`Lean/YM/TraceExtension/Quince/Lilt.lean`). Added: the pointwise identity `g = Σ f_a` on the open quiet set (new equation `eq:ex-lattice-price-presented-sum`), the derivative identity (new equation `eq:ex-lattice-price-derivative-sum`) with its inductive proof, and the corrected description of the truncation step. The final estimate is unchanged.

**E4. `trace-row-jet-estimates.tex`, last paragraph: the two input arrays and the reference direction were misidentified.** The text said the reference direction is a finite Laurent polynomial and "the actual input array is the analytic periodized row applied to the patched test field", then that "these input arrays agree on the ball". In the source (`ownQ`, `clarity` in `Lean/YM/TraceExtension/Quince/Scale.lean`) the two arrays that agree on the ball are the arrays before the row is applied: `W = Ramble.lamina Q k t u` and its patched periodic lift `V` (`V z a = if separation 0 (wrap c z) ≤ m then W (lift (wrap c z)) a else 0`); the same row `T.R.A0` is applied to both; polynomial membership (`city_p`, used in `zert`, `Lean/YM/TraceExtension/Quince/Quart.lean`) is proved for the reference direction only. Rewritten as a paragraph "The arrays in the selected construction".

**E5. `trace-regular-atom.tex`: wrong exponent in the receiving reserved mass.** Two places had `exp(α_c q_i)`. Source: `YM.Push.Local.reservedMass B X a = exp((B.supportExponent+2)·coverNumber B.B X)·a` (`Lean/YM/Push/LOCAL_SPLITTING/Funding.lean`); the C09 chapter `regular-principal-producer.tex` also uses `e = a_c+2`. Corrected to `exp((α_c+2) q_i)`; the deduction `S_i ≤ R_i` is unaffected.

**E6. `trace-regular-atom.tex`: the root label.** The text said a "single distinguished channel is the only one carrying the root label; the other channel labels have zero assigned support cost". In `YM.PhysicalNext.Repeat.Graces.regularCard` (`Lean/YM/MergeProof/Elder.lean`) both leaves `T.live` and `T.pale` have `turn = .logKey k`, and the assigned cost is `‖L^d‖·(Cp+D')` at the single expansion index `icon U k` and zero at all other expansion indices. Corrected.

**E7. `trace-regular-atom.tex`: derivative bound stated without its directional restriction.** `‖D^ℓ_0 U_i − D^ℓ_0 V_i‖ ≤ 2(v/χ)w_i` read as an operator-norm bound. Source (`Quince.mire`, `Lean/YM/TraceExtension/Quince/Mire.lean`): for lists `l` of length `≤ d` with `(B₁).dirBound 0 A` for every `A ∈ l`, `‖leftDerivs U l 1 − leftDerivs R l 1‖ ≤ (x+x)·F'.weight`. Restated for ordered lists of normalized directions.

**E8. `trace-coffer-supplier.tex`: `Attainment(L) = e` is not an equality.** `YM.MergeProof.Attainment P o f x` (`Lean/YM/MergeProof/Flavor.lean`) is a certificate with budget `x`: attachment of every component, marked support, and nonnegative bounds `v_i` with `Σ reservedMass P i (v i) ≤ x`. Restated as "attainment cost at most e" with the three clauses.

**E9. `trace-coffer-supplier.tex`: the bias estimate was attributed to a section that assumes it.** The text said the paid-response price estimate of `sec:ex-lattice-trace-bill-prices` bounds the bias by `threshold(k)² AgeK_k(−1/4)`; `trace-bill-prices.tex` takes that bound as a hypothesis of `lem:ex-trace-bill-column-size`. It also said the bias "combines" the column estimate with "the separately calibrated response-column estimate"; in `YM.Trace.Terrace.purchasing` (`Lean/YM/TraceExtension/Terrace/Casa.lean`) the bias is the column estimate of `riches` with `b' = cameo`, divided by `cameo`, followed by `bias_pay` (`Lean/YM/TraceExtension/Terrace/Virtu.lean`), and nothing else. Replaced by the explicit calculation: `q_k = u·ϑ_k²·Age_k(1/6)` (`Shunt.grantS`), `κ_k = Age_k(1/2)` (`cameo_age`), `c_k ≤ log β̂_k` (`PostT.share`), `4(1+log β̂_k)u ≤ Age_k(1/12)` eventually, exponent `1/12+1/6−1/2 = −1/4`.

**E10. `trace-local-rate-selection.tex`, `lem:ex-lattice-tail-pays-probe`: wrong name of the constant in the final assertion.** The lemma said the probe is bounded by `Z_d(x)t`, "where t is the test amplitude". In `Quince.fourrate` (`Lean/YM/TraceExtension/Quince/Dawn.lean`) the factor is the `supBounds` constant of the observable (`v.supBounds 0 X f' t`), i.e. the `w` of (6) and (11) in `trace-row-jet-estimates.tex`. Corrected to `Z_d(x)w`. (Not in the prepared audit.)

**E11. `trace-crown-buffer.tex`, proof of the proposition: the decomposition `Q(f,g) = Q(w,g) + Q(f−w,g)` was attributed to the exact product identity.** It is linearity of the extension and of the expectation for bounded measurable fields (`YM.Trace.Terrace.differ`, `Lean/YM/TraceExtension/Terrace/Peeking.lean`); the product identity (`backProd`) is used only for the correction term. Corrected. (Not in the prepared audit.)

## 2. Gaps repaired

**G1. `trace-small-means.tex`.** (a) The response space was "signed-equivariant arrays"; the source space `StressFlux.vectors` (`Lean/YM/Push/STRESS_FLUX/Counts.lean`) also requires invariance under the real structure, and the domain of `s_i` is the analogous space `Bowl` of raw labels (`Lean/YM/TraceExtension/Terrace/Vector.lean`). Both spaces are now defined. (b) The medium and response identities are eventual in the source (`Slate.canal`, `Spun.starts`), and `fisc` needs `C.ref 5 ≤ k_i`; the text and the lemma now say "for all sufficiently large i". (c) The night condition was listed as a hypothesis; it holds for every entry of an array in the raw space (`frames_night`), now stated with the one-line reason. (d) The moving point `ζ_i^pt` was undefined; it is now the source's `beaconV` (`Lean/YM/TraceExtension/Terrace/SkyEar.lean`), with its limit and its lattice form (`kamago`). (e) The detector was asserted from "the selected chart hierarchy and its derivative/orientation identities"; it is now derived from two explicitly stated inputs, separation at the axial configuration (`ears_det`) and convergence of fixed tested pairings (`spots`), by the finite-dimensional argument of `listened_G` (`Lean/YM/TraceExtension/Terrace/Ears.lean`). (f) `Θ_i` and "ticket" were undefined; both are now defined (`Tau`, `Ticket`, `Gate` in `Terrace/Arms.lean`, `Fund.lean`, `Base.lean`). (g) The sentence "the stage comparison bounds z_i by the summit scale" was imprecise: `z_i` is the hatted coupling at the summit index by definition (`Stern`), and the ticket `stickK` rests on `bond` (`β̂(summit j) ≤ 2β̂(j)` eventually); rewritten.

**G2. `trace-crown-buffer.tex`.** "Interior", "window", "room" and "seam condition" were used without definition; they are now defined from `YM.Cells.Interior`, `GridApprox.window`, `GridApprox.room` (strict inequality, `tail`), and `YM.Cells.Seam`. The second field's window radius is now the explicit `lensScope C 4`, and the common window `max{l, l_4}` used in `stageCrown` is stated. The two lemmas and the proposition now list their hypotheses; the proposition states the order "there is `i_0`, for every `i ≥ i_0`, every `N`, `p`, fields, sites", matching `YM.Trace.Terrace.stageCrown` (`Lean/YM/TraceExtension/Terrace/Crown.lean`). The opening now says that one family and its selected history are fixed.

**G3. `trace-price-recurrence.tex`.** The one-step estimate was said to hold "for all sufficiently large volume indices". In `Quince.rideE` (`Lean/YM/TraceExtension/Quince/Pride.lean`) and `ascend` the eventual parameter is the period index `n`, with uniformity in the volume index `N` (`N > m`, resp. `N ≥ k`). Corrected in the text, in the proposition and in its proof; the norm, the core projection, the remainder normalization and the same-history requirement are now stated with the estimate.

**G4. `trace-local-paid-budgets.tex`.** The Wilson specialization of the abstract constants is now given (`Quince.chief`, `Bunk`, `foton`, `Lean/YM/TraceExtension/Quince/Cache.lean`), and the set of admissible (stage, grade) pairs is now the explicit `goodD` set with `s.first ≤ i` (`Graces/Crowns.lean`; `Quince.parliament`, `Lean/YM/TraceExtension/Quince/Soot.lean`), with the order: budgets first, then the threshold in `x`.

**G5. `trace-local-rate-selection.tex`.** "Admissible data C, D" is replaced by the explicit ranges of the six constants (`Libretto.C_one`, `Libretto.matins`, `Record.majorant`, `.guards`, `.peak`, `.chimes`, `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Sonata.lean`); `clinicFee` is defined (`Heir/Clinic.lean`, `patterns` in `Faa.lean`); the head-count index set uses the finite colour index set, not the colour vector space (`Lute.season`, `headCount`); the subscript of `guests` no longer suggests a kernel parameter.

**G6. `trace-medal-prices.tex`.** `DoorsRate(L) = L^{-2/5}` is defined (`Doors.rate`); the source values of `A` and `P_{1/2}` are given (`March.shiftG`, `Reserves.polyPrice`); a closing paragraph records that the cloud and tuition bounds are used at the price `z` and the gas bound at the separate price `y` (`Quince.Medal`, `Lean/YM/TraceExtension/Quince/Guild.lean`).

**G7. `trace-eve-producer.tex`.** The "probe-to-run difference" is now defined (`Cub.Eve.paths`, `Cub/Chant.lean`; `Quince.highstar`, `Lean/YM/TraceExtension/Quince/Pix.lean`; `ocean`, `Cub/Finery.lean`), with its `L^d`, the frame basis index, the literal row identity and the threshold and size conditions; the cap receipt lists the conditions of `Eve.cap`; the theorem states that the tail in `x` is chosen before the finite indices; the scalar symbols `Λ`, `w_p`, `ν`, `temp`, `fiery` are identified; a closing paragraph lists the standing conditions of `Quince.bairn` (`Lean/YM/TraceExtension/Quince/Bairn.lean`) and the conditions of the response receipt `Mercury.PermitY` (`Mercury/Riddle.lean`), and says which receipts are inputs.

**G8. `trace-row-jet-estimates.tex`, `prop:ex-lattice-strip-to-probe`.** The proposition assumed `x_k, y_k ∈ V_k` and `γ^{(k)}(0) = x_k`. In the source polynomial membership is proved only for the screened, threshold-scaled reference direction, and the path is `θ·R` (`zert`; `costs_scaled`, `weigh_inputs`, `Lean/YM/TraceExtension/Quince/Shift.lean`). The proposition now defines the normalized edge norm, assumes vanishing for `P(θ y_k)` only, takes `γ^{(k)}(0) = θ x_k`, and assumes that the observable depends only on allowed-edge components (the `hm` step of `weigh_inputs`). The proof is adjusted accordingly. A list of the hypotheses under which the source applies the proposition (`zert`) is added after it.

**G9. `trace-regular-atom.tex`.** The source hypothesis "regular source with pointwise bound c" is replaced by the four conditions of `RegFit` and `supBounds` (`Lean/YM/Extra/SOURCE_HISTORIES/LocalDebt.lean`, `Lean/YM/RG/Masks.lean`); the monitor is evaluated at the hatted coupling of the coarse rung (`sprite G y L` with `y = hatBeta m` in `Quince.salaryT`, `Lean/YM/TraceExtension/Quince/Soil.lean`); the conclusion is restated as in `PaidAtom` (one coefficient chosen before the motion, presentations depending on the motion, exact pushed density `eq:ex-lattice-regular-pushed-density`, remainder normalization); the cloud bound and the large-support tuition bound are identified as separate entries of the local record, not consequences of the C09 reserved-mass estimate.

**G10. `trace-coffer-supplier.tex`.** (a) The label `b` is now chosen before all windows, as in `YM.MergeProof.Accent.riches` (`Lean/YM/TraceExtension/Soot/Coffer.lean`: `∃ b, [column] ∧ ∀ J m l, …`). (b) The column `C_k(b)` is defined through the terminal identification (`Next.Rank.Price.columns`, `Lean/YM/Next/RANK/Matrices.lean`; `b := (s!).terminal v` in `riches`). (c) The norm entry of the Bill is derived from `q_k ≤ 1` (`book_pay`). (d) The planted expansion is stated as an explicit named input. (e) The order of choices of `purchasing` is recorded.

**G11. `trace-bill-prices.tex`.** `s_i` and `γ_i` are defined (`stakes`, `gainChart`); the five scale estimates are named as inputs; the proposition states the window, reference-level, room and interiority conditions of `Bill.root` and defines `Col`.

## 3. Gaps not repaired

**N1. The detector inputs of `trace-small-means.tex` are not proved in a manuscript chain that I could verify.** Separation corresponds to `ears_det`, which uses `scope_exact` (standard-table derivative and orientation identities, `G.Simple`). The C14 chapter `trace-free-rank.tex` (isomorphism after `eq:ex-trace-divergence-probes`) is the candidate producer, but I did not verify that its space `V_5` and probes are the space `V` and pairings of this chapter. Convergence of tested pairings corresponds to `spots` (uses `StarPath.approach`, `travels_jet`); I did not locate a manuscript producer. Both are stated as inputs; edges `C14-to-C15-vector-detector` and `C14-to-C15-chart-pairing-convergence` are open.

**N2. `trace-crown-buffer.tex`: the Crown witness, the transfer identity, the one-site estimate and the scale receipts remain inputs.** Their source producers are `Glade.canopy`, `Cask.forfeit`, `Shepherd.health`, and the scale lemmas in `funeral`/`stageCrown`. The chapter proves the transfer only.

**N3. `trace-price-recurrence.tex`: the insertion paragraph (decomposition into primary, regular and forced atoms, Fubini, paid insertion estimate) and the estimate `‖x_{j+1}‖ ≤ P_j‖L_j(x_{j+1})‖` were not checked against `Surrey.include_one` and the block-cap lemma line by line.** They are recorded as not checked rather than rewritten.

**N4. `trace-eve-producer.tex`, subsection "Matching the finite-volume response estimate".** I did not re-derive the identification (7) or the rate claims for `B_*`; they are attributed to the two C08 sections under their hypotheses. I checked only that those sections exist and state a comparison of the displayed form.

**N5. `trace-coffer-supplier.tex`: the planted expansion.** It is now an explicit input; its proof (`Accent.copious`, `Lean/YM/TraceExtension/Soot/Basin.lean`) is not written. Writing it requires the response hierarchy chapters and is outside what I could verify in this pass.

**N6. `trace-local-rate-selection.tex`, proof of `prop:ex-lattice-selected-local-budget`.** I checked the definitions and the final statement against `scales_m`, `horizon_u`, `samite`, `straps`, `boost`, `fuse`, `guests`, `visitors`, `opal`, `paintW`, `segment`, `tranche`, `scratch`, and the exponent bookkeeping; I did not check the internal inequality (18) against `overcrowded` and `booster` line by line.

**N7. `trace-regular-atom.tex`: the small-support and large-support chart conclusions (`mire`, `desert`, `routeB`, `ribbonW`) are stated, not proved.** The chapter proves the two-case arithmetic from them.

## 4. Inaccuracies in read-only files (not changed)

- `trace-small-means-evidence.md`: `YM.Trace.StressFlux.ears_det` does not exist; the declaration is `YM.Trace.Terrace.ears_det` in `Lean/YM/TraceExtension/Terrace/Ears.lean`, and `listened_G` is in `Ears.lean`, not `PriceLimit.lean`.
- `trace-crown-buffer-evidence.md`: names `YM.Trace.Terrace.Cor` and `YM.Trace.Terrace.Grid.tide` as witness producers. The producer is `YM.Trace.Terrace.Glade.canopy` (`Terrace/Cor.lean`); `Glade.tide` (`Terrace/Grid.lean`) consumes a Crown witness through `stageCrown`. `YM.Trace.Shepherd.expire` should be `YM.Trace.Terrace.expire` (`Terrace/Mortal.lean`).
- `trace-row-jet-estimates-evidence.md`: `stream_scale` is `YM.PhysicalNext.Repeat.Quince.stream_scale` (`Quince/Scale.lean`).
- `trace-coffer-supplier-evidence.md`: `SharpRead` is `YM.MergeProof.Accent.SharpRead` (`Lean/YM/TraceExtension/Soot/Skein.lean`).

## 5. Open inputs (summary; exact statements in `ledger.md`)

Small-means: mission price bound, separation, pairing convergence, scale tickets, medium/response/scaling identities. Crown buffer: Crown witness, transfer identity, one-site tail, scale receipts, seam. Price recurrence: paid direction and cone (C05), the local insertion estimate, scale inequalities. Rate selection and row jets: strip bound for the actual row, placement, regularity, polynomial-jet vanishing, growth receipt. Eve: response receipt (C08), probe receipt, cloud receipt. Regular atom: local record entries (cloud, tuition, probe), C09 principal reserve, certificate. Coffer: atomic certificate, endpoint estimate, reference difference (C05), planted expansion, melting. Bill prices: five scale estimates, paid label and root receipt.

## 6. Audit items and decisions

| Audit item | Decision | What I checked and did |
| --- | --- | --- |
| SM1 (response space needs real structure) | confirmed | `StressFlux.vectors`, `TableOne`, `Bowl`; repaired (G1a) |
| SM2 (identities are eventual) | confirmed | `Slate.canal`, `Spun.starts`, `fisc`; repaired (G1b) |
| SM3 (moving point undefined, detector input) | confirmed | `beaconV`, `nearing`, `ears_det`, `spots`, `listened_G`; repaired (G1d,e); producers left open (N1) |
| SM evidence names | confirmed | read-only file; section 4 |
| SM same-history table | refined | identifications `k_i = summit(j_i)`, `r_i = a_i b_i` added to the text; the full tuple is in `ledger.md`, not in the chapter |
| CB1 (interior, room, seam undefined) | confirmed | `Interior`, `room`, `Seam`, `pulpit`, `stageCrown`; repaired (G2) |
| CB2 (witness producer misnamed in evidence) | confirmed | `Glade.canopy`, `Glade.tide`; read-only file; section 4 |
| CB same-history (ρ_k, β_k from one path) | confirmed | `forfeit`, `soils`, `funeral`; one-sentence statement added (G2) |
| PR1 (columns) | confirmed | repaired (E1) |
| PR2 (M_d) | confirmed | repaired (E2) |
| PR3 (differentiation of the series) | confirmed | `line_fare`, `loom_s`; repaired (E3) |
| PR4 (eventual period index; interface) | confirmed | `rideE`, `ascend`, `Duet.Woke`; repaired (G3); the full list of `Woke` clauses is not copied into the chapter, which cites the paid direction of `sec:reference-cone` |
| PB1 (dictionary of constants) | confirmed | `chief`, `Bunk`, `foton`; repaired (G4) |
| PB2 (admissible stage/grade set) | confirmed | `goodD`, `parliament`; repaired (G4) |
| PB same budget `v` | confirmed | `salaryT` takes `Medal … ξ₀ z'` and `Bunk … u' z' ξ₀`; sentence added |
| RS1 (record fields, `clinicFee`, colour index) | confirmed | repaired (G5) |
| RS same-history (`fourrate` kernel identity) | confirmed | recorded in the new hypothesis list of `trace-row-jet-estimates.tex` (G8) and in the ledger |
| MP1 (source-specific factors) | confirmed | repaired (G6) |
| MP two prices | confirmed | `Medal` fields; paragraph added (G6) |
| EVE-B1 (probe-to-run difference) | confirmed | `Eve.paths`, `highstar`, `ocean`; repaired (G7) |
| EVE-B2 (response interface) | refined | I added the standing conditions and a description of the `PermitY` conditions, but did not turn the chapter into a selected-data theorem; the theorem stays a scalar statement (N4) |
| EVE same-history (cap conditions) | confirmed | `Eve.cap`; conditions now in the theorem |
| ROW-A1 (arrays versus convolutions) | confirmed | repaired (E4) |
| ROW-B1 (membership and threshold) | confirmed | `zert`, `Mom.Maps`, `costs_scaled`, `weigh_inputs`; repaired (G8); the audit's formula for the priced norm matches `Lyre.Sized`/`width` and is used |
| ROW-B2 (application statement) | confirmed | hypothesis list of `zert` added (G8), as inputs |
| ROW evidence name | confirmed | section 4 |
| ATOM-A1 (reserved-mass exponent) | confirmed | repaired (E5) |
| ATOM-A2 (root label) | confirmed | repaired (E6); I wrote the cost with the two derivative bounds `c_re, c_im`, as in `regularCard`, not with reserved masses |
| ATOM-A3 (directional restriction) | confirmed | repaired (E7) |
| ATOM-B1 (source hypotheses) | confirmed | `RegFit`, `Regular`, `supBounds`, `PiVanish`; repaired (G9) |
| ATOM-B2 (pushed density, motion-uniform coefficient) | confirmed | `PaidAtom`, `blast`, `dance`, `salary`; repaired (G9) |
| ATOM-B3 (cloud and talent are separate inputs) | confirmed | `Medal.cloud`, `Medal.talent`, `desert`; repaired (G9); proofs of `mire` and `desert` not written (N7) |
| ATOM adjacent-history equalities | confirmed | `hew`, `htw` in `salaryT`; stated in the setup |
| COFFER-A1 (columns) | confirmed | repaired (E1) |
| COFFER-A2 (attainment) | confirmed | repaired (E8) |
| COFFER-A3 (bias attribution) | confirmed | `purchasing`, `bias_pay`; repaired (E9) |
| COFFER-B1 (one label for all windows) | confirmed | `riches`; repaired (G10a) |
| COFFER-B2 (bare and public label) | confirmed | `columns`, `riches`; repaired (G10b); the factory-entry identity is stated as part of the response data, not as proved |
| COFFER-B3 (unit norm) | confirmed | `book_pay`; repaired (G10c) |
| COFFER-B4 (planted expansion is an input) | confirmed | `copious`, `spiker` signatures; made an explicit input (G10d, N5) |
| COFFER period tail | confirmed | `Sceptre.bias`, `ascend`; stated |
| COFFER evidence name | confirmed | section 4 |
| BILL-B1 (scales and tickets) | confirmed | `nativeC`, `tends_price`, `stakes`, `gainChart`, `gainsK`; repaired (G11) |
| BILL-B2 (root receipt conditions, column map) | confirmed | `Bill.root`, `columns`; repaired (G11) |
| External #33/#34 boundary | confirmed, no change | none of the eleven chapters cites #34; `trace-prosper-sensor.tex` l. 552 cites `lem:ex-trace-small-means` |

No audit item was rejected. Items found by my own reading and not in the audit: E10, E11, G1c, G1f, G1g.

## 7. For part-B

- `trace-small-means.tex` now cites `prop:ex-trace-mission-price-transfer` (in `trace-mission-price.tex`) as the conditional transfer statement for the price input `eq:ex-trace-small-means-price`. Please keep that label. The price allowance is written in small-means as `Θ_i = exp(−(100/10^4)(log β̂_{j_i})^{48})`, which is `τ_i(−100)` in the notation of `trace-mission-price.tex`.
- `trace-probe-assembly.tex` cites `prop:ex-trace-crown-buffer`. Its conclusion is unchanged; its hypotheses are now explicit: Crown witness, second field bounded by `F_i(150000)` and interior to the window of radius `l_4` (grade-four stencil radius plus four), room for `l_4`, distinct coarse sites, seam, transfer identity, one-site estimate; threshold `i_0` independent of `N`, `p`, fields, sites.
- `trace-probe-assembly.tex` uses the paid-component error of `prop:ex-trace-bill-root-price`; that proposition now states the window, reference-level, `J_i < K_i`, room and interiority conditions of the root receipt.
- I found no error in a part-B chapter; I read only the passages of `trace-mission-price.tex` that small-means refers to.

## Second round: checker findings and responses

An independent checker (`c15check/final_A.md`) reviewed every hunk of the first-round edits. It reported no error or regression, two gaps, one inaccuracy and four nits. I checked each against the current text and the Lean source. No first-round edit was reverted.

| Checker finding | Decision | Reason and location of the change |
| --- | --- | --- |
| 1. GAP, `trace-coffer-supplier.tex`: the planted-expansion input omits a bound used in the proof (the `2fK` term) | adopted | Verified: `YM.MergeProof.Accent.Vault` (`Lean/YM/MergeProof/Newell.lean`) bounds the singleton amplitudes per census index (`r i * ‖F i U‖ ≤ x`, `∑ j, r i * ‖g i j U‖ ≤ y`); `Served` (`Lean/YM/MergeProof/Accent.lean`) requires two correction families `H`, `K` with `Carton`, two `Towed` bounds and `X = restore R Φ ωs H K`; `steer` gives the exponent `card V * (x+y+2*f)`, with `harvest` bounding each correction family by `card V * f`. My first-round input kept the old phrase "each box term carries one unit of support cost" and did not state the reconstruction or the ordinary correction family, so the `5K` did not follow from it. The input now states: the two singleton bounds per census index; the reconstruction formula (as in `restore`); for each of the two correction families the anchored support-cost bound with constant 1 at the level-`m` support exponent (`Towed`, `Ac.Hit`, `Loci`) and the census-mark property (`touchdown`); and the consequence, new equation `eq:ex-trace-coffer-corrections`. The sentence about the exponent now derives `2K+K+K+K`. The input remains an input (`copious`); N5 stands. |
| 2. GAP, `trace-price-recurrence.tex`: compactness does not give the vacuum-gas bound | adopted | Verified: `coat`, `dressed`, `coat_budget`, `dressed_budget`, `dress_eq`, `dress_abs` (`Lean/YM/Extra/SOURCE_HISTORIES/Dressing.lean`) obtain the bound from `Activities.K_total` (`Lean/YM/RG/ActivityBounds.lean`: summable `b` with `‖A.K i U‖ ≤ b i`) under `R.Lawful`; they are used in the insertion (`Extra/SOURCE_HISTORIES/Merge.lean`, `MergeProof/Gelatin.lean`). The passage (pre-existing text, my N3) is replaced by: boundedness and measurability of the effective density and the summable vacuum-activity budget as two named inputs; the bound `C_gas ≤ exp(Σ a_j)` for every dressed multiplier, with the erasure argument of `coat_budget`; the resulting summable majorant and the rearrangement. The claim "the action is continuous, so `A_N < ∞`" is removed. |
| 3. INACCURACY, `trace-eve-producer.tex`: `F` is the probe family but the prices are functions of the frame | adopted | Verified: `Local.tests`, `testPrice`, `errorPrice` (`Push/LOCAL_SPLITTING/Comparison.lean`), `readPrice` (`Projection.lean`), `Motion.orbitCost` take the frame. The frame is now `\mathscr F`, `F` its probe family, and `Z`, `T`, `c` are written with `\mathscr F`; a sentence says the read and error prices also depend on the holonomy map. I did not add the holonomy map as a second argument in the display. |
| 4. NIT, `trace-coffer-supplier.tex`: "attachment condition" undefined | adopted | Verified `Local.Attaches` (`Push/LOCAL_SPLITTING/Atoms.lean`) and `UsesFinal`; the clause is now spelled out (measurable, gauge invariant, zero on configurations healthy on `Y`, same value when links on `Y` and threshold flags in `Y` agree). |
| 5. NIT, coffer and bill chapters: "open" undefined | adopted | Verified `Stock.Tabs.opens` (`Lean/YM/Overlay/Prior.lean`): `i ≤ j ∧ s*(coverSize j)^2 ≤ a i / a j`, used with `s = 1`. Defined in the coffer chapter and restated in `prop:ex-trace-bill-root-price`. I write `σ_j` for the clock's cover size, not `B_j` as the checker proposed, because `B_k` already denotes the budget radius in the coffer chapter. |
| 6. NIT, `trace-local-rate-selection.tex` l. 305: stale subscript `guests_{G,D,K}` | adopted | One occurrence in equation (23) had been missed; corrected to `guests_{G,D.K}`. |
| 7. NIT, `trace-price-recurrence.tex`: empty maximum when `m = k` | adopted | `ascend` uses `(Finset.Ico m k).eventually_all`; the threshold is now `n_0 = max({0} ∪ {n_j})`, with the remark that for `m = k` the statement is `x_k = x_m = 0`. |
| Verdict "G5 wrong as a claim of complete repair" | accepted | see 6 |
| Verdict "G7 wrong in its symbol identification" | accepted | see 3 |
| Verdict "G10d wrong as a sufficient stated input" | accepted | see 1 |
| Ledger edge C14 → vector detector: checker says the C14 passage supplies the separation | not adopted as closed | I did not re-verify the identification of C14's `V_5` with `TableOne`; the edge stays "input; producer located", now with the checker's confirmation recorded as a second reading. |
| Ledger edge C14 → chart-pairing convergence: checker says still open | agreed | unchanged |

Points I had marked as unsure, now settled by reading the definitions:

- `tilesAt`: `abbrev tilesAt (q : h ≤ m) := Cells.center S p q 0` (`Lean/YM/Push/GRID_APPROXIMATION/Geometry.lean`), and `Cells.center S p (h : m ≤ N) o : Tiling (S.side N p)` has `period := S.side m p` (`Lean/YM/Cells/Packing.lean`). So it is a tiling of the volume-`N` lattice whose cells have the side of level `i`; the text of `trace-crown-buffer.tex` stands.
- Terminal identification: `Source.TransferData` (`Lean/YM/Source/Insertion.lean`) has `entries : ∀ m, F.Coeff → Coefficient F (H.S.side m p)` and `terminal : F.Coeff ≃ₗ[ℂ] F.Coeff`. The coffer text now says "a linear isomorphism of the grade-`d` coefficient space onto itself which sends bare reference coordinates to public labels".

References to the external units: none of the eleven chapters contains a `\ref` or `\eqref` to a label defined only in `trace-prosper-sensor.tex` or `trace-branch-moments.tex`; every label referenced from the eleven chapters is defined in a file that `manuscript/existence.tex` includes. No reference was replaced.

Labels: no label was removed or renamed in either round; one new label was added in this round (`eq:ex-trace-coffer-corrections`). The part-B labels cited from part-A, `prop:ex-trace-mission-price-transfer` and `sec:ex-lattice-trace-probe-assembly`, exist at the end of this round.

Remaining uncertainties: the planted-expansion input is stated from the definitions `restore`, `Vault`, `Served`, `Towed`, `Hit`, `Loci`, `harvest`, `steer`; I did not read `Carton`'s components `Burns`, `Flow`, `rises`, nor `Poly.pass`, `field`, `bar` beyond their definitions' first lines, and the names "census monomial" and "box activity term" are my descriptions of `Mach` and `bar`. The statement that the box activity terms and the exponent are paid by the denominator bound is read from the `card (Site n) * u` term of `steer` and the call of `Vac.suffices_bill` in `spiker`, not from a proof I checked.
