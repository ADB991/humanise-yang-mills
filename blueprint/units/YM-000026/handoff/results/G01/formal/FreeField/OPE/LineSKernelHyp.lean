import FreeField.OPE.Base
import FreeField.Analytic.SContDiffOn
import FreeField.Analytic.PartialDerivSBound
import FreeField.Analytic.LineSSymm


/-! Proofs consolidated from `FreeField/Work/lineS_kernelHyp.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_LineSKernelHyp
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

private theorem order_add (α β : Idx) :
    idxOrder (α + β) = idxOrder α + idxOrder β := by
  simp [idxOrder, Finset.sum_add_distrib]

private theorem order_single (i : Fin 4) : idxOrder (Pi.single i 1) = 1 := by
  simp [idxOrder, Pi.single_apply]

private theorem lineS_derivative (α β : Idx) (i : Fin 4) {ξ : Spacetime}
    (hξ : ξ ≠ 0) :
    fderiv ℝ (lineS α β) ξ (EuclideanSpace.single i (1 : ℝ)) =
      (-1 : ℂ) ^ idxOrder α * partialDeriv (α + β + Pi.single i 1) S ξ := by
  have hd : DifferentiableAt ℝ (partialDeriv (α + β) S) ξ :=
    ((partialDeriv_S_contDiffOn (α + β)).differentiableOn (by simp)).differentiableAt
      (isOpen_compl_singleton.mem_nhds hξ)
  unfold lineS
  rw [fderiv_const_mul hd]
  simp only [smul_apply, smul_eq_mul, partialDeriv_S_succ _ _ hξ]

theorem lineS_kernelHyp' : KernelHyp lineS := by
  refine ⟨lineS_symm, ?_, ?_, ?_, ?_⟩
  · intro α β
    exact contDiffOn_const.mul (partialDeriv_S_contDiffOn (α + β))
  · intro α β i ξ hξ
    rw [lineS_derivative α β i hξ, lineS, order_add, order_single, pow_succ]
    rw [show α + Pi.single i 1 + β = α + β + Pi.single i 1 by ac_rfl]
    ring
  · intro α β i ξ hξ
    rw [lineS_derivative α β i hξ, lineS, add_assoc]
  · intro α β
    obtain ⟨C, hC⟩ := partialDeriv_S_bound (α + β)
    refine ⟨C, fun ξ hξ => ?_⟩
    simpa [lineS, norm_mul, norm_pow, order_add, Nat.add_assoc] using hC ξ hξ

end YangMills.FreeField.Consolidated.OPE_LineSKernelHyp

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [EASY, 100 lines] **Kernel estimates for `S`.** `symm` is `lineS_symm`; `smooth` is
`partialDeriv_S_contDiffOn`; the derivative identities are `partialDeriv_S_succ` with
`(-1)^{|α + e_i|} = -(-1)^{|α|}` and `α + β + e_i = (α + e_i) + β = α + (β + e_i)`; `bound` is
`partialDeriv_S_bound` with `idxOrder (α + β) = idxOrder α + idxOrder β`.
Depends on `lineS_symm`, `partialDeriv_S_contDiffOn`, `partialDeriv_S_succ`,
`partialDeriv_S_bound`. -/
theorem lineS_kernelHyp : KernelHyp lineS := by
  exact Consolidated.OPE_LineSKernelHyp.lineS_kernelHyp'

end YangMills.FreeField
