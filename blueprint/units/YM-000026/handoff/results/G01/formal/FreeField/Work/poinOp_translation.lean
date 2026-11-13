import FreeField.Theory

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
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

end YangMills.FreeField

#print axioms YangMills.FreeField.poinOp_translation'
