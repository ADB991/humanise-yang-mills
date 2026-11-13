# C15 part-B author findings

Scope: `trace-probe-assembly.tex`, `trace-mission-price.tex`, `trace-scribe-producer.tex`, `trace-local-pairing.tex`, `trace-local-charge.tex`, `trace-spectrum.tex`, `trace-profiles.tex`, `trace-asymptotic.tex`, `trace-weighted-estimates.tex` (all under `manuscript/existence/`). Session `schmittj-claude-c15-20261113`, issue #56, worktree branch `claude/c15-author` on `81538d6`. Lean source pinned at `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; all Lean statements below were read as text (statement level, with the proof text where quoted); nothing was elaborated. This is author-side evidence, not a review.

Every chapter was read in full. Eight chapters were changed; `trace-profiles.tex` is unchanged. No theorem label was renamed. New labels added: `eq:ex-lattice-scribe-optical-identity`, `eq:ex-lattice-scribe-band-cost`, `eq:ex-lattice-scribe-clock-inputs`, `eq:ex-lattice-scribe-clock` (scribe), `eq:trace-reference-normalization` (asymptotic).

## 0. Items the coordinator should see first

**P1. `thm:trace-asymptotic` is conditional, and its statement now says on what.** The label and the conclusion (`lim_{r↓0} r^8 log^2(1/r) T(r) = 3 dim(g)/π^4 > 0`) are unchanged. The old statement read "Input `input:trace-scales`, with the reference normalization above, implies"; its proof also used, without naming them, the positive Laplace representation of `T` (monotonicity), the radial form `eq:trace-radial`, and the value of the reference two-point function of `O`. The statement now lists four hypotheses: (1) the reconstruction and stress hypotheses of `sec:trace-spectrum` (giving `eq:trace-positive-laplace`); (2) Euclidean translation and orthogonal invariance of the selected correlations with the scalar law of Θ (giving `eq:trace-radial`); (3) the reference normalization, new display `eq:trace-reference-normalization`; (4) `input:trace-scales`. This is the same theorem with its hypotheses made explicit; it is neither weaker nor stronger in content. None of the four is proved in the chapter. The paragraph after `input:trace-scales` now records how the input depends on C14, on the scribe chapter, and on the two external units: #33 through `prop:trace-prosper-sensor` (sensor bound and weighted Ward defect, used for `c_i^1 → -κ/4`), #34 through `prop:ex-branch-moments`, `prop:ex-branch-washout` (exponent 1) and `eq:ex-branch-three-traces` (branch field limits, principal/false trace washout, true trace `4O`). For the pointwise rounded comparison `eq:trace-basis-error` I found no producer statement in the manuscript (Lean: `YM.Trace.Verse.seat`, `rainbow`); it is an open input.

**P2. `thm:profile-exclusion` is proved in its chapter, unconditionally, for an arbitrary function `T` with the stated weighted limit `A>0`.** I rechecked every step (see section 3). It excludes exactly finite complex linear combinations of finite products of the mode profiles `eq:profile-mode`; the chapter's closing paragraph correctly says that nothing is asserted about infinite sums or continuous mass distributions. No mass gap and no exclusion of generalized free fields is stated anywhere in these chapters.

**P3. New `\ref`s to the external chapters.** `trace-scribe-producer.tex`, `trace-asymptotic.tex` and `trace-weighted-estimates.tex` now cite `prop:trace-prosper-sensor`, `sec:trace-prosper-sensor`, `eq:trace-sensor-selected-formulas`, `prop:ex-branch-moments`, `prop:ex-branch-washout`, `eq:ex-branch-three-traces`, `sec:ex-trace-branch-moments`. These labels exist in `trace-prosper-sensor.tex` and `trace-branch-moments.tex`, but those two files are not `\input` by `manuscript/existence.tex` at this checkpoint. Until the integrator (F01) includes them, the main build will show these references as undefined. They resolve in my wrapper build, which includes both files.

**P4. The internal clause `identified` is not covered.** `YM.Nonperturbative.Headline.TraceExclusions` (`Lean/YM/Nonperturbative/HeadlineSpec.lean` l.84–120) has clauses `identified`, `wick`, `maxwell`, `invariant` that are not part of the public `YangMills.Hierarchy.TraceTest` (`Lean/ChallengeSpec.lean` l.168–176: `centered`, `amplitudePositive`, `shortDistance`, `excludes`). The C15 chapters prove (conditionally) `centered` and `shortDistance` and (unconditionally from `shortDistance`) `excludes`; they do not prove `identified` (operator identity φ(Θ,f)=φ(τ,f)−⟨τ⟩(∫f)·I; Lean `YM.TraceExtension.Identity.center_field`, `Link/Identity.lean`) or the other three. `Lean/TraceBridge.lean` (`YangMills.publicTrace`) uses only `H.centered`, `H.positive`, `H.shortDistance` and `Wick.euclidean_excludes`, so the public statement does not need them. For G01/C16.

## 1. Errors repaired

**E1 (probe-assembly, l.25–30 and proof). Wrong scale hypothesis `a ≥ 1`.** The assumption `eq:ex-trace-probe-scales` required `a≥1` and the proof used "Because `a,t≥1`". In the source `a` is the field scale at the frame level: `YM.Trace.Terrace.Glade.tide` (`Lean/YM/TraceExtension/Terrace/Grid.lean` l.39) has `let q:= (C.S.a i/C.S.a k)^5; let a:=C.S.a i^(5:ℕ)` and its proof uses only `hm: 0 < a`; `YM.Schedule.a_zero`, `strictAnti` (`Lean/YM/Lattice/Scale.lean` l.101, 111) give `a_0=1` and strict decrease, so `a_j<1` for `j>0`. The proposition was true but inapplicable. Changed: `a≥1` removed from the hypotheses; the proof now uses `t²≤t⁴` and positive homogeneity of the column norm; the opening identifies `k=summit(j)`, `a=a_j`, and β as the finite-volume coupling at level `k`.

**E2 (scribe, l.20–22 and l.377–378). `O` was called "the distinguished unit field".** Source: `YM.Trace.Over.OScale` (`Chart/Stage.lean` l.50) is `fromPol (Climb.Bel L) (square4 G)` with `YM.Trace.square4 = (1/4) • ∑ i, ∑ j, pair G i j i j` (`Foundation/Dilate.lean` l.66); `YM.Trace.Over.ScalarP` (`Chart/Scalar.lean` l.41) has the unit and `4•OScale` as two separate directions and `Scalar_inj` (l.42) proves their independence from expectation 1 resp. 0 and `OScale≠0`; `Scribe.goal` (`Chart/Time.lean` l.59) has limit `(4*d2 G) • OScale`. Changed: `O` is defined as the normalized curvature-square field with zero expectation, distinct from the unit; the comparison-table limit is stated as `-κO=4d_2O` "not of the unit". The unit of the selected table is now written `1_S` to separate it from the reference unit.

**E3 (scribe, l.26–40). Divergence and comparison map were given the same codomain.** `YM.Next.UVStress.currentDiv` (`Lean/YM/Next/UV_STRESS/Tensor.lean` l.117) maps `KernelSpace H → Vectors H` of the interacting table; `YM.Trace.Shelves.Optics` (`Shelves/Lore.lean` l.40) maps `KernelSpace H₁.spin → TableOne H₂.spin` with `H₂` the reference hierarchy. Changed: `D:E→V_int`, `K_i,s_i` into the reference space `V`; added the optical identity `(K_iQ)_a=q_i r_i^5 U_{i,5}^{-1}((DQ)_a)` (from `Optics_pay`, `Shelves/Lore.lean` l.46, with `Hero`, `Shelves/Route.lean` l.69, and `crown`, `Terrace/Path.lean` l.47) as a named input, from which the kernel equivalence used later is immediate.

**E4 (local-charge, l.85). "`m/12` is the target flux `-κ`".** In `YM.Trace.Margin.brass` (`Margin/Beans.lean` l.17) the price is `midPay a J/12`, a finite-volume quantity; `landPay G = -12 κ` (`Loft/Awake.lean` l.9) and `WorthB.accurate: |midPay - landPay| ≤ shock x = x^{-100}` (`Margin/Ansel.lean` l.34, `Zn/Trail.lean` l.22). Changed: the closing paragraph states `|m+12κ|≤t^{-100}` as an additional input and derives `|ℓ(σX)+κ| ≤ 4‖ℓ‖W_{-1}(t)+(t^{-30}+t^{-100})/12`, consistent with `eq:ex-lattice-trace-finite-response-price`.

**E5 (asymptotic, l.76–77). "are supplied by the stress comparison estimates".** The cited producer (`lem:ex-lattice-trace-rank-one`, C14) assumes these properties; only the statements about `D_0` are proved (`prop:ex-trace-free-closure-rank`). Changed to say exactly this.

**E6 (scribe, l.303–309). "Its defining test identity identifies this number with shellGrad(M_0,…)".** In `YM.Trace.Over.year_spec` (`Chart/North.lean` l.28) this step is `hU.translation`, the translation Ward identity of the reference stress laws (`Marvel`, `Chart/Auth.lean` l.27), not a definition. Changed accordingly (input 2).

## 2. Gaps repaired

**G1 (scribe, new paragraph "The clock"). `q_i r_i^4→0` and `log(1/r_i)/q_i→1/κ` were asserted without argument, and the scale was the undefined "Zoom_i".** Source: `LogZoom J i = log (J.r i)⁻¹`, `zoom_BQ`, `clock_cost`, `band_cost` (`Chart/Orr.lean` l.40–77). Added a proof following `zoom_BQ`/`band_cost` from three named inputs `eq:ex-lattice-scribe-clock-inputs` (`gamut`: ζ(j)/β̂_j→1, `Terrace/Dusk.lean` l.89; `Barry`: ζ(j)/ζ(summit j)→1, `Terrace/Bang.lean` l.23; `0≤log b_i≤(log β̂_{j_i})^48` from `tiltP`/`titles`/`Gate`), the definition `β̂_j=β̄+κ log(1/a_j)` (`RG/History.lean` l.79, `Lattice/Scale.lean` l.115) and `r_i=a_{j_i}b_i`. The three inputs have no manuscript producer that I located (#33 assumes equivalent clock inputs).

**G2 (scribe, proportionality subsection). The shell comparison named an unlabelled "physical-shell theorem" and attributed both limits to "tested convergence and the comparison-of-jets estimate".** Rewritten after `year_spec`: four explicit inputs (physical stress laws; reference stress laws; a detecting derivative, `awake_o`; tested convergence and jet comparison, `Approaches`, `comparison_jets`), and the two limits are derived separately: the first from the physical Ward identity and `pay_jet`, the second from the field limit of `g_i` and `drape` (no Ward identity for `g_i`). No producer label for these inputs exists in the manuscript as far as I could find; they are recorded as open.

**G3 (scribe, comparison tables). Quantifiers on the comparison table.** Old text: "any comparison table that respects the selected table" for everything. Source: `Scribe.goal (T:Table C.book)` holds for every table (via `center_plus`, `shift_unit`, `july`, `Chart/Nectar.lean`); `Scribe.gallery (T)(h:T.Hierarchy): T.respects S → …` and `payload` (`Chart/Scalar.lean` l.73, hypotheses `Locals A' H'.spin`, `T₀.respects S`, `T₀.Hierarchy`, coherent charts) are needed only for the real two-coordinate representation. Changed: the limit is stated for every table; the coordinate representation under the extra hypotheses, with the argument of `payload`/`Scalar_onto` written out (reality and signed invariance of Θ_T, coherent chart, free stress classification `lem:ex-trace-free-stress-basis`).

**G4 (scribe). External inputs were not identified with the external statements.** Added the dictionary to `prop:trace-prosper-sensor` (its `E,H,f,ρ,n_i,𝔞_i` = `𝓑,V,𝖵,Λ,k_i,t_i`; `t_i=A_{1/5}`, `ρ_i=A_{1/6}`, `q_i` = arch scale at `k_i`; source `Prosper.vote`, `Terrace/Lease.lean` l.27; `RQ,TQ,BQ`, `Chart/Dray.lean` l.40–42; `Stern`, `Terrace/Gondola.lean` l.32) and to #34 (`L_i=t^0_{k_i}`, `Ω_i=t^-_{k_i}`, `Δ_i=t^+_{k_i}`, `𝒫_i=𝖯_i`, `ω_i=q_i r_i^4`; source `baron`, `press`, `Shelves/Tonic.lean` l.55–56; `Phase4`, `chartB`, `nearing_h`, `muteP`, `Shelves/Pear.lean`; `yields`, `blossoms`, `Chart/Stage.lean`).

**G5 (scribe, final paragraph). Order of choices for arbitrary null sequences.** `Gallery.lead` (`Chart/Line.lean` l.41–44) fixes the ultrafilter, arch and reference hierarchy before quantifying over the sequence; now stated, with `lem:ex-lattice-firesky-selection` (C14, conditional) named as the scale selection.

**G6 (weighted-estimates). (a)** `k_i` identified as the summit index of the frame level, equal to #33's postselected `n_i` (not #33's `k_i`). **(b)** The sentence "its chart and response estimates are the separate producer obligations listed in the audit" replaced by the precise relation to `prop:trace-prosper-sensor`. **(c)** In the source-route subsection the finite-volume index was called `p` (clashing with the rate `p_i` in the same display) and the symbol `v_i(p)` was used for two different transported fields (chosen response, `penumbra`, `Slate/Pony.lean` l.30; reference response, `diadem`, `Slate/Limit.lean` l.54); renamed to `ν`, `v_i(ν)`, `v_i^ref(ν)`. **(d)** The field-decay paragraph claimed that finite dimensionality converts basis bounds into the norm limit; replaced by an exact citation of `lem:ex-trace-small-means` (part-A chapter) with exponent 1 and its hypotheses, stressing the detector lower bound (source `YM.Trace.Terrace.small_means`, `Terrace/Terrain.lean` l.26; `YM.Trace.Slate.legacy`, `Slate/Garnet.lean` l.59). **(e)** Pointers "listed in the evidence record" replaced by `prop:ex-lattice-charge-bounds` and explicit "input" statements.

**G7 (mission-price). Admissibility of the local approximation and identity of the insertion.** The localization receipt was described as giving "a local approximation V with root error … and bounds for the two measured root costs". `YM.Trace.Terrace.outside` (`Terrace/Traveller.lean` l.42) gives one coarse `g` with sup bound `τ(150000)`, window, room, chamber-interior pullback, root error `τ(-300)`, and root cost `τ(5)` of the measured insertion; the sup/window/room clauses are what `Probe.toll` (`Terrace/Meteor.lean` l.22) requires of its test. The marker's root cost comes from `concert` (`Traveller.lean` l.24). Both now stated; the insertion approximant is described as in `ear_price` (`Terrace/PriceLimit.lean` l.34: `heightV … = ladd C (b_zoom V i) j N s 4 m' U`, with `Tested`, `1≤b≤tilt_cap`).

**G8 (local-pairing, application subsection).** "`Q` the marker after the grade-four insertion" corrected to the separately measured grade-four insertion label (`YM.Trace.Terrace.mileage`, `Terrace/Meteor.lean` l.30: `P:= C.O N p y 0`, `Q:= C.O N p (ladd C b i N p 4 T0 v) 0`), and the reason the probe bound applies to `(U,V)` is stated.

**G9 (local-charge, closing paragraph).** The passage from the one-configuration bound to the response used in the weighted chapter needs the transport bound `W_{-1/4}` (`YM.Trace.Slate.rift`, `Slate/Ven.lean` l.37), the contraction and flux-invariance of the core projection (`cost_range`, `orbit_core`) and the arch comparison (`holds`, `Terrace/Dusk.lean` l.79), as in `penumbra`. Now stated as two further inputs, with pointers to `eq:ex-lattice-trace-finite-response-price` and `eq:ex-lattice-trace-age-over-arch`.

**G10 (spectrum). Common-data binding.** Added a paragraph fixing one selected phase and naming the C04 objects and results used (`prop:complex-heat`, `eq:point-heat-vector`, `lem:continued-matrix`, `thm:joint-boundary`, `prop:word-fields`, `prop:word-motion`); inline citations for the mixed Gram identity (`lem:mixed-heat-gram`), the boundary theorem, the adjoint/vacuum formula (`eq:word-adjoint`) and field covariance; `φ(v,f)` identified with `Φ(v,f)` of `prop:word-fields`; the stress tensor's reality, symmetry and tensor law stated as hypotheses produced elsewhere (Lean: `trace_adj`, `trace_turn`, `Centered.lean` l.73–76, with `F.phase.transport.conserved/spin/spots`).

**G11 (asymptotic).** `eq:trace-trial-stress`, `eq:trace-flux-test` and `B_i r_i^4→0` tied to the scribe chapter's `eq:ex-lattice-scribe-field-limit`, `-flux-limit`, `-common-test`, `-band-cost`; `lem:trace-moving-correlation` now states the three things its proof uses and notes why `eq:trace-radial` applies at the rounded points.

**G12 (probe-assembly, closing paragraph).** Producers named: `prop:ex-trace-bill-root-price` (paid errors and column bounds, conditional on its receipts) and `prop:ex-trace-crown-buffer` (buffered estimate, conditional on a Crown witness for the averaged combination `(𝒮_0 J)_d`; Lean `tide` has that witness as a hypothesis, produced via `YM.Trace.Weir.crestship`, `Terrace/Ell.lean` l.60).

## 3. What was rechecked by hand (no change needed)

- **Constant.** `∂_a∂_i D`, `C_{abij}=(H_{ai}H_{bj}-H_{aj}H_{bi})/(π²r⁴)` with `H=I-2uuᵀ`, `Σ_{ij}(…)²=2-2δ_{ab}`, sum 24, `⟨O(x)O(0)⟩=(2N/16)·24/(π⁴|x|⁸)=3N/(π⁴|x|⁸)`; matches `YM.Trace.curl_squares` and `wick_norm` (`Foundation/Constant.lean` l.27, 38). Coefficient `(4d_2)²/(2b_0)²=1` with `d_2=-b_0/2`; matches `award` (`Verse/Day.lean` l.41) and `YangMills.award_eq` (`Lean/TraceBridge.lean` l.24).
- **Passage to all radii.** Monotone squeeze at `x(t)=(0,(t/2,…,t/2))`, `1/2<t<2`, and the bad-sequence argument; matches `tagline`, `border`, `outside` (`Verse/Day.lean` l.50, `Verse/Cape.lean` l.53, 77).
- **Profiles.** Algebra of approximations; primitive lemma including the excluded order −1 and the monotonicity argument; integrability of `M_{j,k}` for `s>0` (`r^{j+2}ω^{k-1}e^{-sω}≤r^{j+1}e^{-sr}` for `k=0`, recurrence in steps of two); `M'=-M_{j,k+1}`; Euler identity; `d/ds(s^{j+3}M_{j,1})=-m²s^{j+3}M_{j,0}`; bootstrap with the special case `b=-2`; angular factor `½∫_{S²}P`; dyadic argument: after weighting each monomial is `c·(2^{-(8+a)})^n n^{k+2}` with `k+2≥2`, so a nonzero leading term cannot have a finite limit and a zero-limit family forces `A=0`. Matches `Wick/Gain.lean`, `Wick/Massive.lean` (`moment_step`, `moment_d`, `euler`, `differentiated`, `basic_expands`, `moment_expands`), `Wick/PolynomialField.lean` (`Mode`, `field_value`, `Track.euclidean`, `moments_expand`), `Wick/Log.lean` (`no_powerlog`), `Wick/Refute.lean` (`real_profile`, `euclidean_excludes`). The public class (`Hierarchy.Mode`, `Track`, `wickProfile`, `ChallengeSpec.lean` l.151–166) is carried to the internal one field by field in `TraceBridge.lean` (`nativeMode`, `profile_eq`).
- **Spectrum.** Damping identity, width independence, undamping, Laplace formula, growth bound and the constant `A2^{k+1}`, full boundary identity, field-measure identification, weights uniqueness, cone and Lorentz statements; matches `Damping.lean`, `PolynomialGrowth.lean`, `Relative.lean`, `Momentum.lean` and `TraceSpectrum`/`traceSpectrum_exists` (`WilsonTrace.lean` l.83–119).
- **Weighted receiver lemma** and medium lemma (all steps), age-weight rates, exponent `1/5-1/4=-1/20`.
- **Pairing proposition** and **charge proposition**: exponent arithmetic and the count of four error terms.

## 4. Gaps not repaired, and why

**N1. No producer for `input:trace-scales` as a whole.** The audit (final_D A5) proposes adding a producer proposition from `Gallery.lead` and `Verse.seat`. I did not: the pointwise rounded comparison rests on `Gondola.season … plate.boot` and `Duo.receipt`, which I have not read and for which the manuscript has no statement; writing a proposition would only restate the input. Recorded as open edge `unlocated-to-C15-rounded-pointwise-comparison`.

**N2. Shell-comparison inputs (G2) and clock inputs (G1) have no manuscript producer label.** Stated as named inputs; open edges.

**N3. Two-column free basis.** `B_∞` is an isomorphism by `YM.Trace.Over.quill` (`Chart/Limits.lean` l.68). The manuscript's `prop:ex-trace-free-closure-rank` gives the dimension two and the kernel line; the independence of `v_0,v_1` modulo the kernel is not stated anywhere I found. Stated as an input in the scribe chapter; for C14.

**N4. `identified` and the other internal clauses** (P4).

**N5. Chart inputs of the mission transfer** (`eq:ex-trace-mission-table-limit`, terminal raw-label convergence; Lean `proxi`, `Gondola.terminal`) have no producer label; the proposition remains conditional as written.

**N6. Reflection-positivity inputs of the pairing proposition** (`eq:ex-lattice-root-product`, `eq:ex-lattice-root-sum`; Lean `YM.Cells.Seam`) are stated as hypotheses; I did not locate a manuscript producer label.

**N7. Pre-existing overfull box** (5.3pt) in the heading of `lem:ex-lattice-trace-weighted-price`; not touched.

## 5. Audit items and decisions

| Item (report) | Decision | Evidence opened | Action |
| --- | --- | --- | --- |
| P-A1 (C) `a≥1` | confirmed | `Glade.tide`, `Schedule.a_zero/strictAnti` | E1 |
| P-B1 (C) selected-data instantiation | confirmed, refined | `tide` hypotheses, `Bill`, `Crown`, `stageCrown`; part-A props read | G12; Crown witness left open |
| P evidence namespaces (C) | confirmed (`namespace YM.Trace.Terrace.Glade` in `Turf.lean`, `Grid.lean`) | file headers | not editable by me; listed in correspondence.md |
| M-B1 (C) insertion/localization | confirmed | `ear_price`, `outside`, `concert`, `Probe` | G7 |
| M evidence `crestship` namespace (C) | confirmed (`YM.Trace.Weir`, `Terrace/Ell.lean` l.5, 60) | file | correspondence.md |
| S-A1 (C) / A1 (D) `O` as unit | confirmed | `OScale`, `square4`, `ScalarP`, `Scalar_inj`, `Scribe.goal` | E2 |
| S-A2 (C) codomains | confirmed | `currentDiv`, `Optics`, `Optics_pay`, `Hero`, `crown` | E3 |
| S-B1 (C) #33 instantiation | confirmed | `Prosper`, `PaymentR`, `formulate`, `mere`, `transferX`, `pairingD`, #33 text | G4 |
| S-B2 (C) #34 instantiation | confirmed | `baron`, `press`, `chartB`, `nearing_h`, `muteP`, `sum_delta`, `yields`, `blossoms`, #34 text | G4 |
| S-B3 (C) shell inputs | confirmed, refined (inputs named; the audit's step list adopted after reading `year_spec`) | `year_spec`, `awake_o`, `Marvel`, `pay_jet`/`drape` statements | G2, E6 |
| S-B4 (C) hierarchy of comparison table | confirmed | `payload`, `Scalar_onto`, `Scribe.gallery/goal`, `july`, `center_plus` | G3 |
| S-B5 (C) zoom scale, clock, quantifier order | confirmed | `LogZoom`, `zoom_BQ`, `band_cost`, `Gallery.lead`, `pays_sky` statement | G1, G5 |
| S cross-ref: two-column basis (C) | confirmed, not repairable here | `quill`, `steppes`, `Waft` | N3 |
| L-B1 (C) definition of `Q` | confirmed | `mileage` | G8 |
| C-A1 (C) `m/12=-κ` | confirmed | `brass`, `landPay`, `accurate`, `shock` | E4 |
| C-B1 (C) arch and transport | confirmed | `penumbra`, `rift`, `cost_range` | G9 |
| C-B2 (C) evidence anchors | partly checked: `brass` is `YM.Trace.Margin.brass`; `mack`, `Craft.earning`, `Merch.weld/bloom`, `Combat.*` are used in its proof; I did not open their defining files | `Margin/Beans.lean` | noted for the evidence owner; no text change |
| S1 (D) common-data binding | confirmed, refined (labels verified in C04 chapters) | `mass_read`, `traceSpectrum_exists`; C04 statements | G10 |
| S2 (D) operator identification | refined, not adopted | `HeadlineSpec.TraceExclusions.identified`, `ChallengeSpec.TraceTest`, `TraceBridge.publicTrace` | P4; no proof added |
| Profiles (D): no change | confirmed after own recheck | Wick files | none |
| A2 (D) C14 gallery handoff wording | confirmed (C14 text says "multiple of the unit" and unweighted coefficient limits) | `trace-firesky-gallery.tex` l.222–231, `Scribe.gallery/goal` | section 6, for C14 |
| A3 (D) reference-field identification | confirmed | `wick_norm`, C14 free-rank normalization | `eq:trace-reference-normalization` as named hypothesis |
| A4 (D) trial stress/shell producers | confirmed | as S-B3 | G11 |
| A5 (D) supplier of `input:trace-scales` | confirmed; producer proposition not written | `Gallery.lead`, `seat`, `tagline` | N1; status paragraph added |
| W1 (D) detector hypothesis | confirmed | `small_means`, `legacy`, part-A lemma | G6(d) |
| W2 (D) level/response identities | confirmed | `medium`, `aspiring`, `Stern` | G6(a),(c) |
| W3 (D) source-only suppliers | confirmed | `penumbra`, `tiara`, `diadem`, `Lease_alive` | G6(e) |
| D's remark that `sup_i‖μ_i‖<∞` is justified | confirmed (`μ_i=ρu_i`, `u_i→U`) | lemma proof | none |

## 6. For other packages

**For part-A.** (1) I now cite `prop:ex-trace-bill-root-price`, `prop:ex-trace-crown-buffer`, `lem:ex-trace-small-means`, `eq:ex-trace-medium-core`, `eq:ex-trace-small-means-detector`, `eq:ex-trace-small-means-rate`; please keep these labels (all present in the working tree when I finished). (2) `trace-small-means.tex` writes `v_i` for the medium, `z_i` for `β̂_{k_i}` and `ζ_i` for the arch scale; my chapters write `m_i`, `p_i` (weighted) or `z_i` (scribe), and `b_i` (weighted) or `q_i` (scribe). The dictionary is stated where I cite the lemma. (3) My sentence in probe-assembly says `prop:ex-trace-bill-root-price` holds "for all sufficiently large j" and "assumes the paid label bounds and the paid root receipt"; this matches the statement as revised by part-A at the time I finished. I found no error in the part-A statements I read (the three results above), but I did not audit those chapters.

**For C14.** (1) `trace-firesky-gallery.tex` l.222–231 describes the gallery receipts as coefficients "converging respectively to the prescribed stress coefficient and to zero" and the zoomed observable converging "to the prescribed multiple of the unit". The source (`Scribe.gallery`, `Scribe.goal`) has the weighted limits `B_i d_i→d_2`, `B_i e_i→0` and the limit `4d_2·O` with `O` the curvature-square field, not the unit. (2) The independence of the two correction directions modulo the free kernel (N3) and the shell-comparison inputs (G2) need producer statements. (3) `lem:trace-normalized-stress` is unchanged and still supports the citation at `trace-calibration-producer.tex` l.334.

**For C16 / G01.** P1, P2, P4 (P3 is superseded by the second round below).

**For #33/#34 owners.** No change to their files. My chapters use exactly: from #33 the eventual uniform operator bound and, for every ε, the eventual bound `|𝔞_i(μ_i(s_i y)-ρ(y))|≤ε‖y‖` for all `y`, at the postselected level, for the sensor given by `eq:trace-sensor-selected-formulas`; from #34 the three field limits, the washout for `b∈{0,-}` with `p=1`, and `tr M(w^+)=4O`.

## Second round: checker findings and responses

Input: the independent checker report `c15check/final_B.md` (Codex, all 38 hunks). It reports no error or regression, three GAPs, one INACCURACY, and verdict tables. Each item was rechecked against the current text and the Lean source. Changed in this round: `trace-scribe-producer.tex`, `trace-asymptotic.tex`, `trace-weighted-estimates.tex`. No label was renamed or removed; `thm:trace-asymptotic` and `thm:profile-exclusion` keep label and conclusion. No first-round edit was reverted.

| Checker finding | Decision | Reason and change |
| --- | --- | --- |
| GAP 1: the two shell limits asserted without the convergence argument (scribe, proportionality subsection) | adopted | Confirmed: the first limit involves the moving label `r_i U_{i,5}^{-1}D_a^S(U_{i,4}v)` and the second a moving tensor. Read `bend_limit`, `head_tilt` (`Lean/YM/Next/UV_STRESS/Focus.lean`), `pay_jet`, `reaches_mutable`, `drape` (`Chart/Earl.lean`). Input 4 is now split into (4a) tested convergence for fixed labels including differentiated tests, (4b) finitely many separating integrated grade-five tests, (4c) derivative laws in both tables, (4d) pointwise jet comparison for the observer functional and for the rescaled shell functional on fixed reference tensors. From these the chapter now proves: `T_i=r_iU_{i,5}^{-1}D_a^SU_{i,4}→D_a` in operator norm (separating tests, integration by parts, lower bound `‖Λ_i w‖≥(c/2)‖w‖`), `F_i(R)=A_i(T_iv)→o.test_5(D_av)=y`, and `F_i(g_i)=L_i(Y_i(g_i))→L_0(M_0)=y` with `L_i(H)=F_i(r_i^{-4}U_{i,4}H)`. I followed the checker's outline but did not reproduce its factor count `r·r^4·r^{-1}·r^{-4}`: I did not open `integrate_sheet_scale`/`tendsto_sheet`, so the convergence of `L_i` on fixed tensors is stated as input (4d) rather than derived. (4a)–(4d) remain open inputs (edge `C14-to-C15-shell-comparison`). |
| GAP 2: two-column independence deferred although the source proof is short | adopted | Confirmed in `quill`, `steppes` (`Chart/Limits.lean` l.63–82), `azure` (`Margin/Mallet.lean` l.14), `tribe` (`Slate/April.lean` l.26). The chapter now proves injectivity (coordinates `v_0=(0,0,1)`, `v_1=(0,1/4,0)`, kernel `(1,-1/4,1)`) and surjectivity (`w-w_0ε=(w_2-w_0)v_0+(4w_1+w_0)v_1`) as in `quill`. My first-round decision N3 "not repairable here" was wrong. Remaining inputs, stated: `𝖵` is onto `V` with kernel the equation-of-motion line, and the coordinates parametrize `𝓑` bijectively. |
| GAP 3: external references unresolved in the inclusion graph | adopted in the form required by the coordinator (not the checker's proposal to edit `existence.tex`, which I may not touch) | All `\ref`/`\eqref` to labels of the two external files replaced by text with the label in `\texttt{}`; list below. Verified that every remaining reference target lies in a file included by `existence.tex`. |
| INACCURACY 4: observer notation (`x` "base point", `q` "test window", undefined `J` in `(J.U_i)^{-1}`) | adopted | Confirmed from `StressLaws.translation` (`x∈conf(n+1)`, `q: Fin n→S.Tag`, `Window x χ`) and `pay_jet` (`o.x`, `o.q`); I did not open `Work/A05/Read.lean` itself. `x` is now the observer's separated configuration, `q` its spectator labels, `χ` its cut; `(J.U_i)^{-1}` replaced by `U_i^{-1}` (three places); `shellGrad` now carries the argument `q` consistently. |
| E5 remark: `dim V=dim V_0` is an unused extra assumption | adopted | Deleted from the list in `trace-asymptotic.tex` (it is not one of C14's four properties and is not used in `eq:trace-conserved-rank`). |
| Verdict "G2 wrong as a completeness claim" | accepted | See GAP 1. |
| Verdict "N3 wrong" | accepted | See GAP 2. |
| C03 covariance producer exists (`reflection-transport.tex`, `ex-individual-rotations`) | recorded, not verified | Ledger row updated; I confirmed only that the label exists. |
| A5/N1: source of the rounded comparison settled (`Vane.checked`, `TimberSky.plate`, `SeqPair.boot`, `Gondola.terminal`, `Duo.receipt`) | recorded, not verified by me | Manuscript status unchanged: open input. |
| C-B2 anchors confirmed by the checker; damping file path is `Lean/YM/Heat/Duration.lean` | path corrected in correspondence.md | I confirmed that this file exists. |
| All "CONFIRMED correct" rows (E1–E6, G1, G3–G12, P1, P2, P4) | no action | — |
| Non-freeness scope: the checker found no sentence asserting a mass gap, a general exclusion of generalized free fields, or a larger class | no action | I found none either, in old or new text of the four chapters. |

**Points previously marked unsure.**
- `V` two-dimensional: the claim is no longer used. The bijectivity argument now uses only that `𝖵` is onto with one-dimensional kernel, as in `quill`.
- `lem:ex-trace-free-stress-basis` for the scalar range: confirmed. Its coefficient map `(w_0,…,w_3)` (`trace-free-rank.tex` l.226–262) is the `material` map of `free_stress_bij`, onto `TableTwo` = real, symmetric, signed-covariant tensors (`Push/STRESS_FLUX/Counts.lean` l.28–30), which is what `Scalar_onto` uses; the trace of the coefficient tensor is `4w_0·1+4(w_1+4w_2)O`.
- Ward identity prose: `StressLaws` opened (`Lean/YM/Euclid/Stress.lean` l.90–97). Input 1 now states the translation law in its exact form: for a separated configuration, spectator labels, a window cutoff, an axis `b` and a field `B`, the shell measurement equals the correlation with `D_bB` at the distinguished point. The rotation law is not used here.

**References to external units replaced by text** (for the final integrator; restore as `\ref`/`\eqref` once the two files are `\input`):

| File | Line(s) | Label |
| --- | --- | --- |
| `trace-scribe-producer.tex` | 28–29 | `sec:ex-trace-branch-moments` |
| `trace-scribe-producer.tex` | 153–154 | `prop:trace-prosper-sensor` |
| `trace-scribe-producer.tex` | 157 | `eq:trace-sensor-selected-formulas` |
| `trace-scribe-producer.tex` | 291–292 | `sec:ex-trace-branch-moments` |
| `trace-scribe-producer.tex` | 301 | `prop:ex-branch-moments` |
| `trace-scribe-producer.tex` | 304 | `prop:ex-branch-washout` |
| `trace-scribe-producer.tex` | 307 | `eq:ex-branch-three-traces` |
| `trace-asymptotic.tex` | 70–71 | `sec:ex-trace-branch-moments` |
| `trace-asymptotic.tex` | 246–247 | `prop:trace-prosper-sensor` |
| `trace-asymptotic.tex` | 250–251 | `prop:ex-branch-moments`, `prop:ex-branch-washout` |
| `trace-weighted-estimates.tex` | 129–130 | `sec:trace-prosper-sensor` |
| `trace-weighted-estimates.tex` | 165–166 | `prop:trace-prosper-sensor` |

This supersedes P3 of the first round.

**Remaining uncertainties.** (1) Inputs (4a)–(4d) paraphrase `reads_limit`, `detects`, `scaled_identity`/`kernels`, `reads_converge`, `tendsto_sheet` from the way their callers use them; those five declarations were not opened. (2) In the first-limit argument, the statement that the factor `r_i` in `T_i` is exactly the one produced by rescaling the derivative rests on `head_tilt` and `X.carries_f`, read only as used in `bend_limit`. (3) The C03 covariance producer and the source of the rounded comparison are taken from the checker, not verified. (4) The bijectivity of the `w`-coordinates on `𝓑` and the surjectivity of `𝖵` are stated as inputs from the reference computation.
