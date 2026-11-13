# C07 review, part 1 (reviewer 1 of 3): mathematical validity

Reviewer session `schmittj-claude-c07-review-20261113` (Claude Opus 5.5, agent-assisted; a human reviewer takes responsibility for acceptance). Worktree `/home/jo314/ym-wt/c07-review` at `e058a61`, containing author commit `9f8fa0b` (PR #96). Chapters reviewed: `sector-gram.tex`, `local-covariance.tex`, `actual-global-row-prices.tex`, `actual-palette-warning.tex` (changed by PR #96, reviewed first and line by line, including every changed hunk of `git diff 9f8fa0b~1 9f8fa0b`), and `local-mean.tex`, `warning-safety.tex` (unchanged, read line by line). Consumer check: `actual-local-compiler-handoff.tex`, `actual-reader-small-window-bridge.tex` (C13). Hashes of all six chapters match the review brief (see `part1-validation.md`).

Summary: I found no ERROR in the six chapters. Every displayed identity and inequality I recomputed holds (details in the per-chapter table). The central repair of PR #96, the new coercivity proof for the actual curved-derivative Gram in `actual-global-row-prices.tex`, is mathematically correct, and it follows the Lean proof (`Gap.not_flat`) step by step, including the exact constant. There is one minor GAP (seed clearance of selected rows under the stencil selector is asserted, not derived), several INACCURACIES (terminology, undefined symbols, one overly restrictive phrase introduced by the PR, a misattributed cross-reference in the C13 consumer), and stale statements in the records.

## Findings, by severity

### F1. GAP (minor). Seed clearance of selected rows is asserted, not derived. Manuscript; pre-existing, made more visible by PR #96.

File `manuscript/existence/actual-global-row-prices.tex`, lines 15-16, 34-37, 91-93, 254-258. Quoted: "R=\lfloor B/100000\rfloor" (defined, never used afterwards); "The selector here retains a row exactly when its prescribed stencil meets an active bond" (added by PR); "Row selection clears the required neighbourhood of flags, so this branch estimate applies at $V$" (line 91-93); "A selected row has no coarse flags in its required surrounding ball" (line 254).

Verified reasoning. With the stencil selector (`shots`: the ball of radius span = R+5+predReach around the signed row root, R = till(x) = ⌊B/100000⌋ the path cutoff), the predictor branch estimate, the impulse bound, the base-row estimate of `sec:warning-safety` (which needs a clean B-ball around the row) and the source bound all need the row's neighbourhood to be free of coarse flags. This is true, but the reason is nowhere in the chapter: an active bond has both coarse endpoints outside the 10B seed dome (definition only in `sec:sector-gram`, line 16-17); the stencil radius is at most ⌊B/50⌋ eventually; hence the signed root lies outside the dome of radius 9B+⌊9B/10⌋ and every stencil endpoint outside radius 9B+⌊8B/10⌋ (this is exactly Lean `YM.Next.SectorChange.small_span` and `guarded`). Flags lie in the seed place, so the needed balls (radius at most B) are clean. The argument is short but it is the only link between the new selector and all estimates "on selected rows", and the reader cannot reconstruct it because neither "active" nor the stencil radius nor the role of R is stated in this chapter.

Status: open. Requested change: after line 37, define active bonds (both coarse endpoints outside the 10B seed dome), state the stencil radius span = R+5+r_pred with R the path cutoff, note span ≤ ⌊B/50⌋ eventually, and derive the two dome exclusions; then cite this at lines 91-93 and 254.

### F2. INACCURACY. "Actual" used for the transported-flat precision. Manuscript; pre-existing wording that PR #96 left in place.

Files: `sector-gram.tex` lines 5-6 ("We prove the lower bound for the actual transported, selected rows") and 249-251 ("spectral interval for the actual completed precision matrix"); `local-covariance.tex` lines 31-33 ("Section~\ref{sec:sector-gram} supplies these constants for the actual completed sector precision").

Verified reasoning. PR #96 correctly states (sector-gram lines 28-30) that $A^V_{s,a}$ is the flat linear cut row transported by $V$, not the derivative at the replica, and `actual-global-row-prices.tex` and the C13 handoff now reserve "actual" for the curved-derivative matrix `Rows.gram`. The remaining uses of "actual" for the transported-flat matrix contradict this convention and are exactly the wording that led to the identification removed by C07-A2. No mathematical statement is wrong.

Requested change: replace "actual" by "transported" (or "transported-flat") at the three places.

### F3. INACCURACY. The global proposition omits a positive-rate bound on Q that its consumers use. Manuscript; pre-existing.

File `actual-global-row-prices.tex`, lines 57-79 (statement) versus line 115 (proof: "The same product estimate gives $\|Q\|_{\sigma/2}\le L_0^2$"). Consumer `actual-local-compiler-handoff.tex` lines 67-80 starts from "their common initial Schur rate, amplitude and gap" for the actual matrix and reruns `sec:local-covariance`, which needs $\|A\|_\eta\le Q$ for some $\eta>0$.

Verified reasoning. The proposition states only rate-zero prices for $Q,C,N$ and $\|M\|_{\sigma/2}\le L_0$. The positive-rate bound $\|Q\|_{\sigma/2}\le L_0^2$ follows from the product rule (triangle inequality through the row anchors), so nothing is missing mathematically, but the consumer has to re-derive it from the proof. Lean `opaqueCost` does state `Pours U ... v K` with `v>0`.

Requested change: add $\|Q\|_{\sigma/2}\le L_0^2$ to \eqref{eq:global-row-kernels}. Also resolve the notation clashes in this chapter: $\|\cdot\|_v$ (line 52) versus the constant $v$ in the proposition; $Q$ (Gram matrix) versus the constant $Q$ in \eqref{eq:covariance-data}.

### F4. INACCURACY. Undefined symbols in the CAB wedge condition. Manuscript; pre-existing.

File `actual-palette-warning.tex`, lines 341-351. Quoted: "\frac{C}{L^2}\leq\frac{a_*}{64},\qquad C+\frac{a_*}{64}\leq\frac{W_{\rm wire}b_*}{4}".

Verified reasoning. $C$ and $L$ are never defined in the chapter; earlier in the same chapter $C$ is the panelized covariance and $L$ the move-row price. From the use at lines 370-379 and from `actual-local-compiler-handoff.tex` line 27, $C$ is the guide constant $d=2A(1+a)$ of \eqref{eq:guide-maximum} and $L$ the block length. $W_{\rm row}$ is introduced twice (lines 343 and 350), and the display is not introduced by a sentence. The arithmetic that uses these inequalities (face response at most $a_*t/32$, toll below $t/4$; bond curvature at most $W t/4$, wire below $Wt$) is correct once the symbols are read this way.

Requested change: introduce $C$ as the guide constant of \eqref{eq:guide-maximum} and $L$ as the block length before the display, rename to avoid clashes, and remove the duplicate definition of $W_{\rm row}$.

### F5. INACCURACY. Overly restrictive condition on the move price. Manuscript; introduced by PR #96.

File `actual-palette-warning.tex`, lines 138-139. Quoted: "It also supplies the source-row bound $Z\operatorname{fiery}(x)$ and the move-row price $L$ when the local width is strictly positive."

Verified reasoning. In `prop:actual-global-row-prices` only the source bound requires $0<d\le rt$; $\|M\|_{\sigma/2}\le L_0$ holds without any width condition (also in Lean: `SourceBounds.move_bound` has no `d`, `source_bound` has `0<d`). The sentence attaches the condition to both. Harmless, because the application assumes $d>0$ anyway, but imprecise. Related: hypothesis 3 of `prop:actual-palette-response` allows $d=0$, which the global source bound does not cover; the text at line 139 and line 413 says the application uses $d>0$, so there is no failure.

Requested change: "the source-row bound $Z\operatorname{fiery}(x)$ when the local width is strictly positive, and the move-row price $L$".

### F6. INACCURACY (minor). Notation overloads in the palette chapter. Manuscript; pre-existing.

File `actual-palette-warning.tex`: in hypothesis 3 (lines 60-62) $r$ is simultaneously a row index ($|s_r|$), the width constant ($d\le r\varphi(x)$), and elsewhere the direct-row vector $r=Mm+s$; $u$ is the window-defect constant (hypothesis 4) and the width constant (line 413, "$0<d\leq u t$"); $q$ in `prop:actual-palette-condition` (line 240) is defined but not used in the conclusion (which writes $\varepsilon t/g$); "A palette has a $\sigma$-price $C$" (line 152) reuses $C$; line 154 calls $C$ "the clouded panel Gram matrix", while $C=\operatorname{clouded}(W,Q)$ is the symmetrized panel inverse (the PR corrected the same wording at line 136 but not here). Requested: rename.

### F7. INACCURACY. Misattributed cross-reference in the C13 consumer. Manuscript (C13 chapter, not one of mine); edge inconsistency.

File `actual-local-compiler-handoff.tex`, lines 26-33. Quoted: "The choices in Section~\ref{sec:warning-safety} then impose $C/L^2\leq\sqrt{\mathrm{direct}}/64$, $C+\sqrt{\mathrm{direct}}/64\leq (W/4)\sqrt{\mathrm{penalty}}$."

Verified reasoning. `sec:warning-safety` \eqref{eq:safety-goals} imposes $A/L^2\le\delta_0=\sqrt{c_f}/32$ and $W>2(A+\delta_0)/\sqrt{c_p}$. The quoted inequalities are those of `actual-palette-warning.tex` \eqref{eq:actual-palette-cab-wedge}. I checked that the handoff's conditions imply warning-safety's: with $C=2A(1+a)\ge A$ ($a\ge0$), $A/L^2\le C/L^2\le\sqrt{c_f}/64\le\delta_0$, and $W\ge4(C+\sqrt{c_f}/64)/\sqrt{c_p}\ge(8A+2\delta_0)/\sqrt{c_p}>2(A+\delta_0)/\sqrt{c_p}$ for $A>0$. So there is no mathematical failure, but the reference is wrong and the two chapters use different letters ($A$, $C$; seed-guides uses $d$) for the same guide constant.

Requested change (for the C13 owner): cite both `sec:warning-safety` and \eqref{eq:actual-palette-cab-wedge} and note the implication; unify the name of the guide constant.

### F8. NIT. Window hypotheses versus their use.

`local-covariance.tex` lines 113-116 require windows with inner radius $B$ and outer radius $B+2$. `actual-global-row-prices.tex` lines 213-214 and the C13 handoff (lines 81-82) apply the results to "any family of panels with this ball-containment property" (inner bound only). This is valid: the inner bound alone gives \eqref{eq:window-error}, the floor and the series; the outer bound is used only for the window cardinality $\Delta$ in \eqref{eq:local-log-comparison} and for the range of $C$. Requested: say this in `local-covariance.tex`.

### F9. Records (not manuscript). Stale statements.

(a) `handoff/results/C07/ledger.md` line 43 says `sec:actual-local-compiler-handoff` "calls its object the actual full precision from `sec:sector-gram`". This was true at PR #96. C13 commit `bddbedc` (later) changed the handoff to use the matrix of `sec:actual-global-row-prices` and distinguish it from sector-gram, so the entry is now stale. I checked the current handoff text (lines 54-62) against `prop:actual-global-row-prices`: it uses what the proposition states (with F3).

(b) The canonical read-only `blueprint/units/YM-000026/actual-global-row-prices-evidence.md` ("`sector-gram.tex` supplies selected-row coercivity") and `actual-palette-warning-evidence.md` ("The parent unit sec:actual-global-row-prices has passed independent review") are false at the current hashes: the earlier global proof relied on the identification refuted by C07-A2 and has been rewritten. C07-A3 flags only the wrong paths in the palette evidence (I confirmed those paths do not exist and that the declarations are in `Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean` and `...Clock.lean`). The integrator must correct both evidence files.

## What is correct (verified)

- PR #96 repair of the actual-Gram coercivity (`actual-global-row-prices.tex` lines 116-192). The steps are: one coarse gauge per active bond on a clean fixed macro patch; ε-comparison of the actual plaquette and predictor derivatives with the flat ones on that patch; the tree inequality in that gauge; squaring and summing with finite multiplicities; absorbing ε; the identity-channel energy lower bound (rows omitted by the stencil selector have zero derivative on zero-extended directions). These steps are valid, and the constant $\eta_0=\lambda^2\min(c_f,c_p)/\{4(K_f+K_p+1)\}$ follows from $\|a\|^2\le 4K_f\Sigma_p+4K_p\Sigma_b$. The ε is chosen before the scale and uniformly in the period. The proof does not identify the curved matrix with the transported-flat one.
- Window and floor part: $E=QN-I$ vanishes on the inner ball; $N-Q^{-1}=Q^{-1}E$ (order correct); $C\ge(2K_0)^{-1}$ once $S(K_0S+1)e^{-w\rho}\le(2K_0)^{-1}$; $2+\lfloor B/60\rfloor\le\lfloor B/20\rfloor$ for $B\ge120$ (indeed for $B\ge60$). Source: $|s_i|\le\lambda(C_b+2rC_a)t$.
- `local-covariance.tex`: the weighted-conjugation proof of \eqref{eq:covariance-entry} (including $|e^v-1|\le\theta e^D$, $\|F\|\le\theta Q\le r/2$, $(r/2+u)\ge c_0(1+u)$), $S=c_0^{-1}mP_0(\gamma/3)$, \eqref{eq:window-error}, $A^{-1}\ge Q^{-1}$ and its direct check, \eqref{eq:local-covariance-floor}, both Neumann identities and their verification, \eqref{eq:local-logdet} with the bound $(Q+1)S\epsilon_B^n$, \eqref{eq:covariance-logdet} with $\int_0^1(-s)^n\,ds=(-1)^n/(n+1)$, \eqref{eq:local-log-comparison} with $\Delta=m(2B+5)^4$ and the constant $S+(Q+1)S^2$, colour-frame invariance. The PR's new window paragraph is correct: existential windows lie between radii $B$ and $B+2$ because the parent anchor is itself an endpoint; the all-pairs panels lie between radii $R-2$ and $R$. $d'$ is a metric; $|A_{ij}|\le Qe^\eta e^{-\eta d'}$. The Jaffard reference is bibliographically correct (Ann. IHP Anal. Non Linéaire 7 (1990), no. 5, 461-476, confirmed on numdam); I could not check the locator "Proposition 2, p. 464", and the remark is in any case only qualitative.
- `sector-gram.tex`: the linear tree inequality and its limit derivation, the insertion giving $Z=KN_{\rm macro}/\sqrt{a_f}+1/\sqrt p$, the counting bound $S_L(d)$, absorption (coefficient $2E^2S_L(3B)$ has upper exponent $-1$ because $B$ is polylogarithmic), $\kappa=\min\{\lambda^2/a_*,1\}$, the impulse-decay bound (cases $d\le\rho+5$, $R<r$, $R\ge r$), the weighted row and column sums with multiplicities $m$, $n$ (the factor 2 in $n$ is the direct and path row per plaquette, matching the source), the product rule giving $C_*^2+1$, Schur's test, range $B/2$. The PR edits (flag-component wording, transported-flat clarification, $Q_{\rm quad}$ notation) are correct.
- `actual-palette-warning.tex`: proof of `prop:actual-palette-response` (all four bounds; $e^{-v(\log x)^2/60}\le x^{-5}$ once $\log x\ge300/v$; $|\zeta_i|\le2g^{-1}\le2x\le x^2$); the floor conversion $e^{-v\lfloor B/60\rfloor}\le e^ve^{-vB/60}$ (added by PR, correct); the socket geometry ($50B$ versus $40B$ domes, radius $B$ inside radius $2B$); the door constant $C_*$; the CAB arithmetic ($2\dim\cdot x^{-7/8}\le x^{-3/4}$, Awake threshold, target split $\delta t/2+\delta t/2$, chart bound $2\sqrt{\dim}\rho_{1,13}$); the sewing identity. The PR change "exponentially weighted" to "rate zero" is correct (the proposition bounds $\mathfrak p_0$).
- `local-mean.tex`: $\|U-u\|^2+\|V-z\|^2=0$ from the three inner-product identities; $m-v=E^*v-P^*(Av+\ell)$; \eqref{eq:mean-point}; the radius bookkeeping ($B+B+2\le3B$; rows within $3B+B/4$; residual balls inside $8B$); upper exponents of the four errors and of $U$.
- `warning-safety.tex`: toll at most $t/8<t/4$ from $\delta_0=\sqrt{c_f}/32$, $A/L^2\le\delta_0$; the wire condition; $C$, $b_1$, $|\ell_i|$, $|m_i|$, $\|\mu_e\|$; the residual identity $Am+\ell=-A(P-A^{-1})^T\ell$; the choice of $\xi$ giving $qs^{-1}Y\xi\le\delta_0/3$; the strict margin with $\xi/2$; consistency $K_n=32(\cdot)^5N_p$ with $\operatorname{temp}\le2t$.

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other packages / chapters |
| --- | --- | --- | --- |
| `sector-gram.tex` (changed) | All 260 lines; every PR hunk; all displayed computations recomputed | Correct; F2 terminology | Tree inequality (`sec:seed-tree-patch`), predictor derivative (`sec:predictor-branch`), transport error and cut-row bounds (`sec:packet-annulus`, C07), axial gauge with $h_0$ of upper exponent $-1/2$ |
| `local-covariance.tex` (changed) | All 316 lines; PR hunks (Jaffard paragraph, window paragraph) | Correct; F2, F8; Jaffard locator unverified | \eqref{eq:covariance-data} supplied by sector-gram (transported) or by `prop:actual-global-row-prices` (curved) |
| `actual-global-row-prices.tex` (changed, largest) | All 335 lines; every PR hunk; the new coercivity proof compared step by step with `Gap.not_flat` | Correct; F1 (gap), F3 | Base-stroke bound (`sec:warning-safety`, first subsection), finite-read predictor branch (`sec:mean-action-jets`), funded path prices, axial estimate, tree inequality |
| `actual-palette-warning.tex` (changed) | All 440 lines; every PR hunk | Correct; F4, F5 (PR), F6 | All-matched receipt, beacon/port/door receipts, CAB reserve/wedge purchases (stated as hypotheses); global prices from `prop:actual-global-row-prices` |
| `local-mean.tex` | All 252 lines | Correct | Flat diagonal identity \eqref{eq:mean-diagonal} and stack identities (`sec:seed-unhit-comparison`), response cap constants (not rechecked against source) |
| `warning-safety.tex` | All 248 lines | Correct; F7 concerns its consumer | Guide bounds (`sec:seed-guides`), shell access, branch continuity, $t\ge\hat\beta_f^{-1/2}$ |
| C13 consumers (`actual-local-compiler-handoff.tex`, `actual-reader-small-window-bridge.tex`) | Passages that cite my chapters | Uses match the producers, with F3 and F7; the bridge's $p=\lfloor(B+80)/20\rfloor$ is an outer containment radius (Lean `stockBound`), compatible with the panel radius $\lfloor B/20\rfloor$; \eqref{eq:mean-error-identity} is used as stated | — |

## Not checked

The internal constants of the response cap in `local-mean.tex` (lines 88-115) against the Lean source; the Jaffard locator; the rates $\rho_{2,25},\dots,\rho_{2,40}$ and the reserve/wedge purchases in `actual-palette-warning.tex` beyond their stated arithmetic; the producer chapters `packet-annulus`, `seed-*`, `predictor-branch`, `mean-action-jets` (other packages or other reviewers); no LaTeX build or rendering.
