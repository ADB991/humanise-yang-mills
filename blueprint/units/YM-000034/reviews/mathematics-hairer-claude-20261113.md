# Review of a proof unit

- Unit: YM-000034, `blueprint/units/YM-000034/`
- Role: mathematical validity
- Human reviewer: `hairer` (account under which this report is submitted; no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `hairer-claude-issue34-review-20261113`. The unit was drafted with GPT-6.1 Terra (Codex), so the reviewing model family differs from the authoring one.
- Content SHA-256: `59b66debcf4ebb92ff4ff13f8c71ab481350e623ed61dc37fd91ddabd60f1ba7` (`python3 scripts/check_blueprint.py --fingerprint YM-000034` at `69c254b`)
- Manuscript files and labels: `manuscript/existence/trace-branch-moments.tex` (`sec:ex-trace-branch-moments`, `prop:ex-branch-moments`, `prop:ex-branch-raw-fast`, `prop:ex-branch-washout`, equations `eq:ex-branch-*`), read in full. From the support files in `unit.json`: in `trace-free-rank.tex`, the "Low-grade invariant labels" subsection and the existence of `lem:ex-trace-free-stress-basis`, which are the only parts the chapter cites. `ope-filtration.tex` is not cited by the chapter (R2). `preamble.tex` was not reviewed.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#34](https://github.com/hairer/humanise-yang-mills/issues/34) (claim by `hairer`, 13 November 2026); author PR #70; this report's PR: draft against `codex/existence-monograph`.
- Outcome: **no required change; two minor requests (R1, R2).** No mathematical error found. Acceptance would be local and conditional on the explicitly listed chart, recording, transport and purchase inputs.

## Findings and evidence

Checked step by step:

1. **Material tensor (lines 61–120).** Injectivity of \(w\mapsto\mathcal S(w)\) on the jets \(F_{01}=v\), giving the \((2,2)\) and \((0,0)\) entries \(2w_2|v|^2\) and \((w_1+2w_2)|v|^2\), and \(F_{02}=F_{12}=v\), giving \((0,1)\) entry \(w_3|v|^2\). Symmetry and invariance under the signed and real average. \(\operatorname{tr}M(w)=4(w_1+4w_2)\mathcal O\). The traces \(0,0,4\mathcal O\) for \(w^0=(-1,\tfrac14,-1)\), \(w^-=(0,0,1)\), \(w^+=(0,\tfrac14,0)\). The coefficients \(w^\pm\) agree with the displayed correction fields \(J^\pm\).
2. **Chart identity (lines 122–160).** \(V_{k,c}B_kx=c\,\pi A_k^{-1}KA_kx\). The difference from \(c\,\pi x\) is a multiple of \(\pi A_k^{-1}e_0=a_k^{-4}\mathbf1_4\), which centring removes.
3. **Coefficient limit (lines 170–230).** \(\|z-\vartheta_k^{-2}K\Gamma v\|_\infty\le\vartheta_k^{-2}\|\xi-\Gamma v\|_{\mathrm c}\le\delta_k\), using \(z=\vartheta_k^{-2}K\xi\). Then the two-set bound \(\|\mathsf R\|\delta_k+\|T\|\varepsilon\), preserved by the fixed-\(k\) ultrafilter limit, and the order \(k\to\infty\) before \(\varepsilon\downarrow0\). The principal-witness argument is sound as a deduction from its stated local inputs:
   - the invariant linear functional on a simple algebra vanishes;
   - the Hessian kills infinitesimal gauge directions because the first variation vanishes;
   - the elementary-direction bound \(16(1+\max(r_i,r_j))^4\);
   - the compactness-by-contradiction upgrade, using injectivity of \(T\).
4. **Slow trace (lines 338–354).** \(\|\operatorname{tr}W^b_k\|\le4\|\mathsf R\|\delta_k\) for \(b\in\{0,-\}\). The remark that \(\widehat\beta_k^p\delta_k\to\infty\) is correct: \(\tfrac14(\log y)^2\le4\sqrt y\).
5. **Moment-map convergence (lines 355–615).**
   - Injectivity of \(\pi_0\) at grade four via the constant-curvature affine Maxwell solutions, and \(\mathcal O\neq0\) (value \(\tfrac12|v|^2\)).
   - The recentring bound \(\|K(\mathcal Nv-\mathcal Tv)\|_{\mathrm c}\le2\alpha\|K\mathcal Tv\|_{\mathrm c}\), and the lift scaling \(\vartheta^{-2}a^4\) with \(\beta(a_mh)^4\).
   - The one-step factor \(4g\) and the backward induction.
   - The summit bound \(0\le g_j\le2\operatorname{Gate}(\widehat\beta_j)\), so \(\widehat\beta_{\mathrm{summit}}/\widehat\beta\to1\), and the scheduled budget \(32(1+2\log x)(\log x)^{48}\le e^{(\log\log x)^2/10}\) eventually.
   - The \(Z_i/X_i\) combination, and \(\mathsf M_i\mathcal A_ix=\pi_0x-\langle U_i\pi_0x\rangle\mathbf1^0_4\). The latter uses \(\pi Y_i=U_i\) and the eventual transport of the unit, which is correctly flagged as an input.
   - The Neumann inverse with \(\|\mathcal A_i^{-1}-1\|\le2\|\mathcal A_i-1\|\).
6. **`prop:ex-branch-moments`.** The chart-array identity is the chart identity applied to \((\mathsf R\operatorname{sym}x)_{ac}\) after commuting \(B_k\) with the average. The limit is \(\operatorname{sym}(\mathfrak c_0\pi_0\mathcal S(w^b))=M(w^b)\). Correct.
7. **Recording machinery (lines 660–920).**
   - Grade-three fields are multiples of the unit (one factor at most; the invariant linear part vanishes).
   - Detection inequality `eq:ex-branch-moving-detector`.
   - The radius bound \(R(x)=O(x^{122/32})=o(x^4)\).
   - The geometric tail \(\operatorname{tail}_{k+1}\le\tfrac23\operatorname{tail}_k\), using \(a_{k+1}\le a_k/3\) and \(J_{k+1}\le J_k+1\).
   - The rooted price is fast for every \(\eta<1/8\).

   All correct as deductions from the stated purchase and spectator inputs.
8. **`prop:ex-branch-raw-fast`.** The averaged functional \(\Lambda^\sigma_k\) over \(n_k=\lceil e^{(1-\tau)s_k}\rceil\) displacements telescopes the difference identity to \(|\Lambda^\sigma_kw_{d,k}|\le D^\sigma_{d,k}+2E^\sigma_{d,k}/(a_kn_k)\). The endpoint values agree by the grade-three unit property. Only a finite intersection of large sets is used at each fixed \(k\). The false branch is exactly zero; the principal trace is exactly \(\sum_d\nabla_dQ_d\). Correct. The explicit rate \((1+s)^5e^{-s/8}\) with \(n_k=\lceil e^{s_k}/(1+s_k)\rceil\) is also correct.
9. **`prop:ex-branch-washout`.** \(\operatorname{tr}t^b_k=|\mathcal G|^{-1}\sum_g\mathfrak c\rho_g(y^b_k)\) is fast and centred. With \(\pi r^b_k=q^b_k\), the chart identity gives \(\widehat\beta^p\operatorname{tr}(\mathsf P_it^b)=\mathsf M_i(\widehat\beta^pB_{k_i}r^b_{k_i})\to0\), because \(\|B_k\|\le C\widehat\beta_ke^{\ell_k}\) is subexponential. The explicit rate exponent \(p+6\) and the true-branch divergence (limit trace \(4\mathcal O\neq0\)) are correct.

**Support files after the author's build.** The chapter is unchanged since PR #70. `trace-free-rank.tex` and `preamble.tex` are also unchanged. `ope-filtration.tex` was revised by C05 (`8b15d44`, `5d68524`), but the chapter does not cite it.

**Existing results.** The tools are the Neumann series, finite-dimensional compactness and norm equivalence, Schur-type colour facts (proved in `trace-free-rank.tex`), and the closed-ball/ultrafilter passage. All are elementary and used correctly. No literature result would replace the chart bookkeeping.

## Required changes and remaining uncertainty

- **R1 (minor).** Two propositions cite their hypotheses loosely. `prop:ex-branch-raw-fast` says "Assume the recording and test properties above". `prop:ex-branch-washout` says "Under the recording and transport estimates". Cite the labels instead (`eq:ex-branch-book-current`–`eq:ex-branch-book-tensor`, `eq:ex-branch-recorded-difference`, the separation and continuity of \(L^\sigma_d\), the grade-three unit property). Also label the transport bound \(\|B_k\|\le C\widehat\beta_ke^{\ell_k}\) (around line 1030) and cite it in the washout. `prop:ex-branch-moments` already does this well.
- **R2 (minor).** `ope-filtration.tex` is listed in `unit.json` and input by `evidence/wrapper.tex`, but the chapter never cites it. Since the C05 revisions it brings seven undefined references into the wrapper build: the two the author recorded plus five `finite-rank-*` labels. Remove it from the unit and the wrapper, or say what it supplies.

Not checked: the production of the inputs, which are hypotheses by design (finite-volume purchases, spectator estimates, local Hessian comparisons, point limits, chart one-point convergence); `preamble.tex`; and the rest of the support files.

## Acceptance

No acceptance is recorded. The responsible human reviewer may record local acceptance, conditional on the listed inputs, either now or after R1–R2 (which change the fingerprint only if the chapter or `unit.json` is edited).
