import FreeField.Theory

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace FockOpProof

variable {k : ℕ} {c : (Fin k → Spacetime) → ℂ}
  {T : (Fin k → Spacetime) → (Fin k → Spacetime)}
  (hc : Measurable c) (hb : ∀ p, ‖c p‖ ≤ 1)
  (hT : MeasurePreserving T (Measure.pi fun _ : Fin k => mu)
    (Measure.pi fun _ : Fin k => mu))

include hc hb hT

theorem sector_memLp (ψ : Sector k) :
    MemLp (fun p => c p * (ψ : (Fin k → Spacetime) → ℂ) (T p)) 2
      (Measure.pi fun _ : Fin k => mu) := by
  have hψ := (Lp.memLp ψ).comp_measurePreserving hT
  apply hψ.of_le (hc.aestronglyMeasurable.mul hψ.aestronglyMeasurable)
  exact Eventually.of_forall fun p => by
    simpa only [Pi.mul_apply, norm_mul, one_mul, Function.comp_apply] using
      mul_le_mul_of_nonneg_right (hb p) (norm_nonneg (ψ (T p)))

theorem sector_apply (ψ : Sector k) :
    (sectorMap k c T ψ : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => c p * (ψ : (Fin k → Spacetime) → ℂ) (T p) := by
  rw [sectorMap, dif_pos (sector_memLp hc hb hT ψ)]
  exact MemLp.coeFn_toLp _

theorem sector_norm (ψ : Sector k) : ‖sectorMap k c T ψ‖ ≤ ‖ψ‖ := by
  rw [← Lp.norm_compMeasurePreserving ψ hT]
  apply Lp.norm_le_norm_of_ae_le
  filter_upwards [sector_apply hc hb hT ψ, Lp.coeFn_compMeasurePreserving ψ hT]
    with p hp hq
  rw [hp, hq, norm_mul]
  simpa only [one_mul, Function.comp_apply] using
    mul_le_mul_of_nonneg_right (hb p) (norm_nonneg (ψ (T p)))

theorem sector_add (ψ φ : Sector k) :
    sectorMap k c T (ψ + φ) = sectorMap k c T ψ + sectorMap k c T φ := by
  apply Lp.ext
  filter_upwards [sector_apply hc hb hT (ψ + φ), sector_apply hc hb hT ψ,
    sector_apply hc hb hT φ, Lp.coeFn_add (sectorMap k c T ψ) (sectorMap k c T φ),
    hT.quasiMeasurePreserving.tendsto_ae.eventually (Lp.coeFn_add ψ φ)]
    with p hp hψ hφ hadd hin
  simp only [Pi.add_apply] at hin hadd
  rw [hp, hadd, hψ, hφ, hin, mul_add]

theorem sector_smul (a : ℂ) (ψ : Sector k) :
    sectorMap k c T (a • ψ) = a • sectorMap k c T ψ := by
  apply Lp.ext
  filter_upwards [sector_apply hc hb hT (a • ψ), sector_apply hc hb hT ψ,
    Lp.coeFn_smul a (sectorMap k c T ψ),
    hT.quasiMeasurePreserving.tendsto_ae.eventually (Lp.coeFn_smul a ψ)]
    with p hp hψ hout hin
  simp only [Pi.smul_apply, smul_eq_mul] at hin hout
  rw [hp, hout, hψ, hin]
  ring

end FockOpProof

namespace FockOpProof

variable {c : ∀ k : ℕ, (Fin k → Spacetime) → ℂ}
  {T : ∀ k : ℕ, (Fin k → Spacetime) → (Fin k → Spacetime)}
  (hc : ∀ k, Measurable (c k)) (hb : ∀ k p, ‖c k p‖ ≤ 1)
  (hT : ∀ k, MeasurePreserving (T k) (Measure.pi fun _ : Fin k => mu)
    (Measure.pi fun _ : Fin k => mu))

include hc hb hT

theorem fock_memℓp (ψ : FockCarrier) :
    Memℓp (fun k => sectorMap k (c k) (T k) (ψ k)) 2 :=
  (lp.memℓp ψ).mono' fun k => sector_norm (hc k) (hb k) (hT k) (ψ k)

theorem fockMap_apply (ψ : FockCarrier) (k : ℕ) :
    fockMap c T ψ k = sectorMap k (c k) (T k) (ψ k) := by
  rw [fockMap, dif_pos (fock_memℓp hc hb hT ψ)]

theorem fockMap_add (ψ φ : FockCarrier) :
    fockMap c T (ψ + φ) = fockMap c T ψ + fockMap c T φ := by
  apply lp.ext
  funext k
  simp only [lp.coeFn_add, Pi.add_apply, fockMap_apply hc hb hT]
  exact sector_add (hc k) (hb k) (hT k) (ψ k) (φ k)

theorem fockMap_smul (a : ℂ) (ψ : FockCarrier) :
    fockMap c T (a • ψ) = a • fockMap c T ψ := by
  apply lp.ext
  funext k
  simp only [lp.coeFn_smul, Pi.smul_apply, fockMap_apply hc hb hT]
  exact sector_smul (hc k) (hb k) (hT k) a (ψ k)

theorem fockMap_norm (ψ : FockCarrier) : ‖fockMap c T ψ‖ ≤ ‖ψ‖ := by
  apply lp.norm_mono (by norm_num)
  intro k
  rw [fockMap_apply hc hb hT]
  exact sector_norm (hc k) (hb k) (hT k) (ψ k)

theorem fockOp_eq_fockMap : ∀ ψ, fockOp c T ψ = fockMap c T ψ := by
  let L : FockCarrier →ₗ[ℂ] FockCarrier :=
    { toFun := fockMap c T
      map_add' := fockMap_add hc hb hT
      map_smul' := fockMap_smul hc hb hT }
  have hex : ∃ L : FockCarrier →L[ℂ] FockCarrier, ∀ ψ, L ψ = fockMap c T ψ :=
    ⟨L.mkContinuous 1 (fun ψ => by simpa [L] using fockMap_norm hc hb hT ψ), fun _ => rfl⟩
  rw [fockOp, dif_pos hex]
  exact hex.choose_spec

end FockOpProof

theorem fockOp_apply' (c : ∀ k : ℕ, (Fin k → Spacetime) → ℂ)
    (T : ∀ k : ℕ, (Fin k → Spacetime) → (Fin k → Spacetime))
    (hc : ∀ k, Measurable (c k)) (hb : ∀ k p, ‖c k p‖ ≤ 1)
    (hT : ∀ k, MeasurePreserving (T k) (Measure.pi fun _ : Fin k => mu)
      (Measure.pi fun _ : Fin k => mu))
    (ψ : FockCarrier) (k : ℕ) :
    ((fockOp c T ψ) k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => c k p * (ψ k : (Fin k → Spacetime) → ℂ) (T k p) := by
  rw [FockOpProof.fockOp_eq_fockMap hc hb hT,
    FockOpProof.fockMap_apply hc hb hT]
  exact FockOpProof.sector_apply (hc k) (hb k) (hT k) (ψ k)

namespace FockOpProof

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
  fockOp_apply' (phase x) (fun _ => id) (phase_measurable x)
    (fun k p => (phase_norm x k p).le) (fun _ => MeasurePreserving.id _) ψ k

end FockOpProof

theorem transOp_zero' : transOp 0 = ContinuousLinearMap.id ℂ FockCarrier := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [FockOpProof.trans_apply 0 ψ k] with p hp
  simpa [phase] using hp

theorem transOp_add' (x y : Spacetime) : (transOp x).comp (transOp y) = transOp (x + y) := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [FockOpProof.trans_apply x (transOp y ψ) k,
    FockOpProof.trans_apply y ψ k, FockOpProof.trans_apply (x + y) ψ k] with p hx hy hxy
  change ((transOp x (transOp y ψ)) k : (Fin k → Spacetime) → ℂ) p = _
  rw [hx, hy, hxy]
  simp [phase, inner_add_left, Complex.ofReal_add, mul_add, Complex.exp_add, mul_assoc]

theorem transOp_norm' (x : Spacetime) (ψ : FockCarrier) : ‖transOp x ψ‖ = ‖ψ‖ := by
  have hsector (k : ℕ) : ‖transOp x ψ k‖ = ‖ψ k‖ := by
    have hae : ∀ᵐ p ∂(Measure.pi fun _ : Fin k => mu),
        ‖(transOp x ψ k : (Fin k → Spacetime) → ℂ) p‖ =
          ‖(ψ k : (Fin k → Spacetime) → ℂ) p‖ := by
      filter_upwards [FockOpProof.trans_apply x ψ k] with p hp
      rw [hp, norm_mul, FockOpProof.phase_norm, one_mul]
    exact le_antisymm (Lp.norm_le_norm_of_ae_le (hae.mono fun _ h => h.le))
      (Lp.norm_le_norm_of_ae_le (hae.mono fun _ h => h.ge))
  exact le_antisymm (lp.norm_mono (by norm_num) fun k => (hsector k).le)
    (lp.norm_mono (by norm_num) fun k => (hsector k).ge)

namespace FockOpProof

theorem proj_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) (k : ℕ) :
    (projOp B ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => (if totalMom p ∈ B then 1 else 0) * (ψ k : (Fin k → Spacetime) → ℂ) p := by
  rw [projOp, if_pos hB]
  apply fockOp_apply' _ (fun _ => id)
  · intro k
    exact Measurable.ite (hB.preimage (totalMom_continuous k).measurable)
      measurable_const measurable_const
  · intro k p
    split_ifs <;> simp
  · intro k
    exact MeasurePreserving.id _

end FockOpProof

theorem projOp_empty' : projOp ∅ = 0 := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [FockOpProof.proj_apply MeasurableSet.empty ψ k,
    Lp.coeFn_zero ℂ 2 (Measure.pi fun _ : Fin k => mu)] with p hp hz
  change (projOp ∅ ψ k : (Fin k → Spacetime) → ℂ) p = (0 : Sector k) p
  simpa using hp.trans (by simpa using hz.symm)

theorem projOp_univ' : projOp Set.univ = ContinuousLinearMap.id ℂ FockCarrier := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [FockOpProof.proj_apply MeasurableSet.univ ψ k] with p hp
  simpa using hp

theorem projOp_inter' {A B : Set Spacetime} (hA : MeasurableSet A) (hB : MeasurableSet B) :
    (projOp A).comp (projOp B) = projOp (A ∩ B) := by
  apply ContinuousLinearMap.ext
  intro ψ
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [FockOpProof.proj_apply hA (projOp B ψ) k,
    FockOpProof.proj_apply hB ψ k, FockOpProof.proj_apply (hA.inter hB) ψ k] with p ha hb hab
  change ((projOp A (projOp B ψ)) k : (Fin k → Spacetime) → ℂ) p = _
  rw [ha, hb, hab]
  by_cases hpa : totalMom p ∈ A <;> by_cases hpb : totalMom p ∈ B <;> simp [hpa, hpb]

theorem projOp_adjoint' {B : Set Spacetime} (hB : MeasurableSet B) :
    ContinuousLinearMap.adjoint (projOp B) = projOp B := by
  symm
  apply (ContinuousLinearMap.eq_adjoint_iff _ _).mpr
  intro ψ φ
  rw [lp.inner_eq_tsum, lp.inner_eq_tsum]
  apply tsum_congr
  intro k
  rw [L2.inner_def, L2.inner_def]
  apply integral_congr_ae
  filter_upwards [FockOpProof.proj_apply hB ψ k, FockOpProof.proj_apply hB φ k]
    with p hψ hφ
  rw [hψ, hφ]
  by_cases hp : totalMom p ∈ B <;> simp [hp]

end YangMills.FreeField

#print axioms YangMills.FreeField.fockOp_apply'
#print axioms YangMills.FreeField.transOp_zero'
#print axioms YangMills.FreeField.transOp_add'
#print axioms YangMills.FreeField.transOp_norm'
#print axioms YangMills.FreeField.projOp_empty'
#print axioms YangMills.FreeField.projOp_univ'
#print axioms YangMills.FreeField.projOp_inter'
#print axioms YangMills.FreeField.projOp_adjoint'
