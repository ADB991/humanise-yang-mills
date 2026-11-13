import FreeField.Continuation.Base
import FreeField.Analytic.IntegrablePowExpWeight
import FreeField.Analytic.MatchingIntegrable

import Mathlib.MeasureTheory.Integral.Pi
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace

/-! Proofs consolidated from `FreeField/Work/contL_boundary.lean`. -/

/-!
Boundary values along an ordered height ray. The proof first establishes dominated
convergence for each damped matching integral. Fubini identifies those integrals
with the smeared continuation; finite sums then give the statement for labels.

The analytic inputs are precisely `matching_integrable` and
`integrable_pow_exp_weight`. All finite-product arguments also apply to empty
index types, including the zero-point function.
-/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Continuation_ContLBoundary
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

variable {n : ℕ}

namespace BoundaryProof

def amplitude {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (q : Line σ → Spacetime) : ℂ :=
  (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) *
    (weight (q ℓ) : ℂ)) * ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v)

def energy {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (q : Line σ → Spacetime) : ℝ :=
  ∑ ℓ : Line σ, (height (σ.1 ℓ.1).1 - height ℓ.1.1) * time (q ℓ)

def damping {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (r : ℝ) (q : Line σ → Spacetime) : ℂ :=
  (Real.exp (-r * energy σ height q) : ℂ)

theorem continuous_damping {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (r : ℝ) : Continuous (damping σ height r) := by
  unfold damping energy time
  fun_prop

theorem amplitude_zero {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (q : Line σ → Spacetime) (ℓ : Line σ) (hq : q ℓ ∉ forwardCone) :
    amplitude σ f q = 0 := by
  unfold amplitude
  have hz : (∏ l : Line σ, Amono l.1.idx (q l) * Bmono (σ.1 l.1).idx (q l) *
      (weight (q l) : ℂ)) = 0 := by
    apply Finset.prod_eq_zero (Finset.mem_univ ℓ)
    simp [weight_eq_zero hq]
  rw [hz, zero_mul]

theorem damped_bound {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (height : Fin n → ℝ) (h : StrictMono height) {r : ℝ} (hr : 0 ≤ r)
    (q : Line σ → Spacetime) :
    ‖amplitude σ f q * damping σ height r q‖ ≤ ‖amplitude σ f q‖ := by
  by_cases hq : ∀ ℓ : Line σ, q ℓ ∈ forwardCone
  · have he : 0 ≤ energy σ height q := by
      apply Finset.sum_nonneg
      intro ℓ _
      exact mul_nonneg (sub_nonneg.mpr (h ℓ.2).le)
        ((norm_nonneg _).trans (hq ℓ))
    have hd : ‖damping σ height r q‖ ≤ 1 := by
      simp only [damping, Complex.norm_real, Real.norm_eq_abs,
        abs_of_pos (Real.exp_pos _)]
      exact Real.exp_le_one_iff.mpr (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hr) he)
    simpa only [norm_mul, mul_one] using mul_le_mul_of_nonneg_left hd (norm_nonneg _)
  · push Not at hq
    obtain ⟨ℓ, hℓ⟩ := hq
    simp [amplitude_zero σ f q ℓ hℓ]

theorem damped_tendsto {m : Fin n → Mon} (σ : Matching m) (f : Fin n → TestFunction)
    (height : Fin n → ℝ) (h : StrictMono height) :
    Tendsto (fun r : ℝ => ∫ q : Line σ → Spacetime,
      amplitude σ f q * damping σ height r q) (𝓝[>] 0)
      (𝓝 (∫ q : Line σ → Spacetime, amplitude σ f q)) := by
  have hi : Integrable (amplitude σ f) := matching_integrable _ σ f
  apply tendsto_integral_filter_of_dominated_convergence (fun q => ‖amplitude σ f q‖)
  · exact Eventually.of_forall fun r =>
      hi.aestronglyMeasurable.mul (continuous_damping σ height r).aestronglyMeasurable
  · filter_upwards [self_mem_nhdsWithin] with r hr
    exact Eventually.of_forall (damped_bound σ f height h (le_of_lt hr))
  · exact hi.norm
  · apply Eventually.of_forall
    intro q
    have hc : Continuous (fun r : ℝ => amplitude σ f q * damping σ height r q) := by
      unfold damping
      fun_prop
    simpa [damping] using (hc.tendsto 0).mono_left nhdsWithin_le_nhds

theorem volume_uncurry :
    MeasurePreserving (MeasurableEquiv.piCurry (fun (_ : Fin n) (_ : Fin 4) => ℝ)).symm := by
  refine ⟨(MeasurableEquiv.piCurry _).symm.measurable, ?_⟩
  apply Eq.symm
  apply Measure.pi_eq
  intro s hs
  rw [Measure.map_apply (MeasurableEquiv.piCurry _).symm.measurable
    (MeasurableSet.univ_pi hs)]
  have he : (MeasurableEquiv.piCurry (fun (_ : Fin n) (_ : Fin 4) => ℝ)).symm ⁻¹'
      (Set.univ.pi s) = Set.univ.pi (fun i => Set.univ.pi fun j => s ⟨i, j⟩) := by
    ext x
    simp [Set.mem_pi, MeasurableEquiv.coe_piCurry_symm, Sigma.forall, Sigma.uncurry]
  rw [he, volume_pi_pi]
  simp only [volume_pi_pi, Fintype.prod_sigma]

theorem volume_points_ofLp :
    MeasurePreserving (WithLp.ofLp : Points n → Fin n → Spacetime) := by
  have hc : MeasurePreserving
      (MeasurableEquiv.piCurry (fun (_ : Fin n) (_ : Fin 4) => ℝ)) :=
    volume_uncurry.symm
  have hf := (LinearIsometryEquiv.piLpCurry ℝ 2
    (fun (_ : Fin n) (_ : Fin 4) => ℝ)).symm.measurePreserving
  have hm := (volume_preserving_pi (fun _ : Fin n => PiLp.volume_preserving_toLp (Fin 4))).comp
    (hc.comp ((PiLp.volume_preserving_ofLp (Σ _ : Fin n, Fin 4)).comp hf))
  convert hm using 1
  funext x
  ext i j
  rfl

theorem integral_points (F : Points n → ℂ) :
    (∫ x : Points n, F x) = ∫ x : Fin n → Spacetime, F (WithLp.toLp 2 x) := by
  exact (volume_points_ofLp.integral_comp
    (MeasurableEquiv.toLp 2 (Fin n → Spacetime)).symm.measurableEmbedding
    (fun x => F (WithLp.toLp 2 x)))

theorem norm_Amono_le (α : Idx) (p : Spacetime) : ‖Amono α p‖ ≤ ‖p‖ ^ idxOrder α := by
  simp only [Amono, norm_mul, norm_prod, norm_pow, norm_neg, Complex.norm_I,
    one_mul, Complex.norm_real]
  calc
    _ ≤ (∏ i : Fin 3, ‖p‖ ^ α i.castSucc) * ‖p‖ ^ α timeAxis := by
      apply mul_le_mul
      · exact Finset.prod_le_prod (fun _ _ => by positivity)
          (fun i _ => pow_le_pow_left₀ (norm_nonneg _) (PiLp.norm_apply_le p i.castSucc) _)
      · exact pow_le_pow_left₀ (norm_nonneg _) (PiLp.norm_apply_le p timeAxis) _
      · positivity
      · positivity
    _ = _ := by
      rw [Finset.prod_pow_eq_pow_sum, ← pow_add]
      congr 1
      exact (Fin.sum_univ_castSucc α).symm

theorem norm_Bmono_le (α : Idx) (p : Spacetime) : ‖Bmono α p‖ ≤ ‖p‖ ^ idxOrder α := by
  have he : ‖Bmono α p‖ = ‖Amono α p‖ := by
    simp [Amono, Bmono, norm_prod, norm_pow]
  rw [he]
  exact norm_Amono_le α p

def mass (α β : Idx) (a : ℝ) (p : Spacetime) : ℂ :=
  Amono α p * Bmono β p * (weight p : ℂ) * (Real.exp (-a * time p) : ℂ)

theorem mass_integrable (α β : Idx) {a : ℝ} (ha : 0 < a) :
    Integrable (mass α β a) := by
  have hw : Measurable weight := by
    have ht : Continuous time := by unfold time; fun_prop
    have hs : Continuous spatial := by unfold spatial; fun_prop
    have hm : Continuous minkowskiSquare := (ht.pow 2).sub (hs.norm.pow 2)
    exact Measurable.ite (isClosed_le hs.norm ht).measurableSet
      ((hm.measurable.pow_const 2).div
        ((measurable_const.add hm.measurable).log.pow_const 2)) measurable_const
  have hmeas : Measurable (mass α β a) := by
    unfold mass Amono Bmono time
    fun_prop
  apply (integrable_pow_exp_weight ha (idxOrder α + idxOrder β)).mono'
    hmeas.aestronglyMeasurable
  apply Eventually.of_forall
  intro p
  simp only [mass, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (weight_nonneg p), abs_of_pos (Real.exp_pos _)]
  calc
    _ ≤ (‖p‖ ^ idxOrder α * ‖p‖ ^ idxOrder β) * weight p * Real.exp (-a * time p) := by
      apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
      apply mul_le_mul_of_nonneg_right _ (weight_nonneg p)
      exact mul_le_mul (norm_Amono_le α p) (norm_Bmono_le β p) (norm_nonneg _) (by positivity)
    _ = _ := by rw [pow_add]; ring

def oscillation (k x : Spacetime) : ℂ :=
  Complex.exp (Complex.I * ((⟪x, k⟫_ℝ : ℝ) : ℂ))

theorem norm_oscillation (k x : Spacetime) : ‖oscillation k x‖ = 1 := by
  simp [oscillation, Complex.norm_exp]

theorem inner_split (x p : Spacetime) :
    ⟪x, p⟫_ℝ = time x * time p + ⟪spatial x, spatial p⟫_ℝ := by
  simp only [PiLp.inner_apply, RCLike.inner_apply, conj_trivial]
  rw [Fin.sum_univ_castSucc]
  simp only [spatial, PiLp.toLp_apply, time]
  ring

theorem lineC_shift (α β : Idx) (r a b : ℝ) (x y : Spacetime) :
    lineC α β (((time y : ℂ) + ((r * b : ℝ) : ℂ) * Complex.I) -
      ((time x : ℂ) + ((r * a : ℝ) : ℂ) * Complex.I)) (spatial y - spatial x) =
      ∫ p : Spacetime, mass α β (r * (b - a)) p * oscillation p (y - x) := by
  unfold lineC
  apply integral_congr_ae
  apply Eventually.of_forall
  intro p
  dsimp only
  have hi : ⟪y - x, p⟫_ℝ =
      (time y - time x) * time p + ⟪spatial y - spatial x, spatial p⟫_ℝ := by
    rw [inner_sub_left, inner_split y p, inner_split x p, inner_sub_left]
    ring
  have he : Complex.I *
      (((time y : ℂ) + ((r * b : ℝ) : ℂ) * Complex.I -
        ((time x : ℂ) + ((r * a : ℝ) : ℂ) * Complex.I)) * (time p : ℂ) +
        ((⟪spatial y - spatial x, spatial p⟫_ℝ : ℝ) : ℂ)) =
      ((-(r * (b - a)) * time p : ℝ) : ℂ) +
        Complex.I * ((⟪y - x, p⟫_ℝ : ℝ) : ℂ) := by
    rw [hi]
    push_cast
    linear_combination (r * (b - a) * time p : ℂ) * Complex.I_sq
  rw [he, Complex.exp_add]
  simp only [mass, oscillation, Complex.ofReal_exp]
  ring

theorem vertex_phase_sum {m : Fin n → Mon} (σ : Matching m)
    (q : Line σ → Spacetime) (x : Fin n → Spacetime) :
    (∑ ℓ : Line σ, ⟪x (σ.1 ℓ.1).1 - x ℓ.1.1, q ℓ⟫_ℝ) =
      ∑ v : Fin n, ⟪x v, vertexMomentum σ q v⟫_ℝ := by
  simp only [vertexMomentum, inner_sub_right, inner_sum, inner_sub_left,
    Finset.sum_sub_distrib]
  simp only [apply_ite, inner_zero_right]
  rw [Finset.sum_comm, Finset.sum_comm (f := fun v ℓ =>
    if ℓ.1.1 = v then ⟪x v, q ℓ⟫_ℝ else 0)]
  simp

theorem vertex_phase_prod {m : Fin n → Mon} (σ : Matching m)
    (q : Line σ → Spacetime) (x : Fin n → Spacetime) :
    (∏ ℓ : Line σ, oscillation (q ℓ) (x (σ.1 ℓ.1).1 - x ℓ.1.1)) =
      ∏ v : Fin n, oscillation (vertexMomentum σ q v) (x v) := by
  simp only [oscillation, ← Complex.exp_sum, ← Finset.mul_sum, ← Complex.ofReal_sum,
    vertex_phase_sum]

def masses {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (r : ℝ) (q : Line σ → Spacetime) : ℂ :=
  ∏ ℓ : Line σ, mass ℓ.1.idx (σ.1 ℓ.1).idx
    (r * (height (σ.1 ℓ.1).1 - height ℓ.1.1)) (q ℓ)

theorem masses_integrable {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (h : StrictMono height) {r : ℝ} (hr : 0 < r) :
    Integrable (masses σ height r) := by
  exact Integrable.fintype_prod (fun ℓ => mass_integrable _ _ (mul_pos hr (sub_pos.mpr (h ℓ.2))))

theorem masses_eq {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (r : ℝ) (q : Line σ → Spacetime) :
    masses σ height r q =
      (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) *
        (weight (q ℓ) : ℂ)) * damping σ height r q := by
  simp only [masses, mass, Finset.prod_mul_distrib, damping, energy]
  congr 1
  simp only [Complex.ofReal_exp, ← Complex.exp_sum, ← Complex.ofReal_sum]
  congr 2
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro ℓ _
  ring

def joint {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (r : ℝ) (f : Fin n → TestFunction) (q : Line σ → Spacetime)
    (x : Fin n → Spacetime) : ℂ :=
  masses σ height r q * ∏ v : Fin n,
    f v (x v) * oscillation (vertexMomentum σ q v) (x v)

@[fun_prop] theorem continuous_vertexMomentum {m : Fin n → Mon} (σ : Matching m)
    (v : Fin n) : Continuous (fun q : Line σ → Spacetime => vertexMomentum σ q v) := by
  unfold vertexMomentum
  apply Continuous.sub
  all_goals
    apply continuous_finsetSum
    intro ℓ _
    split_ifs <;> fun_prop

theorem joint_integrable {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (h : StrictMono height) {r : ℝ} (hr : 0 < r) (f : Fin n → TestFunction) :
    Integrable (uncurry (joint σ height r f)) (volume.prod volume) := by
  have hm := masses_integrable σ height h hr
  have ht : Integrable (fun x : Fin n → Spacetime => ∏ v, ‖f v (x v)‖) :=
    Integrable.fintype_prod fun v => (f v).integrable.norm
  apply (hm.norm.mul_prod ht).mono'
  · apply hm.aestronglyMeasurable.comp_fst.mul
    apply Continuous.aestronglyMeasurable
    unfold oscillation
    fun_prop
  · apply Eventually.of_forall
    intro z
    simp [uncurry, joint, norm_prod, norm_oscillation]

theorem joint_integral_position {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (r : ℝ) (f : Fin n → TestFunction) (q : Line σ → Spacetime) :
    (∫ x : Fin n → Spacetime, joint σ height r f q x) =
      amplitude σ f q * damping σ height r q := by
  simp only [joint]
  rw [integral_const_mul,
    integral_fintype_prod_volume_eq_prod (fun v x => f v x * oscillation (vertexMomentum σ q v) x),
    masses_eq]
  change _ * damping σ height r q * (∏ v, fourierE (f v) (vertexMomentum σ q v)) = _
  unfold amplitude
  ring

def matchingPosition {m : Fin n → Mon} (σ : Matching m) (height : Fin n → ℝ)
    (r : ℝ) (f : Fin n → TestFunction) (x : Fin n → Spacetime) : ℂ :=
  (∏ ℓ : Line σ, lineC ℓ.1.idx (σ.1 ℓ.1).idx
    (((time (x (σ.1 ℓ.1).1) : ℂ) + ((r * height (σ.1 ℓ.1).1 : ℝ) : ℂ) * Complex.I) -
      ((time (x ℓ.1.1) : ℂ) + ((r * height ℓ.1.1 : ℝ) : ℂ) * Complex.I))
    (spatial (x (σ.1 ℓ.1).1) - spatial (x ℓ.1.1))) * ∏ v, f v (x v)

theorem joint_integral_momentum {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (r : ℝ) (f : Fin n → TestFunction) (x : Fin n → Spacetime) :
    (∫ q : Line σ → Spacetime, joint σ height r f q x) =
      matchingPosition σ height r f x := by
  have he (q : Line σ → Spacetime) : joint σ height r f q x =
      (∏ ℓ : Line σ, mass ℓ.1.idx (σ.1 ℓ.1).idx
        (r * (height (σ.1 ℓ.1).1 - height ℓ.1.1)) (q ℓ) *
        oscillation (q ℓ) (x (σ.1 ℓ.1).1 - x ℓ.1.1)) * ∏ v, f v (x v) := by
    simp only [joint, masses, Finset.prod_mul_distrib, vertex_phase_prod]
    ring
  simp_rw [he]
  rw [integral_mul_const,
    integral_fintype_prod_volume_eq_prod (fun (ℓ : Line σ) p =>
      mass ℓ.1.idx (σ.1 ℓ.1).idx (r * (height (σ.1 ℓ.1).1 - height ℓ.1.1)) p *
        oscillation p (x (σ.1 ℓ.1).1 - x ℓ.1.1))]
  simp only [matchingPosition, lineC_shift]

theorem matchingPosition_integrable {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (h : StrictMono height) {r : ℝ} (hr : 0 < r)
    (f : Fin n → TestFunction) : Integrable (matchingPosition σ height r f) := by
  have hi := (joint_integrable σ height h hr f).integral_prod_right
  simpa only [uncurry, joint_integral_momentum] using hi

theorem matchingPosition_integral {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (h : StrictMono height) {r : ℝ} (hr : 0 < r)
    (f : Fin n → TestFunction) :
    (∫ x : Fin n → Spacetime, matchingPosition σ height r f x) =
      ∫ q : Line σ → Spacetime, amplitude σ f q * damping σ height r q := by
  simp_rw [← joint_integral_momentum]
  rw [← integral_integral_swap (joint_integrable σ height h hr f)]
  simp_rw [joint_integral_position]

theorem matchingPosition_tendsto {m : Fin n → Mon} (σ : Matching m)
    (height : Fin n → ℝ) (h : StrictMono height) (f : Fin n → TestFunction) :
    Tendsto (fun r : ℝ => ∫ x : Fin n → Spacetime, matchingPosition σ height r f x)
      (𝓝[>] 0) (𝓝 (∫ q : Line σ → Spacetime, amplitude σ f q)) := by
  apply (damped_tendsto σ f height h).congr'
  filter_upwards [self_mem_nhdsWithin] with r hr
  exact (matchingPosition_integral σ height h hr f).symm

theorem wickSum_lines (K : Fin n → Fin n → Idx → Idx → ℂ) (m : Fin n → Mon) :
    wickSum K m = ∑ σ : Matching m,
      ∏ ℓ : Line σ, K ℓ.1.1 (σ.1 ℓ.1).1 ℓ.1.idx (σ.1 ℓ.1).idx := by
  unfold wickSum
  apply Finset.sum_congr rfl
  intro σ _
  rw [← Finset.prod_filter]
  exact Finset.prod_subtype _ (by simp) _

theorem smeared_expansion (P : Fin n → (Mon →₀ ℂ)) (height : Fin n → ℝ)
    (r : ℝ) (f : Fin n → TestFunction) (x : Fin n → Spacetime) :
    contL P (Hierarchy.complexShift r height (WithLp.toLp 2 x))
        (Hierarchy.spatialPoints (WithLp.toLp 2 x)) *
      Hierarchy.tensorTest f (WithLp.toLp 2 x) =
    ∑ m ∈ Fintype.piFinset (fun i => (P i).support),
      (∏ i, P i (m i)) * ∑ σ : Matching m, matchingPosition σ height r f x := by
  simp only [contL, wickL, wickSum_lines, matchingPosition, kernelC,
    Hierarchy.complexShift, Hierarchy.spatialPoints, Hierarchy.tensorTest,
    Finset.sum_mul, mul_assoc, Finset.mul_sum]

theorem smeared_integral (P : Fin n → (Mon →₀ ℂ)) (height : Fin n → ℝ)
    (h : StrictMono height) {r : ℝ} (hr : 0 < r) (f : Fin n → TestFunction) :
    (∫ x : Points n,
      contL P (Hierarchy.complexShift r height x) (Hierarchy.spatialPoints x) *
        Hierarchy.tensorTest f x) =
    ∑ m ∈ Fintype.piFinset (fun i => (P i).support),
      (∏ i, P i (m i)) * ∑ σ : Matching m,
        ∫ x : Fin n → Spacetime, matchingPosition σ height r f x := by
  rw [integral_points]
  simp_rw [smeared_expansion]
  have hi (m : Fin n → Mon) :
      Integrable (fun x : Fin n → Spacetime => ∑ σ : Matching m,
        matchingPosition σ height r f x) := by
    apply integrable_finsetSum
    intro σ _
    exact matchingPosition_integrable σ height h hr f
  rw [integral_finsetSum _ (fun m _ => (hi m).const_mul _)]
  apply Finset.sum_congr rfl
  intro m _
  rw [integral_const_mul,
    integral_finsetSum _ (fun σ _ => matchingPosition_integrable σ height h hr f)]

end BoundaryProof

theorem contL_boundary' (P : Fin n → (Mon →₀ ℂ)) (height : Fin n → ℝ) (h : StrictMono height)
    (tests : Fin n → TestFunction) :
    Tendsto (fun r : ℝ => ∫ x : Points n,
        contL P (Hierarchy.complexShift r height x) (Hierarchy.spatialPoints x) *
          Hierarchy.tensorTest tests x)
      (𝓝[>] 0) (𝓝 (wightmanL P tests)) := by
  have ht : Tendsto
      (fun r : ℝ => ∑ m ∈ Fintype.piFinset (fun i => (P i).support),
        (∏ i, P i (m i)) * ∑ σ : Matching m,
          ∫ x : Fin n → Spacetime, BoundaryProof.matchingPosition σ height r tests x)
      (𝓝[>] 0) (𝓝 (wightmanL P tests)) := by
    unfold wightmanL wightmanMono
    apply tendsto_finsetSum
    intro m _
    apply Tendsto.const_mul
    apply tendsto_finsetSum
    intro σ _
    exact BoundaryProof.matchingPosition_tendsto σ height h tests
  apply ht.congr'
  filter_upwards [self_mem_nhdsWithin] with r hr
  exact (BoundaryProof.smeared_integral P height h hr tests).symm

end YangMills.FreeField.Consolidated.Continuation_ContLBoundary

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {n : ℕ}

/-- [HARD, 800 lines; depends on `matching_integrable`, `integrable_pow_exp_weight`]
**Boundary values**: the smeared continuation converges to the Wightman function along every
ray into the ordered tube.

Proof idea: for `r > 0` the integrand is continuous and bounded by a constant times
`|tensorTest|`, since every line has `(z w - z v).im = r (height w - height v) ≥ r δ`; so the
Bochner integral is a genuine integral. Fubini (line momenta against positions) turns it into
`∑_σ ∫ ∏ (leg factors) ∏_v fourierE (f v) (vertexMomentum σ q v)
  exp (-r ∑_ℓ (height w_ℓ - height v_ℓ) (q ℓ)_t) dq`,
and dominated convergence with `matching_integrable` (directed cuts) gives the limit `wightmanL P tests`. About 600 lines. -/
theorem contL_boundary (P : Fin n → (Mon →₀ ℂ)) (height : Fin n → ℝ) (h : StrictMono height)
    (tests : Fin n → TestFunction) :
    Tendsto (fun r : ℝ => ∫ x : Points n,
        contL P (Hierarchy.complexShift r height x) (Hierarchy.spatialPoints x) *
          Hierarchy.tensorTest tests x)
      (𝓝[>] 0) (𝓝 (wightmanL P tests)) := by
  exact Consolidated.Continuation_ContLBoundary.contL_boundary' P height h tests

end YangMills.FreeField
