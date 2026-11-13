import FreeField.Theory.Base
import FreeField.Theory.FockOpApply


/-! Proofs consolidated from `FreeField/Work/projOp_cone.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_ProjOpCone
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace ProjOpConeProof

theorem totalMom_continuous (k : ℕ) : Continuous (@totalMom k) := by
  unfold totalMom
  fun_prop

theorem proj_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) (k : ℕ) :
    (projOp B ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => if totalMom p ∈ B then (ψ k) p else 0 := by
  rw [projOp, if_pos hB]
  have h := fockOp_apply (fun _ p => if totalMom p ∈ B then 1 else 0) (fun _ => id)
    (fun k => Measurable.ite (hB.preimage (totalMom_continuous k).measurable)
      measurable_const measurable_const)
    (fun k p => by split_ifs <;> simp) (fun _ => MeasurePreserving.id _) ψ k
  simpa only [ite_mul, one_mul, zero_mul, id_eq] using h

theorem cone_measurable : MeasurableSet forwardCone := by
  apply isClosed_le ?_ ?_ |>.measurableSet
  · change Continuous fun x : Spacetime => ‖spatial x‖
    unfold spatial
    fun_prop
  · unfold time
    fun_prop

theorem mu_ae_cone : ∀ᵐ p ∂mu, p ∈ forwardCone := by
  rw [ae_iff]
  change mu forwardConeᶜ = 0
  rw [mu, withDensity_apply _ cone_measurable.compl]
  calc
    _ = ∫⁻ _p : Spacetime, (0 : ℝ≥0∞) ∂volume.restrict forwardConeᶜ := by
      apply lintegral_congr_ae
      filter_upwards [ae_restrict_mem cone_measurable.compl] with p hp
      simp [weight_eq_zero hp]
    _ = 0 := by simp

theorem totalMom_cone {k : ℕ} (p : Fin k → Spacetime) (hp : ∀ j, p j ∈ forwardCone) :
    totalMom p ∈ forwardCone := by
  have hs : spatial (totalMom p) = ∑ j, spatial (p j) := by
    ext i
    simp [spatial, totalMom]
  have ht : time (totalMom p) = ∑ j, time (p j) := by
    simp [time, totalMom]
  change ‖spatial (totalMom p)‖ ≤ time (totalMom p)
  rw [hs, ht]
  exact (norm_sum_le _ _).trans (Finset.sum_le_sum fun j _ => hp j)

theorem totalMom_ae_cone (k : ℕ) :
    ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), totalMom p ∈ forwardCone := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  have h : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu), ∀ j, p j ∈ forwardCone :=
    ae_all_iff.mpr fun j => Measure.tendsto_eval_ae_ae.eventually mu_ae_cone
  exact h.mono fun p hp => totalMom_cone p hp

end ProjOpConeProof

theorem projOp_cone' : projOp forwardConeᶜ = 0 := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [ProjOpConeProof.proj_apply ProjOpConeProof.cone_measurable.compl ψ k,
    ProjOpConeProof.totalMom_ae_cone k, Lp.coeFn_zero ℂ 2 (Measure.pi fun _ : Fin k => mu)]
    with p hproj hcone hz
  change (projOp forwardConeᶜ ψ k) p = (0 : Sector k) p
  have hzero : (projOp forwardConeᶜ ψ k) p = 0 := by simpa [hcone] using hproj
  exact hzero.trans hz.symm

end YangMills.FreeField.Consolidated.Theory_ProjOpCone

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 120 lines] Positive energy: `mu` is carried by the closed forward cone, a convex
cone, so `∑ p_j ∈ forwardCone` almost everywhere on every sector (for `k = 0` the sum is `0`,
which lies in the cone). Depends on `fockOp_apply`. -/
theorem projOp_cone : projOp forwardConeᶜ = 0 := by
  exact Consolidated.Theory_ProjOpCone.projOp_cone'

end YangMills.FreeField
