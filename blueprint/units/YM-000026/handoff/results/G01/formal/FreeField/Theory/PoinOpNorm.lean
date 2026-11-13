import FreeField.Theory.Base
import FreeField.Analytic.MuMapAdjoint
import FreeField.Theory.FockOpApply


/-! Proofs consolidated from `FreeField/Work/poinOp_norm.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PoinOpNorm
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PoinOpNormProof

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

end PoinOpNormProof

theorem poinOp_norm' (g : Sym) (ψ : FockCarrier) : ‖poinOp g ψ‖ = ‖ψ‖ := by
  have hs (k : ℕ) : ‖poinOp g ψ k‖ = ‖ψ k‖ := by
    let v : Sector k := Lp.compMeasurePreserving (fun p : Fin k → Spacetime => fun j => lorT g.lor (p j))
      (PoinOpNormProof.lorT_preserving g.lor k) (ψ k)
    have he : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu),
        ‖(poinOp g ψ k) p‖ = ‖v p‖ := by
      filter_upwards [PoinOpNormProof.poin_apply g ψ k,
        Lp.coeFn_compMeasurePreserving (ψ k) (PoinOpNormProof.lorT_preserving g.lor k)]
        with p hp hv
      rw [hp, norm_mul, PoinOpNormProof.phase_norm, one_mul]
      exact congrArg norm hv.symm
    calc
      _ = ‖v‖ := le_antisymm
        (Lp.norm_le_norm_of_ae_le (he.mono fun _ h => h.le))
        (Lp.norm_le_norm_of_ae_le (he.mono fun _ h => h.ge))
      _ = _ := Lp.norm_compMeasurePreserving _ _
  exact le_antisymm (lp.norm_mono (by norm_num) fun k => (hs k).le)
    (lp.norm_mono (by norm_num) fun k => (hs k).ge)

end YangMills.FreeField.Consolidated.Theory_PoinOpNorm

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [EASY, 80 lines] Depends on `fockOp_apply`, `mu_map_adjoint`. -/
theorem poinOp_norm (g : Sym) (ψ : FockCarrier) : ‖poinOp g ψ‖ = ‖ψ‖ := by
  exact Consolidated.Theory_PoinOpNorm.poinOp_norm' g ψ

end YangMills.FreeField
