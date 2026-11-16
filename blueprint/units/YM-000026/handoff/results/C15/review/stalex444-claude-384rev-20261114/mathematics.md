# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded renewed review of the #384 revision of the #373 note, for #372.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): three independent reads of the revision (a row-by-row audit of the author's response table; a fresh read of the revised note and its cited sections, not starting from #383; a hunk-by-hunk sweep of the diff `bdd348cd..6426c0be`), and, for each finding the reads raised other than remarks and typos, an independent re-derivation and an author's-advocate refutation, consolidated against the source lines. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (`trace-rounded-receipt.tex` `42ccb549…`, `trace-rounded-comparison.tex` `5adee4f5…`, author README `6760e017…`). The unit fingerprint does not cover these files (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-rounded-receipt.tex` (`subsec:trace-rounded-receipt`, `lem:trace-receipt-width`, `lem:trace-receipt-cost`, `prop:trace-rounded-receipt`, `eq:trace-receipt-allowance`, `eq:trace-receipt-budget`, `eq:trace-receipt-level`, the paragraphs "Supply of the level budget" and "Status"); the #384 change to `manuscript/existence/trace-rounded-comparison.tex` (l.347–351); the addendum to the author record (README l.55–76). Interface passages read: `trace-firesky-gallery.tex` (whole), `rank-root-normalization.tex` (whole, including `subsec:rank-root-output-ticket`), `allarity-marked-propagation.tex` (l.185–363), `trace-clock-cap.tex` (l.1–140), the #374 audit report `results/C15/endpoints/hairer-claude-374-20261114/README.md` (merged by PR #385 at `634ef293`; read for the points cited at M12, L6, open item 2(b) and N14 only), and the #378 author record `results/C13/author/hairer-claude-378-20261114/README.md` (l.33–43, "Relation to #384" and "Uncertainties"). Neither target `.tex` file is in the unit's manuscript list.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at `codex/existence-monograph` `3166276d` (= `6426c0be` for the three revised files).
- Review task and PR: #372; reviewed PR #384 (commit `6865f2b3`, merged at `6426c0be`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies ((A), (B), and (G4) at the root depth w); no required change. The "changes requested" of #383 is resolved: M1 and M2 (required) and M3 and M4 (recommended) are addressed. No false statement and no wrong step was found in the revised note. New: M10 and M11 (Minor, introduced by the revision); M12 (a follow-up at the head, not a defect of #384).

Line numbers are those of `trace-rounded-receipt.tex` at `3166276d` unless another file is named. "Parent" is `trace-rounded-comparison.tex`, "gallery" is `trace-firesky-gallery.tex`, "rank-root" is `rank-root-normalization.tex`, "allarity" is `allarity-marked-propagation.tex`, all at `3166276d`; gallery and allarity are unchanged since `bdd348cd`, and rank-root changed only by the subsection appended after its l.280 (commit `413e82ad`). Labels M1–M9, C1–C12 and N1–N20, N22, N23 are those of #383. Recomputations are in `evidence/` (`response_audit_checks.py`, `fresh_read_checks.py`, with their outputs), re-run on 2026-11-14 with `python3 -I`, exit 0, outputs identical to the saved ones.

## 1. Response to #383, finding by finding

The author's response table (author README l.61–74) has rows for M1–M9, L1, C12 and L15. Each row was compared with the revised text; L1, L12 and L15 are treated in detail in lean-correspondence.md.

| Finding | Asked in #383 | Where addressed (`3166276d`) | Status | How checked |
|---|---|---|---|---|
| M1 (Required) | Support the "Moreover" assertion from stated facts (the "recall" sentence cited a late-point property the gallery does not state); adjust the Status sentence | Statement l.154–157; proof l.176–197; Status l.257–258 | Addressed | The "recall" sentence is gone. The proof now calls the producer with θ' = min(θ, min_{j<K} a_j) and uses g_b(k) ≥ a_k; every fact used about the producer is stated in the gallery; K is chart-independent by (A) and (B) as stated (l.75–79), and μ_k = m_k by (G1). Re-derived step by step in §2 (C13). Status now says the arrangement of the selected levels is proved, which is accurate. |
| M2 (Required) | Identify w_i of (G4) with the chart's root depth w, with (G4) required there | Gloss l.38–41; proposition l.145–147; proof l.163–165, l.172; open item 3 l.287–289 | Addressed | This is the first repair #383 suggested. Re-derived in §2 (C14). Parent (G4) (l.70–71) reads "There is a root depth $w_i\le k_i$", so requiring (G4) at w (l.147) also requires w ≤ k_i, the bound the consumer uses (parent l.233–234); the note's own proof never uses it. |
| M3 (Should) | List (A) among the open inputs | Open item 1 l.264–269; parent l.350–351 | Addressed | (A) is item 1, with the undefined middle cell and the threshold K_A(d) disclosed. The parent now "lists the inputs that remain open there". The level-bound property that M3 also proposed listing is now proved (M1). |
| M4 (Should) | State the premise of the step from T ≤ I_k and its clock conditions | Supply paragraph l.208–227; Status l.258–261; open items 2(b), 2(c) l.279–283 | Addressed | The premise P_R(X) − 4D log g/q_0 ≤ T_M is displayed (l.214). Each condition was compared with rank-root l.225–244 (C15). The constant-profile condition of rank-root l.260–261 belongs to buying T_M ≤ I_k, item 2(c), as #383 M4 said. |
| M5 (Minor) | List the further inputs of the allarity route | l.233–252 | Addressed | All five groups #383 named are listed, each matched with allarity (C16). The bullet list imports allarity's letters (M11). |
| M6 (Minor) | Do not call d+2 the "arity cap" | l.26–32; admissibility l.228–229 | Addressed, with remark | M is now the marker allowance, and l.31–32 says it is not the gallery's arity cap l. The value d+2 is unchanged and is the source's (#383 L11; the author record l.47 cites `abbrev trays (d) := d+2`). Remark: the part of #383's suggestion that would give trays(d) a value in the gallery was not taken; the response table says "The gallery is not edited." trays(d) still occurs only at gallery l.35, without a value. Non-blocking: the deduction uses only M ≥ 2. |
| M7 (Minor) | (i) inclusive threshold; (ii) hypothesis for every i | (i) l.139–141; (ii) l.147, l.174 | Addressed | (i) K(d,ε) is "the least $K$ such that they hold for every $k\ge K$" (l.139–140), the wording #383 proposed; the least such K exists because each of the four conditions is cofinite. A non-monotone example (μ = 1, 40, 1, 1, 50, …) gives K = 4, not 1 (`fresh_read_checks.out`). (ii) The hypothesis is for every index i, and the proof ends with i arbitrary. |
| M8 (Minor) | Use another letter for the cell count | l.202–204; q_0 throughout | Addressed, with remark | No bare q remains in the note (search at `3166276d`). The response row says "q appears only through ρ_m(x)"; more exactly, q no longer appears and the configuration is written ρ_m(x) (l.50–51). Remark: through the `\input` chain the parent writes q = ρ_{m_i}(x) with points q_0, q_1 (parent l.85–88), so q_0 now has two meanings along the chain. The note's q_0 is allarity's (allarity l.329), and the choice follows #383's own M8 suggestion. Optional. |
| M9 (Minor, optional) | n had three meanings along the `\input` chain | Whole note | Addressed, with remark | No n remains in the note. Remark: M now also names the parent's M(w) (parent l.138) and M_{αβ} (parent l.286), and parent l.349 uses μ_k^{−1/(16M)} before the note defines M (l.27). No error results. Optional: one clause in the parent Status naming M as the marker allowance of the next subsection. |
| L1 (Should) | State (B) along the selected curve, or derive the uniform form | l.55–56, l.75–84; open item 2 l.270–272 | Addressed, with remark | See lean-correspondence.md. The note states that its thresholds are fixed before the chart is chosen and that this chart-uniform form is what the second assertion's argument uses. Re-derived: a per-curve threshold suffices for the first assertion, but the threshold argument of l.181 needs K before the producer is called. (B) remains stronger than `lava_vSky` and is now an explicit open input (#383 N14 unchanged). |
| L12 (suggestion) | Name the bank premise and the level at which the ticket is taken | Premise l.213–224 | Partly addressed | The premise and its conditions are stated (through M4). The level is not: "output level $m$" (l.216) is not identified with the root depth w, and item 2(c) (l.283) does not say at which profile T_M is computed. No row in the response table. At `3166276d`, rank-root l.317–320 and l.375–376 state it (M12). |
| L15 (Minor, author record) | Record that the μ_k ≥ 1 filter of `open_readSky` is unused | Author README l.74 | Addressed | Recorded in the addendum; the original row (l.27) is left as written (see L19). |
| C12 (observation) | (A) for k ≥ K_A(d); K_A in K(d,ε) | l.58–63, l.87, l.103, l.136, l.165, l.268–269 | Addressed | K_A enters (A), the width lemma, K(d,ε) and the proposition's proof. Because K_A enters K, the M1 threshold argument also covers (A). The width lemma's statement lost "Assume (A)." in the process (M10). |

## 2. Re-derivation of the new arguments

### C13. The reduced-threshold proof of the "Moreover" assertion (l.176–197)

1. The producer's output, as stated in the gallery: the chart at level k and base arc b > 5 has exact radius equal to the clock gap g_b(k) = a_k μ_k^b (l.177–180). Gallery l.38–40 says "the requested scale equals the exact clock gap" at the chart's level (named i there) and base arc b, with 5 < b; gallery l.53–56 gives g_b(k) = a_k m_k^b with a_k > 0 and m_k ≥ 1. Correct.
2. The producer accepts every threshold θ > 0 (l.180): the hypothesis of `lem:ex-lattice-firesky-selection` (gallery l.82–85) is stated for every θ > 0, with exact radius s_n < θ. Correct.
3. K = K(i,(i+1)^{-1}) is determined before the producer is called (l.181–182): its four conditions involve K_A(i), K_B(i), which do not depend on the chart (l.75–77), and the monitor μ_k, which does not depend on the chart. Correct.
4. g_b(k) ≥ a_k (l.182–183), since μ_k ≥ 1 (l.22) and b > 0. Correct.
5. θ' = min(θ, min_{j<K} a_j) > 0, with θ' = θ when K = 0 (l.186–189): a minimum of finitely many positive numbers. Correct.
6. If k < K, then g_b(k) ≥ a_k ≥ θ', contradicting g_b(k) < θ' (l.189–192). Correct; hence k ≥ K, which is `eq:trace-receipt-level`.
7. Since θ' ≤ θ, the output also meets the threshold the selection lemma's proof uses at that step (gallery l.95–99: threshold 1 at d = 0, s_{n_{d−1}} afterwards), and its other properties do not depend on θ (l.192–195). So s_{n_0} < 1, strict decrease of s_{n_d}, n_d > n_{d−1} and i_d ≥ d all hold, and the conclusions of the lemma (gallery l.86–92) hold for the resulting selection. Read with l.193–194 ("required in the proof of"), "applies verbatim with the reduced thresholds" (l.195–196) means the lemma's proof run with the smaller thresholds; the lemma's hypothesis "every $\theta>0$" (gallery l.83) is unchanged. Correct.
8. No step uses (G3) (C10 still holds).

Recomputation: `response_audit_checks.py`, 20,000 random draws of (a, μ ≥ 1, θ, K), 720,471 (level, b > 5) cases: 0 returned levels below K with θ', against 8,659 below K with the unreduced θ (a numerical check of the step, not part of its proof). `fresh_read_checks.py`: randomized non-monotone clocks with K ∈ {0, 1, 2, 5, 13}: no counterexample. Over the release definitions: `probe_reduced_threshold` (lean-correspondence.md, L5).

The argument needs K before the call, hence the chart-uniform (B); the note says so (l.79–84). See L1.

### C14. The identification of the depths (l.145–147, l.163–165)

1. The proposition sets w_i := the root depth w of the chart selected at index i and says "(G4) is required at that depth" (l.147). (G4) (parent l.70–74) introduces w_i existentially, with w_i ≤ k_i; the identification fixes the witness, and requiring (G4) at w includes w ≤ k_i. Correct.
2. The proof uses it at l.163–165: the root test of (G3) at index i is taken at w_i = w, and `lem:trace-receipt-cost` gives the bounds at the root depth w (l.117), hence at depth w_i (l.172), as (G3) states them (parent l.95–98). Correct.
3. The consumer (parent l.233–241) uses (G3) and (G4) at the same w_i; with the identification both are at w, given open item 3. Correct.
4. The gloss (l.38–41) ties w to the root tests of the chart's comparison receipt and to its chamber condition. It is consistent with rank-root l.375–376 (added after #384), "the output level $w(k)$ is its root depth".

No defect.

### C15. The premise of the supply paragraph (l.208–227)

Compared with rank-root l.225–258 (unchanged by #384): β ≤ 4β̂_m (rank-root l.228); 8Dβ̂_m/q ≤ 1 eventually (l.232); the same clip and row bound A, with θ_R ≤ θ_clock, Λ ≤ Λ_clock, δ ≤ 1 (l.233–238); the three late-scale purchases (l.239–244). All appear at l.217–224, with X ≤ 1+M at l.209. The right side quoted at l.211 matches `eq:rank-root` (rank-root l.221–224). The harmonic term is nonnegative because g ≤ θ ≤ 1 (rank-root l.116, l.122), so "must be paid for" (l.212) is right. Arithmetic: I_k = log μ_k/(16M), a = e^{2I_k} = μ_k^{1/(8M)}, e^{I_k}/a = e^{−I_k} = μ_k^{−1/(16M)}, recomputed symbolically (difference 0, `response_audit_checks.out`) and to 30–40 digits for M ∈ {2, 3, 10, 52} (a = μ^{1/(8M)} to relative 10^{-30}) (`fresh_read_checks.out`). "since $M\ge2$, they are admissible" (l.228–229) follows from rank-root l.211–212. Correct.

### C16. The allarity inputs (l.233–252)

Each bullet was matched with allarity: step purchases (allarity l.219–223); compiler outputs (α+1)z, H^{−2}, G_i², discrepancy y (l.211–218); terminal-source purchase giving d_0 and forced price at most G_k (l.206–209); step count (α+2)^{k−l} ≤ H (l.238–239); propagation to the output torus with exactly q_0 sites and L, ℓ ≤ 1 (l.328–333); the link u = M, ω = a (l.346–350). Faithful. The parameter conditions of the recurrence (u ≥ max(2, n), H > 1, q ≥ 6, α ≥ 0; allarity l.193–197) and the constant weight remain implicit; they are carried by "with $u=M$" and "at the constant marker weight" (l.235–236). Not a defect.

## 3. New findings

### M10. The width lemma no longer states (A) (Minor)

Class: statement wording; introduced by the revision (a side effect of the C12 change).
Where: l.86–92 (statement); l.103 (proof).

At `bdd348cd` the lemma began "Assume (A)." At `3166276d` it begins "Let $R>0$. Consider a chart at a level $k\ge K_A$" (l.87), with no assumption. K_A is introduced only inside (A) (l.58), and the proof invokes (A)'s inequality `eq:trace-receipt-allowance` "because $k\ge K_A$" (l.103). The cost lemma keeps "Assume (B), and let $0<\varepsilon\le1$." (l.113). Also, l.87 says "a chart" where (A) speaks of charts of the family (l.58–59). The proposition assumes (A) (l.145) and checks k_i ≥ K_A(i) (l.165), and the overview says the width clause uses only (A) (l.12–13); so no step of the proposition or of (G3) is affected. The lemma does not stand on its own.

Suggested repair: "Assume (A). Let $R>0$. Consider a chart of the family at a level $k\ge K_A$ …".

### M11. Letters of other sections reused in the supply paragraph (Minor)

Class: notation; introduced by the revision; same class as M8.
Where: l.216–223 and l.240–251, against l.35, l.38, l.149, l.162 and the proofs at l.86–110 and l.159–174.

- m: the note fixes m = μ_k^b (l.35; m = m_i at l.162). The new text reads "all at the output level $m$ of the clock" (l.216) and writes β̂_m (l.217–223); there m is the clock's integer output level (rank-root l.227–228), which rank-root's new subsection calls w(k) (rank-root l.319, l.375–376).
- l: "the step-count purchase $(\alpha+2)^{k-l}\le H$" (l.249) uses allarity's intermediate level l (allarity l.192–194); in the note l is the cost index l = i (l.149), the gallery's arity cap l (gallery l.50–51). The k of $G_k$ and $(\alpha+2)^{k-l}$ (l.248–249) is allarity's top comparison depth, where H = 𝓜_k (allarity l.247); the link ω = a (allarity l.346–349; note l.206, l.236) makes it the chart level k, so k does not clash.
- ℓ: "$L,\ell\le1$" (l.251) is allarity's per-mark regular incidence price (allarity l.305–307, l.332), against a_ℓ (l.38).
- i, y, z: G_i² (l.244), the discrepancy y (l.245) and (α+1)z (l.243) are allarity's; in the note i is the selection index (l.145–174), y = m^{−1}t (l.89) and z the grid configuration (l.97). These clash only weakly, since the note binds them locally.

The text attributes the lists to their sections ("of the clock", l.216; "That derivation assumes", l.237) but does not say that the letters are those sections' letters, as l.37 does for g_b(k) ("in the notation of"). #383's M4 and M5 used the same bare letters. No inference is affected.

Suggested repair: one sentence saying these conditions are stated in the notation of `sec:rank-root-normalization` and `sec:allarity-marked-propagation`, or rename the output level (for example w, as rank-root now does, which would also state the level L12 asks for) and the allarity levels.

### M12. The open list at the head and `prop:rank-root-output-ticket` (follow-up)

Class: status description; not a defect of #384 as merged.
Where: open items 1 and 2(b), 2(c) (l.264–283); rank-root l.282–385 at `3166276d`.

Commit `413e82ad` (PR #386, for #378) was written from `bdd348cd` in parallel with #384 (it does not descend from `6865f2b3`) and merged at `3166276d` after `6426c0be`. It appends `subsec:rank-root-output-ticket` to rank-root. Its `prop:rank-root-output-ticket` (rank-root l.307–331), for levels w(k) ≤ k with w(k) → ∞, gives K_M such that for k ≥ K_M:

- item 1: T_M(π_{J(w(k))}) ≤ I_k, which is the note's open item 2(c) at the output level. It requires the requests F_{M,i} of `eq:rank-root-ticket-requests` to be included in the countable family of `eq:common-countable-payment` (rank-root l.309–313); the proposition directs this; at `3166276d` no other manuscript file lists them, and the #378 author record (README l.43) leaves to the owner of `sec:public-run-binding` whether they must be listed there;
- item 2: the premise at the output level w(k), for every period, which supplies the harmonic condition and the late-scale purchases of the note's item 2(b) with a threshold in k.

Rank-root l.375–383 identifies the output level with the root depth and derives w(k) → ∞ from a bracket property, J(k) − 1 ≤ J(j) for w(k) ≤ j ≤ k; "This bracket property is part of the chart's scale allowance." (l.380–381), and is an input. That property is not the note's (A), which exports only the dilation inequality (l.60–62); the #374 audit report (its README l.57, l.156(i)) already lists it beside the dilation inequality among the allowance fields the gallery section does not state. The representation-side suppositions β ≤ 4β̂_{w(k)}, θ_R ≤ θ_clock, Λ ≤ Λ_clock and δ ≤ 1 remain hypotheses of item 2 (rank-root l.321–324) and are assigned, with the coefficient price, to the output transport (rank-root l.383–385), so they belong with the note's item 2(a), although the note lists them in the supply paragraph to which item 2(b) refers. The #378 author record maps the note's items 2(b) and 2(c) to items 2 and 1 of the proposition and names the bracket property as a remaining input (its README l.35–38); the point here is that the note's open list does not yet reflect this.

Reviewer's reasoning, not proved in the text: the proposition is stated for one function w(k). The ticket threshold K'_M uses only w(k) ≤ k (rank-root l.343–344). The premise threshold becomes chart-independent if the bracket holds for every chart at level k (choose K'' with J(k) − 1 > J(m' − 1); monotonicity of J gives w ≥ m'), which gives the chart-uniform K_B that (B) needs. The release does this with the `bracket` field (lean-correspondence.md, `probe_bank_at_root_depth`).

So, for #384 as written, its open list is accurate and complete: the level property of #383 M1 is correctly absent because it is now proved. At `3166276d`, if the proposition holds (its proof was not checked, N24), the list overstates what is open in 2(b) and 2(c); it does not name the bracket property or the inclusion of the ticket requests.

Suggested repair, for the final combination on #372: cite `prop:rank-root-output-ticket` at items 2(b) and 2(c), keeping open the inclusion of the ticket requests and the representation-side suppositions (which rank-root l.383–385 assigns, with the coefficient price, to the output transport, that is, to item 2(a)); add the bracket property to item 1 beside (A).

## 4. Earlier checked items at the new line numbers, and other changes

| #383 item | Now at | Still holds? |
|---|---|---|
| C1 overview | l.7–19 | Yes; "isolate" became "list" (l.18). |
| C2 setup, r = g_b(k), fitness, Φ identities | l.21–53 | Yes; reflow, M renamed, w gloss extended, q replaced by "the rounded configuration $\rho_m(x)$". Identities l.52–53 unchanged. |
| C3 (A), (B), the maximum | l.55–84 | Yes; (A) now carries K_A, its two forms still equivalent since a_k > 0; the maximum is relevant to K_B only. Chart-uniformity is stated, and assumed, not derived. |
| C4 width lemma | l.86–110 | Yes; the proof is unchanged apart from "which holds because $k\ge K_A$" (l.103); sharp at r = a_ℓ/μ_k², μ_k² = 8R. Statement wording: M10. |
| C5 cost lemma | l.112–132 | Yes; n renamed M, depth phrase added. |
| C6 K(d,ε) | l.134–141 | Yes; four conditions, inclusive form. |
| C7 first assertion | l.143–174 | Yes; the M2 and M7(ii) provisos are discharged in the text. Edge cases recomputed with M = i+2: log₁₀ μ ≥ 1.45, 14.45, 30.54, 48.16, 67.10 for i = 0…4, the same values as #383 (at i = 0 the width condition binds). |
| C8 finite-intersection step | removed | Replaced by the argument of C13. |
| C9 supply arithmetic | l.200–236 | Yes (C15; the allarity link, now l.233–236, in C16). |
| C10 no circularity | whole note | Yes; the new argument uses only the producer's output and the selection lemma. |
| C11 open list uniformity | l.270–286 | Yes; the uniformity sentence (l.285–286) keeps the threshold-first order. |

Changes beyond the findings: the diff `bdd348cd..6426c0be` has 8 hunks (one in the author README, one in the parent at l.347–351, six in the note). Every hunk traces to a finding of #383 (M1–M8, L1, C12, the M6/M9 rename, or, in the README, the response table including L15). Nothing in the diff is untraceable. In the parent only the Status sentence changed; (G1)–(G4), fitness and the consumer (parent l.228–242) are byte-unchanged. The diff (saved locally, SHA-256 `97d4d53b…`) contains manuscript text and is not included in `evidence/`.

## Required changes and remaining uncertainty

Required: none. Should: none. Minor: M10, M11 (introduced by the revision). Follow-up at the head: M12. Optional remarks: M6, M8, M9 (§1); item 3 could say "including $w\le k_i$".

Not checked:

- N1 (unchanged). Whether (A) and (B) hold.
- N5 (unchanged). Whether (G4) holds at the chart's root depth.
- N6 (in part superseded). The harmonic and late-scale conditions of item 2(b) are now the subject of `prop:rank-root-output-ticket`; whether the bracket property and the representation-side suppositions hold for the funded witnesses was not checked.
- N2–N4, N7 (unchanged). The root-test definition; `sec:three-panel-weak-comparison`; the one-step chart theorem's proof and the upstream sections behind the allarity hypotheses; ownership of the allarity inputs by #375/#376.
- N24. The proof of `prop:rank-root-output-ticket` (the subsection was read; only its statement, the closing paragraph l.375–385 and the arithmetic of the ticket step (l.333–350) were checked; the premise step's threshold structure (m', K'', l.362–367), used in M12's reasoning, was not checked), and whether the requests `eq:rank-root-ticket-requests` are included in the final countable family.
- N25. The manuscript build: the author's report of `latexmk` exit 0, 1039 pages, and inspection of pp. 1011–1013 (author README l.76) was not reproduced; no TeX engine was run. The +5 pages against the earlier 1034 (README l.51) is consistent with sections input before the note growing between `83eecbca` and `bdd348cd`.
- N26. Allarity outside l.185–363 was not read for this review.
- N27. Issue and PR texts other than the comments on #372 were not re-read for this review. The #374 audit report (PR #385, merged at `634ef293` between `6426c0be` and `3166276d`; textual and unreviewed) concerns the same open list; it is cited where it states the same points (M12; lean-correspondence L6, open item 2(b) and N14), and its other content and its claims against the source were not reviewed. Its SHA-256 at `3166276d` is `b2a8a300…`; it is not in hashes.json.
- N20, N23 (as before). Manuscript searches were targeted; the review covers only the hashed bytes.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
