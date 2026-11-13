import FreeField.Theory

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

private theorem twist_ne_zero (i : Fin 4) : twist i ≠ 0 := by
  unfold twist
  split_ifs <;> simp

private theorem rhoMat_one (i j : Fin 4) : rhoMat 1 i j = if i = j then 1 else 0 := by
  change (twist i)⁻¹ * ((EuclideanSpace.single j (1 : ℝ) i : ℝ) : ℂ) * twist j = _
  simp only [PiLp.single_apply]
  split_ifs with h
  · subst j
    simp [twist_ne_zero]
  · simp

private theorem derivSubst_one : derivSubst 1 = AlgHom.id ℂ _ := by
  ext j : 1
  simp [derivSubst, rhoMat_one]

private theorem rhoIdx_one (α : Idx) : rhoIdx 1 α = Finsupp.single ({α} : Mon) 1 := by
  simp [rhoIdx, derivSubst_one, MvPolynomial.support_monomial]

private theorem rhoMon_one (m : Mon) : rhoMon 1 m = Finsupp.single m 1 := by
  induction m using Multiset.induction_on with
  | empty => simp [rhoMon, AddMonoidAlgebra.one_def]
  | @cons α m ih =>
    simp only [rhoMon, Multiset.map_cons, Multiset.prod_cons]
    rw [rhoIdx_one]
    change (AddMonoidAlgebra.single ({α} : Mon) (1 : ℂ) * _).coeff = _
    have hm : (m.map fun β => (AddMonoidAlgebra.ofCoeff (rhoIdx 1 β) :
        AddMonoidAlgebra ℂ Mon)).prod = AddMonoidAlgebra.single m 1 := by
      exact AddMonoidAlgebra.coeff_injective ih
    rw [hm]
    simp [AddMonoidAlgebra.single_mul_single]

theorem rhoL_one' : rhoL 1 = LinearMap.id := by
  ext m : 2
  simp [rhoL_single, rhoMon_one]

private theorem lorentz_coords_mul (Λ Γ : ProperLorentz) (i j : Fin 4) :
    (Λ * Γ).1.val (EuclideanSpace.single j (1 : ℝ)) i =
      ∑ k, Λ.1.val (EuclideanSpace.single k (1 : ℝ)) i *
        Γ.1.val (EuclideanSpace.single j (1 : ℝ)) k := by
  have hx (x : Spacetime) : x = ∑ k : Fin 4, x k • EuclideanSpace.single k (1 : ℝ) := by
    ext l
    simp [Pi.single_apply]
  change Λ.1.val (Γ.1.val (EuclideanSpace.single j (1 : ℝ))) i = _
  conv_lhs => rw [hx (Γ.1.val (EuclideanSpace.single j (1 : ℝ))) ]
  simp [map_sum, map_smul, mul_comm]

private theorem rhoMat_mul (Λ Γ : ProperLorentz) (i j : Fin 4) :
    rhoMat (Λ * Γ) i j = ∑ k, rhoMat Λ i k * rhoMat Γ k j := by
  simp only [rhoMat, lorentz_coords_mul, Complex.ofReal_sum, Complex.ofReal_mul,
    Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro k _
  field_simp [twist_ne_zero]

private theorem derivSubst_mul (Λ Γ : ProperLorentz) :
    derivSubst (Λ * Γ) = (derivSubst Λ).comp (derivSubst Γ) := by
  ext j : 1
  simp only [derivSubst, MvPolynomial.aeval_X, AlgHom.comp_apply, map_sum, map_mul,
    MvPolynomial.aeval_C, rhoMat_mul, map_sum, Finset.sum_mul, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro k _
  change MvPolynomial.C _ * MvPolynomial.C _ * _ = MvPolynomial.C _ * (MvPolynomial.C _ * _)
  ring

private def derivLabel : MvPolynomial (Fin 4) ℂ →ₗ[ℂ] (Mon →₀ ℂ) :=
  (Finsupp.lmapDomain ℂ ℂ (fun β : Fin 4 →₀ ℕ => ({(β : Idx)} : Mon))).comp
    (AddMonoidAlgebra.coeffLinearEquiv ℂ).toLinearMap

private theorem derivLabel_monomial (β : Fin 4 →₀ ℕ) (c : ℂ) :
    derivLabel (MvPolynomial.monomial β c) = Finsupp.single ({(β : Idx)} : Mon) c := by
  simp [derivLabel, MvPolynomial.monomial]

private theorem rhoIdx_eq (Λ : ProperLorentz) (α : Idx) :
    rhoIdx Λ α = derivLabel (derivSubst Λ
      (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)) := rfl

private theorem rhoMon_singleton (Λ : ProperLorentz) (α : Idx) :
    rhoMon Λ ({α} : Mon) = rhoIdx Λ α := by
  simp [rhoMon]

private theorem rhoL_derivLabel (Λ : ProperLorentz) (p : MvPolynomial (Fin 4) ℂ) :
    rhoL Λ (derivLabel p) = derivLabel (derivSubst Λ p) := by
  induction p using MvPolynomial.induction_on' with
  | monomial β c =>
    rw [derivLabel_monomial, rhoL_single, rhoMon_singleton, rhoIdx_eq]
    have hc : MvPolynomial.monomial β c = c • MvPolynomial.monomial β (1 : ℂ) := by
      simp [MvPolynomial.smul_monomial]
    rw [hc, map_smul, map_smul]
    congr 2
    rw [show Finsupp.equivFunOnFinite.symm (β : Idx) = β from
      Finsupp.equivFunOnFinite.symm_apply_apply β]
  | add p q hp hq => simp only [map_add, hp, hq]

private theorem rhoIdx_mul (Λ Γ : ProperLorentz) (α : Idx) :
    rhoIdx (Λ * Γ) α = rhoL Λ (rhoIdx Γ α) := by
  simp only [rhoIdx_eq, rhoL_derivLabel, derivSubst_mul, AlgHom.comp_apply]

private def rhoAlg (Λ : ProperLorentz) :
    AddMonoidAlgebra ℂ Mon →ₐ[ℂ] AddMonoidAlgebra ℂ Mon :=
  AddMonoidAlgebra.lift ℂ (AddMonoidAlgebra ℂ Mon) Mon {
    toFun := fun m => (m.toAdd.map fun α => AddMonoidAlgebra.ofCoeff (rhoIdx Λ α)).prod
    map_one' := by simp
    map_mul' := by intro m m'; simp }

private theorem rhoAlg_coeff (Λ : ProperLorentz) (p : AddMonoidAlgebra ℂ Mon) :
    (rhoAlg Λ p).coeff = rhoL Λ p.coeff := by
  induction p using AddMonoidAlgebra.induction_linear with
  | zero => simp
  | add p q hp hq => simp [hp, hq]
  | single m c => simp [rhoAlg, rhoL_single, rhoMon]

private theorem rhoMon_mul (Λ Γ : ProperLorentz) (m : Mon) :
    rhoMon (Λ * Γ) m = rhoL Λ (rhoMon Γ m) := by
  rw [← rhoAlg_coeff]
  unfold rhoMon
  congr 1
  rw [AddMonoidAlgebra.ofCoeff_coeff]
  simp only [map_multiset_prod, Multiset.map_map]
  congr 1
  apply Multiset.map_congr rfl
  intro α _
  apply AddMonoidAlgebra.coeff_injective
  simpa only [Function.comp_apply, AddMonoidAlgebra.coeff_ofCoeff, rhoAlg_coeff] using rhoIdx_mul Λ Γ α

theorem rhoL_mul' (Λ Γ : ProperLorentz) : rhoL (Λ * Γ) = rhoL Λ ∘ₗ rhoL Γ := by
  ext m : 2
  simp [rhoL_single, rhoMon_mul]

private def lorentzInverse (Λ : ProperLorentz) : ProperLorentz :=
  ⟨Λ.1⁻¹, by
    have hi : Λ.1.val.toLinearMap * (Λ.1⁻¹).val.toLinearMap = 1 :=
      congrArg ContinuousLinearMap.toLinearMap (Units.mul_inv Λ.1)
    have hd := congrArg LinearMap.det hi
    simpa only [map_mul, map_one, Λ.2.1, one_mul] using hd,
    by
      intro x
      have hi : Λ.1.val ((Λ.1⁻¹).val x) = x :=
        congrArg (fun T : Spacetime →L[ℝ] Spacetime => T x) (Units.mul_inv Λ.1)
      simpa only [hi] using (Λ.2.2.1 ((Λ.1⁻¹).val x)).symm,
    by
      intro x
      have hi : Λ.1.val ((Λ.1⁻¹).val x) = x :=
        congrArg (fun T : Spacetime →L[ℝ] Spacetime => T x) (Units.mul_inv Λ.1)
      simpa only [hi] using (Λ.2.2.2 ((Λ.1⁻¹).val x)).symm⟩

private theorem lorentzInverse_mul (Λ : ProperLorentz) : lorentzInverse Λ * Λ = 1 :=
  Subtype.ext (inv_mul_cancel Λ.1)

private theorem mul_lorentzInverse (Λ : ProperLorentz) : Λ * lorentzInverse Λ = 1 :=
  Subtype.ext (mul_inv_cancel Λ.1)

theorem rhoL_bijective' (Λ : ProperLorentz) : Bijective (rhoL Λ) := by
  have hl : Function.LeftInverse (rhoL (lorentzInverse Λ)) (rhoL Λ) := by
    intro A
    have h := LinearMap.congr_fun (rhoL_mul' (lorentzInverse Λ) Λ) A
    simpa only [lorentzInverse_mul, rhoL_one', LinearMap.id_apply,
      LinearMap.comp_apply] using h.symm
  have hr : Function.RightInverse (rhoL (lorentzInverse Λ)) (rhoL Λ) := by
    intro A
    have h := LinearMap.congr_fun (rhoL_mul' Λ (lorentzInverse Λ)) A
    simpa only [mul_lorentzInverse, rhoL_one', LinearMap.id_apply,
      LinearMap.comp_apply] using h.symm
  exact ⟨hl.injective, hr.surjective⟩


end YangMills.FreeField

#print axioms YangMills.FreeField.rhoL_one'
#print axioms YangMills.FreeField.rhoL_mul'
#print axioms YangMills.FreeField.rhoL_bijective'
