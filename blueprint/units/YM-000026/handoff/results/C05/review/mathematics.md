# Review of work package C05: mathematical validity

- Unit: work package C05 "OPE prescription and grouping" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C05/`.
- Role: mathematical validity.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: ope-prescription, ope-grouping, ope-grouping-algebra, ope-singletons; B: ope-cutoff, ope-estimates, ope-homogeneous; C: ope-filtration, ope-grid, ope-local-projection; D: ope-phase-prices, reference-cone, reference-difference, reference-match, the ledger and `prop:ope-match-assembly`), verified and synthesised by a Claude agent. Session `schmittj-codex-c05-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the files reviewed are listed with their SHA-256 under "Files reviewed". All twenty hashes were recomputed at the start and at the end of the review and are unchanged (see `validation.md`).
- Manuscript files and labels: see the list below.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (pinned upstream Lean source under `Lean/`).
- Review task and PR: issue #46; author draft PR #72, reviewed at its head `8b15d44` (`8b15d44410a2784d25e765b5b7b9ca2b05e5582c`); the author's changes are `git diff 01ef22c HEAD` (11 files, 578 insertions, 14 deletions).
- Outcome: changes requested for `ope-cutoff.tex`, `ope-estimates.tex` (with `ope-homogeneous.tex`), `ope-phase-prices.tex`, `reference-match.tex`, `ope-filtration.tex`, `ope-local-projection.tex`, `ope-grouping-algebra.tex`, `ope-grouping.tex`, `ope-grid.tex`, and for the author's `handoff.md` and `ledger.md`. For `ope-prescription.tex`, `ope-singletons.tex`, `reference-cone.tex` and `reference-difference.tex` no required mathematical change was found; they are "accepted locally, conditional on stated dependencies" only in the sense of this agent review. No human acceptance is recorded for any chapter.

Files reviewed (SHA-256):

- `manuscript/existence/ope-prescription.tex` `b332b2c3cd21bc6224659e9f1452b8c37a81a451e907f94728ab5ecdbdd4bd78` (`lem:ope-detector-span`, `prop:ope-prescription`)
- `manuscript/existence/ope-grouping.tex` `9c04100186186b48f2610b9ac9c7fc940b09a6ad25e0f1fba655d4bb84048211` (`eq:ope-forest-price`, `eq:ope-group-majorant`)
- `manuscript/existence/ope-grouping-algebra.tex` `118058d63807ff051928347e71b539f1e9313852c1f7801807a8b63cda284390` (`sec:ope-grouping-algebra`)
- `manuscript/existence/ope-singletons.tex` `38f846d42a399c17f1b39394ed9ae0aa93d6d3a0e09d4cde656dd8ccdeab1f9e` (`eq:ope-single-coin`)
- `manuscript/existence/ope-cutoff.tex` `47d64b1bc5528ce42d59b100adebb1adf426d61aad424c25614d59c55d3d636d` (`eq:ope-group-weight`, `eq:ope-match-pay-one`, `eq:ope-match-pay-two`, `eq:ope-cutoff-discrepancy`, `prop:ope-match-assembly`); changed by PR #72
- `manuscript/existence/ope-estimates.tex` `6ffbdcd702e5b097338182750dbf8af81fef644628e72f899bd98acffcfe0760` (`input:ope-raw-estimates`, `eq:ope-rotated-error`, `thm:ope-quantitative`)
- `manuscript/existence/ope-homogeneous.tex` `621f8e99c7f2dce813333c8fbe022cfabef7f47a457ada36e707f08aab62b7e7` (`lem:ope-homogeneous-projections`, `eq:ope-final-coefficients`)
- `manuscript/existence/ope-filtration.tex` `d9bbb667ae873ccfb98430adc14cce424bba05458746f10d614e551fecc27c62` (`eq:ope-whole-distance`, `eq:ope-physical-distance`, `ex-column-subpower`); changed by PR #72
- `manuscript/existence/ope-grid.tex` `26011dc5fd7a26893ec58b7a86bb13bb55fe14a1cd2581c07cbf9ba927c68769` (`input:ope-match`, `eq:ope-match-grade`); changed by PR #72
- `manuscript/existence/ope-local-projection.tex` `c84af06b54a356e4a779f027242b8efc4c559b6a898e6370c0f5c59088228a6c` (`eq:ope-leaf-projection`, `eq:ope-terminal-projection-price`); changed by PR #72
- `manuscript/existence/ope-phase-prices.tex` `fe3492ffc0dad8c246cbc47125a9cc62331b0f35e5f3185cfb2cec8acd3a9151` (`eq:ope-mixed-plant`, `eq:ope-ground-price`); changed by PR #72
- `manuscript/existence/reference-cone.tex` `e240a87f8acc898d50ac364ed7a884b91629cbf083d16049bd4dacf0c405af6a` (`eq:reference-gain`, `eq:reference-affordable`)
- `manuscript/existence/reference-difference.tex` `cd94054fa77810c56b5f6838986b93a9b4fcf93a4182fe044b807cdce4ad854a` (`eq:reference-produced-difference`)
- `manuscript/existence/reference-match.tex` `f95a52249ed63a5d93479ee1484781fb88bedf42a7389cef1dd49bcc705eaf94` (`eq:reference-match-afford`, `eq:reference-join`)
- `results/C05/README.md` `af3e974a3c40a5965783e67171a8e2e6c9b97204fd171c27ec2c9bbf4c4a0cd1`
- `results/C05/correspondence.md` `eb29e580d0be5ef5c809900edfa9c6909e53929794888ce10f3f6b2bab627e4b`
- `results/C05/findings.md` `16b8af95102fac1630bf7d8537364fd6c21d5e0432bcce39aa07aaebcac41230`
- `results/C05/handoff.md` `fcf239ca30f50731ec2b9bc28fde1d18d44e4452b7e0c018948de73f984b7e40`
- `results/C05/ledger.md` `c2120175f2c62dc9d2fe7a289c3830d245fc711c76fa4198c1eb90f2e8f1985a`
- `results/C05/validation.md` `45b665e7b4f20f08abeae16600d5217a57aba4bed4eb95645f017b30b5e98190`
- Also consulted, not owned by the author's pass: `handoff/C05.md` `b33ccce2e0158e50fd70c6e624e8b0019aa3ff6779465ce3e530f948d3dd9d73`, `ope-evidence.md` `5f805ebe17b1a1cb41fbaa5179cd193f89b6962da81fc293f2ff66b1b83b1da8`, `local-projection-evidence.md` `f76d975405285f70773c26a65366c4e4fd9139509fa759d13b83cb1c0e1a66db`, `ope-history-service-evidence.md` `a9d143151c1245ab60686edfee9481f1adbfa1d30b4a0df7dd5dc5284da6e32f`.

## Findings and evidence

Status vocabulary. CONFIRMED: the synthesising agent reproduced the finding from the LaTeX and, where relevant, the Lean text. REFINED: partly right; the corrected version is stated. REJECTED: not supported. UNDECIDED: what would decide it is stated. "Carried over" marks parts reported by an agent reviewer and not re-verified. Reviewer labels are written as report/part/number, e.g. B-I-2. The reviewers' original severity labels (ERROR, GAP, INACCURACY, NIT) are quoted; the severity assigned here is the verified one. Each finding states where the defect lies (manuscript chapter or audit record), whether PR #72 introduced it, and the owning package when it is not C05.

Summary of the verification. No displayed inequality, exponent or rate in the fourteen chapters was found wrong, and the new `prop:ope-match-assembly` is a correct conditional assembly that makes no subpower claim for the matched label. Three results use a hypothesis that the chapter does not state: `thm:ope-quantitative` (covariance of the mixed correlations under the \(O(4)\) action, M1), and the even-moment and tie-removal arguments of `ope-phase-prices.tex` (the unreflected conjugation identity and continuity in every character, M4 and M5). With only the hypotheses printed, the implication claimed in `thm:ope-quantitative` fails (counterexample in M1); with the covariance law added, the proof is valid. PR #72 introduced one false sentence in the manuscript (M3) and two wrong statements in the audit records (M2, M15). Of the six findings labelled ERROR by the reviewers, two are confirmed as errors of the audit record (B-I-2 with B-II-3), one is confirmed as a missing hypothesis in the manuscript (B-II-1, see M1 and `lean.md` L1), and three are refined to imprecisions (A-I-3 with A-II-3, D-II-1; see M10 and `lean.md` L2, L4).

### M1. `thm:ope-quantitative` uses covariance of the mixed correlations, which is not among the stated hypotheses (B-I-1 labelled GAP; B-II-1 labelled ERROR). Status: CONFIRMED as a missing hypothesis in the manuscript; pre-existing (both chapters are unchanged by PR #72).

Location: `ope-homogeneous.tex` lines 10–14 (standing assumptions); `ope-estimates.tex` lines 94–99 (verification of `eq:ope-rotated-error`) and lines 173–175 (`thm:ope-quantitative`, "Under Input~\ref{input:ope-raw-estimates}").

Passages: "Assume, as supplied by the field structure, that these actions commute with the inclusions, that \(J_n\) is an antilinear involution, and that \(J_nR_n(K)=R_n(K)J_n\)." and "Rotate the entire correlation by \(K\) and translate by \(o\)."

Verified reasoning. The step "rotate the entire correlation" is the identity \(S_{\mathrm{mix}}(R(K)\boldsymbol v;K\boldsymbol x)=S_{\mathrm{mix}}(\boldsymbol v;\boldsymbol x)\) on separated configurations. It does not follow from the printed assumptions (continuity, compatibility with inclusions, commutation with \(J\)), and `input:ope-raw-estimates` (lines 33–59) does not contain it either. The same paragraph uses translation invariance, and lines 125–130 use the reality law \(S(J\boldsymbol v;\boldsymbol x)=\overline{S(\boldsymbol v;\boldsymbol x)}\); neither is cited. The reviewer's counterexample was checked: take \(E_0=\mathbb C1\), \(E_n=A=\mathbb C[e]/(e^2=e)\) for \(n\ge1\), the two characters of \(A\) as phases and their average \(\mu\) as mixed state, position-independent correlations \(S_\chi(\boldsymbol v)=\chi(\prod v_i)\), and \(R(K)1=1\), \(R(K)e=\det(K)e\) with ordinary conjugation. The printed assumptions hold; \(\mu\) is faithful, so the tests separate \(A\); for \(D\ge1\) the raw truncation is the full product and the raw discrepancy vanishes, and for \(D=0\) all quantities are bounded, which meets the required nonnegative upper rates. For the cluster \((e,e)\) one gets \(A_1=\int\det(K)\,e\,dK=0\), whereas the singleton readout of \(h=e\) is \(\int\det(K)^2e\,dK=e\). So the difference in `eq:ope-average-bridge` with \(m=1\), \(D=2\), \(w=2\) is the constant \(-e\), which does not have upper rate \(-1\). The model violates covariance (\(S(R(K)e)=\det(K)/2\)), which is exactly the missing premise. The author's ledger records "correlations covariant" on the open edge `C03-to-C05-O4` (line 48), so the dependency is known to the author; it is the theorem statement, the standing assumption and the ledger output row (line 32) that omit it. In the pinned source the premise is an explicit hypothesis (`lean.md`, L1). With covariance, translation invariance and the reality law added, every step of lines 67–171 was checked and is valid, including the passage from "every rotation sequence" to a bound uniform in \(K\) and the use of \(J_Dh_n\) as comparison field.

Smallest repair: add to `ope-homogeneous.tex` lines 10–14 "and that the mixed and phase correlations on separated configurations are invariant under the simultaneous action \(\boldsymbol v\mapsto R(K)\boldsymbol v\), \(\boldsymbol x\mapsto K\boldsymbol x\), under translations, and satisfy \(S(J\boldsymbol v;\boldsymbol x)=\overline{S(\boldsymbol v;\boldsymbol x)}\)"; cite these at `ope-estimates.tex` lines 95–98 and 125–130; state `thm:ope-quantitative` "under Input~\ref{input:ope-raw-estimates} and the standing assumptions of Section~\ref{sec:ope-homogeneous}"; add the premise to ledger line 32. Only mixed-state covariance is used by the detector argument.

### M2. The author's handoff assigns rate \(qa\) to the norm of the matched label (B-I-2 and B-II-3, both labelled ERROR). Status: CONFIRMED as an error of the audit record; introduced by PR #72; the manuscript is correct.

Location: `results/C05/handoff.md` lines 13–15: "No subpower claim is made for `Q_n`: its whole-label norm has rate `qa`."

Verified reasoning. `prop:ope-match-assembly` (ope-cutoff.tex lines 403–409) and `eq:ope-match-norm` state \(\|Q_n\|\le J_nV_n\) with \(J_n\) of upper rate \(qa\) and \(V_n\) of upper rate \(\tau-qa\). The resulting upper rate of \(\|Q_n\|\) is \(\tau=cw+4h(c-a)\), not \(qa\); \(qa\) is the rate of the multiplier. No exact rate is established, since \(Q_n\) may vanish. The first half of the sentence ("no subpower claim") is true of the manuscript, so the package requirement "no subpower claim for \(Q_m\)" is respected; only the stated rate is wrong. The Lean bound has the same shape (`lean.md`, L3).

Requested change: "No subpower claim is made for `Q_n`: the whole-label bound is \(\|Q_n\|\le J_nV_n\) with upper rates \(qa\) and \(\tau-qa\), hence upper rate \(\tau\)."

### M3. New sentence in `ope-cutoff.tex` identifies one factor with a product (A-I-4 labelled INACCURACY; B-I-4 labelled NIT). Status: CONFIRMED as a false sentence in the manuscript; introduced by PR #72 (author's repair R3); no later step depends on it.

Location: `ope-cutoff.tex` lines 62–66: "the factor \(\lambda W_r\) is the product of the new weights \(\delta^2W_ie^{-(\nu+1/2)k}/h\) of the old marks in a group, as computed at the end of that section."

Verified reasoning. By `ope-grouping.tex` lines 198–203, \(\delta^2W_ie^{-(\nu+1/2)k}/h\) is the new weight of one old mark, and "their product over a group is the numerator in `eq:ope-group-weight`". With \(\lambda=\delta^2e^{-(\nu+1/2)\ell}/h\), the factor \(\lambda W_r\) is therefore the new weight of the single mark \(r\); the product over \(r\in A\) is \(8\widetilde W_A\). For a group of two marks of weight one the factor is \(\lambda\) and the product \(\lambda^2\). The display `eq:ope-group-weight` and the induction of lines 73–104 use the product correctly (re-derived here: \(8^qC(i,q)\le\alpha^hC(i,p)\le\lambda^p\prod_rW_r\)). The letter clarification in the same sentence (\(\ell\) here is \(k\) there) is correct.

Requested change: "each factor \(\lambda W_r\) is the new weight \(\delta^2W_re^{-(\nu+1/2)k}/h\) of one old mark, and their product over \(r\in A\) is the numerator computed at the end of that section." Correct the same wording in `findings.md` R3.

### M4. The even-moment argument uses \(M(\bar w)=M(w)^*\) for unreflected conjugation without stating it as an input (D-I-1 labelled GAP). Status: CONFIRMED; manuscript, pre-existing; the ledger edge written in PR #72 repeats the omission.

Location: `ope-phase-prices.tex` lines 150–157; `results/C05/ledger.md` line 49.

Passage: "The separated-cluster limit of Lemma~\ref{ex-cluster-train}, together with conjugation becoming adjoint under ground compression, identifies the limit as \(\langle\Omega,(A^*A)^m\Omega\rangle\)."

Verified reasoning. The replicated factors (lines 118–133) are translated along \((1,1,1,1)\) and conjugated in their labels; their points are not reflected. The adjoint law available from `phases.tex` (line 197) is \(M(\theta v)=M(v)^*\), with reflection. The unreflected identity is `eq:episode-conjugate` of `actual-phase-detector-moments.tex` (C14), which that chapter calls "a substantive input" obtained from the reflected-word identification; its conditional producer is `ex-ordinary-reflection` in `reflection-transport.tex` (C03). The Lean lemma has the reflection premise as an explicit hypothesis (`lean.md`, L7). Given the identity, the expansion into alternating factors \(A^*,A\), the bound \(\int|\chi(A)|^{2m}d\mu\le C^{2m}\), and the full-support argument (including \(C=0\)) are valid.

Requested change: cite `eq:episode-conjugate` (or `ex-ordinary-reflection` with its hypotheses) at line 151 as an input on the same hierarchy; add it to the edge `C03-to-C05-phases` and to the inputs listed in `prop:ope-match-assembly`; the edge should not be marked "matched at statement level" before that.

### M5. Tie removal uses continuity of every character's correlations without a producer (D-I-2 labelled GAP). Status: CONFIRMED as an uncited input; manuscript, pre-existing; a conditional producer exists in C03.

Location: `ope-phase-prices.tex` lines 177–178 and 203–206: "For each fixed character, its correlation is continuous on separated configurations, so the generic bound passes to the limit."

Verified reasoning. Full support and the barycentre formula do not give regularity in every character; `phase-selection.tex` lines 91–93 say so explicitly. The needed statement is `ex-phase-caps` (`phase-regularity.tex` lines 12–30, C03), which is conditional on the all-copy bound and the slot identity `ex-raw-slot-identity`. Continuity for almost every character would not suffice, because the conclusion is used for every character and along arbitrary sequences of phases. The implication drawn in the chapter is correct once the premise is supplied.

Requested change: cite `ex-phase-caps` at line 177 and record its hypotheses on the phase edge of the ledger and in `prop:ope-match-assembly`.

### M6. `reference-match.tex` leaves the room condition, the centred depth and the cell normalisation undefined (D-I-3 labelled GAP; D-I-4 labelled INACCURACY). Status: CONFIRMED as undefined hypotheses, not as an invalid step; manuscript, pre-existing; it affects the dictionary added by PR #72 (see L2 in `lean.md`).

Location: `reference-match.tex` lines 8–10, 76–78, 98–101, 138–147.

Verified reasoning. (a) "the room condition ensures that backward transfer respects their copied product" (lines 98–101): the chapter never states the condition. Multiplicativity of \(\mathcal B_{k,N}\) on copies is not a consequence of adjointness or normalisation; it needs disjoint kernel read sets at every intervening scale. The manuscript has the statement and proof in `actual-phase-grid-approximants.tex` lines 57–90 (`eq:actual-grid-factor`, C12), under \(2(a_kR+T_k)<a_J\) with \(J\) the depth of the centred cells, and the Lean theorem behind this chapter takes exactly that hypothesis (`lean.md`, L2). `ope-cutoff.tex` lines 345–348 verifies a room condition of this kind in rates, so the cutoff application is covered; the definition is missing where it is used. (b) The chapter names two scales (opening \(m\), matching \(k\)) but its copied cells live at a third, coarser depth \(J\) ("the centered chamber", "\(M\) copied cells"), which is never introduced. (c) \(\mathcal V_m\) (lines 143, 146) is not defined in any C05 chapter, and \(S_0=\exp(|\Lambda_m|\mathcal V_m/M+5)\) equals the cutoff chapter's \(\mathcal S(k)=\exp(u^4t_{K(k)}+5)\) only if \(M\) is the number of centred \(J\)-cells, so that \(|\Lambda_m|/M=(a_J/a_m)^4\), and \(\mathcal V_m\) is the treasury \(t_m\) of the opening level. The substitution \(x=2,y=1,f=1\) into `ex-centered-sail` giving \(5M\) is correct. The arithmetic of the chapter was re-derived here and is correct: \(\mu(e_j-I_kb_j)\le1/(16(1+C_k))\), \(\mu(z)\le2\mu(Az)\), \(\sum_j|s_j|\le4E\), portfolio sum \(\tfrac12+\tfrac12\), \(\mathcal R(-r-\mathcal O(b))\le S_0/(2w)\), final bound \(3S_0/(2w)\le2S_0/w\).

Requested change: introduce the centred depth \(J\le m\) at line 8; state the room inequality and cite `eq:actual-grid-factor`; define \(\mathcal V_m\) as the treasury bound for the bracket of `ex-centered-sail` at level \(m\) and \(M\) as the number of centred \(J\)-cells, and display \(S_0=\exp((a_J/a_m)^4\mathcal V_m+5)\).

### M7. Covariance of the regrouping is asserted under a hypothesis that does not name the partition data (A-I-1 labelled GAP). Status: REFINED to an imprecisely stated hypothesis; manuscript, pre-existing.

Location: `ope-grouping-algebra.tex` lines 187–196: "translations, signed coordinate changes and the accompanying conjugation preserve the construction whenever they preserve the original coefficient data. They relabel entries bijectively, preserve group-name incidence ..."

Verified reasoning. Preservation of group-name incidence is an assumption on the relabelling, not a consequence of preserving the coefficients: a permutation of old marks that does not map groups to groups (for instance \((1\,3)\) with groups \(\{1,2\},\{3\}\)) does not intertwine \(\mathcal R\). The intended setting is fixed by `ope-cutoff.tex` lines 23–28 ("Use the same partition in each copy"), where the relabelling does descend to the groups and commutes with the choice of representatives; under that reading the reindexing argument is valid, and it gives covariance only for coefficients whose marks lie in the copied family, as the text says. The Lean hypotheses are explicit (`lean.md`, L5).

Requested change: state the hypothesis: permutations \(a\) of old marks and \(b\) of groups with \(\pi a=b\pi\) and compatible representatives, positions and flags transformed accordingly, and the coefficient identities for every mark set contained in the copied family.

### M8. The local-trial criterion in `ope-filtration.tex` is not precise enough to be checked at its application (C-I-1 labelled GAP). Status: CONFIRMED as an imprecise statement of an input that the chapter itself declares open; manuscript, pre-existing.

Location: `ope-filtration.tex` lines 242–259 and 300–306.

Verified reasoning. The definition of a local trial asks for "subpower group supremum and subpower bounds for the prescribed left derivatives". In the construction the derivative bounds hold on the healthy configuration region only, the supremum has a separate price, and the comparison needs a literally translated stencil and eventual continuity (`lean.md`, L8). The sentence "The same literal observable is therefore an admissible degree-\(e\) trial" (line 305) is therefore checkable only after the definition names these properties. The rescaling identity \(a_N^d\mathcal O_d(w_c)=a_N^e\mathcal O_d(v_c)\) and the subpower bound for \(w_c\) are correct. The chapter states that "the local comparison and projection assertions are substantive inputs still to be proved", and the author lists the producer as not located (F2(d)); a conditional candidate is `actual-insertion-derivative-relay.tex` (C14), reported by reviewer C and not verified here.

Requested change: define admissibility with the two prices, the healthy region, measurable gauge-invariant locality, literal translation and eventual continuity; record the C14 candidate on the edge `C13-to-C05-local-trials`.

### M9. The derivative identity used by the interpolation is described, not stated as an input (C-I-2 labelled GAP). Status: CONFIRMED as an open interface that the author already records (F4, ledger line 61); manuscript, pre-existing; the interpolation proof is valid as a conditional argument.

Location: `ope-grid.tex` lines 193–196, 241–246 and 288–292: "The differentiability identities needed for this interpolation are exactly the derivative-field identities of the hierarchy."

Verified reasoning. Hypothesis (3) of the interpolation is \(\partial_{i,\mu}h_n(p,X_n)=h_n(p',X_n)\). Its application needs one grade-raising choice of derivative representative whose slot identity holds with arbitrary exterior insertions and in every phase table used, since \(h_n\) is a phase discrepancy. `slab-regularity.tex` lines 75–86 (C03) assumes this identity (`ex-raw-slot-identity`); it does not produce it. The exponent arithmetic of the section was checked: with \(a=x-\epsilon\), \(d=x+\epsilon\) the rates are \((w-m)x+\epsilon(w+8|I|+m)\) and \((w-D-1)x+\epsilon(w+8|I|+D+1)\).

Requested change: cite `ex-raw-slot-identity`, with phase compatibility, as a named input at lines 241–246 and 288–292, and say in the ledger that slab regularity is a fellow consumer.

### M10. A sentence of the C16 chapter `ope-history-service.tex` about singleton coefficients is ambiguous (A-I-3 and A-II-3, both labelled ERROR). Status: REFINED; not confirmed as an error. Cross-package finding, owner C16; pre-existing; not in a C05 chapter.

Location: `ope-history-service.tex` lines 150–155: "Grouping by the cell coordinate is exactly the substitution used in Section~\ref{sec:ope-grouping-algebra}. The quiet coefficient stays the actual background profile. A singleton coefficient stays the sum of the derivatives of its original insertions through \(\mathcal D\)."

Verified reasoning. The reviewer's algebra is right: under the regrouping \(\mathcal R\) of `ope-grouping-algebra.tex` lines 25–35, the coefficient of a grouped singleton \(e_{\{v\}}\) is the old coefficient at the full fibre \(I_v\); for two slots and \(D=\exp(z_1e_1+z_2e_2)\) it is \(z_1z_2\), not a sum. If "a singleton coefficient" means the singleton of a cell after grouping, the sentence is false. But the source statement that this paragraph follows (`YM.MergeProof.Ribbons.ManyCopies.Unites`, quoted in `lean.md`, L4) keeps the marker set cell \(\times\) slot ungrouped and asserts, for each individual marker \(j\), that its singleton coefficient is the sum over the offered insertions \(l\) of their derivatives at \(j\). Read with "singleton" as one marker (cell, slot) and "its original insertions" as the offered insertions at that marker, the sentence is correct and matches the source. The text does not say which is meant, and the preceding sentence about grouping by the cell coordinate invites the wrong reading. The C05 chapter's definition of \(\mathcal R\) is correct, as the reviewer says. The numerical identification \(s_m=\Gamma\) on the edge `C16-to-C05-history-grouping` is unaffected (checked: \(\ell\leftrightarrow N\), \(\eta\leftrightarrow\delta_m\), \(T=A=1\), \(\sigma=100+\tfrac12\), \(B\leftrightarrow\chi_m\)).

Requested change (for the C16 owner): say "for each individual marker (cell, slot)" in the sentence, and add that after grouping by cells the singleton coefficient of a cell is the old coefficient at its full slot set.

### M11. The closing sentence of `ope-estimates.tex` permits a phase-dependent threshold (B-I-3 labelled INACCURACY). Status: CONFIRMED; manuscript, pre-existing.

Location: `ope-estimates.tex` lines 209–211: "The coefficients used in this theorem were chosen before \(D\), the phase and the spectators. Only the small-radius threshold may depend on those finite demands."

Verified reasoning. "Those finite demands" includes the phase and the spectators. The theorem (lines 183–192) and its proof by a violating sequence give a threshold uniform over all phases, the mixed state, and all admissible cluster and spectator positions; the public clause requires that uniformity (`lean.md`, L13). The threshold may depend on the cluster and spectator labels, \(D\), \(M\), \(\eta\), \(c\), \(\epsilon\) and, for a coefficient, the channel. No threshold uniform in \(D\) is proved or needed.

Requested change: "The threshold may depend on the labels, on \(D\), \(M\), \(\eta\), \(c\), \(\epsilon\) and on the channel; it does not depend on the phase or on the positions."

### M12. The new pointer to the selected history omits its threshold (C-I-3 labelled INACCURACY). Status: CONFIRMED; manuscript, introduced by PR #72 (author's repair R5).

Location: `ope-local-projection.tex` lines 37–38: "Section~\ref{sec:ope-history-service} places the projection on the selected history with allowance \(X_m=\exp(\sqrt{\widehat\beta_{m+1}})\)."

Verified reasoning. The chapter fixes an arbitrary degree \(d\) and adjacent levels (lines 9–10). The supplier (`ope-history-service.tex` lines 184–192) gives the degree-\(d\) projection only for \(m\ge t_d\), where \(d+3\le J(t_d)\), for every cutoff \(N_0>m\) and every period. The Lean statement has the same restriction (`lean.md`, L9).

Requested change: append "for \(m\ge t_d\), where \(d+3\le J(t_d)\), every cutoff \(N_0>m\) and every period", and carry the restriction into R5 and the edge description.

### M13. The remainder quantity in `eq:ope-leaf-projection` is not defined with its normalisation (C-I-4 labelled INACCURACY). Status: CONFIRMED; manuscript, pre-existing.

Location: `ope-local-projection.tex` lines 19–21: "the remainder bound is the weighted sum of the local regular remainder and the dominated forced remainder at this scale."

Verified reasoning. In the source the bound is \(R+\kappa^{-1}F\le B\) with regular mass \(R\), forced mass \(F\) and a positive allowance \(\kappa\) (`Coefficient.remBound`, quoted in `lean.md`, L10); `leaf-transfer.tex` calls the forced part normalised. The finite-sum extension at lines 55–63 is valid for this quantity with one fixed \(\kappa\); the text does not say that \(\kappa\) is fixed, or that it is there. The terminal constants were checked: with \(A=4/z\) and weight \(z/(16x)\) the price is \(a_{m+1}^d\,4x/z\).

Requested change: define \(\operatorname{rem}(Q)\le B\) by majorants with \(R+\kappa_m^{-1}F\le B\) and keep the same \(\kappa_m\) in the sum.

### M14. The covering number in `ope-grouping.tex` is the connected one, and the application needs \(\nu\ge0\) (A-I-2 labelled INACCURACY). Status: CONFIRMED; manuscript, pre-existing; minor.

Location: `ope-grouping.tex` lines 11–17 and 179–182.

Verified reasoning. The source counts radius-\(M\) balls whose union is connected by unit steps (`lean.md`, L10). The two displayed properties hold for that number and are all the forest proof uses, so the proof is unaffected; the identification with the support price of the representation needs the convention to be named. The subadditivity is stated only for intersecting sets, which already signals the connected variant. The forest estimate assumes \(a\ge0\) (line 18); its application with \(a=\nu\) should say \(\nu\ge0\).

### M15. The ledger row for the reference cone omits the terminal hypothesis (D-I-5 labelled INACCURACY). Status: CONFIRMED; audit record, introduced by PR #72; the chapter is correct.

Location: `results/C05/ledger.md` line 28: "`v_l=0`, direction/remainder step, bank → gain \(e^{-(s_k-s_i)/8}\)".

Verified reasoning. `eq:reference-gain` also needs `eq:reference-terminal` (\(r_k\le w+C_k(w+\mu(v_k))\)); with \(l=k\), \(v_k=0\), \(r_k=1\), \(w=0\) the stated implication fails. `eq:reference-affordable` needs in addition \(\eta_iL_i^{d+1}\rho_i\le\rho_{i+1}\) and the initial payment. `reference-cone.tex` states all of these (lines 36–39, 109–118). The whole chapter was re-derived here: the four smallness inequalities, \(Y\le(2K+\tfrac12)\varepsilon t\), cone propagation, \(q_ir_i\le r_{i+1}\), \(r_k\le2(1+C_k)w\), and the one-step factor \(\eta_iL_i^dq_i\le\eta_iL_i^{d+1}\); no error.

### M16. The spectator rounding formula lacks the mesh factor (D-I-6 labelled NIT). Status: CONFIRMED; manuscript, pre-existing; cosmetic.

Location: `ope-phase-prices.tex` lines 197–199. The displayed quantity \(K\lfloor y_{j,\mu}/(hK)\rfloor+r\) is an integer address; the grid point is \(h\) times it, as in `ope-grid.tex` line 49. With that factor the distance bound \(hK\) and the avoidance of the residues of \(W\) are correct.

### The author's additions in PR #72

`prop:ope-match-assembly` (`ope-cutoff.tex` lines 352–428). Checked against `input:ope-match` (`ope-grid.tex` lines 89–119) clause by clause. Rates: \(X\) has rate \(-\tau\) with \(\tau=cw+4h(c-a)\) (mesh powers \((a_j/a_{m+1})^{4h}\) and \(\prod_ra_j^{d_r}\)); \(P=a_{m+1}^q\mathcal B_m4/X\) and \(V=2E=16(1+\zeta_m)P\) have rate \(\tau-qa\); \(A=2\mathcal S(k)/z\) has upper rate \(\tau-(q+\tfrac1{16})(a-b)\); with \(c=d\) these are the rates of \(V_n\) and \(A_n\) in the Input, and \(\tau=\tau(p;a,d)\). Payment conditions: \(-\tau-\tfrac{15}{16}(a-b)<-\tau\) and \(-\tfrac1{16}(a-b)<0\), both re-derived. First step: the final paragraph of `ope-phase-prices.tex` gives the discrepancy rate \(\gamma\) in every character and the mixed state, at arbitrary fixed-clearance spectators, subject to M4 and M5. Second step: `eq:ope-whole-distance` at the fixed level \(m_n\) gives \(\|Q_n\|\le J_{m_n}(a_U/a_{m_n})^qV_n\), multiplier rate \(qa\). Third step: `eq:ope-physical-distance` with \(d=q\), \(k=m_n\) gives \(y\) with \([y]\in E_e\) and factor rate \((q-e-1)a\); with \(z_{e+1,n}=y\) this is `eq:ope-match-distance` for the Input's index \(e+1\in\{1,\dots,q\}\). The level \(m_n\) is fixed while the cutoff runs, as `ope-filtration.tex` line 325 requires; one limit \(Q_n\) is used throughout and only \(y\) is extracted again. The proposition is correct as a conditional statement and faithful to the source (`lean.md`, L3 and L12). It makes no subpower claim for \(Q_n\), keeps the quota at the fixed matching level, and its closing paragraph correctly says that it proves none of its inputs. Two remarks: its list of inputs should also name the conjugation identity and the continuity in every character (M4, M5); and it proves the Input for grids on the schedule meshes \(a_{j_n}\), which is how `ope-grid.tex` uses it (line 266), whereas the Input says only "meshes of logarithmic rate \(d\)".

Dictionary between `reference-match.tex` and `ope-cutoff.tex` (lines 218–258). Checked row by row: under it `eq:reference-match-afford` becomes `eq:ope-match-pay-two` literally; \(c=2P\) because coefficient size and remainder are each at most \(P\); \(E=4(1+\zeta_m)(2P)\), \(V=2E\), \(A=2\mathcal S(k)/z\). The row "opening scale \(m\) \(\leftrightarrow\) \(k\) (or \(K(k)\))" is imprecise: the cell price \(\mathcal S(k)=\exp(u^4t_{K(k)}+5)\) with \(u=a_k/a_{K(k)}\) involves the centred level \(k\) and the opened level \(K(k)\) as two different scales, and the opening scale of the reference construction is the opened level (M6(b), `lean.md` L2). The rates are unaffected, because opening retains rate \(b\) (lines 280–295, re-derived). The definition of \(\mathcal M(z;k,m)\) by the evolution \(b_{i+1}=\eta_ib_i\) agrees with `reference-cone.tex` line 110.

Cover-rate paragraph (lines 141–151, repair R4). Checked: `eq:ope-pair-halo` with radii \(B(x),B(y)\) gives \(\ell\le16H_L(x,y)\); (O1) with \(A=101\) gives \(101\,\ell\le16\sqrt x\); \(\widehat\beta_m=\beta_*+s_Gs_m\) gives \(\sqrt{\widehat\beta_i}/s_i\to0\). The caveat "the identification of \(x\) with \(\widehat\beta_i\) ... is part of that supplier" can be replaced by a citation: `ope-scale-purchases.tex` lines 91–98 displays \(x=\widehat\beta_m\), \(y=\widehat\beta_{m+1}\).

`ope-filtration.tex` lines 261–275 (R6): consistent with `finite-rank-kernel-transport.tex` lines 85–108, where the local equation input is stated for subpower families and `eq:finite-rank-silent` is displayed for bounded ones; the request to C14 (F1) is justified. `ope-grid.tex` lines 124–130: accurate. `ope-local-projection.tex` lines 30–40 (R5): the identification with `eq:leaf-projection-allowance` (\(x=Q_e\), bounds \(Q_em\), density \(L^d\mathcal Tf\)) is correct; see M12 for the threshold. `ope-phase-prices.tex` (R7): the correction is right; the spectators are the coarse group, the added rate is \((w_1+\epsilon I_0)\delta\), and \(I_0\) is the coarse group size of `eq:ope-two-scale-room`.

### Per-chapter table

| Chapter | Checked line by line | Verdict of this agent review | Open inputs from other packages |
| --- | --- | --- | --- |
| ope-prescription | Agent reviewer A: all 189 lines. Synthesis: lines 1–40 and 150–189 only. | No defect found by the reviewer. Not independently re-derived. | C03 field levels, inclusions, separated correlations (edge `C03-to-C05-field-levels`, open). |
| ope-grouping | Agent reviewer A: all 210 lines. Synthesis: lines 1–30 and 140–210. | Changes requested: M14 (minor). Forest proof not re-derived in synthesis. | C16 history grouping (numerics matched). |
| ope-grouping-algebra | Agent reviewer A: all 200 lines. Synthesis: lines 1–75 and 176–200. | Changes requested: M7. Bijection proof not re-derived in synthesis. | Marked representation (open). |
| ope-singletons | Agent reviewer A: all 201 lines. Synthesis: not read. | No defect found by the reviewer. Rests on one agent report. | Unused-slot dictionary property, background validity (open, F2(f)). |
| ope-cutoff | Agent reviewer B and synthesis: all 428 lines, including every line added by PR #72. | Changes requested: M3; dictionary row for the opening scale; inputs list of `prop:ope-match-assembly` (M4, M5). All rate computations and the assembly are valid. | Marked descent and regrouping estimates, reference transitions, schedule, C16 cover rate (all open or interface). |
| ope-estimates | Agent reviewer B and synthesis: all 212 lines. | Changes requested: M1, M11. Proof valid once the covariance, translation and reality laws are stated. | `input:ope-raw-estimates`; \(O(4)\) covariance (edge `C03-to-C05-O4`, producer unknown). |
| ope-homogeneous | Agent reviewer B: all 229 lines. Synthesis: lines 1–60. | Changes requested: standing assumption of M1. Projections lemma not re-derived in synthesis. | \(O(4)\) action and conjugation on field levels (producer unknown, F5). |
| ope-filtration | Agent reviewer C and synthesis: all 361 lines (cone and transverse steps, plane cancellation, whole distance, \(H_k\zeta_k\le J_k^3\zeta_0\), test argument re-derived). | Changes requested: M8. Proved steps valid. | Triangular columns (not located), C14 null projections in subpower form (F1), local trials (open). |
| ope-grid | Agent reviewer C: all 292 lines. Synthesis: lines 1–200 and 236–292. | Changes requested: M9 (name the input). Mean-value step of lines 200–236 not re-derived in synthesis. | Derivative identities (F4), schedule. |
| ope-local-projection | Agent reviewer C: all 173 lines. Synthesis: lines 1–70. | Changes requested: M12, M13. | C06 leaf projection (matched, conditional), C06 local transfer (open), C16 history. |
| ope-phase-prices | Agent reviewer D: all 270 lines. Synthesis: lines 57–270. | Changes requested: M4, M5, M16. Rate bookkeeping valid. | C02 centred estimates, C03 cluster limit and full support, conjugation identity, regularity in every character. |
| reference-cone | Agent reviewer D and synthesis: all 132 lines, re-derived. | No required change in the chapter; ledger row M15. | Signed one-step comparison, schedule (open). |
| reference-difference | Agent reviewer D: all 177 lines. Synthesis: not read. | No defect found by the reviewer. Rests on one agent report. | Signed transitions (not located, F2(a)). |
| reference-match | Agent reviewer D and synthesis: all 225 lines (arithmetic re-derived). | Changes requested: M6. | Signed transitions, marked transport (C06), complete moment (C02), terminal identification (F2(b)), kernel factorisation (C12). |

## Required changes and remaining uncertainty

Required before a positive mathematical review can be recorded:

1. `ope-homogeneous.tex` lines 10–14, `ope-estimates.tex` lines 94–99, 125–130 and 173–175, ledger line 32: state and cite covariance of the mixed correlations, translation invariance and the reality law (M1).
2. `ope-cutoff.tex` lines 64–66 and `findings.md` R3: correct the sentence on \(\lambda W_r\) (M3).
3. `results/C05/handoff.md` line 15: correct the rate of the whole-label bound (M2).
4. `ope-phase-prices.tex` lines 151 and 177: cite the unreflected conjugation identity and regularity in every character as inputs; update ledger line 49 and the inputs of `prop:ope-match-assembly` (M4, M5).
5. `reference-match.tex`: introduce the centred depth, state the room condition with its producer, define \(\mathcal V_m\) and \(M\) (M6); in `ope-cutoff.tex` lines 221–227 and `correspondence.md` line 16, distinguish centred, opened and matching levels (`lean.md`, L2).
6. `ope-filtration.tex` lines 242–259 (M8), `ope-grid.tex` lines 241–246 (M9), `ope-local-projection.tex` lines 19–21 and 37–38 (M12, M13), `ope-grouping-algebra.tex` lines 187–196 (M7), `ope-estimates.tex` lines 209–211 (M11).
7. `results/C05/ledger.md` line 28 (M15).

Recommended, not blocking: M14, M16; the citation of `ope-scale-purchases.tex` lines 91–98 in the cover-rate paragraph. For the C16 owner: M10.

Remaining uncertainty and what this review did not check:

- Every result of the package is conditional on the incoming edges of the ledger. No producer was reviewed here beyond reading the quoted lines of `ope-history-service.tex`, `ope-scale-purchases.tex`, `leaf-transfer.tex`, `finite-rank-kernel-transport.tex`, `phases.tex`, `phase-selection.tex`, `phase-regularity.tex`, `reflection-transport.tex`, `slab-regularity.tex`, `actual-phase-detector-moments.tex`, `actual-phase-grid-approximants.tex` and `centered-construction.tex`. The producers that the author reports as not located (F2(a)–(f), F5) were not searched for.
- From the reviewers' own "not checked" lists: production of the C03 hierarchy, inclusions, phase family and \(O(4)\) action; the raw comparison from the Wilson construction; the analytic marked representations, signed reference transitions, terminal reference identification, triangular calibrations, purchased schedules and their simultaneous availability; the C14 local-equation and equation-count inputs; the candidate local-trial producer; the nonlinear local expansion, forced-tail estimates and reserve input behind the leaf projection; the construction of unused slots at every history level; a countably indexed version of the regrouping identity; the complete proofs of the C06, C08, C11 and C16 consumers; the final public OPE endpoint in `assembly.tex` beyond the comparison of statements.
- The synthesising agent re-derived in full `ope-cutoff.tex`, `ope-estimates.tex`, `reference-cone.tex`, the arithmetic of `reference-match.tex` and the proved steps of `ope-filtration.tex`. For `ope-prescription.tex`, `ope-singletons.tex`, `reference-difference.tex`, the forest and bijection proofs of the two grouping chapters, `lem:ope-homogeneous-projections`, and lines 200–236 of `ope-grid.tex`, the line-by-line check rests on a single agent reviewer's report; those reports list the steps checked and contain no finding of an invalid step.
- The chapters contain no external literature citation; none was checked.
- No LaTeX build was run and no rendered page was inspected; the author's build record (875 pages) was not reproduced. The live issue #46 and PR #72 discussions were not read in this pass.

## Acceptance

No human acceptance is recorded. This file is an agent review submitted under the account `schmittj`; it is not a certification of the chapters, and the responsible human reviewer has not checked the proofs. Under `docs/proof-standard.md` acceptance can be recorded only by a human reviewer after the required changes are resolved, and any material edit of a chapter changes its SHA-256 and requires renewed review of that chapter.
