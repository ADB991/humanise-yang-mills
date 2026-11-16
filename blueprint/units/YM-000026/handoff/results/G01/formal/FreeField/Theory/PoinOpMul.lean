import FreeField.Theory.Base
import FreeField.Analytic.MuMapAdjoint
import FreeField.Theory.FockOpApply


/-! Proofs consolidated from `FreeField/Work/poinOp_mul.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PoinOpMul
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PoinOpMulProof

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

theorem lorT_preserving (Λ : ProperLorentz) (k : ℕ) :
    MeasurePreserving (fun p : Fin k → Spacetime => fun j => lorT Λ (p j))
      (Measure.pi fun _ : Fin k => mu) (Measure.pi fun _ : Fin k => mu) := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  exact measurePreserving_pi _ _ fun _ => ⟨(lorT Λ).continuous.measurable, mu_map_adjoint Λ⟩

theorem poin_apply (g : Sym) (ψ : FockCarrier) (k : ℕ) :
    (poinOp g ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase g.shift k p * (ψ k) (fun j => lorT g.lor (p j)) :=
  fockOp_apply (phase g.shift) _ (phase_measurable g.shift)
    (fun k p => (phase_norm g.shift k p).le) (lorT_preserving g.lor) ψ k

theorem lorT_mul (Λ Γ : ProperLorentz) : lorT (Λ * Γ) = (lorT Γ).comp (lorT Λ) := by
  change ContinuousLinearMap.adjoint (Λ.1.val.comp Γ.1.val) = _
  exact ContinuousLinearMap.adjoint_comp _ _

theorem phase_mul (g h : Sym) (k : ℕ) (p : Fin k → Spacetime) :
    phase (g * h).shift k p =
      phase g.shift k p * phase h.shift k (fun j => lorT g.lor (p j)) := by
  have hm : totalMom (fun j => lorT g.lor (p j)) = lorT g.lor (totalMom p) := by
    simp only [totalMom, map_sum]
  have ht : (g * h).shift = g.lor.1.val h.shift + g.shift := rfl
  unfold phase
  rw [ht, inner_add_left, hm, lorT, ContinuousLinearMap.adjoint_inner_right]
  simp only [Complex.ofReal_add, mul_add, Complex.exp_add]
  exact mul_comm _ _

end PoinOpMulProof

theorem poinOp_mul' (g h : Sym) : poinOp (g * h) = (poinOp g).comp (poinOp h) := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [PoinOpMulProof.poin_apply (g * h) ψ k,
    PoinOpMulProof.poin_apply g (poinOp h ψ) k,
    (PoinOpMulProof.lorT_preserving g.lor k).quasiMeasurePreserving.tendsto_ae.eventually
      (PoinOpMulProof.poin_apply h ψ k)] with p hgh hg hh
  change (poinOp (g * h) ψ k) p = (poinOp g (poinOp h ψ) k) p
  rw [hgh, hg, hh, PoinOpMulProof.phase_mul]
  have ht : (fun j => lorT (g * h).lor (p j)) =
      (fun j => lorT h.lor (lorT g.lor (p j))) := by
    funext j
    change lorT (g.lor * h.lor) (p j) = _
    rw [PoinOpMulProof.lorT_mul]
    rfl
  rw [ht, mul_assoc]

end YangMills.FreeField.Consolidated.Theory_PoinOpMul

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 150 lines] `(U(g) U(h) ψ)_k (p) = exp (i⟪a,P⟫) exp (i⟪b, Λᵀ P⟫) ψ_k ((Λ Γ)ᵀ p)` and
`⟪b, Λᵀ P⟫ = ⟪Λ b, P⟫`. Depends on `fockOp_apply`, `mu_map_adjoint`. -/
theorem poinOp_mul (g h : Sym) : poinOp (g * h) = (poinOp g).comp (poinOp h) := by
  exact Consolidated.Theory_PoinOpMul.poinOp_mul' g h

end YangMills.FreeField
