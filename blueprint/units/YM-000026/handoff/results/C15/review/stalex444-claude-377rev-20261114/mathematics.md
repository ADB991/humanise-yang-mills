# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of the #377 change for #337.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): two independent mathematics reads (one forward, one adversarial) and a cross-reference read of every symbol the change identifies between the two units, and, for each of the 17 findings (remarks apart) that these reads and the Lean read raised, one independent re-derivation and one author's-advocate refutation; the findings were then consolidated into M1–M5, L10 and L11 against the source lines. Where the two checks of a finding disagreed, the point was settled at the source lines, and the item says how. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: `c04b73285ad32af314ce6eb75b601088bc84072b027ae8f099a71408fff65b1f` (unit fingerprint at `bdd348cd`; it covers `trace-scribe-producer.tex` and the other 244 listed files). Per-file SHA-256 in `hashes.json` (`trace-scribe-producer.tex` `2b22a7b8…`, author record `bb72cdc5…`). The scribe file is in the YM-000026 manuscript list (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-scribe-producer.tex` (the amended crown-normalization sentence, l.242–250; the amended identification paragraph, l.294–326; `lem:ex-lattice-scribe-normalization-ratio` and its proof, l.328–369; the paragraph after it, l.371–378). Interface passages read: `trace-branch-moments.tex` (YM-000034), the #357 report `results/C15/endpoints/ADB991-claude-20261114-bf13/README.md`, and others in part (N4).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at `codex/existence-monograph` `bdd348cd` (the reviewed files are unchanged between `0f00ae72` and `bdd348cd`).
- Review task and PR: #337; reviewed PR #377 (commit `01f5bf3c`, merged at `0f00ae72`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies; no required change. No false statement and no gap in a proof step was found. The identification of the two normalizations is exact, the lemma's proof is correct, and the change answers F1 of the #357 report. M1 and M2 are recommended; M3–M5 are minor.

Line numbers are those of `trace-scribe-producer.tex` at `bdd348cd` (equal to the post-merge numbering, since the file has no diff between `0f00ae72` and `bdd348cd`) unless another file is named. "Branch" is `trace-branch-moments.tex`, "record" is the author record `results/C15/author/hairer-claude-337F1-20261114/README.md`, "#357 report" is `results/C15/endpoints/ADB991-claude-20261114-bf13/README.md`. Recomputations are in `evidence/` (`math_forward_377.py`, `math_adversarial_377.py`, with their outputs), re-run on 2026-11-14, exit 0; what each item of the scripts tests is stated in validation.md.

## Findings and evidence

### Inputs and conclusions

The change takes as inputs the branch unit's conclusions for its map 𝖯_i (`prop:ex-branch-moments`, `prop:ex-branch-washout`, `eq:ex-branch-three-traces`), the branch unit's scale ratio β_Z(j)/β̂_j → 1, and the scribe's first clock input ζ(j)/β̂_j → 1. Its conclusions are the identity 𝒫_i = λ_i^{-1}𝖯_i with λ_i = β_Z(k_i)/q_i, the limit λ_i → 1, and the transfer of the field limits, the true-branch trace limit and the exponent-one washout limits from 𝖯_i to 𝒫_i. This review checks the deductions from the inputs; it does not establish the inputs (N1).

### Step by step

- **Crown normalization (l.242–250).** q_i = ζ(k_i) is the arch scale, as in the clock paragraph (l.690–693, "thus $q_i=\zeta(k_i)$"), and the crown normalization is q_i r_i⁴, consistent with 𝒴_i = q_i^{-1}𝒫_i (l.243), the use of 𝒴_i in 𝓕_i(g_i) = 𝓛_i(𝒴_i(g_i)) with 𝓛_i(H) = 𝓕_i(r_i^{-4}U_{i,4}H) at l.604–610, and the zoomed q_i r_i⁴U_i^{-1} at l.671–682. The sentence asserts no equality with the branch unit's coupling. Correct (C1). Wording elsewhere in the file: M2.
- **Identification (l.294–311).** Branch l.124–127 and l.136–137 give 𝖯_i = ω_iU_i^{-1} with ω_i = β_Z(k_i)r_i⁴; the scribe's crown is q_i r_i⁴ with the same chart U_i and radius r_i (branch l.7–8 places the branch unit on the same history and chart). Hence 𝒫_i = (q_i/β_Z(k_i))𝖯_i = λ_i^{-1}𝖯_i, entrywise, and λ_i is the right way up. Recomputed symbolically (`math_forward_377.py` item 1, `math_adversarial_377.py` item 1). Correct (C2).
- **Moment map (l.307–309).** Branch l.132 defines V_{k,c} = π(cϑ_k²A_k^{-1}), which is linear in c, and branch l.136 defines 𝖬_i = U_i^{-1}𝔠V_{k_i,ω_i}. Replacing ω_i by q_i r_i⁴ = λ_i^{-1}ω_i multiplies 𝖬_i by λ_i^{-1}, as l.308–309 says; the chart formula at l.268–271 stays consistent, since both sides carry the same factor. Recomputed symbolically (`math_forward_377.py` item 2). Correct (C3). Consequence for l.274–275 and l.322–323: M4.
- **Hypotheses of the lemma (l.330–335).** The display `eq:ex-branch-lift-beta-ratio` is at branch l.395–396; the scale-ratio paragraph after it (branch l.493–504) proves β_Z(j)/β̂_j → 1 from the running estimate and the fixed-scale limit and calls both upstream inputs (branch l.503–504). ζ(j)/β̂_j → 1 is the first clause of `eq:ex-lattice-scribe-clock-inputs` (l.703), declared an input at l.697–698. The lemma describes the status of both accurately. Both limits are over all levels j. Correct (C4). The two ratios are taken against one hatted clock; M5.
- **k_i → ∞ (l.347–348).** j_i → ∞ is stated at l.696, and k_i is the summit index of j_i (l.690–691). The summit is a later level: `trace-prosper-sensor.tex` l.92–94 defines it as the first level q(j) > j with the required scale separation, and branch l.512 calls it the first later level; branch l.122 also states that k_i tends to infinity. Specialising both limits along j = k_i needs only k_i → ∞, not monotonicity. Correct (C5).
- **Positivity (l.349–350).** ζ(j) > 0 (l.693); β̂_k > 0 (branch l.123); β_Z(k_i) > 0 from ω_i > 0 (branch l.125) and r_i > 0. λ_i > 0 makes ‖λ_i^{-1}x‖ = λ_i^{-1}‖x‖ at l.365–366 exact. Correct (C6).
- **λ_i → 1 and λ_i^{-1} ≤ 2 eventually (l.351–357).** A quotient of two sequences tending to 1. Finitely many early indices with λ_i^{-1} > 2 do not affect the limits (illustrated by `math_adversarial_377.py` item 4, which builds three such indices). Correct (C7).
- **Field transfer (l.357–360).** A convergent scalar sequence times a convergent sequence in the finite product of copies of 𝓕_4^0 converges to the product of the limits; branch `prop:ex-branch-moments` states its limits in (𝓕_4^0)^{I×I} (branch l.624–628). Correct (C8).
- **True-branch trace (l.341, l.360–364).** The trace is linear and continuous; tr M_1 = tr M(w^+) = 4𝒪 by branch l.107 and l.112–113 (recomputed: tr M(w) = 4(w_1+4w_2)𝒪 gives 0, 0, 4𝒪 at w^0, w^−, w^+; `math_forward_377.py` item 3). The proof is correct (C9). The form of the statement: M1.
- **Washout transfer (l.342–343, l.364–368) and the paragraph after the lemma (l.371–373).** z_i = β̂_{k_i} (l.143). `prop:ex-branch-washout` gives β̂_{k_i}^p tr(𝖯_i t^b_{k_i}) → 0 for each fixed p ∈ ℕ and b ∈ {0, −} (branch l.1084–1089) and says "In particular the assertion holds for $p=1$" (branch l.1091). With t^0_{k_i} = L_i and t^−_{k_i} = Ω_i (l.298–299), the p = 1 case is exactly the antecedent of the third implication for Q_i ∈ {L_i, Ω_i}, as l.371–373 says. Nothing is claimed for the true branch, consistent with l.318 and branch l.1145–1150. Correct (C10).
- **Conditionality and the exact identity (l.374–378).** The transferred limits are stated as conditional on the branch unit's inputs and the first clock input, which are the inputs actually used. The identity 𝒴_i(T_i) = 𝒫_i(L_i) + (c_i^0/q_i)𝒫_i(Ω_i) + (c_i^1/q_i)𝒫_i(Δ_i) (l.393–398) follows from T_i (l.252) and 𝒴_i = q_i^{-1}𝒫_i (l.243) by linearity; β_Z does not enter. Correct (C11).
- **Circularity.** The branch scale-ratio argument (branch l.493–504) cites nothing from the scribe; the first clock input is an input; the clock derivation after l.710 uses q_i = ζ(k_i) and not the lemma. No cycle (C12).
- **Downstream uses.** The three field limits of the field receipts (l.382–384) are delivered by the lemma's first implication (the fourth, ρ_i/q_i → 0 at l.385, is the selected-scale washout input, l.388); the trace limits at l.412–418 are the lemma's third implication with p = 1 (l.419–420) and, for the true branch, the field receipt and continuity (l.422–424); the shell, proportionality and zoom steps (l.603–649, l.666–682) use the scribe's own normalization q_i r_i⁴ and 𝒴_i, not 𝖯_i. No later step uses the branch normalization without the lemma (C13).
- **F1 of the #357 report.** F1 (#357 report l.54–58) asks not to assert 𝒫_i = 𝖯_i, to put λ_i = β_Z(k_i)/q_i with λ_i → 1 from the two ratio inputs, to carry the field limits, the washout limits and tr 𝒫_i(Δ_i) → 4𝒪 over, and to note that the 𝒴_i(T_i) identity is unaffected. Each element is in the text, with the same orientation of λ_i, and λ_i → 1 is proved from the two ratio limits F1 names. F1 is answered (C14).
- **Author record.** Base `a8c2449` resolves to `a8c24495`, the only parent of `01f5bf3c`. The scribe file's previous commit is `3f5cf17e` by ADB991 (refs #361). The change list matches the diff; the removed sentence began "$q_i$ is the effective coupling at the selected level", of which the record's quotation is a prefix. The line the record names under "Not changed" (l.164–165) exists. The branch file is not `\input` by `manuscript/existence.tex` (which inputs the scribe at l.260), consistent with the `\texttt` citation. Correct (C15). The build claims were not checked (N2); the "Not changed" list: M2; the no-Lean sentence: lean-correspondence.md L10.
- **Literature.** The change invokes no external result; its steps are elementary (limits of products and quotients of convergent sequences, continuity of a linear map on a finite-dimensional space). No literature search was made for this review.

### M1. The middle conclusion of the lemma is stated without its premise (Should)

Class: statement precision (the proof and the use are correct).
Where: statement l.336–344, middle conclusion l.341; proof l.360–364; branch l.617–628 and l.111–115.

The lemma's hypotheses are only the two ratio limits (l.330–335), which give λ_i → 1 and nothing about 𝖯_i(Δ_i). The first and third conclusions are implications from a 𝖯_i-statement; the middle one, tr 𝒫_i(Δ_i) → 4𝒪, is stated outright. Its proof uses λ_i^{-1} tr 𝖯_i(Δ_i) → tr M_1, which requires the branch field limit 𝖯_i t^+_{k_i} → M(w^+) of `prop:ex-branch-moments` (branch l.626), a conclusion of that proposition under its own hypotheses (branch l.619–622). The identity tr M_1 = 4𝒪 (`eq:ex-branch-three-traces`, branch l.111–115) is unconditional algebra on the reference tensor and needs only its citation. So the one missing premise is the third field limit. The paragraph before the lemma names it as an external input (l.312–314, l.320–323), and l.422–424 derive the same limit from the field receipt correctly, so nothing downstream is affected.

Suggested repair: state the middle item as an implication like the other two, 𝖯_i(Δ_i) → M_1 ⟹ tr 𝒫_i(Δ_i) → 4𝒪, citing `eq:ex-branch-three-traces` for tr M_1 = 4𝒪; or add the third field limit of `prop:ex-branch-moments` to the lemma's hypotheses.

Affects: the statement of the lemma only.

### M2. Line 62 still calls q_i the selected effective coupling (Should)

Class: wording (the change repaired one of the sentences of this kind and left another).
Where: l.62; l.246–250 and l.301 (amended); record item 1 and "Not changed"; optional l.388–390.

The change replaces the sentence "$q_i$ is the effective coupling at the selected level" by the arch-scale sentence at l.246–250, which adds "We do not assert that $q_i$ equals the effective coupling of the branch unit" (l.248–249); l.301 now applies the phrase to the branch unit's coupling ("where $\beta_Z$ is its effective coupling"). The record (item 1) gives the reason: the old wording "contradicted the clock paragraph's q_i = ζ(k_i)". Line 62, which introduces q_i in the file, was not changed and reads "Let $q_i>0$ be the selected effective coupling". Read literally it is not a contradiction of l.248–249, which disclaims only equality with the branch unit's coupling; but it gives q_i the name the change has just withdrawn, and the record's own reason applies to it unchanged. A phrase search of `manuscript/` at `bdd348cd` (N6, validation.md) finds no file that calls the arch scale ζ an effective coupling; `trace-asymptotic.tex` l.120 calls B_i = q_i effective couplings (README, Records). In the source the two coincide (lean-correspondence.md L11); the point is consistency with l.248–249 and with the record's own reason. The record's "Not changed" list does not mention l.62. No mathematical step depends on the word.

Optional, l.388–390: the sentence says the clock price's ratio "to the effective" / "coupling tends to zero", for the displayed ratio ρ_i/q_i (l.385). The two checks read the phrase differently (as q_i, or as the clock weight z_i = β̂_{k_i}; `actual-stress-shell-nodes.tex` l.13–14 calls its own β̂_i the effective coupling). Settled at the source: the sentence does not say which quantity it means, and the limit holds under every reading, since ρ_i = A_{1/6}(i) is a subpower of p_i = z_i (l.163–164; `trace-weighted-estimates.tex` l.133–134 and l.189), q_i ≥ z_i/2 (`trace-weighted-estimates.tex` l.183, with q_i = b_i by l.164–165), and β_Z(k_i)/q_i → 1 by the lemma. Naming the quantity would remove the ambiguity.

Suggested repair: at l.62 call q_i the selected arch scale (for example "Let $q_i=\zeta(k_i)>0$ be the arch scale at the selected level", with a pointer to the clock paragraph), or list l.62 under "Not changed" with the reason. Optionally name z_i or q_i at l.389–390.

Outside #377 (records, not a change requested of this note): see README, Records, for `trace-asymptotic.tex` l.120 and `blueprint/units/YM-000034/correspondence.md` l.144.

### M3. The symbol λ_i has two meanings in the section (Minor)

Class: notation.
Where: l.305 (new) and its uses at l.308–366; l.626–642 (unchanged by #377).

#377 defines λ_i = β_Z(k_i)/q_i at l.305, in the subsection "The two-direction conserved correction" (from l.34). The same section already used λ_i, in the subsection "Proportionality transfers the physical normalization" (from l.455), for the scalar with g_i = λ_iR, introduced without a binder at l.626 ("Since $\ker D$ is one-dimensional, $g_i=\lambda_iR$") and shown to tend to 1 at l.630–635. Both scalars tend to 1, and both enter trace identities inverted: at l.362 λ_i^{-1} multiplies tr 𝖯_i(Δ_i); at l.641–642, tr 𝒫_i(R) = λ_i^{-1} tr 𝒫_i(g_i), where the explicit factor is the l.626 scalar while 𝒫_i itself carries the l.305 scalar (l.326). A reader holding the l.305 definition can read l.626 as g_i = (β_Z(k_i)/q_i)R. Before #377 the only λ_i in the file were those at l.626–642, so the change created the clash. Each use is correct where it stands. (The superscripted λ^r, λ^r_i at l.564–578 are a separate family and do not collide.)

Suggested repair: rename the new ratio in l.305–366 (for example θ_i or η_i; neither lowercase letter occurs in the file; Θ_T is used from l.658), or bind the l.626 scalar explicitly under another letter.

### M4. The operator-norm sentence and the sentence on the same hypotheses now need λ_i → 1 (Minor)

Class: wording (the conclusions are unaffected).
Where: l.273–275, l.308–309, l.321–323; branch l.136, l.160–162.

After #377 the scribe's 𝖬_i is λ_i^{-1} times the branch unit's moment map (l.308–309). Lines 274–275, unchanged, assert that "the fourth-order maps converge in operator norm" to 𝖬_∞. For the scribe's map this follows from the branch input `eq:ex-branch-moment-input` (branch l.160–162) only together with λ_i → 1, which the lemma proves later and which these lines do not cite. Before #377 the identification was 𝒫_i = 𝖯_i with ω_i = q_i r_i⁴ (removed lines), so the sentence at l.321–323, that the finite-array argument "repeats the proof of the first of them under the same hypotheses", was accurate under that identification; it now needs λ_i → 1 as well. Of the lemma's two hypotheses, the branch scale ratio is the branch unit's own result; the input added beyond the branch unit's is the scribe's first clock input. Nothing downstream breaks: the lemma's first implication gives the field limits for 𝒫_i directly, and l.374–376 already state the conditionality on the first clock input.

Suggested repair: at l.322–323 add that the scribe's maps are λ_i^{-1} times the branch maps and that λ_i → 1 by `lem:ex-lattice-scribe-normalization-ratio`, or cite the lemma at l.274–275.

### M5. The identification paragraph does not name the clock (Minor, optional)

Class: dictionary completeness.
Where: l.294–311; lemma l.330–335; branch l.123, l.501, l.506; l.695; `trace-clock-cap.tex` l.15–17.

The lemma divides two ratios taken against one hatted clock: the branch unit's β_Z(j)/β̂_j and the scribe's ζ(j)/β̂_j. The branch unit introduces its clock as "its inverse-coupling clock" (branch l.123), affine "for its positive slope $b$" (branch l.501), with mesh a_k = e^{-s_k} (branch l.665); the scribe's clock is β̂_j = β̄ + κ log(𝖺_j^{-1}) (l.695). The identification paragraph names the tensors, the map, the moment map, the labels and the reference tensors, but not the clock. λ_i → 1 depends on the identification: if the two clocks were affine on a common scale with slopes b ≠ κ, λ_i would tend to b/κ.

The two checks disagreed on whether this is a gap. Settled at the source: the reading that the clocks coincide is supported by the text, which fixes "one selected history, one ultrafilter, one hierarchy, and one scaling" for the section (l.8–9), places the branch unit on "one selected history" and the same chart (branch l.7–8), and defines the clock as the rates of the selected run (`trace-clock-cap.tex` l.15–17). The washout transfer through z_i = β̂_{k_i} (l.143) relied on the same reading before #377, though there it needed the two clocks to agree only up to a bounded factor; #377's own sentence at l.371–373 reads the branch unit's washout weight β̂_{k_i} as z_i exactly. No sentence equates the branch slope b with κ, although the branch unit calls b "the fixed slope constant" (branch l.506) and the scribe calls κ "the slope constant" (l.20). This is a missing dictionary clause, not an error.

Recomputation: `math_forward_377.py` item 5 takes b = 2.0 against κ = 1.7; its printed value λ = 1.108094 is the value at k = 10⁷, where the toy's ζ/β̂ is still converging like 1/log k; the limit is b/κ ≈ 1.1765, which the same line prints. (The script's docstring writes the limit as κ/b; the correct ratio is b/κ.)

Suggested repair (optional): add to the identification that the branch unit's clock β̂_k is the present β̂_k.

## Required changes and remaining uncertainty

Required: none.
Should: M1 (state the middle conclusion of the lemma as an implication, or list its premise), M2 (call q_i the arch scale at l.62, or list l.62 under "Not changed").
Minor: M3 (rename the new λ_i), M4 (cite λ_i → 1 at l.274–275 or l.322–323), M5 (optional clock clause).

Not checked:

- N1. The inputs: the branch unit's running estimate and fixed-scale limit, the scribe's first clock input, `prop:ex-branch-moments`, `prop:ex-branch-washout` and their recording, transport and chart inputs, and `eq:ex-branch-moment-input`. This review checks the use #377 makes of them.
- N2. The author record's build claims (latexmk exit 0, 1036 pages, 0 undefined references, pp. 985–986). No LaTeX build was run and no rendered page was inspected.
- N3. The scribe text outside the #377 changes beyond the consistency checks and downstream uses listed above.
- N4. Interface files beyond the cited passages: `trace-asymptotic.tex`, `trace-clock-cap.tex`, `trace-weighted-estimates.tex`, `trace-prosper-sensor.tex`, `actual-stress-shell-nodes.tex`, `trace-probe-assembly.tex`, `trace-crown-buffer.tex` and the YM-000033, YM-000034 and C15 part-B correspondence files were read in part.
- N5. Whether the branch unit's clock is formally the scribe's β̂ beyond the conventions cited in M5.
- N6. Manuscript searches were targeted `git grep` phrase searches over `manuscript/` at `bdd348cd`, not an exhaustive read (validation.md).
- N7. The review covers only the hashed bytes, except `manuscript/existence.tex` (its l.260 and the absence of an `\input` of the branch file, C15), the phrase searches of `manuscript/` (M2, N6), the archive checksum in `source/build.md` (l.37), the `manuscript` lists of the YM-000026 and YM-000034 `unit.json` files, and `Lean/SOURCES.sha256` (used for the hash comparison); `trace-probe-assembly.tex` and `trace-crown-buffer.tex` were read in part and are not hashed (N4).

N8–N14 concern the Lean correspondence and are listed in lean-correspondence.md.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
