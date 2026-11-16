import FreeField.Analytic.Base
import FreeField.Analytic.PartialDerivSNeg


/-! Proofs consolidated from `FreeField/Work/lineS_symm.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_LineSSymm
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private theorem idxOrder_add_work (α β : Idx) :
    idxOrder (α + β) = idxOrder α + idxOrder β := by
  simp [idxOrder, Finset.sum_add_distrib]

theorem lineS_symm' (α β : Idx) (ξ : Spacetime) : lineS α β ξ = lineS β α (-ξ) := by
  unfold lineS
  rw [partialDeriv_S_neg, add_comm β α, idxOrder_add_work, pow_add]
  have hb : (-1 : ℂ) ^ idxOrder β * (-1) ^ idxOrder β = 1 := by
    rw [← mul_pow]
    simp
  calc
    (-1 : ℂ) ^ idxOrder α * partialDeriv (α + β) S ξ =
        ((-1) ^ idxOrder β * (-1) ^ idxOrder β) *
          ((-1) ^ idxOrder α * partialDeriv (α + β) S ξ) := by rw [hb, one_mul]
    _ = _ := by ring

end YangMills.FreeField.Consolidated.Analytic_LineSSymm

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [EASY, 20 lines] Symmetry of the Euclidean line kernel, from `partialDeriv_S_neg` and
`add_comm`: `(-1)^{|β|} (-1)^{|α+β|} = (-1)^{|α|}`. -/
theorem lineS_symm (α β : Idx) (ξ : Spacetime) : lineS α β ξ = lineS β α (-ξ) := by
  exact Consolidated.Analytic_LineSSymm.lineS_symm' α β ξ

end YangMills.FreeField
