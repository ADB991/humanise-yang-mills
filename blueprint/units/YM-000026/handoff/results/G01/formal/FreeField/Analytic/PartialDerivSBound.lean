import FreeField.Analytic.Base
import FreeField.Analytic.WeightLe
import FreeField.Analytic.MeasurableWeight
import FreeField.Analytic.IntegrablePowExpWeight
import FreeField.Analytic.SContDiffOn

import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Calculus.ContDiff.Deriv
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.MeasureTheory.Constructions.HaarToSphere
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
import Mathlib.Analysis.Calculus.ContDiff.Bounds

/-! Proofs consolidated from `FreeField/Work/partialDeriv_S_bound.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_PartialDerivSBound
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private def laplaceMoment (k : ℕ) (r : ℝ) : ℝ :=
  ∫ p : Spacetime, (-time p) ^ k * Real.exp (-r * time p) * weight p

private theorem laplace_integrand_bound (k : ℕ) {a r : ℝ} (har : a ≤ r)
    (p : Spacetime) :
    ‖(-time p) ^ k * Real.exp (-r * time p) * weight p‖ ≤
      ‖p‖ ^ k * Real.exp (-a * time p) * weight p := by
  by_cases hp : p ∈ forwardCone
  · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
    have htn : |time p| ≤ ‖p‖ := PiLp.norm_apply_le p timeAxis
    simp only [norm_mul, norm_pow, norm_neg, Real.norm_eq_abs,
      abs_of_pos (Real.exp_pos _), abs_of_nonneg (weight_nonneg p)]
    apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
    apply mul_le_mul (pow_le_pow_left₀ (abs_nonneg _) htn k)
    · exact Real.exp_le_exp.mpr (by nlinarith)
    · positivity
    · positivity
  · simp only [weight_eq_zero hp, mul_zero, norm_zero, le_refl]

private theorem laplace_integrand_measurable (k : ℕ) (r : ℝ) :
    AEStronglyMeasurable
      (fun p : Spacetime => (-time p) ^ k * Real.exp (-r * time p) * weight p) volume := by
  have ht : Continuous time := by unfold time; fun_prop
  exact (((ht.neg.pow k).mul (continuous_const.mul ht).rexp).measurable.mul
    measurable_weight).aestronglyMeasurable

private theorem laplace_integrand_integrable (k : ℕ) {r : ℝ} (hr : 0 < r) :
    Integrable (fun p : Spacetime => (-time p) ^ k * Real.exp (-r * time p) * weight p) := by
  exact (integrable_pow_exp_weight hr k).mono' (laplace_integrand_measurable k r)
    (ae_of_all _ (laplace_integrand_bound k le_rfl))

private theorem laplaceMoment_hasDerivAt (k : ℕ) {r : ℝ} (hr : 0 < r) :
    HasDerivAt (laplaceMoment k) (laplaceMoment (k + 1) r) r := by
  have hhalf : 0 < r / 2 := by positivity
  refine (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := fun s p => (-time p) ^ k * Real.exp (-s * time p) * weight p)
    (F' := fun s p => (-time p) ^ (k + 1) * Real.exp (-s * time p) * weight p)
    (s := Ioi (r / 2)) (bound := fun p : Spacetime =>
      ‖p‖ ^ (k + 1) * Real.exp (-(r / 2) * time p) * weight p)
    (Ioi_mem_nhds (by linarith))
    (Eventually.of_forall (laplace_integrand_measurable k))
    (laplace_integrand_integrable k hr)
    (laplace_integrand_measurable (k + 1) r)
    (ae_of_all _ (fun p s hs => laplace_integrand_bound (k + 1) hs.le p))
    (integrable_pow_exp_weight hhalf (k + 1)) ?_).2
  apply ae_of_all
  intro p s _
  convert (((hasDerivAt_id s).neg.mul_const (time p)).exp.const_mul
    ((-time p) ^ k)).mul_const (weight p) using 1 <;> try rfl
  simp only [Pi.neg_apply, id_eq, pow_succ]
  ring

private theorem laplaceMoment_contDiffOn (k : ℕ) :
    ContDiffOn ℝ ∞ (laplaceMoment k) (Ioi 0) := by
  apply contDiffOn_infty.mpr
  intro n
  induction n generalizing k with
  | zero =>
      apply contDiffOn_zero.mpr
      intro r hr
      exact (laplaceMoment_hasDerivAt k hr).continuousAt.continuousWithinAt
  | succ n ih =>
      rw [Nat.cast_add, Nat.cast_one, contDiffOn_succ_iff_deriv_of_isOpen isOpen_Ioi]
      refine ⟨fun r hr => (laplaceMoment_hasDerivAt k hr).differentiableAt.differentiableWithinAt,
        ?_, ?_⟩
      · simp
      · exact (ih (k + 1)).congr (fun r hr => (laplaceMoment_hasDerivAt k hr).deriv)

private theorem bound_cone_norm {p : Spacetime} (hp : p ∈ forwardCone) :
    ‖p‖ ≤ 2 * time p := by
  have hs : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans hs
  have hn : ‖p‖ ^ 2 = ‖spatial p‖ ^ 2 + time p ^ 2 := by
    rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
      Fin.sum_univ_castSucc]
    rfl
  nlinarith [norm_nonneg p, norm_nonneg (spatial p)]

private theorem bound_integrable_radial {a : ℝ} (ha : 0 < a) (n : ℕ) :
    Integrable (fun p : Spacetime => ‖p‖ ^ n * Real.exp (-a * ‖p‖)) := by
  apply (integrable_fun_norm_addHaar (volume : Measure Spacetime)
    (f := fun t => t ^ n * Real.exp (-a * t))).2
  have h := integrableOn_rpow_mul_exp_neg_mul_rpow
    (s := (3 + n : ℕ)) (p := 1)
    (by exact lt_of_lt_of_le (by norm_num) (Nat.cast_nonneg _)) le_rfl ha
  convert h using 1
  ext t
  simp only [finrank_euclideanSpace, Fintype.card_fin, Nat.reduceSub,
    smul_eq_mul, Real.rpow_natCast, Real.rpow_one, ← mul_assoc, ← pow_add]

private theorem bound_radial_integral_scale (n : ℕ) {r : ℝ} (hr : 0 < r) :
    (∫ p : Spacetime, ‖p‖ ^ n * Real.exp (-(r / 2) * ‖p‖)) =
      (∫ p : Spacetime, ‖p‖ ^ n * Real.exp (-(1 / 2 : ℝ) * ‖p‖)) / r ^ (n + 4) := by
  have hscale := Measure.integral_comp_smul_of_nonneg (volume : Measure Spacetime)
    (fun p : Spacetime => ‖p‖ ^ n * Real.exp (-(1 / 2 : ℝ) * ‖p‖)) r (hR := hr.le)
  simp only [norm_smul, Real.norm_eq_abs, abs_of_pos hr, mul_pow,
    finrank_euclideanSpace, Fintype.card_fin, smul_eq_mul] at hscale
  have he (p : Spacetime) :
      r ^ n * ‖p‖ ^ n * Real.exp (-(1 / 2 : ℝ) * (r * ‖p‖)) =
        r ^ n * (‖p‖ ^ n * Real.exp (-(r / 2) * ‖p‖)) := by
    rw [show -(1 / 2 : ℝ) * (r * ‖p‖) = -(r / 2) * ‖p‖ by ring]
    ring
  simp_rw [he] at hscale
  rw [integral_const_mul] at hscale
  apply (eq_div_iff (pow_ne_zero _ hr.ne')).mpr
  rw [pow_add]
  calc
    _ = (r ^ n * ∫ p : Spacetime, ‖p‖ ^ n * Real.exp (-(r / 2) * ‖p‖)) * r ^ 4 := by ring
    _ = _ := by rw [hscale]; field_simp

private theorem laplaceMoment_bound (k : ℕ) :
    ∃ C : ℝ, ∀ r : ℝ, 0 < r → ‖laplaceMoment k r‖ ≤ C / r ^ (8 + k) := by
  refine ⟨∫ p : Spacetime, ‖p‖ ^ (k + 4) * Real.exp (-(1 / 2 : ℝ) * ‖p‖), ?_⟩
  intro r hr
  have hbound : ∀ p : Spacetime,
      ‖(-time p) ^ k * Real.exp (-r * time p) * weight p‖ ≤
        ‖p‖ ^ (k + 4) * Real.exp (-(r / 2) * ‖p‖) := by
    intro p
    by_cases hp : p ∈ forwardCone
    · have ht : 0 ≤ time p := (norm_nonneg (spatial p)).trans hp
      have htn : time p ≤ ‖p‖ :=
        (le_abs_self (time p)).trans (PiLp.norm_apply_le p timeAxis)
      have hexp : Real.exp (-r * time p) ≤ Real.exp (-(r / 2) * ‖p‖) := by
        apply Real.exp_le_exp.mpr
        have := mul_le_mul_of_nonneg_left (bound_cone_norm hp) hr.le
        nlinarith
      calc
        _ ≤ ‖p‖ ^ k * Real.exp (-r * time p) * weight p :=
          laplace_integrand_bound k le_rfl p
        _ ≤ ‖p‖ ^ k * Real.exp (-(r / 2) * ‖p‖) * ‖p‖ ^ 4 :=
          mul_le_mul (mul_le_mul_of_nonneg_left hexp (by positivity))
            ((weight_le p).trans (pow_le_pow_left₀ ht htn 4))
            (weight_nonneg p) (by positivity)
        _ = _ := by rw [pow_add]; ring
    · rw [weight_eq_zero hp, mul_zero, norm_zero]
      positivity
  calc
    _ ≤ ∫ p : Spacetime, ‖p‖ ^ (k + 4) * Real.exp (-(r / 2) * ‖p‖) :=
      norm_integral_le_of_norm_le (bound_integrable_radial (by positivity) _)
        (ae_of_all _ hbound)
    _ = _ := by rw [bound_radial_integral_scale _ hr]; congr 2; omega

private theorem iteratedDeriv_Sr_eq (k : ℕ) {r : ℝ} (hr : 0 < r) :
    iteratedDeriv k Sr r = laplaceMoment k r := by
  induction k generalizing r with
  | zero => simp [laplaceMoment, Sr]
  | succ k ih =>
      rw [iteratedDeriv_succ]
      have he : iteratedDeriv k Sr =ᶠ[𝓝 r] laplaceMoment k := by
        filter_upwards [Ioi_mem_nhds hr] with s hs
        exact ih hs
      rw [he.deriv_eq]
      exact (laplaceMoment_hasDerivAt k hr).deriv

private theorem norm_iteratedFDeriv_scale
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    (f : E → F) {r : ℝ} (hr : 0 < r) (n : ℕ) (x : E) :
    ‖iteratedFDeriv ℝ n (fun y => f (r • y)) x‖ =
      r ^ n * ‖iteratedFDeriv ℝ n f (r • x)‖ := by
  let e : E ≃L[ℝ] E := ContinuousLinearEquiv.smulLeft (Units.mk0 r hr.ne')
  have he (y : E) : e y = r • y := rfl
  have h := e.iteratedFDerivWithin_comp_right f uniqueDiffOn_univ (mem_univ (e x)) n
  simp only [preimage_univ, iteratedFDerivWithin_univ] at h
  have heq : iteratedFDeriv ℝ n (fun y => f (r • y)) x =
      r ^ n • iteratedFDeriv ℝ n f (r • x) := by
    change iteratedFDeriv ℝ n (f ∘ e) x = _
    rw [h]
    ext v
    simp only [ContinuousMultilinearMap.compContinuousLinearMap_apply,
      ContinuousLinearEquiv.coe_coe, he, smul_apply]
    rw [ContinuousMultilinearMap.map_smul_univ]
    simp
  rw [heq, norm_smul, Real.norm_eq_abs, abs_of_pos (pow_pos hr n)]

private theorem norm_derivatives_bounded_on_sphere (n : ℕ) :
    ∃ D : ℝ, 1 ≤ D ∧ ∀ i : ℕ, 1 ≤ i → i ≤ n → ∀ y : Spacetime, ‖y‖ = 1 →
      ‖iteratedFDeriv ℝ i (fun z : Spacetime => ‖z‖) y‖ ≤ D ^ i := by
  have hb (i : ℕ) : ∃ C : ℝ, ∀ y ∈ Metric.sphere (0 : Spacetime) 1,
      ‖iteratedFDeriv ℝ i (fun z : Spacetime => ‖z‖) y‖ ≤ C := by
    apply (isCompact_sphere (0 : Spacetime) 1).exists_bound_of_continuousOn
    intro y hy
    have hy0 : y ≠ 0 := by
      intro he
      simp [he] at hy
    have hc : ContDiffAt ℝ ∞ (fun z : Spacetime => ‖z‖) y := contDiffAt_norm ℝ hy0
    exact (hc.differentiableAt_iteratedFDeriv
      (ENat.natCast_lt_of_coe_top_le_withTop le_rfl i)).continuousAt.continuousWithinAt
  choose C hC using hb
  let D := 1 + ∑ i ∈ Finset.range (n + 1), |C i|
  have hD : 1 ≤ D := by
    dsimp [D]
    exact le_add_of_nonneg_right (Finset.sum_nonneg (fun i _ => abs_nonneg (C i)))
  refine ⟨D, hD, ?_⟩
  intro i hi hin y hy
  have hCi : C i ≤ D := by
    have hle : |C i| ≤ ∑ j ∈ Finset.range (n + 1), |C j| :=
      Finset.single_le_sum (fun j _ => abs_nonneg (C j))
        (Finset.mem_range.mpr (by omega))
    dsimp [D]
    linarith [le_abs_self (C i)]
  exact (hC i y (by simpa using hy)).trans (hCi.trans (le_self_pow₀ hD (by omega)))

private theorem scaled_profile_bound (n : ℕ) :
    ∃ B : ℝ, 0 ≤ B ∧ ∀ i : ℕ, i ≤ n → ∀ r : ℝ, 0 < r →
      ‖iteratedFDeriv ℝ i (fun t : ℝ => Sr (r * t)) 1‖ ≤ B / r ^ 8 := by
  choose C hC using laplaceMoment_bound
  let B := ∑ i ∈ Finset.range (n + 1), |C i|
  refine ⟨B, Finset.sum_nonneg (fun i _ => abs_nonneg (C i)), ?_⟩
  intro i hin r hr
  have hCi : C i ≤ B := (le_abs_self _).trans
    (Finset.single_le_sum (fun j _ => abs_nonneg (C j))
      (Finset.mem_range.mpr (by omega)))
  rw [show (fun t : ℝ => Sr (r * t)) = (fun t : ℝ => Sr (r • t)) from rfl,
    norm_iteratedFDeriv_scale Sr hr, smul_eq_mul, mul_one,
    norm_iteratedFDeriv_eq_norm_iteratedDeriv, iteratedDeriv_Sr_eq i hr]
  calc
    _ ≤ r ^ i * (C i / r ^ (8 + i)) :=
      mul_le_mul_of_nonneg_left (hC i r hr) (pow_nonneg hr.le i)
    _ = C i / r ^ 8 := by rw [pow_add]; field_simp
    _ ≤ B / r ^ 8 := div_le_div_of_nonneg_right hCi (by positivity)

private theorem Sr_contDiffOn_bound : ContDiffOn ℝ ∞ Sr (Ioi 0) := by
  have h := laplaceMoment_contDiffOn 0
  convert h using 1
  funext r
  simp [laplaceMoment, Sr]

private theorem radial_iteratedFDeriv_bound (n : ℕ) :
    ∃ C : ℝ, ∀ x : Spacetime, x ≠ 0 →
      ‖iteratedFDeriv ℝ n (fun z : Spacetime => Sr ‖z‖) x‖ ≤ C / ‖x‖ ^ (8 + n) := by
  obtain ⟨B, hB0, hB⟩ := scaled_profile_bound n
  obtain ⟨D, hD1, hD⟩ := norm_derivatives_bounded_on_sphere n
  refine ⟨n.factorial * B * D ^ n, ?_⟩
  intro x hx
  let r := ‖x‖
  have hr : 0 < r := norm_pos_iff.mpr hx
  let y := r⁻¹ • x
  have hy : ‖y‖ = 1 := by simp [y, norm_smul, r, hx]
  have hy0 : y ≠ 0 := by intro h; simp [h] at hy
  have hxy : r • y = x := by simp [y, smul_smul, hr.ne']
  let g : ℝ → ℝ := fun t => Sr (r * t)
  have hg : ContDiffOn ℝ ∞ g (Ioi 0) :=
    Sr_contDiffOn_bound.comp (contDiffOn_const.mul contDiffOn_id)
      (fun t ht => mul_pos hr ht)
  have hn : ContDiffOn ℝ ∞ (fun z : Spacetime => ‖z‖) {(0 : Spacetime)}ᶜ :=
    contDiffOn_id.norm ℝ (fun z hz => hz)
  have hcomp : ‖iteratedFDeriv ℝ n (g ∘ (fun z : Spacetime => ‖z‖)) y‖ ≤
      n.factorial * (B / r ^ 8) * D ^ n := by
    rw [← iteratedFDerivWithin_of_isOpen n isOpen_compl_singleton hy0]
    apply norm_iteratedFDerivWithin_comp_le hg hn
      (ENat.natCast_le_of_coe_top_le_withTop le_rfl n)
      isOpen_Ioi.uniqueDiffOn isOpen_compl_singleton.uniqueDiffOn
      (fun z hz => norm_pos_iff.mpr hz) hy0
    · intro i hi
      rw [iteratedFDerivWithin_of_isOpen i isOpen_Ioi (norm_pos_iff.mpr hy0), hy]
      exact hB i hi r hr
    · intro i hi hin
      rw [iteratedFDerivWithin_of_isOpen i isOpen_compl_singleton hy0]
      exact hD i hi hin y hy
  have heq : g ∘ (fun z : Spacetime => ‖z‖) =
      fun z : Spacetime => Sr ‖r • z‖ := by
    funext z
    simp [g, norm_smul, Real.norm_eq_abs, abs_of_pos hr]
  rw [heq, norm_iteratedFDeriv_scale (fun z : Spacetime => Sr ‖z‖) hr, hxy] at hcomp
  apply (le_div_iff₀ (pow_pos hr _)).mpr
  change ‖iteratedFDeriv ℝ n (fun z : Spacetime => Sr ‖z‖) x‖ * r ^ (8 + n) ≤ _
  calc
    _ = r ^ 8 * (r ^ n * ‖iteratedFDeriv ℝ n (fun z : Spacetime => Sr ‖z‖) x‖) := by
      rw [pow_add]; ring
    _ ≤ r ^ 8 * (n.factorial * (B / r ^ 8) * D ^ n) :=
      mul_le_mul_of_nonneg_left hcomp (pow_nonneg hr.le 8)
    _ = _ := by field_simp

private theorem foldr_ofFn_eq_iterated (n : ℕ) (v : Fin n → Spacetime)
    {f : Spacetime → ℂ} {U : Set Spacetime} (hU : IsOpen U)
    (hf : ContDiffOn ℝ ∞ f U) :
    EqOn ((List.ofFn v).foldr dirDeriv f) (fun x => iteratedFDeriv ℝ n f x v) U := by
  induction n with
  | zero => intro x hx; simp
  | succ n ih =>
      intro x hx
      rw [List.ofFn_succ, List.foldr_cons]
      change fderiv ℝ ((List.ofFn (fun i => v i.succ)).foldr dirDeriv f) x (v 0) = _
      have he := (ih (fun i => v i.succ)).eventuallyEq_of_mem (hU.mem_nhds hx)
      rw [he.fderiv_eq]
      have hd := ((hf x hx).contDiffAt (hU.mem_nhds hx)).differentiableAt_iteratedFDeriv
        (ENat.natCast_lt_of_coe_top_le_withTop le_rfl n)
      exact hd.iteratedFDeriv_succ_apply_left'.symm

private theorem partialDeriv_le_iteratedFDeriv (γ : Idx) {x : Spacetime} (hx : x ≠ 0) :
    ‖partialDeriv γ S x‖ ≤ ‖iteratedFDeriv ℝ (idxOrder γ) S x‖ := by
  have he := foldr_ofFn_eq_iterated (dirList γ).length (dirList γ).get
    isOpen_compl_singleton S_contDiffOn hx
  rw [List.ofFn_get] at he
  have hnorm : ∀ v ∈ dirList γ, ‖v‖ = 1 := by
    intro v hv
    obtain ⟨i, _, hi⟩ := List.mem_flatMap.mp hv
    obtain ⟨_, rfl⟩ := List.mem_replicate.mp hi
    simp [EuclideanSpace.single, PiLp.norm_single]
  have hprod : (∏ i : Fin (dirList γ).length, ‖(dirList γ).get i‖) = 1 := by
    apply Finset.prod_eq_one
    intro i _
    exact hnorm _ (List.get_mem _ _)
  have hlength : (dirList γ).length = idxOrder γ := by
    simp [dirList, List.length_flatMap, ← Fin.sum_univ_def, idxOrder]
  change ‖(dirList γ).foldr dirDeriv S x‖ ≤ _
  rw [he]
  have hb := (iteratedFDeriv ℝ (dirList γ).length S x).le_opNorm (dirList γ).get
  calc
    _ ≤ ‖iteratedFDeriv ℝ (dirList γ).length S x‖ := by
      simpa only [hprod, mul_one] using hb
    _ = _ := by rw [hlength]

theorem partialDeriv_S_bound' (γ : Idx) :
    ∃ C : ℝ, ∀ ξ : Spacetime, ξ ≠ 0 → ‖partialDeriv γ S ξ‖ ≤ C / ‖ξ‖ ^ (8 + idxOrder γ) := by
  obtain ⟨C, hC⟩ := radial_iteratedFDeriv_bound (idxOrder γ)
  refine ⟨C, fun ξ hξ => (partialDeriv_le_iteratedFDeriv γ hξ).trans ?_⟩
  have hn : ContDiffAt ℝ ∞ (fun z : Spacetime => Sr ‖z‖) ξ :=
    ((Sr_contDiffOn_bound ‖ξ‖ (norm_pos_iff.mpr hξ)).contDiffAt
      (Ioi_mem_nhds (norm_pos_iff.mpr hξ))).comp ξ (contDiffAt_norm ℝ hξ)
  change ‖iteratedFDeriv ℝ (idxOrder γ) (Complex.ofRealLI ∘ (fun z : Spacetime => Sr ‖z‖)) ξ‖ ≤ _
  rw [Complex.ofRealLI.norm_iteratedFDeriv_comp_left hn
    (ENat.natCast_le_of_coe_top_le_withTop le_rfl _)]
  exact hC ξ hξ

end YangMills.FreeField.Consolidated.Analytic_PartialDerivSBound

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [MEDIUM, 300 lines] **Scaling bound.** `|∂^γ S ξ| ≤ C ‖ξ‖^{-8-|γ|}` for all `ξ ≠ 0`.

Proof: `|Sr^{(k)} r| ≤ ∫ p_t^{k+4} exp (-r p_t) 1_cone dp = c_k r^{-8-k}` (from `weight_le` and
scaling), and `∂^γ (Sr ∘ ‖·‖)` is a finite sum of `Sr^{(k)}(‖ξ‖)` times functions homogeneous of
degree `k - |γ|` and bounded on the unit sphere. Alternatively rotate `ξ` to the time axis
(`S` is rotation invariant) and use `partialDeriv_S_integral`. -/
theorem partialDeriv_S_bound (γ : Idx) :
    ∃ C : ℝ, ∀ ξ : Spacetime, ξ ≠ 0 → ‖partialDeriv γ S ξ‖ ≤ C / ‖ξ‖ ^ (8 + idxOrder γ) := by
  exact Consolidated.Analytic_PartialDerivSBound.partialDeriv_S_bound' γ

end YangMills.FreeField
