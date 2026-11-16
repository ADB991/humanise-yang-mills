import FreeField.Theory.Base
import FreeField.Analytic.WeightLe
import FreeField.Analytic.MeasurableWeight

import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier

/-! Proofs consolidated from `FreeField/Work/openAmpW_memLp.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_OpenAmpWMemLp
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal FourierTransform

/-! The energy estimate below includes the external vertex. Weighting vertex `v` by
`v + 1` is the sum of the directed-cut identities: an internal line receives its
positive vertex distance, and an external line receives its positive endpoint. -/

private theorem time_sum {ι : Type*} [Fintype ι] (p : ι → Spacetime) :
    time (∑ i, p i) = ∑ i, time (p i) := by
  simp [time]

private theorem weighted_vertex_sum {n : ℕ} (a : Fin (n + 1)) (t : ℝ) :
    (∑ v : Fin n, ((v.val : ℝ) + 1) * (if a = v.succ then t else 0)) =
      (a.val : ℝ) * t := by
  refine Fin.cases ?_ (fun v => ?_) a
  · simp [eq_comm]
  · simp [Fin.succ_inj, Nat.cast_add, Nat.cast_one]

private theorem open_energy_identity {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime) :
    (∑ v : Fin n, ((v.val : ℝ) + 1) * time (openMomentum σ q p v)) =
      (∑ ℓ : ILine σ,
        ((ovtx (σ.1 (Sum.inr ℓ.1))).val - ((ℓ.1.1.val : ℝ) + 1)) * time (q ℓ)) +
      ∑ j : Fin k, ((ovtx (σ.1 (Sum.inl j))).val : ℝ) * time (p j) := by
  simp only [openMomentum, show ∀ a b : Spacetime, time (a + b) = time a + time b
    from fun _ _ => rfl, show ∀ a b : Spacetime, time (a - b) = time a - time b
    from fun _ _ => rfl, time_sum, apply_ite time, show time (0 : Spacetime) = 0 from rfl]
  simp only [mul_add, mul_sub, Finset.mul_sum, Finset.sum_add_distrib,
    Finset.sum_sub_distrib]
  rw [Finset.sum_comm (f := fun (v : Fin n) (ℓ : ILine σ) =>
    ((v.val : ℝ) + 1) * if ovtx (σ.1 (Sum.inr ℓ.1)) = v.succ then time (q ℓ) else 0)]
  rw [Finset.sum_comm (f := fun (v : Fin n) (ℓ : ILine σ) =>
    ((v.val : ℝ) + 1) * if ℓ.1.1 = v then time (q ℓ) else 0)]
  rw [Finset.sum_comm (f := fun (v : Fin n) (j : Fin k) =>
    ((v.val : ℝ) + 1) * if ovtx (σ.1 (Sum.inl j)) = v.succ then time (p j) else 0)]
  simp only [weighted_vertex_sum]
  simp_rw [mul_ite, mul_zero, Finset.sum_ite_eq]
  rw [← Finset.sum_sub_distrib]
  congr 1
  apply Finset.sum_congr rfl
  intro ℓ _
  simp only [Finset.mem_univ, if_true]
  ring

private theorem open_energy_bound {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hq : ∀ ℓ, 0 ≤ time (q ℓ)) (hp : ∀ j, 0 ≤ time (p j)) :
    (∑ ℓ, time (q ℓ)) + ∑ j, time (p j) ≤
      (n : ℝ) * ∑ v, ‖openMomentum σ q p v‖ := by
  have hint (ℓ : ILine σ) :
      (1 : ℝ) ≤ (ovtx (σ.1 (Sum.inr ℓ.1))).val - ((ℓ.1.1.val : ℝ) + 1) := by
    have h : ℓ.1.1.val + 1 < (ovtx (σ.1 (Sum.inr ℓ.1))).val := ℓ.2
    have h' : (ℓ.1.1.val : ℝ) + 2 ≤ (ovtx (σ.1 (Sum.inr ℓ.1))).val := by
      exact_mod_cast h
    linarith
  have hext (j : Fin k) : (1 : ℝ) ≤ (ovtx (σ.1 (Sum.inl j))).val := by
    have h : ovtx (σ.1 (Sum.inl j)) ≠ 0 := σ.2.2 (Sum.inl j)
    have h' : 1 ≤ (ovtx (σ.1 (Sum.inl j))).val := by
      apply Nat.one_le_iff_ne_zero.mpr
      intro hz
      exact h (Fin.ext hz)
    exact_mod_cast h'
  calc
    _ ≤ (∑ ℓ : ILine σ,
          ((ovtx (σ.1 (Sum.inr ℓ.1))).val - ((ℓ.1.1.val : ℝ) + 1)) * time (q ℓ)) +
        ∑ j : Fin k, ((ovtx (σ.1 (Sum.inl j))).val : ℝ) * time (p j) := by
      apply add_le_add
      · exact Finset.sum_le_sum fun ℓ _ => le_mul_of_one_le_left (hq ℓ) (hint ℓ)
      · exact Finset.sum_le_sum fun j _ => le_mul_of_one_le_left (hp j) (hext j)
    _ = ∑ v : Fin n, ((v.val : ℝ) + 1) * time (openMomentum σ q p v) :=
      (open_energy_identity σ q p).symm
    _ ≤ (n : ℝ) * ∑ v, ‖openMomentum σ q p v‖ := by
      rw [Finset.mul_sum]
      apply Finset.sum_le_sum
      intro v _
      have ht : time (openMomentum σ q p v) ≤ ‖openMomentum σ q p v‖ :=
        (le_abs_self _).trans (PiLp.norm_apply_le (openMomentum σ q p v) timeAxis)
      have hv : (v.val : ℝ) + 1 ≤ n := by exact_mod_cast v.isLt
      exact (mul_le_mul_of_nonneg_left ht (by positivity)).trans
        (mul_le_mul_of_nonneg_right hv (norm_nonneg _))

private theorem cone_norm_le_twice_time {p : Spacetime} (hp : p ∈ forwardCone) :
    ‖p‖ ≤ 2 * time p := by
  have hs : ‖spatial p‖ ≤ time p := hp
  have ht := (norm_nonneg (spatial p)).trans hs
  have hn : ‖p‖ ^ 2 = ‖spatial p‖ ^ 2 + time p ^ 2 := by
    rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq,
      Fin.sum_univ_castSucc]
    rfl
  nlinarith [norm_nonneg p, norm_nonneg (spatial p)]

private theorem open_momentum_bound {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hq : ∀ ℓ, q ℓ ∈ forwardCone) (hp : ∀ j, p j ∈ forwardCone) :
    (∑ ℓ, ‖q ℓ‖) + ∑ j, ‖p j‖ ≤
      2 * n * ∑ v, ‖openMomentum σ q p v‖ := by
  calc
    _ ≤ (∑ ℓ, 2 * time (q ℓ)) + ∑ j, 2 * time (p j) := by
      exact add_le_add (Finset.sum_le_sum fun ℓ _ => cone_norm_le_twice_time (hq ℓ))
        (Finset.sum_le_sum fun j _ => cone_norm_le_twice_time (hp j))
    _ = 2 * ((∑ ℓ, time (q ℓ)) + ∑ j, time (p j)) := by
      simp only [Finset.mul_sum, mul_add]
    _ ≤ 2 * ((n : ℝ) * ∑ v, ‖openMomentum σ q p v‖) := by
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      exact open_energy_bound σ q p
        (fun ℓ => (norm_nonneg _).trans (hq ℓ))
        (fun j => (norm_nonneg _).trans (hp j))
    _ = _ := by ring

private theorem fourierE_measurable (f : TestFunction) : Measurable (fourierE f) := by
  have h : Continuous (fun z : Spacetime × Spacetime =>
      f z.2 * Complex.exp (Complex.I * ((⟪z.2, z.1⟫_ℝ : ℝ) : ℂ))) := by
    fun_prop
  exact h.stronglyMeasurable.integral_prod_right'.measurable

private def openMatchingAmp {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) (p : Fin k → Spacetime) : ℂ :=
  ∫ q : ILine σ → Spacetime,
    (∏ ℓ : ILine σ, Amono ℓ.1.idx (q ℓ) * Bmono (oidx (σ.1 (Sum.inr ℓ.1))) (q ℓ) *
        (weight (q ℓ) : ℂ)) *
      (∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (p j)) *
      ∏ v : Fin n, fourierE (f v) (openMomentum σ q p v)

private theorem openMatchingAmp_measurable {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) : Measurable (openMatchingAmp σ f) := by
  have hA (α : Idx) : Continuous (Amono α) := by unfold Amono time; fun_prop
  have hB (α : Idx) : Continuous (Bmono α) := by unfold Bmono time; fun_prop
  have hM (v : Fin n) : Continuous
      (fun z : (Fin k → Spacetime) × (ILine σ → Spacetime) => openMomentum σ z.2 z.1 v) := by
    unfold openMomentum
    apply Continuous.add
    · apply Continuous.sub
      · apply continuous_finsetSum
        intro ℓ _
        split_ifs <;> fun_prop
      · apply continuous_finsetSum
        intro ℓ _
        split_ifs <;> fun_prop
    · apply continuous_finsetSum
      intro j _
      split_ifs <;> fun_prop
  unfold openMatchingAmp
  apply StronglyMeasurable.measurable
  apply StronglyMeasurable.integral_prod_right
  apply Measurable.stronglyMeasurable
  change Measurable (fun z : (Fin k → Spacetime) × (ILine σ → Spacetime) => _)
  apply Measurable.mul
  · apply Measurable.mul
    · apply Finset.measurable_prod
      intro ℓ _
      exact (((hA _).comp ((continuous_apply ℓ).comp continuous_snd)).measurable.mul
        ((hB _).comp ((continuous_apply ℓ).comp continuous_snd)).measurable).mul
        (Complex.measurable_ofReal.comp
          (measurable_weight.comp ((measurable_pi_apply ℓ).comp measurable_snd)))
    · apply Finset.measurable_prod
      intro j _
      exact ((hB _).comp ((continuous_apply j).comp continuous_fst)).measurable
  · apply Finset.measurable_prod
    intro v _
    exact (fourierE_measurable (f v)).comp (hM v).measurable

private def momentumTail (p : Spacetime) : ℝ := (1 + ‖p‖) ^ (-6 : ℝ)

private theorem momentumTail_continuous : Continuous momentumTail := by
  unfold momentumTail
  exact (show Continuous (fun p : Spacetime => 1 + ‖p‖) by fun_prop).rpow_const
    (fun p => Or.inl (by positivity))

private theorem momentumTail_memLp : MemLp momentumTail 2 mu := by
  rw [memLp_two_iff_integrable_sq momentumTail_continuous.aestronglyMeasurable]
  unfold mu
  rw [integrable_withDensity_iff_integrable_smul' measurable_weight.ennreal_ofReal
    (ae_of_all _ fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (weight_nonneg _), smul_eq_mul]
  have hi : Integrable (fun p : Spacetime => (1 + ‖p‖) ^ (-8 : ℝ)) :=
    integrable_one_add_norm (by norm_num : (Module.finrank ℝ Spacetime : ℝ) < 8)
  refine hi.mono' (measurable_weight.mul
    (momentumTail_continuous.pow 2).measurable).aestronglyMeasurable (ae_of_all _ ?_)
  intro p
  rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg (weight_nonneg p) (sq_nonneg _))]
  have hw : weight p ≤ (1 + ‖p‖) ^ 4 := by
    apply (weight_le p).trans
    calc
      time p ^ 4 = |time p| ^ 4 := by nlinarith [sq_abs (time p)]
      _ ≤ (1 + ‖p‖) ^ 4 := by
        apply pow_le_pow_left₀ (abs_nonneg _)
        exact (PiLp.norm_apply_le p timeAxis).trans (by linarith [norm_nonneg p])
  calc
    _ ≤ (1 + ‖p‖) ^ 4 * momentumTail p ^ 2 :=
      mul_le_mul_of_nonneg_right hw (sq_nonneg _)
    _ = (1 + ‖p‖) ^ (-8 : ℝ) := by
      unfold momentumTail
      rw [← Real.rpow_mul_natCast (by positivity), ← Real.rpow_natCast,
        ← Real.rpow_add (by positivity)]
      norm_num

private theorem product_momentumTail_memLp (k : ℕ) :
    MemLp (fun p : Fin k → Spacetime => ∏ j, momentumTail (p j)) 2
      (Measure.pi fun _ : Fin k => mu) := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  have hc : Continuous (fun p : Fin k → Spacetime => ∏ j, momentumTail (p j)) := by
    apply continuous_finsetProd
    intro j _
    exact momentumTail_continuous.comp (continuous_apply j)
  rw [memLp_two_iff_integrable_sq hc.aestronglyMeasurable]
  simp_rw [← Finset.prod_pow]
  exact Integrable.fintype_prod (fun _ : Fin k => momentumTail_memLp.integrable_sq)

/-! The Fourier and leg-factor estimates below are adapted from the proved helpers
in `Work/matching_integrable.lean`, and reproved locally to avoid importing a Work file. -/

private def fourierSchwartz (f : TestFunction) : TestFunction :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ
    (LinearEquiv.smulOfNeZero ℝ Spacetime ((2 * Real.pi)⁻¹)
      (inv_ne_zero (mul_ne_zero (by norm_num) Real.pi_ne_zero))).toContinuousLinearEquiv
    (𝓕⁻ f)

private theorem fourierSchwartz_apply (f : TestFunction) (k : Spacetime) :
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

private def fourierBound (N : ℕ) (f : TestFunction) : ℝ :=
  2 ^ N * (Finset.Iic (N, 0)).sup (fun a => SchwartzMap.seminorm ℝ a.1 a.2)
    (fourierSchwartz f)

private theorem fourierBound_nonneg (N : ℕ) (f : TestFunction) : 0 ≤ fourierBound N f := by
  unfold fourierBound
  positivity

private theorem fourier_decay (N : ℕ) (f : TestFunction) (k : Spacetime) :
    (1 + ‖k‖) ^ N * ‖fourierE f k‖ ≤ fourierBound N f := by
  simpa only [fourierBound, norm_iteratedFDeriv_zero, fourierSchwartz_apply] using
    (SchwartzMap.one_add_le_sup_seminorm_apply (𝕜 := ℝ)
      (m := (N, 0)) le_rfl le_rfl (fourierSchwartz f) k)

private theorem norm_Amono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
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

private theorem norm_Bmono_le (α : Idx) (p : Spacetime) {R : ℝ} (hR : ‖p‖ ≤ R) :
    ‖Bmono α p‖ ≤ R ^ idxOrder α := by
  have h : ‖Bmono α p‖ = ‖Amono α p‖ := by
    simp only [Amono, Bmono, norm_mul, norm_prod, norm_pow, norm_neg]
  rw [h]
  exact norm_Amono_le α p hR

private def openRadius {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : ℝ := 1 + ‖q‖ + ∑ j, ‖p j‖

private theorem openRadius_pos {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : 0 < openRadius σ q p := by
  unfold openRadius
  positivity

private theorem internal_norm_le_radius {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (ℓ : ILine σ) :
    ‖q ℓ‖ ≤ openRadius σ q p := by
  apply (norm_le_pi_norm q ℓ).trans
  unfold openRadius
  linarith [Finset.sum_nonneg (fun j (_ : j ∈ Finset.univ) => norm_nonneg (p j))]

private theorem external_norm_le_radius {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (j : Fin k) :
    1 + ‖p j‖ ≤ openRadius σ q p := by
  have h : ‖p j‖ ≤ ∑ i, ‖p i‖ :=
    Finset.single_le_sum (fun i _ => norm_nonneg (p i)) (Finset.mem_univ j)
  unfold openRadius
  linarith [norm_nonneg q]

private theorem openRadius_le_vertex_prod {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hq : ∀ ℓ, q ℓ ∈ forwardCone) (hp : ∀ j, p j ∈ forwardCone) :
    openRadius σ q p ≤
      (1 + 2 * n * n) * ∏ v : Fin n, (1 + ‖openMomentum σ q p v‖) := by
  let R := ∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)
  have hR : 1 ≤ R := Finset.one_le_prod fun v _ => by simp
  have hs : (∑ v : Fin n, ‖openMomentum σ q p v‖) ≤ n * R := by
    calc
      _ ≤ ∑ _v : Fin n, R := by
        apply Finset.sum_le_sum
        intro v _
        apply (le_add_of_nonneg_left zero_le_one).trans
        simpa using Finset.prod_le_prod_of_subset_of_one_le
          (f := fun w : Fin n => 1 + ‖openMomentum σ q p w‖)
          (Finset.subset_univ {v}) (fun w _ => by positivity) (fun w _ _ => by simp)
      _ = n * R := by simp
  have hqnorm : ‖q‖ ≤ ∑ ℓ, ‖q ℓ‖ := by
    apply (pi_norm_le_iff_of_nonneg (by positivity)).2
    intro ℓ
    exact Finset.single_le_sum (fun i _ => norm_nonneg (q i)) (Finset.mem_univ ℓ)
  have hb := open_momentum_bound σ q p hq hp
  have hh := mul_le_mul_of_nonneg_left hs (show 0 ≤ (2 : ℝ) * n by positivity)
  change 1 + ‖q‖ + ∑ j, ‖p j‖ ≤ (1 + 2 * n * n) * R
  nlinarith

private def openDegree {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) : ℕ :=
  (∑ ℓ : ILine σ, (idxOrder ℓ.1.idx + idxOrder (oidx (σ.1 (Sum.inr ℓ.1))) + 4)) +
    ∑ j : Fin k, idxOrder (oidx (σ.1 (Sum.inl j)))

private def openKernel {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : ℂ :=
  (∏ ℓ : ILine σ, Amono ℓ.1.idx (q ℓ) * Bmono (oidx (σ.1 (Sum.inr ℓ.1))) (q ℓ) *
    (weight (q ℓ) : ℂ)) * ∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (p j)

private def openIntegrand {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (f : Fin n → TestFunction) (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : ℂ :=
  openKernel σ q p * ∏ v : Fin n, fourierE (f v) (openMomentum σ q p v)

private theorem norm_openKernel_le {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) :
    ‖openKernel σ q p‖ ≤ openRadius σ q p ^ openDegree σ := by
  have hR0 : 0 ≤ openRadius σ q p := (openRadius_pos σ q p).le
  unfold openKernel openDegree
  rw [norm_mul, pow_add]
  apply mul_le_mul _ _ (norm_nonneg _) (by positivity)
  · rw [norm_prod, ← Finset.prod_pow_eq_pow_sum]
    apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
    intro ℓ _
    have hR := internal_norm_le_radius σ q p ℓ
    have hw : ‖(weight (q ℓ) : ℂ)‖ ≤ openRadius σ q p ^ 4 := by
      rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (weight_nonneg _)]
      apply (weight_le _).trans
      have ht : |time (q ℓ)| ≤ openRadius σ q p := by
        exact (PiLp.norm_apply_le (q ℓ) timeAxis).trans hR
      calc
        time (q ℓ) ^ 4 = |time (q ℓ)| ^ 4 := by rw [pow_abs, abs_of_nonneg (by positivity)]
        _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) ht _
    rw [norm_mul, norm_mul, pow_add, pow_add]
    exact mul_le_mul (mul_le_mul (norm_Amono_le _ _ hR) (norm_Bmono_le _ _ hR)
      (norm_nonneg _) (by positivity)) hw (norm_nonneg _) (by positivity)
  · rw [norm_prod, ← Finset.prod_pow_eq_pow_sum]
    apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
    intro j _
    apply norm_Bmono_le
    exact (le_add_of_nonneg_left zero_le_one).trans (external_norm_le_radius σ q p j)

private theorem openIntegrand_eq_zero_off_cone {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) (q : ILine σ → Spacetime)
    (p : Fin k → Spacetime) (hq : ¬ ∀ ℓ, q ℓ ∈ forwardCone) :
    openIntegrand σ f q p = 0 := by
  obtain ⟨ℓ, hℓ⟩ := not_forall.mp hq
  have h : (∏ ℓ : ILine σ, Amono ℓ.1.idx (q ℓ) *
      Bmono (oidx (σ.1 (Sum.inr ℓ.1))) (q ℓ) * (weight (q ℓ) : ℂ)) = 0 := by
    apply Finset.prod_eq_zero (Finset.mem_univ ℓ)
    rw [weight_eq_zero hℓ, Complex.ofReal_zero, mul_zero]
  simp only [openIntegrand, openKernel, h, zero_mul]

private def openBound {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (s : ℕ) (f : Fin n → TestFunction) : ℝ :=
  (1 + 2 * n * n : ℝ) ^ (openDegree σ + s) *
    ∏ v : Fin n, fourierBound (openDegree σ + s) (f v)

private theorem openBound_nonneg {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (s : ℕ) (f : Fin n → TestFunction) : 0 ≤ openBound σ s f := by
  unfold openBound
  exact mul_nonneg (by positivity) (Finset.prod_nonneg fun v _ => fourierBound_nonneg _ _)

private theorem weighted_openIntegrand_le {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (s : ℕ) (f : Fin n → TestFunction)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hp : ∀ j, p j ∈ forwardCone) :
    openRadius σ q p ^ s * ‖openIntegrand σ f q p‖ ≤ openBound σ s f := by
  have hR := (openRadius_pos σ q p).le
  by_cases hq : ∀ ℓ, q ℓ ∈ forwardCone
  · have hdecay :
        (∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^ (openDegree σ + s) *
            (∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) ≤
          ∏ v : Fin n, fourierBound (openDegree σ + s) (f v) := by
      rw [← Finset.prod_pow, ← Finset.prod_mul_distrib]
      exact Finset.prod_le_prod (fun v _ => by positivity) fun v _ => fourier_decay _ _ _
    calc
      _ = openRadius σ q p ^ s * (‖openKernel σ q p‖ *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        rw [openIntegrand, norm_mul, norm_prod]
      _ ≤ openRadius σ q p ^ s * (openRadius σ q p ^ openDegree σ *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        gcongr
        exact norm_openKernel_le σ q p
      _ = openRadius σ q p ^ (openDegree σ + s) *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖ := by
        rw [pow_add]
        ring
      _ ≤ ((1 + 2 * n * n) * ∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^
          (openDegree σ + s) * ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖ := by
        gcongr
        exact openRadius_le_vertex_prod σ q p hq hp
      _ = (1 + 2 * n * n : ℝ) ^ (openDegree σ + s) *
          ((∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^ (openDegree σ + s) *
            ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        rw [mul_pow, mul_assoc]
      _ ≤ openBound σ s f := mul_le_mul_of_nonneg_left hdecay (by positivity)
  · rw [openIntegrand_eq_zero_off_cone σ f q p hq, norm_zero, mul_zero]
    exact openBound_nonneg σ s f

private theorem momentumTail_eq_inv_pow (p : Spacetime) :
    momentumTail p = ((1 + ‖p‖) ^ 6)⁻¹ := by
  unfold momentumTail
  rw [Real.rpow_neg (by positivity)]
  norm_cast

private theorem openIntegrand_le_product_tail {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (d : ℕ) (f : Fin n → TestFunction)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hp : ∀ j, p j ∈ forwardCone) :
    ‖openIntegrand σ f q p‖ ≤
      openBound σ (d + 6 * k) f * ((1 + ‖q‖) ^ d)⁻¹ * ∏ j, momentumTail (p j) := by
  have hR := (openRadius_pos σ q p).le
  have hqR : 1 + ‖q‖ ≤ openRadius σ q p := by
    unfold openRadius
    exact le_add_of_nonneg_right (Finset.sum_nonneg fun j _ => norm_nonneg (p j))
  have hweight :
      (1 + ‖q‖) ^ d * (∏ j, (1 + ‖p j‖) ^ 6) ≤ openRadius σ q p ^ (d + 6 * k) := by
    rw [pow_add]
    apply mul_le_mul (pow_le_pow_left₀ (by positivity) hqR d) _ (by positivity) (by positivity)
    calc
      _ ≤ ∏ _j : Fin k, openRadius σ q p ^ 6 := by
        exact Finset.prod_le_prod (fun j _ => by positivity) fun j _ =>
          pow_le_pow_left₀ (by positivity) (external_norm_le_radius σ q p j) 6
      _ = _ := by simp [pow_mul]
  have hweighted :
      ((1 + ‖q‖) ^ d * (∏ j, (1 + ‖p j‖) ^ 6)) * ‖openIntegrand σ f q p‖ ≤
        openBound σ (d + 6 * k) f :=
    (mul_le_mul_of_nonneg_right hweight (norm_nonneg _)).trans
      (weighted_openIntegrand_le σ (d + 6 * k) f q p hp)
  calc
    _ ≤ openBound σ (d + 6 * k) f /
        ((1 + ‖q‖) ^ d * (∏ j, (1 + ‖p j‖) ^ 6)) := by
      apply (le_div_iff₀ (by positivity)).mpr
      simpa only [mul_comm] using hweighted
    _ = _ := by
      simp only [momentumTail_eq_inv_pow, Finset.prod_inv_distrib, div_eq_mul_inv,
        mul_inv_rev]
      ring

private def internalPower {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) : ℕ :=
  Module.finrank ℝ (ILine σ → Spacetime) + 1

private theorem internal_tail_integrable {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    Integrable (fun q : ILine σ → Spacetime => ((1 + ‖q‖) ^ internalPower σ)⁻¹) := by
  have hdim : (Module.finrank ℝ (ILine σ → Spacetime) : ℝ) < (internalPower σ : ℝ) := by
    unfold internalPower
    exact_mod_cast Nat.lt_succ_self _
  have h := integrable_one_add_norm (μ := (volume : Measure (ILine σ → Spacetime))) hdim
  convert h using 1
  ext q
  rw [Real.rpow_neg (by positivity), Real.rpow_natCast]

private theorem ae_mem_forwardCone : ∀ᵐ p ∂mu, p ∈ forwardCone := by
  unfold mu
  rw [ae_withDensity_iff measurable_weight.ennreal_ofReal]
  apply ae_of_all
  intro p hp
  by_contra h
  exact hp (by rw [weight_eq_zero h, ENNReal.ofReal_zero])

/-! Integrate the internal majorant. The external momenta lie in the forward cone
almost everywhere for the product of `mu`, and their remaining majorant is in `L²`. -/
private theorem openMatchingAmp_decay {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) :
    ∃ C : ℝ, ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu),
      ‖openMatchingAmp σ f p‖ ≤ C * ∏ j, momentumTail (p j) := by
  let C := openBound σ (internalPower σ + 6 * k) f
  let I := ∫ q : ILine σ → Spacetime, ((1 + ‖q‖) ^ internalPower σ)⁻¹
  refine ⟨C * I, ?_⟩
  letI : SigmaFinite mu := by unfold mu; infer_instance
  have hp : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), ∀ j, p j ∈ forwardCone :=
    eventually_all.mpr fun _ => Measure.tendsto_eval_ae_ae.eventually ae_mem_forwardCone
  filter_upwards [hp] with p hp
  change ‖∫ q, openIntegrand σ f q p‖ ≤ (C * I) * ∏ j, momentumTail (p j)
  calc
    _ ≤ ∫ q : ILine σ → Spacetime,
        C * ((1 + ‖q‖) ^ internalPower σ)⁻¹ * ∏ j, momentumTail (p j) := by
      apply norm_integral_le_of_norm_le
        (((internal_tail_integrable σ).const_mul C).mul_const _)
      exact ae_of_all _ fun q => openIntegrand_le_product_tail σ (internalPower σ) f q p hp
    _ = _ := by rw [integral_mul_const, integral_const_mul]

private theorem openMatchingAmp_memLp {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) :
    MemLp (openMatchingAmp σ f) 2 (Measure.pi fun _ : Fin k => mu) := by
  obtain ⟨C, hC⟩ := openMatchingAmp_decay σ f
  exact ((product_momentumTail_memLp k).const_mul C).mono'
    (openMatchingAmp_measurable σ f).aestronglyMeasurable hC

private theorem openAmp_memLp {n : ℕ} (m : Fin n → Mon)
    (f : Fin n → TestFunction) (k : ℕ) :
    MemLp (openAmp m f k) 2 (Measure.pi fun _ : Fin k => mu) := by
  unfold openAmp
  exact memLp_finsetSum _ (fun σ _ => openMatchingAmp_memLp σ f)

theorem openAmpW_memLp' (w : Word) (k : ℕ) :
    MemLp (openAmpW w k) 2 (Measure.pi fun _ : Fin k => mu) := by
  unfold openAmpW openAmpL
  exact memLp_finsetSum _ (fun m _ => (openAmp_memLp m w.test k).const_mul _)

end YangMills.FreeField.Consolidated.Theory_OpenAmpWMemLp

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 500 lines] **Square integrability of the amplitudes.** By the directed-cut argument
of `matching_integrable`, now with the external momenta among the lines: for an open matching
`∑_j ‖p j‖ + ∑_ℓ ‖q ℓ‖ ≤ C ∏_v (1 + ‖openMomentum σ q p v‖)`, so the amplitude is measurable
and decays faster than any power of `1 + ∑_j ‖p j‖` on the product of cones, where `mu^{⊗k}` has
polynomial growth. -/
theorem openAmpW_memLp (w : Word) (k : ℕ) :
    MemLp (openAmpW w k) 2 (Measure.pi fun _ : Fin k => mu) := by
  exact Consolidated.Theory_OpenAmpWMemLp.openAmpW_memLp' w k

end YangMills.FreeField
