import FreeField.Analytic.Base
import FreeField.Analytic.IntegrablePowExpWeight
import FreeField.Analytic.MuMapAdjoint
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.LineCDifferentiableOn

import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Analytic.IsolatedZeros
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

/-! Proofs consolidated from `FreeField/Work/Sr_euclid.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_SrEuclid
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

namespace EuclidWork

-- A boost followed by reflection in its spatial axis is an involution. This
-- makes its absolute determinant, and hence the change of variables, immediate.
def pack (v : Space) (t : ℝ) : Spacetime :=
  WithLp.toLp 2 (Fin.lastCases t fun i => v i)

@[simp] lemma time_pack (v : Space) (t : ℝ) : time (pack v t) = t := by
  simp [pack, time]

@[simp] lemma spatial_pack (v : Space) (t : ℝ) : spatial (pack v t) = v := by
  ext i
  simp [pack, spatial]

lemma spacetime_ext {p q : Spacetime} (hs : spatial p = spatial q)
    (ht : time p = time q) : p = q := by
  ext i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · exact ht
  · exact congrArg (fun v : Space => v j) hs

lemma time_add (p q : Spacetime) : time (p + q) = time p + time q := rfl
lemma time_smul (a : ℝ) (p : Spacetime) : time (a • p) = a * time p := rfl

lemma spatial_add (p q : Spacetime) : spatial (p + q) = spatial p + spatial q := rfl
lemma spatial_smul (a : ℝ) (p : Spacetime) : spatial (a • p) = a • spatial p := rfl

lemma time_continuous : Continuous time := (EuclideanSpace.proj timeAxis).continuous
lemma spatial_continuous : Continuous spatial :=
  (PiLp.continuous_toLp 2 _).comp
    (continuous_pi fun i => (EuclideanSpace.proj i.castSucc).continuous)

lemma spatial_norm_le (p : Spacetime) : ‖spatial p‖ ≤ ‖p‖ := by
  apply le_of_sq_le_sq _ (norm_nonneg _)
  simp only [EuclideanSpace.real_norm_sq_eq]
  change (∑ i : Fin 3, p i.castSucc ^ 2) ≤ ∑ i : Fin 4, p i ^ 2
  conv_rhs => rw [Fin.sum_univ_castSucc]
  exact le_add_of_nonneg_right (sq_nonneg _)

lemma axis_bound (e : Space) (he : ‖e‖ = 1) (p : Spacetime) :
    |⟪e, spatial p⟫_ℝ| ≤ ‖spatial p‖ := by
  simpa [he] using abs_real_inner_le_norm e (spatial p)

def reflectBoost (e : Space) (a b : ℝ) : Spacetime →ₗ[ℝ] Spacetime where
  toFun p := pack (spatial p + ((-a - 1) * ⟪e, spatial p⟫_ℝ + b * time p) • e)
    (a * time p - b * ⟪e, spatial p⟫_ℝ)
  map_add' p q := by
    apply spacetime_ext
    · simp only [spatial_pack, spatial_add, inner_add_right, time_add]
      module
    · simp only [time_pack, time_add, spatial_add, inner_add_right]
      ring
  map_smul' c p := by
    apply spacetime_ext
    · simp only [spatial_pack, spatial_smul, inner_smul_right, time_smul,
        RingHom.id_apply]
      module
    · simp only [time_pack, time_smul,
        spatial_smul, inner_smul_right, RingHom.id_apply]
      ring

@[simp] lemma reflectBoost_time (e : Space) (a b : ℝ) (p : Spacetime) :
    time (reflectBoost e a b p) = a * time p - b * ⟪e, spatial p⟫_ℝ := time_pack _ _

@[simp] lemma reflectBoost_spatial (e : Space) (a b : ℝ) (p : Spacetime) :
    spatial (reflectBoost e a b p) =
      spatial p + ((-a - 1) * ⟪e, spatial p⟫_ℝ + b * time p) • e := spatial_pack _ _

lemma reflectBoost_axis (e : Space) (he : ‖e‖ = 1) (a b : ℝ) (p : Spacetime) :
    ⟪e, spatial (reflectBoost e a b p)⟫_ℝ = -a * ⟪e, spatial p⟫_ℝ + b * time p := by
  simp [inner_add_right, inner_smul_right, he]
  ring

lemma reflectBoost_involutive (e : Space) (he : ‖e‖ = 1) (a b : ℝ)
    (hab : a ^ 2 - b ^ 2 = 1) : Involutive (reflectBoost e a b) := by
  intro p
  apply spacetime_ext
  · simp only [reflectBoost_spatial, inner_add_right, inner_smul_right,
      real_inner_self_eq_norm_sq, he, one_pow, mul_one, reflectBoost_time]
    have h₁ : (-a - 1) * ⟪e, spatial p⟫_ℝ + b * time p +
        ((-a - 1) * (⟪e, spatial p⟫_ℝ +
          ((-a - 1) * ⟪e, spatial p⟫_ℝ + b * time p)) +
            b * (a * time p - b * ⟪e, spatial p⟫_ℝ)) = 0 := by
      linear_combination ⟪e, spatial p⟫_ℝ * hab
    rw [add_assoc, ← add_smul, h₁, zero_smul, add_zero]
  · rw [reflectBoost_time, reflectBoost_time, reflectBoost_axis e he]
    linear_combination time p * hab

lemma reflectBoost_square (e : Space) (he : ‖e‖ = 1) (a b : ℝ)
    (hab : a ^ 2 - b ^ 2 = 1) (p : Spacetime) :
    minkowskiSquare (reflectBoost e a b p) = minkowskiSquare p := by
  simp only [minkowskiSquare, reflectBoost_time, reflectBoost_spatial,
    norm_add_sq_real, norm_smul, Real.norm_eq_abs, sq_abs,
    real_inner_smul_right, he, mul_one]
  rw [real_inner_comm (spatial p) e]
  linear_combination (time p ^ 2 - ⟪spatial p, e⟫_ℝ ^ 2) * hab

lemma reflectBoost_cone (e : Space) (he : ‖e‖ = 1) (a b : ℝ)
    (hab : a ^ 2 - b ^ 2 = 1) (ha : |b| ≤ a) (p : Spacetime) :
    reflectBoost e a b p ∈ forwardCone ↔ p ∈ forwardCone := by
  have preserves (q : Spacetime) (hq : q ∈ forwardCone) :
      reflectBoost e a b q ∈ forwardCone := by
    have ht : 0 ≤ time q := (norm_nonneg _).trans hq
    have hx : |⟪e, spatial q⟫_ℝ| ≤ time q := (axis_bound e he q).trans hq
    have ht' : 0 ≤ time (reflectBoost e a b q) := by
      rw [reflectBoost_time]
      have h : b * ⟪e, spatial q⟫_ℝ ≤ |b| * time q :=
        (le_abs_self _).trans (by rw [abs_mul]; gcongr)
      nlinarith
    have hs := reflectBoost_square e he a b hab q
    change ‖spatial (reflectBoost e a b q)‖ ≤ time (reflectBoost e a b q)
    apply le_of_sq_le_sq _ ht'
    dsimp [minkowskiSquare] at hs
    nlinarith [sq_le_sq₀ (norm_nonneg (spatial q)) ht |>.2 hq]
  exact ⟨fun h => by simpa [reflectBoost_involutive e he a b hab p] using preserves _ h,
    preserves p⟩

lemma reflectBoost_weight (e : Space) (he : ‖e‖ = 1) (a b : ℝ)
    (hab : a ^ 2 - b ^ 2 = 1) (ha : |b| ≤ a) (p : Spacetime) :
    weight (reflectBoost e a b p) = weight p := by
  simp only [weight, reflectBoost_cone e he a b hab ha, reflectBoost_square e he a b hab]

lemma reflectBoost_integral (e : Space) (he : ‖e‖ = 1) (a b : ℝ)
    (hab : a ^ 2 - b ^ 2 = 1) (f : Spacetime → ℂ) :
    (∫ p, f (reflectBoost e a b p)) = ∫ p, f p := by
  let L := reflectBoost e a b
  have hi : Involutive L := reflectBoost_involutive e he a b hab
  have hLL : L.comp L = LinearMap.id := by ext p : 1; exact hi p
  have hd : LinearMap.det L * LinearMap.det L = 1 := by
    rw [← LinearMap.det_comp, hLL, LinearMap.det_id]
  have hd₀ : LinearMap.det L ≠ 0 := by intro h; simp [h] at hd
  have habs : |LinearMap.det L| = 1 := by
    nlinarith [sq_abs (LinearMap.det L), abs_nonneg (LinearMap.det L)]
  have hm : Measure.map L volume = (volume : Measure Spacetime) := by
    rw [Measure.map_linearMap_addHaar_eq_smul_addHaar volume hd₀,
      abs_inv, habs, inv_one, ENNReal.ofReal_one, one_smul]
  let E : Spacetime ≃L[ℝ] Spacetime :=
    { toLinearEquiv := { L with invFun := L, left_inv := hi, right_inv := hi }
      continuous_toFun := L.continuous_of_finiteDimensional
      continuous_invFun := L.continuous_of_finiteDimensional }
  exact MeasurePreserving.integral_comp
    ⟨L.continuous_of_finiteDimensional.measurable, hm⟩
    E.toHomeomorph.measurableEmbedding f

lemma real_boost {τ s : ℝ} (hs : |s| < τ)
    (e : Space) (he : ‖e‖ = 1) :
    (∫ p : Spacetime, Complex.exp (-(τ : ℂ) * (time p : ℂ) +
      (s : ℂ) * (⟪e, spatial p⟫_ℝ : ℂ)) * (weight p : ℂ)) =
    ∫ p : Spacetime, Complex.exp (-(Real.sqrt (τ ^ 2 - s ^ 2) : ℂ) *
      (time p : ℂ)) * (weight p : ℂ) := by
  let r := Real.sqrt (τ ^ 2 - s ^ 2)
  have hr₂ : 0 < τ ^ 2 - s ^ 2 := by nlinarith [abs_lt.mp hs, sq_abs s]
  have hr : 0 < r := Real.sqrt_pos.2 hr₂
  have hr₀ : r ≠ 0 := ne_of_gt hr
  have hrsq : r ^ 2 = τ ^ 2 - s ^ 2 := Real.sq_sqrt hr₂.le
  have hab : (τ / r) ^ 2 - (s / r) ^ 2 = 1 := by
    field_simp
    nlinarith
  have ha : |s / r| ≤ τ / r := by
    rw [abs_div, abs_of_pos hr]
    exact div_le_div_of_nonneg_right hs.le hr.le
  rw [← reflectBoost_integral e he (τ / r) (s / r) hab]
  apply integral_congr_ae
  filter_upwards [] with p
  rw [reflectBoost_weight e he _ _ hab ha, reflectBoost_time, reflectBoost_axis e he]
  congr 2
  have hphase : -τ * (τ / r * time p - s / r * ⟪e, spatial p⟫_ℝ) +
      s * (-(τ / r) * ⟪e, spatial p⟫_ℝ + s / r * time p) = -r * time p := by
    field_simp
    linear_combination time p * hrsq
  exact_mod_cast hphase

lemma laplace_real (r : ℝ) :
    (∫ p : Spacetime, Complex.exp (-(r : ℂ) * (time p : ℂ)) * (weight p : ℂ)) =
      (Sr r : ℂ) := by
  rw [Sr, ← integral_complex_ofReal]
  apply integral_congr_ae
  filter_upwards [] with p
  rw [Complex.ofReal_mul, Complex.ofReal_exp]
  congr 2
  push_cast
  ring

def kernel (τ : ℝ) (e : Space) (z : ℂ) (p : Spacetime) : ℂ :=
  Complex.exp (-(τ : ℂ) * (time p : ℂ) + z * (⟪e, spatial p⟫_ℝ : ℂ)) * (weight p : ℂ)

def fourierLaplace (τ : ℝ) (e : Space) (z : ℂ) : ℂ := ∫ p, kernel τ e z p

def laplace (w : ℂ) : ℂ :=
  ∫ p : Spacetime, Complex.exp (-w * (time p : ℂ)) * (weight p : ℂ)

lemma kernel_measurable (τ : ℝ) (e : Space) (z : ℂ) :
    AEStronglyMeasurable (kernel τ e z) volume := by
  have ht := time_continuous
  have hs := spatial_continuous
  have hc : Continuous (fun p : Spacetime =>
      Complex.exp (-(τ : ℂ) * (time p : ℂ) + z * (⟪e, spatial p⟫_ℝ : ℂ))) := by fun_prop
  exact (hc.measurable.mul (Complex.measurable_ofReal.comp measurable_weight)).aestronglyMeasurable

lemma kernel_bound (τ : ℝ) (e : Space) (he : ‖e‖ = 1) {z : ℂ} {r : ℝ}
    (hz : r ≤ τ - |z.re|) (p : Spacetime) :
    ‖kernel τ e z p‖ ≤ Real.exp (-r * time p) * weight p := by
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg _).trans hp
    have hx : |⟪e, spatial p⟫_ℝ| ≤ time p := (axis_bound e he p).trans hp
    have hprod : z.re * ⟪e, spatial p⟫_ℝ ≤ |z.re| * time p :=
      (le_abs_self _).trans (by rw [abs_mul]; gcongr)
    simp only [kernel, norm_mul, Complex.norm_exp, Complex.norm_real,
      Real.norm_eq_abs, abs_of_nonneg (weight_nonneg p)]
    apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
    apply Real.exp_le_exp.2
    simp only [Complex.add_re, Complex.mul_re, Complex.neg_re, Complex.ofReal_re,
      Complex.neg_im, Complex.ofReal_im, mul_zero, sub_zero]
    nlinarith
  · simp [kernel, weight_eq_zero hp]

lemma kernel_integrable (τ : ℝ) (e : Space) (he : ‖e‖ = 1) {z : ℂ}
    (hz : |z.re| < τ) : Integrable (kernel τ e z) := by
  apply (integrable_pow_exp_weight (sub_pos.2 hz) 0).mono' (kernel_measurable τ e z)
  filter_upwards [] with p
  simpa using kernel_bound τ e he (z := z) le_rfl p

lemma kernel_hasDerivAt (τ : ℝ) (e : Space) (z : ℂ) (p : Spacetime) :
    HasDerivAt (fun w => kernel τ e w p)
      (kernel τ e z p * (⟪e, spatial p⟫_ℝ : ℂ)) z := by
  have h := (((hasDerivAt_id z).mul_const (⟪e, spatial p⟫_ℝ : ℂ)).const_add
    (-(τ : ℂ) * (time p : ℂ))).cexp.mul_const (weight p : ℂ)
  simpa only [kernel, id_eq, one_mul, mul_comm, mul_left_comm, mul_assoc] using h

lemma kernel_derivative_bound (τ : ℝ) (e : Space) (he : ‖e‖ = 1) {z : ℂ} {r : ℝ}
    (hz : r ≤ τ - |z.re|) (p : Spacetime) :
    ‖kernel τ e z p * (⟪e, spatial p⟫_ℝ : ℂ)‖ ≤
      ‖p‖ ^ 1 * Real.exp (-r * time p) * weight p := by
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ (Real.exp (-r * time p) * weight p) * ‖p‖ :=
      mul_le_mul (kernel_bound τ e he hz p) ((axis_bound e he p).trans (spatial_norm_le p))
        (abs_nonneg _) (by positivity [weight_nonneg p])
    _ = _ := by ring

lemma fourierLaplace_differentiableAt (τ : ℝ) (e : Space) (he : ‖e‖ = 1) {z : ℂ}
    (hz : |z.re| < τ) : DifferentiableAt ℂ (fourierLaplace τ e) z := by
  let r := (τ - |z.re|) / 2
  have hr : 0 < r := half_pos (sub_pos.2 hz)
  have hs : {w : ℂ | |w.re| < τ - r} ∈ 𝓝 z :=
    (isOpen_lt Complex.continuous_re.abs continuous_const).mem_nhds (by dsimp [r]; linarith)
  apply (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := kernel τ e) (F' := fun w p => kernel τ e w p * (⟪e, spatial p⟫_ℝ : ℂ))
    (bound := fun p => ‖p‖ ^ 1 * Real.exp (-r * time p) * weight p)
    hs (Eventually.of_forall (kernel_measurable τ e)) (kernel_integrable τ e he hz)
    ?_ ?_ (integrable_pow_exp_weight hr 1) ?_).2.differentiableAt
  · apply (kernel_measurable τ e z).mul
    exact (Complex.continuous_ofReal.comp
      (continuous_const.inner spatial_continuous)).aestronglyMeasurable
  · exact ae_of_all _ fun p w hw => kernel_derivative_bound τ e he (by dsimp at hw; linarith) p
  · exact ae_of_all _ fun p w _ => kernel_hasDerivAt τ e w p

lemma laplace_eq_lineC (w : ℂ) : laplace w = lineC 0 0 (w * Complex.I) 0 := by
  apply integral_congr_ae
  filter_upwards [] with p
  simp only [Amono, Bmono, Pi.zero_apply, pow_zero, Finset.prod_const_one, mul_one,
    inner_zero_left, Complex.ofReal_zero, add_zero, one_mul]
  congr 2
  calc
    -w * (time p : ℂ) = w * (time p : ℂ) * (Complex.I * Complex.I) := by
      rw [Complex.I_mul_I]; ring
    _ = _ := by ring

lemma laplace_differentiableAt {w : ℂ} (hw : 0 < w.re) : DifferentiableAt ℂ laplace w := by
  have hc := (lineC_differentiableOn 0 0 0).differentiableAt
    ((isOpen_lt continuous_const Complex.continuous_im).mem_nhds
      (show 0 < (w * Complex.I).im by simpa using hw))
  have h := hc.comp w ((differentiableAt_id).mul_const Complex.I)
  simpa only [Function.comp_def, id_eq, ← laplace_eq_lineC] using h

def boostRoot (τ : ℝ) (z : ℂ) : ℂ := Complex.sqrt ((τ : ℂ) ^ 2 - z ^ 2)

lemma radicand_re_pos {τ : ℝ} {z : ℂ} (hz : |z.re| < τ) :
    0 < ((τ : ℂ) ^ 2 - z ^ 2).re := by
  have h := abs_lt.mp hz
  simp only [pow_two, Complex.sub_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
    mul_zero, sub_zero]
  nlinarith [sq_nonneg z.im, sq_abs z.re]

lemma boostRoot_re_pos {τ : ℝ} {z : ℂ} (hz : |z.re| < τ) :
    0 < (boostRoot τ z).re := by
  rw [boostRoot, Complex.sqrt, Complex.cpow_inv_two_re]
  apply Real.sqrt_pos.2
  have h := radicand_re_pos hz
  positivity

lemma boostRoot_sq (τ : ℝ) (z : ℂ) :
    boostRoot τ z ^ 2 = (τ : ℂ) ^ 2 - z ^ 2 :=
  Complex.cpow_nat_inv_pow _ (by norm_num : (2 : ℕ) ≠ 0)

lemma boostRoot_unique {τ : ℝ} {z w : ℂ} (hz : |z.re| < τ) (hw : 0 < w.re)
    (hsq : w ^ 2 = (τ : ℂ) ^ 2 - z ^ 2) : boostRoot τ z = w := by
  have h : boostRoot τ z ^ 2 = w ^ 2 := (boostRoot_sq τ z).trans hsq.symm
  rcases eq_or_eq_neg_of_sq_eq_sq _ _ h with h | h
  · exact h
  · have hp := boostRoot_re_pos hz
    rw [h, Complex.neg_re] at hp
    linarith

lemma boostRoot_real {τ s : ℝ} (hs : |s| < τ) :
    boostRoot τ s = (Real.sqrt (τ ^ 2 - s ^ 2) : ℂ) := by
  have hp : 0 < τ ^ 2 - s ^ 2 := by nlinarith [abs_lt.mp hs, sq_abs s]
  apply boostRoot_unique (by simpa using hs) (Real.sqrt_pos.2 hp)
  rw [← Complex.ofReal_pow, Real.sq_sqrt hp.le]
  push_cast
  rfl

lemma boostRoot_differentiableAt {τ : ℝ} {z : ℂ} (hz : |z.re| < τ) :
    DifferentiableAt ℂ (boostRoot τ) z := by
  exact (Complex.differentiableAt_sqrt (Or.inl (radicand_re_pos hz))).comp z
    (differentiableAt_const _ |>.sub (differentiableAt_id.pow 2))

lemma strip_convex (τ : ℝ) : Convex ℝ {z : ℂ | |z.re| < τ} := by
  have h := (convex_Ioo (-τ) τ).linear_preimage Complex.reLm
  change Convex ℝ {z : ℂ | -τ < z.re ∧ z.re < τ} at h
  simpa only [← abs_lt] using h

lemma fourierLaplace_eq_laplace_root {τ : ℝ} (hτ : 0 < τ)
    (e : Space) (he : ‖e‖ = 1) {z : ℂ} (hz : |z.re| < τ) :
    fourierLaplace τ e z = laplace (boostRoot τ z) := by
  have hopen : IsOpen {z : ℂ | |z.re| < τ} :=
    isOpen_lt Complex.continuous_re.abs continuous_const
  have hf : AnalyticOnNhd ℂ (fourierLaplace τ e) {z : ℂ | |z.re| < τ} :=
    (show DifferentiableOn ℂ (fourierLaplace τ e) {z : ℂ | |z.re| < τ} from
      fun w hw => (fourierLaplace_differentiableAt τ e he hw).differentiableWithinAt).analyticOnNhd hopen
  have hg : AnalyticOnNhd ℂ (fun w => laplace (boostRoot τ w)) {z : ℂ | |z.re| < τ} :=
    (show DifferentiableOn ℂ (fun w => laplace (boostRoot τ w)) {z : ℂ | |z.re| < τ} from
      fun w hw => ((laplace_differentiableAt (boostRoot_re_pos hw)).comp w
        (boostRoot_differentiableAt hw)).differentiableWithinAt).analyticOnNhd hopen
  have hreal (s : ℝ) (hs : |s| < τ) :
      fourierLaplace τ e s = laplace (boostRoot τ s) := by
    rw [boostRoot_real hs]
    exact real_boost hs e he
  apply hf.eqOn_of_preconnected_of_mem_closure hg (strip_convex τ).isPreconnected
    (show (0 : ℂ) ∈ {z : ℂ | |z.re| < τ} by simpa using hτ) ?_ hz
  rw [Metric.mem_closure_iff]
  intro ε hε
  let s := min τ ε / 2
  have hs : 0 < s := half_pos (lt_min hτ hε)
  have hsτ : s < τ := lt_of_lt_of_le (half_lt_self (lt_min hτ hε)) (min_le_left _ _)
  have hsε : s < ε := lt_of_lt_of_le (half_lt_self (lt_min hτ hε)) (min_le_right _ _)
  refine ⟨(s : ℂ), ⟨hreal s (by rwa [abs_of_pos hs]), ?_⟩, ?_⟩
  · simpa using ne_of_gt hs
  · simpa [dist_zero_left, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hs] using hsε

/-- Continue the real boost identity through the connected strip `|re z| < τ`.
The condition on `w` selects the square-root branch with positive real part. -/
lemma complex_boost {τ : ℝ} (hτ : 0 < τ) (e : Space) (he : ‖e‖ = 1)
    (z w : ℂ) (hz : |z.re| < τ) (hw : 0 < w.re)
    (hsq : w ^ 2 = (τ : ℂ) ^ 2 - z ^ 2) :
    (∫ p : Spacetime, Complex.exp (-(τ : ℂ) * (time p : ℂ) +
      z * (⟪e, spatial p⟫_ℝ : ℂ)) * (weight p : ℂ)) =
    ∫ p : Spacetime, Complex.exp (-w * (time p : ℂ)) * (weight p : ℂ) := by
  have h := fourierLaplace_eq_laplace_root hτ e he hz
  rw [boostRoot_unique hz hw hsq] at h
  exact h

lemma zero_spatial {τ : ℝ} (hτ : 0 < τ) :
    (∫ p : Spacetime, Complex.exp (-((τ * time p : ℝ) : ℂ) +
        Complex.I * ((⟪(0 : Space), spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ)) =
      (Sr (Real.sqrt (τ ^ 2 + ‖(0 : Space)‖ ^ 2)) : ℂ) := by
  simpa [Real.sqrt_sq hτ.le] using laplace_real τ

end EuclidWork

theorem Sr_euclid' {τ : ℝ} (hτ : 0 < τ) (u : Space) :
    ∫ p : Spacetime, Complex.exp (-((τ * time p : ℝ) : ℂ) +
        Complex.I * ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) =
      (Sr (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2)) : ℂ) := by
  by_cases hu : u = 0
  · subst u
    exact EuclidWork.zero_spatial hτ
  let e : Space := ‖u‖⁻¹ • u
  have he : ‖e‖ = 1 := norm_smul_inv_norm hu
  have hu' : ‖u‖ • e = u := by
    simp [e, smul_smul, norm_ne_zero_iff.mpr hu]
  have hr : 0 < Real.sqrt (τ ^ 2 + ‖u‖ ^ 2) :=
    Real.sqrt_pos.2 (by positivity)
  have hs : (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2) : ℂ) ^ 2 =
      (τ : ℂ) ^ 2 - (Complex.I * (‖u‖ : ℂ)) ^ 2 := by
    rw [mul_pow, Complex.I_sq, ← Complex.ofReal_pow,
      Real.sq_sqrt (by positivity)]
    push_cast
    ring
  have h := EuclidWork.complex_boost hτ e he (Complex.I * (‖u‖ : ℂ))
    (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2)) (by simpa using hτ) hr hs
  rw [EuclidWork.laplace_real] at h
  convert h using 1
  apply integral_congr_ae
  filter_upwards [] with p
  have hi : ⟪u, spatial p⟫_ℝ = ‖u‖ * ⟪e, spatial p⟫_ℝ := by
    conv_lhs => rw [← hu']
    exact real_inner_smul_left _ _ _
  rw [hi]
  push_cast
  ring_nf

end YangMills.FreeField.Consolidated.Analytic_SrEuclid

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [HARD, 400 lines] **Euclidean invariance (EI).** For `τ > 0` the Fourier–Laplace transform of
the one-particle measure at `(u, τ)` depends only on `τ² + ‖u‖²`.

Proof: fix `τ` and a unit vector `e` with `u = ‖u‖ e`. `G s = ∫ exp (-τ p_t + s ⟪e, 𝐩⟫) weight p`
is holomorphic on the strip `|re s| < τ` (domination by `integrable_pow_exp_weight`, since
`|⟪e,𝐩⟫| ≤ p_t` on the cone). For real `s` it equals `Sr (sqrt (τ² - s²))` by the boost in the
`(e, t)` plane mapping `(-s e, τ)` to `(0, sqrt (τ² - s²))` and `mu_map_adjoint`. `Sr` extends
holomorphically to `re z > 0`, and `s ↦ sqrt (τ² - s²)` maps the strip into `re > 0`. The identity
theorem (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`) gives equality at `s = i ‖u‖`.
Sign check: at `u = 0` both sides are `Sr τ` by definition. -/
theorem Sr_euclid {τ : ℝ} (hτ : 0 < τ) (u : Space) :
    ∫ p : Spacetime, Complex.exp (-((τ * time p : ℝ) : ℂ) +
        Complex.I * ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) =
      (Sr (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2)) : ℂ) := by
  exact Consolidated.Analytic_SrEuclid.Sr_euclid' hτ u

end YangMills.FreeField
