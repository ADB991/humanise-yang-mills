import FreeField.Analytic.Base
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.IntegrablePowExpWeight

import Mathlib.Analysis.Calculus.ParametricIntegral

/-! Proofs consolidated from `FreeField/Work/lineC_differentiableOn.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_LineCDifferentiableOn
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

namespace LineHolomorphicWork

lemma time_continuous : Continuous time := (EuclideanSpace.proj timeAxis).continuous

lemma spatial_continuous : Continuous spatial :=
  (PiLp.continuous_toLp 2 _).comp
    (continuous_pi fun i => (EuclideanSpace.proj i.castSucc).continuous)

lemma Amono_continuous (α : Idx) : Continuous (Amono α) := by
  unfold Amono time
  fun_prop

lemma Bmono_continuous (β : Idx) : Continuous (Bmono β) := by
  unfold Bmono time
  fun_prop

lemma Bmono_norm (β : Idx) (p : Spacetime) : ‖Bmono β p‖ ≤ ‖p‖ ^ idxOrder β := by
  rw [idxOrder, Fin.sum_univ_castSucc, pow_add, ← Finset.prod_pow_eq_pow_sum]
  simp only [Bmono, norm_mul, norm_prod, norm_pow, norm_neg, Complex.norm_I,
    one_mul, Complex.norm_real, Real.norm_eq_abs]
  apply mul_le_mul
  · apply Finset.prod_le_prod
    · intro i _; positivity
    · intro i _
      exact pow_le_pow_left₀ (abs_nonneg _) (PiLp.norm_apply_le p i.castSucc) _
  · exact pow_le_pow_left₀ (abs_nonneg _) (PiLp.norm_apply_le p timeAxis) _
  · positivity
  · positivity

lemma Amono_norm (α : Idx) (p : Spacetime) : ‖Amono α p‖ ≤ ‖p‖ ^ idxOrder α := by
  have hn : ‖Amono α p‖ = ‖Bmono α p‖ := by
    simp [Amono, Bmono, norm_prod, norm_pow]
  rw [hn]
  exact Bmono_norm α p

def kernel (α β : Idx) (u : Space) (z : ℂ) (p : Spacetime) : ℂ :=
  Amono α p * Bmono β p *
    Complex.exp (Complex.I * (z * (time p : ℂ) + ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ))) * (weight p : ℂ)

lemma kernel_measurable (α β : Idx) (u : Space) (z : ℂ) :
    AEStronglyMeasurable (kernel α β u z) volume := by
  have hc : Continuous (fun p : Spacetime => Amono α p * Bmono β p *
      Complex.exp (Complex.I * (z * (time p : ℂ) + ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ)))) := by
    have ht := time_continuous
    have hs := spatial_continuous
    have ha := Amono_continuous α
    have hb := Bmono_continuous β
    fun_prop
  exact (hc.measurable.mul (Complex.measurable_ofReal.comp measurable_weight)).aestronglyMeasurable

lemma exp_norm (u : Space) (z : ℂ) (p : Spacetime) :
    ‖Complex.exp (Complex.I * (z * (time p : ℂ) + ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ)))‖ =
      Real.exp (-z.im * time p) := by
  rw [Complex.norm_exp]
  congr 1
  simp

lemma kernel_bound (α β : Idx) (u : Space) {z : ℂ} {r : ℝ} (hz : r ≤ z.im)
    (p : Spacetime) :
    ‖kernel α β u z p‖ ≤
      ‖p‖ ^ (idxOrder α + idxOrder β) * Real.exp (-r * time p) * weight p := by
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
    have he : Real.exp (-z.im * time p) ≤ Real.exp (-r * time p) := by
      apply Real.exp_le_exp.mpr
      nlinarith
    simp only [kernel, norm_mul, exp_norm, Complex.norm_real, Real.norm_eq_abs,
      abs_of_nonneg (weight_nonneg p)]
    apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
    apply mul_le_mul _ he (Real.exp_nonneg _) (by positivity)
    rw [pow_add]
    exact mul_le_mul (Amono_norm α p) (Bmono_norm β p) (norm_nonneg _) (by positivity)
  · simp [kernel, weight_eq_zero hp]

lemma kernel_integrable (α β : Idx) (u : Space) {z : ℂ} (hz : 0 < z.im) :
    Integrable (kernel α β u z) :=
  (integrable_pow_exp_weight hz (idxOrder α + idxOrder β)).mono'
    (kernel_measurable α β u z) (ae_of_all _ (kernel_bound α β u le_rfl))

lemma kernel_hasDerivAt (α β : Idx) (u : Space) (z : ℂ) (p : Spacetime) :
    HasDerivAt (fun w => kernel α β u w p)
      (kernel α β u z p * (Complex.I * (time p : ℂ))) z := by
  have hphase := (((hasDerivAt_id z).mul_const (time p : ℂ)).add_const
    (⟪u, spatial p⟫_ℝ : ℂ)).const_mul Complex.I
  have h := hphase.cexp.const_mul (Amono α p * Bmono β p)
  simpa only [kernel, id_eq, one_mul, mul_comm, mul_left_comm, mul_assoc] using
    h.mul_const (weight p : ℂ)

lemma derivative_measurable (α β : Idx) (u : Space) (z : ℂ) :
    AEStronglyMeasurable
      (fun p => kernel α β u z p * (Complex.I * (time p : ℂ))) volume := by
  apply (kernel_measurable α β u z).mul
  exact (continuous_const.mul (Complex.continuous_ofReal.comp time_continuous)).aestronglyMeasurable

lemma derivative_bound (α β : Idx) (u : Space) {z : ℂ} {r : ℝ} (hz : r ≤ z.im)
    (p : Spacetime) :
    ‖kernel α β u z p * (Complex.I * (time p : ℂ))‖ ≤
      ‖p‖ ^ (idxOrder α + idxOrder β + 1) * Real.exp (-r * time p) * weight p := by
  rw [norm_mul, norm_mul, Complex.norm_I, one_mul, Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ (‖p‖ ^ (idxOrder α + idxOrder β) * Real.exp (-r * time p) * weight p) * ‖p‖ :=
      mul_le_mul (kernel_bound α β u hz p) (PiLp.norm_apply_le p timeAxis)
        (abs_nonneg _) (by positivity [weight_nonneg p])
    _ = _ := by rw [pow_succ]; ring

lemma integral_hasDerivAt (α β : Idx) (u : Space) {z : ℂ} (hz : 0 < z.im) :
    HasDerivAt (fun w => lineC α β w u)
      (∫ p, kernel α β u z p * (Complex.I * (time p : ℂ))) z := by
  apply (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := kernel α β u)
    (F' := fun w p => kernel α β u w p * (Complex.I * (time p : ℂ)))
    (s := {w : ℂ | z.im / 2 < w.im})
    (bound := fun p => ‖p‖ ^ (idxOrder α + idxOrder β + 1) *
      Real.exp (-(z.im / 2) * time p) * weight p)
    (x₀ := z) ?_ ?_ ?_ ?_ ?_ ?_ ?_).2
  · exact (isOpen_lt continuous_const Complex.continuous_im).mem_nhds (by dsimp; linarith)
  · exact Filter.Eventually.of_forall fun w => kernel_measurable α β u w
  · exact kernel_integrable α β u hz
  · exact derivative_measurable α β u z
  · exact ae_of_all _ fun p w hw => derivative_bound α β u hw.le p
  · exact integrable_pow_exp_weight (half_pos hz) (idxOrder α + idxOrder β + 1)
  · exact ae_of_all _ fun p w _ => kernel_hasDerivAt α β u w p

end LineHolomorphicWork

theorem lineC_differentiableOn' (α β : Idx) (u : Space) :
    DifferentiableOn ℂ (fun z => lineC α β z u) {z : ℂ | 0 < z.im} := by
  intro z hz
  exact (LineHolomorphicWork.integral_hasDerivAt α β u hz).differentiableAt.differentiableWithinAt

end YangMills.FreeField.Consolidated.Analytic_LineCDifferentiableOn

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [MEDIUM, 150 lines] `lineC` converges absolutely on the upper half plane and is holomorphic
there (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `‖Amono α p * Bmono β p‖ ≤ ‖p‖^{|α|+|β|}`
and `integrable_pow_exp_weight`). -/
theorem lineC_differentiableOn (α β : Idx) (u : Space) :
    DifferentiableOn ℂ (fun z => lineC α β z u) {z : ℂ | 0 < z.im} := by
  exact Consolidated.Analytic_LineCDifferentiableOn.lineC_differentiableOn' α β u

end YangMills.FreeField
