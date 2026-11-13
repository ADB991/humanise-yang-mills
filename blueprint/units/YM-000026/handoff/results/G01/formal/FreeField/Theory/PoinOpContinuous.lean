import FreeField.Theory.Base
import FreeField.Analytic.MuMapAdjoint
import FreeField.Theory.FockOpApply

import Mathlib.MeasureTheory.Function.LpSpace.ContinuousCompMeasurePreserving
import Mathlib.Analysis.Normed.Group.FunctionSeries

/-! Proofs consolidated from `FreeField/Work/poinOp_continuous.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PoinOpContinuous
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PoincareContinuityProof

private instance mu_sigmaFinite : SigmaFinite mu := by unfold mu; infer_instance

private theorem weight_bound (p : Spacetime) : weight p ≤ time p ^ 4 := by
  unfold weight
  split_ifs with hp
  · have hs : ‖spatial p‖ ≤ time p := hp
    have ht : 0 ≤ time p := (norm_nonneg _).trans hs
    have hm : 0 ≤ minkowskiSquare p := by
      unfold minkowskiSquare
      nlinarith [norm_nonneg (spatial p)]
    have hmle : minkowskiSquare p ≤ time p ^ 2 := by
      unfold minkowskiSquare
      nlinarith [sq_nonneg ‖spatial p‖]
    have hl : 1 ≤ Real.log (Real.exp 1 + minkowskiSquare p) := by
      rw [Real.le_log_iff_exp_le (by positivity)]
      linarith
    have hl2 : 1 ≤ Real.log (Real.exp 1 + minkowskiSquare p) ^ 2 := by
      nlinarith
    apply (div_le_iff₀ (by positivity :
      0 < Real.log (Real.exp 1 + minkowskiSquare p) ^ 2)).2
    calc
      minkowskiSquare p ^ 2 ≤ (time p ^ 2) ^ 2 := pow_le_pow_left₀ hm hmle 2
      _ = time p ^ 4 := by ring
      _ ≤ time p ^ 4 * Real.log (Real.exp 1 + minkowskiSquare p) ^ 2 :=
        le_mul_of_one_le_right (by positivity) hl2
  · positivity

private instance mu_locallyFinite : IsLocallyFiniteMeasure mu := by
  have hc : Continuous (fun p : Spacetime => time p ^ 4) := by unfold time; fun_prop
  letI := IsLocallyFiniteMeasure.withDensity_ofReal (μ := volume) hc
  exact Measure.isLocallyFiniteMeasure_of_le
    (withDensity_mono (ae_of_all _ fun p => ENNReal.ofReal_le_ofReal (weight_bound p)))

private theorem phase_norm (a : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    ‖phase a k p‖ = 1 := by
  simp [phase, Complex.norm_exp, Complex.mul_re]

private theorem phase_continuous (k : ℕ) :
    Continuous (fun ap : Spacetime × (Fin k → Spacetime) => phase ap.1 k ap.2) := by
  unfold phase totalMom
  fun_prop

private theorem lor_preserving (g : Sym) (k : ℕ) :
    MeasurePreserving (fun p : Fin k → Spacetime => fun j => lorT g.lor (p j))
      (Measure.pi fun _ : Fin k => mu) (Measure.pi fun _ : Fin k => mu) :=
  measurePreserving_pi _ _ fun _ => ⟨(lorT g.lor).continuous.measurable, mu_map_adjoint g.lor⟩

private theorem lor_continuous (k : ℕ) :
    Continuous (fun gp : Sym × (Fin k → Spacetime) => fun j => lorT gp.1.lor (gp.2 j)) := by
  unfold lorT Sym.lor
  fun_prop

private def lorMap (k : ℕ) (g : Sym) : C((Fin k → Spacetime), (Fin k → Spacetime)) :=
  ⟨fun p j => lorT g.lor (p j), by fun_prop⟩

private theorem composition_continuous (k : ℕ) (f : Sector k) :
    Continuous (fun g : Sym => Lp.compMeasurePreserving (lorMap k g) (lor_preserving g k) f) := by
  apply Continuous.compMeasurePreservingLp continuous_const _ _ (by norm_num)
  exact ContinuousMap.continuous_of_continuous_uncurry (lorMap k) (lor_continuous k)

private theorem continuous_of_norm_sq_diff {X E : Type*} [TopologicalSpace X]
    [NormedAddCommGroup E] (f : X → E)
    (h : ∀ x, Continuous (fun y => ‖f y - f x‖ ^ 2)) : Continuous f := by
  apply continuous_iff_continuousAt.mpr
  intro x
  rw [ContinuousAt, tendsto_iff_norm_sub_tendsto_zero]
  simpa [Function.comp_def, Real.sqrt_sq_eq_abs] using (Real.continuous_sqrt.comp (h x)).tendsto x

private theorem sector_norm_sq (k : ℕ) (f : Sector k) :
    ‖f‖ ^ 2 = ∫ p, ‖f p‖ ^ 2 ∂(Measure.pi fun _ : Fin k => mu) := by
  rw [@norm_sq_eq_re_inner ℂ, L2.inner_def, ← integral_re (L2.integrable_inner f f)]
  simp only [inner_self_eq_norm_sq]

private theorem phase_memLp (a : Spacetime) (k : ℕ) (f : Sector k) :
    MemLp (fun p => phase a k p * f p) 2 (Measure.pi fun _ : Fin k => mu) := by
  have hm : Measurable (phase a k) :=
    ((phase_continuous k).comp (continuous_const.prodMk continuous_id)).measurable
  apply (Lp.memLp f).of_le (hm.aestronglyMeasurable.mul (Lp.aestronglyMeasurable f))
  exact ae_of_all _ fun p => by simp [phase_norm]

private def phaseVector (a : Spacetime) (k : ℕ) (f : Sector k) : Sector k :=
  (phase_memLp a k f).toLp _

private theorem phaseVector_ae (a : Spacetime) (k : ℕ) (f : Sector k) :
    (phaseVector a k f : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase a k p * f p := MemLp.coeFn_toLp _

private theorem phaseVector_lipschitz (a : Spacetime) (k : ℕ) :
    LipschitzWith 1 (phaseVector a k) := by
  apply LipschitzWith.of_dist_le_mul
  intro f h
  simp only [NNReal.coe_one, one_mul, dist_eq_norm]
  apply Lp.norm_le_norm_of_ae_le
  filter_upwards [Lp.coeFn_sub (phaseVector a k f) (phaseVector a k h),
    phaseVector_ae a k f, phaseVector_ae a k h, Lp.coeFn_sub f h] with p ho hf hh hi
  simp only [Pi.sub_apply] at ho hi
  rw [ho, hf, hh, ← mul_sub, norm_mul, phase_norm, one_mul, hi]

private theorem phaseVector_continuous_fixed (k : ℕ) (f : Sector k) :
    Continuous (fun a : Spacetime => phaseVector a k f) := by
  apply continuous_of_norm_sq_diff
  intro b
  have hid (a : Spacetime) : ‖phaseVector a k f - phaseVector b k f‖ ^ 2 =
      ∫ p, ‖(phase a k p - phase b k p) * f p‖ ^ 2 ∂(Measure.pi fun _ : Fin k => mu) := by
    rw [sector_norm_sq]
    apply integral_congr_ae
    filter_upwards [Lp.coeFn_sub (phaseVector a k f) (phaseVector b k f),
      phaseVector_ae a k f, phaseVector_ae b k f] with p ho ha hb
    simp only [Pi.sub_apply] at ho
    rw [ho, ha, hb, sub_mul]
  simp_rw [hid]
  apply continuous_of_dominated (bound := fun p => 4 * ‖f p‖ ^ 2)
  · intro a
    have hm (c : Spacetime) : AEStronglyMeasurable (phase c k) (Measure.pi fun _ : Fin k => mu) :=
      ((phase_continuous k).comp (continuous_const.prodMk continuous_id)).measurable.aestronglyMeasurable
    exact (((hm a).sub (hm b)).mul (Lp.aestronglyMeasurable f)).norm.pow 2
  · intro a
    apply ae_of_all
    intro p
    have he : ‖phase a k p - phase b k p‖ ≤ 2 := by
      simpa only [phase_norm, one_add_one_eq_two] using norm_sub_le (phase a k p) (phase b k p)
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _), norm_mul, mul_pow]
    exact mul_le_mul_of_nonneg_right
      (by nlinarith [norm_nonneg (phase a k p - phase b k p)]) (sq_nonneg _)
  · exact ((memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable f)).mp (Lp.memLp f)).const_mul 4
  · apply ae_of_all
    intro p
    have hc : Continuous (fun a : Spacetime => phase a k p) := by
      unfold phase
      fun_prop
    exact ((hc.sub continuous_const).mul continuous_const).norm.pow 2

private theorem phaseVector_continuous (k : ℕ) :
    Continuous (fun af : Spacetime × Sector k => phaseVector af.1 k af.2) :=
  continuous_prod_of_continuous_lipschitzWith' _ 1 (fun a => phaseVector_lipschitz a k)
    (phaseVector_continuous_fixed k)

private theorem phaseVector_norm_le (a : Spacetime) (k : ℕ) (f : Sector k) :
    ‖phaseVector a k f‖ ≤ ‖f‖ := by
  apply Lp.norm_le_norm_of_ae_le
  filter_upwards [phaseVector_ae a k f] with p hp
  simp only [hp, norm_mul, phase_norm, one_mul, le_refl]

private theorem poin_apply (g : Sym) (ψ : FockCarrier) (k : ℕ) :
    (poinOp g ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase g.shift k p * (ψ k) (fun j => lorT g.lor (p j)) :=
  fockOp_apply _ _
    (fun k => ((phase_continuous k).comp (continuous_const.prodMk continuous_id)).measurable)
    (fun k p => (phase_norm g.shift k p).le) (lor_preserving g) ψ k

private theorem poin_sector (g : Sym) (ψ : FockCarrier) (k : ℕ) :
    poinOp g ψ k = phaseVector g.shift k
      (Lp.compMeasurePreserving (lorMap k g) (lor_preserving g k) (ψ k)) := by
  apply Lp.ext
  filter_upwards [poin_apply g ψ k,
    phaseVector_ae g.shift k (Lp.compMeasurePreserving (lorMap k g) (lor_preserving g k) (ψ k)),
    Lp.coeFn_compMeasurePreserving (f := lorMap k g) (ψ k) (lor_preserving g k)] with p hp hm hc
  rw [hp, hm, hc]
  rfl

private theorem poin_sector_continuous (ψ : FockCarrier) (k : ℕ) :
    Continuous (fun g : Sym => poinOp g ψ k) := by
  simp_rw [poin_sector]
  have hs : Continuous (fun g : Sym => g.shift) := continuous_snd
  simpa only [Function.comp_def] using (phaseVector_continuous k).comp
    (hs.prodMk (composition_continuous k (ψ k)))

private theorem poin_sector_norm_le (g : Sym) (ψ : FockCarrier) (k : ℕ) :
    ‖poinOp g ψ k‖ ≤ ‖ψ k‖ := by
  rw [poin_sector]
  exact (phaseVector_norm_le _ _ _).trans_eq (Lp.norm_compMeasurePreserving _ _)

private theorem fock_norm_sq (ψ : FockCarrier) : ‖ψ‖ ^ 2 = ∑' k, ‖ψ k‖ ^ 2 := by
  simpa using lp.norm_rpow_eq_tsum (p := 2) (by norm_num) ψ

end PoincareContinuityProof
open PoincareContinuityProof in
theorem poinOp_continuous' (ψ : FockCarrier) : Continuous fun g : Sym => poinOp g ψ := by
  apply continuous_of_norm_sq_diff
  intro h
  simp_rw [fock_norm_sq]
  simp only [lp.coeFn_sub, Pi.sub_apply]
  apply continuous_tsum (u := fun k => 4 * ‖ψ k‖ ^ 2)
  · intro k
    exact ((poin_sector_continuous ψ k).sub continuous_const).norm.pow 2
  · have hs : Summable (fun k : ℕ => ‖ψ k‖ ^ 2) := by
      simpa using (lp.memℓp ψ).summable (by norm_num)
    exact hs.mul_left 4
  · intro k g
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
    have hn : ‖poinOp g ψ k - poinOp h ψ k‖ ≤ 2 * ‖ψ k‖ := by
      calc
        _ ≤ ‖poinOp g ψ k‖ + ‖poinOp h ψ k‖ := norm_sub_le _ _
        _ ≤ ‖ψ k‖ + ‖ψ k‖ := add_le_add (poin_sector_norm_le g ψ k) (poin_sector_norm_le h ψ k)
        _ = 2 * ‖ψ k‖ := by ring
    calc
      _ ≤ (2 * ‖ψ k‖) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) hn 2
      _ = 4 * ‖ψ k‖ ^ 2 := by ring

end YangMills.FreeField.Consolidated.Theory_PoinOpContinuous

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 400 lines] Strong continuity on the group. By `poinOp_norm` and density it suffices to
treat `ψ` with finitely many non-zero sectors, each continuous with compact support (dense in
`L²(mu^k)` since `mu` is a Radon measure); then use uniform continuity and dominated convergence,
with the topology of `ProperLorentz` (units of continuous linear maps) giving continuity of
`Λ ↦ Λᵀ p`. Depends on `fockOp_apply`, `mu_map_adjoint`, `poinOp_norm`. -/
theorem poinOp_continuous (ψ : FockCarrier) : Continuous fun g : Sym => poinOp g ψ := by
  exact Consolidated.Theory_PoinOpContinuous.poinOp_continuous' ψ

end YangMills.FreeField
