# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); independent review of the statement proposed by #437 (`thm:ex-construction-headline` and its subsection `ex-construction-headline`), for #382.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): six reading lanes (the jet normalization, the insertion and the remark; the preamble and items 1–2; items 3–4 and the scope paragraph; references and records; and two Lean-correspondence lanes, see lean-correspondence.md), one exact-arithmetic script for the remark, and, for each point the lanes raised, one independent re-derivation and one argument from the author's side, consolidated against the source lines. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (headline `67701e57…`, `statement.tex` `8f01ba7f…`, author README `d0cf64cc…`, author `hashes.sha256` `59c373eb…`, `unit.json` `8606f82a…`, all at `9c631687`). The headline is in the YM-000026 manuscript list; the unit fingerprint was not computed with `scripts/check_blueprint.py --fingerprint` (README, Records).
- Manuscript files and labels: `manuscript/existence/construction-headline.tex` (all 196 lines: `ex-construction-headline`, `eq:headline-jet-normalization`, `eq:headline-insertion`, `rem:headline-nonconstant-sections`, `thm:ex-construction-headline`, `eq:headline-wilson-limit`); `manuscript/existence/statement.tex` (changed lines l.12–13, l.30–32, l.57, l.59; read for the cited statements at l.39–55, l.59–120, l.119–165, l.167–216); interface files read at the cited statements only: `local-splitting.tex`, `local-sections.tex`, `terminal-marked-construction.tex`, `marked-field-local-estimates.tex`, `lattice.tex`, `phases.tex`, `phase-selection.tex`, `phase-regularity.tex`, `phase-fields.tex`, `analytic-boundary.tex`, `reconstruction.tex`, `assembly.tex`, `actual-stress-normalization.tex`, `physical-ward-propagation.tex`, `trace-profiles.tex`, `trace-asymptotic.tex`, `flat-step.tex`, `argument-outline.tex`, `existence.tex`; the author record `results/G01/assessment/hairer-codex-382-headline-20261115/` and `results/G01/assessment/relevance-report.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at commit `9c631687` (head of `codex/existence-monograph` when read; #437 is commit `9d3d0c3e`, merged at `1d0cad47`).
- Review task and PR: #382 (author handoff https://github.com/hairer/humanise-yang-mills/issues/382#issuecomment-6892967501; #439, Readiness); reviewed PR #437 (commit `9d3d0c3e`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies; no required change. The proof of `rem:headline-nonconstant-sections` is correct. One Should point (M1, the grade of labels in item 1) and Minor points M2–M10.

Line numbers are those of the files at `9c631687`; a bare line number is one of `construction-headline.tex`. The review is of the statement; it does not cover the assembly obligations of #439 or any producer proof. "The earlier review" is the agent review from the author's account, pullrequestreview-5910305617 (10:46:39 UTC, 15 November 2026). Labels M1–M10 and L1–L2 are those of the README; C = checked and correct, N = not checked.

## 1. What #437 states

#437 adds the subsection `ex-construction-headline` (l.1–196) and inputs it at statement.tex l.57, ahead of the new heading "The weaker public target" (statement.tex l.59). The subsection fixes the classical jet normalization of local sections (l.11–28) and the form of the renormalized insertion (l.30–48), proves a remark that the normalization excludes constant insertions (l.50–65), and states a theorem labelled "proposed headline" (l.67–168): for every admissible group and penalty, one Wilson family, chosen before any extraction order, whose limits along a refinement give field quotients (item 1), phases (item 2), a reconstruction at every character (item 3), and an OPE, a stress tensor and the trace law at a selected character (item 4). The paragraph "Scope and remaining assembly" (l.170–196) lists what is not asserted and what assembly remains. The subsection does not claim a complete prose proof (l.6–9).

## 2. Clause by clause

### The jet normalization (l.11–28)

- **C1 (l.11–14).** V_d is the finite-dimensional space of gauge-invariant polynomials in radial jets of weighted degree ≤ d, order j having weight j+2. Correct; matches `local-splitting.tex` l.9–12 and `local-sections.tex` l.9–13.
- **C2 (l.15).** Coordinates with the constant polynomial as unit coordinate. Correct as far as it goes; D_t (l.36–37) presupposes coordinates homogeneous in the number of curvature factors, which l.15 does not state (M2).
- **C3 (l.16–19).** L_d linear in v, polynomial in finitely many link entries and conjugates, gauge invariant, stencil independent of spacing and period, preserving unit, conjugation and signed coordinate symmetries. Correct.
- **C4 (eq:headline-jet-normalization, l.20–24; l.25–27).** For every radial jet J, derivatives through order d of h ↦ L_d(v; H(J,h)) and h ↦ v(h·J) agree at h = 0; h·J multiplies the weight-(j+2) component by h^{j+2}. Correct and well formed once H and h·J are read from l.25–27. The phrase "polynomial radial connection" leaves the truncation level unnamed; components of weight above d enter H(J,h) at order h^{d+1} or higher and v(h·J) does not read them, so the identity for k ≤ d is the same for any finite truncation at weight ≥ d (`local-splitting.tex` l.137–144 states the truncation). No change needed.

### The insertion (l.30–48)

- **C5 (l.30–35).** I_{N,p}(v;x;U) = a_N^{-d} L_d(D_{θ_N^{-1}} R_{d,N,p}^{-1} v; x; U) for N ≥ r_d. Correct as a form; a_N, (N,p) and U are used before they are introduced (M3).
- **C6 (l.36–37).** θ_N is positive; D_t scales by the number of curvature factors, not the weight. Correct, given M2.
- **C7 (l.37–45).** R_{d,N,p} invertible, given by exact transport of the inserted density from N to r_d with the same block integrations as the uninserted density; transporting R^{-1}v gives coefficient v at r_d. Correct. The phrase "fixed by" is the earlier review's nit 2 (no severity here).
- **C8 (l.45–48).** The maps must have this transport; the same maps at every translated anchor; levels below r_d do not affect limits. Correct: a limit as N → ∞ ignores finitely many N.
- Cited labels `sec:local-splitting`, `sec:terminal-marked-construction`, `sec:ex-marked-field-local` resolve to section labels (l.42–43); their remainder bounds were not checked (N1).

### The remark (l.50–65), re-derived step by step

1. *If L_d(v) is constant c, then h ↦ v(h·J) has constant term c and other coefficients zero (l.52–55).* A constant function evaluated at H(J,h) has Taylor data (c,0,…,0), and H(J,0) = 1. A monomial of weight w contributes h^w to v(h·J), and every monomial of v has w ≤ d, so h ↦ v(h·J) is a polynomial of degree ≤ d, determined by its Taylor data through order d. Correct. The word "constant" needs only constancy along h ↦ H(J,h), so either reading of it suffices. The placement of "`its degree is at most $d$`" after the conclusion is the earlier review's nit 1.
2. *Taking h = 1 gives v(J) = c for every J (l.55–56).* Correct.
3. *L_d is injective, and a nonconstant polynomial has no constant local representative (l.56–57).* Correct. Both use that a polynomial vanishing on all real jets is zero (for v − w, and for v − c·1). The remark leaves this unstated; the earlier review supplies it: "this is `Labels.eval_ext` in the source" (`Labels/Polynomial.lean:38–49`; in prose `local-splitting.tex` l.127–129). No severity.
4. *Since D_t (for positive t) and R_{d,N,p} are invertible, the insertion space contains nonconstant functions whenever V_d does (l.57–60).* Correct: D_{θ_N^{-1}} R^{-1} ranges over all of V_d, a_N^{-d} ≠ 0, and step 3 applies to any w outside the span of 1. The step uses from D_t only invertibility; the weight grading enters only in step 1.
5. *On large tori the stencil does not wrap and link assignments extend (l.60–62).* Correct: the torus insertion evaluates the section on wrapped edges, and the placement condition of the family (`Makes.places`, `Source/Construction.lean:50–51`) makes the wrap injective on the stencil for N ≥ r_d.
6. *Scope (l.62–64).* Correct, and no stronger than the proof: the proof shows that the constant insertions at a level form at most a one-dimensional space. Nothing in it touches continuum limits.
7. *d = 0, 1.* All weights are ≥ 2, so V_0 and V_1 consist of constants; the remark is vacuous and true.

`evidence/remark_polynomial_step.py` (exact rationals, `python3 -I`, exit 0) checks steps 1–2 on a two-variable model, that x·y (weight 5) has zero Taylor data through order 4 (the degree bound is needed), the case d ≤ 1, and step 4 for factor-count scaling. An example, not the argument.

### The preamble (l.67–80)

- **C9 (l.69–70).** The group "as specified above" is statement.tex l.39–49, before the `\input` at statement.tex l.57. Correct. The phrase "`every positive blocking penalty $b$`" has no pointer (M6).
- **C10 (l.70–76).** One spacing sequence, one period sequence, bare coefficients and the insertions, on a single Wilson construction; the coefficients satisfy `ex-running-input` (statement.tex l.74–78, a forward reference); these choices precede any subsequence. Correct.
- **C11 (l.78–80).** For every (u,p) a refinement (u∘v, p∘q) and one common system. Correct; the letter v is overloaded (M7).

### Item 1 (l.82–106)

- **C12 (l.83–86).** F_d = V_d/N_d with N_d the labels whose insertion vanishes in all separated mixed correlations with arbitrary spectators. Correct.
- **C13 (l.86–87).** Compatible injective grade inclusions, unit, conjugation, derivatives, symmetry actions. Correct as stated; how the inclusions act on labels is the subject of M1.
- **M1 (Should; l.87–88, l.92–97).** The grade of each label is implicit; see the README. Re-derived: the V_d are nested (l.11–12), the insertion depends on d through a_N^{-d}, L_d and R_{d,N,p}, and in the source the constant polynomial at grade d represents a_{r_d}^{-d} times the unit (lean-correspondence.md, item 1), so in general the same polynomial represents different fields at different grades.
- **C14 (eq:headline-wilson-limit, l.90–99).** Inner limit along the full mesh, outer along p(q(k)), normalization a_N^{4n}, sum over physical lattice points, right side ∫ f S^mix. Correct. The cross-reference for the sum is M4.
- **C15 (l.103–106).** Inner limit at every suitable fixed period; one refinement for all labels, arities and tests; the refined mesh only for auxiliary comparisons. Correct.

### Item 2 (l.108–122)

- **C16.** X compact metrizable, ν a probability of full support, S^χ smooth, separated and multilinear, the mixture identity, X the characters of the commutative compressed slab algebra, ν representing its vacuum state, reflection positivity and equal null relations in every component. Correct; each clause is a field of the source's selection data (`Resolution`, `Resolution.Out`) or certificate, the release theorem `Resolution.barycenter`, or (multilinearity) the type of the correlations (lean-correspondence.md). The word "metrizable" is weaker than the source's metric, harmlessly. The four cited section labels resolve.

### Item 3 (l.124–137)

- **C17 (l.125–132).** For every χ ∈ X a nontrivial local relativistic theory with the listed Wightman properties, vacuum line exactly the translation-invariant vectors, nonzero labels acting nontrivially, vacuum distributions the boundary values of S^χ. Correct. The word "nontrivial" in the sense of Definition `ex-reconstructed` (statement.tex l.139–140) follows at every character from faithfulness, because the unit label is nonzero. The remark's "nontriviality" (l.64) is another sense of the word (M10).
- **C18 (l.133–135).** Phase-mixture identity on joint Schwartz tests; the cited `thm:joint-boundary` and `sec:word-reconstruction` exist (`analytic-boundary.tex` l.166, `reconstruction.tex` l.2). Correct.
- **C19 (l.136–137).** The selection of `χ_*`. `ex-pure-ground` (`phase-selection.tex` l.121–132) gives a one-dimensional ground space for almost every χ and "In particular there exists a phase with this property"; `rem:ex-selection-ground-only` (`phase-selection.tex` l.176–192) chooses `χ_*` from that set. So "as in" describes how `χ_*` is chosen. The quantifier is L1 (lean-correspondence.md). The conditional hypotheses of `ex-pure-ground` are producer work (N2).

### Item 4 (l.139–164)

- **C20 (l.140–142).** One OPE for the mixed state and every component with the bounds `ex-ope-coefficient`–`ex-ope-remainder` (`assembly.tex` l.23, l.35; l.37: "`\(s\) can be any character or the mixed state`"). Correct.
- **C21 (l.142–147).** A symmetric conserved stress tensor whose translation and rotation charges implement the derivatives and the (infinitesimal) rotation action; normalization and separated Ward identities of the two cited sections, whose labels resolve. Correct.
- **C22 (l.148–159).** Θ is the four-dimensional trace minus its `χ_*`-expectation; "This very field"; lim r^8 log²(1/r) `S^{χ_*}_{Θ,Θ}(−re_t/2, re_t/2)` = 3 dim_R g/π⁴ with time last (statement.tex l.53). Correct; the constant was re-derived from the source (lean-correspondence.md), as the earlier review also states.
- **C23 (l.160–164).** Vanishing one-point functional, the finite mass-shell-profile exclusion of `sec:trace-profiles`, and the citation of `lem:trace-normalized-stress` and `thm:trace-asymptotic`. Correct; M9 on the citation of a conditional theorem.

### The closing sentence (l.166–167)

- **C24.** Quotients, phases and reconstructions may depend on the order and refinement; the lattice family does not. Correct.

### The scope paragraph (l.170–196)

- **C25 (l.171–176).** Contact extensions, nested OPE, effective couplings and Maxwell scaling are not asserted; no numerical slope is substituted. Correct; omitting results the source proves denies nothing.
- **C26 (l.178–185).** No uniqueness or independence claims, no continuum measure, Wilson loops, particle states or mass gap, no perturbative agreement, and the trace test does not exclude every generalized free field. Correct: the trace clauses constrain only the two-point function of Θ. The section numbers of `\cite[Sections~2, 7--9]{YMG26}` (l.185) agree with the section headings of the in-repo reading report `results/G01/assessment/relevance-report.md` and of a local text extraction of `docs/assessment-1.pdf` (yang-mills-group/YM at `55ba9fc3`, SHA-256 `8e658c00…`); the assessment's content beyond those headings was not checked (N3).
- **C27 (l.187–189).** The "weaker target" sentence. True of the Lean statements; as prose, three clauses of the weaker target are not stated in the headline (M5).
- **C28 (l.190–196).** `ex-conditional-existence` (`assembly.tex` l.128) establishes only the weaker target; completion needs the listed data on one extraction; selected-phase statements must not stand for item 3. Correct; matches #439 items 1–4. The earlier review: "`ex-conditional-existence` still yields only the weaker target". Note for #439 (owner of `assembly.tex`): `assembly.tex` l.129–130 still says "the full existence target stated in" Section `ex-statement`, which now also contains the headline; l.190–192 of the headline disambiguates.

### The changed lines of `statement.tex`

- **C29 (statement.tex l.12–13).** The public target "is one statement that the source verifies by machine." Correct: the public target is `YangMills.JointExistence` (`ChallengeSpec.lean:186–188`), proved as `YangMills.jointExistence` in `Solution.lean` from `YangMills.constructed` with b = 1; it is formulated from statement.tex l.59 on.
- **C30 (statement.tex l.30–32).** The new subsection "proposes a stronger headline ... with references ... and an explicit account of the remaining assembly". Correct (l.67, l.170–196).
- **C31 (statement.tex l.57, l.59).** The `\input` follows everything the headline calls "above" (the group, statement.tex l.39–49; time last, statement.tex l.53). The new heading has no `\label`; no finding.

No other finding in this file.

### The author record

The crosswalk rows, the phase paragraph (l.49–54), the remark paragraph (l.56–68), the five obligations (l.88–109) and the #382 disposition (l.111–117) were read against the text and the source; the rows are assessed in lean-correspondence.md. The remark paragraph states nothing the remark does not. Obligations 1–4 match #439 required items 1–4 and obligation 5 its acceptance review. The disposition matches #382 and the comment of 10:47:01 UTC ("The headline is still a proposal"). All 13 hashes of `hashes.sha256` recompute at `9c631687`. No finding beyond L2.

### The `unit.json` line

- **C32 (l.546).** `"manuscript/existence/construction-headline.tex"` is added to the `manuscript` list of YM-000026 (246 entries; status `draft`; review fields null). `blueprint/README.md` l.70–71: "Include nested inputs". No finding.

## 3. Findings and evidence

The findings are stated in the README, with suggested wording: M1 (Should), M2–M10 (Minor). Items already in the earlier review or the author record carry no severity and are listed there.

## Required changes and remaining uncertainty

No required change. Should: M1. Minor: M2–M10.

Not checked:

- **N1.** Any producer proof: whether the cited chapters prove what the items cite them for, including the remainder bounds of l.42–43 and the phase, reconstruction, stress and trace chapters.
- **N2.** The hypotheses of the cited conditional results (`ex-pure-ground`, `lem:trace-normalized-stress`, `thm:trace-asymptotic`, `ex-conditional-existence`) and the assembly obligations of the scope paragraph and #439.
- **N3.** The content of YMG26 beyond its section headings.
- **N4.** The manuscript build: no LaTeX build was run, so the author's and the earlier review's build claims (1073 pages, no undefined references) were not checked.
- **N5.** Whether the penalty λ of `flat-step.tex` l.325–326 is the b of l.70 (M6).

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance.
