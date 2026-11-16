import FreeField.Theory.Base
import FreeField.Theory.FockOpApply
import FreeField.Theory.DiagMeasureFinite

import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure

/-! Proofs consolidated from `FreeField/Work/charFun_diagMeasure.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_CharFunDiagMeasure
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace CharFunDiagMeasureProof

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

theorem diag_integral (ψ : FockCarrier) (f : Spacetime → ℂ) (hm : Measurable f)
    (hf : Integrable f (diagMeasure ψ)) :
    ∫ x, f x ∂(diagMeasure ψ) =
      ∑' k, ∫ p, (‖(ψ k) p‖ ^ 2 : ℝ) • f (totalMom p)
        ∂(Measure.pi fun _ : Fin k => mu) := by
  rw [diagMeasure, integral_sum_measure hf]
  apply tsum_congr
  intro k
  refine (integral_map (totalMom_continuous k).measurable.aemeasurable
    hm.aestronglyMeasurable).trans ?_
  have hd : AEMeasurable (fun p => ENNReal.ofReal (‖(ψ k) p‖ ^ 2))
      (Measure.pi fun _ : Fin k => mu) :=
    ((Lp.memLp (ψ k)).1.norm.pow 2).aemeasurable.ennreal_ofReal
  simpa only [ENNReal.toReal_ofReal (sq_nonneg _)] using
    integral_withDensity_eq_integral_toReal_smul₀ hd
      (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top) (fun p => f (totalMom p))

end CharFunDiagMeasureProof

theorem charFun_diagMeasure' (ψ : FockCarrier) (a : Spacetime) :
    charFun (diagMeasure ψ) a = inner ℂ ψ (transOp a ψ) := by
  letI := diagMeasure_finite ψ
  have hm : Measurable fun x : Spacetime => Complex.exp ((⟪x, a⟫_ℝ : ℂ) * Complex.I) := by
    apply Continuous.measurable
    fun_prop
  rw [charFun_apply, CharFunDiagMeasureProof.diag_integral ψ _ hm]
  · rw [lp.inner_eq_tsum]
    apply tsum_congr
    intro k
    rw [L2.inner_def]
    apply integral_congr_ae
    filter_upwards [CharFunDiagMeasureProof.trans_apply a ψ k] with p hp
    change (‖(ψ k) p‖ ^ 2 : ℝ) • Complex.exp ((⟪totalMom p, a⟫_ℝ : ℂ) * Complex.I) =
      inner ℂ ((ψ k) p) ((transOp a ψ k) p)
    rw [hp]
    have he : Complex.exp ((⟪totalMom p, a⟫_ℝ : ℂ) * Complex.I) = phase a k p := by
      rw [real_inner_comm, mul_comm]
      rfl
    rw [he, Complex.real_smul]
    change _ = inner ℂ ((ψ k) p) (phase a k p • (ψ k) p)
    rw [inner_smul_right, inner_self_eq_norm_sq_to_K, Complex.ofReal_pow]
    exact mul_comm _ _
  · exact Integrable.of_bound hm.aestronglyMeasurable 1 (Eventually.of_forall fun x => by
      simp [Complex.norm_exp, Complex.mul_re])

end YangMills.FreeField.Consolidated.Theory_CharFunDiagMeasure

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 120 lines] `charFun (diagMeasure ψ) a = ∑_k ∫ exp (i ⟪∑p, a⟫) |ψ_k|² dμ^k`
(`integral_map`, `integral_withDensity_eq_integral_smul`, `integral_sum_measure`), which is
`⟪ψ, transOp a ψ⟫`. Sign check: `charFun μ t = ∫ exp (⟪x, t⟫ I) ∂μ` and `phase a` has `+i`.
Depends on `fockOp_apply`, `diagMeasure_finite`. -/
theorem charFun_diagMeasure (ψ : FockCarrier) (a : Spacetime) :
    charFun (diagMeasure ψ) a = inner ℂ ψ (transOp a ψ) := by
  exact Consolidated.Theory_CharFunDiagMeasure.charFun_diagMeasure' ψ a

end YangMills.FreeField
