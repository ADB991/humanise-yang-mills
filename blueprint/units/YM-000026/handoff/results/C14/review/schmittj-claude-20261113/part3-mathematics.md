# C14 independent review, part 3: mathematics

Reviewer 3 of 4, session `schmittj-claude-c14-review-20261113` (Claude), issue #55. Worktree at `codex/existence-monograph` commit `e058a61`, which contains author PR #98 (author commit `bfe20e7`). Scope: `actual-equation-kernel-relay.tex` and `actual-insertion-derivative-relay.tex` (both changed by PR #98, reviewed first and most thoroughly), and the unchanged `physical-ward-stress-cone.tex`, `phase-ward-inheritance.tex`, `actual-phase-detector-moments.tex`, `actual-rank-purchases.tex`, `trace-firesky-gallery.tex`. All seven files match the coordinator's hashes (see `part3-validation.md`). This is a draft review. It approves nothing and refreshes no fingerprint.

Overall: I found no ERROR in the mathematics of the two changed chapters. All four PR #98 repairs in these chapters are correct and match both the C12 producer statements and the Lean source. There is one confirmed INACCURACY in the gallery chapter, the unit/weight discrepancy. It is pre-existing and was confirmed independently. There are three further INACCURACY items about open inputs that are not shown and a mis-stated geometric constant, plus some NITs. None was introduced by PR #98.

## Findings, ordered by severity

### F1. INACCURACY (manuscript, pre-existing). Gallery handoff misstates the weighted limits and the target field

File `manuscript/existence/trace-firesky-gallery.tex`, lines 223–233. Quoted: "for every comparison table, an eventual decomposition of its rescaled transformed energy tensor into the scalar unit and canonical stress direction, with the two scalar coefficients converging respectively to the prescribed stress coefficient and to zero; and convergence of the corresponding zoomed scalar observable to the prescribed multiple of the unit."

Verified reasoning. The receipt this paragraph describes is the structure `YM.Trace.Over.Scribe` (`Lean/YM/TraceExtension/Chart/Time.lean`, lines 52–60). Its field `gallery` gives, for each table `T` with `T.Hierarchy` and `T.respects S`, real sequences `d,e` such that eventually `(J.U i 4).symm ((J.r i)^4 • theta T A'.energy) = ScalarP C ![e i, d i]`, together with `Tendsto (BQ Z V i * d i) → d2 G` and `Tendsto (BQ Z V i * e i) → 0`. Here `ScalarP C ![e,d] = e • unit 4 + d • (4 • OScale)` (`Chart/Scalar.lean:41`). `OScale = fromPol (square4 G)` is the curvature-square field (`Chart/Stage.lean:50`), and `sum_delta` shows that `4 • OScale` is the trace of the material stress. Field `goal` says `ZoomValue J (BQ Z V) (theta T energy) → (4 * d2 G) • OScale`, and `ZoomValue` contains the factor `BQ`. The field `grows` gives `BQ → ∞` (`BQ = Z.β ∘ Stern V`, `Chart/Dray.lean:42`). So the unweighted coefficients `d_i, e_i` both tend to zero. The manuscript is wrong on two counts:

1. Only the coefficients weighted by `BQ_i` converge, to `d2` and to `0`. The unweighted coefficients do not.
2. The zoomed scalar converges to `4·d2` times the curvature-square field `O`, not to a multiple of the unit. The second basis direction is `4O`, the trace of the material stress, not a "canonical stress direction".

The decomposition also needs the hierarchy and `respects S` hypotheses on the comparison table, while `goal` holds for every table. This confirms the observation in `results/C15/review/mgubi-astra-c15-trace-20261113/mathematics.md`, item 5. The paragraph lists inputs rather than proving anything, so nothing downstream in C14 is invalid. However, the paragraph cannot serve as the interface statement for C15 or C16 as it stands.

Status: open. Requested change: restate the paragraph with the weights `BQ_i`, the two directions `1` and `4O` (with `O` the curvature-square field), the limits `BQ_i d_i → d_2`, `BQ_i e_i → 0` and `BQ`-zoomed scalar `→ 4 d_2 O`, and the hypotheses on the table.

### F2. INACCURACY / visibility gap (manuscript, pre-existing, not addressed by PR #98). The budget-triple schedule condition and the slow-reserve hypotheses of `prop:ex-marked-solaris` are not shown as open inputs

File `actual-equation-kernel-relay.tex`, lines 11–22 and 59–61. Quoted: "The stage and delay purchases of Section~\ref{sec:ex-marked-portfolio-calibration} supply the derivative credit, its running-coupling upper bound, and the sphere inequality."

Verified reasoning. `prop:ex-marked-solaris` (`marked-portfolio-calibration.tex`, lines 371–395 and 418–447) has four inputs. Input (1), the eventual budget triple, "follows with `b_N=a_{d,J(N)}`" only "for a schedule satisfying the floor and delay conditions". The text adds that "the discharge of those conditions on the selected public run is an open input" (lines 380–383). The floor condition is that the stage thresholds `n_i` do not exceed the floor length of stage `i`, and it "is not proved in this section" (lines 262–265). Input (3), slow growth of `u_N^{-1}` and `zeta_{d,N}`, is a hypothesis of the proposition. PR #98 correctly added the served-representation inputs (`prop:actual-marked-figment`) and the reserved-address and fee-delay inputs (`prop:terminal-marked-voice`). The floor condition is a separate open input of input (1), and the consumer states the triple as supplied. The slow reserves are referred to as "the same subpower bounds ... stated there" (lines 84–85), which reads as a proved fact.

In Lean, `YM.MergeProof.solaris` takes `Braze V b` (the triple) and `Fridge C u ζ` (slow `u^{-1}` and `ζ`) as hypotheses (`Lean/YM/MergeProof/Canopy.lean`, lines 24–27 and 32–33). The caller discharges both, for example `Lean/YM/MergeProof/Inns.lean`, lines 42–50. So this is a manuscript gap in visibility, not a mathematical error. The ledger edge "C12-to-C14-calibration" also names only the served residual, reserved addresses and "schedule fee/floor inputs". The last of these is not visible in the chapter.

Status: open. Requested change: add one sentence to lines 15–19 saying that the budget triple of input (1) is conditional on C12's floor and delay schedule conditions on the public run, and that the slow growth of `u_N^{-1}` and `zeta_{d,N}` (input (3)) is assumed.

### F3. INACCURACY (manuscript, pre-existing). Cell-diameter constant and pairwise separation in the spectator estimate

File `actual-equation-kernel-relay.tex`, lines 249–264. Quoted: "Choose an available cell depth $k$ with $a_k<\delta$ ... All insertions occupy distinct cells, since two points in one cell have physical separation at most $a_k<\delta$."

Verified reasoning. The separated configuration domain is Euclidean: `ope-filtration.tex` lines 184 and 207 speak of "all physical pairwise separations" and "separated in the Euclidean sense". A four-dimensional cell of side `a_k` has Euclidean diameter `2a_k`, so the statement is false as written. The step also needs every pair of insertions to be `δ`-separated, not only the distinguished point from each spectator. That is the hypothesis of the smearing lemma in `ope-filtration.tex`. But the preceding subsection (lines 215–231) states only distinguished-to-spectator separation, and the present subsection says only "separation `δ>0`".

Smallest repair: choose `a_k < δ/2` (or measure separation in the maximum norm), and state pairwise `δ`-separation of all `n` points in the hypothesis of `eq:equation-spectator-bound`. Neither change affects the conclusion. Status: open, cosmetic.

### F4. INACCURACY (manuscript, pre-existing). The derivative-shift purchase is presented as proved

File `actual-insertion-derivative-relay.tex`, lines 95–98. Quoted: "The selected delay explicitly buys $J_N\le\widehat\beta_N$".

Verified reasoning. In Lean this inequality is the hypothesis `hp : ∀ i, jump (budget i) ≤ hatBeta i` of `YM.MergeProof.freezes` (`Lean/YM/MergeProof/Portions.lean`, line 24), where `jump = (2^power)^order` (evidence file). The selected caller discharges it (`Inns.lean`, line 42), and it then becomes `Fridge.shifts`. I found no manuscript producer: the only occurrence of the inequality in `manuscript/` is this line. The chapter's opening list of assumptions (lines 8–12) names the "positive reserve estimates" but not this purchase.

Status: open. Requested change: list `J_N ≤ β̂_N` among the assumed selected-run purchases, or cite the chapter that produces it.

### F5. NIT (manuscript, in the region changed by PR #98, already implicit before). Identification of the comparison label in the backward relay

File `actual-insertion-derivative-relay.tex`, lines 186–197. Quoted: "Its bottom primary determines a reference label $v_{N,p}$ of grade $e$. Item (4) of that lemma, before taking the last-step purse, gives $32(1+C_N)^2|Z.x-X_{N,p}^{-1}v_{N,p}|_1\le2(1+C_N)Q_N\le E_{N,p}$."

Verified reasoning. With `l=ref(e)`, `m=N` and `w=Q_N`, item (4) of `lem:actual-marked-antilles` (lines 140–146) at `i=N` gives `32(1+C_N)^2‖x_N‖_1 ≤ c_N ≤ 2(1+C_N)Q_N`. The terminal identity gives `x_N = Z.x + ι_N(-ϖ_l)`. With `ι_N = id` (the terminal voice has lead `v` at every label: (R6) and `prop:terminal-marked-voice`) and `v_{N,p} := X_N(ϖ_l)`, this is `Z.x - X_N^{-1}v_{N,p}`. Then `2(1+C_N)Q_N ≤ 4(1+C_N)Q_N ≤ E_{N,p}`. The repair is therefore correct and matches `YM.MergeProof.pudding` (`Biscuit.lean`, lines 52–55, hypothesis `ref d ≤ N`). However, the two facts `v = X_N(ϖ_l)` and `ι_N = id` are not written out. The root-test display at lines 207–211 is the second conclusion of the same calibration, and in the manuscript it is proved only through the proof of `prop:actual-marked-figment`, conditional on the served representation. The added sentence at lines 188–190 covers this, but the display itself carries no marker of the condition.

Requested change: write `v_{N,p}=X_{N,p}\varpi_l` and `ι_N=\mathrm{id}`, and attach "conditional on the served representation of Proposition~\ref{prop:actual-marked-figment}" to the display at lines 209–211.

### F6. NIT (manuscript). Notation

In `actual-equation-kernel-relay.tex`, `s_j` (factor degree, line 91, added by PR #98) clashes with `s_N` (logarithmic scale, line 79). C12 writes `σ_N` and the exponent `e^{-γσ_N}`. The chapter tacitly identifies `s_N=log(1/a_N)` (insertion relay, line 16) with `σ_N`. These agree up to an additive constant (`gain(N,i)=e^{(σ_N-σ_i)/8}=∏L_j^{1/8}`), which is harmless but should be said.

At line 26, "the fixed campaign regrading ... intertwines conjugation and signed motions" holds for the symmetrized imprint, not for a bare campaign. In Lean, `twist_real` and `twist_orient` take `h : Imprint`, and C12 takes `R_d=A_d` from an imprint. Say "imprint regrading".

At line 142, `k` is reused for a fine depth while `(m,k)` is an opened pair just above.

Lines 21–22 ("The two subsequent calibration and attachment chapters ...") do not name the chapters.

In `actual-rank-purchases.tex`, line 294, `S(\sigma_{k_n}x^{(n)};,u^{(n)})` has a stray comma.

## Verification of the PR #98 repairs in my chapters

1. Campaign filtration, equation relay lines 26–31: correct. C12 requires `A_dp-p` to have stamp strictly above `st(r,s)` for `p` of stamp at least `st(r,s)`. The proof of `thm:ex-marked-portfolio-section` shows that the inverse preserves the lower stamp bound. `YM.Push.Mark.regrade_tri` gives `regrade F p - p ∈ above a` for every `p ∈ rise a`, which is stronger than the homogeneous statement in the manuscript, and `inverse_tier` gives preservation of `rise a` under the inverse. The old wording "grade-preserving" was indeed false in general.
2. Seat sum, equation relay lines 85–96: correct. It agrees with C12 (`Z_N=(C(V)+2C(T))Seat_{d,N}`, `Seat=∑_jθ_N^{-s_j}`, `E_N=4(1+c_N)S_N+e^{81(α_N+2)}Z_Nζ_{d,N}u_N^{-1}`) and with Lean: `storms X Y C N j = X·seats + 2Y·seats`, `seats = ∑_j threshold⁻¹^(grades j).2`, and `E` in `solaris`. The removed "insertion-site count" did not belong there. The stencil cardinality enters `sphere` only. "Each fixed inverse threshold power is subpower" is justified in C12 by `θ_N^{-1} ≤ β̂_N`, and the consumer could cite that.
3. Citation of `prop:ex-marked-solaris`: the statement exists in the form used. Item (1) gives `|e_j-u_j|_1 ≤ δ_d=(2𝒪_d^2)^{-1}` and the inverse bound 2. Item (2) gives the root bound `cider(d,m,k) E_N e^{-σ_N/8}` for `ref(d) ≤ k < N`, every `m` opened at `k` (`m ≤ k`, hence `m ≤ N`) and every motion, conditional on the served representation. Item (3) is slow growth of `E_N`, with the threshold uniform in `p`. The consumer's display `eq:equation-column-root` and its `δ_d` match. The served and terminal inputs are now visible (lines 15–19); see F2 for the one input that is still missing.
4. Backward relay, insertion relay lines 186–197: correct (F5). The terminal coefficient also satisfies every field of a terminal Cream (`Q_N>0`, cost `≤Q_N`, `4(1+C_N)Q_N ≤ E_{N,p}`, `H_Nζ_{e,N} ≤ u_NE_{N,p}`, profile hook, density `a_N^eR_NF_{N,p}(0)`, continuity), as `prop:actual-marked-figment` requires.

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other packages |
| --- | --- | --- | --- |
| `actual-equation-kernel-relay.tex` (PR #98) | Whole file. Re-derived: the PR diff against C12 and Lean; the `P_{N,p}` construction and its equivariance; the inverse bound; the subpower calculus; the exponent arithmetic `1/8→1/16→1/32`; the transfer between tilings (`3h≤H/J`, 16 corners, margin `2h`); the root triangle inequality; the identity `O(XPv)-V(v)`; the uniform microscopic radius by a finite basis; the separation `a_N(s+r)<δ`; the shift count `2n⌊L/J⌋<L`; the planted spectator bound `A^{n-1}y`; the moving kernel `K=X P X^{-1}E I_d` and the exact cancellation `v=S_θ coords R_d z`; the final limit. | Correct apart from F2, F3 and F6. | C12: `prop:ex-marked-solaris`, `prop:actual-marked-figment` (served representation), `prop:terminal-marked-voice` (reserved addresses, fee delay, lawfulness), floor and delay schedule (F2), slow reserves; `ex-centered-estimates` (planting, integer maximum principle); `ex-column-subpower`; microscopic identity of `sec:marked-campaign-producer`. |
| `actual-insertion-derivative-relay.tex` (PR #98) | Whole file. Re-derived: protected prices; weight raising; the cancellation `a_N^{d+1}D_α`; the direction-origin cost `2^{w_Nq_N}` (with the inequality in the correct direction); the decomposition `eq:relay-protected-split` and the bound `r=b+2A_e𝖭_Nq`; the price `A_N(h+Mr)`; `E_{N,p}` against the Cream fields; item (4) at `i=N`; the bound `|X^{-1}v|≤2E`. | Correct apart from F4 and F5. | C12: Lemma antilles hypotheses ((R1), (R6), (R7)), served representation and terminal voice (now retained), slow `u_N^{-1}` and `ζ`; shift purchase (F4); readout bound `K_e`. |
| `physical-ward-stress-cone.tex` | Whole file. Checked: the subtracted extension and its integrability; the parity argument for `c_{abcd}`, the pair patterns aabb/abab/abba and the corrected functional's zero linear jets (verified directly that `Δ̃(h^{(a)})=0`); oddness under inversion leaving orders ≥3; contact exponents `3a`, `4a`, `6a`; the chain identities `T_1=P_i^2T_0+C_1`, `T_2=P_i^2T_1+C_2` and the normalized defects `w^{-2}e^{4an}`, `w^{-4}e^{6an}` (exponent `2a`); signs `F_0≥0`, `F_1≤0`, `F_2≥0`; the final exponent `δ+4a`, giving `-395` at `a=-99`, `δ=1`. I checked the odd-profile Laplace bound only at the level of the stated inequalities. | No error found. | `sec:physical-ward-packet-prices` (response floor, mixed-sign estimate, algebraic seven-error estimate): reviewer 2's scope. I did not check the jet scaling convention `exp(n∑w_iα_i)` against that chapter's normalization. |
| `phase-ward-inheritance.tex` | Whole file. Checked: the Hahn–Banach evaluator on compressions; slab placement containing all of `supp χ`; continuity of `F_{ab,u}` across collisions via the vanishing weight; the Bochner integral and functionals commuting with it; matrix elements with exterior words outside `supp χ`; density of positive-time vectors; the signs of both flux identities. | Correct. | Unselected Ward identities from `sec:physical-angular-actions`; slab regularity; whole-word character definition; `ex-pure-ground` (selected only). |
| `actual-phase-detector-moments.tex` | Whole file. Checked: the even displacements (no reflection); conjugation preserves the root price; distinct addresses `2t(2q)≤` period; genericity for large `t` (one excluded `t` per coincidence); the order of limits; adjoints through `M(\bar w)=M(w)^*`; the bound on `⟨Ω,(Z^*Z)^qΩ⟩`; the character bound; the two-point algebra `S(f_jf_h)-(κ+a_ja_h)=χ(D_{jh})+a_j(S(f_h)-a_h)+a_h(S(f_j)-a_j)`, giving `g(1+|a_j|+|a_h|)`. | Correct. | Reflected-word identification (`Phase.reflects`, C12 phase grid); `ex-cluster-train`; `ex-character-moments`; full-support spectral measure; `ex-no-new-null`. |
| `actual-rank-purchases.tex` | Whole file. Checked: real lifts; cofinality of comparison levels; `|Av|≤2|Tv|` and the inverse `2D_k`; root bound `e^{I_k-2I_k|I|}≤e^{-I_k}`; unique real normalized lifts with `u_0=e_0`; `t^{-1}=θ_k√β≤2𝓜_k` (using `|β-s|≤s/8` with `s=β̂_k`); the bound `B_k`; recursive selection; the order of limits in `eq:rank-purchased-point-comparison`. | Correct (F6 typo). I did not verify the explicit `D_k` product against source. | Corrected mixed compiler, reader mean and covariance bounds, auxiliary history (`sec:restarted-rank-history`), `sec:rank-root-normalization`, C13 `rated` supplier. |
| `trace-firesky-gallery.tex` | Whole file. Checked: the clock-gap interpolation (including the case `k=J+1` via `s≤g_b(J)`); strict selection; the ultrafilter compactness step; the finite-basis multilinear limit; the tested approach property; injectivity from a finite separating test family, uniform on the unit sphere by linearity and bounded charges; arbitrary isomorphisms before the tail. | Correct except F1. | Three-panel chart result (`sec:three-panel-weak-comparison`); all-grade free detector; physical-array, stress and flux receipts (C15, external #33/#34). |

## Records checked

`results/C14/findings.md` repairs 1–2 and ledger edge "C12-to-C14-calibration and C12-to-C14-antilles": accurate, except that the chapter does not show the floor condition the ledger mentions (F2). The ledger rows "Kernel and derivatives", "Purchased rank", "Trace comparison" and "Angular and phases" match the chapters for my files. In particular the trace row correctly says that the full gallery needs extra receipts. It does not record F1, which the C15 review reported. `handoff.md` priority 1: confirmed, with F2 as the only gap in visibility.

## Not checked

- Full proofs of the C12 producers (antilles, figment, solaris, terminal voice) beyond their statements and the steps consumed.
- The `ex-centered-estimates` planting and the integer maximum principle.
- Packet-price conventions used by the stress cone.
- The free detector and the `ex-no-new-null` argument.
- The three-panel chart theorem.
- The other C14 chapters, which belong to reviewers 1, 2 and 4.
- No LaTeX build or rendering.
