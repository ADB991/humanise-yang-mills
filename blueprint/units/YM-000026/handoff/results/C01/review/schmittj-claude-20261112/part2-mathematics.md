# C01 review, part 2: mathematical validity

- Package: C01 "Lattice normalization, flat estimates and free kernels" (issue #42), author draft PR #81 at `165fb24`; author changes `git diff 18d0327 HEAD`.
- Part 2 scope: `manuscript/existence/free-kernel-estimates.tex` (725 lines), `manuscript/existence/free-kernel-components.tex` (453 lines), `manuscript/existence/kernel-transport-identities.tex` (277 lines). Other chapters were read only for notation and inputs (`atlas-estimates.tex` lines 14–120 and 178–272, `rg-horizon-geometry.tex` lines 160–215 and 285–310, `curvature-horizon-producer.tex` lines 100–130 and 245–262).
- Role: mathematical validity (review question I). Reviewer session `schmittj-claude-c01-review-20261112`; Claude agent, independent of the Codex author and checker passes. No human acceptance is recorded.
- SHA-256 of the three chapters at start and end of the review: identical to the coordinator's list (see `part2-validation.md`).
- Labels: ERROR, GAP, INACCURACY, NIT. Each finding states whether it is in the manuscript or the records and whether PR #81 introduced it.

## Summary

I redid every displayed computation in the three chapters: the contour shift and geometric sum, the residue sum bound 81, the alias size and phase bounds, the carry identity and its Fourier form, the reality argument added by PR #81, all one-dimensional rail/plank estimates, the quantitative reciprocal continuation, the finite-history train induction (upper and lower exponents 8·zone and 8·c₀), the noise recursion, the bulb/bend identities, the port and tail weights, the dual-stencil branch identities (stake and copper), the reciprocal-shift argument, the rotor and filter-chain identities, the three punctured identities, the alias sum, the principal and nonprincipal gain formulas, the brace cancellation, the principal wire formula, the zero-mode values and the L⁻³ counting normalisation. I found no false displayed identity or inequality and no ERROR. Every PR #81 change in these chapters is mathematically correct (section "PR #81 changes" below). The main defect is a GAP: the transport chapter treats the one-form column A₀ as "already estimated", but no chapter proves its weighted analytic bound, and the A₀ strip receipts used downstream depend on it (M1). The other findings are a thinly justified passage from symbol identities to finite-torus matrices (M2), Lean-named objects used in the branch algebra without definition (M3), an installed identity proved but missing from the final display while the ledger lists it (M4), and minor inaccuracies and nits.

## Findings

### M1. GAP. The one-form column A₀ is used as "already estimated", but its analytic estimate is not proved anywhere. Manuscript; pre-existing (PR #81 adds one more sentence relying on it).

Location: `kernel-transport-identities.tex` lines 136–137 and 187–193; `free-kernel-estimates.tex` lines 624–626 and 633 (added by PR #81).

Passages: "We check that these formulas are the analytic columns whose bounds were proved earlier." and "The denominators $b_a$, $sa$, and $m_0$ have the common analytic lower bounds established in the component estimates. Consequently $\mathcal A_l=B_l+\operatorname{diag}(g_{l,a})x_l\sigma$ is the already estimated analytic column, including at the origin." and "The same argument gives this conjugation law for the one-form pilot column, using its own script formula".

Verified reasoning. `free-kernel-components.tex` estimates only the two-form dual stencil: `prop:ex-lattice-wire-entrywise-bound` bounds $W_{P,0}$ and $W_{P,l}$, and its lemmas cover the masses, fluxes, signals, train factors, ports, levy, tail and notch used there. No statement bounds the one-form column $\mathcal A_l=B_l+\operatorname{diag}(g_{l,a})x_l\sigma$. In particular nothing bounds the gains $g_{l,a}$ or the regular denominator $sa=|m_0|^2\sum_ab_{0,a}+sh$ from below on a common complex cube; `lem:ex-lattice-tail-notch-weights` does not mention $sa$. `thm:ex-lattice-wire-tower-strip` is stated for a generic thread $F$, so it would give A₀ strip receipts with $e=1$ once the entrywise weighted bound for $\mathcal A_l$ is available, but that bound is never proved. The downstream chapters need it: `rg-horizon-geometry.tex` lines 290–296 asserts iterated primal differences of cost $M_0L^{-(1+r)}$ "inherited unchanged from the donated tower", and `curvature-horizon-producer.tex` lines 254–256 relies on the same A₀ rows. In the pinned source this input is the separate theorem `YM.Next.Free.Flight.pilot_cost` (`Lean/YM/Next/FREE_KERNELS/Docked.lean`), fed to `Secured.honored` with $e=1$ in `YM.Next.Free.pledges` (`Priced.lean` line 51). I checked that the transport chapter's regular form is exactly the source's `pilot` (`Pilot.lean`: `ahead` is $B_l$, `fled`/`rests` are $g_{l,a}$ for $l\neq0$ and $l=0$, `sluice` is $\sigma$, `abide` is $sa$), so the identity part is correct; only the estimate is missing. The estimate is routine with the existing lemmas: for $l\ne0$, $B_l=s\,\mathcal M_1(D_{P,l})\Phi_{P,1}(p,l)\operatorname{diag}(b^{-1})$ has weight $g_L(l)^{-2}\Gamma_L(l)^{-j}$; $g_{l,a}$ contains $m_P(-q_l)$ and port factors, giving weight $\Gamma_L(l)^{-j}g_L(l)^{-2}$, provided $sa$ has a common lower bound; $x_l$ has weight $g_L(l)$ and $\sigma$ weight one. For $l=0$ one needs the reciprocals of $m_0$, $b_a$ and $sa$. The lower bound for $sa$ on the real slice is $|m_0|^2\sum_ab_{0,a}\geq c>0$ together with $sh\geq0$, followed by the continuation lemma.

Requested change: add to `free-kernel-components.tex` a lemma and proof "the one-form column has entrywise weighted bound $C\Gamma_L(l)^{-j}$ on a common cube", including the lower bound for $sa$. Then state in `kernel-transport-identities.tex` and `thm:ex-lattice-wire-tower-strip` that the theorem applies to A₀ with $e=1$ and to T with $e=2$. Alternatively, record the A₀ bound as an explicitly named outstanding input. Replace "already estimated" at line 193 accordingly. At `free-kernel-estimates.tex` line 625, point to eq. `transport-A` for the pilot script formula.

### M2. GAP (minor). The passage from the symbol identities to the real finite-torus matrix identities is a single sentence. Manuscript; pre-existing.

Location: `kernel-transport-identities.tex` lines 254–277.

Passage: "Fourier diagonalization on each finite torus now gives the real matrix identities".

Verified reasoning. The normalisation is right. With averaged Fourier coefficients $\tilde\varphi(k)=n^{-4}\sum_x\varphi(x)e^{-ik\cdot x}$, a coarse-from-fine map with alias columns $C_l$ has counting-measure adjoint with columns $L^{-4}C_l^*$. With $C_l=LF_{1,l}$ this gives $L^{-3}F_{1,l}^*$. The scalings $\delta_r=Ld_r(q_l)$, $L^{-1}\mathcal A_l$ and $L^{-2}\mathcal T_l$ turn the second and third punctured identities and the alias sum into the displayed ones (checked line by line). However, the following facts are used without being stated: (a) the convention above; (b) for a cover kernel with an absolutely summable strip row, installation on the pair of tori of sides $Ln$ and $n$ is block-diagonal in Fourier space with blocks given by the alias columns at $p\in(2\pi/n)\mathbb Z^4$ (periodisation plus Poisson summation, legitimate by absolute summability); (c) the real coefficient rows reproduce the complex symbol, which is the reality law that PR #81 added to `free-kernel-estimates.tex` lines 607–637 but which the transport chapter does not cite. In the source these steps are `Secured.bankRead`/`record_eq` and the `Runs`/`sail_run`/`phi_run` machinery used in `Flight.tangent`.

Requested change: add a short paragraph stating the Fourier convention, the fibre/periodisation formula for installed cross-kernels with summable rows (or a reference to the corresponding calculation in `flat-step.tex`), and a citation of the reality paragraph of `free-kernel-estimates.tex`.

### M3. GAP (presentation). The branch-algebra verification uses objects named after Lean declarations that the text never defines. Manuscript; pre-existing.

Location: `free-kernel-estimates.tex` lines 339–605.

Passages, for example: "$\operatorname{notch}_P=s^2(I-\operatorname{cloud}_P)$" (line 423), "$y=\operatorname{foot}_P(p)$" (line 477), "$\operatorname{pullLine}_{P,a}(Mz)$" (line 368), "the definitions of pulse and vault" (line 389), "identify the wire with this script" / "$\operatorname{scriptT}$" (lines 588–592), "the copper and stake branch identities", "the scalar toe-feed identity" (line 513), "chip" (lines 543, 695).

Verified reasoning. I checked every identity in lines 339–605 against the source definitions (`Flight.copper`, `stake`, `footY`, `brace`, `mouth`, `notch`, `levy`, `latch`, `chainY`, `cloud`, `scriptT`, `heel`, `tailings`, `portD`, `portR`, `pulse`, `fieldD`, `scaleR`, `pullLine`, `shuttle`, `nozzle`, `levelD`, `lid`, `high`, `drain`, `bulb`, `bend`, `rho`). All of them are correct, including the matrix order in the stake and copper identities and the brace identity $sB=H-y\,vH'f_2$. But a reader without the source cannot verify them. `cloud_P`, `scriptT`, `pullLine` and `chip` are never defined. `foot_P`, `notch`, `levy`, `pulse` and `vault` are the objects $f_P$, $N_P$, $Y_{P,l}$, $\mathcal P_v$, $\mathcal V_v$ defined earlier under other names, and the text never says so. `rail` and `area` are defined only in the following section. The proof standard and AGENTS.md ask for ordinary mathematical notation without Lean scaffolding.

Requested change: define $\operatorname{cloud}_P(p)=\mathcal P_{P_{\rm land}}(p)\Sigma_1^1(p)\mathcal M_1(\mathscr D_{P_{\rm land}}(p))\Sigma_1^1(-p)^{\mathsf T}$, the script $\mathcal T_P(p,q)$ (or refer to eq. `transport-T`), $\operatorname{pullLine}_{P,a}=m_P\,\operatorname{rail}_L(\cdot_a)$ and $\operatorname{chip}(z)=e^{iz}-1$. Replace foot, notch, levy, pulse and vault by $f_P$, $N_P$, $Y_{P,l}$, $\mathcal P$, $\mathcal V$, and move the definitions of rail and area before their first use.

### M4. INACCURACY. The installed form of the first ("primal") identity is proved but absent from the final display, while the ledger says that display contains it. Manuscript (pre-existing) and records (introduced by PR #81).

Location: `kernel-transport-identities.tex` lines 260–274; `RESULTS.md` edge `C01-original-transport-identities` and the bullet "Original transport and terminal packet".

Passages: "the second and third identities in \eqref{eq:transport-punctured-three} become respectively" and RESULTS "`eq:transport-installed-identities` gives the original primal, curl and dual identities".

Verified reasoning. The first punctured identity $R_l\mathcal A_l=F_{1,l}^*R$ is proved (line 115–116, checked). Its installed form is $d_{1,f}^{\mathsf T}H_fd_{1,f}A_0=Q^{\mathsf T}d_{1,c}^{\mathsf T}H_cd_{1,c}$: with $R_f$ of symbol $d_1(q_l)^*H_ld_1(q_l)=L^{-2}R_l$ one gets $(L^{-2}R_l)(L^{-1}\mathcal A_l)=L^{-3}F_{1,l}^*R$. This form is not in `eq:transport-installed-identities`. In the source, `Flight.tangent` concludes `Inputs S A W W'`, whose field `primal` is exactly this identity (`Lean/YM/PREC/TreeMatch.lean`, `structure Inputs`), together with the curl identity and the dual identity $QA_0=I-k^{-1}R_c$. The display contains the curl identity, the identity $TH_cd_{1,c}=H_fd_{1,f}A_0$ and the dual identity. If "primal" in RESULTS means `Inputs.primal`, the ledger overstates the display.

Requested change: add $d_{1,f}^{\mathsf T}H_fd_{1,f}A_0=Q^{\mathsf T}d_{1,c}^{\mathsf T}H_cd_{1,c}$ to `eq:transport-installed-identities`, with the one-line scaling, or make RESULTS name the three identities actually displayed.

### M5. INACCURACY. Notation clash: $D_{v,a}$ is the drive in the component chapter but the covariance in the transport chapter. Manuscript; pre-existing.

Location: `kernel-transport-identities.tex` lines 16–19; compare `free-kernel-components.tex` line 59 and `free-kernel-estimates.tex` lines 341–347.

Passage: "$D_{v,a}$ is the propagated one-form covariance from Section~\ref{sec:ex-lattice-free-kernel-components}".

Verified reasoning. In `free-kernel-components.tex`, $D_{v,a}(q)=S_v(q)\operatorname{rail}_M(q_a)$ is the drive. The covariance (level response) used in the transport chapter, with $D_c=k^{-1}+\operatorname{slide}D_f$, is $\mathscr D_{v,a}$ of `free-kernel-estimates.tex` (source `Train.levelD`). The identities in the transport chapter are correct for $\mathscr D$ and false if $D_{v,a}$ is read as the drive.

Requested change: write $\mathscr D_{v,a}$ and cite `free-kernel-estimates.tex` lines 339–378.

### M6. INACCURACY. The justification of $\operatorname{chainY}_P=Y_{P,l}\mathfrak d_P^2$ is misstated. Manuscript; pre-existing (PR #81 only renamed the symbol).

Location: `free-kernel-estimates.tex` lines 413–418.

Passage: "and then using $\mathfrak d_P^2\beta_{P_{\rm land}}/\beta_{P_{\rm wing}}$ for the ratio of the two bend factors".

Verified reasoning. The identity is correct: $\operatorname{chainY}=\operatorname{yen}(m_P)(q)\rho_{\rm land}(p)/(L^4\rho_{\rm wing}(q))$, $\rho_{\rm land}=\mathfrak d_P^2\beta_{\rm land}$ and $L^4\rho_{\rm wing}(q_l)=\operatorname{blow}^2\beta_{\rm wing}(q_l)=R_{P,l}$, so $\operatorname{chainY}=Y_{P,l}\mathfrak d_P^2$. The quoted phrase misdescribes the step: $\mathfrak d_P^2\beta_{\rm land}/\beta_{\rm wing}$ is not a ratio of bend factors, and the step actually used is the divisor recovery $\rho_v=d_M^2\beta_v$ for both trains together with $\operatorname{blow}=L^2d_M(q_l)$.

Requested change: replace the sentence with the three equalities above.

### M7. NIT. Wrong one of the two inverse identities is cited. Manuscript; pre-existing.

Location: `free-kernel-estimates.tex` lines 557–558. Passage: "$\delta=\lambda d f_1$ (which follows from $f_2\delta=df_1$ and $f_2\lambda=I$)". The derivation is $\delta=\lambda f_2\delta=\lambda df_1$, which uses $\lambda f_2=I$. Both identities hold (line 537), so nothing breaks. Change to "$\lambda f_2=I$". Also, the `align*` at lines 536–541 lacks alignment points on its first row; it renders but is uneven.

### M8. NIT. Implicit restriction of the analytic width to the overlap cube. Manuscript; pre-existing.

Location: `free-kernel-estimates.tex` lines 21–27, 141–145, 171–178, 238–243. The lemma uses the same $\eta$ for analyticity and for the real overlap $|p_a|<\pi+\eta$. The wire overlap law is proved on the real cube of radius $\pi+\mathrm{zone}$, $\mathrm{zone}=\pi/4$. So one must take $\eta\leq\pi/4$, which is harmless (the source takes $\min$ of the two widths in `tapes_sound`). Also the width produced at lines 171–178 is $\sigma=b$ (with $h=b$), which is not said. Requested change: state "$\eta\le\pi/4$" and "with $\sigma=h=b$".

### M9. NIT. Ordering in `lem:ex-lattice-residue-difference`. Manuscript; the restated lemma is from PR #81, the vague hypothesis at lines 144–145 is pre-existing.

The lemma's cost clause ("Under the preceding analytic and overlap hypotheses ...") relies on the overlap law for the residue symbols. That law is stated only vaguely at lines 144–145 ("the overlap law needed to glue ...") and is derived from eq. `ex-lattice-wire-overlap` in the proof of the theorem, which comes later. The identity $K_{e,u}=\nabla_u^LK_{e,\emptyset}$ itself is proved correctly and needs no overlap or reality. Requested change: refer at lines 144–145 to eq. `ex-lattice-wire-overlap`, or move the cost clause to the theorem.

### M10. NIT. Uniformity over train histories is implicit in `prop:ex-lattice-wire-entrywise-bound`. Manuscript; pre-existing.

Location: `free-kernel-components.tex` lines 428–438. The proposition says "uniformly in odd $L\ge3$". The proof (via `lem:ex-lattice-train-component-bounds`) also gives uniformity over all wing train histories, and that uniformity is what `thm:ex-lattice-wire-tower-strip` needs. Add "and in the wing train".

### M11. NIT. Alias notation. `kernel-transport-identities.tex` line 12 writes $q_l=(p+2\pi l)/L$. Write $\ell_L(l)$ for the centered lift.

## PR #81 changes in these chapters (verified)

- `free-kernel-estimates.tex` lines 190–199 (restated `lem:ex-lattice-residue-difference`). The old statement was circular (it defined $K_{e,(a,u)}$ by the difference and then asserted it). The new recursion $\nabla^L_{(a,u)}=\nabla^L_a\nabla^L_u$, $K_{e,u}=\nabla^L_uK_{e,\emptyset}$ is correct. I rederived $S_{e,(a,u)}(r)=e^{ip\cdot c_a(r)}S_{e,u}(r+e_a)-S_{e,u}(r)$ from $\ell_L(r+e_a)+Lc_a(r)=\ell_L(r)+e_a$ and $Lq_l=p+2\pi\ell_L(l)$. Multiplication by $e^{ip\cdot c}$ shifts the coefficient index from $z$ to $z-c$, and real parts commute with this, so the identity holds for the real rows without any reality hypothesis. Correct.
- Lines 287–311, 403–418, 468 (rename $\rho_P\to\mathfrak d_P$). This removes a clash with the level scalar $\rho_v$. Correct and consistent throughout.
- Lines 607–637 (new reality paragraph). For real $p$, $m_P$ is real and even (the centered plank is real and even for odd $L$), the covariances and contractions are real and even, and $\overline{\operatorname{rail}_L(z)}=\operatorname{rail}_L(-z)$, so $\overline{\Phi_{P,r}(p,l)}=\Phi_{P,r}(-p,-l)$ via $-q_l(p)=q_{-l}(-p)$; the signals conjugate correctly. Hence $\overline{F(P,p,l)}=F(P,-p,-l)$ for $p\ne0$. At $p=0$, $W_{P,0}(0)=I$ (since $f_P(0)=1$, $\Phi_{P,2}(0,0)=I$, $\Sigma_1^1(0)=0$) and $W_{P,l}(0)=0$ for $l\ne0$ (since $m_P(-q_l(0))=0$). Conjugating eq. `ex-lattice-spread-symbol` and reindexing $l\to-l$ gives $\overline{S(p)}=S(-p)$, so the coefficients are real. Correct. The pilot sentence is covered by M1.
- Lines 670–683 (theorem hypotheses). This adds fixed adjacent stages, $k>0$, $e\ge0$, odd $L\ge3$, common width and cost, and a disclaimer on uniformity in parameters. Correct. The proof does not need the reality law.
- Lines 720–723 (remark). The atlas theorem indeed also needs the two bed bounds and the matching of the tower. Correct.
- `free-kernel-components.tex` lines 99–107 ($\eta_0$ quantifier). Correct: the lower bound $(\pi/4)(1+|\ell|)\le L|q_a|$ needs $\eta\le\pi/2$, and the denominator comparison needs $|q_a|\le\pi+2\eta/L\le3\pi/2$.
- Lines 132–156 (zero-alias rail lower bound $\ge\ell/h$ and the Cauchy continuation). I checked $|\operatorname{rail}_L(p_a/L)|=|e^{ip_a}-1|/(L|e^{ip_a/L}-1|)\ge\ell/h$. For the continuation, the line $z\mapsto y+z(p-y)/d$ stays in the cube for $|z|<\eta/2$ when $|y_a|<\pi+r$ and $r\le\eta/4$. The derivative bound is $4Cw/\eta$ on $[0,d]$, and $d<r\le c\eta/(8C)$ gives $|f(p)|\ge cw/2$. Correct and identical to `Moderate.kept`.
- Line 161 (positive integers in `lem:ex-lattice-principal-plank`). Correct. The proof checks out: $|\operatorname{plank}_M-1|\le hR_0M/L$, $|\operatorname{plank}_M|\ge p_0$, and then $e^{c_0x}|\operatorname{plank}|\ge|\operatorname{plank}|+hR_0x\ge1$.
- Lines 301–304 (reflected alias). For odd $M$, $\ell_M(-l)=-\ell_M(l)$, so $-q_l^{(M)}(p)=q_{-l}^{(M)}(-p)$; the cube is symmetric and $\Gamma_M(-l)=\Gamma_M(l)$. Correct.
- `kernel-transport-identities.tex` lines 244–248. The old text ("a positive power of its squared modulus") was false for $m_P=\operatorname{area}_L^j$. The new text is correct: $\operatorname{rail}_L(2\pi n/L)=0$ for $n\not\equiv0$, the plank is a phase times the rail, and $j\ge1$.

## What was checked and found correct (selected computations)

- Contour shift: on $\operatorname{Im}p_a=-(h+b)\operatorname{sgn}n_a$ one has $|e^{-in_ap_a}|=e^{-(h+b)|n_a|}$. The geometric sum is $\sum_me^{-b|m|}=(1+e^{-b})/(1-e^{-b})\le2(1+b)/b$ because $1-e^{-b}\ge b/(1+b)$. This gives the factor $(2(1+b)/b)^4$, the same as in `tapes_sound`.
- $\sum_{m}(1+|m|)^{-2}=\pi^2/3-1\le3$, hence the bound 81. $C_\eta=3\pi+2\eta$; $|e^{iz}-1|\le|z|e^{|\operatorname{Im}z|}$; $|e^{iq\cdot\ell_L(r)}|\le e^{4(\eta/L)(L-1)/2}\le e^{2\eta}$; $\sum_lg^s\Gamma^{-j}\le81$ for $j\ge s+2$. Overlap of the residue symbols: $q_l(p+2\pi x)=q_{l'}(p)+2\pi n$, with chips and phases invariant.
- Train induction: hop identity $S_{\rm hop}(p)=\operatorname{area}_L(Mp)^JS_v(p)$ (centered odd boxes compose). Upper exponent $4+8/3\le8$ (in units of zone·LM/L₀) and lower exponent $4+8/3\le8$ (in units of c₀·LM/L₀). Noise price $T_{\rm hop}=1+L^{-2}T_{\rm old}<2$. Level response $\mathscr D=b/d_M$ from $d_M(p)=M^2d_1(p/M)$. Bend identity $d_M\beta=\sum_aJ_a/b_a$ from $J_ah=s_M(p)_as_M(-p)_a\ell_a$. Lower bound $\beta\ge\mathrm{low}^2/(C_b\mathrm{high}^2)$ and $\beta(0)=1$. High-alias reciprocal of weight $g^{-2}$. Port $g^{-2}$, normaliser $g^{-4}$, levy bounded, tail summand $\le C\Gamma^{-2}$.
- Mixed radix: $q^{(LM)}_r=q^{(M)}_v(q^{(L)}_l)$ mod $2\pi$ with $\ell_{LM}(r)\equiv\ell_L(l)+L\ell_M(v)$. Feed composition $\operatorname{feed}_{\rm hop}=\operatorname{slide}_L\operatorname{feed}_v$ via $\operatorname{rail}_{LM}(z)=\operatorname{rail}_M(z)\operatorname{rail}_L(Mz)$ and periodicity of $\operatorname{pullLine}$. Hence $\mathscr D_{\rm land}=\operatorname{slide}\mathscr D_{\rm wing}+k^{-1}$. Bulb network $b_{\rm land}=\operatorname{heel}+s\operatorname{tail}$ via $\operatorname{blow}(p,0)=L^2d_M(p/L)=d_{LM}(p)$.
- Stake and copper identities, brace $1-(1-sx_a)(1-sx_b)=s(x_a+x_b-sx_ax_b)$, $y\,vH'f_2=H\mathcal M_2(Z)$, $f_1Du=D'-R$, $\operatorname{chainY}(p,q_0)=f_P$ via $s=L^2d_w$.
- Reciprocal-shift law: for $x\ne0$, both endpoints are nonzero because $\pi+\pi/4<2\pi$, the script is invariant, and the residues are permuted.
- Transport: $R=D^{-1}-\rho^{-1}D^{-1}xx^*D^{-1}$ (diagonal $f_a\sum_{b\ne a}f_b|x_b|^2/\rho$, off-diagonal $-f_af_bx_a\bar x_b/\rho$). Filter chain $F_{r+1,l}\delta_r=d_rF_{r,l}$ from $L\operatorname{rail}_L(q)(e^{iq}-1)=e^{ip}-1$. $x_l^*F_{1,l}^*=\bar m_lx^*$. The three punctured identities. The alias sum $(D-k^{-1})R+x\pi=I-k^{-1}R$. $B_lx=\operatorname{diag}(r_{l,a})x_l$; $\pi=s^{-1}\sigma$ from $\rho=s^2\beta_c$. Nonprincipal gain. Principal gain: $e_0-r_{0,a}=s\,m_0^{-1}(u_a/b_a-h/(sa))$, using $\operatorname{tr}D_0/a=|m_0|^{-2}(1-h/a)$ and $b_{0,a}|\operatorname{rail}|^2/b_a=|m_0|^{-2}(1-su_a/b_a)$. $y_l=s^2\lambda_l$ via $\rho_l=\operatorname{portR}_l$. Brace cancellation and the principal wire formula. Values at $p=0$: $\mathcal A_0=\mathcal T_0=I$ and the nonprincipal columns vanish. The $L^{-3}$ adjoint factor (equal to `adjust_adj` with `stageVolume L = L^4`).

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other packages or chapters |
| --- | --- | --- | --- |
| `free-kernel-estimates.tex` | All 725 lines; all displays recomputed; branch algebra checked against the source definitions | Mathematically correct; changes requested for M1 (pilot sentence), M3, M6, M7, M8, M9 | The entrywise wire bound from `free-kernel-components.tex` (proved there). Application to the selected response needs tower/bed matching (atlas chapter, C02). The A₀ analogue needs the missing pilot bound (M1). |
| `free-kernel-components.tex` | All 453 lines; every inequality and induction recomputed | Correct for the two-form wire; changes requested for M1 (add the one-form column lemma) and M10 | None for the wire bound itself; standard complex analysis (Cauchy estimate, identity theorem) |
| `kernel-transport-identities.tex` | All 277 lines; every identity recomputed | Identities correct; changes requested for M1, M2, M4, M5, M11 | Pilot-column estimate (M1); the periodisation/reality step (M2), whose reality part is supplied by `free-kernel-estimates.tex` lines 607–637 |

No literature citation is made in the three chapters. The analytic inputs used (Cauchy integral theorem and derivative estimate, identity theorem, Fourier uniqueness for absolutely summable series) are standard and correctly applied.

## Not checked

- Chapters outside part 2 except the passages named above. In particular the atlas sandwich lemma and `prop:ex-lattice-response-travel` were read only for the interface.
- That the installed matrices `installed (visitRatio) (meshBook …)` on finite tori equal the Fourier-block description assumed in M2. I did not read the `Runs`/`sail_run`/`phi_run` source.
- The pilot-column estimate in the source (`Flight.pilot_cost`, `ahead_cost`, `gains_cost`, `sluice_cost`, `abide_firm`): its statement was read, its proof was not.
- The RESULTS rows not concerning these three chapters, and the full 878-page build (I built a scoped 35-page wrapper; see `part2-validation.md`).
