import FreeField.Hierarchy
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic

/-!
The short-distance asymptotic follows by scaling momentum by `r⁻¹` and applying
dominated convergence. The logarithmic quotient, after multiplication by the
Minkowski square `s`, lies between zero and `s + 1`. Consequently a dominating
function on the cone is `exp (-time p) * (time p ^ 2 + 1) ^ 2`.

Splitting off time and integrating radially in the three spatial coordinates
reduces both integrability and the limiting constant to elementary polynomial
integrals and the Euler integral for the Gamma function.
-/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical

namespace SrAsymptotic

lemma continuous_time : Continuous (time : Spacetime → ℝ) := by
  exact (EuclideanSpace.proj timeAxis).continuous

lemma continuous_spatial : Continuous (spatial : Spacetime → Space) := by
  exact (PiLp.continuous_toLp 2 _).comp
    (continuous_pi fun i => (EuclideanSpace.proj i.castSucc).continuous)

lemma continuous_square : Continuous (minkowskiSquare : Spacetime → ℝ) :=
  (continuous_time.pow 2).sub (continuous_spatial.norm.pow 2)

lemma measurable_cone : MeasurableSet forwardCone :=
  (isClosed_le continuous_spatial.norm continuous_time).measurableSet

lemma cone_nonneg {p : Spacetime} (hp : p ∈ forwardCone) :
    0 ≤ time p ∧ 0 ≤ minkowskiSquare p ∧ minkowskiSquare p ≤ time p ^ 2 := by
  have h : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans h
  dsimp [minkowskiSquare]
  exact ⟨ht, sub_nonneg.mpr (pow_le_pow_left₀ (norm_nonneg _) h 2),
    sub_le_self _ (sq_nonneg _)⟩

lemma time_smul (a : ℝ) (p : Spacetime) : time (a • p) = a * time p := rfl

lemma spatial_smul (a : ℝ) (p : Spacetime) : spatial (a • p) = a • spatial p := rfl

lemma square_smul (a : ℝ) (p : Spacetime) :
    minkowskiSquare (a • p) = a ^ 2 * minkowskiSquare p := by
  simp only [minkowskiSquare, time_smul, spatial_smul, norm_smul, Real.norm_eq_abs,
    mul_pow, sq_abs]
  ring

lemma smul_mem_cone (a : ℝ) (ha : 0 < a) (p : Spacetime) :
    a • p ∈ forwardCone ↔ p ∈ forwardCone := by
  simp only [forwardCone, mem_setOf_eq, spatial_smul, time_smul, norm_smul,
    Real.norm_eq_abs, abs_of_pos ha, mul_le_mul_iff_right₀ ha]

lemma log_lower (s : ℝ) (hs : 0 ≤ s) : 1 ≤ Real.log (Real.exp 1 + s) := by
  calc
    1 = Real.log (Real.exp 1) := (Real.log_exp 1).symm
    _ ≤ Real.log (Real.exp 1 + s) := Real.log_le_log (Real.exp_pos _) (le_add_of_nonneg_right hs)

def scaled (r : ℝ) (p : Spacetime) : ℝ :=
  if p ∈ forwardCone then
    Real.exp (-time p) * minkowskiSquare p ^ 2 *
      (Real.log r⁻¹ / Real.log (Real.exp 1 + minkowskiSquare p / r ^ 2)) ^ 2
  else 0

def limitKernel (p : Spacetime) : ℝ :=
  if p ∈ forwardCone then Real.exp (-time p) * minkowskiSquare p ^ 2 / 4 else 0

def bound (p : Spacetime) : ℝ :=
  if p ∈ forwardCone then Real.exp (-time p) * (time p ^ 2 + 1) ^ 2 else 0

lemma log_ratio_bound {r s : ℝ} (hr : 0 < r) (hr1 : r < 1) (hs : 0 ≤ s) :
    0 ≤ s * (Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2)) ∧
    s * (Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2)) ≤ s + 1 := by
  have hL : 0 ≤ Real.log r⁻¹ := Real.log_nonneg (one_le_inv₀ hr |>.mpr hr1.le)
  have hD := log_lower (s / r ^ 2) (div_nonneg hs (sq_nonneg r))
  have hDpos : 0 < Real.log (Real.exp 1 + s / r ^ 2) := lt_of_lt_of_le zero_lt_one hD
  refine ⟨mul_nonneg hs (div_nonneg hL hDpos.le), ?_⟩
  by_cases hrs : r ≤ s
  · have hi : r⁻¹ ≤ Real.exp 1 + s / r ^ 2 := by
      have : r⁻¹ ≤ s / r ^ 2 := by
        apply (le_div_iff₀ (sq_pos_of_pos hr)).mpr
        field_simp
        nlinarith
      linarith [Real.exp_pos (1 : ℝ)]
    have hlog := Real.log_le_log (inv_pos.mpr hr) hi
    have hq : Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2) ≤ 1 :=
      (div_le_one hDpos).mpr hlog
    exact (mul_le_of_le_one_right hs hq).trans (by linarith)
  · by_cases hs0 : s = 0
    · simp [hs0]
    have hspos : 0 < s := lt_of_le_of_ne hs (Ne.symm hs0)
    have hlog : Real.log r⁻¹ ≤ s⁻¹ := by
      calc
        Real.log r⁻¹ ≤ Real.log s⁻¹ :=
          Real.log_le_log (inv_pos.mpr hr) (inv_anti₀ hspos (le_of_not_ge hrs))
        _ ≤ s⁻¹ := Real.log_le_self (inv_nonneg.mpr hs)
    have hq : Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2) ≤ Real.log r⁻¹ :=
      div_le_self hL hD
    calc
      s * (Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2)) ≤ s * s⁻¹ :=
        mul_le_mul_of_nonneg_left (hq.trans hlog) hs
      _ = 1 := mul_inv_cancel₀ hs0
      _ ≤ s + 1 := by linarith

lemma scaled_bound {r : ℝ} (hr : 0 < r) (hr1 : r < 1) (p : Spacetime) :
    ‖scaled r p‖ ≤ bound p := by
  by_cases hp : p ∈ forwardCone
  · obtain ⟨ht, hs, hst⟩ := cone_nonneg hp
    obtain ⟨ha, hb⟩ := log_ratio_bound hr hr1 hs
    have hc : (minkowskiSquare p *
        (Real.log r⁻¹ / Real.log (Real.exp 1 + minkowskiSquare p / r ^ 2))) ^ 2 ≤
        (time p ^ 2 + 1) ^ 2 :=
      pow_le_pow_left₀ ha (hb.trans (by linarith)) 2
    rw [scaled, bound, if_pos hp, if_pos hp, Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    nlinarith [mul_le_mul_of_nonneg_left hc (Real.exp_pos (-time p)).le]
  · simp [scaled, bound, hp]

lemma eventually_small : ∀ᶠ r : ℝ in 𝓝[>] 0, 0 < r ∧ r < 1 := by
  filter_upwards [self_mem_nhdsWithin, (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono
    nhdsWithin_le_nhds] with r hr hr1
  exact ⟨hr, hr1⟩

lemma log_ratio_tendsto {s : ℝ} (hs : 0 < s) :
    Tendsto (fun r : ℝ => Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2))
      (𝓝[>] 0) (𝓝 (1 / 2)) := by
  have hL : Tendsto (fun r : ℝ => Real.log r⁻¹) (𝓝[>] 0) atTop := by
    simpa only [Real.log_inv, Function.comp_def] using
      tendsto_neg_atBot_atTop.comp Real.tendsto_log_nhdsGT_zero
  have hsmall : Tendsto (fun r : ℝ => Real.log (Real.exp 1 * r ^ 2 + s))
      (𝓝[>] 0) (𝓝 (Real.log s)) := by
    apply (Real.continuousAt_log hs.ne').tendsto.comp
    simpa using (((tendsto_id : Tendsto (fun r : ℝ => r) (𝓝 0) (𝓝 0)).mono_left
      nhdsWithin_le_nhds).pow 2 |>.const_mul (Real.exp 1) |>.add_const s)
  have h := (tendsto_const_nhds.add (hsmall.div_atTop hL)).inv₀ (show (2 : ℝ) + 0 ≠ 0 by norm_num)
  have heq : (fun r : ℝ => Real.log r⁻¹ / Real.log (Real.exp 1 + s / r ^ 2)) =ᶠ[𝓝[>] 0]
      (fun r : ℝ => (2 + Real.log (Real.exp 1 * r ^ 2 + s) / Real.log r⁻¹)⁻¹) := by
    filter_upwards [eventually_small] with r hr
    have hr0 := hr.1.ne'
    have hL0 : Real.log r⁻¹ ≠ 0 :=
      (Real.log_pos (one_lt_inv₀ hr.1 |>.mpr hr.2)).ne'
    have hp : 0 < Real.exp 1 * r ^ 2 + s := by positivity
    have hid : Real.exp 1 + s / r ^ 2 = (Real.exp 1 * r ^ 2 + s) * (r⁻¹) ^ 2 := by
      field_simp
    rw [hid, Real.log_mul hp.ne' (pow_ne_zero 2 (inv_ne_zero hr0)), Real.log_pow]
    rw [show 2 + Real.log (Real.exp 1 * r ^ 2 + s) / Real.log r⁻¹ =
        (Real.log (Real.exp 1 * r ^ 2 + s) + 2 * Real.log r⁻¹) / Real.log r⁻¹ by
      rw [add_div, mul_div_cancel_right₀ _ hL0, add_comm], inv_div]
    norm_num
  apply Tendsto.congr' heq.symm
  simpa using h

lemma scaled_tendsto (p : Spacetime) :
    Tendsto (fun r : ℝ => scaled r p) (𝓝[>] 0) (𝓝 (limitKernel p)) := by
  by_cases hp : p ∈ forwardCone
  · obtain ⟨ht, hs, hst⟩ := cone_nonneg hp
    by_cases hs0 : minkowskiSquare p = 0
    · simp [scaled, limitKernel, hp, hs0]
    · have h := (log_ratio_tendsto (lt_of_le_of_ne hs (Ne.symm hs0))).pow 2
      convert! h.const_mul (Real.exp (-time p) * minkowskiSquare p ^ 2) using 1
      · simp [scaled, hp]
      · simp only [limitKernel, if_pos hp]
        congr 1
        ring
  · simp [scaled, limitKernel, hp]

lemma scaled_integral {r : ℝ} (hr : 0 < r) :
    r ^ 8 * (Real.log r⁻¹) ^ 2 * Sr r = ∫ p, scaled r p := by
  have hscale := Measure.integral_comp_inv_smul volume
    (fun p : Spacetime => Real.exp (-r * time p) * weight p) r
  have hdim : Module.finrank ℝ Spacetime = 4 := by simp
  rw [hdim, abs_of_nonneg (pow_nonneg hr.le 4), smul_eq_mul] at hscale
  have heq : ∀ p : Spacetime, scaled r p =
      (r ^ 4 * (Real.log r⁻¹) ^ 2) * (Real.exp (-r * time (r⁻¹ • p)) * weight (r⁻¹ • p)) := by
    intro p
    have hcone := smul_mem_cone r⁻¹ (inv_pos.mpr hr) p
    have ht : -r * time (r⁻¹ • p) = -time p := by rw [time_smul]; field_simp
    rw [ht, weight, scaled]
    by_cases hp : p ∈ forwardCone
    · rw [if_pos hp, if_pos (hcone.mpr hp), square_smul]
      simp only [div_pow, inv_pow]
      field_simp
    · rw [if_neg hp, if_neg (mt hcone.mp hp)]; ring
  simp_rw [heq]
  rw [integral_const_mul, hscale]
  dsimp [Sr]
  ring

/-- Split off the last (time) coordinate, preserving Lebesgue measure. -/
def split : Spacetime ≃ᵐ ℝ × Space :=
  ((MeasurableEquiv.toLp 2 (Fin 4 → ℝ)).symm.trans
    (MeasurableEquiv.piFinSuccAbove (fun _ : Fin 4 => ℝ) (Fin.last 3))).trans
    ((MeasurableEquiv.refl ℝ).prodCongr (MeasurableEquiv.toLp 2 (Fin 3 → ℝ)))

lemma split_apply (p : Spacetime) : split p = (time p, spatial p) := by
  change (p (Fin.last 3), WithLp.toLp 2 (fun i => p ((Fin.last 3).succAbove i))) = _
  simp only [Fin.succAbove_last]
  rfl

lemma split_preserving : MeasurePreserving split := by
  exact ((MeasurePreserving.id volume).prod (PiLp.volume_preserving_toLp (Fin 3))).comp
    ((volume_preserving_piFinSuccAbove (fun _ : Fin 4 => ℝ) (Fin.last 3)).comp
      (PiLp.volume_preserving_ofLp (Fin 4)))

lemma time_split_symm (q : ℝ × Space) : time (split.symm q) = q.1 := by
  have := congrArg Prod.fst (split.apply_symm_apply q)
  simpa only [split_apply] using this

lemma spatial_split_symm (q : ℝ × Space) : spatial (split.symm q) = q.2 := by
  have := congrArg Prod.snd (split.apply_symm_apply q)
  simpa only [split_apply] using this

lemma gamma_integrable (n : ℕ) :
    IntegrableOn (fun t : ℝ => Real.exp (-t) * t ^ n) (Ioi 0) := by
  simpa only [add_sub_cancel_right, Real.rpow_natCast] using
    (Real.GammaIntegral_convergent (s := (n : ℝ) + 1) (by positivity))

lemma gamma_integral (n : ℕ) :
    (∫ t : ℝ in Ioi 0, Real.exp (-t) * t ^ n) = n.factorial := by
  simpa only [add_sub_cancel_right, Real.rpow_natCast] using
    ((Real.Gamma_eq_integral (s := (n : ℝ) + 1) (by positivity)).symm.trans
      (Real.Gamma_nat_eq_factorial n))

lemma ball_integral_const (t c : ℝ) :
    (∫ x : Space, if ‖x‖ ≤ t then c else 0) =
      (if 0 < t then t ^ 3 * (Real.pi * 4 / 3) * c else 0) := by
  have heq : (fun x : Space => if ‖x‖ ≤ t then c else 0) =
      (Metric.closedBall (0 : Space) t).indicator (fun _ => c) := by
    ext x; simp [Set.indicator, Metric.mem_closedBall, dist_zero_right]
  rw [heq, integral_indicator measurableSet_closedBall, integral_const,
    Measure.real, Measure.restrict_apply_univ, EuclideanSpace.volume_closedBall_fin_three,
    ENNReal.toReal_mul,
    ENNReal.toReal_pow, ENNReal.toReal_ofReal (show 0 ≤ Real.pi * 4 / 3 by positivity)]
  by_cases ht : 0 < t
  · simp [ht, ENNReal.toReal_ofReal ht.le, smul_eq_mul]
  · simp [ht, ENNReal.ofReal_eq_zero.mpr (le_of_not_gt ht)]

lemma ball_integrable_const (t c : ℝ) :
    Integrable (fun x : Space => if ‖x‖ ≤ t then c else 0) := by
  have heq : (fun x : Space => if ‖x‖ ≤ t then c else 0) =
      (Metric.closedBall (0 : Space) t).indicator (fun _ => c) := by
    ext x; simp [Set.indicator, Metric.mem_closedBall, dist_zero_right]
  rw [heq, integrable_indicator_iff measurableSet_closedBall]
  exact integrableOn_const ((isCompact_closedBall (0 : Space) t).measure_lt_top.ne)

lemma bound_integrable : Integrable bound := by
  let f : ℝ × Space → ℝ := fun q =>
    if ‖q.2‖ ≤ q.1 then Real.exp (-q.1) * (q.1 ^ 2 + 1) ^ 2 else 0
  have hm : Measurable f := by
    apply Measurable.ite (isClosed_le continuous_snd.norm continuous_fst).measurableSet
    · fun_prop
    · fun_prop
  have hi : Integrable f := by
    apply (integrable_prod_iff hm.aestronglyMeasurable).mpr
    refine ⟨Eventually.of_forall (fun t => ball_integrable_const t
      (Real.exp (-t) * (t ^ 2 + 1) ^ 2)), ?_⟩
    have heq : (fun t : ℝ => ∫ x : Space, ‖f (t, x)‖) =
        (Ioi 0).indicator (fun t => (Real.pi * 4 / 3) *
          (Real.exp (-t) * t ^ 7 + 2 * (Real.exp (-t) * t ^ 5) + Real.exp (-t) * t ^ 3)) := by
      funext t
      have hn : ∀ x : Space, ‖f (t, x)‖ =
          if ‖x‖ ≤ t then Real.exp (-t) * (t ^ 2 + 1) ^ 2 else 0 := by
        intro x
        dsimp [f]
        split_ifs <;> exact abs_of_nonneg (by positivity)
      simp_rw [hn]
      rw [ball_integral_const]
      by_cases ht : 0 < t <;> simp only [Set.indicator, mem_Ioi, ht, if_true, if_false]
      ring
    rw [heq, integrable_indicator_iff measurableSet_Ioi]
    exact (((gamma_integrable 7).add ((gamma_integrable 5).const_mul 2)).add
      (gamma_integrable 3)).const_mul _
  have heq : bound = f ∘ split := by
    funext p
    simp [bound, f, split_apply, forwardCone]
  rw [heq]
  exact split_preserving.integrable_comp_of_integrable hi

lemma scaled_measurable (r : ℝ) : Measurable (scaled r) := by
  have ht := continuous_time.measurable
  have hs := continuous_square.measurable
  unfold scaled
  apply Measurable.ite measurable_cone
  · fun_prop
  · fun_prop

lemma limitKernel_measurable : Measurable limitKernel := by
  have ht := continuous_time.measurable
  have hs := continuous_square.measurable
  unfold limitKernel
  apply Measurable.ite measurable_cone
  · fun_prop
  · fun_prop

lemma limitKernel_integrable : Integrable limitKernel := by
  apply bound_integrable.mono' limitKernel_measurable.aestronglyMeasurable
  apply Eventually.of_forall
  intro p
  by_cases hp : p ∈ forwardCone
  · obtain ⟨ht, hs, hst⟩ := cone_nonneg hp
    rw [limitKernel, bound, if_pos hp, if_pos hp, Real.norm_eq_abs,
      abs_of_nonneg (by positivity)]
    have hsq := pow_le_pow_left₀ hs hst 2
    have he := Real.exp_pos (-time p)
    nlinarith [mul_le_mul_of_nonneg_left hsq he.le,
      mul_nonneg he.le (sq_nonneg (time p)), sq_nonneg (minkowskiSquare p)]
  · simp [limitKernel, bound, hp]

lemma integral_tendsto :
    Tendsto (fun r : ℝ => ∫ p, scaled r p) (𝓝[>] 0) (𝓝 (∫ p, limitKernel p)) := by
  apply tendsto_integral_filter_of_dominated_convergence bound
  · exact Eventually.of_forall fun r => (scaled_measurable r).aestronglyMeasurable
  · filter_upwards [eventually_small] with r hr
    exact Eventually.of_forall (scaled_bound hr.1 hr.2)
  · exact bound_integrable
  · exact Eventually.of_forall scaled_tendsto

lemma polynomial_integral (t : ℝ) :
    (∫ k : ℝ in 0..t, k ^ 2 * (t ^ 2 - k ^ 2) ^ 2) = (8 / 105 : ℝ) * t ^ 7 := by
  have hd (k : ℝ) : HasDerivAt
      (fun x : ℝ => (t ^ 4 / 3) * x ^ 3 - (2 * t ^ 2 / 5) * x ^ 5 + x ^ 7 / 7)
      (k ^ 2 * (t ^ 2 - k ^ 2) ^ 2) k := by
    convert! (((hasDerivAt_pow 3 k).const_mul (t ^ 4 / 3)).sub
      ((hasDerivAt_pow 5 k).const_mul (2 * t ^ 2 / 5))).add
      ((hasDerivAt_pow 7 k).div_const 7) using 1
    norm_num
    ring
  have hi : IntervalIntegrable (fun k : ℝ => k ^ 2 * (t ^ 2 - k ^ 2) ^ 2) volume 0 t :=
    (by fun_prop : Continuous (fun k : ℝ => k ^ 2 * (t ^ 2 - k ^ 2) ^ 2)).intervalIntegrable _ _
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun k _ => hd k) hi]
  ring

lemma spatial_polynomial_integral {t : ℝ} (ht : 0 ≤ t) :
    (∫ x : Space, if ‖x‖ ≤ t then (t ^ 2 - ‖x‖ ^ 2) ^ 2 else 0) =
      (32 * Real.pi / 105) * t ^ 7 := by
  let g : ℝ → ℝ := fun k => if k ≤ t then (t ^ 2 - k ^ 2) ^ 2 else 0
  change (∫ x : Space, g ‖x‖) = _
  rw [integral_fun_norm_addHaar (volume : Measure Space) g]
  have hv : volume.real (Metric.ball (0 : Space) 1) = Real.pi * 4 / 3 := by
    simp [Measure.real, EuclideanSpace.volume_ball_fin_three,
      ENNReal.toReal_ofReal (show 0 ≤ Real.pi * 4 / 3 by positivity)]
  have hdim : Module.finrank ℝ Space = 3 := by simp
  rw [hdim, hv]
  norm_num only [Nat.reduceSub, nsmul_eq_mul, smul_eq_mul, Nat.cast_ofNat]
  have heq : (fun k : ℝ => k ^ 2 * g k) =
      (Iic t).indicator (fun k => k ^ 2 * (t ^ 2 - k ^ 2) ^ 2) := by
    ext k
    simp only [g, Set.indicator, mem_Iic, mul_ite, mul_zero]
  rw [heq, setIntegral_indicator measurableSet_Iic, Ioi_inter_Iic,
    ← intervalIntegral.integral_of_le ht, polynomial_integral]
  ring

lemma limitKernel_slice (t : ℝ) :
    (∫ x : Space, limitKernel (split.symm (t, x))) =
      if 0 < t then (8 * Real.pi / 105) * (Real.exp (-t) * t ^ 7) else 0 := by
  have heq : (fun x : Space => limitKernel (split.symm (t, x))) =
      fun x => (Real.exp (-t) / 4) *
        (if ‖x‖ ≤ t then (t ^ 2 - ‖x‖ ^ 2) ^ 2 else 0) := by
    funext x
    simp only [limitKernel, forwardCone, mem_setOf_eq, minkowskiSquare,
      time_split_symm, spatial_split_symm]
    split_ifs <;> ring
  rw [heq, integral_const_mul]
  by_cases ht : 0 ≤ t
  · rw [spatial_polynomial_integral ht]
    by_cases ht' : 0 < t
    · rw [if_pos ht']; ring
    · have ht0 : t = 0 := le_antisymm (le_of_not_gt ht') ht
      simp [ht0]
  · have hn : ∀ x : Space, ¬ ‖x‖ ≤ t := fun x hx => ht ((norm_nonneg x).trans hx)
    simp [hn, not_lt.mpr (le_of_not_ge ht)]

lemma limitKernel_integral : (∫ p, limitKernel p) = 384 * Real.pi := by
  have hi : Integrable (fun q : ℝ × Space => limitKernel (split.symm q)) :=
    split_preserving.symm.integrable_comp_of_integrable limitKernel_integrable
  calc
    (∫ p, limitKernel p) = ∫ q : ℝ × Space, limitKernel (split.symm q) :=
      (split_preserving.symm.integral_comp split.symm.measurableEmbedding limitKernel).symm
    _ = ∫ t : ℝ, ∫ x : Space, limitKernel (split.symm (t, x)) := integral_prod _ hi
    _ = ∫ t : ℝ in Ioi 0, (8 * Real.pi / 105) * (Real.exp (-t) * t ^ 7) := by
      simp_rw [limitKernel_slice]
      exact integral_indicator measurableSet_Ioi
    _ = 384 * Real.pi := by
      rw [integral_const_mul, gamma_integral]
      norm_num
      ring

end SrAsymptotic

theorem Sr_asymptotic' :
    Tendsto (fun r : ℝ => r ^ 8 * (Real.log r⁻¹) ^ 2 * Sr r) (𝓝[>] 0) (𝓝 (384 * Real.pi)) := by
  have h := SrAsymptotic.integral_tendsto
  rw [SrAsymptotic.limitKernel_integral] at h
  apply h.congr'
  filter_upwards [SrAsymptotic.eventually_small] with r hr
  exact (SrAsymptotic.scaled_integral hr.1).symm

end YangMills.FreeField

#print axioms YangMills.FreeField.Sr_asymptotic'
