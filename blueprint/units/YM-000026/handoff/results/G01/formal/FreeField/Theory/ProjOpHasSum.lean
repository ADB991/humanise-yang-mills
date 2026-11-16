import FreeField.Theory.Base
import FreeField.Theory.FockOpApply

import Mathlib.Analysis.Normed.Group.Tannery

/-! Proofs consolidated from `FreeField/Work/projOp_hasSum.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_ProjOpHasSum
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace ProjOpHasSumProof

theorem totalMom_continuous (k : ℕ) : Continuous (@totalMom k) := by
  unfold totalMom
  fun_prop

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

theorem proj_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) (k : ℕ) :
    (projOp B ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => if totalMom p ∈ B then (ψ k) p else 0 := by
  rw [projOp, if_pos hB]
  have h := fockOp_apply (fun _ p => if totalMom p ∈ B then 1 else 0) (fun _ => id)
    (fun k => Measurable.ite (hB.preimage (totalMom_continuous k).measurable)
      measurable_const measurable_const)
    (fun k p => by split_ifs <;> simp) (fun _ => MeasurePreserving.id _) ψ k
  simpa only [ite_mul, one_mul, zero_mul, id_eq] using h

theorem proj_sector_norm_le {B : Set Spacetime} (hB : MeasurableSet B)
    (ψ : FockCarrier) (k : ℕ) : ‖projOp B ψ k‖ ≤ ‖ψ k‖ := by
  apply Lp.norm_le_norm_of_ae_le
  filter_upwards [proj_apply hB ψ k] with p hp
  rw [hp]
  split_ifs <;> simp

theorem proj_finset (regions : ℕ → Set Spacetime) (hm : ∀ i, MeasurableSet (regions i))
    (hd : Pairwise (Disjoint on regions)) (ψ : FockCarrier) (s : Finset ℕ) :
    ∑ i ∈ s, projOp (regions i) ψ = projOp (⋃ i ∈ s, regions i) ψ := by
  apply lp.ext
  funext k
  change (∑ i ∈ s, projOp (regions i) ψ) k = projOp (⋃ i ∈ s, regions i) ψ k
  have heval : (∑ i ∈ s, projOp (regions i) ψ) k = ∑ i ∈ s, projOp (regions i) ψ k := by
    simpa only [Finset.sum_apply] using congrFun (lp.coeFn_sum (fun i => projOp (regions i) ψ) s) k
  rw [heval]
  apply Lp.ext
  filter_upwards [Lp.coeFn_fun_finsetSum s (fun i => projOp (regions i) ψ k),
    (ae_all_iff.mpr fun i => proj_apply (hm i) ψ k),
    proj_apply (MeasurableSet.biUnion s.countable_toSet (fun i _ => hm i)) ψ k]
    with p hsum hi hproj
  calc
    _ = ∑ i ∈ s, (projOp (regions i) ψ k) p := hsum
    _ = ∑ i ∈ s, (regions i).indicator (fun _ => (ψ k) p) (totalMom p) := by
      apply Finset.sum_congr rfl
      intro i _
      simpa only [Set.indicator_apply] using hi i
    _ = (⋃ i ∈ s, regions i).indicator (fun _ => (ψ k) p) (totalMom p) :=
      (Finset.indicator_biUnion_apply s regions
      (fun i _ j _ hij => hd hij) (totalMom p)).symm
    _ = _ := hproj.symm

end ProjOpHasSumProof

theorem projOp_hasSum' (regions : ℕ → Set Spacetime) (hm : ∀ i, MeasurableSet (regions i))
    (hd : Pairwise (Disjoint on regions)) (ψ : FockCarrier) :
    HasSum (fun i => projOp (regions i) ψ) (projOp (⋃ i, regions i) ψ) := by
  have hfull : MeasurableSet (⋃ i, regions i) := MeasurableSet.iUnion hm
  have hfin (s : Finset ℕ) : MeasurableSet (⋃ i ∈ s, regions i) :=
    MeasurableSet.biUnion s.countable_toSet (fun i _ => hm i)
  change Tendsto (fun s : Finset ℕ => ∑ i ∈ s, projOp (regions i) ψ) atTop
    (𝓝 (projOp (⋃ i, regions i) ψ))
  simp_rw [ProjOpHasSumProof.proj_finset regions hm hd ψ]
  rw [← tendsto_sub_nhds_zero_iff]
  apply ProjOpHasSumProof.fock_tendsto_zero _ (fun k => 4 * ‖ψ k‖ ^ 2)
  · have hs : Summable fun k => ‖ψ k‖ ^ 2 := by
      simpa using (lp.memℓp ψ).summable (by norm_num)
    exact hs.mul_left 4
  · intro s k
    have h : ‖(projOp (⋃ i ∈ s, regions i) ψ - projOp (⋃ i, regions i) ψ) k‖ ≤
        2 * ‖ψ k‖ := by
      change ‖projOp (⋃ i ∈ s, regions i) ψ k - projOp (⋃ i, regions i) ψ k‖ ≤ _
      calc
        _ ≤ ‖projOp (⋃ i ∈ s, regions i) ψ k‖ + ‖projOp (⋃ i, regions i) ψ k‖ := norm_sub_le _ _
        _ ≤ ‖ψ k‖ + ‖ψ k‖ := add_le_add
          (ProjOpHasSumProof.proj_sector_norm_le (hfin s) ψ k)
          (ProjOpHasSumProof.proj_sector_norm_le hfull ψ k)
        _ = _ := by ring
    have hh := pow_le_pow_left₀ (norm_nonneg _) h 2
    nlinarith
  · intro k
    refine ProjOpHasSumProof.sector_tendsto_zero _
      (fun s p => (if totalMom p ∈ ⋃ i ∈ s, regions i then (ψ k) p else 0) -
        (if totalMom p ∈ ⋃ i, regions i then (ψ k) p else 0))
      ?_ (fun p => 2 * ‖(ψ k) p‖) ?_ ?_ ?_ ?_
    · intro s
      filter_upwards [Lp.coeFn_sub (projOp (⋃ i ∈ s, regions i) ψ k)
          (projOp (⋃ i, regions i) ψ k),
        ProjOpHasSumProof.proj_apply (hfin s) ψ k, ProjOpHasSumProof.proj_apply hfull ψ k]
        with p hsub hs hf
      change (projOp (⋃ i ∈ s, regions i) ψ k - projOp (⋃ i, regions i) ψ k) p = _
      simpa only [Pi.sub_apply, hs, hf] using hsub
    · have h := ((Lp.memLp (ψ k)).integrable_norm_pow (by norm_num : (2 : ℕ) ≠ 0)).const_mul 4
      convert h using 1
      ext p
      ring
    · intro s
      exact ((Lp.memLp (ψ k)).1.indicator
        ((hfin s).preimage (ProjOpHasSumProof.totalMom_continuous k).measurable)).sub
        ((Lp.memLp (ψ k)).1.indicator
          (hfull.preimage (ProjOpHasSumProof.totalMom_continuous k).measurable))
    · intro s
      exact Eventually.of_forall fun p => by
        split_ifs <;> simp <;> nlinarith [norm_nonneg ((ψ k) p)]
    · apply Eventually.of_forall
      intro p
      apply tendsto_const_nhds.congr'
      by_cases hp : totalMom p ∈ ⋃ i, regions i
      · obtain ⟨i, hi⟩ := Set.mem_iUnion.mp hp
        filter_upwards [eventually_ge_atTop ({i} : Finset ℕ)] with s hs
        have hi' : totalMom p ∈ ⋃ j ∈ s, regions j := by
          exact Set.mem_iUnion.mpr ⟨i, Set.mem_iUnion.mpr ⟨hs (by simp), hi⟩⟩
        simp [hp, hi']
      · have hn (s : Finset ℕ) : totalMom p ∉ ⋃ i ∈ s, regions i := by
          intro hh
          obtain ⟨i, hi⟩ := Set.mem_iUnion.mp hh
          obtain ⟨_, hi⟩ := Set.mem_iUnion.mp hi
          exact hp (Set.mem_iUnion.mpr ⟨i, hi⟩)
        exact Eventually.of_forall fun s => by simp [hp, hn s]

end YangMills.FreeField.Consolidated.Theory_ProjOpHasSum

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 150 lines] Countable additivity in the strong sense: sectorwise dominated
convergence of the partial sums of indicators. Depends on `fockOp_apply`. -/
theorem projOp_hasSum (regions : ℕ → Set Spacetime) (hm : ∀ i, MeasurableSet (regions i))
    (hd : Pairwise (Disjoint on regions)) (ψ : FockCarrier) :
    HasSum (fun i => projOp (regions i) ψ) (projOp (⋃ i, regions i) ψ) := by
  exact Consolidated.Theory_ProjOpHasSum.projOp_hasSum' regions hm hd ψ

end YangMills.FreeField
