# C05 findings (author pass, session ADB991-claude-20261112-0c65)

Severity: **gap** = a substantive premise with no located producer; **interface** =
producer exists but the statement match needs the other side's acknowledgement or a
restatement; **editorial** = notation/wording, no mathematical change.

## Checked and found sound (no change)

The following were verified step by step. Every constant, inequality and rate was
recomputed, and every quantifier order was rechecked.

- `ope-prescription.tex`: `lem:ope-detector-span`, `prop:ope-prescription`. Checked
  `BR=I`, `b_{α,n}B=b_{α,n+1}`, the split `v=Fqv+RBv` and the vanishing `b_{α,m}=0`
  for `m<|α|`.
- `ope-homogeneous.tex`: the Haar averaging domain `U_n` is open (compactness of O(4)).
  Also checked differentiation under the integral without differentiability in `K`,
  the recursion for `K_m`, `P_{mq}=0` for `q<m`, and `lem:ope-homogeneous-projections`
  (all three index cases).
- `ope-phase-prices.tex`: origin placement counts (10/6 constants, ≤2a_f margin
  loss), even-replica limit, full-support argument. Full support is supplied by C03
  `phase-selection.tex` (`ex-spectral-state`). Also checked the residue
  construction for spectators and the engineering-rate depth orderings, including the
  final four-depth choice δ/4, δ/2, 3δ/4, δ against `b≤f≤l≤n`, `f≤q`.
- `ope-filtration.tex`: cone step (`μ(D_La)≤2Y`, `2KE≤Y`, `Y≤2Kμ(Pb)`,
  `3KY≤6K²μ(Pb)≤s_0μ(Pb)`), transverse step, plane cancellation induction with factor
  `(1+ζ_i)ζ_{i+1}L_i^{d-e-1}`, `eq:ope-whole-distance`, `C_N=o(s_N)`, the compact
  normalized-test argument (`b+‖z‖=1`), and `H_kζ_k≤J_k³ζ_0`.
- `ope-grouping.tex`: injectivity of the forest encoding and the induction
  `F(D,Y)≤e^{|Y|γ}`. Also checked the enlarged-hit count `(1+ℓ)bg`, the majorant Γ,
  and the identification of λ.
- `ope-grouping-algebra.tex`: canonical component partition, complete-group property,
  hot ⇒ contains flagged, bijection and vacuum retention.
- `ope-singletons.tex`, `ope-local-projection.tex`: singleton cost `2a/w+2b/w`,
  `4/w = 1/(2w')`, terminal weights `I_v=z/(16x)`, and
  `Q'=a_{m+1}^dQ`.
- `reference-cone.tex`: all four smallness inequalities from `eq:reference-bank`,
  cone propagation, `Y≤(2K+½)εt`, gain `q_ir_i≤r_{i+1}`, terminal `r_k≤2(1+C_k)w`, and
  affordability multiplier `η_iL_i^dq_i≤η_iL_i^{d+1}`.
- `reference-difference.tex`: signed remainder bound
  `r_i(v)≤h_i(y)+(1+2C_i)e_i`, the coefficient bound with the per-label comparison map,
  the top terminal condition, and quota `μ(I_kb)≤2E`.
- `reference-match.tex`: `μ(e_j−I_kb_j)≤1/(16(1+C_k))≤1/4`, `Σ|s_j|≤4E`, singleton
  allowances 2 and 1, the portfolio sum ½+½, and final root `≤ 3S_0/(2w) ≤ 2S_0/w`.
- `ope-cutoff.tex`: regrouping-induction inequalities, rate of `X` is `−τ`, and both
  payment rates (`−τ−15(a−b)/16` and `−(a−b)/16`). Also checked the discrepancy rate
  `τ−(q+1/16)(a−b)`, the opening check, and continuum room/separation.
- `ope-grid.tex`: level selection, rounding bound `2Kh`, scale stability,
  `eq:ope-match-grade`, remainder decomposition, descending interpolation induction
  (base case `w≥N`), and the ε-rates.
- `ope-estimates.tex`: rotated error identity, conjugated comparison via `J_Dh_n`,
  `F_m−P_{mD}h_n`, the coefficient rate and the remainder decomposition.

## Repairs made in this pass

- **R1 (interface, `ope-cutoff.tex`).** The old text said the comparison producing
  `eq:ope-cutoff-discrepancy` "remains to be proved in the construction part". It is
  in fact the C05-internal construction `sec:reference-match`, under a scale-letter
  swap: reference chapters use (opening m, matching k), and the cutoff uses
  (centered k, opened K(k), matching m; corrected in revision 2, see below). An explicit dictionary was added. It was checked
  against Lean `YM.OPE.funding` (Prices/Circuit.lean:64) and `YM.OPE.terminalAfford`
  (Prices/Circuit.lean:40), whose second conjunct is literally
  `eq:reference-match-afford` in the cutoff letters. `𝓜(z;k,m)` was only bounded,
  never defined; it is now defined as the scheduled weight evolution from k to m
  (`march` in the source). The comparison remains conditional on
  `sec:reference-match`'s analytic hypotheses (see F2).
- **R2 (interface, `ope-cutoff.tex`).** New `prop:ope-match-assembly` proves
  `input:ope-match` from the cutoff labels, the final paragraph of
  `sec:ope-phase-prices`, and `eq:ope-whole-distance` / `eq:ope-physical-distance`,
  all on **one** limit label `Q_n`. This addresses refresh item 1: no choice per phase,
  spectator list or low degree, and only the auxiliary approximant `y` is re-extracted.
  The dictionary is `d_input=c`, `|I|=h`, `J_n=J_{m_n}(a_U/a_{m_n})^q`, and low degree
  `e+1`. The letter `m` (matching level) clashes with the low-degree letter of the
  Input, and this is now stated in the text. Lean `whole_origin` and `limit_cap`
  (Columns/SectorCost.lean) use the same `quota` as `PriceAt.quote`, which confirms
  that V bounds the q_k of the filtration chapter.
- **R3 (editorial, `ope-cutoff.tex`).** In `eq:ope-group-weight`, ℓ is the
  connecting-cover bound, called `k` in `sec:ope-grouping`, where ℓ is the occupancy.
  This is now stated. (Revision 2: the first version wrongly called λW_r a product of new mark weights; λW_r is the new weight of the single old mark r, and the product over r∈A is 8W̃_A.)
- **R4 (interface, `ope-cutoff.tex`).** The cover-rate condition
  `(ν_{i+1}+1)ℓ_i≤16√β̂_i` is the form in which C16 `ope-scale-purchases.tex` (O1) is
  used. With `A=101=ν+1` and `H_L=(1+L(B(x)+B(y)+1)²)⁴`, `eq:ope-pair-halo` gives
  `ℓ≤16H_L`. `β̂` is affine in `s` (C16 `common-scale-selection.tex`), so
  `√β̂_i/s_i→0`.
- **R5 (interface, `ope-local-projection.tex`).** `eq:ope-leaf-projection` and the
  singleton transition expansion are produced by C06 `sec:leaf-transfer` with
  `x=Q_e`, `cost(M)=m`, fine cost `2m` and response `Q_em`, multiplier `L^d`. On the
  selected history, C16 `ope-history-service.tex` supplies them with allowance `X_m`.
  They are still conditional on leaf-transfer's localized-expansion, tail, flag and
  smallness inputs.
- **R6 (interface, `ope-filtration.tex`, `ope-grid.tex`).** Precise pointers replace
  "not yet derived" wording: `prop:ope-match-assembly` and C14
  `sec:finite-rank-kernel-transport` (`p_c=A_c`, `p=T`, `eq:finite-rank-exact-kernel`).
- **R7 (editorial, `ope-phase-prices.tex`).** In the final paragraph the spectators
  are the coarse group, so the added rate is `(w_1+εI_0)δ` and not `(w_2+εJ_0)δ`.
  The tie-removal paragraph reused `J_0` for the spectator count; it is now `I_0`.
  `w_1, w_2` were never defined and now are. No conclusion changes, because the term
  is sent to zero with δ.

## Open items

- **F1 (interface; C14 → C05).** `ope-filtration.tex` needs vanishing tested
  correlations for kernel families of **subpower** bare norm. It applies them to
  `b_c(u_c−p_cu_c)`, which need not be bounded. C14 displays
  `eq:finite-rank-silent` only for **bounded** families. Its proof enters its local
  equation input, which is stated for subpower families, and uses boundedness only for
  that entry. So the subpower form follows verbatim, but C14 should state it, or
  acknowledge it in its ledger. Also identify "inverse-calibrated norm" (C14) with
  "bare norm" (C05). Both are `‖K_N^{-1}·‖` of `ex-column-subpower`.
- **F2 (gap: producer not located).** These substantive inputs of C05 chapters have
  no producer identified in this pass. They are not proved in C05 and are stated as
  inputs in the text.
  (a) the zero-coefficient transition `eq:reference-zero-transition`, the calibrated
  primary transitions with `eq:reference-direction`, and the subadditive `h_i` with
  `eq:reference-primary-charge`. C15 `trace-coffer-supplier.tex` consumes them, and
  C15 `trace-weighted-estimates.tex` says the "calibrated reference chart" inputs are
  not proved.
  (b) the terminal reference identification `𝓞(b_j)` in `sec:reference-match`.
  (c) the one-step triangular estimates `eq:ope-triangle-numbers`, the calibrated
  reverse bound `q_i≤ζ_{i+1}L_i^dq_{i+1}` and the schedule `h_i` in `ope-filtration.tex`.
  In Lean these are `hT.leads`, `room`, `column_small` and `ε_small` in
  `YM/OPE/Columns/Cone.lean`.
  (d) the local trial comparison in `ope-filtration.tex`, where known-open-edges
  assigns C13 (`YM.MergeProof.onions` per `ope-evidence.md`).
  (e) the marked descent/regroup representation estimates and the support
  propagation `B_i²≤LB_{m+1}²` in `ope-cutoff.tex`. Their numerics are matched to C16
  (ledger `C16-to-C05-history-grouping`), but the analytic representation is not.
  (f) the activity-dictionary unused-slot property in `ope-singletons.tex`.
  G06 should assign owners. C05 must not close these by assumption.
- **F3 (interface; C05 → C16).** `assembly.tex` restates the OPE requirement
  (`ex-ope-coefficient`, `ex-ope-remainder`) without citing `thm:ope-quantitative`.
  The statements match, with channel fields `E_{ℓ,α}=e_{ℓ,α}` (the real basis of `V_ℓ`),
  phase-independent coefficients, uniform thresholds depending on `D,M,η,c,ε`, and
  "every character or mixed state". C16 should cite the theorem and record that it is
  conditional on `input:ope-raw-estimates`. That input is in turn conditional through
  `ope-grid.tex` and `prop:ope-match-assembly`.
- **F4 (interface; C03 → C05).** The rough separated correlation estimate, i.e. the
  rough rate `xw(p)`, is proved inside C05 (`ope-phase-prices.tex`). The derivative-field
  identities used for interpolation in `ope-grid.tex` ("derivative-field identities of
  the hierarchy") are not cited by label. The likely producer is C03 slab regularity
  (`ex-raw-slot-identity`, which the C03 author ledger in draft PR #69 lists as input I-C01-slot). Not matched
  in this pass.
- **F5 (attribution correction for C03/G06).** The C03 author ledger (draft PR #69, `results/C03/ledger.md`, same author account) lists "I-C05-O4: full
  O(4) covariance of the unselected table with a label action on quotient classes" with
  owner unknown, under a C05 name. C05 does **not** produce this. `ope-homogeneous.tex`
  *assumes* a continuous O(4) action `R_n` and conjugation `J_n` on each `E_n`,
  commuting with inclusions ("as supplied by the field structure"). C05 is a second
  consumer of the same missing producer. G06 should assign it.
- **F6 (editorial, not changed).** The packet notation `F_m` in `ope-homogeneous.tex`
  and `F` (coefficient space) in `ope-filtration.tex`, and `K` (Haar variable,
  projection `K_m`, constant `K`, residue modulus), are reused across C05 chapters.
  They are locally unambiguous. Leave to the G05 notation contract.
- **F7 (editorial, not changed).** `ope-filtration.tex` cites the C14 projection with
  a different letter (`A_c`) than its own (`p_c`). This is now bridged in prose.
  Unifying it is a G05 matter.

## Revision 2: response to the independent review (PR #79)

Session `ADB991-claude-20261112-3b89`, claim
https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6834951826.
Review: `results/C05/review/{mathematics,lean}.md` on PR #79 (schmittj, at head
`8b15d44`). Every finding was re-read against the chapter text; the Lean quotations in
`lean.md` L1, L2, L5, L8 were spot-checked against the source (`YM/Euclid/Stress.lean`
`Oriented`/`Laws`, `YM/Euclid/Table.lean` `RealSpin`/`Homogeneous`,
`YM/RG/Masks.lean` `Healthy`/`flags`/`supBounds`, `YM/OPE/Grouping/Family.lean`
`Permutes`/`CopyFamily`). Accepted in full unless stated.

| Finding | Change |
| --- | --- |
| M1 / L1 | `ope-homogeneous.tex`: new standing assumption `eq:ope-mixed-covariance` (rotation covariance, translation invariance, reality of the mixed correlations), marked as an input not implied by the action laws. `ope-estimates.tex`: cited at the rotation step, the conjugated step and the translation step; `thm:ope-quantitative` now states it. The review's counterexample shows the hypothesis is necessary. Producer still unknown (edge `C03-to-C05-O4`). |
| M2 / L3 | `handoff.md`: upper rate `τ` for `‖Q_n‖`, via `J_nV_n`. |
| M3 | `ope-cutoff.tex`: λW_r is the new weight of one old mark; product over A is `8W̃_A`. |
| M4 / L7 | `ope-phase-prices.tex`: the unreflected conjugation identity `eq:episode-conjugate` is cited as an input (conditional producer `ex-ordinary-reflection`); listed in `prop:ope-match-assembly`; ledger edge reopened. |
| M5 / L7 | `ope-phase-prices.tex`: continuity in every character cited from `ex-phase-caps` with its conditions; listed in `prop:ope-match-assembly`. |
| M6 / L2 | `reference-match.tex`: centred depth `J ≤ m` introduced; room condition `2(a_kR+T_k)<a_J` stated and `eq:actual-grid-factor` cited; `𝒱_m = t_m`, `M` centred J-cells, `S_0=exp((a_J/a_m)^4t_m+5)` displayed. |
| L2 / L6 | `ope-cutoff.tex`: three-depth dictionary (centred k, opened K(k), matching m); returned label `Q_{N,p}=T_{N,p}b` stated; `correspondence.md` and `findings.md` R1 corrected. |
| M7 / L5 | `ope-grouping-algebra.tex`: covariance hypotheses (a)–(d) stated, matching `Permutes`/`CopyFamily`; conclusion limited to coefficients in the copied family. |
| M8 / L8 | `ope-filtration.tex`: local trial defined with fixed-stencil measurable gauge-invariant locality, literal translation, eventual continuity, a sup price and a derivative price on healthy configurations. The use at the literal observable is now explicitly conditional on the calibrated local-section bounds giving these properties. |
| M9 / L9 | `ope-grid.tex`: `ex-raw-slot-identity` with phase compatibility named as input; slab regularity is a fellow consumer. |
| M11 | `ope-estimates.tex`: threshold dependence stated (labels, D, M, η, c, ε, channel; not phase or positions). |
| M12 / L9 | `ope-local-projection.tex`: `m ≥ t_d`, every `N_0>m`, every period. |
| M13 / L10 | `ope-local-projection.tex`: `rem(Q) ≤ B` defined as `R+κ_m^{-1}F ≤ B` with one fixed `κ_m`. |
| M14 / L10 | `ope-grouping.tex`: connected covering number named; `a=ν` and `ν ≥ 0` stated. Source support exponents are ≥ 100 in the purchases (e.g. `YM/Extension/UV/Canon/Bourse.lean` line 57), not re-derived for every call site. |
| M15 | `ledger.md` row for the reference cone: terminal hypothesis and affordability conditions added. |
| M16 | `ope-phase-prices.tex`: mesh factor `h` in the rounding. |
| L11 | Author records: relative paths `../../../`, `YM.Work.G09.answer`/`cone_cost`/`cost_finest`. The errors in the canonical `ope-evidence.md` (`Reader.liftOne_affinity` is private; `ripe` namespace; missing `Oriented`/`RealSpin.real` note) and `local-projection-evidence.md` (non-existent `MergeProof/Blush` etc. paths; files are under `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/`) are in read-only canonical records and are left to their owner. |
| M10 / L4 | Not C05: the C16 sentence in `ope-history-service.tex` lines 150–155 should say "for each individual marker (cell, slot)". Passed to the C16 owner (#57). |
| Review remark on `prop:ope-match-assembly` | It proves the Input for grids on the schedule meshes `a_{j_n}`; this is how `ope-grid` uses it. Not changed. |

No displayed estimate, exponent or rate changed in this revision. Labels added:
`eq:ope-mixed-covariance`. No label removed or renamed.
