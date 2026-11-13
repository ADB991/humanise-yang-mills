import FreeField.Analytic.Base
import FreeField.Analytic.WeightLe
import FreeField.Analytic.MeasurableWeight

import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier

/-! Proofs consolidated from `FreeField/Work/matching_integrable.lean`. -/

/-!
The two analytic matching estimates share the same dominating function, so their
proofs are kept in this file. The weighted-vertex identity below is the sum of
the directed-cut identities: a line is counted once for each cut it crosses.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_MatchingIntegrable
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace FourierTransform

namespace MatchingEstimates

variable {n : ℕ} {m : Fin n → Mon}

theorem norm_le_twice_time {p : Spacetime} (hp : p ∈ forwardCone) :
    ‖p‖ ≤ 2 * time p := by
  have hs : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans hs
  have hn : ‖p‖ ^ 2 = ‖spatial p‖ ^ 2 + time p ^ 2 := by
    rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
      Fin.sum_univ_castSucc]
    rfl
  nlinarith [norm_nonneg p, norm_nonneg (spatial p)]

theorem time_vertexMomentum (σ : Matching m) (q : Line σ → Spacetime) (v : Fin n) :
    time (vertexMomentum σ q v) =
      (∑ ℓ : Line σ, if (σ.1 ℓ.1).1 = v then time (q ℓ) else 0) -
        ∑ ℓ : Line σ, if ℓ.1.1 = v then time (q ℓ) else 0 := by
  simp [vertexMomentum, time, apply_ite, PiLp.sub_apply, ite_apply]

theorem weighted_vertex_identity (σ : Matching m) (q : Line σ → Spacetime) :
    (∑ v : Fin n, (v.val : ℝ) * time (vertexMomentum σ q v)) =
      ∑ ℓ : Line σ, ((σ.1 ℓ.1).1.val - (ℓ.1.1.val : ℝ)) * time (q ℓ) := by
  simp_rw [time_vertexMomentum, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum]
  rw [Finset.sum_comm, Finset.sum_comm (f := fun v ℓ =>
    (v.val : ℝ) * if ℓ.1.1 = v then time (q ℓ) else 0)]
  simp only [mul_ite, mul_zero, Finset.sum_ite_eq, Finset.mem_univ, if_true]
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro ℓ _
  ring

theorem time_le_vertex_sum (σ : Matching m) (q : Line σ → Spacetime)
    (hq : ∀ ℓ, q ℓ ∈ forwardCone) (ℓ : Line σ) :
    time (q ℓ) ≤ n * ∑ v : Fin n, ‖vertexMomentum σ q v‖ := by
  have ht (l : Line σ) : 0 ≤ time (q l) :=
    (norm_nonneg (spatial (q l))).trans (hq l)
  have hd (l : Line σ) : (1 : ℝ) ≤ (σ.1 l.1).1.val - (l.1.1.val : ℝ) := by
    have h := l.2
    have : l.1.1.val + 1 ≤ (σ.1 l.1).1.val := h
    have hh : (l.1.1.val : ℝ) + 1 ≤ (σ.1 l.1).1.val := by exact_mod_cast this
    linarith
  calc
    time (q ℓ) ≤ ∑ l : Line σ, time (q l) :=
      Finset.single_le_sum (fun l _ => ht l) (Finset.mem_univ ℓ)
    _ ≤ ∑ l : Line σ, ((σ.1 l.1).1.val - (l.1.1.val : ℝ)) * time (q l) := by
      apply Finset.sum_le_sum
      intro l _
      nlinarith [hd l, ht l]
    _ = ∑ v : Fin n, (v.val : ℝ) * time (vertexMomentum σ q v) :=
      (weighted_vertex_identity σ q).symm
    _ ≤ ∑ v : Fin n, (n : ℝ) * ‖vertexMomentum σ q v‖ := by
      apply Finset.sum_le_sum
      intro v _
      have htime : time (vertexMomentum σ q v) ≤ ‖vertexMomentum σ q v‖ := by
        apply (le_abs_self _).trans
        simpa only [time, Real.norm_eq_abs] using
          (PiLp.norm_apply_le (vertexMomentum σ q v) timeAxis)
      exact (mul_le_mul_of_nonneg_left htime (Nat.cast_nonneg _)).trans
        (mul_le_mul_of_nonneg_right (by exact_mod_cast v.isLt.le) (norm_nonneg _))
    _ = n * ∑ v : Fin n, ‖vertexMomentum σ q v‖ := (Finset.mul_sum ..).symm

theorem norm_le_vertex_sum (σ : Matching m) (q : Line σ → Spacetime)
    (hq : ∀ ℓ, q ℓ ∈ forwardCone) :
    ‖q‖ ≤ 2 * n * ∑ v : Fin n, ‖vertexMomentum σ q v‖ := by
  apply (pi_norm_le_iff_of_nonneg (by positivity)).2
  intro ℓ
  calc
    ‖q ℓ‖ ≤ 2 * time (q ℓ) := norm_le_twice_time (hq ℓ)
    _ ≤ 2 * (n * ∑ v : Fin n, ‖vertexMomentum σ q v‖) := by
      gcongr
      exact time_le_vertex_sum σ q hq ℓ
    _ = _ := by ring

theorem one_add_norm_le_vertex_prod (σ : Matching m) (q : Line σ → Spacetime)
    (hq : ∀ ℓ, q ℓ ∈ forwardCone) :
    1 + ‖q‖ ≤ (1 + 2 * n * n) * ∏ v : Fin n, (1 + ‖vertexMomentum σ q v‖) := by
  let R := ∏ v : Fin n, (1 + ‖vertexMomentum σ q v‖)
  have hR : 1 ≤ R := Finset.one_le_prod fun v _ => by simp
  have hs : (∑ v : Fin n, ‖vertexMomentum σ q v‖) ≤ n * R := by
    calc
      _ ≤ ∑ _v : Fin n, R := by
        apply Finset.sum_le_sum
        intro v _
        apply (le_add_of_nonneg_left zero_le_one).trans
        simpa using Finset.prod_le_prod_of_subset_of_one_le
          (f := fun w : Fin n => 1 + ‖vertexMomentum σ q w‖)
          (Finset.subset_univ {v}) (fun w _ => by positivity) (fun w _ _ => by simp)
      _ = n * R := by simp
  have hq' := norm_le_vertex_sum σ q hq
  have hh := mul_le_mul_of_nonneg_left hs (show 0 ≤ (2 : ℝ) * n by positivity)
  change 1 + ‖q‖ ≤ (1 + 2 * n * n) * R
  nlinarith

/-- The unnormalised positive-sign Fourier transform, bundled as a Schwartz map. -/
def fourierSchwartz (f : TestFunction) : TestFunction :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ
    (LinearEquiv.smulOfNeZero ℝ Spacetime ((2 * Real.pi)⁻¹)
      (inv_ne_zero (mul_ne_zero (by norm_num) Real.pi_ne_zero))).toContinuousLinearEquiv
    (𝓕⁻ f)

theorem fourierSchwartz_apply (f : TestFunction) (k : Spacetime) :
    fourierSchwartz f k = fourierE f k := by
  change (𝓕⁻ f) (((2 * Real.pi)⁻¹) • k) = _
  rw [SchwartzMap.fourierInv_coe, Real.fourierInv_eq']
  unfold fourierE
  apply integral_congr_ae
  apply ae_of_all
  intro x
  dsimp only
  have h : 2 * Real.pi * ⟪x, ((2 * Real.pi)⁻¹) • k⟫_ℝ = ⟪x, k⟫_ℝ := by
    rw [inner_smul_right, ← mul_assoc, mul_inv_cancel₀ (by positivity), one_mul]
  rw [h, smul_eq_mul]
  simp only [mul_comm]

theorem continuous_fourierSchwartz : Continuous fourierSchwartz := by
  exact (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ _).continuous.comp
    FourierTransform.continuous_fourierInv

theorem continuous_fourierE (f : TestFunction) : Continuous (fourierE f) := by
  have h : (fourierSchwartz f : Spacetime → ℂ) = fourierE f :=
    funext (fourierSchwartz_apply f)
  rw [← h]
  exact (fourierSchwartz f).continuous

theorem continuous_fourierE_test (k : Spacetime) :
    Continuous (fun f : TestFunction => fourierE f k) := by
  have h : Continuous (fun f : TestFunction => fourierSchwartz f k) :=
    (BoundedContinuousFunction.evalCLM ℂ k).continuous.comp
      ((SchwartzMap.toBoundedContinuousFunctionCLM ℂ Spacetime ℂ).continuous.comp
        continuous_fourierSchwartz)
  simpa only [fourierSchwartz_apply] using h

/-- A continuous nonnegative bound for the weighted Fourier transform. -/
def fourierBound (N : ℕ) (f : TestFunction) : ℝ :=
  2 ^ N * (Finset.Iic (N, 0)).sup (fun a => SchwartzMap.seminorm ℝ a.1 a.2)
    (fourierSchwartz f)

theorem fourierBound_nonneg (N : ℕ) (f : TestFunction) : 0 ≤ fourierBound N f := by
  unfold fourierBound
  positivity

theorem continuous_fourierBound (N : ℕ) : Continuous (fourierBound N) := by
  unfold fourierBound
  apply Continuous.const_mul
  apply Continuous.comp _ continuous_fourierSchwartz
  exact Seminorm.continuous_finsetSup fun a _ =>
    (schwartz_withSeminorms ℝ Spacetime ℂ).continuous_seminorm a

theorem fourier_decay (N : ℕ) (f : TestFunction) (k : Spacetime) :
    (1 + ‖k‖) ^ N * ‖fourierE f k‖ ≤ fourierBound N f := by
  simpa only [fourierBound, norm_iteratedFDeriv_zero, fourierSchwartz_apply] using
    (SchwartzMap.one_add_le_sup_seminorm_apply (𝕜 := ℝ)
      (m := (N, 0)) le_rfl le_rfl (fourierSchwartz f) k)

theorem norm_Amono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
    ‖Amono α p‖ ≤ R ^ idxOrder α := by
  have hR0 : 0 ≤ R := (norm_nonneg p).trans hR
  have hc (i : Fin 4) : |p i| ≤ R := by
    have h : |p i| ≤ ‖p‖ := by
      simpa only [Real.norm_eq_abs] using PiLp.norm_apply_le p i
    exact h.trans hR
  simp only [Amono, norm_mul, norm_prod, norm_pow, norm_neg, Complex.norm_I,
    Complex.norm_real, Real.norm_eq_abs, one_mul]
  calc
    _ ≤ (∏ i : Fin 3, R ^ α i.castSucc) * R ^ α timeAxis := by
      apply mul_le_mul _ _ (by positivity) (by positivity)
      · exact Finset.prod_le_prod (fun i _ => by positivity) fun i _ =>
          pow_le_pow_left₀ (abs_nonneg _) (hc _) _
      · exact pow_le_pow_left₀ (abs_nonneg _) (hc timeAxis) _
    _ = R ^ idxOrder α := by
      rw [Finset.prod_pow_eq_pow_sum, ← pow_add]
      exact congrArg (R ^ ·) (Fin.sum_univ_castSucc α).symm

theorem norm_Bmono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
    ‖Bmono α p‖ ≤ R ^ idxOrder α := by
  have h : ‖Bmono α p‖ = ‖Amono α p‖ := by
    simp only [Amono, Bmono, norm_mul, norm_prod, norm_pow, norm_neg]
  rw [h]
  exact norm_Amono_le α p hR

def degree (σ : Matching m) : ℕ :=
  ∑ ℓ : Line σ, (idxOrder ℓ.1.idx + idxOrder (σ.1 ℓ.1).idx + 4)

def kernel (σ : Matching m) (q : Line σ → Spacetime) : ℂ :=
  ∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)

def integrand (σ : Matching m) (f : Fin n → TestFunction) (q : Line σ → Spacetime) : ℂ :=
  kernel σ q * ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v)

theorem norm_kernel_le (σ : Matching m) (q : Line σ → Spacetime) :
    ‖kernel σ q‖ ≤ (1 + ‖q‖) ^ degree σ := by
  unfold kernel degree
  rw [norm_prod, ← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
  intro ℓ _
  have hR : ‖q ℓ‖ ≤ 1 + ‖q‖ := (norm_le_pi_norm q ℓ).trans (by linarith)
  have hR0 : 0 ≤ 1 + ‖q‖ := by positivity
  have hw : ‖(weight (q ℓ) : ℂ)‖ ≤ (1 + ‖q‖) ^ 4 := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (weight_nonneg _)]
    apply (weight_le _).trans
    have ht : |time (q ℓ)| ≤ 1 + ‖q‖ := by
      exact (show |time (q ℓ)| ≤ ‖q ℓ‖ by
        simpa only [time, Real.norm_eq_abs] using PiLp.norm_apply_le (q ℓ) timeAxis).trans hR
    calc
      time (q ℓ) ^ 4 = |time (q ℓ)| ^ 4 := by rw [pow_abs, abs_of_nonneg (by positivity)]
      _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) ht _
  rw [norm_mul, norm_mul, pow_add, pow_add]
  exact mul_le_mul (mul_le_mul (norm_Amono_le _ _ hR) (norm_Bmono_le _ _ hR)
    (norm_nonneg _) (by positivity)) hw (norm_nonneg _) (by positivity)

theorem integrand_eq_zero_off_cone (σ : Matching m) (f : Fin n → TestFunction)
    (q : Line σ → Spacetime) (hq : ¬ ∀ ℓ, q ℓ ∈ forwardCone) : integrand σ f q = 0 := by
  obtain ⟨ℓ, hℓ⟩ := not_forall.mp hq
  have h : kernel σ q = 0 := by
    apply Finset.prod_eq_zero (Finset.mem_univ ℓ)
    rw [weight_eq_zero hℓ, Complex.ofReal_zero, mul_zero]
  simp only [integrand, h, zero_mul]

theorem continuous_vertexMomentum (σ : Matching m) (v : Fin n) :
    Continuous (fun q : Line σ → Spacetime => vertexMomentum σ q v) := by
  unfold vertexMomentum
  apply Continuous.sub
  all_goals
    apply continuous_finsetSum
    intro ℓ _
    split_ifs
    · exact continuous_apply ℓ
    · exact continuous_const

theorem continuous_Amono (α : Idx) : Continuous (Amono α) := by
  unfold Amono time
  fun_prop

theorem continuous_Bmono (α : Idx) : Continuous (Bmono α) := by
  unfold Bmono time
  fun_prop

theorem measurable_kernel (σ : Matching m) : Measurable (kernel σ) := by
  unfold kernel
  apply Finset.measurable_prod
  intro ℓ _
  exact (((continuous_Amono _).comp (continuous_apply ℓ)).measurable.mul
    ((continuous_Bmono _).comp (continuous_apply ℓ)).measurable).mul
      (Complex.measurable_ofReal.comp (measurable_weight.comp (measurable_pi_apply ℓ)))

theorem measurable_integrand (σ : Matching m) (f : Fin n → TestFunction) :
    Measurable (integrand σ f) := by
  apply (measurable_kernel σ).mul
  apply Finset.measurable_prod
  intro v _
  exact ((continuous_fourierE (f v)).comp (continuous_vertexMomentum σ v)).measurable

theorem continuous_integrand_test (σ : Matching m) (q : Line σ → Spacetime) :
    Continuous (fun f : Fin n → TestFunction => integrand σ f q) := by
  apply Continuous.const_mul
  apply continuous_finsetProd
  intro v _
  exact (continuous_fourierE_test _).comp (continuous_apply v)

/-- The test-dependent part of the common bound is continuous and nonnegative. -/
def bound (σ : Matching m) (s : ℕ) (f : Fin n → TestFunction) : ℝ :=
  (1 + 2 * n * n : ℝ) ^ (degree σ + s) * ∏ v : Fin n, fourierBound (degree σ + s) (f v)

theorem bound_nonneg (σ : Matching m) (s : ℕ) (f : Fin n → TestFunction) :
    0 ≤ bound σ s f := by
  unfold bound
  exact mul_nonneg (by positivity) (Finset.prod_nonneg fun v _ => fourierBound_nonneg _ _)

theorem continuous_bound (σ : Matching m) (s : ℕ) : Continuous (bound σ s) := by
  unfold bound
  apply Continuous.const_mul
  exact continuous_finsetProd _ fun v _ => (continuous_fourierBound _).comp (continuous_apply v)

theorem weighted_integrand_le (σ : Matching m) (s : ℕ) (f : Fin n → TestFunction)
    (q : Line σ → Spacetime) : (1 + ‖q‖) ^ s * ‖integrand σ f q‖ ≤ bound σ s f := by
  by_cases hq : ∀ ℓ, q ℓ ∈ forwardCone
  · have hdecay :
        (∏ v : Fin n, (1 + ‖vertexMomentum σ q v‖)) ^ (degree σ + s) *
            (∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖) ≤
          ∏ v : Fin n, fourierBound (degree σ + s) (f v) := by
      rw [← Finset.prod_pow, ← Finset.prod_mul_distrib]
      exact Finset.prod_le_prod (fun v _ => by positivity) fun v _ => fourier_decay _ _ _
    calc
      _ = (1 + ‖q‖) ^ s * (‖kernel σ q‖ *
          ∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖) := by
        rw [integrand, norm_mul, norm_prod]
      _ ≤ (1 + ‖q‖) ^ s * ((1 + ‖q‖) ^ degree σ *
          ∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖) := by
        gcongr
        exact norm_kernel_le σ q
      _ = (1 + ‖q‖) ^ (degree σ + s) *
          ∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖ := by
        rw [pow_add]
        ring
      _ ≤ ((1 + 2 * n * n) * ∏ v : Fin n, (1 + ‖vertexMomentum σ q v‖)) ^
          (degree σ + s) * ∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖ := by
        gcongr
        exact one_add_norm_le_vertex_prod σ q hq
      _ = (1 + 2 * n * n : ℝ) ^ (degree σ + s) *
          ((∏ v : Fin n, (1 + ‖vertexMomentum σ q v‖)) ^ (degree σ + s) *
            ∏ v : Fin n, ‖fourierE (f v) (vertexMomentum σ q v)‖) := by
        rw [mul_pow, mul_assoc]
      _ ≤ bound σ s f := mul_le_mul_of_nonneg_left hdecay (by positivity)
  · rw [integrand_eq_zero_off_cone σ f q hq, norm_zero, mul_zero]
    exact bound_nonneg σ s f

theorem integrand_le (σ : Matching m) (s : ℕ) (f : Fin n → TestFunction)
    (q : Line σ → Spacetime) :
    ‖integrand σ f q‖ ≤ bound σ s f * ((1 + ‖q‖) ^ s)⁻¹ := by
  rw [← div_eq_mul_inv, le_div_iff₀ (by positivity)]
  simpa only [mul_comm] using weighted_integrand_le σ s f q

/-- A decay exponent strictly larger than the dimension of the line-momentum space. -/
def tailPower (σ : Matching m) : ℕ := Module.finrank ℝ (Line σ → Spacetime) + 1

theorem integrable_tail (σ : Matching m) :
    Integrable (fun q : Line σ → Spacetime => ((1 + ‖q‖) ^ tailPower σ)⁻¹) := by
  have hdim : (Module.finrank ℝ (Line σ → Spacetime) : ℝ) < (tailPower σ : ℝ) := by
    unfold tailPower
    exact_mod_cast Nat.lt_succ_self _
  have h := integrable_one_add_norm (μ := (volume : Measure (Line σ → Spacetime))) hdim
  convert h using 1
  ext q
  rw [Real.rpow_neg (by positivity), Real.rpow_natCast]

theorem integrable_integrand (σ : Matching m) (f : Fin n → TestFunction) :
    Integrable (integrand σ f) := by
  apply ((integrable_tail σ).const_mul (bound σ (tailPower σ) f)).mono'
    (measurable_integrand σ f).aestronglyMeasurable
  exact ae_of_all _ (integrand_le σ (tailPower σ) f)

end MatchingEstimates

variable {n : ℕ}

theorem matching_integrable' (m : Fin n → Mon) (σ : Matching m) (f : Fin n → TestFunction) :
    Integrable fun q : Line σ → Spacetime =>
      (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)) *
        ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v) := by
  exact MatchingEstimates.integrable_integrand σ f

namespace MatchingEstimates

variable {m : Fin n → Mon}

theorem continuous_matching_integral (σ : Matching m) :
    Continuous (fun f : Fin n → TestFunction => ∫ q : Line σ → Spacetime, integrand σ f q) := by
  apply continuous_iff_continuousAt.mpr
  intro f₀
  have hnear : ∀ᶠ f in 𝓝 f₀, bound σ (tailPower σ) f < bound σ (tailPower σ) f₀ + 1 :=
    (continuous_bound σ (tailPower σ)).tendsto f₀ (Iio_mem_nhds (lt_add_one _))
  apply continuousAt_of_dominated
    (bound := fun q : Line σ → Spacetime =>
      (bound σ (tailPower σ) f₀ + 1) * ((1 + ‖q‖) ^ tailPower σ)⁻¹)
  · exact Eventually.of_forall fun f => (measurable_integrand σ f).aestronglyMeasurable
  · filter_upwards [hnear] with f hf
    apply ae_of_all
    intro q
    exact (integrand_le σ (tailPower σ) f q).trans
      (mul_le_mul_of_nonneg_right hf.le (by positivity))
  · exact (integrable_tail σ).const_mul _
  · exact ae_of_all _ fun q => (continuous_integrand_test σ q).continuousAt

theorem continuous_wightmanMono (m : Fin n → Mon) :
    Continuous (wightmanMono m) := by
  unfold wightmanMono
  exact continuous_finsetSum _ fun σ _ => continuous_matching_integral σ

end MatchingEstimates

theorem wightmanL_continuous' (P : Fin n → (Mon →₀ ℂ)) :
    Continuous fun f : Fin n → TestFunction => wightmanL P f := by
  unfold wightmanL
  apply continuous_finsetSum
  intro m _
  exact (MatchingEstimates.continuous_wightmanMono m).const_mul _

end YangMills.FreeField.Consolidated.Analytic_MatchingIntegrable

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [HARD, 600 lines] **Absolute integrability of matching integrands (AI).**

Proof (directed cuts): for `j < n - 1` let `Q_j` be the sum of the momenta of the lines from a
vertex `≤ j` to a vertex `> j`; then `Q_j = -∑_{v ≤ j} k_v` with `k_v = vertexMomentum σ q v`.
On the support of the weights every `q ℓ` lies in the cone, so `(q ℓ)_t ≥ 0`, every line crosses
some cut, and `∑_ℓ (q ℓ)_t ≤ ∑_j (Q_j)_t ≤ (n - 1) ∑_v ‖k_v‖`. With `‖q ℓ‖ ≤ √2 (q ℓ)_t`:
`1 + ∑_ℓ ‖q ℓ‖ ≤ C ∏_v (1 + ‖k_v‖)`. The Schwartz decay of `fourierE (f v)` of order `N` then
bounds the integrand by `C ∏_ℓ (1 + ‖q ℓ‖)^{d_ℓ - N'}` on the product of cones, which is
integrable for large `N`. (A single vertex momentum may vanish while the lines through the vertex
are large; only the cuts control the lines.) -/
theorem matching_integrable (m : Fin n → Mon) (σ : Matching m) (f : Fin n → TestFunction) :
    Integrable fun q : Line σ → Spacetime =>
      (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)) *
        ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v) := by
  exact Consolidated.Analytic_MatchingIntegrable.matching_integrable' m σ f

/-- [HARD, 300 lines] The Wightman functions are jointly continuous in the tests (they are
multilinear and bounded by a product of Schwartz seminorms: the constants in the proof of
`matching_integrable` are seminorms of the `f v`). Shares its proof with
`matching_integrable`. -/
theorem wightmanL_continuous (P : Fin n → (Mon →₀ ℂ)) :
    Continuous fun f : Fin n → TestFunction => wightmanL P f := by
  exact Consolidated.Analytic_MatchingIntegrable.wightmanL_continuous' P

end YangMills.FreeField
