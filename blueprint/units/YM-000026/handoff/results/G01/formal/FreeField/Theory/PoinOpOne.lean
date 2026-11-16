import FreeField.Theory.Base
import FreeField.Theory.FockOpApply


/-! Proofs consolidated from `FreeField/Work/poinOp_one.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PoinOpOne
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PoinOpOneProof

theorem totalMom_continuous (k : ℕ) : Continuous (@totalMom k) := by
  unfold totalMom
  fun_prop

theorem phase_measurable (x : Spacetime) (k : ℕ) : Measurable (phase x k) := by
  apply Continuous.measurable
  unfold phase
  exact Complex.continuous_exp.comp
    (continuous_const.mul (Complex.continuous_ofReal.comp
      (continuous_const.inner (totalMom_continuous k))))

theorem phase_norm (x : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    ‖phase x k p‖ = 1 := by
  simp [phase, Complex.norm_exp, Complex.mul_re]

theorem trans_apply (x : Spacetime) (ψ : FockCarrier) (k : ℕ) :
    (transOp x ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase x k p * (ψ k : (Fin k → Spacetime) → ℂ) p :=
  fockOp_apply (phase x) (fun _ => id) (phase_measurable x)
    (fun k p => (phase_norm x k p).le) (fun _ => MeasurePreserving.id _) ψ k

end PoinOpOneProof

theorem poinOp_one' : poinOp 1 = ContinuousLinearMap.id ℂ FockCarrier := by
  have hid : lorT (1 : ProperLorentz) = ContinuousLinearMap.id ℝ Spacetime := by
    change ContinuousLinearMap.adjoint (ContinuousLinearMap.id ℝ Spacetime) = _
    exact ContinuousLinearMap.adjoint_id
  have heq : poinOp 1 = transOp 0 := by
    unfold poinOp transOp
    congr 1
    funext k p j
    change lorT 1 (p j) = p j
    rw [hid]
    rfl
  rw [heq]
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [PoinOpOneProof.trans_apply 0 ψ k] with p hp
  simpa [phase] using hp

end YangMills.FreeField.Consolidated.Theory_PoinOpOne

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 120 lines] The adjoint of the identity is the identity. Depends on `fockOp_apply`. -/
theorem poinOp_one : poinOp 1 = ContinuousLinearMap.id ℂ FockCarrier := by
  exact Consolidated.Theory_PoinOpOne.poinOp_one'

end YangMills.FreeField
