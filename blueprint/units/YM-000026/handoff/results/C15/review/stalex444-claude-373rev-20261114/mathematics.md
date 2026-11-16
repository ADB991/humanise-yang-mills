# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of the #373 note for #372.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): three independent mathematics reads, and for each non-trivial finding an independent re-derivation and an author's-advocate refutation, consolidated against the source lines. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (`trace-rounded-receipt.tex` `44dd8b53…`, `trace-rounded-comparison.tex` `84a5aa4d…`). The unit fingerprint does not cover these files (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-rounded-receipt.tex` (`subsec:trace-rounded-receipt`, `lem:trace-receipt-width`, `lem:trace-receipt-cost`, `prop:trace-rounded-receipt`, `eq:trace-receipt-allowance`, `eq:trace-receipt-budget`, `eq:trace-receipt-level`); the #373 change to `manuscript/existence/trace-rounded-comparison.tex`. Interface passages read: `trace-firesky-gallery.tex`, `rank-root-normalization.tex`, `allarity-marked-propagation.tex` (and others in part; N2–N4). Neither target file is in the unit's manuscript list.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at `codex/existence-monograph` `0f00ae72` (= `a8c24495` for these files).
- Review task and PR: #372; reviewed PR #373 (commit `83eecbca`, merged at `a8c24495`); this report is added by its own pull request.
- Outcome: changes requested (M1 and M2 required; M3 and M4 recommended; M5–M9 minor). No false statement was found. Both lemmas and the first assertion of `prop:trace-rounded-receipt` are correct, conditional on the stated inputs (A) and (B) and on the depth identification of M2. The "Moreover" assertion is true, but the text does not prove it as written (M1).

Line numbers are those of `trace-rounded-receipt.tex` at `0f00ae72` unless another file is named. "Parent" is `trace-rounded-comparison.tex`, "gallery" is `trace-firesky-gallery.tex`, "rank-root" is `rank-root-normalization.tex`, "allarity" is `allarity-marked-propagation.tex`. Recomputations are in `evidence/` (`math_checks_372.py`, `math_lane_forward_checks.py`, `math_lens_checks.py`, `obj_ticket_check.py`, with their outputs), re-run on 2026-11-14, exit 0; results as stated at each item (the r = 5 point of `obj_ticket_check.py` is not a test; M4).

## Findings and evidence

### Inputs and conclusions

The note's inputs are (A) (l.49–54) and (B) (l.55–64), together with μ_k → ∞ from (G1). Its conclusions are the two lemmas, the first assertion of the proposition (G3 at cost ε_i = (i+1)^{-1} when k_i ≥ K(i,(i+1)^{-1})), the "Moreover" assertion (the level condition can be arranged within the gallery selection), and the description of how (B) would be supplied. This review checks the deductions from the inputs; it does not establish the inputs (N1).

### Step by step

- **Overview (l.7–19).** The width clause uses only (A) and the growth of the monitor; the root bounds use only (B) and the growth. Correct (C1).
- **Setup (l.21–45).** r = a_k m = g_b(k) agrees with gallery l.53–56 and parent (G1) (l.47–55). Fitness for the chart at (k_i, b_i) is the parent's fitness at level i (parent l.76–81). The identities Φ_{c} = f_c − j_c and Φ_{01} = (f_0 − j_0)(f_1 − j_1) − κ follow from the parent's recursion (parent l.117–131); recomputed symbolically, difference 0. Correct (C2). Notation: M8 (q at l.42).
- **(A) and (B) (l.47–70).** The two forms of (A) are equivalent since a_k > 0. Taking the maximum over finitely many grades d' ≤ d and basis pairs (l.68–70) is valid. Uniformity of K_B in the chart is what lets K(d,ε) be fixed before the chart is chosen, as the proposition is stated (cf. L1); since the chart family is not finite (offsets t in [0,1], gallery l.15–19), it cannot be obtained by a maximum as at l.68–70. Correct (C3). For the relation of (B) to its Lean source, see L1 in lean-correspondence.md.
- **`lem:trace-receipt-width` (l.72–95).** ⌈my⌉ = t since my = t is integral; z = a_k t = r y; scaling by r > 0 keeps coordinatewise separation; |z_{c,ν}| ≤ r|y| ≤ rR, a coordinate being at most the Euclidean norm on ℝ⁸ (the parent's norm); rR ≤ (a_ℓ/μ_k²)R ≤ a_ℓ/8. The extremal case r = a_ℓ/μ_k², μ_k² = 8R gives equality. R = 100 gives 800 and matches the width clause of (G3) exactly (parent l.109–111) and its use at parent l.304–311. Correct and sharp (C4). The hypothesis R > 0 is not needed (see L8).
- **`lem:trace-receipt-cost` (l.97–116).** t ↦ t^{-1/(16n)} is decreasing, so μ_k ≥ ε^{-16n} gives μ_k^{-1/(16n)} ≤ ε, with equality at the threshold. The quantifiers are those of (B). Correct (C5). The hypothesis ε ≤ 1 is not needed.
- **K(d,ε) (l.118–123).** Each condition holds eventually since μ_k → ∞; a finite intersection of cofinite sets is cofinite; the least K from which all hold exists. No monotonicity of μ_k is used or needed. Correct (C6), with the inclusive reading of M7(i).
- **First assertion of `prop:trace-rounded-receipt` (l.125–151).** Checked clause by clause against parent l.99–111: every d' ≤ i, all basis vectors of E_{d'}, all N > k_i, all p, every x fit at level i with ρ_{m_i}(x) in 𝒲; cost via μ_{k_i} ≥ (i+1)^{16(i+2)} = ε_i^{-16n}; width clause via μ_{k_i}² ≥ 800. Checked against both consumers (parent l.233–241 and l.304–311). Correct under (A) and (B) (C7), subject to M2 (identification of depths) and M7(ii) (index quantifier). Edge cases recomputed: at i = 0, ε = 1 and n = 2, the cost condition μ ≥ 1 always holds, and the binding condition is μ² ≥ 800, i.e. μ ≥ 28.28; i = 1 needs μ ≥ 2^48 ≈ 2.81·10^14; i = 2, 3, 4 need log₁₀ μ ≥ 30.54, 48.16, 67.10.
- **"Moreover" assertion, proof (l.153–165).** Defect M1. The finite-intersection step (l.160–163) is correct once the late-point property is granted (C8).
- **Supply of the level budget (l.168–190).** Arithmetic correct: I_k = log μ_k/(16n), a = e^{2I_k} = μ_k^{1/(8n)} ≥ 1, and e^{I_k}/a^{|I|} ≤ e^{I_k}/a = e^{-I_k} = μ_k^{-1/(16n)} for |I| ≥ 1 (the two identities recomputed symbolically; the inequality is immediate from a ≥ 1). The allarity link (l.184–187) is cited correctly: ω = 𝓜_k^{1/(8M)} = e^{2I_k} = a and X = L + nℓ ≤ 1+M with u = M (allarity l.346–350). Rank-root l.276–280 does require the one-point and corrected two-point coefficients themselves, as the note says (l.181–183). (C9.) Status of the implication at l.177–179: M4. Notation: M6, M8. Scope of the allarity condition: M5.
- **Status (l.192–219).** M1 (l.194–195), M3, M4 (l.199–202, l.207–211), M5 (l.215–219).
- **Circularity.** No cited proof uses (G3): the selection lemma's hypothesis carries the finite-level receipts of gallery l.38–47, which on a broad reading include the pairwise receipt (gallery l.43–44), but its proof passes them through unused; `eq:rank-root` and the allarity envelope do not involve (G3). (C10.)
- **Open list (l.202–214).** Apart from M3–M5, it states what (B) needs in a form precise enough to be proved later, with the right uniformity: the threshold comes before N > k, p, the fit point and the finitely many basis labels (C11). Its consistency in form with #374, #376 and #378 was checked from local copies of those issues only (N22).
- **Literature.** The note invokes no external result; its steps are elementary (monotonicity of a power, finite intersections of cofinite sets, a coordinate bounded by the Euclidean norm). No literature search was made for this review.

### M1. The proof of the "Moreover" assertion cites a property that the gallery section does not state (Required)

Class: defect in a proof step (unsupported cross-reference; the conclusion survives).
Where: statement l.134–136; proof l.153–165; Status l.194–195.

The proof asks the reader to "recall from" the gallery section (l.153) that all other requirements of the selection hold at all sufficiently late points of the one-step theorem's level curve, and intersects finitely many late-point sets with {k ≥ K(i,(i+1)^{-1})}. Gallery l.38–40 describes the output only at one selected point. Gallery l.19–20 supplies chart witnesses at every sufficiently large level, and the clock-gap interpolation (gallery l.60–76), which the one-step theorem combines with the funded family (gallery l.103–104), reaches levels beyond any prescribed J; neither states that the remaining requirements of the output (the pairwise receipt and station of gallery l.43–47) hold at all late points of the returned curve, and the manuscript elsewhere treats the producer as an input (`trace-asymptotic.tex` l.235–236). The selection lemma (gallery l.82–85) assumes, for every previous index N and every θ > 0, an output with index n > N, level i ≥ d and exact radius s_n < θ. Its only lower bound on the level is i ≥ d, which does not imply k_i ≥ K(i,(i+1)^{-1}): K involves K_B(i) and μ_k ≥ (i+1)^{16(i+2)}. Targeted searches of the manuscript find the late-point property stated only in the note itself. The step as written therefore rests on an unstated property, and the text does not prove the assertion.

The assertion is provable from what the gallery states. Fix K = K(i,(i+1)^{-1}); under (B) as stated it is determined before the producer is called, since K_B does not depend on the chart. The selected radius is the exact clock gap s = g_b(k) = a_k μ_k^b at the chart level k (the gallery's level i; gallery l.38–40, l.53–56), with a_k > 0, μ_k ≥ 1 and b > 5 (gallery l.40; parent l.47–55). Hence s ≥ a_k. Call the producer with θ' = min(θ, min_{j<K} a_j) > 0 (θ' = θ if K = 0). If the returned level were k < K, then s ≥ a_k ≥ θ' > s, a contradiction; so k ≥ K. Since θ' ≤ θ, the conclusions of the selection lemma (gallery l.89) are unchanged.

Suggested repair: replace the "recall" sentence by this threshold argument, or state in the gallery section that the one-step output can be required to have its level above any prescribed bound; then say that the selection lemma is applied with the reduced threshold, rather than that it "is unchanged" (l.165).

Interaction with L1 (reviewer's reasoning; not independently checked): the threshold repair uses that K is fixed before the chart is chosen, which holds for (B) as stated. If (B) is weakened to a per-curve form (see L1), K depends on the returned curve and the threshold repair no longer applies; the repair must then go through the one-step output itself (the late-point property, or an output that already contains the receipt, which gallery l.43–44 says it does at cost costHint(l)).

Lean (elaborated; L5): `boatsSky` takes an arbitrary lower bound Y and returns a level i ≥ Y, intersecting eventual sets (including the receipt from `await`). The property holds in the source; it is not in the manuscript.

Affects: the "Moreover" assertion and the Status sentence at l.194–195 ("including the choice of the selected levels"). The first assertion takes k_i ≥ K as a hypothesis and is not affected.

### M2. The bounds are proved at the root depth w; (G3) is stated at the depth w_i of (G4) (Required)

Class: interface mismatch.
Where: l.31–33 (w is the chart's root depth), l.60 ((B) at depth w), l.138–151 (proof ends "This is (G3)"); parent l.70–74 ((G4): a root depth w_i ≤ k_i exists), l.95–98 ((G3)'s root test at depth w_i), l.233–241 (the consumer uses (G3) and (G4) at the same w_i).

(G4) introduces w_i existentially; (G3) and its consumer need the root-price bound and chamber interiority at one depth. The note's conclusion is the bound at w, so "This is (G3)" (l.151) holds only once w_i := w and (G4) is supplied at that depth. Root bounds do not transfer freely between depths (the fine-to-coarse placement of `centered-estimates.tex` l.474–476 needs alignment and margins), and no transfer is invoked. Beyond the note's own gloss (l.32–33, "the depth of the centered tiling on which root tests are taken"), which names w by its role but does not tie it to the w_i of (G4), the manuscript does not define a chart's root depth: the phrase occurs only at parent l.70, parent l.233 and note l.32 (`actual-phase-detector-moments.tex` l.26 names the root-test depth of a comparison trial, not of a chart), and the gallery does not use "depth". The proof identifies m = m_i and fitness with fitness at level i (l.139–142), but not w with w_i. The note (l.32, "its root depth") and the parent (l.233, "The root depth") both use a definite phrase, so the intended identification is clear; the text does not make it.

The arithmetic at depth w is correct. Proving (G4), or w_i ≤ k_i, is not the note's task.

Suggested repair: one sentence in the proposition or its proof taking w_i to be the root depth of the chart selected at index i and saying that (G4) is required at that depth; or, for the chart selected at index i, state (B) (and `lem:trace-receipt-cost`) at the depth w_i of (G4). Defining a chart's root depth once (gallery or parent) and stating (G4) at that depth would close it.

Lean (text-level only; L16): the (G3) root test and the (G4) chamber both use the centered tiling at `widthSky A b k`, so the source makes the identification by construction.

Affects: the final identification with (G3) as consumed, not the bounds; also the Status list, which speaks of depth w (l.205).

### M3. The open-input list omits (A) (Should)

Class: status description incomplete.
Where: l.196–199 (disclosure), l.202–214 (open list); parent l.347–351 repeats the single-input framing.

The gallery's witness description (gallery l.14–23) names chart, invoice, legacy-cost, actuation and stamp data and states no inequality of the form m μ_k² ≤ a_ℓ/a_k. A search of `manuscript/` finds the allowance only in the note and the parent's pointer. The middle cell whose spacing a_ℓ enters (A) is named (parent l.79, note l.31) but not defined in the manuscript. Judged by the manuscript, (A) has no displayed source. The note discloses this (l.196–199), but its list of what remains open does not carry it.

Per the note (l.196–198) and the source (L6), (A) is a field of the funded witness, which the chapter already imports (gallery l.6–7, l.19–22). It is therefore a different kind of gap from (B), for which the note locates no derivation (l.215–219).

See L6 in lean-correspondence.md for the source field of (A) and the related `charge` field (N18).

Suggested repair: list (A) among the inputs the text does not supply (a field of the funded witness to be displayed in the gallery section), together with the level-bound property of M1, or say in the Status paragraph that (A) is assumed here and not supplied by the text (l.47 and l.196–198 call it a property of the funded witness, but the gallery does not display it). #374 asks for (A) to be exported from the funded chart; the list can point there. If the trace witness's `charge` field proves to be item 2 (N18), treat (A) and item 2 consistently.

Affects: Status paragraph only.

### M4. The step from T_n ≤ I_k to the bound omits its premise (Should)

Class: status description incomplete. Read alone, the implication at l.177–179 omits a premise; read with the stage ticket as rank-root's T_M under that section's suppositions, it is valid.
Where: l.177–179; Status l.199–202 ("the computation just given", l.201); open list l.207–211.

The right side of `eq:rank-root` (rank-root l.221–224) is exp{P_R(X) − 4D log g/q}/a^{|I|}. Bounding it by e^{I_k}/a^{|I|} from T_n ≤ I_k needs exactly P_R(X) − 4D log g/q ≤ T_n. The harmonic term is nonnegative (g = β^{-1/2} ≤ θ ≤ 1, rank-root l.116, l.122, so β ≥ 1) and cannot be dropped. Rank-root establishes this premise for its T_M (l.253–258) by the following route:

1. β ≤ 4β̂_m at an output level m, giving −4D log g = 2D log β ≤ 8Dβ̂_m, and 8Dβ̂_m/q ≤ 1, which the source has only "eventually" (l.227–233);
2. the same clip and row bound A as the clock stage, the suppositions θ_R ≤ θ_clock, Λ ≤ Λ_clock, δ ≤ 1 (l.233–238), the late-scale purchases β̂_m θ_clock³ ≤ 1, β̂_m θ_clock⁴ ≤ 1, Λ_clock θ_clock² ≤ 1 (l.239–244), and β ≤ 4β̂_m again; these give r ≤ 1+8A+1 (l.245–249), and with X ≤ 1+M, P_R(X)+1 ≤ T_M.

Recomputation (`evidence/obj_ticket_check.py`): without (1) the implication fails (q = 1, β = 10⁶ gives LHS − T_M = +200.05). Under all of (1)–(2), 108,489 admissible draws (of 200,000 generated) give max LHS − T_M = −2.28. Dropping only δ ≤ 1 also permits failure (δ = 20 with all other conditions met, A = 1, β = 4, β̂ = 1, θ_R = θ_clock = 0.5, q = 10⁹, X = 1+M, Λ = 0: LHS − T_M = +20.5); the script's single test point (r = 5) does not test this. The list is the source's sufficient route; necessity of the other items individually was not tested. The condition that k lie on a constant-profile interval (rank-root l.260–261) belongs to buying T_M ≤ I_k, not to this implication. β b(g) = (N_𝒜/2)(c_dir + A²) is an identity (β g² = 1). X ≤ 1+M is already among the note's stated inputs. The harmonic threshold is eventual in the clock's output scale, not stated as a threshold in k; absorbing it into K_B(d) is one possible repair, not established here (N6).

Open item 1 asks for a lawful representation satisfying the hypotheses of `sec:rank-root-normalization`. Rank-root l.114–117 defines a lawful representation (gauge invariance, nonnegative density, θ ≤ 1, clip constants); the suppositions of l.233–238 are introduced separately, and (1) and the late-scale purchases are stated as facts or purchases of the clock, not as hypotheses on the representation. So item 1 covers the representation-side suppositions only on a broad reading. It does not name (1) or the clock-side purchases, which the section states as facts or purchases of the clock at an output level m, not as hypotheses on the representation.

For fairness: rank-root itself uses the same short form at l.265–267, with the conditions in its preceding lines, and `actual-rank-purchases.tex` l.162–163 uses a similar shorthand. The note lifts the sentence out of that context.

Lean: see L12 (the source's `bank` hypothesis reads, as text, as this premise).

Suggested repair: at l.177–179 state the premise (the stage ticket bounds P_R(X) plus the harmonic correction, as in rank-root under its clock conditions), add those conditions, with the level at which the eventual one is taken, to the open list, and revise "the computation just given" (l.201) accordingly.

Affects: the supply and Status paragraphs only. The proposition assumes (B) and is not affected; the final arithmetic is correct (C9).

### M5. The allarity route is conditional on more than the step purchases (Minor)

Class: status description incomplete (expository: "conditional on" is not "only on", and l.215–219 concerns the first unsupported implication).
Where: l.184–190; l.215–219.

Besides `eq:allarity-step-purchases`–`eq:allarity-step-small` (allarity l.219–223), the route assumes the one-step compiler outputs (remainder price (α+1)z, principal incidence price H^{-2}, forced price G_i², per-step discrepancy y; allarity l.211–218), the terminal-source purchase (l.206–209), the step-count purchase (α+2)^{k−l} ≤ H (l.238–239), and completed propagation to the selected output torus with exactly q_0 sites and L, ℓ ≤ 1 there (l.328–333). The section says itself (l.356–363) that it asserts none of these without their purchases.

Suggested repair: list these inputs at l.188–190, or say that the later links are hypotheses too and point to the issues that own them. Whether #375/#376 own exactly this list was not checked (N7).

### M6. "Arity cap" names d+2 in the note and l = d in the gallery (Minor)

Class: wording or notation. Where: l.25, l.139; l.129 sets the cost index l = i, which the gallery identifies with the arity cap, so l.139 gives i+2 the name the gallery gives to i.

Gallery l.34–35 bounds l by trays(d); l.46 states the short-test estimate for arity at most l; l.50–51 takes l = d so that chart cutoff, arity cap and grade cutoff agree; l.142 refers to the available arity cap; l.166 has arity n ≤ d. trays(d) occurs once in `manuscript/` (gallery l.35) and is never given a value. The lemmas and the proposition use n only through μ_k^{-1/(16n)} and ε^{-16n} and hold for every n ≥ 1. n matters in the supply paragraph, where M = n must be an admissible marker allowance (rank-root l.211; allarity l.193, l.346–350); since the marker subsets are the nonempty s ⊆ {0,1}, d+2 ≥ 2 is admissible. The value d+2 is right and is the source's (L11). (Rank-root l.276 uses M = 2 for the rank detectors; a larger M only weakens the budget, so there is no conflict.)

Suggested repair: call n the marker allowance M = trays(d) = d+2 at grade d (the note already says "marker allowance" at l.170), define trays(d) where the gallery introduces it, and keep "arity cap" for l.

### M7. Two quantifier wordings (Minor)

(i) l.122–123: K(d,ε) is the least level "beyond which" the conditions hold; the proof uses them at k_i = K (l.142–146), so "beyond" must be inclusive. `common-scale-selection.tex` l.293–296 uses the same inclusive convention. Optional wording: the least K such that they hold for every k ≥ K. μ_k is not assumed monotone, so this form, not "at which", is the right one.
(ii) l.127–133 against parent l.99: the hypothesis is at one index i, while (G3) is a statement for every i. The proposition should take the hypothesis for every i, or conclude the index-i instance of (G3). The proof, which fixes i, proves either form unchanged.

### M8. q is used for two objects (Minor)

l.42 (q = ρ_m(x), as in parent l.85); l.176, l.200, l.208 (a^{q|I|}, q the cell count); l.184 has a^{q_0|I|} for the same price. Rank-root uses q for the cell count (l.206); allarity uses q_0 for the output-torus site count (l.297, l.329) and q for a tolerance exponent (l.196). Suggested repair: use q_0 (or another letter) for the cell count in the supply and Status paragraphs.

### M9. n has three meanings along the `\input` chain (Minor, optional)

Parent l.302 (n points of a configuration), parent l.248 (the moment power in (D*D)^n), note l.25 (n = d+2). No error results.

### C12. Observation (not a defect)

(A) is used only at the selected level (l.89–91 through the lemma; l.142–144). Stating it for k ≥ K_A(d) and adding K_A to K(d,ε) would cost nothing and would match a producer that supplies witnesses only at large levels (gallery l.19–20).

## Required changes and remaining uncertainty

Required: M1 (support the "Moreover" assertion from stated facts or state the level-bound property in the gallery section; adjust the Status sentence at l.194–195), M2 (identify w_i with w, with (G4) required at that depth, or, for the chart selected at index i, state (B) at w_i).
Should: M3 (list (A) among the open inputs), M4 (state the premise of l.177–179 and its conditions).
Minor: M5–M9.

Not checked:

- N1. Whether (A) and (B) hold. They are the proposition's hypotheses; this review checks the deduction from them.
- N2. The definition of the root test. The parent refers to `sec:actual-phase-detector-moments` (parent l.95–98); that section uses ‖·‖_{root,b} at a root-test depth b ≤ k (`actual-phase-detector-moments.tex` l.24–38) but does not define it, and the definition (`centered-construction.tex` l.125) was not checked against the note.
- N3. `sec:three-panel-weak-comparison`, read in part.
- N4. The one-step chart theorem's proof: the manuscript states its output (gallery l.33–47) and attributes its estimates to `sec:three-panel-weak-comparison` (gallery l.47–48, l.103–107); no assembled proof was found by targeted searches (N20). The upstream sections behind the allarity hypotheses (Gaussian reader, marked compiler), and the geometric hypotheses at allarity l.16–19 and l.56–61, which M5's list does not include. The proofs of `eq:rank-root` and `eq:allarity-density-envelope` (their statements and the cited lines only were checked).
- N5. Whether the funded chart witness carries a root depth at which (G4) holds, and whether (G4) holds.
- N6. Whether the clock-side conditions of M4 hold for the funded witnesses, and how the output level m relates to the chart level k (so whether the harmonic threshold can be absorbed into K_B(d)).
- N7. Whether #375 and #376 own exactly the allarity inputs of M5 (the coordinator's split comment and the issue texts were read from local copies, N22; M5's list was not matched against them item by item).
- N8. The rendered PDF; the manuscript build was not run.
- N20. Manuscript searches were targeted searches, not an exhaustive read of the whole manuscript.
- N22. Issue texts #372–#378 and their comments were read from local copies saved on 2026-11-14; the live state was rechecked at 11:37 UTC before submission.
- N23. The review covers only the hashed bytes (targets re-hashed at 11:37 UTC, unchanged).

N9–N19 concern the Lean correspondence and are listed in lean-correspondence.md.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
