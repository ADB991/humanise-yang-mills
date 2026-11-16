import FreeField.Theory.Base


/-! Proofs consolidated from `FreeField/Work/poinOp_translation.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PoinOpTranslation
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

theorem poinOp_translation' (x : Spacetime) :
    poinOp (((1 : ProperLorentz), x) : Sym) = transOp x := by
  have hid : lorT (1 : ProperLorentz) = ContinuousLinearMap.id ℝ Spacetime := by
    change ContinuousLinearMap.adjoint (ContinuousLinearMap.id ℝ Spacetime) = _
    exact ContinuousLinearMap.adjoint_id
  unfold poinOp transOp
  congr 1
  funext k p j
  change lorT 1 (p j) = p j
  rw [hid]
  rfl

end YangMills.FreeField.Consolidated.Theory_PoinOpTranslation

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [EASY, 40 lines] `lorT 1 = id`. -/
theorem poinOp_translation (x : Spacetime) :
    poinOp (((1 : ProperLorentz), x) : Sym) = transOp x := by
  exact Consolidated.Theory_PoinOpTranslation.poinOp_translation' x

end YangMills.FreeField
