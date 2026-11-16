import FreeField.Theory.Base
import FreeField.Theory.FockOpApply
import FreeField.Theory.DiagMeasureFinite

import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure

/-! Proofs consolidated from `FreeField/Work/diagMeasure_apply.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_DiagMeasureApply
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace DiagMeasureApplyProof

theorem totalMom_continuous (k : ℕ) : Continuous (@totalMom k) := by
  unfold totalMom
  fun_prop

theorem proj_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) (k : ℕ) :
    (projOp B ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => if totalMom p ∈ B then (ψ k) p else 0 := by
  rw [projOp, if_pos hB]
  have h := fockOp_apply (fun _ p => if totalMom p ∈ B then 1 else 0) (fun _ => id)
    (fun k => Measurable.ite (hB.preimage (totalMom_continuous k).measurable)
      measurable_const measurable_const)
    (fun k p => by split_ifs <;> simp) (fun _ => MeasurePreserving.id _) ψ k
  simpa only [ite_mul, one_mul, zero_mul, id_eq] using h

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

end DiagMeasureApplyProof

theorem diagMeasure_apply' {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) :
    (((diagMeasure ψ).real B : ℝ) : ℂ) = inner ℂ ψ (projOp B ψ) := by
  letI := diagMeasure_finite ψ
  calc
    _ = ∫ x, B.indicator (fun _ => (1 : ℂ)) x ∂(diagMeasure ψ) := by
      simpa only [Complex.real_smul, mul_one] using
        (integral_indicator_const (μ := diagMeasure ψ) (1 : ℂ) hB).symm
    _ = ∑' k, ∫ p, (‖(ψ k) p‖ ^ 2 : ℝ) •
        B.indicator (fun _ => (1 : ℂ)) (totalMom p)
          ∂(Measure.pi fun _ : Fin k => mu) :=
      DiagMeasureApplyProof.diag_integral ψ _ (measurable_const.indicator hB)
        ((integrable_const (1 : ℂ)).indicator hB)
    _ = _ := by
      rw [lp.inner_eq_tsum]
      apply tsum_congr
      intro k
      rw [L2.inner_def]
      apply integral_congr_ae
      filter_upwards [DiagMeasureApplyProof.proj_apply hB ψ k] with p hp
      change (‖(ψ k) p‖ ^ 2 : ℝ) • B.indicator (fun _ => (1 : ℂ)) (totalMom p) =
        inner ℂ ((ψ k) p) ((projOp B ψ k) p)
      rw [hp]
      by_cases hx : totalMom p ∈ B <;>
        simp [hx, inner_self_eq_norm_sq_to_K, Complex.real_smul]

end YangMills.FreeField.Consolidated.Theory_DiagMeasureApply

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 120 lines] `diagMeasure ψ B = ∑_k ∫ 1_B(∑p) |ψ_k|² dμ^k = ⟪ψ, E(B) ψ⟫`.
Depends on `fockOp_apply`, `diagMeasure_finite`. -/
theorem diagMeasure_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) :
    (((diagMeasure ψ).real B : ℝ) : ℂ) = inner ℂ ψ (projOp B ψ) := by
  exact Consolidated.Theory_DiagMeasureApply.diagMeasure_apply' hB ψ

end YangMills.FreeField
