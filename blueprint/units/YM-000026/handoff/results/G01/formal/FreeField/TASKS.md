# Free-field witness: open lemmas (phase 1b)

All statements are fixed in the files named below; a worker proves one lemma in its own new file under `FreeField/Work/` (importing the file that states it, or `FreeField.Hierarchy`/`FreeField.Analytic` for the definitions) and checks it with `lake env lean`. Do not change statements or definitions; if a statement looks wrong, stop and report. "Depends on" lists the other open lemmas that the intended proof uses (it may assume them); "none" means the lemma is a leaf. EASY and MEDIUM are meant for Astra workers, HARD for a Claude agent. Line counts are estimates.

Totals: 75 lemmas. EASY 31 (about 2,000 lines), MEDIUM 29 (about 5,600 lines), HARD 13 (about 13,000 lines), in progress 2 (about 1,200 lines). About 22,000 lines in all by these estimates; the second review estimates 20,000 to 36,000.

| # | File | Lemma | Statement (summary) | Depends on | Tag | Lines |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `Analytic.lean` | `weight_le` | `weight p ≤ (time p)^4` | none | EASY | 30 |
| 2 | `Analytic.lean` | `measurable_weight` | `Measurable weight` | none | EASY | 30 |
| 3 | `Analytic.lean` | `integrable_pow_exp_weight` | `‖p‖^k exp(-r p_t) weight p` integrable for `r > 0` | `weight_le`, `measurable_weight` | MEDIUM | 120 |
| 4 | `Analytic.lean` | `weight_adjoint` | `weight (Λᵀ p) = weight p` | none | MEDIUM | 150 |
| 5 | `Analytic.lean` | `mu_map_adjoint` | `mu` invariant under `Λᵀ` | `weight_adjoint`, `measurable_weight` | MEDIUM | 80 |
| 6 | `Analytic.lean` | `Sr_euclid` | (EI) `∫ exp(-τ p_t + i⟪u,𝐩⟫) weight = Sr(√(τ²+‖u‖²))` | `integrable_pow_exp_weight`, `mu_map_adjoint` | HARD | 400 |
| 7 | `Analytic.lean` | `S_contDiffOn` | `S` smooth off the origin | `integrable_pow_exp_weight` | MEDIUM | 250 |
| 8 | `Analytic.lean` | `partialDeriv_S_contDiffOn` | `∂^γ S` smooth off the origin | `S_contDiffOn` | EASY | 60 |
| 9 | `Analytic.lean` | `partialDeriv_S_succ` | `∂_i ∂^γ S = ∂^{γ+e_i} S` off the origin | `S_contDiffOn` | MEDIUM | 150 |
| 10 | `Analytic.lean` | `partialDeriv_S_neg` | `∂^γ S(-ξ) = (-1)^{|γ|} ∂^γ S(ξ)` | none | EASY | 60 |
| 11 | `Analytic.lean` | `partialDeriv_S_integral` | `∂^γ S(ξ)` as a momentum integral for `time ξ > 0` | `Sr_euclid`, `integrable_pow_exp_weight` | MEDIUM | 250 |
| 12 | `Analytic.lean` | `partialDeriv_S_bound` | `‖∂^γ S ξ‖ ≤ C/‖ξ‖^{8+|γ|}` | `weight_le`, `S_contDiffOn` (or `partialDeriv_S_integral`) | MEDIUM | 300 |
| 13 | `Analytic.lean` | `lineS_symm` | `lineS α β ξ = lineS β α (-ξ)` | `partialDeriv_S_neg` | EASY | 20 |
| 14 | `Analytic.lean` | `lineC_differentiableOn` | `lineC α β · u` holomorphic on `im z > 0` | `integrable_pow_exp_weight` | MEDIUM | 150 |
| 15 | `Analytic.lean` | `lineC_euclid` | `lineC α β (i τ) u = lineS α β (u,τ)` for `τ > 0` | `partialDeriv_S_integral` | EASY | 80 |
| 16 | `Analytic.lean` | `matching_integrable` | (AI) closed matching integrands are integrable (directed cuts) | `weight_le`, `measurable_weight` | HARD | 600 |
| 17 | `Analytic.lean` | `wightmanL_continuous` | `wightmanL P` jointly continuous in the tests | shares proof with `matching_integrable` | HARD | 300 |
| 18 | `Reconstruction.lean` | `Host.reconstruct` | good host ⇒ `WightmanTheory` with `Axioms`, VEVs, faithfulness | none | HARD | 1000–1500 |
| 19 | `Theory.lean` | `fockOp_apply` | `fockOp c T` acts sectorwise by `c·(ψ∘T)` | none | MEDIUM | 300 |
| 20 | `Theory.lean` | `transOp_zero` | `transOp 0 = id` | `fockOp_apply` | EASY | 40 |
| 21 | `Theory.lean` | `transOp_add` | group law of translations | `fockOp_apply` | EASY | 60 |
| 22 | `Theory.lean` | `transOp_norm` | translations are isometric | `fockOp_apply` | EASY | 60 |
| 23 | `Theory.lean` | `transOp_continuous` | strong continuity of translations | `fockOp_apply` | MEDIUM | 150 |
| 24 | `Theory.lean` | `projOp_empty` | `projOp ∅ = 0` | `fockOp_apply` | EASY | 30 |
| 25 | `Theory.lean` | `projOp_univ` | `projOp univ = id` | `fockOp_apply` | EASY | 30 |
| 26 | `Theory.lean` | `projOp_inter` | `E(A) E(B) = E(A ∩ B)` | `fockOp_apply` | EASY | 60 |
| 27 | `Theory.lean` | `projOp_adjoint` | `E(B)` self-adjoint | `fockOp_apply` | EASY | 80 |
| 28 | `Theory.lean` | `projOp_hasSum` | strong countable additivity | `fockOp_apply` | MEDIUM | 150 |
| 29 | `Theory.lean` | `diagMeasure_finite` | `diagMeasure ψ` finite | none | EASY | 60 |
| 30 | `Theory.lean` | `diagMeasure_apply` | `diagMeasure ψ B = ⟪ψ, E(B) ψ⟫` | `fockOp_apply`, `diagMeasure_finite` | MEDIUM | 120 |
| 31 | `Theory.lean` | `charFun_diagMeasure` | `charFun (diagMeasure ψ) a = ⟪ψ, U(a) ψ⟫` | `fockOp_apply`, `diagMeasure_finite` | MEDIUM | 120 |
| 32 | `Theory.lean` | `projOp_cone` | `E(forwardConeᶜ) = 0` | `fockOp_apply` | MEDIUM | 120 |
| 33 | `Theory.lean` | `poinOp_one` | `poinOp 1 = id` | `fockOp_apply` | MEDIUM | 120 |
| 34 | `Theory.lean` | `poinOp_mul` | `poinOp (g h) = poinOp g ∘ poinOp h` | `fockOp_apply`, `mu_map_adjoint` | MEDIUM | 150 |
| 35 | `Theory.lean` | `poinOp_norm` | `poinOp g` isometric | `fockOp_apply`, `mu_map_adjoint` | EASY | 80 |
| 36 | `Theory.lean` | `poinOp_continuous` | strong continuity on the Poincaré group | `fockOp_apply`, `mu_map_adjoint`, `poinOp_norm` | HARD | 400 |
| 37 | `Theory.lean` | `poinOp_translation` | `poinOp (1, x) = transOp x` | none | EASY | 40 |
| 38 | `Theory.lean` | `rhoL_one` | `rhoL 1 = id` | none | MEDIUM | 100 |
| 39 | `Theory.lean` | `rhoL_mul` | `rhoL (Λ Γ) = rhoL Λ ∘ rhoL Γ` | none | MEDIUM | 250 |
| 40 | `Theory.lean` | `rhoL_bijective` | `rhoL Λ` bijective | `rhoL_one`, `rhoL_mul` | MEDIUM | 120 |
| 41 | `Theory.lean` | `wightW_ofFn` | `wightW (ofFn (P, f)) = wightmanL P f` | none | EASY | 60 |
| 42 | `Theory.lean` | `openAmpW_memLp` | word amplitudes are in `L²(mu^k)` | as `matching_integrable` (directed cuts with external legs) | HARD | 500 |
| 43 | `Theory.lean` | `openAmpW_eq_zero` | amplitudes vanish for large `k` | none | MEDIUM | 120 |
| 44 | `Theory.lean` | `Psi_apply` | components of `Psi w` | `openAmpW_memLp`, `openAmpW_eq_zero` | EASY | 80 |
| 45 | `Theory.lean` | `cut_identity` | `∑_k (1/k!) ∫ conj(amp_u) amp_v = wightW (u† ++ v)` | `openAmpW_memLp`, `matching_integrable` | HARD | 1500 |
| 46 | `Theory.lean` | `inner_Psi` | `⟪Ψ u, Ψ v⟫ = wightW (u† ++ v)` | `Psi_apply`, `cut_identity` | MEDIUM | 150 |
| 47 | `Theory.lean` | `Psi_nil_norm` | `‖Ψ []‖ = 1` | `inner_Psi` | EASY | 40 |
| 48 | `Theory.lean` | `wightW_add_label` | additivity of `wightW` in a label | none | MEDIUM | 150 |
| 49 | `Theory.lean` | `wightW_smul_label` | homogeneity of `wightW` in a label | none | EASY | 80 |
| 50 | `Theory.lean` | `wightW_add_test` | additivity of `wightW` in a test | `matching_integrable` | MEDIUM | 150 |
| 51 | `Theory.lean` | `wightW_smul_test` | homogeneity of `wightW` in a test | none | EASY | 80 |
| 52 | `Theory.lean` | `wightW_local` | exchange of adjacent spacelike separated letters in `wightW` | `Sr_euclid`, `partialDeriv_S_integral`, `matching_integrable`, `wightmanL_continuous` | HARD | 2000 |
| 53 | `Theory.lean` | `Psi_add_label` | head additivity in the label | `inner_Psi`, `wightW_add_label` | EASY | 60 |
| 54 | `Theory.lean` | `Psi_smul_label` | head homogeneity in the label | `inner_Psi`, `wightW_smul_label` | EASY | 60 |
| 55 | `Theory.lean` | `Psi_add_test` | head additivity in the test | `inner_Psi`, `wightW_add_test` | EASY | 60 |
| 56 | `Theory.lean` | `Psi_smul_test` | head homogeneity in the test | `inner_Psi`, `wightW_smul_test` | EASY | 60 |
| 57 | `Theory.lean` | `Psi_adjoint` | adjoint identity of word vectors | `inner_Psi` | EASY | 30 |
| 58 | `Theory.lean` | `Psi_tempered` | `f ↦ Ψ((A,f)::u)` continuous | `inner_Psi`, `Psi_add_test`, `wightmanL_continuous` | MEDIUM | 150 |
| 59 | `Theory.lean` | `Psi_local` | locality of word vectors | `inner_Psi`, `wightW_local` | EASY | 60 |
| 60 | `Theory.lean` | `Psi_covariant` | `U(g) Ψ(u) = Ψ(g·u)` | `fockOp_apply`, `mu_map_adjoint`, `Psi_apply` | HARD | 900 |
| 61 | `Theory.lean` | `transOp_invariant` | translation-invariant host vectors are multiples of `Ψ []` | `fockOp_apply`, `Psi_apply` | MEDIUM | 200 |
| 62 | `Theory.lean` | `Psi_faithful` | `A ≠ 0 ⇒ ∃ f, Ψ[(A,f)] ≠ 0` | `Psi_apply` | HARD | 600 |
| 63 | `Continuation.lean` | `corrL_perm` | permutation symmetry of `corrL` | `lineS_symm` | MEDIUM | 400 |
| 64 | `Continuation.lean` | `corrL_contDiffOn` | `corrL P` smooth on `separated n` | `partialDeriv_S_contDiffOn` | EASY | 150 |
| 65 | `Continuation.lean` | `contL_differentiableOn` | `contL` holomorphic on the ordered tube | `lineC_differentiableOn` | EASY | 150 |
| 66 | `Continuation.lean` | `contL_root` | `contL` at Euclidean points is `corrL` | `lineC_euclid` | EASY | 150 |
| 67 | `Continuation.lean` | `contL_boundary` | smeared boundary values of `contL` are `wightmanL` | `matching_integrable`, `integrable_pow_exp_weight` | HARD | 800 |
| 68 | `OPE.lean` | `lineS_kernelHyp` | `KernelHyp lineS` | `lineS_symm`, `partialDeriv_S_contDiffOn`, `partialDeriv_S_succ`, `partialDeriv_S_bound` | EASY | 100 |
| 69 | `OPE.lean` | `gwickGrouped_factor` | factorisation over partial matchings of the cluster | none | HARD | 1200 |
| 70 | `OPE.lean` | `splitCorr_collapse` | point-split correlation at one point = one-vertex Wick sum | none | MEDIUM | 400 |
| 71 | `OPE.lean` | `splitCorr_fderiv` | a derivative in a split position raises the index | none | MEDIUM | 200 |
| 72 | `OPE.lean` | `gope_coefficients` | coefficient bound (public clause, generic kernel) | none | MEDIUM | 500 |
| 73 | `OPE.lean` | `gope_remainder` | remainder bound (public clause, generic kernel) | `gwickGrouped_factor`, `splitCorr_collapse`, `splitCorr_fderiv` | HARD | 2500 |
| 74 | `Trace.lean` | `Sr_asymptotic` | `r⁸ log²(1/r) Sr r → 384π` | none (in progress: `Work/SrAsymptotic.lean`) | in progress | 500 |
| 75 | `Trace.lean` | `wickProfile_excluded` | no Wick profile has the `r⁻⁸ log⁻²` asymptotic | none (in progress: `Work/WickExcluded.lean`) | in progress | 600–800 |

## Suggested order

1. **Wave 1 (leaves, in parallel).** `weight_le`, `measurable_weight`, `weight_adjoint`, `partialDeriv_S_neg`, `fockOp_apply`, `diagMeasure_finite`, `poinOp_translation`, `rhoL_one`, `rhoL_mul`, `wightW_ofFn`, `openAmpW_eq_zero`, `wightW_add_label`, `wightW_smul_label`, `wightW_smul_test`, `splitCorr_collapse`, `splitCorr_fderiv`, `gope_coefficients`, and the HARD leaves `Host.reconstruct`, `matching_integrable` (with `wightmanL_continuous`), `gwickGrouped_factor`.
2. **Wave 2.** `integrable_pow_exp_weight`, `mu_map_adjoint`, `lineS_symm`, `rhoL_bijective`; everything that depends only on `fockOp_apply` (`transOp_*`, `projOp_*`, `diagMeasure_apply`, `charFun_diagMeasure`, `poinOp_one`); `wightW_add_test`; `corrL_perm`; HARD: `openAmpW_memLp`.
3. **Wave 3.** `S_contDiffOn`, `lineC_differentiableOn`, `poinOp_mul`, `poinOp_norm`, `Psi_apply`; HARD: `Sr_euclid`, `cut_identity`, `contL_boundary`, `poinOp_continuous`.
4. **Wave 4.** `partialDeriv_S_contDiffOn`, `partialDeriv_S_succ`, `partialDeriv_S_integral`, `partialDeriv_S_bound`, `inner_Psi`, `transOp_invariant`, `contL_differentiableOn`, `corrL_contDiffOn`; HARD: `Psi_covariant`, `Psi_faithful`.
5. **Wave 5.** `lineC_euclid`, `contL_root`, `lineS_kernelHyp`, `Psi_nil_norm`, `Psi_add_label`, `Psi_smul_label`, `Psi_add_test`, `Psi_smul_test`, `Psi_adjoint`, `Psi_tempered`; HARD: `wightW_local`, `gope_remainder`.
6. **Wave 6.** `Psi_local`. Then replace the `sorry`s in the stating files by the proofs from `Work/` and rebuild.

The critical path is `matching_integrable` → `openAmpW_memLp` → `cut_identity` → `inner_Psi` → the `Psi_*` identities, and `Sr_euclid` → `wightW_local`. `gope_remainder` and `Host.reconstruct` are long but independent of everything analytic.

## Numeric checks

`FreeField/Check/check_conventions.py` (numpy, scipy, sympy; about one minute): Euclidean invariance of the two-point function; `lineC = lineS` for one and two time derivatives; the sign of `adjL` in `⟪Ψ,Ψ⟫ = wightW (u† ++ v)` for one letter `ξ_{e_t}`; the `1/k!` normalisation of the cut identity by counting matchings for seven pairs of words; the leg factors `Amono`, `Bmono` under `ρ(Λ) = D⁻¹ΛD` for a generic Lorentz transformation, orders one to three. All pass.

## Copied upstream files

None. The generic SNAG layer of the upstream release (13 files, 1,359 lines, Mathlib-only closure, listed in `DESIGN.md` section 5) was not copied because the spectral data of the host are defined directly. If a worker copies any upstream file, record here: the file, its origin path under `Lean/` of the release, and its import closure.
