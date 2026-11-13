import FreeField.Analytic.Base
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.IntegrablePowExpWeight
import FreeField.Analytic.SrEuclid

import Mathlib.Analysis.Calculus.ParametricIntegral

/-! Proofs consolidated from `FreeField/Work/partialDeriv_S_integral.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_PartialDerivSIntegral
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

namespace MomentumDerivativeWork

def coord (i : Fin 4) (p : Spacetime) : ℂ :=
  if i = timeAxis then -(p i : ℂ) else Complex.I * (p i : ℂ)

def phase (p : Spacetime) : Spacetime →L[ℝ] ℂ :=
  ∑ i : Fin 4, coord i p • (Complex.ofRealCLM.comp (EuclideanSpace.proj i))

lemma coord_norm (i : Fin 4) (p : Spacetime) : ‖coord i p‖ = |p i| := by
  simp [coord, apply_ite norm]

lemma coord_continuous (i : Fin 4) : Continuous (coord i) := by
  unfold coord
  split_ifs <;> fun_prop

lemma phase_continuous : Continuous phase := by
  unfold phase
  exact continuous_finsetSum _ fun i _ => (coord_continuous i).smul continuous_const

lemma phase_apply (p x : Spacetime) :
    phase p x = -((time x * time p : ℝ) : ℂ) +
      Complex.I * ((⟪spatial x, spatial p⟫_ℝ : ℝ) : ℂ) := by
  have heval : phase p x = ∑ i : Fin 4, coord i p * (x i : ℂ) := by
    simp [phase]
  rw [heval, Fin.sum_univ_castSucc]
  simp only [coord, Fin.castSucc_ne_last, if_false, if_true]
  simp only [spatial, PiLp.inner_apply, RCLike.inner_apply, conj_trivial,
    Complex.ofReal_sum, Complex.ofReal_mul]
  rw [Finset.mul_sum, add_comm]
  congr 1
  · simp [time, timeAxis]; ring
  · apply Finset.sum_congr rfl
    intro i _
    ring

lemma phase_single (p : Spacetime) (i : Fin 4) :
    phase p (EuclideanSpace.single i (1 : ℝ)) = coord i p := by
  simp [phase, apply_ite Complex.ofReal, mul_ite]

lemma phase_norm (p : Spacetime) : ‖phase p‖ ≤ 4 * ‖p‖ := by
  apply ContinuousLinearMap.opNorm_le_bound _ (by positivity)
  intro x
  calc
    ‖phase p x‖ ≤ ∑ i : Fin 4, ‖coord i p * (x i : ℂ)‖ := by
      simpa [phase] using norm_sum_le (Finset.univ)
        (fun i : Fin 4 => coord i p * (x i : ℂ))
    _ ≤ ∑ _i : Fin 4, ‖p‖ * ‖x‖ := by
      apply Finset.sum_le_sum
      intro i _
      rw [norm_mul, coord_norm, Complex.norm_real, Real.norm_eq_abs]
      exact mul_le_mul (PiLp.norm_apply_le p i) (PiLp.norm_apply_le x i)
        (abs_nonneg _) (norm_nonneg _)
    _ = 4 * ‖p‖ * ‖x‖ := by simp; ring

lemma exp_phase_norm (p x : Spacetime) :
    ‖Complex.exp (phase p x)‖ = Real.exp (-time x * time p) := by
  rw [Complex.norm_exp, phase_apply]
  congr 1
  simp

def kernel (M : Spacetime → ℂ) (x p : Spacetime) : ℂ :=
  M p * Complex.exp (phase p x) * (weight p : ℂ)

lemma kernel_measurable {M : Spacetime → ℂ} (hM : Continuous M) (x : Spacetime) :
    AEStronglyMeasurable (kernel M x) volume := by
  have hc : Continuous (fun p => M p * Complex.exp (phase p x)) :=
    hM.mul ((phase_continuous.clm_apply continuous_const).cexp)
  exact (hc.measurable.mul (Complex.measurable_ofReal.comp measurable_weight)).aestronglyMeasurable

lemma kernel_bound {M : Spacetime → ℂ} {C r : ℝ} {k : ℕ}
    (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k) {x : Spacetime} (hx : r ≤ time x)
    (p : Spacetime) :
    ‖kernel M x p‖ ≤ C * (‖p‖ ^ k * Real.exp (-r * time p) * weight p) := by
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
    have he : Real.exp (-time x * time p) ≤ Real.exp (-r * time p) := by
      apply Real.exp_le_exp.mpr
      nlinarith
    simp only [kernel, norm_mul, exp_phase_norm, Complex.norm_real,
      Real.norm_eq_abs, abs_of_nonneg (weight_nonneg p)]
    calc
      _ ≤ (C * ‖p‖ ^ k) * Real.exp (-r * time p) * weight p :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul (hM p) he (Real.exp_nonneg _) ((norm_nonneg _).trans (hM p)))
          (weight_nonneg p)
      _ = _ := by ring
  · simp [kernel, weight_eq_zero hp]

lemma kernel_integrable {M : Spacetime → ℂ} (hMc : Continuous M)
    {C : ℝ} {k : ℕ} (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k)
    {x : Spacetime} (hx : 0 < time x) : Integrable (kernel M x) := by
  exact ((integrable_pow_exp_weight hx k).const_mul C).mono'
    (kernel_measurable hMc x) (ae_of_all _ (kernel_bound hM le_rfl))

lemma kernel_hasFDerivAt (M : Spacetime → ℂ) (x p : Spacetime) :
    HasFDerivAt (fun y => kernel M y p) (kernel M x p • phase p) x := by
  simpa only [kernel, smul_smul, mul_comm, mul_left_comm, mul_assoc] using
    (((phase p).hasFDerivAt.cexp.const_mul (M p)).mul_const (weight p : ℂ))

lemma kernel_derivative_measurable {M : Spacetime → ℂ} (hM : Continuous M)
    (x : Spacetime) :
    AEStronglyMeasurable (fun p => kernel M x p • phase p) volume :=
  (kernel_measurable hM x).smul phase_continuous.aestronglyMeasurable

lemma kernel_derivative_bound {M : Spacetime → ℂ} {C r : ℝ} {k : ℕ}
    (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k) {x : Spacetime} (hx : r ≤ time x)
    (p : Spacetime) :
    ‖kernel M x p • phase p‖ ≤
      (4 * C) * (‖p‖ ^ (k + 1) * Real.exp (-r * time p) * weight p) := by
  rw [norm_smul]
  calc
    _ ≤ (C * (‖p‖ ^ k * Real.exp (-r * time p) * weight p)) * (4 * ‖p‖) :=
      mul_le_mul (kernel_bound hM hx p) (phase_norm p) (norm_nonneg _)
        ((norm_nonneg _).trans (kernel_bound hM hx p))
    _ = _ := by rw [pow_succ]; ring

lemma kernel_derivative_integrable {M : Spacetime → ℂ} (hMc : Continuous M)
    {C : ℝ} {k : ℕ} (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k)
    {x : Spacetime} (hx : 0 < time x) :
    Integrable (fun p => kernel M x p • phase p) :=
  ((integrable_pow_exp_weight hx (k + 1)).const_mul (4 * C)).mono'
    (kernel_derivative_measurable hMc x) (ae_of_all _ (kernel_derivative_bound hM le_rfl))

lemma integral_hasFDerivAt {M : Spacetime → ℂ} (hMc : Continuous M)
    {C : ℝ} {k : ℕ} (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k)
    {x : Spacetime} (hx : 0 < time x) :
    HasFDerivAt (fun y => ∫ p, kernel M y p)
      (∫ p, kernel M x p • phase p) x := by
  have htime : Continuous time := (EuclideanSpace.proj timeAxis).continuous
  apply hasFDerivAt_integral_of_dominated_of_fderiv_le
    (𝕜 := ℝ) (F := kernel M) (F' := fun y p => kernel M y p • phase p) (x₀ := x)
    (s := {y | time x / 2 < time y})
    (bound := fun p => (4 * C) *
      (‖p‖ ^ (k + 1) * Real.exp (-(time x / 2) * time p) * weight p))
  · exact (isOpen_lt continuous_const htime).mem_nhds (by dsimp; linarith)
  · exact Filter.Eventually.of_forall fun y => kernel_measurable hMc y
  · exact kernel_integrable hMc hM hx
  · exact kernel_derivative_measurable hMc x
  · exact ae_of_all _ fun p y hy => kernel_derivative_bound hM hy.le p
  · exact (integrable_pow_exp_weight (half_pos hx) (k + 1)).const_mul (4 * C)
  · exact ae_of_all _ fun p y _ => kernel_hasFDerivAt M y p

lemma integral_dirDeriv {M : Spacetime → ℂ} (hMc : Continuous M)
    {C : ℝ} {k : ℕ} (hM : ∀ p, ‖M p‖ ≤ C * ‖p‖ ^ k)
    {x : Spacetime} (hx : 0 < time x) (v : Spacetime) :
    dirDeriv v (fun y => ∫ p, kernel M y p) x =
      ∫ p, kernel (fun p => phase p v * M p) x p := by
  rw [dirDeriv, (integral_hasFDerivAt hMc hM hx).fderiv,
    ContinuousLinearMap.integral_apply (kernel_derivative_integrable hMc hM hx)]
  apply integral_congr_ae
  filter_upwards [] with p
  simp only [smul_apply, smul_eq_mul, kernel]
  ring

def multiplier (l : List Spacetime) (p : Spacetime) : ℂ :=
  (l.map fun v => phase p v).prod

lemma multiplier_continuous (l : List Spacetime) : Continuous (multiplier l) := by
  exact continuous_list_prod l fun v _ => phase_continuous.clm_apply continuous_const

lemma multiplier_bound (l : List Spacetime) :
    ∃ C : ℝ, ∀ p, ‖multiplier l p‖ ≤ C * ‖p‖ ^ l.length := by
  induction l with
  | nil => exact ⟨1, by simp [multiplier]⟩
  | cons v l ih =>
    obtain ⟨C, hC⟩ := ih
    refine ⟨4 * ‖v‖ * C, fun p => ?_⟩
    have hv : ‖phase p v‖ ≤ 4 * ‖v‖ * ‖p‖ := by
      simpa only [mul_assoc, mul_comm, mul_left_comm] using
        (phase p).le_of_opNorm_le (phase_norm p) v
    calc
      ‖multiplier (v :: l) p‖ = ‖phase p v‖ * ‖multiplier l p‖ := by
        simp [multiplier]
      _ ≤ (4 * ‖v‖ * ‖p‖) * (C * ‖p‖ ^ l.length) :=
        mul_le_mul hv (hC p) (norm_nonneg _) (by positivity)
      _ = _ := by simp only [List.length_cons, pow_succ]; ring

lemma S_integral {x : Spacetime} (hx : 0 < time x) :
    S x = ∫ p, kernel (fun _ => 1) x p := by
  have hn : Real.sqrt (time x ^ 2 + ‖spatial x‖ ^ 2) = ‖x‖ := by
    have hs : ‖x‖ ^ 2 = ‖spatial x‖ ^ 2 + time x ^ 2 := by
      rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
        Fin.sum_univ_castSucc]
      rfl
    rw [add_comm, ← hs, Real.sqrt_sq (norm_nonneg x)]
  simpa only [hn, kernel, one_mul, phase_apply, S] using (Sr_euclid hx (spatial x)).symm

lemma fold_integral (l : List Spacetime) {x : Spacetime} (hx : 0 < time x) :
    l.foldr dirDeriv S x = ∫ p, kernel (multiplier l) x p := by
  induction l generalizing x with
  | nil => exact S_integral hx
  | cons v l ih =>
    have heq : l.foldr dirDeriv S =ᶠ[𝓝 x] (fun y => ∫ p, kernel (multiplier l) y p) := by
      have htime : Continuous time := (EuclideanSpace.proj timeAxis).continuous
      filter_upwards [(isOpen_lt continuous_const htime).mem_nhds hx] with y hy
      exact ih hy
    obtain ⟨C, hC⟩ := multiplier_bound l
    change fderiv ℝ (l.foldr dirDeriv S) x v =
      ∫ p, kernel (fun p => phase p v * multiplier l p) x p
    rw [heq.fderiv_eq]
    exact integral_dirDeriv (multiplier_continuous l) hC hx v

lemma multiplier_dirList (γ : Idx) (p : Spacetime) :
    multiplier (dirList γ) p =
      (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ γ i.castSucc) *
        (-(time p : ℂ)) ^ γ timeAxis := by
  have hprod : multiplier (dirList γ) p = ∏ i : Fin 4, coord i p ^ γ i := by
    simp [multiplier, dirList, Function.comp_def, List.flatMap_def, List.prod_flatten, List.map_map,
      phase_single, Fin.prod_univ_def]
  rw [hprod, Fin.prod_univ_castSucc]
  simp only [coord, Fin.castSucc_ne_last, if_false, if_true, timeAxis, time]

end MomentumDerivativeWork

theorem partialDeriv_S_integral' (γ : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    partialDeriv γ S ξ =
      ∫ p : Spacetime, (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ γ i.castSucc) *
        (-(time p : ℂ)) ^ γ timeAxis *
        Complex.exp (-((time ξ * time p : ℝ) : ℂ) +
          Complex.I * ((⟪spatial ξ, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) := by
  simpa only [partialDeriv, MomentumDerivativeWork.kernel,
    MomentumDerivativeWork.multiplier_dirList, MomentumDerivativeWork.phase_apply] using
    MomentumDerivativeWork.fold_integral (dirList γ) hξ

end YangMills.FreeField.Consolidated.Analytic_PartialDerivSIntegral

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [MEDIUM, 250 lines] Derivatives of `S` in the upper half space as momentum integrals:
differentiate (EI) under the integral. A spatial derivative `∂_i` produces `i p_i`, the time
derivative produces `-p_t`. Depends on `Sr_euclid`, `integrable_pow_exp_weight`.
Sign check (`γ = e_t`, `spatial ξ = 0`): the right side is `-∫ p_t exp (-τ p_t) weight p < 0`,
and `S` is decreasing in `τ`. -/
theorem partialDeriv_S_integral (γ : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    partialDeriv γ S ξ =
      ∫ p : Spacetime, (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ γ i.castSucc) *
        (-(time p : ℂ)) ^ γ timeAxis *
        Complex.exp (-((time ξ * time p : ℝ) : ℂ) +
          Complex.I * ((⟪spatial ξ, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) := by
  exact Consolidated.Analytic_PartialDerivSIntegral.partialDeriv_S_integral' γ hξ

end YangMills.FreeField
