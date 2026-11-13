# C01 review, part 3: mathematical validity

- Package: C01 "Lattice normalization, flat estimates and free kernels" (unit YM-000026), issue #42, author draft PR #81 at head `165fb24`; author changes `git diff 18d0327 HEAD`.
- Part 3 scope: `manuscript/existence/atlas-estimates.tex`, `manuscript/existence/rg-horizon-geometry.tex`, `manuscript/existence/curvature-horizon-producer.tex`, plus the author records `RESULTS.md`, `HANDOFF.md`, `VALIDATION.md`, `manifest.json` in `blueprint/units/YM-000026/handoff/results/C01/` where they concern these chapters (the record-wide checks are in `part3-lean.md` and `part3-validation.md`).
- Reviewer: Claude agent (session `schmittj-claude-c01-review-20261112`), read-only, independent of the Codex author and Codex checker passes. No human acceptance is recorded by this file.
- Files reviewed (SHA-256, identical to `HANDOFF.md`, `manifest.json` and the coordinator's list): `atlas-estimates.tex` `ea8fa9f14eb344dff2357bb1583e7b2ae3f9d7e482a5a6508a563858cb1db1d5`; `rg-horizon-geometry.tex` `26ed5ac7d08e70391718cb18fecd787c0f57b34d976540e22c1f6052cf88a981`; `curvature-horizon-producer.tex` `49227ddc1fa07dc40accf470e7c8c72d62a059db0e115ebeaa21f45d5adc2529`.
- Outcome: no ERROR found in the three chapters; every displayed identity and estimate I recomputed is correct. No substantive GAP that invalidates a proof. Several INACCURACY items (imprecise hypotheses, one glossed source step, one omitted width, one grouping modulus) and NITs, all with small repairs. The PR #81 changes to these chapters are mathematically correct; one new imprecision (F3) was introduced by the PR.

## Findings, ordered by severity

### F1. INACCURACY (manuscript, pre-existing). Second transport identity stated with the bed metric without the step that converts it

- Location: `rg-horizon-geometry.tex` lines 206-212 (also the hypothesis display, lines 29-34).
- Passage: "The tangent identities give $T^{\mathsf T}D_f=D_c\overline T,\ TW'D_c=WD_fA_0$, where $W,W'$ are the actual adjacent bed metrics".
- Verified reasoning: the flight's tangent identity is $T H_c d_{1,c}=H_f d_{1,f} A_0$ with the unamended pulses $H$ (`kernel-transport-identities.tex` eq. `eq:transport-installed-identities`, and in the source `YM.Precision.Towers.Diagonal.stays`, which is stated with `diagonal`, not `metric`). The version with the metrics $W=G_f$, $W'=G_c$ follows only after using $G d_1 = H d_1$ on both lattices (`positive-row-producer.tex` line 153; source field `YM.Precision.Floor.same`, used explicitly in `YM.Work.F09.answer`). The identity is true, so Proposition `prop:ex-lattice-horizon-roll` does apply, but the sentence attributes the metric form directly to the tangent identities. `curvature-horizon-producer.tex` lines 114-117 does mention $Gd_1=Hd_1$, so the information exists in the package, not in this chapter.
- Requested change: add "together with $Wd_{1}=Hd_{1}$ on both lattices (the floor identity, Section `sec:positive-row-producer`)" after "The tangent identities give".

### F2. INACCURACY (manuscript, pre-existing). Common width omits the curvature-factor width

- Location: `rg-horizon-geometry.tex` lines 220-222.
- Passage: "Let $\alpha$ be the common strip width after narrowing the two bed widths and donated width".
- Verified reasoning: the cost constants use $D_1,D_2$ and $P$ at the narrowed width; the narrowing is $\gamma=\min(\sigma,\sigma',\nu)$ with $\sigma$ the fine bed width (which is also the donated width), $\sigma'$ the coarse bed width and $\nu$ the strip width of the curvature factor $P$ (`YM.Work.F08.answer`, `let γ := min σ (min σ' ν)`). Without $\nu$ the bound $C_{\rm up}=n_3VD_2$ is not justified, since $V$ is a cost at width $\nu$ only. All displayed formulas $A,B,C_A,\dots,M_0$ otherwise agree with my recomputation and with the source.
- Requested change: "after narrowing the two bed widths (the fine one is also the donated width) and the strip width of the curvature factor".

### F3. INACCURACY (manuscript, introduced by PR #81). Wrong modulus in the periodization sketch

- Location: `atlas-estimates.tex` lines 251-256 (proof of `prop:ex-lattice-response-travel`).
- Passage: "To identify the finite carrier, periodize the final output $y$ modulo $n$. Group the intermediate cover coordinate modulo $n$".
- Verified reasoning: in $K=I_f\widehat T I_c$ there are two intermediate cover coordinates, the fine one $x+u$ and the coarse one $y+v$. The fine one must be grouped modulo the fine side $Ln$, the coarse one modulo $n$. I redid the computation: writing $x+u=\bar x'+Lnw$, the covariance $\widehat T((x'+Lnw,b),(y',c))=\widehat T((x',b),(y'-nw,c))$ (from $\rho_L(x+Lnw)=\rho_L(x)+nw$) moves the shift to the coarse side, and the fibre sums then produce exactly $I_f^{(Ln)}\,\widehat T^{(Ln,n)}\,I_c^{(n)}$, the source's `carrier` (`YM.Pert.Bulk.carrier`, `matches_response`). The claim is correct; the sketch names the wrong modulus and omits the covariance step.
- Requested change: "Group the fine intermediate coordinate modulo $Ln$ and the coarse one modulo $n$; the identity $\rho_L(x+Lnw)=\rho_L(x)+nw$ transfers a fine period shift to the coarse argument of $\widehat T$."

### F4. INACCURACY (manuscript, introduced by PR #81). Hypotheses of the constant-column proposition not stated

- Location: `atlas-estimates.tex` lines 214-217.
- Passage: "suppose $T$ is the two-form wire tower of a flight with fixed admissible stages and positive kernel parameter."
- Verified reasoning: the proof uses $\mathcal T_0(0)=I$ and $\mathcal T_l(0)=0$ for $l\neq0$ (`kernel-transport-identities.tex` lines 239-252), and the residue symbol $\mathcal S_{2,\varnothing}(P,r,0)=L^{-2}\sum_l e^{iq_l(0)\cdot\ell_L(r)}F(P,0,l)=L^{-2}I$ (`free-kernel-estimates.tex` eq. `eq:ex-lattice-spread-symbol`); I checked this evaluation and the value $L^{-2}\delta_{ij}$ for every residue. Those sections hold for odd $L\geq3$, $k>0$ and stages $4\le t\le j\le t+1$; this is exactly the source's `Flight j t` structure plus `k.penalty_pos`. "Fixed admissible stages" is not defined in this chapter. The value formula $L^{-2}\sum_b(\sum_u I_f(i,b,u))(\sum_v I_c(b,j,v))$ is correct (I recomputed it from the sandwich formula, the sign of $v$ in $I_c(c,j,-v)$ being irrelevant after summation).
- Requested change: state "for a flight of stages $4\le t\le j\le t+1$, odd side $L\ge3$ and $k>0$ (Section `sec:kernel-transport-identities`)".

### F5. INACCURACY (manuscript, pre-existing). The curvature factorization is attributed to the rebase receipt alone

- Location: `rg-horizon-geometry.tex` lines 213-215.
- Passage: "The flight's rebase receipt supplies the curvature factorization of the remainder $Z$".
- Verified reasoning: the rebase identity gives $W'ZW'=d_2^{\mathsf T}Qd_2$ with $Q$ the positive three-form row $D_c^{\mathsf T}R_0D_c$ (`curvature-horizon-producer.tex`, `YM.Next.Free.Flight.rebased`, `check_bleep`). The form $d_2^{\mathsf T}P^{\mathsf T}Pd_2$ requires the square-root step (Section `sec:positive-row-producer` in the manuscript; in the source, `YM.Bid.pinning` first applies `F06` to replace $Q$ by a fully positive $P_1$ with the same $d_2^{\mathsf T}\cdot d_2$ and then `F07` for the square root). Mathematically the curvature chapter covers this, so this is a missing cross-reference, not a gap.
- Requested change: "The flight's rebase receipt, followed by the positive square root of Section `sec:curvature-horizon-producer`, supplies ...".

### F6. INACCURACY (manuscript, introduced by PR #81). Source of the path bounds described vaguely

- Location: `rg-horizon-geometry.tex` lines 394-398.
- Passage: "The run's Wilson representation supplies its own weighted path-row bound at every such cutoff, level and period, with the width and price of that level."
- Verified reasoning: the bound is $\mathrm{Bounds}((a.\mathrm{params}\,i).\mathrm{clip},\ .\mathrm{width},\ .\mathrm{paths},\ \mathrm{loopCap}\,i)$ for the path $(N,i)$; it comes from the planned kinetic data of the run's directed construction (source `YM.PCalc.Kin.Planned.cap`), not from a "Wilson representation", and it is independent of the period label because the path is. The substance (the bound is a separate receipt at the level's width and price, not a consequence of attachment) is correct; I checked that the attachment argument in lines 388-394 matches the source chain exactly (see `part3-lean.md`, L2).
- Requested change: name the bound by its content: "the same run's planned path data supply the weighted row, loop and higher-leg bounds at the clip, width, path price and loop cap of level $i$".

### F7. INACCURACY (manuscript, pre-existing). Exponential decay of $D_c$ used without reference

- Location: `curvature-horizon-producer.tex` lines 169 and 195-197.
- Passage: "With $D_c=(I+l d_{2,c}B_cd_{2,c}^{\mathsf T})^{-1}$ ... The products defining $R$ have a uniform exponential row bound."
- Verified reasoning: $D_c$ is the inverse of a Laurent row; its exponential summability, uniform in the train and the period, is the analytic inverse construction of Section `sec:positive-row-producer` (lines 140-148 there: "supplies $G,D$ with uniform strip and spectral bounds"). The claim is true but not referenced here, and the uniformity of $K$ in line 190 also depends on it.
- Requested change: cite Section `sec:positive-row-producer`, eq. `eq:positive-amendment`, for $D_c$ and its bounds.

### F8. NIT (manuscript, pre-existing), `atlas-estimates.tex`

- Lines 25-26: "hence, for every $z\in\mathcal C$," is a stray quantifier; the inequality is for all $x,y$.
- Lines 47-48: "the boundary condition in the displayed case is equivalently $2\ell_L(r)_a=L-1$" repeats the displayed condition verbatim. Intended: "equivalently $\ell_L(r)_a=\lfloor L/2\rfloor$", the source's condition in `YM.Precision.forwardC`.
- Lines 236-238: "evaluating their Fourier series at zero yields the same value after taking real parts" is correct (the coefficient rows are by definition real parts of Fourier coefficients) but could simply say that the row sum is the symbol at $p=0$.

### F9. NIT (manuscript, pre-existing), `rg-horizon-geometry.tex`

- Lines 43-49: $P$ is used in the factorization before it is introduced; swap the two sentences.
- Lines 166-172: "four precision rows are fixed as above" and "five rows" refer forward to lines 190-192; "At each integer scale $j\geq4$" should be "stage".
- Line 366 repeats the definition of $F_W$ given in lines 359-361.

### F10. NIT (manuscript, pre-existing), `curvature-horizon-producer.tex`

- Lines 116-117: the reference for "the amendment does not alter them on exact forms" should be the identity $Gd_1=Hd_1$ (`positive-row-producer.tex` line 153), not `eq:positive-amendment-intertwine`; the displayed identities \eqref{eq:curvature-tangent} contain only unamended rows.
- Lines 149-158: the right lift of $Y=d_{2,f}B_fTH_c$ is applied to a fine-to-coarse kernel. It is covered by the lift of Section 1 with "fixed coordinate space" equal to (fine residues) x (three-form labels), and the per-entry bounds are uniform in $L$; saying so would remove a reader's doubt.
- Lines 252-254: the strip calculation does not "supply" the iterated difference bounds of $A_0,T$; they are inherited from the donated tower and only narrowed in width and enlarged in cost (as `rg-horizon-geometry.tex` lines 292-296 correctly says).
- Lines 183: $l\ge C_0+1$ already suffices; $C_0+2$ is harmless.

### F11. Records (pre-existing or packaging). See `part3-lean.md` L1-L5 and `part3-validation.md` for: the unverifiable "independently reviewed snapshot" commits; the missing producer anchors for the literal-run attachment and path bounds; small imprecisions in the RESULTS atlas row.

## What I verified as correct (recomputed)

- `atlas-estimates.tex`: the decomposition $x=\ell_L(\pi_Lx)+L\rho_L(x)$ and $d_L(x,y)\le|y-\rho_L(x)|_1+2$ (since $|\ell_L(r)|_1\le2(L-1)$); the carry rule $\epsilon_a(r)=e_a$ iff $\ell_L(r)_a=(L-1)/2$ and the exact identity $\partial_a\widehat T=\widehat{\nabla^L_aT}$; Lemma `lem:ex-lattice-cross-atlas` (row $e^{2\sigma}CL^{-2}$, column $L^4\cdot e^{2\sigma}CL^{-2}$, difference row $e^{2\sigma}CL^{-3}$); the triangle inequality $d_L(x,y)\le d_L(x+u,y+v)+|u|_1/L+|v|_1$ and Lemma `lem:ex-lattice-sandwich-atlas` with constant $|F||G|C_IC_JQ$ in all three bounds, including that the difference of the sandwich is the sandwich of the difference because $I,J$ are translation invariant; Theorem `thm:ex-lattice-response-atlas` with $Q=|F|^2e^{4\sigma}C_fC_cC_T$; Proposition `prop:ex-lattice-response-travel` (row-sum value and carrier, see F3/F4). PR #81's added nonnegativity premises ($C\ge0$, $Q\ge0$, $C_T\ge0$) are harmless and match the source's `Atlas.nonneg`.
- `rg-horizon-geometry.tex`: every identity of Proposition `prop:ex-lattice-horizon-roll`, with domains checked: symmetry of $R,R'$; $\Pi^{\mathsf T}=\Pi=\Pi^2$, $\Pi J'=J'$; $X^{\mathsf T}X=J'ZJ'^{\mathsf T}$; Gram identity $=\Pi+I-\Pi=I$ on all of $\mathcal Y_c$; normal, primal, kinetic, image ($Pd_2D_c=0$) and orthogonality identities. The root identity $J_p^{\mathsf T}J_p=p_{\rm direct}I+F^{\mathsf T}F$. The full cost bookkeeping $A,B,C_A,C_B,C_L,C_F,C_N,C_{\rm proj},C_{\rm up},C_X,C_O,M_0$ (all exactly as in `YM.Work.F08.answer`, subject to F2); the routed-convolution bound; the mixed-composition bound $|\kappa(r,a)|_1\le|a|_1$ (I redid the integrality argument: $n|\kappa_i|\le|a_i|+n-1$ forces $|\kappa_i|\le|a_i|$); inheritance of difference bounds with $M_0\ge\Omega$. The PR's new paragraph (lines 309-328): $\Omega_{J_i}\ge0$ follows from a weighted sum of nonnegative terms being bounded by it on the nonempty face-label set; the stage-indexed atlas price $|F|^2e^{4\sigma}\Omega_{J_{i+1}}^2\Omega_{J_i}$ is Theorem `thm:ex-lattice-response-atlas` with $C_f=C_T=\Omega_{J_{i+1}}$, $C_c=\Omega_{J_i}$, using the base and first-difference tower receipts ($J_{i+1}-2\ge2\ge1$). The path-to-root periodization and the counting-measure identity $\langle d_1a,Wd_1a'\rangle=p_{\rm direct}\langle d_1a,d_1a'\rangle+\sum_f\langle\ell_{\rm path}(f,a),\ell_{\rm path}(f,a')\rangle$ (rows of $F$ are indexed by plaquettes, so the sum is over physical faces); absolute convergence from the weighted row bound with weight $\ge1$.
- `curvature-horizon-producer.tex`: the divided-difference formula including $n<0$ (checked at $n=-1$); the weighted bound $|n|e^{(\eta/2)|z|_1}\le(2/\eta)e^{\eta|z|_1}$ for $|n|\le|z|_1$; Cartan identity $d_r\iota_a+\iota_ad_{r+1}=q_aI$; $A_0d_r=q_aA_0E_a$ from the cycle identity at $p_a=0$; $R_ad_{r+1}+S_a=A$ (I expanded $q_a(R_ad_{r+1}+S_a)$ and obtained $q_aA$); vanishing of columns containing $a$ and their persistence; termination in positive degree; the two-sided lift step by step ($V=Wd_1$, $d_2^{\mathsf T}V=0$, $d_3^{\mathsf T}T=V$, $Td_0=0$ because five-forms vanish, $Xd_1=T$, $W'=W-d_3^{\mathsf T}X$ with $W'd_1=0$ and $d_2^{\mathsf T}W'=E$, $d_2^{\mathsf T}Cd_2=E$, and symmetrization). $Z_0H_cd_{1,c}=0$ from the three transport identities; $Z_0=(d_{2,c}B_c)^{\mathsf T}C(d_{2,c}B_c)$; $Yd_{1,c}=0$ and $Sd_{2,c}B_c=d_{2,f}B_fT$; the $L$-power counting $L^4L^{-2}L^{-2}=O(1)$ and $L^4L^{-3}L^{-3}=L^{-2}$; positivity $\langle u,R_0u\rangle\ge\|u\|^2$ under $l\ge C_0+2$, $L^2\ge mC_1$, and $\langle u,Ru\rangle\ge K^{-2}\|u\|^2$; the expansion $A_c-T^{\mathsf T}A_fT-k^{-1}d_1d_1^{\mathsf T}=(d_{2,c}B_c)^{\mathsf T}R_0(d_{2,c}B_c)$; $(d_{2,c}B_c)G_c=D_cd_{2,c}$ (I verified $D_c^{-1}d_{2,c}B_c=d_{2,c}A_c$); hence \eqref{eq:curvature-paid-factor}, which is the hypothesis \eqref{eq:ex-lattice-horizon-bleep} with $W'=G_c$, $R'=A_c$, $R=A_f$. The price selection $l_i=\max(a_{i,i},a_{i+1,i})$ gives $l_t\ge a_{j,t}$ for both permitted transitions; the PR's correction that prices are stage-indexed without a common lower width or upper cost is correct and an improvement over the previous wording.

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other packages or chapters |
| --- | --- | --- | --- |
| `atlas-estimates.tex` (272 lines) | All lines; all three lemmas/theorem recomputed; PR additions (lines 70, 136-138, 186-187, 212-271) | Correct; changes requested for F3, F4 (PR-introduced imprecisions) and F8 nits | Tower strip receipt and its first differences (C01 `free-kernel-*`); zero-momentum wire values (`kernel-transport-identities`); identification of flights and tower with the selected RG history and the two bed bounds (stated as open in `rem:ex-lattice-atlas-open`); quotient-fibre calculation of `sec:ex-lattice-flat-step` |
| `rg-horizon-geometry.tex` (403 lines) | All lines; block proposition recomputed with domains; cost table compared entry by entry with the source; PR additions (lines 309-328, 337-342, 359-361, 372-398) | Correct; changes requested for F1, F2, F5 (pre-existing), F6 (PR) and F9 nits | Bed and hop receipts (`positive-row-producer`, `curvature-horizon-producer`, free-kernel chapters); `Credit` and the public payment chain (C02/C16/G06); path data bounds and physical normalization (C12); `lem:ex-lattice-flat-same-output` (`flat-step.tex`) |
| `curvature-horizon-producer.tex` (266 lines) | All lines; lifts, defect identities, positivity and price selection recomputed; PR change (lines 258-262) | Correct; F7 and F10 are reference and wording repairs | Wire strip bounds for $B_fT$ and its first differences (free-kernel chapters); transport identities (`kernel-transport-identities`); analytic inverse and square root (`positive-row-producer`); common scale selection (`sec:common-scale-selection`, outside C01) |

## What I did not check

- The free-kernel chapters (`free-kernel-estimates.tex`, `free-kernel-components.tex`), `kernel-transport-identities.tex` and `positive-row-producer.tex` were read only for the statements my chapters use (zero-momentum wire values, residue symbol, amendment identities, analytic inverse); their proofs are part 1/2 scope.
- `lem:ex-lattice-flat-same-output` and the quotient-fibre calculation of `flat-step.tex` were not re-verified; my chapters only cite them.
- The finite reflection positivity, Wilson normalization and flat-step/flat-rate rows of `RESULTS.md` were checked only for existence of the cited declarations (see `part3-lean.md`), not mathematically; they belong to other parts.
- The large selection theorem `R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric` behind `YM.Independent.constructionRun` was not opened.
