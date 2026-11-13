# Review of a proof unit

- Unit: YM-000033, `blueprint/units/YM-000033/`
- Role: mathematical validity
- Human reviewer: `hairer` (account under which this report is submitted; no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `hairer-claude-issue33-review-20261113`. The unit was drafted with GPT-6.1 Terra (Codex), so the reviewing model family differs from the authoring one.
- Content SHA-256: `f4ab86a58f7df57adc923ef2298df4377c1942c8a6a2cebcf74c641f396d5657` (`python3 scripts/check_blueprint.py --fingerprint YM-000033` at `69c254b`)
- Manuscript files and labels: `manuscript/existence/trace-prosper-sensor.tex` (`sec:trace-prosper-sensor`, `prop:trace-prosper-sensor`, equations `eq:trace-sensor-*`), read in full. Support files from `unit.json`: in `trace-weighted-estimates.tex`, `lem:ex-lattice-trace-weighted-price` and `lem:ex-lattice-trace-medium-receipts` were read with their hypotheses; in `trace-small-means.tex`, the statement of `lem:ex-trace-small-means` was read; `trace-free-rank.tex` was used only for the rank fact \(\ker f=\mathbb Rx\), \(x\neq0\), and its labels; `preamble.tex` was not reviewed.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#33](https://github.com/hairer/humanise-yang-mills/issues/33) (claim by `hairer`, 13 November 2026); author PR #71; this report's PR: draft against `codex/existence-monograph`.
- Outcome: **changes requested.** No mathematical error found; every derivation in the chapter was checked step by step. One required presentation change (R1) and four minor items. Acceptance would be local and conditional on the explicitly listed inputs.

## Findings and evidence

I checked every displayed step of the chapter. In order:

1. **Free normalisation (lines 1–96).**
   - The three evaluation rows: \((0,2,0)\) for the jet with \(F_{12}=1\); \((1,2,0)\) for \(F_{01}=1\), \(\partial_0F_{01}=1\), \(\partial_2F_{21}=-1\), where \(J^{(3)}_0=\partial_0F_{01}+\partial_2F_{21}=0\); \((1,2,1)\) for the last jet. The determinant is \(-2\neq0\).
   - The Bianchi check of the first jet: \(1-\tfrac12-\tfrac12=0\). The other two jets have only repeated-index derivative entries, so the cyclic identity holds trivially.
   - The radial-gauge potential and \(\partial_c(\partial_aA_b-\partial_bA_a)(0)=\tfrac13(2K_{cab}-K_{abc}-K_{bca})=K_{cab}\).
   - The divergence computation, including \(B=J^{(2)}-B\) via the Bianchi identity and the exchange \(a\leftrightarrow i\), giving coordinates \(2(w_0-w_2),\,2w_1+\tfrac12w_2,\,w_2\).
   - Trace \((w_0+4w_1)\mathcal I\), hence \(\rho=-4(w_0+4w_1)\), \(J^{(3)}\mapsto(1,-\tfrac14,1)\) and \(\rho(x)=0\).

   All correct.
2. **Clock ratio (lines 97–138).** The minimal-overshoot bound \(0\le\ell_{q(k)}-\ell_k\le2g\) uses \(\widehat\beta_m\le\chi+\gamma g\le2\chi\) and \(\log L_m\le L_m\le\log\widehat\beta_m\le\log 2\chi\le g\). From it follow \(\widehat\beta_{q(k)}/\widehat\beta_k\to1\) and, with \(|b_j-\widehat\beta_j|\le\varepsilon\ell_j\le\varepsilon\widehat\beta_j/\gamma\), the limit \(b_{k_i}/b_{n_i}\to1\). Correct.
3. **Chart, right inverse and parity (lines 139–220).** \(s_iu_i=\mathrm{id}\) follows from \(\operatorname{core}M_iY_ih=M_iY_ih\) and \(PY_i=X_i\). The parity argument for the vanishing unit coefficient (total inversion acts by \(-1\) on lifted vector components and fixes \(e_0\)) is correct. So is the construction of \(U\): the \(\Gamma\)-averaged Hermitian form makes the signed action unitary and conjugation antiunitary, and \(K\) is real and stable, so the orthogonal-complement section intertwines both.
4. **Tested map and centring (lines 255–288).** Injectivity of \(\mathsf T\) from the first bound. Recentring with \(v^\circ=v-(\mathsf Tv)_0\mathbf1\) gives \(\mathsf Tv^\circ=\operatorname{core}\mathsf Tv\), \(\operatorname{core}\mathsf Av^\circ=\operatorname{core}\mathsf Av\), \(|\mathsf Av^\circ|_1\le2|\mathsf Tv^\circ|_1\), and hence `eq:trace-sensor-centered-price` with constant \(2\eta_i\). Correct (see R3 for one wording point).
5. **Calibration (lines 290–339).** Every nonunit coordinate of an odd two-factor label has position degree 5 and factor degree 2, because jet factors have weight \(r+2\) and sign \((-1)^{r+2}\). Then \(\mathsf T\lambda_i=\operatorname{Dil}_{\xi^{-1}}\operatorname{Pos}_{\sigma_i}p=\xi^{-2}\sigma_i^5p\) and \(\xi^{-2}=\beta_i\vartheta_{k_i}^2\). Multiplying by \(\vartheta_{k_i}^{-2}d_{k_i}^5\) gives exactly `eq:trace-sensor-finite-price`, using \(r_i=d_{k_i}\sigma_i\). Correct, except that the vanishing of one-factor invariants cites an argument that is not in the cited files (R2).
6. **Transport price (lines 341–466).**
   - Backward induction: \(|z_j-z_{n_i}|_1\le a(n_i-j)|z_{n_i}|_1\) with \(a=\delta_i/N_i\) and \(aN_i\le1\).
   - Grade scaling: Block factor 1 and dilation factor \((\vartheta_j/\vartheta_{j+1})^2\) on the nonunit coordinates. Applying the core and dividing gives \(|z_j-z_{j+1}|_1\le4g_j|z_{j+1}|_1\).
   - Budget comparison: \(N_i\le2(\log\chi)^{48}\), \(C_{j+1}\le2\log\chi\), \(A_{1/2}(j+1)\ge A_{1/2}(k_i)\), and \(32(\log\chi)^{48}(1+2\log\chi)\le A_{1/10}(k_i)\) eventually.

   All correct. The quantifier handling is also correct: finite intersection over \(k_i\le j<n_i\) for fixed \(i\), then the ultrafilter limit, then \(i\to\infty\).
7. **\(u_i\to U\) (lines 456–475).** I checked the identity \((u_ih)_\alpha=(b_{k_i}/b_{n_i})\mathsf R_i\) from \(c_i=b_{n_i}r_i^5\) and \(D_i=b_{k_i}r_i^5\). I also checked the constant exactly: \(\delta(1+2\eta)/(1-\delta)+2\eta=(2\eta+\delta)/(1-\delta)\). Correct.
8. **Proposition and proof (lines 476–540).** \(T_i=u_if+A\otimes v_i\to\mathrm{id}\), \(s_iT_i=f+A\otimes s_i(v_i)\) on the tail, and the explicit bound \(\|s_i-f\|\le(\|A\|\|s_i(v_i)\|+\|f\|\epsilon_i)/(1-\epsilon_i)\). Lemma `lem:ex-lattice-trace-weighted-price` is applied with all its hypotheses supplied. Its own proof (read in full) is correct.
9. **Medium paragraph (lines 542–564).** Consistent with `lem:ex-lattice-trace-medium-receipts`. That lemma's \(e_i/b_i\to0\) and \(e_i\le p_i\) are proved in `trace-weighted-estimates.tex` at the postselected level, which that file now says explicitly. The comparison \(A_{1/5}(n_i)\le\widehat\beta_{n_i}\) is correct.

**Support files changed after the author's build.** `trace-weighted-estimates.tex` and `trace-small-means.tex` were edited by the C15 author pass (`f8022ce`) after PR #71. I compared them with the author's base `aa2e995`. The statements of the two lemmas and of `lem:ex-trace-small-means` used here are unchanged in substance; the edits clarify definitions and point back to this unit. The sensor chapter itself is unchanged. As a side effect, the unit's wrapper now has two undefined references (R5).

**Existing results.** The two analytic tools are the Neumann series and the rank-one receiver lemma. Both are elementary and proved or cited correctly. I know of no literature result that would shorten the chart derivations, which are bookkeeping of the source's normalisations.

## Required changes and remaining uncertainty

- **R1 (required, presentation).** The proposition's hypotheses are given by reference to prose: "the tested-map, selected-lift and finite-volume normalization inputs described around (…)–(…)" and "the stated oddness, joint convergence and column-budget inputs". In the text, the inputs are introduced by "Assume" or "Suppose" inside paragraphs that also derive consequences. A reader cannot extract the exact hypothesis list, with quantifiers, without re-reading the whole chapter. For a research monograph, state the inputs as a numbered list immediately before the proposition (for example (S1) clock and block-size inputs; (S2) chart formulas and identities with their tails; (S3) symmetry intertwining; (S4) joint transport and lift convergence along the ultrafilter; (S5) tested-map bounds and calibration; (S6) one-step residual and threshold ratio, with the quantifier "for each fixed \(j\), eventually in \(\nu\), uniformly in \(N>j\) and the label"; (S7) column budget and oddness preservation). Make the derived intermediate results labelled lemmas: the arch ratio, the initial price, the transport price, and \(u_i\to U\). The proposition can then cite them. No mathematical change is needed.
- **R2 (minor).** Line 306: "A one-factor invariant vanishes by the invariant-linear-form argument in the low-grade label calculation above". This argument is not in this chapter or its listed support files; `trace-free-rank.tex` treats invariant *bilinear* forms. Give a label, or the one-line proof: an \(\mathrm{Ad}\)-invariant linear functional on a simple Lie algebra vanishes on \([\mathfrak g,\mathfrak g]=\mathfrak g\).
- **R3 (minor).** Lines 266–280: \(\mathsf A,\mathsf T\) are called "complex-linear maps on the finite complex coefficient space", and then "the two finite-dimensional coefficient spaces have the same dimension" is used for invertibility. Say which spaces they are. If both maps are endomorphisms of one space, injectivity suffices and the sentence can go. If not, justify the equality of dimensions or make it part of the input.
- **R4 (nit).** Lines 233–234: "Fix one ultrafilter on these pairs containing both coordinate tails." In the source the ultrafilter satisfies \(\mathcal L\le F.\mathrm{fuse}\) (`hb` in `springs`). Say that the inputs are taken along the selected ultrafilter, which refines the fused order, and that only its coordinate tails are used in the argument.
- **R5 (record).** The wrapper `evidence/wrapper.tex` now builds to 19 pages with two undefined references (`prop:ex-lattice-charge-bounds`, `prop:ex-trace-mission-price-transfer`). Both were introduced into the support chapters by the C15 pass. They are not in this unit's chapter. Update the wrapper or its validation note before integration.

Not checked: the full production of the inputs (by design they are hypotheses); `preamble.tex`; the parts of the support chapters not cited here.

## Acceptance

No acceptance is recorded. After R1–R3 are resolved, a renewed check of the changed text at its new fingerprint is needed. Then the responsible human reviewer may record local acceptance, conditional on the listed inputs.
