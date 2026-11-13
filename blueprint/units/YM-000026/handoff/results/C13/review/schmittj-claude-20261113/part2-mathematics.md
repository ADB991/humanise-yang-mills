# C13 independent review, part 2 (reader chapters): mathematics

Reviewer: Claude (Opus 5.5), session `schmittj-claude-c13-review-20261113`, reviewer 2 of 3. Worktree `/home/jo314/ym-wt/c13-review` at `be0e87d` (contains PR #103, author commit `bddbedc`). Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Not an approval; no review fingerprint was changed.

Scope: `manuscript/existence/actual-reader-small-window-bridge.tex` (changed by PR #103, reviewed first and most thoroughly), `actual-reader-tree-covariance.tex`, `actual-reader-short-covariance.tex`, `actual-reader-guarded-curvature.tex`, `actual-reader-dawn-selection.tex`, `actual-covariance-fourier-window.tex`, `actual-covariance-transport.tex`. All seven files match the coordinator's hash list (see `part2-validation.md`).

Summary: I found no ERROR in these seven chapters. Every displayed identity and inequality that I re-derived holds. The PR #103 edit to the small-window chapter is mathematically correct. It also matches the source: `Venue.aperture` and `Lift.focused` take one bound `t` with `‖v‖ ≤ t`. The conclusions do not involve `t` and are monotone in it, so fixing one admissible `t` for each `x` is equivalent to the source hypothesis `‖v‖ ≤ Rχ(x)`. The main remaining issue is one statement-level GAP. The small-window proposition fixes the patch, tube, forest, tag and configuration, and it does not say that its large-`x` threshold is independent of these data. Its consumers need that uniformity, and the proof and the Lean source supply it. There is a second minor GAP in the dawn chapter, a third in the expository derivation of one row bound, and several inaccuracies and nits.

## Findings (by severity)

### F1. GAP: the uniformity of the small-window threshold is not stated (manuscript; partly touched by PR #103)

File/lines: `actual-reader-small-window-bridge.tex` 68–69 and 103–104. Quoted: "Fix one patch, tube, forest, tag, posed configuration and history over the entire panel." and "Then, for all sufficiently large $x$, uniformly over these admissible $t$, the period and this same history,".

Reasoning (verified): As written, the threshold may depend on the fixed tube, forest, tag, store, centre, posed configuration and direction. Only the period and `t` are stated to be uniform, and "this same history" is ambiguous. The consumers need the threshold to be independent of those data. `actual-reader-local-gaussian-prices.tex` (lines 48–53, then "constants … independent of the period, forest and tag") and `actual-reader-dawn-selection.tex` 84–86 ("all the estimates hold for every admissible coupling pair, period, forest and tag") both rely on this. So does `StrongScope`, which `common-tuple.md` records as "uniform … for every matching store, forest, tag and sector on the fixed funded patch". The proof does supply this uniformity. Every constant (`A_0, M_0, N_0, E_0, s, X, A_1, λ, Λ, η, δ`) is a source constant depending only on the gauge, patch, branch and Teller data. The Lean statement `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture` has the shape `∀ᶠ x in atTop, ∀ {c f} S T, … ∀ A o, … ∀ V, … ∀ Q, … ∀ F k q d g Y, … ∀ i, …`. Its threshold depends only on `G, P, Pt, hp, r, R`. PR #103 added "uniformly over these admissible t" in exactly this sentence but left the remaining quantifiers unstated. The ledger flags this as an item for independent review (ledger.md "Small-window radius quantifier", last two sentences).

Status: pre-existing; the PR edit improves it but does not close it. Requested change: replace the sentence with "There is $x_0$, depending only on the gauge, patch, branch/Teller data and $R$, such that for all $x\ge x_0$, all periods and step data, every funded tube, store, centre $o$, posed configuration, direction $v$, forest, tag, frozen input and admissible $t$ satisfying the hypotheses, …". Add "for arbitrary frozen-link inputs" to the mean statement. In Lean, `aperture` is `∀ q d Y`, and the consumer at `actual-reader-local-gaussian-prices.tex` 54–57 relies on this.

### F2. GAP (minor): the `x^{-1/8}` short-row prices used in the dawn chapter are not proved where they are cited (manuscript; pre-existing)

File/lines: `actual-reader-dawn-selection.tex` 45–46 and 54–58. Quoted: "The common covariance-cover and transport estimates supply both short-row errors at most $x^{-1/8}$." This cites Section `sec:actual-reader-short-covariance`. That section (lines 339–341 and 355–359) says: "This section proves the row and covariance estimate, but it does not derive either price from the scale schedule."

Reasoning (verified): Neither chapter proves that the two cheques are eventually at most `x^{-1/8}`. These are the movement payment `m_2 ψ_budget(M_in) L^{-2} e^{-s h_x}` and the turn payment `|C| A e^{-t h_x}`. The proof is elementary. Here `h_x = ⌊⌈(log x)^2⌉/10000⌋ ≥ (log x)^2/10000 - 1`, so each cheque is `O(exp(-c(log x)^2)) = o(x^{-N})` for every `N`. The constants `s`, `M_in`, `t`, `A` are fixed before `x`, and `(t, A)` is uniform over beds in the strip/floor class by `Current.onePlateau`. Lean does exactly this. `YM.PhysicalNext.InteractingRank.herald` obtains `Paying … (x^(-(1/8)))` from `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.currency` ("∀ᶠ x, cheque β s M x ≤ x^(-ε)"), using the `(u, A)` from `summon`. The dawn text says the short-row prices are supplied by the short-covariance chapter, but that chapter explicitly disclaims them.

Requested change: add the two-line derivation in the dawn chapter, or in a remark of the short-covariance chapter, and cite it at line 45. The bound is uniform in the period and in beds of the fixed class.

### F3. GAP (minor, expository): the second factor of `t` in the base-row difference is not derived (manuscript; pre-existing)

File/lines: `actual-reader-small-window-bridge.tex` 149–161. Quoted: "The local chart bounds each changed factor by the field size times its path length; summing the retained lengths gives $(1+\operatorname{till}(x))t$. The omitted paths contribute at most $e^{-\tau\operatorname{till}(x)}$. Thus $|B_r(V)-F_r(v)|\le A t\,\operatorname{widen}_x(t)$."

Reasoning: The stated per-factor bound (field size × path length) gives a first-order quantity `(1+till)t`. The conclusion `A t·widen_x(t) = A t((1+till)t + e^{-η till})` is second order on retained paths and first order on omitted paths. The text does not say where the extra factor `t` comes from. It must come from the second-order Taylor remainder of the transport factors relative to their linearisation (`F_r(v)` is the linear first variation), or from an `O(t)` prefactor of each row. The telescoping identity alone does not provide it. The bound itself is correct as a source statement: `YM.AnalyticBridge.LocalGaussianLaws.Lift.base_summary` gives `‖Rows.base … - firstTerm … ‖ ≤ C*t*widen (till x) t τ` under `‖v‖ ≤ t ≤ δ`, clearance, flags and `AgreeNear`. Only the prose derivation is incomplete.

Requested change: state that `F_j - H_j = O(t^2)` per factor, or that the row has an overall `O(t)` factor, as appropriate. Alternatively, cite the source estimate as an input instead of presenting a derivation.

### F4. INACCURACY (inter-chapter edge): column-conclusion index range (manuscript; pre-existing)

File/lines: `actual-reader-small-window-bridge.tex` 82–84 ("the column conclusion is for every $j$ in that same selected panel"). The consumer `actual-reader-local-gaussian-prices.tex` 49–53 reads it as "for every interior column $j$ and every actual active row $i$".

Reasoning (verified): The source conclusion is for all active `j`, i.e. `∀ j : In x A F, |M j i - K (s j) (s i)| ≤ x^(-1/4)` with `M = panoramic = pane (sectorW …) (Rows.gram …) 0`. Off the panel both padded inverses vanish, by `pane_absent` and the membership equivalence `staff_W`. So the consumer's reading is correct, but the producer's English is weaker than what the consumer uses. The roles of `i` and `j` are also swapped between the two chapters.

Requested change: state the column bound for the padded window inverses and all active rows, noting that both sides vanish off the panel. Align the index names with the consumer.

### F5. INACCURACY: the "shifted centre" pose-margin hypothesis is unused (manuscript; pre-existing)

File/lines: `actual-reader-small-window-bridge.tex` 78–80. Quoted: "Every shifted center used in the proof also satisfies the same pose margin: its distance from the fixed pose center plus the pose's wall allowance is at most the original width $W$."

Reasoning: The proof works throughout at the single cleared centre `o`, and no shifted centre occurs. In Lean, recentring is done by `Venue.relocate` from tier radius `vista r x = (r+1)B` down to radius `B`, not by `Pose.center`. The manuscript proposition is the tier-0 special case of `Venue.aperture` (target within `B/4`). The hypothesis is harmless because it only weakens the statement, but it suggests a mechanism the proof does not use.

Requested change: delete the sentence, or say that recentring from a wider pose to radius `B` is done before the proposition is applied.

### F6. INACCURACY (guarded chapter, several undefined or misdirected scalar facts) (manuscript; pre-existing)

File/lines: `actual-reader-guarded-curvature.tex`.
(a) 77–82 and 163: `C_0` is used ("$4C_0\operatorname{clearance}(x)\le R$", "$\operatorname{docCost}(x)\le C_0R$") but never defined.
(b) 85, 119–126: `stride_4(x)` is never defined. In source it is `YM.PhysicalNext.PhysicalGuard7f546.Curved.stride 4 x = (1+radiusB x)^4`. With this definition, the claims `B = O(stride_4^{1/2})`, `B^2 = O(stride_4)` and `walls(y) ≤ stride_4(x)` hold.
(c) 470–471: "the scalar coupling bound gives $v\ge\delta_0\operatorname{hot}(y)$". This needs a lower bound on `g^{-1}`, but the only coupling bound displayed is `g^{-1} ≤ 2√x` (line 83). The needed bound holds because `coupling β = (√β)⁻¹` (`YM.Next.SectorChange.coupling`), so `g^{-1} = √β ≥ √(x/2)`. The chapter never states that definition.
(d) 305–306: "$|Q_{u,a}|\le P_0\tau$ since the nonlinear parent curvature coordinates have modulus at most $\tau$". This uses health of the coarse field at threshold `τ` together with a curvature ≤ chord comparison. Neither is stated in this lemma's hypotheses; line 191 says only "The field is healthy on that room".
(e) 146: Lemma `lem:readerB-enlightened` quantifies over `β` only, but item 4 includes the coupling error, which also needs the `β'` band.

All the numerical conclusions are correct once these facts are supplied. I checked the arithmetic: `x^{-7/8}/R = x^{-1/2}`, `t/R ≤ 2x^{-1/16}`, `1/2048 + 4/4096 + 1/64 = 35/2048 < 1/32`, the `1+2+3 = 6` defect count, `(c_G/4 + A_arc)(2R)^2 ≤ A_* R^2` with `A_* ≥ c_G + 4A_arc`, the Chernoff bound with `s = v/U` and `Var ≤ U`, `1/(2n_GU) - ϱ_y ≥ 3/(8n_GU)`, and `2q^{3/2} - 17q → ∞`.

Requested change: define `C_0`, `stride_4` and `coupling`, state the `g^{-1}` lower bound, add health at `τ` (with the curvature/chord comparison) to the hypotheses of `lem:readerB-pointing`, and add the `β'` band to the lemma.

### F7. NIT: the role of `δ` in the small-window hypotheses (manuscript; pre-existing; adjacent to the PR edit)

File/lines: `actual-reader-small-window-bridge.tex` 71–75. Quoted: "for a source threshold $\delta>0$, the coarse side satisfies $c\ge100(1+B)$". `δ` has nothing to do with the coarse side. It is the small-field threshold of `Lift.focused` and `Remote.chip_repair` (in `aperture` it is `min δ' δ`, satisfied eventually because `R·clearanceFare x → 0`). The PR edit's `0 ≤ t ≤ min{δ, Rχ(x)}` is correct, and line 92's remark makes `t ≤ δ` automatic for large `x`. Requested change: introduce `δ` in its own clause.

### F8. NIT: the mean bound absorbs a factor (manuscript; pre-existing)

File/lines: `actual-reader-small-window-bridge.tex` 206–213. The source `Lift.focused` bound is `N*(D*M*(A*t*widen)) + M*(E*exp(-s*R))*(X*t)`. The manuscript's second term `E_0 e^{-sB} X t` has silently absorbed the column-sum factor `M` into `E_0`. This is harmless (`E_0 := ME`) but should be said.

### F9. NIT: "admissible coarse period" is undefined (short-covariance; pre-existing)

File/lines: `actual-reader-short-covariance.tex` 186–187, 287–288, 295. The exact identity at period `n` is stated "for every admissible coarse period $n\ge3$". In the source (`Current.onePlateau`), the identity needs `Larger S` (branches, `100·macroR ≤ f`, `1 < c`) and `3 ≤ c`, plus the coarse-bed `Floor` and `Towers.Diagonal` hypotheses. The chapter should say this explicitly.

The folding lemma's hypothesis "If the periodizations commute with pullback …" (lines 39–41) is actually proved inside the proof (lines 56–58), so it can be dropped. The positivity of `A_F` at all periods comes from the folded gap. The tree chapter's own coercivity needs fine side `≥ 100R`, which `Larger` supplies in the source.

### F10. NIT: notation clash (transport; pre-existing)

File/lines: `actual-covariance-transport.tex` 20, 86, 102–107, 139. The letter `a` denotes both the scales `a_i` (`L_i = a_i/a_{i+1}`, `S = a_\ell/a_k`) and the exponent `a = λ/4`, which also appears in `P = H^a`. The letter `B` denotes both the low covariance and, at line 73, the reciprocal pulse. Requested change: rename the exponent and the pulse.

## What is correct (verified by re-derivation)

Small-window (all lines). I checked:
- All five geometric inequalities for `B ≥ 200`: `(189B-2460)/20 > 0`, `9(B+80)/20 ≤ B` (B ≥ 66), `(41B+200)/50 ≤ B`, `0.32B+4 ≤ B/2`, `0.39B+8 ≤ B`. Each is correct.
- The definitions of `χ` and `B_R`, with `(2b+1)^5 ≤ 3^5 b^5`.
- The normal-residual identities `μ-a = E^*a - 𝖯^*(Aa+ℓ)`, `Aa+ℓ = M^*r(a) + Π_0a` and the row-Gram identity (each uses symmetry of `A` or `Q`).
- The exponent bookkeeping: `Y ≲ b^{15}`, `u^2 = x^{-15/16}`, total `x^{-7/8}`.
- The product splitting `a_{rj}a_{rk} - b_{rj}b_{rk}` and the resolvent identity with entry bound `n_p^2 λ^{-1} δ Λ^{-1}`.
- The panel charge: `m_x ≲ b^{16}ϑ`, `C_x ≲ b^{24}ϑ`, `x^{1/8}·x^{-3/8} = x^{-1/4}`.
- The multiplier transfer `m_x(A,Rχ) ≤ m_x(RA,χ)` for `R ≥ 1`.
- That the onto/injective panel bijection does not identify entries.

The PR #103 quantifier edit is correct, as explained in the summary.

Tree covariance (all lines). I checked:
- `A𝒫 = A` and `D𝒫 = D`.
- The slice gap `min(a,κ)/(1+b_1+b_2)` (valid because `max(b_1,b_2) ≤ 1+b_1+b_2`).
- `DXA = D`, the existence and uniqueness of `P_M = qZ` and its positive semidefiniteness.
- The straightened-column identities `QW = Q̄A_0`, `KW = Q^⊤K'` (using `d_c^⊤K' = 0`), `AW = κQ^⊤`, `DW = JD'`.
- The cross-covariance `D'QZ = P_cJ^⊤` and the final identity `(DI_F)A_F^{-1}(DI_F)^⊤ = P_f - JP_cJ^⊤`.
- The flat channel bilinear form.

Short covariance. I checked:
- The folding lemma (fiber count, reindexing by residues).
- The factorial-period diagonal extraction and its dominated convergence.
- The identification of the limit inverse on every period, through divisibility and uniqueness of the finite linear solve.
- Submultiplicativity of weighted row norms and the displacement-reversed symmetrisation.
- The tail bound `A e^{-t h_x}` per entry.
- Vanishing beyond `H_x` modulo the period, and the two-case `Q^short` comparison.
- `Ψ` strip `m_2^2 M_f M_T M_c/L^2`.

Guarded curvature: everything except the items listed in F6, including the two-factor identity `κ(UV) - κ(U) - κ(V) = Π((M(U)-I)(M(V)-I))` and the union bound without independence.

Dawn. I checked:
- `x^{-v} ≤ ε_c(t)` on `[t/2,t]`, `2ε_{f+1} ≤ ε_f`, `ε_{2f} = ε_f^2`.
- The order of choices (`U`, threshold `t`, then `p_x`, then all `β, β'`), which matches `herald`.
- The geometry `11b_{r(x)}+1 ≤ 44b_x+1 ≤ b_x^2`, `100(1+4b_x) ≤ 2(ww_x+1)`, and `(d+2)w_x+10 ≤ ww_x`.

Fourier window. I checked:
- Exterior coercivity and `|q| ≥ c|p|` on the cube.
- The symbol orders (`F = |p|^2 I + E`, `E` of order 3; `P` of order 0; `P - P_0` of order 1).
- `XF^{-1}X^* = XDX^*` via `XB = 0`, `BX^* = 0`, `RB = BR = 0`.
- The partition of unity and support of `h`, and the exact alias sum including `P(0) = 0`.
- The remainder bounds near and away from zero.
- The integration-by-parts decay `|x|^{-u-5}` (inner shell `r^{u+5}`, cutoff terms `O(r^{-1})`, bulk `∫_r^1 t^{-2}`).
- The quadrature error `(1+|x|)/n`.
- The Gaussian-regularised potential `(1 - e^{-π^2|x|^2/t})/(4π^2|x|^2)` (substitution `u = π^2|x|^2/s`).

Transport. I checked:
- The finite division identities and the width-halving cost `2/σ`.
- `d_fΨ = Cd_c`.
- The sign-test row bound `R^m S^{-j-2}2^j`, the choice of `m` with `R^m ≤ RH^{a/4} ≤ H^{a/2}`, and `S ≥ H^{b+2}`.
- The low moments `P^2` and `P^3`, the weights `r^{j+2}H^4 ≤ S^{j+2}`, and the errors `H^{-4+λ/2} ≤ H^{-3}` and `H^{-4+3λ/4}`.
- The singular error `H^{1-b} ≤ H^{-4}/2` for `b ≥ 6`, using the homogeneity of degree `-(a+b+4)`.
- The normal-ordered diagonal `-B`, and the top-order bound `H^{λ/8} + H^{-4+3λ/4} ≤ H^{λ/4}`.

## Per-chapter table

| Chapter | Checked line by line | Verdict | Open inputs from other packages / chapters |
| --- | --- | --- | --- |
| actual-reader-small-window-bridge (PR #103) | all 310 lines; PR diff; all arithmetic | Correct; PR edit correct. GAP F1 (threshold uniformity not stated), minor GAP F3, INACCURACY F4/F5, NITs F7/F8 | canonical `sec:local-mean`, `sec:local-covariance` (inverse-window, gaps λ, Λ), source chart/path/carry bounds; same pose and history from the reader construction |
| actual-reader-tree-covariance | all 245 lines | Correct, no findings | `sec:sector-gram` tree comparison (b₁, b₂), stationarity identities and tower intertwiner of the selected beds (C07/C12 bed selection on the history) |
| actual-reader-short-covariance | all 359 lines | Correct; NIT F9; its price disclaimer is the source of F2 | `sec:local-covariance` weighted resolvent, `sec:path-attachment-producer` gap, moving-tower `L^{-2}` receipt, selected schedule (C12) |
| actual-reader-guarded-curvature | all 533 lines | Correct conditional on F6 clarifications | same-pose reader estimates (`sec:actual-reader-local-gaussian-prices`), paid chart/ticket/transport receipts, pose from the dawn chapter |
| actual-reader-dawn-selection | all 250 lines | Correct; minor GAP F2 | plateau, coupling band and room purchases on the selected history (C12); joint reader model (`sec:ex-lattice-all-arity-reader-gaussian-model`) |
| actual-covariance-fourier-window | all 247 lines | Correct, no findings | component/positive-row constructions (α, η, Ω, H(0)=I); transport identity `RDX^* = X^*`; clearance at the chosen level |
| actual-covariance-transport | all 205 lines | Correct; NIT F10 | `thm:ex-lattice-wire-tower-strip`; principal-rail and nonprincipal denominator bounds; purchased plateau of exactly `m` steps; identification of the atlas with the actual reader law (consumed by `sec:allarity-coordinate-calibration`) |

## What I did not check

- I did not review `actual-reader-local-gaussian-prices.tex`, the consumer of the small-window chapter, beyond its lines 25–80 used for F1 and F4.
- I did not check the C07, C12 and C09–C11 producer texts themselves, i.e. bed selection, plateau and coupling purchases, or the merged C07 row-price proposition.
- I did not check C14/C05/C03 consumers.
- I did not check the literature, since none is cited in these chapters.
- I did not check the canonical chapters `sec:local-mean`, `sec:local-covariance`, `sec:sector-gram`, `sec:path-attachment-producer` or `thm:ex-lattice-wire-tower-strip` beyond the statements quoted.
- I did not check the precise definitions of `hot`, `walls` (Next.Rank) or `phase` in Lean beyond `phase = Hat*hot`.
- No LaTeX build was run.
