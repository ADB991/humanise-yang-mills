import FreeField.Theory.Base
import FreeField.Theory.FockOpApply

import Mathlib.Analysis.Normed.Group.Tannery

/-! Proofs consolidated from `FreeField/Work/transOp_continuous.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_TransOpContinuous
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace TransOpContinuousProof

theorem totalMom_continuous (k : ℕ) : Continuous (@totalMom k) := by
  unfold totalMom
  fun_prop

theorem phase_measurable (x : Spacetime) (k : ℕ) : Measurable (phase x k) := by
  apply Continuous.measurable
  unfold phase
  exact Complex.continuous_exp.comp
    (continuous_const.mul (Complex.continuous_ofReal.comp
      (continuous_const.inner (totalMom_continuous k))))

theorem phase_norm (x : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    ‖phase x k p‖ = 1 := by
  simp [phase, Complex.norm_exp, Complex.mul_re]

theorem trans_apply (x : Spacetime) (ψ : FockCarrier) (k : ℕ) :
    (transOp x ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase x k p * (ψ k : (Fin k → Spacetime) → ℂ) p :=
  fockOp_apply (phase x) (fun _ => id) (phase_measurable x)
    (fun k p => (phase_norm x k p).le) (fun _ => MeasurePreserving.id _) ψ k

theorem sector_norm_sq (k : ℕ) (v : Sector k) :
    ‖v‖ ^ 2 = ∫ p, ‖v p‖ ^ 2 ∂(Measure.pi fun _ : Fin k => mu) := by
  rw [@norm_sq_eq_re_inner ℂ, L2.inner_def, ← integral_re (L2.integrable_inner v v)]
  simp only [inner_self_eq_norm_sq_to_K, ← RCLike.ofReal_pow, RCLike.ofReal_re]

theorem fock_norm_sq (v : FockCarrier) : ‖v‖ ^ 2 = ∑' k, ‖v k‖ ^ 2 := by
  simpa using lp.norm_rpow_eq_tsum (by norm_num : (0 : ℝ) < (2 : ℝ≥0∞).toReal) v

theorem sector_tendsto_zero {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {k : ℕ} (v : ι → Sector k) (f : ι → (Fin k → Spacetime) → ℂ)
    (hf : ∀ i, (v i : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu] f i)
    (bound : (Fin k → Spacetime) → ℝ)
    (hb : Integrable (fun p => bound p ^ 2) (Measure.pi fun _ : Fin k => mu))
    (hm : ∀ i, AEStronglyMeasurable (f i) (Measure.pi fun _ : Fin k => mu))
    (hbound : ∀ i, ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), ‖f i p‖ ≤ bound p)
    (ht : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), Tendsto (fun i => f i p) l (𝓝 0)) :
    Tendsto (fun i => ‖v i‖ ^ 2) l (𝓝 0) := by
  have h := tendsto_integral_filter_of_dominated_convergence
    (F := fun i p => ‖f i p‖ ^ 2) (f := fun _ => (0 : ℝ)) (fun p => bound p ^ 2)
    (Eventually.of_forall fun i => (hm i).norm.pow 2)
    (Eventually.of_forall fun i => (hbound i).mono fun p hp => by
      rw [Real.norm_of_nonneg (sq_nonneg _)]
      exact pow_le_pow_left₀ (norm_nonneg _) hp 2) hb
    (ht.mono fun p hp => by simpa using hp.norm.pow 2)
  simp only [integral_zero] at h
  convert h using 1
  funext i
  rw [sector_norm_sq]
  exact integral_congr_ae ((hf i).mono fun p hp => congrArg (fun z : ℂ => ‖z‖ ^ 2) hp)

theorem fock_tendsto_zero {ι : Type*} {l : Filter ι} (v : ι → FockCarrier)
    (bound : ℕ → ℝ) (hb : Summable bound)
    (hbound : ∀ i k, ‖v i k‖ ^ 2 ≤ bound k)
    (ht : ∀ k, Tendsto (fun i => ‖v i k‖ ^ 2) l (𝓝 0)) :
    Tendsto v l (𝓝 0) := by
  have h := tendsto_tsum_of_dominated_convergence hb ht
    (Eventually.of_forall fun i k => by
      simpa only [Real.norm_of_nonneg (sq_nonneg _)] using hbound i k)
  simp only [tsum_zero, ← fock_norm_sq] at h
  have hs := (Real.continuous_sqrt.tendsto 0).comp h
  simp only [Function.comp_def, Real.sqrt_sq_eq_abs, abs_norm, Real.sqrt_zero] at hs
  exact tendsto_zero_iff_norm_tendsto_zero.mpr hs

theorem trans_sector_norm (x : Spacetime) (ψ : FockCarrier) (k : ℕ) :
    ‖transOp x ψ k‖ = ‖ψ k‖ := by
  have hae : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu),
      ‖(transOp x ψ k : (Fin k → Spacetime) → ℂ) p‖ = ‖(ψ k) p‖ := by
    filter_upwards [trans_apply x ψ k] with p hp
    rw [hp, norm_mul, phase_norm, one_mul]
  exact le_antisymm (Lp.norm_le_norm_of_ae_le (hae.mono fun _ h => h.le))
    (Lp.norm_le_norm_of_ae_le (hae.mono fun _ h => h.ge))

end TransOpContinuousProof

theorem transOp_continuous' (ψ : FockCarrier) : Continuous fun x : Spacetime => transOp x ψ := by
  apply continuous_iff_continuousAt.mpr
  intro x₀
  rw [ContinuousAt, ← tendsto_sub_nhds_zero_iff]
  apply TransOpContinuousProof.fock_tendsto_zero _ (fun k => 4 * ‖ψ k‖ ^ 2)
  · have hs : Summable fun k => ‖ψ k‖ ^ 2 := by
      simpa using (lp.memℓp ψ).summable (by norm_num)
    exact hs.mul_left 4
  · intro x k
    have h : ‖(transOp x ψ - transOp x₀ ψ) k‖ ≤ 2 * ‖ψ k‖ := by
      change ‖transOp x ψ k - transOp x₀ ψ k‖ ≤ _
      calc
        _ ≤ ‖transOp x ψ k‖ + ‖transOp x₀ ψ k‖ := norm_sub_le _ _
        _ = _ := by rw [TransOpContinuousProof.trans_sector_norm, TransOpContinuousProof.trans_sector_norm]; ring
    have hh := pow_le_pow_left₀ (norm_nonneg _) h 2
    nlinarith
  · intro k
    refine TransOpContinuousProof.sector_tendsto_zero _
      (fun x p => (phase x k p - phase x₀ k p) * (ψ k) p)
      ?_ (fun p => 2 * ‖(ψ k) p‖) ?_ ?_ ?_ ?_
    · intro x
      filter_upwards [Lp.coeFn_sub (transOp x ψ k) (transOp x₀ ψ k),
        TransOpContinuousProof.trans_apply x ψ k, TransOpContinuousProof.trans_apply x₀ ψ k]
        with p hsub hx hx₀
      change (transOp x ψ k - transOp x₀ ψ k) p = _
      simp only [Pi.sub_apply] at hsub
      rw [hsub, hx, hx₀, sub_mul]
    · have h := ((Lp.memLp (ψ k)).integrable_norm_pow (by norm_num : (2 : ℕ) ≠ 0)).const_mul 4
      convert h using 1
      ext p
      ring
    · intro x
      exact ((TransOpContinuousProof.phase_measurable x k).aestronglyMeasurable.sub
        (TransOpContinuousProof.phase_measurable x₀ k).aestronglyMeasurable).mul (Lp.memLp (ψ k)).1
    · intro x
      exact Eventually.of_forall fun p => by
        rw [norm_mul]
        apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
        calc
          _ ≤ ‖phase x k p‖ + ‖phase x₀ k p‖ := norm_sub_le _ _
          _ = 2 := by rw [TransOpContinuousProof.phase_norm, TransOpContinuousProof.phase_norm]; norm_num
    · apply Eventually.of_forall
      intro p
      have hc : Continuous fun x : Spacetime => phase x k p := by
        unfold phase
        fun_prop
      simpa using ((hc.tendsto x₀).sub_const (phase x₀ k p)).mul_const ((ψ k) p)

end YangMills.FreeField.Consolidated.Theory_TransOpContinuous

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 150 lines] Strong continuity: dominated convergence in each sector, and
`‖transOp x ψ - transOp x₀ ψ‖² = ∑_k ‖…‖²` with a summable majorant `4 ‖ψ_k‖²`
(`tendsto_tsum_of_dominated_convergence`). Depends on `fockOp_apply`. -/
theorem transOp_continuous (ψ : FockCarrier) : Continuous fun x : Spacetime => transOp x ψ := by
  exact Consolidated.Theory_TransOpContinuous.transOp_continuous' ψ

end YangMills.FreeField
