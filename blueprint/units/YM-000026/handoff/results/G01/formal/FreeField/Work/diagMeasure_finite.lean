import FreeField.Theory

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace DiagMeasureProof

theorem sector_mass (k : ℕ) (ψ : Sector k) :
    ∫⁻ p, ENNReal.ofReal (‖(ψ : (Fin k → Spacetime) → ℂ) p‖ ^ 2)
      ∂(Measure.pi fun _ : Fin k => mu) = ENNReal.ofReal (‖ψ‖ ^ 2) := by
  simp only [ENNReal.ofReal_pow (norm_nonneg _), ofReal_norm]
  rw [Lp.enorm_def]
  simpa using (eLpNorm_nnreal_pow_eq_lintegral (f := (ψ : (Fin k → Spacetime) → ℂ))
    (p := (2 : NNReal)) (by norm_num)).symm

end DiagMeasureProof

theorem diagMeasure_finite' (ψ : FockCarrier) : IsFiniteMeasure (diagMeasure ψ) := by
  have hsum : Summable fun k : ℕ => ‖ψ k‖ ^ 2 := by
    simpa using (lp.memℓp ψ).summable (by norm_num)
  have hmass : (diagMeasure ψ) Set.univ = ∑' k : ℕ, ENNReal.ofReal (‖ψ k‖ ^ 2) := by
    rw [diagMeasure, Measure.sum_apply _ MeasurableSet.univ]
    apply tsum_congr
    intro k
    have hm : Measurable (@totalMom k) := by
      apply Continuous.measurable
      unfold totalMom
      fun_prop
    rw [Measure.map_apply hm MeasurableSet.univ, Set.preimage_univ,
      withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ]
    exact DiagMeasureProof.sector_mass k (ψ k)
  exact ⟨hmass ▸ hsum.tsum_ofReal_lt_top⟩

end YangMills.FreeField

#print axioms YangMills.FreeField.diagMeasure_finite'
