# C14 review, part 2 (Ward and angular chapters): mathematical validity

- Package: C14 "Free detector, physical rank, stress and Ward calibration", unit YM-000026, issue #55. Review claim session `schmittj-claude-c14-review-20261113`.
- Role: mathematical validity, reviewer 2 of 4 (this part covers the five chapters below; the other parts cover the free-theory, relay/rank/phase and stress/shell/calibration chapters).
- Reviewer: Claude agent (Opus) working for `schmittj`; no human acceptance is recorded. Independent of the author's model family (author and earlier checkers: Codex/GPT).
- Worktree `/home/jo314/ym-wt/c14-review` at `e058a61` (contains the author's merged PR #98, author commit `bfe20e7`). Lean source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Files reviewed (SHA-256; identical to the coordinator's list and to the author's `hashes.json` start and final values; see `part2-validation.md`):
  - `manuscript/existence/physical-angular-actions.tex` `c244c72a1430cb535c2d18683faa9e020974e628b9133feba82f048753c0c09f`
  - `manuscript/existence/physical-ward-analytic-continuation.tex` `685077ff658493e10dc2bbc222ee1ac3871c4c40d477ade070039a8e68d825c8`
  - `manuscript/existence/physical-ward-free-classification.tex` `784e7d1c0ef6a2f6b909744c609a76bda66991861f7edbe91a36ea8c2eecc514`
  - `manuscript/existence/physical-ward-packet-prices.tex` `0afac1f02737ff43e867661fefdfc2edaeaf08b4dea04b3237dd154b5b71d92d`
  - `manuscript/existence/physical-ward-propagation.tex` `8d221691d726121ff612090714fe44e54dd736ef1e8af8f6d2b783663696e634`
- PR #98 did not change any of these five files (`git diff bfe20e7~1 bfe20e7 -- <file>` is empty for each). Every finding below was therefore already present before PR #98; none was introduced by it. The author's records state that these chapters were only "checked at interfaces" or "read" in the C14 author pass; this is the first line-by-line review of them recorded for C14.
- Outcome: no ERROR found. Two GAPs (both in `physical-ward-propagation.tex`) and several INACCURACY/NIT items. `physical-ward-analytic-continuation.tex` and `physical-angular-actions.tex` are acceptable locally, conditional on their stated inputs (for the angular chapter one of those inputs is the open gap G1 below). `physical-ward-packet-prices.tex` is acceptable locally with nits. `physical-ward-free-classification.tex` needs small citation/statement repairs. `physical-ward-propagation.tex` needs changes.

## Findings, ordered by severity

### G1. GAP: the finite-level bridges (local response laws and the A05 readout limits) are only sketched

- File and lines: `physical-ward-propagation.tex` 397–415 and 449–456; consumed by `physical-angular-actions.tex` 41–49 and 61–64 and by `cor:selected-ward-package` (578–606).
- Passage: "For the positional response, differentiate the compactly supported flux with the same cutoff kept fixed. ... This gives the shell-commutation relation and compatibility of $p$ with grade inclusion. Applying translations, reflections, and real conjugation to the same cutoff formula gives the color covariance, reality, unit, and mirror rules for $p$ and $Y$." and "The stress meter and the shell/rotation flux identities identify the limiting rows with the free stress gradient and free spin action. Fixed-window jet convergence supplies convergence of the actual rows."
- Reasoning. Two substantive inputs of the corollary and of the angular chapter are described but not proved anywhere in the manuscript. (a) The commutation relation \eqref{eq:ward-commutation} for the raw responses $(p,Y)$, together with the unit and mirror rules, is what `cor:selected-ward-package` needs (after division by $c$) to apply `thm:ward-global-propagation`; in the source this is the `ShellCom` input produced by `YM.Work.A02.answer` and used in `Town.formed` to obtain `Crystal.ready.1`. The manuscript gives a six-line description; no computation of the derivative of the rotation flux, no use of conservation written out. (b) The two readout limits $\xi_n^{-1}r_nU_{n}^{-1}pU_n\to\kappa\partial^0$ and $\xi_n^{-1}U_{n,d}^{-1}Y_dU_{n,d}\to\kappa C_d$ (source `YM.Bid.A05`, proof `Work/A05.lean`, 122 lines) are used verbatim in `physical-angular-actions.tex` (the displays at 46–49 and 61–64), whose line 41 says they "are supplied by the physical Ward comparison". The propagation chapter supplies only the two sentences quoted. The required argument (rescale the compact flux identity, use the stress normalization \eqref{eq:stress-fixed-normalization} and the moving-label compact convergence of `sec:actual-stress-normalization`, identify the reference flux with $\kappa$ times the reference charge, and track the powers $r_n^{3}$ resp. $r_n^{4}$ coming from $d^4y$ and $\nabla\chi$) is short but is not in the text. I checked that the powers of $r_n$ in the two displays of the angular chapter are consistent with this scaling (translation: one extra factor $r_n$; rotation: none), so I expect no error, only a missing proof.
- Status: in the manuscript; present before PR #98. The evidence record `physical-ward-propagation-evidence.md` overstates this ("The manuscript proves ... the finite-level A01--A08 bridges from the stated mathematical inputs").
- Requested change: add a proof (in `physical-ward-propagation.tex` or as a separate short subsection) of the raw commutation relation and of the two A05 limits, with the scaling computation; or state them as a named input with a producer label and record the edge in the ledger.

### G2. GAP: nonvanishing of the positional response, hence of $c$, is asserted without proof

- File and lines: `physical-ward-propagation.tex` 494–495.
- Passage: "Cancel the injective common aisle map to obtain $p=c_{d,\nu}\partial$ in the original field space. Since $p\ne0$, $c_{d,\nu}\ne0$."
- Reasoning. Nothing earlier in the chapter shows $p\ne0$. The finite collinear rows only give $p\in\mathbb R\partial$; $p=0$ is consistent with every row identity used. In the source the nonvanishing comes from the translation readout limit with $\kappa\ne0$: `Town.pressured` closes with `awake X hH.2.1 (smul_ne_zero W.T.hκ hT.nz)`. The angular chapter uses $c\ne0$ (line 14, and the division by $c/\xi_n$). The repair is one sentence once G1(b) is available: if $p=0$ then $(c/\xi_n)A_n=0$ for all $n$, contradicting $(c/\xi_n)A_n\to\kappa A^0$ with $\kappa\ne0$ and $A^0\ne0$.
- Status: in the manuscript; present before PR #98.
- Requested change: replace "Since $p\ne0$" by the argument from the A05 translation limit, citing where that limit is proved.

### I1. INACCURACY: strict positivity attributed to reflection positivity alone

- File and lines: `physical-ward-free-classification.tex` 115–123 (and 9–10).
- Passage: "If $\pi_kp\ne0$, reflection positivity at the separated pair $(-r e_0,r e_0)$ gives $\mathcal M((-r e_0,r e_0);\pi_kp,\Theta\pi_kp)>0$".
- Reasoning. Reflection positivity gives only $\ge0$. Strictness needs nondegeneracy of the reflected Gram form on the jet coordinates. This is exactly `thm:ex-lattice-all-grade-free-detector` in `all-grade-free-detectors.tex` (positive tower pivots plus the Wick-norm formula), and the source proof of `YM.Maxwell.Free.hosted_out` uses `YM.Maxwell.Free.detects`, which proves strictness via invertibility of `coordGram`. With that citation the step is correct.
- Status: manuscript; pre-existing.
- Requested change: cite `thm:ex-lattice-all-grade-free-detector` (time reflection, coefficient conjugation) for the strict inequality.

### I2. INACCURACY: statement of `thm:free-collinear-scenes` conflates two different results

- File and lines: `physical-ward-free-classification.tex` 426–431; consumer `physical-ward-propagation.tex` 475–481, 613–615.
- Passage: "There is a finite level threshold such that at every larger level a finite family of collinear scene tests has simultaneous kernel exactly the quiet-charge subspace, for every level $d\geq\max\{4,D_*\}$."
- Reasoning. The proof (433–461) proves, at every level $d$ and with no threshold, that finitely many scene tests have common kernel equal to the quiet subspace (source `YM.Maxwell.Free.finite_lenses`, which holds for all $d$). The threshold $\max\{4,D_*\}$ is needed only to combine this with `thm:free-quiet-classification` and conclude that on the spin subspace the common kernel is $\mathbb R\partial$ (source `YM.Maxwell.Free.scanner`, `∃ N, ∀ d ≥ N`, with `N = max d 4`). The latter is what the propagation chapter consumes ("Its kernel is exactly the span of $\partial$"). The sentence as written has a redundant double threshold and does not state the consumed conclusion.
- Status: manuscript; pre-existing.
- Requested change: state (i) for every $d$, a finite scene family with kernel equal to the quiet subspace; (ii) for $d\ge\max\{4,D_*\}$, its kernel on the vector-spin subspace is $\mathbb R\partial$.

### I3. INACCURACY: the heuristic fixed-window description does not match the test actually used, and "limits" is too weak

- File and lines: `physical-ward-propagation.tex` 139–153 and 348–350.
- Passages: "choose smooth compactly supported windows $\chi_i$ around each point ... Their supports lie in the cutoff shells around the insertions, and the exterior packet estimate below controls them." and "The local packet limits are $F_b^{(n)}(y)\to y_a$ and $F_a^{(n)}(y)\to-y_b$".
- Reasoning. The estimate actually proved is for the growing anisotropic petal centred at the origin (widths $e^{100n},e^{150n},e^{300n}$), whose shell lies far from all insertions, not for fixed windows around each insertion. The compact flux identity needs the test field to coincide with the orbital field on a neighbourhood of each insertion, not merely to converge to it. The source has the exact statement (`YM.Outer.petal_mid`, `petal_home`: for all sufficiently large $n$, `petal a b l n` equals $y\mapsto y_a$ on a neighbourhood of every fixed point). With that, the conclusion "That response is independent of $n$" is correct.
- Status: manuscript; pre-existing.
- Requested change: delete or label the first paragraph as motivation, and replace "local packet limits" by the exact eventual coincidence near the insertions.

### I4. INACCURACY: cluster sign hypotheses and two pointwise packet bounds are used without statement or derivation

- File and lines: `physical-ward-propagation.tex` 212–228, 239–245, 274–275.
- Passages: "On the cove, the frozen Fourier estimate for that panel gives the differentiated-packet bound \eqref{eq:ward-packet-tail}" and "If $d\ne b$, the shear estimate bounds the squared packet by an amplitude with exponent $3+w_d$, against $D_{-3000,n}D_{w_d,n}$."
- Reasoning. (a) The line price \eqref{eq:packet-line-price} requires the collinear cluster $B$ to have both reflection signs among the axes other than $l$ and an axis of sign opposite to $l$; the point price for $A$ needs both signs on all four axes. The propagation chapter never states the sign patterns ($B$ odd exactly in the axes $a,b$; $A=J_{db}$ odd exactly in $d,b$) nor checks these hypotheses. They hold (for $a\ne b$, the set of axes other than $l$ contains one of $a,b$ and one axis outside $\{a,b\}$; for $d\ne b$ both signs occur), as in source `YM.Outer.mixesLine` and `spar_both`. (b) The packet-tail bound follows from the exterior Fourier computation of `sec:physical-ward-packet-prices` (temporal factor $\exp(-E/e^{w_dn})$, and on the cove each transverse factor $e^{-w_jn}|f_j|\le Ce^{n}h_{j,n}$, giving $e^{3n}$); the shear bound follows from it by $(1+\tau)^2e^{-2\tau}\le1$ with $\tau=p_d e^{-w_dn}$ and $(p_d+e^{-3000n})(p_d+e^{w_dn})\le(p_d+e^{w_dn})^2$. I verified both derivations; neither is written. All exponent arithmetic in 246–281 is correct ($-119.5$, $-972$, $-146$, $-221.5$, then $-101$ and $-101+100=-1$).
- Status: manuscript; pre-existing.
- Requested change: state the sign patterns of $A$ and $B$ and verify the hypotheses of the line and point prices; add the two-line derivations of \eqref{eq:ward-packet-tail} and of the shear bound (or cite the display in the packet chapter).

### I5. INACCURACY: "collinear" must mean on a coordinate axis through the origin

- File and lines: `physical-ward-propagation.tex` 33–34 (and the hypothesis of `thm:ward-global-propagation`, 50–51).
- Passage: "The condition \emph{collinear} means this identity holds whenever the points lie on one common coordinate line and remain pairwise distinct."
- Reasoning. The angular expression contains $Kx_i$ and is not translation invariant, so the identity on lines parallel to an axis is a different (stronger) hypothesis than on the axes themselves. What is proved and used is the axis version: source `YM.Ward.Collinear` uses `onLine a x := ∀ i, ∃ t, x i = t • basis a`; the walk ends on the $a$-axis; `lem:ward-outer-miles` correctly says "on the axis $b$"; the analytic chapter uses points $ue_a$ and $0$.
- Status: manuscript; pre-existing.
- Requested change: replace "one common coordinate line" by "one coordinate axis $\mathbb Re_a$".

### I6. INACCURACY: augmented injectivity is applied to vectors whose membership in $V_d$ is not checked

- File and lines: `physical-ward-propagation.tex` 477–495.
- Reasoning. $(R_\nu,\ell)$ is injective on $V_d$, the admissible spin-sector space. The argument applies it to $p_\nu-c_{d,\nu}\partial_\nu$; one needs $p_\nu,\partial_\nu\in V_d$, i.e. that the transported responses satisfy the covariance/reality/unit constraints. This follows from the local response laws (G1(a)) and the eventual compatibility of the comparison maps with conjugation and signed actions, but is not said.
- Status: manuscript; pre-existing.
- Requested change: one sentence stating why the transported vectors lie in $V_d$.

### I7. INACCURACY: order of argument in the top-shelf elimination

- File and lines: `physical-ward-free-classification.tex` 149–157 versus 179–195.
- Reasoning. "The circulation equations for the chosen $q_c$ state that $MR=0$" is asserted before the next paragraph proves that each circulation vanishes (it is a ghost at capacity $D_*$ by `thm:free-circulation-null`, lies in a lower weighted shell, and is zero by the strong induction on $w$). The logic is complete (and matches source `YM.Maxwell.Free.reduces_top`, `exposed`), but in the present order the first paragraph uses an unproved claim. Separately, the gauge invariance of the circulation (needed for the induction hypothesis) is implicit in the colour contraction and is supplied in the source by `circulates_lower`; it deserves a clause.
- Status: manuscript; pre-existing.
- Requested change: state the induction first, or add "(this is proved in the next paragraph)" and a clause on gauge invariance.

### N1. NIT: cross-seed evaluation shows only one of the two values used

- File and lines: `physical-ward-free-classification.tex` 376–379.
- Reasoning. $A=B$ follows from reciprocity at $z=e_0+e_2$ because $F(D_{0;01},C_{12};z)=F(D_{0;12},C_{01};z)=-2\nu$. Only the first is displayed. I computed both from $\langle F_{\mu\nu}(x)F_{\rho\sigma}(0)\rangle=4\nu|x|^{-4}(I_{\mu\rho}I_{\nu\sigma}-I_{\mu\sigma}I_{\nu\rho})$, $I=\mathbf 1-2\hat x\hat x^{\mathsf T}$: both equal $\partial_0(8\nu x_0x_2r^{-6})|_{(1,0,1,0)}=\nu-3\nu=-2\nu$. Correct; display the second value.

### N2. NIT: minor precision items in the free classification

- 228–230: the domain of the conclusion $A_a=c\partial_a$ (the field space through level $d$) and the fact that $\partial_a$ is itself quiet (used at 388–390) should be stated.
- 405–407: "Choose $\chi$ equal to one at the marked insertion and zero at the other insertions" should read "equal to one near the marked insertion, with support avoiding the others" (the hypothesis of `prop:maxwell-radial-ward`).
- 278 vs 293: $F(q,w;-z)$ versus $F(q,w;z)$; equal because the zero-jet covariance is even in $z$, which may be noted.

### N3. NIT: packet chapter

- `physical-ward-packet-prices.tex` 116: ",dx" should be "\,dx".
- 273–279: nonnegativity of $\mathcal Lr_w$ needs $0\le\zeta\le1$; state it.
- 123–128: the bound \eqref{eq:packet-response-ceiling} is for $f\ge0$ (the lower bound $0\le$ uses it); say so.
- 290 and 358: $R$ is reused with different meanings, and propagation 253 uses $R=e^{-3000n}$ while 287 uses a fixed $R>0$.

### N4. NIT: propagation and angular wording

- `physical-ward-propagation.tex` 561–565: "Equating the two computations gives zero row sum for the defect ... has zero row sum on every separated word." is ungrammatical.
- `physical-ward-propagation.tex` 596: $\mathcal A_K(p,Y)$ is used for the expression \eqref{eq:ward-angular-expression} with $\mathcal P$ replaced by $p$ and $\mathcal Y$ by $Y$; define this notation.
- `physical-angular-actions.tex` 10–14 versus `actual-stress-normalization.tex`: there $E_d$ is the reference space and $F_d$ the physical one, here $E_d$ is physical and $E_d^0$ reference; and $D$ denotes the divergence there, the normalized angular map here. Harmonize or warn.
- `physical-angular-actions.tex` 199–200: "agrees with the prescribed signed action" uses that $R_d^0$ restricted to signed permutation matrices is the reference signed action; say so.

## What was verified and found correct (summary of the line-by-line checks)

- Free classification. Hilbert-basis/averaging proof of `lem:free-uniform-generation`; the Wick leg count in `lem:free-coalescence` (normal-ordered insertions; no spectator–spectator contractions when the distinguished length equals the total spectator length); the strong induction of `thm:free-uniform-detection` including $D_*=\max\{r_j,2j+5\}\ge L+\ell+4$ for $\ell<j$, the determinant specialization to the identity, the adjugate step in the integral domain $\mathbb C[\text{on-shell jet coordinates}]$, and the separation fact by induction on the probe order (Euler degree $-(4+h+\ell-1)\ne0$). In `thm:free-quiet-classification`: the description of the gauge-invariant weight-4 and weight-5 shells for a simple group; the six-leg identity \eqref{eq:free-three-quadratic-wick} (factor $4\dim\mathfrak g$); the $t^5$ near-collision limits (only the $t^{-5}$ one-jet/zero-jet kernel survives, the third placement is $O(t)$); the point-separating third quadratic ($\kappa_z=4\nu\|z\|^{-4}$, which I rederived from the Feynman-gauge propagator $G=1/(4\pi^2|x|^2)$); the reciprocity, linearity of $f_a$, both parity selections ($D_{0;01},D_{2;12},D_{3;13}$ and $D_{0;12},D_{1;02},D_{2;01}$), the Maxwell identity $D_{2;12}+D_{3;13}=D_{0;01}$ and Bianchi identity $D_{1;02}-D_{2;01}=D_{0;12}$ with signs, $c=A/2$; the commutator $[\Gamma,B_a]$ argument (Ward identity of $B_a$ on words containing the stress, $B_aT=0$, radial identity), and the final weight/reflection parity argument. `thm:free-collinear-scenes`: the perturbed-projection segment stays in configuration space; analyticity and finite kernel selection.
- Analytic continuation. Gram identity; normal-direction analyticity from the heat semigroup; the comparator $Q$ ($\mathcal R\theta=1$, $\mathcal R\rho=0$, PDE \eqref{eq:ward-comparator-pde}); the identification of $G_{Tv,w}+G_{v,Tw}+\mathcal RG_{v,w}$ with the two-point angular expression ($K(ue_a+ze_b)=ue_b-ze_a$); vanishing of all transverse jets from the collinear identity and \eqref{eq:ward-analytic-commute}; the commutation formula $\partial_z^n\mathcal R=\mathcal R\partial_z^n-n\partial_u\partial_z^{n-1}$ and the jet induction; the Hilbert-space factorial argument ($\|f^{(n)}\|^2=|A^{(2n)}(0)|\le C(2/R)^{2n}(n!)^2$, radius $R/2$); the reduction of an arbitrary word with an extreme insertion to a singleton vector, and the reflection for minima. No issue found.
- Propagation. The derivative identity $\partial_{x_i,b}\mathcal A_K(q)=\mathcal A_K(q[i\mapsto\mathcal P_bq_i])$ from \eqref{eq:ward-commutation} (I rederived the signs); the walk (every segment has the moving point strictly extreme in some coordinate, as required by the analytic chapter); density and continuity; `lem:ward-outer-miles`; `lem:ward-brackets` ($[X_u,X_v]=-X_{[u,v]}$, cancellation of distinct-slot terms, sign of the defect); the Cauchy–Schwarz price rule; the elementary inequalities ($e^{-\tau}\le4(1+\tau)^{-2}$, $1\le4p/(p+R)$, the $p_d<e^{-3000n}$ bound $H^2\le4e^{-3000n}D_{-3000}D_0$) and all exponent arithmetic; the exterior alternatives; the rank-one augmentation argument (apart from G2, I6); the corollary's division by $c$.
- Packet prices. Independence of $\mu_i^A$ from the placement; the polynomial-moment bound including $\int_0^1t^{D_0}e^{-tE}dt\ge e^{-1}(D_0+1)^{-1}(1+E)^{-D_0-1}$; the moment-subtraction formula (Lagrange coefficients give $\delta_{kr}$); the Laplace response $2E\int f/(x^2+E^2)$; the rational interpolation identity and the positive kernel \eqref{eq:packet-positive-kernel}; the ceiling and floor bounds; the axis-change identity and alternation inequality \eqref{eq:packet-axis-alternation}; the scale order of the sign-walk induction ($a'k>K|\cdot|+\max(K,\delta)$, then $D$, then $a<a'$ with $aD<\delta$); the gap profile ($\mathcal Lr_w\ge c_u(E+w)^{-1}$, response $\le Cw^{-1}e^{-2uE}$); the line price exponents ($1$ and $-w_l\le150$); the exterior bound with $y=-101$ and the zeroth response $900$; the seven-error algebra ($B\le\frac{10}{12}E_n$, $F\le\frac{13}{2}E_n$); the dyadic kernel bound $c_m=2\cdot2^{-3m}/400$ and the cone exponent $\delta+4a=-395$.
- Angular actions. The scalar ratio $c/\xi_n\to\kappa$ and \eqref{eq:angular-transport-limit}; $[K_{ah},K_{hb}]=K_{ab}$ and the plane bracket formula; that $T_{n,\cdot}$ is a Lie representation and $L_n$ is central; the Haar-averaged form, $\ker L=\bigcap\ker T_i$, the Cayley–Hamilton peeling and $q(L)^2=q(L)$; preservation of $\mathcal F$; the iteration identities $Z'-Z=(I-2Z)e$, $e(Z')=(4e-3)e^2$ and the norm induction; $m_n\le2m_n^2$; the exact intertwiner; $O(4)$ covariance by differentiating along $e^{tA}$; unit, inclusion and \eqref{eq:angular-derivative-vector}; the stress averaging, its conservation ($\partial_aR(K)v=\sum_mK_{am}R(K)\partial_mv$) and the transformation of both Ward normalizations; consistency of the sign with $\kappa=-1$; the match with `input:calibrated-actions` in `label-descent.tex`.

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other chapters/packages |
| --- | --- | --- | --- |
| `physical-ward-free-classification.tex` | all 464 lines; Wick, kernel and parity computations redone | Changes requested (I1, I2, I7; nits N1, N2). No error | `thm:free-circulation-null` (`free-collision-pole-separation.tex`), `eq:maxwell-radial-single-charge` and `eq:maxwell-radial-polynomial-ward` (`free-maxwell-radial-flux.tex`), strict reflected positivity `thm:ex-lattice-all-grade-free-detector` (not cited), normal-ordered free moments. All C14-internal, reviewed in part 1 |
| `physical-ward-analytic-continuation.tex` | all 214 lines | Accepted locally, conditional on inputs | OS Hilbert space and heat semigroup (`sec:complex-heat`), translation/permutation/signed-reflection symmetry of the hierarchy, collinear identities and commutation rule (outputs of the propagation chapter's stress argument) |
| `physical-ward-packet-prices.tex` | all 443 lines | Accepted locally with nits (N3) | Joint spectral measure (`sec:spectral-measure`), polynomial separated-point derivative bounds of the hierarchy, conservation/fixed-band errors of `sec:physical-ward-stress-cone` (reviewed in part 4) |
| `physical-ward-propagation.tex` | all 622 lines | Changes requested (G1, G2, I3–I6; N4). No error | Packet/cone prices (above), `sec:actual-stress-normalization` (comparison curve, $J$, $\xi_n$), free classifier and scenes, `thm:free-internal-erasure`, and the A01/A02/A05 bridges, which are not proved anywhere (G1) |
| `physical-angular-actions.tex` | all 315 lines | Accepted locally, conditional on inputs | $p=c\partial$ with $c\ne0$, global Ward identity and brackets for $D$ (propagation; see G1, G2), the A05 readout limits (G1(b)), comparison maps of `sec:actual-stress-normalization`, `input:calibrated-actions`, `prop:lorentz-label-descent`, `sec:lorentz-covariance` |

## Cross-package edges and records for these chapters

- Ledger row "Exterior Ward" and "Angular and phases" (`ledger.md`): their descriptions are accurate (cone exponent $\delta+4a$ including $-395$; full rotation covariance is an output and not an input of the analytic chapter, which uses only single-generator exponentials; "A05's nonzero observer gives $c/\xi\to\kappa$, not equality of normalizer sequences" matches \eqref{eq:angular-scalar-ratio}). The status column correctly says the four exterior chapters were not freshly re-proved by the author.
- Edge C14-to-C16-stress-normalization / C13-to-C14-common-stress: the angular chapter uses one sequence $\xi_n$ and one comparison curve, consistent with `sec:actual-stress-normalization` (single $J$, single positive normalizer sequence, tails of one curve). One comparison curve is preserved here. The missing A05 proof (G1(b)) is the unrecorded link in this edge.
- `physical-ward-propagation-evidence.md` overstates G1 (see above) and gives non-existent qualified names (see `part2-lean.md`).

## What I did not check

- The proofs inside the producer chapters consumed here (`free-collision-pole-separation`, `free-maxwell-radial-flux`, `all-grade-free-detectors`, `free-internal-ward-erasure`, `physical-ward-stress-cone`, `actual-stress-normalization`, `label-descent`, `lorentz-covariance`, `complex-heat`, `spectral-measure`); other parts of this review cover the C14 ones.
- The cross-slice identity and the finite signed cluster expansion of the stress (propagation 303–338) beyond their logical role; the identification of the readout with the actual insertion packet away from a null set (source `YM.Outer.blows`).
- The A03, A04, A06, A07 summaries in propagation 417–447 and 458–519 were checked for logic, not against a full written proof (they are short summaries; A06's exact scaling identity is stated without proof).
- No LaTeX build; no Lean build or axiom replay.
