# C15: response to the source-leakage audit rows (#194)

- Issue #194 (follow-up to audit #159, report PR #164); package issue #56; parent #26; unit YM-000026.
- Session `ADB991-claude-20261113-e4dd` (Claude, running as a scheduled agent on behalf of @ADB991). Claim: https://github.com/hairer/humanise-yang-mills/issues/194#issuecomment-6860707594.
- Base `codex/existence-monograph` at `69b2631`. Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text only.
- Role: **author response**. Edits to sentences with mathematical content, and every J resolution, need independent review by a different account. No approval is recorded.

All 67 rows were located by their text. Every one was still at its audit line number: the 18 chapters were unchanged since `97128ab`, and their base hashes equal the "at handoff" hashes in `README.md`.

Outcome by class: 42 B, all edited; 20 J (one reclassified B, one resolved by proof, one resolved by a manuscript reference plus a proof plus an input, the rest stated as named outstanding inputs); 5 ? (4 → B, 1 → N, no edit).

## Response table

| n | File | Class | Response |
| --- | --- | --- | --- |
| 293 | `trace-small-means.tex` | B | B. Parenthetical removed; the definition of 𝒱 (real, signed-equivariant arrays) is unchanged. Moved: 𝒱 is the source's one-point response table (`TableOne H.spin`). |
| 294 | `trace-small-means.tex` | J → B | Reclassified B: the sentence introduces two scales, it does not defer a step. "The source uses two distinct positive scales" → "Two distinct positive scales are used". The Lean expression `Z.β(k_i)` in the same display is replaced by ζ(k_i), "the arch scale at level k", the notation already used in `trace-scribe-producer.tex` (ζ(j), l.613). |
| 295 | `trace-small-means.tex` | J | Named input (existing premise **P5** of `lem:ex-trace-small-means`). The text now says the three identities are hypotheses of the lemma and are not proved in the section; it no longer says that the source supplies them. The lemma statement already lists them as hypotheses, so nothing changes mathematically. |
| 296 | `trace-small-means.tex` | B | "the source's core-to-strip map" → "the core-to-strip map at scale index k". **Caveat kept:** 𝓔_k is still not defined in the manuscript (it is the map linking medium and core in `Slate.canal`). This is effectively a T-open item; it needs a definition from whoever owns the medium construction. |
| 297 | `trace-small-means.tex` | B | "exact source identities on the stated tail" → "exact identities on the stated tail, assumed as hypotheses". This is the same content as P5. In Lean they are derived from the standing hypotheses (ledger row of `lem:ex-trace-small-means`). |
| 298 | `trace-small-means.tex` | J | Named input (existing premise **P1**, price bound `eq:ex-trace-small-means-price`). Now stated as an outstanding input not proved in the monograph. `prop:ex-trace-mission-price-transfer` reduces it to the mission and the mileage estimate, which are inputs of that proposition. Moved: in Lean the bound is `ear_price` from `Mission` (`Terrace/PriceLimit.lean`) with `mileage` (`Terrace/Meteor.lean`). |
| 299 | `trace-small-means.tex` | J | Named input (existing premise **P2**, edge `C14-to-C15-vector-detector`). Now stated as an outstanding input. The expected derivation (injectivity of the axial divergence probes, `eq:ex-trace-divergence-probes` in C14, with derivative/orientation identities and simplicity of 𝔤) stays as a pointer, with the explicit statement that it is not carried out here. Moved: Lean derives it in `ears_det`/`spots` (`Terrace/Ears.lean`). |
| 300 | `trace-small-means.tex` | J | Named input (existing premise **P3**, edge `C14-to-C15-chart-pairing-convergence`). Now stated as an outstanding input. Moved: in Lean it follows from convergence of the selected chart path (`nearing`, `Terrace/SkyEar.lean`) and the derivative identities of both tables. |
| 301 | `trace-small-means.tex` | J | Partly proved, partly a named input (existing premise **P4**). The ticket product argument is in the text and stays. The two zero-rate tickets (z_i ≤ 2β̂_j eventually; tiltcap) are now explicitly outstanding inputs on the selected schedule. The third ticket is immediate from the definition of Θ_i. Moved: `stickK`, `titles`, `ticket_exp`, `tilt_cap` (`Terrace/Fund.lean`). |
| 302 | `trace-small-means.tex` | B | "fixed source constant δ=10⁻⁴" → "fixed constant δ=10⁻⁴ of the definition of Θ_i" (Θ_i carries 100/10⁴ = 100δ). |
| 303 | `trace-small-means.tex` | B | Sentence "These scalar receipts are listed with their exact source declarations in the evidence file" deleted; the declarations are listed under row 301 here and in `part-A/ledger.md`. |
| 304 | `trace-small-means.tex` | B | "The source applies this lemma to its selected medium" → "The lemma is applied to the selected medium v_i". Moved: the consumer is `YM.Trace.Terrace.small_means`, used by the external sensor unit (YM-000033, `trace-prosper-sensor.tex` l.552, with p=1). |
| 306 | `trace-crown-buffer.tex` | B | "with the normalized-root convention of the source" → "the root is normalized by the number |I| of cells". The displayed formula already has the 1/|I| power, so this only names what is there. |
| 307 | `trace-crown-buffer.tex` | J | Named input **I-C15-crown-witness** (ledger: "Crown witness (`Glade.canopy`)", no producer located). "The source's witness construction is a separate input" → "The construction of the Crown witness is an outstanding input of this proposition; it is not proved in this monograph." |
| 308 | `trace-price-recurrence.tex` | B | The pointer to the evidence file is replaced by "The remaining scale inputs are stated as hypotheses of `prop:ex-lattice-trace-sharp-read`" (they are: `eq:ex-lattice-price-budget` etc., l.359ff). The declarations are in `part-A/ledger.md` row `prop:ex-lattice-trace-sharp-read`. |
| 311 | `trace-local-paid-budgets.tex` | B | "recorded in the source audit" → "are not proved here"; they remain the inputs to the one-step recurrence. Correspondence: part-A ledger, "Inputs with no manuscript producer" (`mire`, `desert`, `Blush.fruition`, `Shunt.voyage`). |
| 312 | `trace-local-paid-budgets.tex` | B | **Caveat kept in the text** (it is mathematical): the local estimates also need ε ≤ 1/4 for the transition (j,i). "In the source these local estimates require" → "These local estimates require"; "recorded for" → "attached to". Moved: the guard is the record field `D.ε` (cf. `trace-eve-producer.tex`, standing conditions). |
| 313 | `trace-local-paid-budgets.tex` | B | "their mathematical inputs and exact source route are itemized in the accompanying evidence file" → "which remain outstanding inputs". The itemization is in `part-A/ledger.md`. |
| 314 | `trace-local-rate-selection.tex` | B | Clause "the evidence record supplies the source crosswalk" deleted. |
| 315 | `trace-local-rate-selection.tex` | B | "This is the source's strict-power rate convention" → "the rate is thus defined by strict powers". The definition itself is unchanged. |
| 316 | `trace-local-rate-selection.tex` | B | "retain the source's factor four" → "contain a factor four". Both factors (four edge components, two input arrays) are still explained. Moved: the factors match `δℓ`, `corn₀` (part-A ledger, row `prop:ex-lattice-strip-to-probe`). |
| 317 | `trace-local-rate-selection.tex` | B | Rewritten as "fixed real constants, the scalar entries of the chart data C and of the local record D". The ranges stay the only meaning of "admissible". Moved: in Lean C and D are the selected chart and the `Medal`/`Eve` record (part-A ledger). |
| 318 | `trace-local-rate-selection.tex` | B | "the dotted notation is kept for comparison with the source" → "the dotted notation records which datum each constant belongs to". **Caveat kept:** C.C, D.Q, etc. are still Lean-style names. They are now defined as named real constants with stated ranges, so they are not T-open, but an editor may want to rename them. |
| 319 | `trace-local-rate-selection.tex` | B | "the exact source coefficients" → "the coefficients". The coefficients are displayed and unchanged. |
| 320 | `trace-local-rate-selection.tex` | B | "The source clock is" → "The clock is". The clock is defined in the text (linear, c_clock ≥ 0). |
| 322 | `trace-local-rate-selection.tex` | B | "the source crosswalk identifies the already-proved support-cover, rust, and Gaussian-moment estimates whose algebra is expanded above" → "the algebra of the support-cover, rust, and Gaussian-moment estimates is expanded above". Moved: in Lean these are already-proved lemmas behind `chief`/`Bunk` (part-A ledger). |
| 323 | `trace-medal-prices.tex` | B | "In the source," → "Explicitly,". The formulas for A and P_{1/2} are the definitions used. |
| 324 | `trace-eve-producer.tex` | J | New named input **I-C15-frame-normalization**: Z = testPrice(𝓕) ≥ 1, T = readPrice(𝓕) ≥ 1 and c > 0 for the selected frame. The theorem already assumes Z,T ≥ 1 and c > 0, so the theorem is unaffected; only the claim that the selected frame satisfies them is now an outstanding input. |
| 325 | `trace-eve-producer.tex` | B | "The source's finite probe family is essential" → "Finiteness of the probe family F is essential". F is finite by hypothesis. |
| 326 | `trace-eve-producer.tex` | B | "compared in the source are" → "compared are". |
| 328 | `trace-eve-producer.tex` | J | New named input **I-C15-eve-insertion-rate**: if the branch patch exists, there is f ∈ 𝓡_{−1/2} with the uniform derivative bound at price 2\|f\|. The text says that the preceding comparison and the envelope B_* ∈ 𝓡_{−1/2} are where it is expected to come from. It also says plainly that the identification of f with the envelope, and the factor 2, are not carried out. I did not try to prove that f = B_* (up to τ) works: the constants differ (τB_* vs 2\|f\|), and proving it would mean inventing an argument. |
| 329 | `trace-eve-producer.tex` | B | "For the record, the source constructs the package … under" → "The package … is constructed under". The standing conditions (D.ε ≤ 1/4, kernel parameters ≥ 4, n ≥ 2, μ > 0, leaf/mask/budget/support identities) stay in the text, because they are mathematical hypotheses. |
| 333 | `trace-row-jet-estimates.tex` | ? → B | "under which the source applies Proposition X" → "under which Proposition X is applied". The five hypotheses are unchanged. |
| 334 | `trace-row-jet-estimates.tex` | ? → N | No edit. In this chapter "source" means the regular source term (the chapter is "Fourier-tail … used in the regular-source chart"), so "source-placement" is the placement hypothesis (item 2) for the source support. |
| 342 | `trace-regular-atom.tex` | B | "In the source both charges are" → "In the application below both charges are". The second "source" ("two-channel source") is the mathematical source term and stays. The caveat (the cloud bound is a separate input, not a consequence of the principal reserved-mass estimate) stays in the text. |
| 349 | `trace-regular-atom.tex` | B | "Here is the source realization of the local hypotheses" → "We now describe how the local hypotheses are realized in the selected construction". "The source term" in the next sentence is mathematical (N). |
| 357 | `trace-coffer-supplier.tex` | ? → B | "We keep the source parameters distinct" → "We keep the following parameters distinct". |
| 358 | `trace-coffer-supplier.tex` | J | Existing named input **`C15-internal-planted-expansion`** (part-A ledger, premise W4). The sentence deriving it "in the source" from the response hierarchy etc. is replaced by "This completes the statement of the planted-expansion input. It is an outstanding input and is not proved in this monograph." The source derivation is moved below. |
| 359 | `trace-coffer-supplier.tex` | B | "In the source, the resulting statement has" → "The resulting statement has". The order of quantifiers is mathematical and stays. |
| 360 | `trace-bill-prices.tex` | B | "The source's native root allowance … has the exact form" → "The native root allowance … is". It is the definition used. |
| 361 | `trace-bill-prices.tex` | J | Existing named input **X1** (part-A ledger: four rate-zero tickets and the gain estimate). "proved in the source from its selection rules and simplicity of the gauge group, and are not derived here" → "are outstanding inputs, not proved in this monograph". |
| 362 | `trace-bill-prices.tex` | J | New named input **I-C15-bill-label-receipt**: the paid label with its root receipt, as assumed by `prop:ex-trace-bill-root-price` (it refines premise X2, which records only the norm and bias bounds). The paragraph now says this is an outstanding input and lists, as mathematics, what it is expected to come from (funded atomic activity with bounded charge, paid profile, density identity; finite-volume conversion with the price-duality estimate). |
| 363 | `trace-bill-prices.tex` | J | Same paragraph as 362. "The source construction of those atomic and dual-price inputs remains part of the full trace supplier" → "The construction of those atomic and dual-price inputs is not carried out here." |
| 364 | `trace-probe-assembly.tex` | J | "The source's remaining inputs to this local argument are" → "The remaining inputs to this local argument, not proved in this section, are". The rest of the paragraph already names producers for each one (`prop:ex-trace-bill-root-price`, `prop:ex-trace-crown-buffer`) with their own open inputs (I-C15-bill-label-receipt, I-C15-crown-witness). Covariance identities: edge `unlocated-to-C15-reflection-seam`. |
| 365 | `trace-probe-assembly.tex` | J | New named input **I-C15-probe-scales**: `eq:ex-trace-probe-scales` for all large j. "holding … in the source" → "assumed for all sufficiently large j and not proved in this monograph". Moved: the source holds them for large j (part-B ledger row `prop:ex-trace-probe-assembly`, `Glade.tide`). |
| 366 | `trace-mission-price.tex` | B | "In the source route, the finite-cover construction produces … while convergence … produces" → "The probe is to be produced by a finite-cover construction, and its limiting value by convergence of the selected core field; both are inputs here." The caveat (producing the cover, witness and localization receipts is still open) stays. Edge `unlocated-to-C15-mission-chart-limits`. |
| 372 | `trace-scribe-producer.tex` | J | Reclassified as a definition plus inputs: the correction is built from three paid tensor families (L_i, Ω_i, Δ_i), which, with c_i⁰, c_i¹, are data of the selected construction. The properties used are stated as inputs (they already are: field receipts `eq:ex-lattice-scribe-field-receipts`, from external unit YM-000034). Moved: in Lean `L_i, Ω_i, Δ_i` are `blade`-type tensors of `Spun.starts` (part-B ledger row "Scribe chapter"). |
| 373 | `trace-scribe-producer.tex` | B | "In the source, q_i is the effective coupling …" → "Here q_i is the effective coupling … and the crown normalization is …". **For the reviewer:** the part-B ledger records q_i = Z.β(k_i) (the arch scale), and l.613 says q_i = ζ(k_i), the arch scale. The text calls this "effective coupling". I left the wording as it was; whether the arch scale *is* the effective coupling at the selected level should be checked by the C15 owner. |
| 379 | `trace-scribe-producer.tex` | B | "by the finite tensor identity used in the source" → "by the trace formula of the branch-moment unit recalled above" (`eq:ex-branch-three-traces` of YM-000034, already cited in the preceding paragraph, tr M_1 = 4𝒪). |
| 380 | `trace-scribe-producer.tex` | J | Split. (a) z_i tr𝒫_i(L_i) → 0 and z_i tr𝒫_i(Ω_i) → 0: the exponent-one washout limits of YM-000034 (`prop:ex-branch-washout`, p = 1) recalled above, so this is a manuscript reference. (b) \|c_i⁰\| ≤ Cρ_i: contained in the bound \|c_i⁰\|+\|c_i¹\| ≤ Cρ_i used earlier in the chapter. (c) tr𝒫_i(Δ_i) → 4𝒪: **proved** from the field receipt 𝒫_i(Δ_i) → M_1, tr M_1 = 4𝒪 and continuity of the trace. (d) New named input **I-C15-scribe-scale-bounds**: q_i ≤ 2z_i, ρ_i ≤ t_i ≤ z_i, and c_i¹ → −κ/4 (the latter is `eq:ex-lattice-scribe-sensor-limits` from YM-000033 via the sensor dictionary, if the owner confirms; I list it as outstanding). |
| 381 | `trace-scribe-producer.tex` | B | Inside input (4d), already an open premise. "In the source both follow from the comparison-of-jets estimate" → "Both are to be obtained from the comparison-of-jets estimate …; this deduction is not carried out here." Moved: Lean `reads_limit` (part-B ledger, E-C14-shell). |
| 385 | `trace-asymptotic.tex` | B | **Caveat moved:** in the source the ultrafilter, the arch scale (from which B_i is read) and the reference hierarchy are chosen once, before the null sequence (s_n) is given. So the source has a stronger, sequence-uniform form of `input:trace-scales`. The text now says only that the input as stated allows the comparison data to depend on (s_n), and that this is all that is used. |
| 390 | `trace-weighted-estimates.tex` | B | "in the source application below" → "in the application below". |
| 393 | `trace-weighted-estimates.tex` | B | "the source does not assert the field-decay estimate at every unreindexed level" → "the field-decay estimate is assumed, and used, only at the reindexed levels, not at every level". **Caveat moved:** the Lean statement gives the decay only at the postselected levels n_i of YM-000033, not along the unreindexed sequence. |
| 394 | `trace-weighted-estimates.tex` | B | "The source-specific weight is" → "The weight used is". |
| 397 | `trace-weighted-estimates.tex` | ? → B | Subsection title "The source rate and medium calculation" → "The rate and medium calculation". The label `subsec:ex-lattice-trace-source-rate` is kept for stability. |
| 402 | `trace-weighted-estimates.tex` | J | Named inputs. The arch comparison `eq:ex-lattice-trace-arch-comparison` is the existing open edge **E-clock** (`unlocated-to-C15-clock`); the reference-chart calibration is the existing calibration input (part-B ledger row "Scalar deductions"). Both are now stated as outstanding inputs, not proved in this monograph. The local response estimate keeps its manuscript references (`prop:ex-lattice-charge-bounds`, `subsec:ex-lattice-trace-weighted-route`). Moved: the source derives the arch comparison from positivity of the arch scale and two-sided scale control (see below). |
| 403 | `trace-weighted-estimates.tex` | B | "the stronger source estimate" → "the stronger estimate". |
| 404 | `trace-weighted-estimates.tex` | B | "the two source limits" → "the two limits". |
| 405 | `trace-weighted-estimates.tex` | B | Subsection title "Source route and exact remaining estimates" → "The response limits and the remaining estimates". Label kept. |
| 407 | `trace-weighted-estimates.tex` | J | New named input **I-C15-finite-response-price**: the finite-volume inequalities `eq:ex-lattice-trace-finite-response-price`. Now stated as an outstanding input, with the expected route (local charged-configuration bound on typical configurations + transported-field error ≤ A_{−1/4}; flux contributes 4A_{−1} and the inverse-power costs) and an explicit statement that this deduction is not carried out. The paragraph's existing pointer to `prop:ex-lattice-charge-bounds` (t = p_i) is unchanged. The field-transport error estimate was already called an input. |
| 408 | `trace-local-pairing.tex` | B | "all source-specific quantitative inputs are written as precise hypotheses and audited separately" → "all quantitative inputs specific to the selected construction are written as precise hypotheses". |
| 409 | `trace-local-pairing.tex` | J | **Resolved by proof.** p_i → ∞ is part of the displayed definition, so (log p_i)^48 → ∞ and t_i(1) = exp((log p_i)^48/10⁴) → ∞; in particular t_i(1) ≥ 4 eventually. (The same "growth receipt" is used in `trace-mission-price.tex` l.148 with τ_i; not edited there, since it is not an audit row.) |
| 410 | `trace-local-pairing.tex` | B | "The exact source hypotheses have the following mathematical form" → "The hypotheses of the proposition then take the following form". The four receipts are unchanged. |
| 411 | `trace-local-pairing.tex` | B | "In the selected source, their producers are …" → "They are to be supplied by …; these remain outstanding inputs". The list of producers (coefficient-to-root estimate, local approximation and window bound, probe witness, reflection-positivity seam) stays as mathematics. The seam is edge `unlocated-to-C15-reflection-seam`. |
| 412 | `trace-local-pairing.tex` | B | Sentence "The evidence table records these exact source statements and the remaining producer boundaries" deleted. Lean: `pulpit`, `slides` (`Terrace/HomePort.lean`), `mileage`. |
| 413 | `trace-local-charge.tex` | ? → B | "Let s be the source coefficient size" → "Let s be a size function on coefficient arrays …; this domination is the only property of s used below" (checked: s appears only in the bounds l.34–44 and through ‖A‖_∞ ≤ s(A) at l.66, 77). |

## Named outstanding inputs

Existing names are reused where the C15 ledgers already had one. New names are marked **new**; they are also entered in the part ledgers (section "Source-leakage inputs (#194)").

| Input | Status | Statement | Used in | Rows |
| --- | --- | --- | --- | --- |
| P1 (part-A ledger) | existing | price bound `eq:ex-trace-small-means-price` | `lem:ex-trace-small-means` | 298 |
| P2 = `C14-to-C15-vector-detector` | existing | separation at the axial configuration | detector (1), trace-small-means | 299 |
| P3 = `C14-to-C15-chart-pairing-convergence` | existing | convergence of fixed tested pairings | detector (2), trace-small-means | 300 |
| P4 (part-A ledger) | existing | zero-rate tickets for β̂ at the summit index (z_i ≤ 2β̂_{j_i} eventually) and for tiltcap | `eq:ex-trace-small-means-rate` | 301 |
| P5 (part-A ledger) | existing | the three identities `eq:ex-trace-medium-core`–`eq:ex-trace-night-scaling` on a tail | `lem:ex-trace-small-means` | 295, 297 |
| I-C15-crown-witness | **new name** for the ledger's "Crown witness (`Glade.canopy`)" | a Crown witness for the field to which `prop:ex-trace-crown-buffer` is applied | crown buffer; probe assembly | 307, 364 |
| I-C15-frame-normalization | **new** | testPrice(𝓕) ≥ 1, readPrice(𝓕) ≥ 1, orbitCost·errorPrice·corn(d)·a > 0 for the selected frame | `thm:ex-lattice-eve-producer` application | 324 |
| I-C15-eve-insertion-rate | **new** | if the branch patch exists: some f ∈ 𝓡_{−1/2} with the uniform derivative inequality at price 2\|f\| | response choice u = 2\|f\| | 328 |
| `C15-internal-planted-expansion` | existing (W4) | planted-expansion input, coffer supplier | coffer transfer | 358 |
| X1 (part-A ledger) | existing | four rate-zero tickets s_i, v_i, t_i⁴, f_i⁻¹ and the gain estimate τ_i(500) ≤ γ_i | `trace-bill-prices` | 361 |
| I-C15-bill-label-receipt | **new**, refines X2 | paid label (norm ≤ 1, bias bound) together with its paid root receipt ≤ n_{d,i}, as assumed by `prop:ex-trace-bill-root-price` | bill prices; probe assembly | 362, 363, 364 |
| I-C15-probe-scales | **new** | `eq:ex-trace-probe-scales` for all sufficiently large j | `prop:ex-trace-probe-assembly` | 365 |
| I-C15-scribe-scale-bounds | **new** | q_i ≤ 2z_i; ρ_i ≤ t_i ≤ z_i; c_i¹ → −κ/4 | scribe flux limit `eq:ex-lattice-scribe-flux-limit` | 380 |
| E-clock = `unlocated-to-C15-clock` | existing | arch comparison `eq:ex-lattice-trace-arch-comparison` | weighted estimates | 402 |
| reference-chart calibration (part-B ledger, "Scalar deductions") | existing | calibrated reference chart giving the reference-price estimate | weighted estimates | 402 |
| I-C15-finite-response-price | **new** | the finite-volume inequalities `eq:ex-lattice-trace-finite-response-price` on a set in the separation ultrafilter | `subsec:ex-lattice-trace-weighted-route` | 407 |

## Correspondence and caveats moved from the chapters

The Lean names are taken from the existing part ledgers. Where a row adds a name, it is the one quoted there; I did not open new declarations for this response except `Vault` (`Lean/YM/TraceExtension/Terrace/Insert.lean` l.34: `Vault S Z d i v = (S.project d).comp (booty Z d i v)`), to confirm that 𝒱_i is the strip evaluation composed with the projection.

- **293.** 𝒱 is the source's one-point response table (`StressFlux.vectors`/`TableOne H.spin`, `Push/STRESS_FLUX/`).
- **296.** 𝓔_k is the core-to-strip map of the medium/core link `Slate.canal` (`TraceExtension/Slate/Phantom.lean`). It is not defined in the manuscript (open notation).
- **297, 295.** In Lean the medium representation, the response identity and the night scaling are derived from the standing hypotheses of `small_means` (`Spun`, `fisc`, `Slate.canal`, `frames_night`). The manuscript takes them as hypotheses.
- **298.** The price receipt is `ear_price` of `Mission` (`Terrace/PriceLimit.lean`) with `mileage` (`Terrace/Meteor.lean`).
- **299.** The separation input is derived in Lean through `ears_det`, `spots` (`Terrace/Ears.lean`), from the derivative and orientation identities of the reference table and simplicity of the gauge group.
- **300.** Pairing convergence in Lean: convergence of the selected chart path (`nearing`, `Terrace/SkyEar.lean`) with the derivative identities of both tables.
- **301–303.** Tickets: `Ticket`, `stickK`, `titles`, `ticket_exp`, `whither`, `tilt_cap` (`Terrace/Fund.lean`); δ = 10⁻⁴ is the Lean constant `Dust := 1/10000` (`Terrace/Arms.lean` l.10, checked).
- **304.** `small_means` is consumed by the sensor of YM-000033 (`trace-prosper-sensor.tex` l.552, with p = 1).
- **307.** Crown witness: `Glade.canopy`, no manuscript producer located.
- **312.** The guard ε ≤ 1/4 is the record field `D.ε`.
- **317–318.** C and D are the selected chart data and the `Medal`/`Eve` record; the dotted names (C.C, C.M, D.Q, D.K, D.Z, D.ε) are Lean field names kept as notation.
- **322.** Already-proved support-cover, rust and Gaussian-moment lemmas: see part-A ledger, rows `lem:ex-lattice-tail-pays-probe`, `prop:ex-lattice-selected-local-budget`.
- **358.** Source derivation of the planted expansion (removed from the text): in Lean these properties come from the same response hierarchy and its adjacent paid-response identities, the terminal forced-profile identity, the melting condition (`Meltdown`), occupancy and placement conditions on the planted sites at levels m and k, the two payment inequalities, and integrability of the initial and coupled polynomials. The moment identity comes at each transfer from normalization of the transition kernel and the exact response-density identity, and at the terminal level from the definition of the marked coefficient. Producer `Accent.copious` (`TraceExtension/Soot/Basin.lean`); see part-A ledger, "Second-round changes", W4.
- **361.** The five scale estimates are proved in Lean from the selection rules and simplicity of the gauge group (`stakeK`, `hullK`, `grantK`, `gainsK`, `bond`; part-A ledger).
- **362–363.** The label-producing receipt comes in Lean from a funded atomic activity (`Shunt.voyage` produces `AtomD`) and a scale-dependent resource transfer, with the price-duality estimate.
- **365.** The probe scales hold for large j in Lean; declarations as in the part-B ledger row `prop:ex-trace-probe-assembly` (I did not locate the specific receipt).
- **366.** Lean: the finite-cover construction produces the mission's fixed-complexity probe, and convergence of the selected core field produces its limiting value (`Mission`, `outside`, `concert`, `Terrace/Traveller.lean`).
- **372–373.** L_i, Ω_i, Δ_i are the three paid tensor families of `Spun.starts`; q_i = `Z.β(k_i)` in Lean (part-B ledger, row "Scribe chapter").
- **380.** Lean bounds q_i ≤ 2z_i, ρ_i ≤ t_i ≤ z_i (age weights 1/6, 1/5 at k_i), and supplies the five limits.
- **381.** Lean: `reads_limit` (comparison of jets), part-B ledger edge E-C14-shell (4d).
- **385.** In the source the ultrafilter, the arch scale and the reference hierarchy are chosen once, before the null sequence (s_n). So the source has a sequence-uniform form of `input:trace-scales`. The manuscript uses only the weaker, sequence-dependent form.
- **393.** The source asserts the field-decay estimate only at the postselected levels n_i of YM-000033, not at every unreindexed level.
- **402.** The source derives the arch comparison from positivity of the arch scale and the two-sided scale control. It derives the local response estimate from a priced local charge inequality through the finite-volume separation limit, and the reference-price estimate from the calibrated reference chart. Declarations: part-B ledger row "Scalar deductions" (`penumbra`, `tiara`, `diadem`, `washout`, …); I did not match them one by one to these three steps.
- **407.** The source obtains the finite-volume inequalities by applying the local charged-configuration bound (`YM.Trace.Margin.brass`) to each typical configuration, with the transported-field error estimate.
- **411–412.** Producers in Lean: coefficient-to-root estimate, local approximation and window bound, probe witness with distant-site price estimate, reflection-positivity seam `YM.Cells.Seam`; assembly `pulpit`, `slides` (`Terrace/HomePort.lean`), `mileage`.

## Unflagged leakage fixed in the same chapters

- U1. `trace-regular-atom.tex` (base l.213–215): "their hypotheses and producer declarations are recorded in the accompanying evidence file" → "which are inputs here and are not proved in this monograph". The chart statements are `mire`, `desert` (part-A ledger).

Not touched, but noted for the C15 owner: dotted Lean-style constant names in `trace-local-rate-selection.tex` (row 318); `P_5=S.\operatorname{project}_5` and `\operatorname{Vault}(S,Z,5,k_i,c_i)` in `trace-small-means.tex` (l.68, l.80) are Lean names used as notation, with a verbal gloss; the labels containing `source` (`eq:ex-lattice-eve-source-identification`, `subsec:ex-lattice-trace-source-rate`, `eq:ex-lattice-trace-*-inputs-source`) are kept for stability and do not print. `trace-mission-price.tex` l.148 uses the same "growth receipt" as row 409 (not an audit row; not edited).

## For the reviewer

1. Row 380: is c_i¹ → −κ/4 supplied by the sensor dictionary of YM-000033 (`eq:ex-lattice-scribe-sensor-limits`)? If so, I-C15-scribe-scale-bounds shrinks to the two scale bounds.
2. Row 373: the text calls q_i "the effective coupling at the selected level", while the chapter (l.613) and the part-B ledger identify q_i with the arch scale ζ(k_i). I kept the existing wording. Please check that the two are the same object.
3. Row 328: I did not identify f with the envelope B_* (the constants τB_* and 2\|f\| differ), so the step is now a named input rather than a proof.
4. Row 409 is the only J resolved by a new proof (one line).

## Checks

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` in `manuscript/`: exit 0, 982 pages, no undefined references, no multiply defined labels. The only overfull box (1.83pt) is the existing one in `public-run-binding.tex`, outside C15.
- Changed passages located in the PDF text. Pages 895 (small-means opening) and 942 (scribe flux limit) were viewed as images. The other changed pages (901, 917, 924, 929, 932, 957, 961–965) were checked in the extracted text only.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.
- No Lean command was run (text reading only; this task changes no Lean-facing statement).

## Chapter hashes (SHA-256)

| Chapter | Base `69b2631` | After this response |
| --- | --- | --- |
| `trace-small-means.tex` | `ab4d88cff18cf16daedc72ee5060b3daf5f091e32df058aff9c37767bf47b3e1` | `4fa450c4ef0f1b9675d84cc6e7e79f2f56d7ae71404745a9d60cebca656cf25c` |
| `trace-crown-buffer.tex` | `c20605af5cba507c600463a41a97b62884203701f87fb903c0bdcc78994ac738` | `2331003424fae06adcad0e6e9db3327b01fd01bab6f5c2064b1317f04ad8aced` |
| `trace-price-recurrence.tex` | `d806266671058ddf52cfab24a60b97a85e9434cc357f1b5d8952585387260ab7` | `1229cc60ed2641af8c59f561739f6cc4a022d984f5995e000de7c6a61a53d27b` |
| `trace-local-paid-budgets.tex` | `89a8a89d18a90c5f6378cdba260900ee955b196be53216cafcca319f3619f591` | `42962f8b9d7359162f6f0d7599fbc4ee8fb13b3ee7c7da7129d79b92c1b4ef73` |
| `trace-local-rate-selection.tex` | `46950adfb52103145d21023096690f59165ea81c08f9de42c71c0a5679de144a` | `e5ed9177f0dab785de99a4855cb1638c0cc2832cbcaeaeae57c21fbbfa9ccf2f` |
| `trace-medal-prices.tex` | `54df3679cc287744478c37d40e26e444ec00786055d88004256b1e1538f39d9f` | `4cdfbb56d96e045dd4c87732718bb01e3859ab7b444a2414836ed5d101005d57` |
| `trace-eve-producer.tex` | `5bcdf4e577b71960cad20ac715d230280cdcac84868a4d7c2f958728a9eb63e6` | `b0a13cb3739cd96b1745f4bdc9599f150afefa8c8caa97cb0416bdb979c17d1c` |
| `trace-row-jet-estimates.tex` | `f2fc8a245f8ae1373db1c2e15e436437d162d7fdec5cdd3a3172b3c96c4aadf2` | `dbd6bbffed6605f24a55e20ece34e794e1028477bd3a828afb3629ffe6b899ba` |
| `trace-regular-atom.tex` | `940dfbef8513a96ed9f9a90e893baa20dbe013d9dafec96075f55033a21390f4` | `254da9c85ab32697d331e8f4319a33a4116c1eb9f2b2a1098e9fc318280ebef9` |
| `trace-coffer-supplier.tex` | `855c25c892f03f7ca6cfd20b18553159e8c411042f4e74d9d8a8f6cb098fdd53` | `7d00533ed57018e3551ae196d7891378f12c813a3eafc1dbb8ebfebf65a561e6` |
| `trace-bill-prices.tex` | `3573e9ef1c5d47b0b9d9a6ce76115c406440fc5622ce29edf7cdb151a4094a55` | `a5b651ba609fe5032fcacae80e3e0dcfb459c5783788f5650672a61f31d9e8e1` |
| `trace-probe-assembly.tex` | `420072c701690d362620da6915bc3b98e9218b0a0be02e82fb78698bbed3b532` | `744be9eee8f4bd35161e46bb6d497a2274ee4c5a9ba0aa6167cbb00d1c9086c9` |
| `trace-mission-price.tex` | `e6244286399c6af819ebc538519e8008a1a8f1ab9aed57b7cce24695eb0dca5e` | `e5ee15e550242bfa52d310456effb485acc0c93f35955a29729d61059732bece` |
| `trace-scribe-producer.tex` | `9a805ba11d8a56a2fa7892258bbb65e6730650a8b25e83eb16693440cbe5b96a` | `eb2df35a460c7425c26c8784ba21fbf65cccf50a069edd6a3588778aec2af6bd` |
| `trace-asymptotic.tex` | `ccb50cdba852e470937cd038c3524f2a24a02c6624cbca884b8a1753d1d167c2` | `3e36d480a5325ec64e3920cfc468f9196c8e9ab8ce4cfbd15ad58872e195d04e` |
| `trace-weighted-estimates.tex` | `c1d181d871c298b83e3bc29c984c0699243f75fcc5d6f5d3edb6fbe3746b2e3f` | `e5f996ca940a967436eb6966ed73a5ade4e39e22a3b171aefb26794e9d372d93` |
| `trace-local-pairing.tex` | `d904217ef3c520d77225c89ea058d324b8126235996f708b7195780d3e9a16e7` | `c50f5136d756a22cfd04612fec67366ca35e20725e22aeb6faecf5f5ae3281f8` |
| `trace-local-charge.tex` | `8e59a151a2d294e1b0a7f6c057d8736040abc046b15822292f57c29c6d93aeb3` | `0c72aac5b0d92326acd676b0052589b1ab0ae3305af733db2514169da03c079e` |
