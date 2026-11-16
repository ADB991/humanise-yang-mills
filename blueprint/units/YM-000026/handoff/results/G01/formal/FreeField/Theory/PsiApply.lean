import FreeField.Theory.Base
import FreeField.Theory.OpenAmpWMemLp
import FreeField.Theory.OpenAmpWEqZero


/-! Proofs consolidated from `FreeField/Work/Psi_apply.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PsiApply
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

private theorem psiComp_memℓp (w : Word) : Memℓp (psiComp w) 2 := by
  obtain ⟨N, hN⟩ := openAmpW_eq_zero w
  apply Memℓp.of_exponent_ge (q := 0) _ (by positivity)
  apply memℓp_zero
  apply (Set.finite_Iic N).subset
  intro k hk
  by_contra h
  have hz := hN k (lt_of_not_ge h)
  have hc : psiComp w k = 0 := by
    unfold psiComp
    split_ifs with hmem
    · simp [hz, MemLp.toLp_zero]
    · rfl
  exact hk hc

theorem Psi_apply' (w : Word) (k : ℕ) :
    (Psi w) k = (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) •
      (openAmpW_memLp w k).toLp (openAmpW w k) := by
  rw [Psi, dif_pos (psiComp_memℓp w)]
  change psiComp w k = _
  rw [psiComp, dif_pos (openAmpW_memLp w k)]

end YangMills.FreeField.Consolidated.Theory_PsiApply

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [EASY, 80 lines] Unfold the totalised definitions. Depends on `openAmpW_memLp`,
`openAmpW_eq_zero`. -/
theorem Psi_apply (w : Word) (k : ℕ) :
    (Psi w) k = (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) •
      (openAmpW_memLp w k).toLp (openAmpW w k) := by
  exact Consolidated.Theory_PsiApply.Psi_apply' w k

end YangMills.FreeField
