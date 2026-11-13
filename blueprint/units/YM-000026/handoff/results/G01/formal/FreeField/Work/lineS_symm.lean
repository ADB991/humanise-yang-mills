import FreeField.Analytic

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
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

end YangMills.FreeField
#print axioms YangMills.FreeField.lineS_symm'
