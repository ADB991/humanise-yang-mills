# C05 input/output ledger (author side)

Session `ADB991-claude-20261112-0c65`, source pin `3456e5e`, start `01ef22c`.
Status vocabulary: **matched** = the author has checked that the producer's
displayed statement supplies the consumer's exact statement and common data.
That is still one-sided, and the producer and an independent reviewer must
acknowledge it. **interface** = a producer exists but a restatement or
acknowledgement is needed. **open** = no producer located, or not compared.
**internal** = a C05 output used by another C05 chapter, checked here.

Common data for every edge unless stated otherwise: one selected history (C16
`sec:ope-history-service`, support exponent 100), one ordered cutoff filter (period,
then mesh), field levels `E_n` with injective physical inclusions, and the fixed
prescription `(u_α, b_α)` of `prop:ope-prescription`.

## Outputs of C05

| Output | Statement (hypotheses → conclusion) | Consumers |
| --- | --- | --- |
| `prop:ope-prescription` | Separating exterior tests on finite-dim `E_n` with compatible inclusions → one system `u_α, b_α`, biorthogonal and reconstructing at every degree, with `b_{α,m}=0` for `m<|α|` | `ope-homogeneous`, `ope-grid`, `ope-estimates` (internal) |
| `lem:ope-homogeneous-projections`, `eq:ope-final-coefficients` | Continuous O(4) action and conjugation commuting with inclusions → homogeneous complements `V_m`, covariant real coefficient fields `c^{m,α}_v`, packet identity | `ope-estimates` (internal); C16 `assembly.tex` (via F3) |
| `eq:ope-ground-price`, final paragraph of `sec:ope-phase-prices` | Centered prices + geometry → ground-algebra norm bound, in every character, and complete-discrepancy rate γ | `prop:ope-match-assembly` (internal) |
| `eq:ope-physical-distance`, `eq:ope-whole-distance`, `ex-column-subpower` | One-step triangular estimates and local comparison/projection inputs → physical low-degree distance and whole-label bound, with subpower bare norms | `prop:ope-match-assembly` (internal); C14 `finite-rank-kernel-transport`, `actual-equation-kernel-relay`, `actual-insertion-derivative-relay`; C02 `centered-construction` (all cite `ex-column-subpower`) |
| `eq:ope-forest-price`, `eq:ope-group-majorant` | Local hit bound with `(2M+1)^4γ≤v` → connected-union price `e^γ−1` | C06 `local-transfer`, C06 `cluster-expansion`, C08 `soft-log-fusion`, C11 `wilson-startup-construction`, C16 `ope-history-service` |
| `sec:ope-grouping-algebra` | Exact regrouping bijection, vacuum retained, covariance | C16 `ope-history-service` |
| `sec:ope-singletons`, `eq:ope-single-coin` | Hit bounds + dictionary property → singleton pair cost `2a/w+2b/w`, linear-density formula | C06 `local-transfer` |
| `sec:ope-local-projection`, `eq:ope-terminal-projection-price` | `eq:ope-leaf-projection` + transport hypotheses → coarse field with bounds `a_{m+1}^d 4x/z` | `ope-cutoff` (internal); C06 `leaf-transfer`; C08 `projection-payment-producer`; C16 `ope-history-service` |
| `eq:reference-gain`, `eq:reference-affordable` | `v_l=0`, direction/remainder step, bank → gain `e^{-(s_k-s_i)/8}` | `reference-difference`, `reference-match` (internal); C15 `trace-coffer-supplier`, `trace-price-recurrence` |
| `eq:reference-produced-difference` | Signed transition inputs → signed difference path, quota `2E` | `reference-match` (internal); C15 `trace-coffer-supplier` |
| `sec:reference-match` | Above + marked transport + complete-moment estimate → label `b`, quota `2E`, centered root `2S_0/w` | `ope-cutoff` (internal; R1) |
| `prop:ope-match-assembly` (new) | All listed inputs → `input:ope-match` with one `Q_n` | `ope-grid` (internal) |
| `thm:ope-quantitative` | `input:ope-raw-estimates` → public separated OPE coefficient and remainder bounds | C16 `assembly.tex` `ex-ope-coefficient`, `ex-ope-remainder` (F3) |

## Internal chain (checked in this pass)

`sec:reference-cone` → `sec:reference-difference` → `sec:reference-match` →
`eq:ope-cutoff-discrepancy` (R1 dictionary) → `prop:ope-match-assembly` (+
`sec:ope-phase-prices`, `sec:ope-filtration`) → `input:ope-match` → `ope-grid`
(reading, remainder, interpolation; also needs F4) → `input:ope-raw-estimates` →
`ope-estimates` → `thm:ope-quantitative`. Each arrow is checked except where
another edge below is named. The chain is conditional on all incoming edges.

## Incoming edges

| Edge ID | Producer → C05 consumer | Exact statement needed | Status |
| --- | --- | --- | --- |
| C03-to-C05-field-levels | C03 `limits.tex` / `phase-fields.tex` → `ope-prescription` | Finite-dim `E_n`, injective inclusions `ι_{mn}`, physical quotient defined by vanishing of all separated mixed correlations (`eq:ope-detector-separation`), separated correlations smooth, permutation and translation invariant, compatible with inclusions | open (same quotient as C03-to-C04 E4) |
| C03-to-C05-O4 | **producer unknown** → `ope-homogeneous` | Continuous O(4) action `R_n` and antilinear involution `J_n` on `E_n`, commuting with inclusions and each other; correlations covariant | open (F5; also the C03 ledger item I-C05-O4) |
| C03-to-C05-phases | C03 `phases.tex` `ex-cluster-train`, `phase-selection.tex` `ex-spectral-state` → `ope-phase-prices` | Separated-cluster limit gives `⟨Ω,(A^*A)^mΩ⟩`; commutative ground algebra `≅C(Ξ)`; μ of full support | matched at statement level (labels read); C03/C04 acknowledgement pending (known-open-edges `C03-C04-to-C05-phases`) |
| C02-to-C05-centered | C02 `centered-estimates.tex` (`ex-centered-estimates`), `centered-construction.tex` (`ex-centered-sail`) → `ope-phase-prices`, `reference-match` | Planted inequality; change-of-cell root estimate; centered price `(1+C)a_k^{-d-ε}+1`, uniform in period/labels after the reference depth; complete-moment bound `exp(|Λ_m|𝒱_m+5M)` with singleton allowances 2, 1 | open (not compared in this pass) |
| C06-to-C05-leaf-projection | C06 `leaf-transfer.tex` `eq:leaf-projection-allowance` → `eq:ope-leaf-projection` | `dens(Q)=L^d𝒯 dens(M)`, coefficient and remainder `≤x cost(M)`; fine expansion `2cost`, response `x cost`, multiplier `L^d` | matched (R5), with `x=Q_e`, `cost=m`; conditional on C06's localized-expansion, tail, flag and smallness inputs |
| C06-to-C05-local-transfer | C06 `local-transfer.tex` `sec:local-transfer` → `ope-local-projection`, `reference-difference`, `reference-match` | One-scale marked transport lemma, singleton transition expansion and identification, integrability | open (not compared) |
| C16-to-C05-history-grouping | C16 `ope-history-service.tex` `eq:ope-history-cluster-price`, `eq:ope-history-smallness` → `eq:ope-group-majorant`, final paragraph of `sec:ope-grouping` | `Γ=2(1+ℓ)η(ℓTe^σ+A)+(1+ℓ)B` with `(2M+1)^4Γ≤½`, `e^Γ−1≤1` | matched: `ℓ↔N`, `η↔δ_m`, `T=A=1`, `σ=100+½`, `B↔χ_m`, `M↔B_m`; projection allowance `𝓑_m↔X_m` |
| C16-to-C05-cover-rate | C16 `ope-scale-purchases.tex` (O1); `common-scale-selection.tex` → `ope-cutoff` subpower paragraph | `(ν+1)ℓ_i≤16√β̂_i` and `√β̂_i/s_i→0` | matched (R4): `ℓ≤16H_L`, `A=101`; β̂ affine in s. Identification of (O1)'s `x` with `β̂_i` at this transition needs C16 acknowledgement |
| C16-to-C05-schedule | C16 / C02 schedule → `ope-cutoff`, `ope-grid`, `ope-filtration`, `reference-*` | Gentle mesh `log L_k=o(s_k)`; subpower `B_k`, `δ_k`, `𝓑_m`, `ϑ_q`; `u^4B_{K(k)}≤εs_{K(k)}`; `𝓜` bound; `log ζ_{i+1}≤h_i^{-2}log L_i`; bank inequalities `eq:reference-bank`; `C_mθ_m≤1` | open (not compared item by item) |
| C14-to-C05-null-projections | C14 `finite-rank-kernel-transport.tex` → `ope-filtration` `eq:ope-test-kernel`, vanishing-test input | `p_c→p` with `ker p=⋂ker f_θ`; kernel families of **subpower** bare norm have vanishing tests | interface (F1): `p_c=A_c`, `p=T`; C14 displays the bounded form only |
| C13-to-C05-local-trials | C13 (per known-open-edges; source `YM.MergeProof.onions`) → `ope-filtration` | Degree-e labels `u_c` with subpower bare norm whose centered price difference from the local trial tends to 0, at purchased cutoff-dependent derivative orders and thresholds, same filter | open (F2d) |
| ?-to-C05-triangular-columns | not located → `ope-filtration` | `eq:ope-triangle-numbers`, `μ(b−BD_La)≤εμ(a)`, calibrated `q_i≤ζ_{i+1}L_i^dq_{i+1}`, `log ζ` schedule | open (F2c) |
| ?-to-C05-reference-transitions | not located (C15 also consumes) → `reference-difference`, `reference-match` | `eq:reference-zero-transition`, primary transitions with `eq:reference-direction`, subadditive `h_i` with `eq:reference-primary-charge`, terminal identification `𝒪(b)` | open (F2a, F2b) |
| ?-to-C05-marked-representation | partly C06/C08 (`cluster-expansion`, `projection-payment-producer`); not matched → `ope-cutoff`, `ope-singletons` | Marked descent `W↦W/L^4`, regroup representation with `eq:ope-group-weight`, support propagation `B_i^2≤LB_{m+1}^2`, unused-slot dictionary property, background validity | open (F2e, F2f) |
| C03-to-C05-derivative-identities | likely C03 slab regularity → `ope-grid` interpolation | `∂_{i,μ}h_n(p,X)=h_n(p',X)` eventually, along scale-x sequences | open (F4) |

## Outgoing edge requiring the consumer's action

| Edge ID | C05 producer → consumer | Note |
| --- | --- | --- |
| C05-to-C16-ope-endpoint | `thm:ope-quantitative` → C16 `assembly.tex` `ex-ope-coefficient`, `ex-ope-remainder` | Statements match (F3). The consumer should cite the theorem and carry its conditional status |
| C05-to-C14-column-subpower | `ex-column-subpower`, `eq:ope-bounded-bare` → C14 | Supplies "bounded ⇒ subpower inverse-calibrated" as C14 uses it |
| C05-to-C15-reference | `eq:reference-gain`, `eq:reference-produced-difference` → C15 | Unchanged statements; C15 should reuse them at the same constants |
