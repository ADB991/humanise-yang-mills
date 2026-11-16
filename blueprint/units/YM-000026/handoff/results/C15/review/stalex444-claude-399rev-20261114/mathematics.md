# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded renewed review of the #399 revision of the #377 change, for #337.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): two independent reads of the revision (a row-by-row audit of the author's response table; a fresh read of the revised file and a hunk-by-hunk sweep of the diff `3166276d..817546b7`, not starting from #388), and, for each point these reads and the Lean read raised, one independent re-derivation and one author's-advocate refutation, consolidated against the source lines. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (`trace-scribe-producer.tex` `09bd6420…`, author README `6e75260d…`, both at `817546b7`). The scribe file is in the YM-000026 manuscript list, but #399 is not merged, so no unit fingerprint at the base describes the revised bytes (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-scribe-producer.tex` at `817546b7` (l.62–66; l.276–283; the identification paragraph l.301–334; `lem:ex-lattice-scribe-normalization-ratio` and its proof, l.336–381); the addendum to the author record `results/C15/author/hairer-claude-337F1-20261114/README.md` (l.36–47). Interface passages read: `trace-branch-moments.tex` (YM-000034; l.1–20, l.80–165, l.488–560, l.660–670), `trace-clock-cap.tex` (l.1–30), `trace-asymptotic.tex` (l.110–130), `blueprint/units/YM-000034/correspondence.md` (l.138–150). Located by `git grep` only: `trace-crown-buffer.tex` l.110, `trace-coffer-supplier.tex` l.359, `trace-bill-prices.tex` l.99, `all-grade-free-detectors.tex` l.24–26.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at commit `817546b7` (draft PR #399, on `codex/existence-monograph` @ `3166276d`).
- Review task and PR: #337; reviewed PR #399 (commit `817546b7`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies; no required change. M1–M5 of #388 are addressed as the response table says. Every changed line of `trace-scribe-producer.tex` was checked and is correct, and each row of the addendum matches the revised text; the revision introduces no false statement and no gap. No new finding requiring a change; one remark (M6).

The reviewed files are those of commit `817546b7`, the single commit of draft PR #399; they are not in the base branch, which at `3166276d` (the parent of `817546b7`) holds the files #388 reviewed. Line numbers are those of `trace-scribe-producer.tex` at `817546b7` unless another file is named. "Branch" is `trace-branch-moments.tex`, "record" is the author record, both at `817546b7` (the branch file is unchanged since `bdd348cd`). Labels M1–M5, C1–C15 and N1–N7 are those of #388 (PR #388, `results/C15/review/stalex444-claude-377rev-20261114/mathematics.md`), whose line numbers refer to the file at `bdd348cd` (byte-identical at `3166276d`); new items continue the numbering (M6, N15). The symbol census and the trace values are in `evidence/response_audit_399.py` and its output, run with `python3 -I`, exit 0.

## 1. Response to #388, finding by finding

The author's response table (record l.38–45) has rows for M1–M5 and L10. Each row was compared with the revised text; L10 is treated in lean-correspondence.md.

| Finding | Asked in #388 | Where addressed (`817546b7`) | Status | How checked |
|---|---|---|---|---|
| M1 (Should) | State the middle conclusion as an implication from 𝖯_i(Δ_i) → M_1, or add that limit to the hypotheses | Statement l.351–352; proof l.372–376 | Addressed | The lemma states the implication. The proof now opens the step with "if $\mathsf P_i(\Delta_i)\to M_1$, then" (l.373). Re-derived in §2. |
| M2 (Should) | Call q_i the arch scale at l.62, or list l.62 under "Not changed" | l.62–66 | Addressed | l.62 now reads "the selected arch scale at the summit level", identified with ζ(k_i) of the clock paragraph (l.705) and consistent with l.163–168 and l.249. No sentence of the file now calls q_i an effective coupling. The optional sub-item of M2 (old l.388–390, now l.400–402) is unchanged and not claimed by the table (§2). |
| M3 (Minor) | Rename the new λ_i | ϑ_i at l.279, 281, 312, 315, 316, 331, 334, 345, 363, 367, 368, 374, 378 | Addressed | Census: every occurrence of the ratio is now ϑ_i; λ_i occurs only at l.638–653, the scalar of g_i = λ_iR; ϑ did not occur in the file at `3166276d`. The clash with g_i = λ_iR is gone, as the table says. |
| M4 (Minor) | Cite λ_i → 1 at the operator-norm sentence or at the same-hypotheses sentence | l.278–281; l.329–331 | Addressed | Both places #388 named now cite ϑ_i → 1 of the lemma. The clause at l.278–281 is true and not circular (§2). |
| M5 (Minor, optional) | Say that the branch unit's clock β̂_k is the present β̂_k | Lemma l.343–345 | Addressed | The clause is placed in the lemma rather than in the identification paragraph. It is supported by the texts as far as #388 M5 found (§2); in the source both ratio statements use one clock term (lean-correspondence.md L6). |

## 2. Re-derivation of what changed

### The trace statement in implication form (l.351–352, l.372–376)

The trace is linear and continuous on the finite product of copies of 𝓕_4^0, and ϑ_i^{-1} → 1 (l.367). If 𝖯_i(Δ_i) → M_1, then tr 𝒫_i(Δ_i) = ϑ_i^{-1} tr 𝖯_i(Δ_i) → tr M_1. tr M_1 = tr M(w^+) = 4𝒪 by branch l.107 and l.112–113 (tr M(w) = 4(w_1+4w_2)𝒪 gives 0, 0, 4𝒪 at w^0, w^−, w^+; `evidence/response_audit_399.out`); "the trace formula of the branch unit" (l.376) is `eq:ex-branch-three-traces`, cited by label at l.326. The display l.348–355 is well formed and each implication has its hypothesis on the left. The preamble "for $Q_i\in\{L_i,\Omega_i,\Delta_i\}$ with reference" (l.346) quantifies the first and third implications; the middle one names Δ_i and M_1 itself. Downstream, l.434–436 derive the same limit from the field receipt 𝒫_i(Δ_i) → M_1 (l.396) and continuity of the trace, which is consistent with the implication form. Correct.

### The forward uses of ϑ_i → 1 (l.278–281, l.329–331)

The branch moment map is 𝖬_i = U_i^{-1}𝔠V_{k_i,ω_i} (branch l.136) with V_{k,c} = π(cϑ_k²A_k^{-1}) linear in c (branch l.132). The scribe's crown is q_i r_i⁴ = ϑ_i^{-1}ω_i (l.307–316), so the scribe's 𝖬_i is ϑ_i^{-1} times the branch map, as l.280–281 say, and with `eq:ex-branch-moment-input` (branch l.160–162) it tends to 𝖬_∞ exactly when ϑ_i → 1 is used. The same factor is what l.329–331 add to the finite-array argument. No circularity: the lemma's proof (l.358–380) uses the two ratio limits, positivity, k_i → ∞ and the identity 𝒫_i = ϑ_i^{-1}𝖯_i of l.314–315, and nothing from l.276–299; the clock derivation after l.722 does not use the lemma. Correct.

The symbol ϑ_i is first used at l.279 and is defined at l.312, in the identification paragraph; the lemma's statement uses it without defining it. This placement is the one #388 M4 offered ("or cite the lemma at l.274–275", lines of the earlier file, now l.277–281), and the clause states the role of ϑ_i where it is used.

### The clock sentence (l.343–345)

The lemma now says that β̂_j "is the same clock coupling in both statements" and that the branch unit and the section "use the hatted coupling of the one selected clock". This is the identification #388 M5 asked to be stated. The texts support it as #388 M5 found: the branch unit works on "one selected history" with the same chart (branch l.7–8), introduces β̂_k as the selected level's inverse-coupling clock (branch l.122–123) and calls it "The selected clock" (branch l.510); the scribe fixes one history and one scaling (l.8–9) and defines β̂_j as the selected run's rate (l.706–707; `trace-clock-cap.tex` l.15–17). Neither text states as an equation that the branch slope b equals κ (both call their constant the slope constant: branch l.506, scribe l.20) or that the mesh a_k equals 𝖺_k, and the identification of the clocks does not by itself give either; the lemma uses only the identification. Correct as a stated identification.

### l.62–66

q_i is now "the selected arch scale at the summit level", with the pointer to ζ(k_i) of the clock paragraph ("thus $q_i=\zeta(k_i)$", l.705; k_i the summit index, l.703) and to the lemma. Consistent with l.163–168 and l.249. The parenthesis says q_i is compared with the branch unit's coupling in the lemma; the ratio is defined at l.311–312 and its limit is the lemma's, which this describes fairly. After the revision the phrase "effective coupling" in the file names the branch unit's β_Z (l.64, l.252, l.308), apart from l.401–402. Correct.

The optional sub-item of #388 M2, l.400–402 (old l.388–390), is unchanged: the clock price's ratio "to the effective" / "coupling tends to zero along this scale" still does not name the quantity. With the other uses of the phrase now naming β_Z, β_Z is the natural reading; the sentence is true under it by the argument of #388 M2 (ρ_i is a subpower of z_i, q_i ≥ z_i/2, and ϑ_i → 1 by the lemma), and also if the phrase means z_i. #388 marked this optional and the response table does not claim it; it is not reopened.

### The rename

`evidence/response_audit_399.out`: \vartheta occurs at l.279, 281, 312, 315, 316, 331, 334, 345, 363, 367, 368, 374, 378, each the ratio β_Z(k_i)/q_i or its inverse; \lambda_i at l.638, 640, 644, 647, 648, 651, 653 only, each the scalar of g_i = λ_iR. The orientation is unchanged: q_i r_i⁴ = ϑ_i^{-1}ω_i. The superscripted λ^r family and Θ_T are untouched. Correct.

### Changes beyond the findings

The diff `3166276d..817546b7` has 7 hunks (one in the record, appended after l.34; six in the scribe file). Each traces to M1–M5, the rename, or, in the record, the response table. Nothing in the diff is untraceable. Every `\ref` and `\eqref` in the changed lines resolves (`lem:ex-lattice-scribe-normalization-ratio` at l.337, `eq:ex-lattice-scribe-clock-inputs` at l.720). The record body (l.1–34) is byte-unchanged and keeps the historical λ_i at l.17–19; the addendum's M3 row records the rename. The diff (SHA-256 `7c65330c…` of the `git diff 3166276d 817546b7` output; validation.md) contains manuscript text and is not included in `evidence/`.

## 3. New findings

No new finding requiring a change. One remark.

### M6. ϑ is also the branch unit's threshold symbol (remark; no change required)

Where: l.312 and the uses of ϑ_i; branch l.128–132, l.136, l.142.

The new name ϑ_i is the letter the branch unit uses for its threshold ϑ_k ("$\vartheta_k>0$ is the threshold", branch l.128–129). That threshold enters the definitions of the branch moment map through B_k = ϑ_k^{-2}KA_k and V_{k,c} = π(cϑ_k²A_k^{-1}) (branch l.131–132), which enter 𝖬_i = U_i^{-1}𝔠V_{k_i,ω_i} (branch l.136) and 𝖬_iB_{k_i}x = 𝖯_i𝔠πx (branch l.142). l.281 and l.315–316 call the scribe's 𝖬_i ϑ_i^{-1} times that map, so a reader who follows the citation meets ϑ_{k_i} next to ϑ_i. Nothing is false: the indices are i and k_i, and no single formula contains both. The branch file is not `\input` by `existence.tex`, but ϑ is also the threshold in chapters that are (ϑ_k at `trace-crown-buffer.tex` l.110 and `trace-coffer-supplier.tex` l.359, ϑ_K at `trace-bill-prices.tex` l.99), while other chapters reuse ϑ locally for unrelated quantities (for example `all-grade-free-detectors.tex` l.24–26), so a local ϑ_i is within the book's practice. The letter is a variant of θ, which #388 M3 proposed after checking only the scribe file; θ_i is the same letter in its other form. η, the other letter #388 proposed, occurs in the branch file as a decay exponent.

Possible repair (optional): a letter used in neither file (ψ_i, for example), or a clause at l.312 saying that ϑ_i is not the branch unit's threshold ϑ_k.

## 4. Earlier checked items

C1–C15 of #388 still hold at `817546b7`. The revision touches C9 (now in implication form, M1), C4 (the added sentence l.343–345, M5) and C12 (the new citations of the lemma at l.278–281 and l.329–331 come before it in the text, not in the logic); C2, C3, C6–C8, C10 and C14 change only by the rename; C1, C5, C11, C13 and C15 are on unchanged text (record l.1–34 byte-unchanged). Line shifts are given in lean-correspondence.md.

## Required changes and remaining uncertainty

Required: none. Should: none. Minor: none. Remark: M6.

Not checked:

- N1 (unchanged). The inputs of the lemma: the branch unit's scale ratio with its running estimate and fixed-scale limit, the scribe's first clock input, `prop:ex-branch-moments`, `prop:ex-branch-washout` and their own inputs, and `eq:ex-branch-moment-input`.
- N3, N4, N6, N7 (as before). Scribe text outside the changed passages was checked only through targeted `git grep` searches (no change there); interface files were read at the cited passages only; the review covers only the hashed bytes, except `manuscript/existence.tex` (its `\input` lines), the YM-000026 `unit.json` `manuscript` list, the `git grep` searches of `manuscript/` (validation.md), `source/build.md` l.37 and `Lean/SOURCES.sha256`.
- N5 (now stated). That the branch unit's clock is the scribe's β̂ is now a stated identification of the lemma (l.343–345); it is not derived from the branch text, and the equality of b with κ and of a_k with 𝖺_k is not stated as an equation in either text and is not needed by the lemma. For the source, see lean-correspondence.md L6.
- N15. The manuscript build: the addendum's report (`latexmk -g` exit 0, 1040 pages, 0 undefined references, p. 990 inspected; record l.47) was not reproduced, and no page was rendered, so whether the lengthened first line of the display (l.349–352) fits the line width was not checked.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
