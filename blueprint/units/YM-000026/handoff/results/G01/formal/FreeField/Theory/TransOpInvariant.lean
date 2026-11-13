import FreeField.Theory.Base
import FreeField.Theory.FockOpApply
import FreeField.Theory.PsiApply


/-! Proofs consolidated from `FreeField/Work/transOp_invariant.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_TransOpInvariant
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace TranslationInvariantProof

private theorem phase_measurable (x : Spacetime) (k : ℕ) : Measurable (phase x k) := by
  apply Continuous.measurable
  unfold phase totalMom
  fun_prop

private theorem trans_apply (x : Spacetime) (ψ : FockCarrier) (k : ℕ) :
    (transOp x ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase x k p * (ψ k : (Fin k → Spacetime) → ℂ) p := by
  apply fockOp_apply _ _ (phase_measurable x) _ (fun _ => MeasurePreserving.id _) ψ k
  intro k p
  simp [phase, Complex.norm_exp, Complex.mul_re]

private theorem weight_measurable : Measurable weight := by
  have ht : Continuous time := by unfold time; fun_prop
  have hs : Continuous spatial := by unfold spatial; fun_prop
  have hm : Continuous minkowskiSquare := (ht.pow 2).sub (hs.norm.pow 2)
  exact Measurable.ite (isClosed_le hs.norm ht).measurableSet
    ((hm.measurable.pow_const 2).div
      ((measurable_const.add hm.measurable).log.pow_const 2)) measurable_const

private theorem positive_time : ∀ᵐ p ∂mu, 0 < time p := by
  rw [mu, ae_withDensity_iff weight_measurable.ennreal_ofReal]
  apply ae_of_all
  intro p hp
  have hw : weight p ≠ 0 := by
    intro h
    simp [h] at hp
  have hc : p ∈ forwardCone := by
    by_contra h
    exact hw (weight_eq_zero h)
  have ht : 0 ≤ time p := (norm_nonneg _).trans hc
  apply lt_of_le_of_ne ht
  intro heq
  have hs : ‖spatial p‖ = 0 := le_antisymm (hc.trans heq.ge) (norm_nonneg _)
  apply hw
  simp [weight, hc, minkowskiSquare, ← heq, hs]

private theorem empty_amp_general (m : Fin 0 → Mon) (f : Fin 0 → TestFunction)
    (p : Fin 0 → Spacetime) : openAmp m f 0 p = 1 := by
  letI : Unique (OMatching 0 m) :=
    { default := ⟨Equiv.refl _, fun x => isEmptyElim x, fun x => isEmptyElim x⟩
      uniq := fun x => Subtype.ext (Subsingleton.elim _ _) }
  simp [openAmp, ILine, Leg, MeasureTheory.volume_pi, measureReal_def]

private theorem empty_amp (p : Fin 0 → Spacetime) : openAmpW [] 0 p = 1 := by
  simp [openAmpW, openAmpL, empty_amp_general]

private theorem positive_total_time (k : ℕ) (hk : 0 < k) :
    ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), 0 < time (totalMom p) := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  have hall : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), ∀ j, 0 < time (p j) :=
    eventually_all.mpr fun j => (Measure.tendsto_eval_ae_ae (μ := fun _ : Fin k => mu) (i := j)).eventually positive_time
  filter_upwards [hall] with p hp
  have : Nonempty (Fin k) := ⟨⟨0, hk⟩⟩
  simpa [time, totalMom] using Finset.sum_pos (fun j (_ : j ∈ Finset.univ) => hp j)
    Finset.univ_nonempty

private theorem invariant_sector_zero (ψ : FockCarrier) (h : ∀ x, transOp x ψ = ψ)
    (k : ℕ) (hk : 0 < k) : ψ k = 0 := by
  have hrat (q : ℚ) : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu),
      phase (EuclideanSpace.single timeAxis (q : ℝ)) k p * (ψ k) p = (ψ k) p := by
    have ht := trans_apply (EuclideanSpace.single timeAxis (q : ℝ)) ψ k
    rw [h] at ht
    exact ht.symm
  apply Lp.ext
  filter_upwards [ae_all_iff.mpr hrat, positive_total_time k hk,
    Lp.coeFn_zero ℂ 2 (Measure.pi fun _ : Fin k => mu)] with p hp hpos hz
  rw [hz]
  change (ψ k) p = 0
  have heq : (fun t : ℝ => phase (EuclideanSpace.single timeAxis t) k p * (ψ k) p) =
      (fun _ : ℝ => (ψ k) p) := by
    apply Rat.denseRange_cast.equalizer
    · unfold phase
      simp only [EuclideanSpace.inner_single_left, conj_trivial]
      fun_prop
    · exact continuous_const
    · exact funext hp
  have hv := congrFun heq (Real.pi / time (totalMom p))
  have hphase : phase (EuclideanSpace.single timeAxis (Real.pi / time (totalMom p))) k p = -1 := by
    simp only [phase, EuclideanSpace.inner_single_left, conj_trivial]
    change Complex.exp (Complex.I * ((Real.pi / time (totalMom p) * time (totalMom p) : ℝ) : ℂ)) = -1
    rw [div_mul_cancel₀ _ hpos.ne', mul_comm, Complex.exp_pi_mul_I]
  rw [hphase] at hv
  linear_combination - (1 / 2 : ℂ) * hv

private theorem empty_amp_pos (k : ℕ) (hk : 0 < k) (p : Fin k → Spacetime) :
    openAmpW [] k p = 0 := by
  have hempty (m : Fin 0 → Mon) : IsEmpty (OMatching k m) := by
    refine ⟨fun σ => ?_⟩
    have h := σ.2.2 (Sum.inl ⟨0, hk⟩)
    cases he : σ.1 (Sum.inl ⟨0, hk⟩) with
    | inl j => exact h (by simp [he, ovtx])
    | inr l => exact isEmptyElim l
  simp [openAmpW, openAmpL, openAmp]

private theorem vacuum_zero_sector :
    (Psi [] 0 : (Fin 0 → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin 0 => mu] fun _ => 1 := by
  rw [Psi_apply]
  simp only [Nat.factorial_zero, Nat.cast_one, Real.sqrt_one, inv_one, Complex.ofReal_one, one_smul]
  grw [MemLp.coeFn_toLp]
  exact ae_of_all _ empty_amp

private theorem vacuum_pos_sector (k : ℕ) (hk : 0 < k) : Psi [] k = 0 := by
  rw [Psi_apply]
  apply smul_eq_zero_of_right
  apply Lp.ext
  grw [MemLp.coeFn_toLp, Lp.coeFn_zero]
  exact ae_of_all _ (empty_amp_pos k hk)

end TranslationInvariantProof

open TranslationInvariantProof in
theorem transOp_invariant' (ψ : FockCarrier) (h : ∀ x, transOp x ψ = ψ) :
    ∃ c : ℂ, c • Psi [] = ψ := by
  refine ⟨(ψ 0 : (Fin 0 → Spacetime) → ℂ) (fun i => i.elim0), ?_⟩
  apply lp.ext
  funext k
  change ((ψ 0) (fun i => i.elim0)) • Psi [] k = ψ k
  cases k with
  | zero =>
    apply Lp.ext
    filter_upwards [vacuum_zero_sector,
      Lp.coeFn_smul ((ψ 0) (fun i => i.elim0)) (Psi [] 0)] with p hp hs
    rw [hs]
    change (ψ 0) (fun i => i.elim0) * (Psi [] 0) p = (ψ 0) p
    rw [hp, mul_one]
    congr 1
    exact Subsingleton.elim _ _
  | succ k =>
    rw [vacuum_pos_sector _ (Nat.succ_pos k), smul_zero,
      invariant_sector_zero ψ h _ (Nat.succ_pos k)]

end YangMills.FreeField.Consolidated.Theory_TransOpInvariant

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 200 lines] Uniqueness of the vacuum in the host. If `transOp x ψ = ψ` for all `x`
then for `k ≥ 1` and all `τ` in a countable dense set, `exp (i τ ∑ (p_j)_t) ψ_k = ψ_k` a.e.;
since `∑ (p_j)_t > 0` a.e. (`mu` is absolutely continuous and carried by the cone), `ψ_k = 0`.
The sector `k = 0` is one-dimensional and contains `Psi []`, whose component is `1`.
Depends on `fockOp_apply`, `Psi_apply`. -/
theorem transOp_invariant (ψ : FockCarrier) (h : ∀ x, transOp x ψ = ψ) :
    ∃ c : ℂ, c • Psi [] = ψ := by
  exact Consolidated.Theory_TransOpInvariant.transOp_invariant' ψ h

end YangMills.FreeField
