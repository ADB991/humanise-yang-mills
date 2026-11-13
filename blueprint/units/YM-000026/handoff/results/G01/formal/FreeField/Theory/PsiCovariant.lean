import FreeField.Theory.Base
import FreeField.Analytic.MuMapAdjoint
import FreeField.Theory.FockOpApply
import FreeField.Theory.PsiApply

import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
import Mathlib.LinearAlgebra.Multilinear.Finsupp
import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier

/-! Proofs consolidated from `FreeField/Work/Psi_covariant.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_PsiCovariant
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PsiCovariantProof

theorem sum_openMomentum {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) :
    ∑ v, openMomentum σ q p v = totalMom p := by
  have hs (x : Fin (n + 1)) (hx : x ≠ 0) (z : Spacetime) :
      (∑ v : Fin n, if x = v.succ then z else 0) = z := by
    obtain ⟨v, rfl⟩ := Fin.exists_succ_eq_of_ne_zero hx
    simp
  have hi (ℓ : ILine σ) : ovtx (σ.1 (Sum.inr ℓ.1)) ≠ 0 := by
    have h := ℓ.2
    intro hz
    rw [hz] at h
    exact (Fin.not_lt_zero _) h
  have he (j : Fin k) : ovtx (σ.1 (Sum.inl j)) ≠ 0 := σ.2.2 (Sum.inl j)
  simp only [openMomentum, Finset.sum_add_distrib, Finset.sum_sub_distrib]
  rw [Finset.sum_comm (f := fun (v : Fin n) (ℓ : ILine σ) => if ovtx (σ.1 (Sum.inr ℓ.1)) = v.succ
      then q ℓ else 0),
    Finset.sum_comm (f := fun (v : Fin n) (ℓ : ILine σ) => if ℓ.1.1 = v then q ℓ else 0),
    Finset.sum_comm (f := fun (v : Fin n) (j : Fin k) => if ovtx (σ.1 (Sum.inl j)) = v.succ
      then p j else 0)]
  simp [hs, hi, he, totalMom]

theorem openMomentum_map {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (T : Spacetime →L[ℝ] Spacetime)
    (v : Fin n) :
    openMomentum σ (fun ℓ => T (q ℓ)) (fun j => T (p j)) v =
      T (openMomentum σ q p v) := by
  simp only [openMomentum, map_add, map_sub, map_sum, apply_ite, map_zero]

theorem prod_openMomentum_phase {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (a : Spacetime) :
    (∏ v : Fin n, Complex.exp (Complex.I * (⟪a, openMomentum σ q p v⟫_ℝ : ℂ))) =
      phase a k p := by
  rw [← Complex.exp_sum]
  simp only [phase, ← Finset.mul_sum, ← Complex.ofReal_sum, ← inner_sum,
    sum_openMomentum]

theorem lorentz_volume_preserving (Λ : ProperLorentz) :
    MeasurePreserving Λ.1.val (volume : Measure Spacetime) volume := by
  refine ⟨Λ.1.val.continuous.measurable, ?_⟩
  have h := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Spacetime)
    (f := Λ.1.val.toLinearMap) (by rw [Λ.2.1]; exact one_ne_zero)
  simpa [Λ.2.1] using h

theorem integral_lorentz_comp (Λ : ProperLorentz) (F : Spacetime → ℂ) :
    (∫ x, F (Λ.1.val x)) = ∫ x, F x :=
  (lorentz_volume_preserving Λ).integral_comp
    (ContinuousLinearEquiv.unitsEquiv ℝ Spacetime Λ.1).toHomeomorph.measurableEmbedding F

theorem fourierE_onTests (g : Sym) (f : TestFunction) (p : Spacetime) :
    fourierE (onTests g f) p =
      Complex.exp (Complex.I * (⟪g.shift, p⟫_ℝ : ℂ)) * fourierE f (lorT g.lor p) := by
  unfold fourierE
  rw [← integral_add_right_eq_self
    (fun x : Spacetime => onTests g f x * Complex.exp (Complex.I * (⟪x, p⟫_ℝ : ℂ)))
    g.shift]
  simp only [onTests_apply, add_sub_cancel_right]
  rw [← integral_lorentz_comp g.lor]
  have hinv (x : Spacetime) : (g.lor.1⁻¹).val (g.lor.1.val x) = x :=
    congrArg (fun T : Spacetime →L[ℝ] Spacetime => T x) (Units.inv_mul g.lor.1)
  simp only [hinv, inner_add_left, ← ContinuousLinearMap.adjoint_inner_right,
    Complex.ofReal_add, mul_add, Complex.exp_add]
  simp only [lorT]
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with x
  ring

/-- Coordinate factors, with `s = I` for right legs and `s = -I` for left legs. -/
def legCoord (s : ℂ) (p : Spacetime) (i : Fin 4) : ℂ := s * twist i * (p i : ℂ)

theorem twist_ne_zero (i : Fin 4) : twist i ≠ 0 := by
  unfold twist
  split_ifs <;> simp

theorem Bmono_eq_prod (α : Idx) (p : Spacetime) :
    Bmono α p = ∏ i : Fin 4, legCoord Complex.I p i ^ α i := by
  have hs (i : Fin 3) : legCoord Complex.I p i.castSucc = Complex.I * (p i.castSucc : ℂ) := by
    simp [legCoord, twist]
  have ht : legCoord Complex.I p timeAxis = -(time p : ℂ) := by
    simp [legCoord, twist, time]
  rw [Fin.prod_univ_castSucc]
  simp only [hs, ht]
  rfl

theorem Amono_eq_prod (α : Idx) (p : Spacetime) :
    Amono α p = ∏ i : Fin 4, legCoord (-Complex.I) p i ^ α i := by
  have hs (i : Fin 3) : legCoord (-Complex.I) p i.castSucc = -(Complex.I * (p i.castSucc : ℂ)) := by
    simp [legCoord, twist, neg_mul]
  have ht : legCoord (-Complex.I) p timeAxis = (time p : ℂ) := by
    simp [legCoord, twist, time]
  rw [Fin.prod_univ_castSucc]
  simp only [hs, ht]
  rfl

theorem lorT_coord (Λ : ProperLorentz) (p : Spacetime) (j : Fin 4) :
    lorT Λ p j = ∑ i : Fin 4, Λ.1.val (EuclideanSpace.single j (1 : ℝ)) i * p i := by
  have h := ContinuousLinearMap.adjoint_inner_right Λ.1.val
    (EuclideanSpace.single j (1 : ℝ)) p
  rw [EuclideanSpace.inner_single_left] at h
  simpa [lorT, EuclideanSpace.inner_eq_star_dotProduct, dotProduct, mul_comm] using h

theorem rhoMat_legCoord (Λ : ProperLorentz) (s : ℂ) (p : Spacetime) (j : Fin 4) :
    (∑ i : Fin 4, rhoMat Λ i j * legCoord s p i) = legCoord s (lorT Λ p) j := by
  simp only [legCoord, rhoMat, lorT_coord, Complex.ofReal_sum, Complex.ofReal_mul,
    Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  field_simp [twist_ne_zero]

theorem eval_derivSubst (Λ : ProperLorentz) (s : ℂ) (p : Spacetime)
    (F : MvPolynomial (Fin 4) ℂ) :
    MvPolynomial.aeval (legCoord s p) (derivSubst Λ F) =
      MvPolynomial.aeval (legCoord s (lorT Λ p)) F := by
  have h : (MvPolynomial.aeval (legCoord s p)).comp (derivSubst Λ) =
      MvPolynomial.aeval (legCoord s (lorT Λ p)) := by
    ext j
    simpa [derivSubst] using rhoMat_legCoord Λ s p j
  exact congrArg (fun L : MvPolynomial (Fin 4) ℂ →ₐ[ℂ] ℂ => L F) h

theorem eval_monomial_legCoord (s : ℂ) (p : Spacetime) (α : Idx) :
    MvPolynomial.aeval (legCoord s p)
      (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) (1 : ℂ)) =
        ∏ i : Fin 4, legCoord s p i ^ α i := by
  rw [MvPolynomial.aeval_monomial, Finsupp.prod_fintype]
  · simp
  · simp

theorem sum_coeff_derivSubst (Λ : ProperLorentz) (s : ℂ) (p : Spacetime) (α : Idx) :
    let F := derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)
    (∑ β ∈ F.support, F.coeff β * ∏ i : Fin 4, legCoord s p i ^ β i) =
      ∏ i : Fin 4, legCoord s (lorT Λ p) i ^ α i := by
  dsimp only
  rw [← eval_monomial_legCoord, ← eval_derivSubst]
  generalize derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1) = F
  conv_rhs => rw [F.as_sum]
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro β _
  rw [MvPolynomial.aeval_monomial, Finsupp.prod_fintype]
  · simp
  · simp

theorem sum_coeff_Bmono (Λ : ProperLorentz) (p : Spacetime) (α : Idx) :
    let F := derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)
    (∑ β ∈ F.support, F.coeff β * Bmono (β : Idx) p) = Bmono α (lorT Λ p) := by
  simp only [Bmono_eq_prod]
  exact sum_coeff_derivSubst Λ Complex.I p α

theorem sum_coeff_Amono (Λ : ProperLorentz) (p : Spacetime) (α : Idx) :
    let F := derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)
    (∑ β ∈ F.support, F.coeff β * Amono (β : Idx) p) = Amono α (lorT Λ p) := by
  simp only [Amono_eq_prod]
  exact sum_coeff_derivSubst Λ (-Complex.I) p α

theorem rhoIdx_evaluate (Λ : ProperLorentz) (α : Idx) (s : ℂ) (p : Spacetime) :
    (rhoIdx Λ α).sum (fun m c => c * (m.map fun β =>
      ∏ i : Fin 4, legCoord s p i ^ β i).prod) =
        ∏ i : Fin 4, legCoord s (lorT Λ p) i ^ α i := by
  unfold rhoIdx
  rw [← Finsupp.sum_finsetSum_index (by simp) (by intros; ring)]
  simpa using sum_coeff_derivSubst Λ s p α

theorem rhoIdx_Bmono (Λ : ProperLorentz) (α : Idx) (p : Spacetime) :
    (rhoIdx Λ α).sum (fun m c => c * (m.map fun β => Bmono β p).prod) =
      Bmono α (lorT Λ p) := by
  simp only [Bmono_eq_prod]
  exact rhoIdx_evaluate Λ α Complex.I p

theorem rhoIdx_Amono (Λ : ProperLorentz) (α : Idx) (p : Spacetime) :
    (rhoIdx Λ α).sum (fun m c => c * (m.map fun β => Amono β p).prod) =
      Amono α (lorT Λ p) := by
  simp only [Amono_eq_prod]
  exact rhoIdx_evaluate Λ α (-Complex.I) p

theorem fourierE_translate (a : Spacetime) (f : TestFunction) (p : Spacetime) :
    fourierE (onTests (((1 : ProperLorentz), a) : Sym) f) p =
      Complex.exp (Complex.I * (⟪a, p⟫_ℝ : ℂ)) * fourierE f p := by
  have hid : lorT (1 : ProperLorentz) = ContinuousLinearMap.id ℝ Spacetime :=
    ContinuousLinearMap.adjoint_id
  simpa only [Sym.lor, Sym.shift, hid, ContinuousLinearMap.id_apply] using
    fourierE_onTests (((1 : ProperLorentz), a) : Sym) f p

theorem openAmp_translate {n : ℕ} (m : Fin n → Mon) (f : Fin n → TestFunction)
    (a : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    openAmp m (fun v => onTests (((1 : ProperLorentz), a) : Sym) (f v)) k p =
      phase a k p * openAmp m f k p := by
  unfold openAmp
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with q
  simp only [fourierE_translate, Finset.prod_mul_distrib, prod_openMomentum_phase]
  ring

theorem openAmpL_translate {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (a : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL P (fun v => onTests (((1 : ProperLorentz), a) : Sym) (f v)) k p =
      phase a k p * openAmpL P f k p := by
  simp only [openAmpL, openAmp_translate, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro m _
  ring

theorem onTests_factor (g : Sym) (f : TestFunction) :
    onTests g f = onTests (((1 : ProperLorentz), g.shift) : Sym)
      (onTests ((g.lor, 0) : Sym) f) := by
  ext x
  simp only [onTests_apply, Sym.lor, Sym.shift]
  change f ((g.lor.1⁻¹).val (x - g.shift)) =
    f ((g.lor.1⁻¹).val ((x - g.shift) - 0))
  rw [sub_zero]

theorem openAmpL_factor_translation {n : ℕ} (g : Sym) (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL P (fun v => onTests g (f v)) k p = phase g.shift k p *
      openAmpL P (fun v => onTests ((g.lor, 0) : Sym) (f v)) k p := by
  simp only [onTests_factor g, openAmpL_translate]

/-- The finite-support extension is multilinear without assumptions on its kernel. -/
def labelExtension {n : ℕ} (K : (Fin n → Mon) → ℂ) :
    MultilinearMap ℂ (fun _ : Fin n => Mon →₀ ℂ) ℂ :=
  (MultilinearMap.fromDFinsuppEquiv (R := ℂ) (κ := fun _ : Fin n => Mon)
    (fun m => MultilinearMap.mkPiRing ℂ (Fin n) (K m))).compLinearMap
    (fun _ => (finsuppLequivDFinsupp ℂ).toLinearMap)

theorem labelExtension_apply {n : ℕ} (K : (Fin n → Mon) → ℂ)
    (P : Fin n → (Mon →₀ ℂ)) :
    labelExtension K P =
      ∑ m ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (m i)) * K m := by
  simp [labelExtension, MultilinearMap.fromDFinsuppEquiv_apply,
    toDFinsupp_support, MultilinearMap.mkPiRing_apply]

theorem labelExtension_openAmp {n : ℕ} (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    labelExtension (fun m => openAmp m f k p) P = openAmpL P f k p :=
  labelExtension_apply _ _

theorem openAmpL_rho_expand {n : ℕ} (Λ : ProperLorentz) (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoL Λ (P v)) f k p =
      ∑ m ∈ Fintype.piFinset (fun v => (P v).support), (∏ v, P v (m v)) *
        openAmpL (fun v => rhoMon Λ (m v)) f k p := by
  rw [← labelExtension_openAmp]
  simp only [rhoL, Finsupp.lsum_apply, LinearMap.toSpanSingleton_apply, Finsupp.sum]
  rw [MultilinearMap.map_sum_finset]
  simp only [MultilinearMap.map_smul_univ, labelExtension_openAmp, smul_eq_mul]

theorem openAmpL_covariant_of_monomials (g : Sym)
    (hmono : ∀ (n : ℕ) (m : Fin n → Mon) (f : Fin n → TestFunction)
      (k : ℕ) (p : Fin k → Spacetime),
      openAmpL (fun v => rhoMon g.lor (m v))
        (fun v => onTests ((g.lor, 0) : Sym) (f v)) k p =
          openAmp m f k (fun j => lorT g.lor (p j)))
    {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoL g.lor (P v)) (fun v => onTests g (f v)) k p =
      phase g.shift k p * openAmpL P f k (fun j => lorT g.lor (p j)) := by
  rw [openAmpL_factor_translation, openAmpL_rho_expand]
  simp_rw [hmono]
  rfl

theorem openAmpW_ofFn {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (k : ℕ) (p : Fin k → Spacetime) :
    openAmpW (List.ofFn fun i => (P i, f i)) k p = openAmpL P f k p := by
  exact congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
    openAmpL (fun i => (s.2 i).1) (fun i => (s.2 i).2) k p)
    (List.equivSigmaTuple.apply_symm_apply ⟨n, fun i => (P i, f i)⟩)

theorem openAmpW_map {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (g : Sym) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpW ((List.ofFn fun i => (P i, f i)).map
      fun a => (rhoL g.lor a.1, onTests g a.2)) k p =
        openAmpL (fun v => rhoL g.lor (P v)) (fun v => onTests g (f v)) k p := by
  rw [List.map_ofFn]
  exact openAmpW_ofFn _ _ k p

theorem openAmpW_covariant_of_monomials (g : Sym)
    (hmono : ∀ (n : ℕ) (m : Fin n → Mon) (f : Fin n → TestFunction)
      (k : ℕ) (p : Fin k → Spacetime),
      openAmpL (fun v => rhoMon g.lor (m v))
        (fun v => onTests ((g.lor, 0) : Sym) (f v)) k p =
          openAmp m f k (fun j => lorT g.lor (p j)))
    (u : Word) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpW (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) k p =
      phase g.shift k p * openAmpW u k (fun j => lorT g.lor (p j)) := by
  have hu : (List.ofFn fun i => (u.lab i, u.test i)) = u := by
    simpa only [Word.lab, Word.test, Prod.mk.eta] using List.ofFn_get u
  calc
    _ = openAmpW ((List.ofFn fun i => (u.lab i, u.test i)).map
        fun a => (rhoL g.lor a.1, onTests g a.2)) k p := by rw [hu]
    _ = openAmpL (fun v => rhoL g.lor (u.lab v)) (fun v => onTests g (u.test v)) k p :=
      openAmpW_map _ _ g k p
    _ = phase g.shift k p * openAmpL u.lab u.test k (fun j => lorT g.lor (p j)) :=
      openAmpL_covariant_of_monomials g hmono _ _ k p
    _ = _ := rfl

theorem phase_measurable (a : Spacetime) (k : ℕ) : Measurable (phase a k) := by
  apply Continuous.measurable
  unfold phase totalMom
  fun_prop

theorem phase_norm (a : Spacetime) (k : ℕ) (p : Fin k → Spacetime) :
    ‖phase a k p‖ = 1 := by
  simp [phase, Complex.norm_exp, Complex.mul_re]

theorem lorT_measurePreserving (Λ : ProperLorentz) : MeasurePreserving (lorT Λ) mu mu :=
  ⟨(lorT Λ).continuous.measurable, mu_map_adjoint Λ⟩

def lorTEquiv (Λ : ProperLorentz) : Spacetime ≃L[ℝ] Spacetime :=
  { (lorT Λ).toLinearMap with
    invFun := ContinuousLinearMap.adjoint (Λ.1⁻¹).val
    left_inv := by
      intro p
      have h := congrArg ContinuousLinearMap.adjoint (Units.mul_inv Λ.1)
      change ContinuousLinearMap.adjoint (Λ.1.val.comp (Λ.1⁻¹).val) = _ at h
      rw [ContinuousLinearMap.adjoint_comp, ContinuousLinearMap.adjoint_one] at h
      exact congrArg (fun T : Spacetime →L[ℝ] Spacetime => T p) h
    right_inv := by
      intro p
      have h := congrArg ContinuousLinearMap.adjoint (Units.inv_mul Λ.1)
      change ContinuousLinearMap.adjoint ((Λ.1⁻¹).val.comp Λ.1.val) = _ at h
      rw [ContinuousLinearMap.adjoint_comp, ContinuousLinearMap.adjoint_one] at h
      exact congrArg (fun T : Spacetime →L[ℝ] Spacetime => T p) h
    continuous_toFun := (lorT Λ).continuous
    continuous_invFun := (ContinuousLinearMap.adjoint (Λ.1⁻¹).val).continuous }

theorem lorT_pi_measurePreserving (Λ : ProperLorentz) (ι : Type*) [Fintype ι] :
    MeasurePreserving (fun p : ι → Spacetime => fun j => lorT Λ (p j))
      (Measure.pi fun _ : ι => mu) (Measure.pi fun _ : ι => mu) := by
  letI : SigmaFinite mu := inferInstanceAs (SigmaFinite
    (volume.withDensity fun p : Spacetime => ENNReal.ofReal (weight p)))
  exact measurePreserving_pi _ _ fun _ => lorT_measurePreserving Λ

/-- Simultaneous change of all internal momenta, valid for the totalised Bochner integral. -/
theorem integral_lorT_pi (Λ : ProperLorentz) (ι : Type*) [Fintype ι]
    (F : (ι → Spacetime) → ℂ) :
    (∫ q : ι → Spacetime, F (fun j => lorT Λ (q j)) ∂Measure.pi (fun _ : ι => mu)) =
      ∫ q : ι → Spacetime, F q ∂Measure.pi (fun _ : ι => mu) :=
  (lorT_pi_measurePreserving Λ ι).integral_comp
    (Homeomorph.piCongrRight fun _ : ι => (lorTEquiv Λ).toHomeomorph).measurableEmbedding F

theorem lorT_det (Λ : ProperLorentz) : LinearMap.det (lorT Λ).toLinearMap = 1 := by
  rw [lorT, ← ContinuousLinearMap.adjoint_toLinearMap,
    ← LinearMap.det_toMatrix (EuclideanSpace.basisFun Axis ℝ).toBasis,
    LinearMap.toMatrix_adjoint (EuclideanSpace.basisFun Axis ℝ)
      (EuclideanSpace.basisFun Axis ℝ),
    Matrix.det_conjTranspose, LinearMap.det_toMatrix, Λ.2.1]
  simp

theorem lorT_volume_preserving (Λ : ProperLorentz) :
    MeasurePreserving (lorT Λ) (volume : Measure Spacetime) volume := by
  refine ⟨(lorT Λ).continuous.measurable, ?_⟩
  have h := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Spacetime)
    (f := (lorT Λ).toLinearMap) (by rw [lorT_det]; exact one_ne_zero)
  simpa [lorT_det] using h

theorem integral_lorT_volume_pi (Λ : ProperLorentz) (ι : Type*) [Fintype ι]
    (F : (ι → Spacetime) → ℂ) :
    (∫ q : ι → Spacetime, F (fun j => lorT Λ (q j))) = ∫ q : ι → Spacetime, F q :=
  (volume_preserving_pi (fun _ : ι => lorT_volume_preserving Λ)).integral_comp
    (Homeomorph.piCongrRight fun _ : ι => (lorTEquiv Λ).toHomeomorph).measurableEmbedding F

/- The following elementary geometry avoids introducing another skeleton dependency. -/
private def reflectSpace (p : Spacetime) : Spacetime :=
  WithLp.toLp 2 fun i => if i = timeAxis then p i else -p i

private theorem reflectSpace_involutive (p : Spacetime) : reflectSpace (reflectSpace p) = p := by
  ext i
  by_cases h : i = timeAxis <;> simp [reflectSpace, h]

private theorem time_reflectSpace (p : Spacetime) : time (reflectSpace p) = time p := by
  simp [time, reflectSpace]

private theorem spatial_reflectSpace (p : Spacetime) : spatial (reflectSpace p) = -spatial p := by
  ext i
  simp [spatial, reflectSpace, Fin.castSucc_ne_last]

private theorem weight_reflectSpace (p : Spacetime) : weight (reflectSpace p) = weight p := by
  simp [weight, forwardCone, minkowskiSquare, time_reflectSpace, spatial_reflectSpace]

private theorem minkowski_polarization (x y : Spacetime) :
    minkowskiSquare (x + y) - minkowskiSquare x - minkowskiSquare y =
      2 * ⟪reflectSpace x, y⟫_ℝ := by
  simp [minkowskiSquare, EuclideanSpace.real_norm_sq_eq, time, spatial,
    reflectSpace, PiLp.inner_apply, Fin.sum_univ_succ, timeAxis, Fin.last]
  ring

private theorem lorentz_polarization (Λ : ProperLorentz) (x y : Spacetime) :
    ⟪reflectSpace (Λ.1.val x), Λ.1.val y⟫_ℝ = ⟪reflectSpace x, y⟫_ℝ := by
  have hsum := Λ.2.2.1 (x + y)
  rw [map_add] at hsum
  have hx := Λ.2.2.1 x
  have hy := Λ.2.2.1 y
  linarith [minkowski_polarization x y,
    minkowski_polarization (Λ.1.val x) (Λ.1.val y)]

private theorem adjoint_reflectSpace (Λ : ProperLorentz) (x : Spacetime) :
    lorT Λ (reflectSpace (Λ.1.val x)) = reflectSpace x := by
  apply ext_inner_right ℝ
  intro y
  rw [lorT, ContinuousLinearMap.adjoint_inner_left]
  exact lorentz_polarization Λ x y

theorem weight_lorT (Λ : ProperLorentz) (p : Spacetime) : weight (lorT Λ p) = weight p := by
  let e := ContinuousLinearEquiv.unitsEquiv ℝ Spacetime Λ.1
  have hw (q : Spacetime) : weight (e q) = weight q := by
    change weight (Λ.1.val q) = weight q
    simp only [weight, Λ.2.2.1, Λ.2.2.2]
  have ht : lorT Λ p = reflectSpace (e.symm (reflectSpace p)) := by
    have h := adjoint_reflectSpace Λ (e.symm (reflectSpace p))
    change lorT Λ (reflectSpace (e (e.symm (reflectSpace p)))) = _ at h
    simpa only [e.apply_symm_apply, reflectSpace_involutive] using h
  rw [ht, weight_reflectSpace]
  calc
    weight (e.symm (reflectSpace p)) = weight (reflectSpace p) := by
      simpa only [e.apply_symm_apply] using (hw (e.symm (reflectSpace p))).symm
    _ = weight p := weight_reflectSpace p

/-- The same open matchings, with every leg factor evaluated at the transposed momentum.
The tests, momentum conservation equations, and integration variables are unchanged. -/
def openAmpLorentzLegs {n : ℕ} (Λ : ProperLorentz) (m : Fin n → Mon)
    (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) : ℂ :=
  ∑ σ : OMatching k m, ∫ q : ILine σ → Spacetime,
    (∏ ℓ : ILine σ, Amono ℓ.1.idx (lorT Λ (q ℓ)) *
        Bmono (oidx (σ.1 (Sum.inr ℓ.1))) (lorT Λ (q ℓ)) * (weight (q ℓ) : ℂ)) *
      (∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (lorT Λ (p j))) *
      ∏ v : Fin n, fourierE (f v) (openMomentum σ q p v)

theorem openAmpLorentzLegs_onTests {n : ℕ} (Λ : ProperLorentz) (m : Fin n → Mon)
    (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpLorentzLegs Λ m (fun v => onTests ((Λ, 0) : Sym) (f v)) k p =
      openAmp m f k (fun j => lorT Λ (p j)) := by
  unfold openAmpLorentzLegs openAmp
  apply Finset.sum_congr rfl
  intro σ _
  conv_rhs => rw [← integral_lorT_volume_pi Λ (ILine σ)]
  apply integral_congr_ae
  filter_upwards [] with q
  simp only [fourierE_onTests, Sym.shift, inner_zero_left, Complex.ofReal_zero,
    mul_zero, Complex.exp_zero, one_mul, Sym.lor, weight_lorT, openMomentum_map]

theorem poinOp_apply_ae (g : Sym) (ψ : FockCarrier) (k : ℕ) :
    (poinOp g ψ k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => phase g.shift k p * (ψ k : (Fin k → Spacetime) → ℂ)
        (fun j => lorT g.lor (p j)) :=
  fockOp_apply _ _ (phase_measurable g.shift)
    (fun k p => (phase_norm g.shift k p).le)
    (fun k => lorT_pi_measurePreserving g.lor (Fin k)) ψ k

theorem Psi_apply_ae (w : Word) (k : ℕ) :
    (Psi w k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) * openAmpW w k p := by
  rw [Psi_apply]
  refine (Lp.coeFn_smul _ _).trans ?_
  exact (MemLp.coeFn_toLp _).fun_comp
    (fun z : ℂ => (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) * z)

theorem covariance_of_amplitudes (g : Sym) (u : Word)
    (h : ∀ k, (fun p => openAmpW (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) k p)
      =ᵐ[Measure.pi fun _ : Fin k => mu]
        fun p => phase g.shift k p * openAmpW u k (fun j => lorT g.lor (p j))) :
    poinOp g (Psi u) = Psi (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) := by
  apply lp.ext
  funext k
  apply Lp.ext
  filter_upwards [poinOp_apply_ae g (Psi u) k,
    (lorT_pi_measurePreserving g.lor (Fin k)).quasiMeasurePreserving.tendsto_ae.eventually
      (Psi_apply_ae u k),
    Psi_apply_ae (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) k, h k]
    with p hp hu hv ha
  rw [hp, hu, hv, ha]
  ring

/- The label substitution is expanded over independent choices at each leg occurrence.
Occurrence bijections transport the matchings and their internal momentum variables to
one fixed family. The endpoint decomposition then applies the one-leg identities, and
the directed-cut bound justifies moving the finite sums through the internal integrals. -/
/-- The finite set of terms in the substitution of one derivative symbol. -/
def derivPolynomial (Λ : ProperLorentz) (α : Idx) : MvPolynomial (Fin 4) ℂ :=
  derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)

abbrev DerivChoice (Λ : ProperLorentz) (α : Idx) := (derivPolynomial Λ α).support

def choiceCoeff (Λ : ProperLorentz) (α : Idx) (β : DerivChoice Λ α) : ℂ :=
  (derivPolynomial Λ α).coeff β.1

/-- Choices are indexed by occurrences, so repeated indices remain independent. -/
abbrev MonChoices (Λ : ProperLorentz) (m : Mon) :=
  (a : m.ToType) → DerivChoice Λ a.1

def choiceMon (Λ : ProperLorentz) (m : Mon) (β : MonChoices Λ m) : Mon :=
  Finset.univ.val.map fun a : m.ToType => ((β a).1 : Idx)

def monChoiceCoeff (Λ : ProperLorentz) (m : Mon) (β : MonChoices Λ m) : ℂ :=
  ∏ a : m.ToType, choiceCoeff Λ a.1 (β a)

theorem rhoIdx_choices (Λ : ProperLorentz) (α : Idx) :
    rhoIdx Λ α = ∑ β : DerivChoice Λ α,
      Finsupp.single ({(β.1 : Idx)} : Mon) (choiceCoeff Λ α β) := by
  exact (Finset.sum_coe_sort _ _).symm

theorem rhoMon_choices (Λ : ProperLorentz) (m : Mon) :
    rhoMon Λ m = ∑ β : MonChoices Λ m,
      Finsupp.single (choiceMon Λ m β) (monChoiceCoeff Λ m β) := by
  unfold rhoMon
  have hm : (m.map fun α => (AddMonoidAlgebra.ofCoeff (rhoIdx Λ α) :
      AddMonoidAlgebra ℂ Mon)).prod =
      ∏ a : m.ToType, AddMonoidAlgebra.ofCoeff (rhoIdx Λ a.1) := by
    congr 1
    exact (Multiset.map_univ m _).symm
  rw [hm]
  simp_rw [rhoIdx_choices, AddMonoidAlgebra.ofCoeff_sum]
  rw [Fintype.prod_sum]
  simp only [AddMonoidAlgebra.coeff_sum]
  apply Finset.sum_congr rfl
  intro β _
  change (∏ a : m.ToType, AddMonoidAlgebra.single ({((β a).1 : Idx)} : Mon)
    (choiceCoeff Λ a.1 (β a))).coeff = _
  rw [AddMonoidAlgebra.prod_single, AddMonoidAlgebra.coeff_single]
  congr 1
  change (Finset.univ.val.map (fun a : m.ToType => ({((β a).1 : Idx)} : Mon))).sum = _
  simpa only [Multiset.map_map, Function.comp_def, choiceMon] using
    Multiset.sum_map_singleton (Finset.univ.val.map fun a : m.ToType => ((β a).1 : Idx))

theorem labelExtension_single {n : ℕ} (K : (Fin n → Mon) → ℂ)
    (m : Fin n → Mon) (c : Fin n → ℂ) :
    labelExtension K (fun v => Finsupp.single (m v) (c v)) = (∏ v, c v) * K m := by
  simp [labelExtension, MultilinearMap.mkPiRing_apply]

theorem openAmpL_rhoMon_choices (Λ : ProperLorentz) {n : ℕ}
    (m : Fin n → Mon) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoMon Λ (m v)) f k p =
      ∑ β : (v : Fin n) → MonChoices Λ (m v),
        (∏ v, monChoiceCoeff Λ (m v) (β v)) *
          openAmp (fun v => choiceMon Λ (m v) (β v)) f k p := by
  rw [← labelExtension_openAmp]
  simp_rw [rhoMon_choices]
  rw [MultilinearMap.map_sum_finset]
  simp only [Fintype.piFinset_univ, labelExtension_single]

/-- A coordinate permutation preserves product Lebesgue measure. -/
theorem integral_reindex {I J : Type} [Fintype I] [Fintype J] (e : I ≃ J)
    (F : (I → Spacetime) → ℂ) :
    (∫ q : J → Spacetime, F (fun i => q (e i))) = ∫ q, F q := by
  have he (q : J → Spacetime) :
      MeasurableEquiv.piCongrLeft (fun _ : I => Spacetime) e.symm q =
        fun i => q (e i) := by
    funext i
    simp [MeasurableEquiv.coe_piCongrLeft, Equiv.piCongrLeft_apply]
  simpa only [he] using
    (volume_measurePreserving_piCongrLeft (fun _ : I => Spacetime) e.symm).integral_comp
      (MeasurableEquiv.piCongrLeft (fun _ : I => Spacetime) e.symm).measurableEmbedding F

namespace Relabel

variable {n k : ℕ} {m m' : Fin n → Mon}
variable (e : ∀ v, (m v).ToType ≃ (m' v).ToType)

def legs : Leg m ≃ Leg m' := Equiv.sigmaCongrRight e

def openLegs : OLeg k m ≃ OLeg k m' := Equiv.sumCongr (Equiv.refl _) (legs e)

@[simp] theorem legs_vertex (l : Leg m) : (legs e l).1 = l.1 := rfl
@[simp] theorem legs_symm_vertex (l : Leg m') : ((legs e).symm l).1 = l.1 := rfl
@[simp] theorem openLegs_inl (j : Fin k) : openLegs e (Sum.inl j) = Sum.inl j := rfl
@[simp] theorem openLegs_inr (l : Leg m) : openLegs (k := k) e (Sum.inr l) = Sum.inr (legs e l) := rfl
@[simp] theorem openLegs_symm_inl (j : Fin k) : (openLegs e).symm (Sum.inl j) = Sum.inl j := rfl
@[simp] theorem openLegs_symm_inr (l : Leg m') :
    (openLegs (k := k) e).symm (Sum.inr l) = Sum.inr ((legs e).symm l) := rfl
@[simp] theorem openLegs_vertex (l : OLeg k m) : ovtx (openLegs e l) = ovtx l := by
  cases l <;> rfl
@[simp] theorem openLegs_symm_vertex (l : OLeg k m') :
    ovtx ((openLegs e).symm l) = ovtx l := by cases l <;> rfl

def matchings : OMatching k m ≃ OMatching k m' :=
  (openLegs e).permCongr.subtypeEquiv (by
    intro σ
    constructor
    · rintro ⟨hi, hn⟩
      constructor
      · intro l
        simp only [Equiv.permCongr_apply, Equiv.symm_apply_apply, hi,
          Equiv.apply_symm_apply]
      · intro l
        simpa only [Equiv.permCongr_apply, openLegs_vertex, openLegs_symm_vertex] using
          hn ((openLegs e).symm l)
    · rintro ⟨hi, hn⟩
      constructor
      · intro l
        have h := congrArg (openLegs e).symm (hi (openLegs e l))
        simpa only [Equiv.permCongr_apply, Equiv.symm_apply_apply] using h
      · intro l
        simpa only [Equiv.permCongr_apply, Equiv.symm_apply_apply, openLegs_vertex] using
          hn (openLegs e l))

@[simp] theorem matchings_apply (σ : OMatching k m) (l : OLeg k m') :
    (matchings e σ).1 l = openLegs e (σ.1 ((openLegs e).symm l)) := rfl

def lines (σ : OMatching k m) : ILine σ ≃ ILine (matchings e σ) :=
  (legs e).subtypeEquiv (by
    intro l
    simp only [matchings_apply, ← openLegs_inr, Equiv.symm_apply_apply, openLegs_vertex])

@[simp] theorem lines_val (σ : OMatching k m) (l : ILine σ) :
    (lines e σ l).1 = legs e l.1 := rfl

@[simp] theorem momentum (σ : OMatching k m) (q : ILine (matchings e σ) → Spacetime)
    (p : Fin k → Spacetime) (v : Fin n) :
    openMomentum (matchings e σ) q p v =
      openMomentum σ (fun l => q (lines e σ l)) p v := by
  unfold openMomentum
  congr 1
  · congr 1
    · rw [← (lines e σ).sum_comp]
      simp
    · rw [← (lines e σ).sum_comp]
      simp only [lines_val, legs_vertex]
      rfl
  · simp

end Relabel

/-- Amplitudes with factors attached to occurrences of the fixed leg family. -/
def openAmpFactors {n k : ℕ} {m : Fin n → Mon}
    (A B : OLeg k m → Spacetime → ℂ) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) : ℂ :=
  ∑ σ : OMatching k m, ∫ q : ILine σ → Spacetime,
    (∏ l : ILine σ, A (Sum.inr l.1) (q l) * B (σ.1 (Sum.inr l.1)) (q l) *
      (weight (q l) : ℂ)) *
    (∏ j : Fin k, B (σ.1 (Sum.inl j)) (p j)) *
    ∏ v, fourierE (f v) (openMomentum σ q p v)

theorem openAmpFactors_relabel {n k : ℕ} {m m' : Fin n → Mon}
    (e : ∀ v, (m v).ToType ≃ (m' v).ToType)
    (A B : OLeg k m' → Spacetime → ℂ) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) :
    openAmpFactors A B f p =
      openAmpFactors (fun l => A (Relabel.openLegs e l))
        (fun l => B (Relabel.openLegs e l)) f p := by
  unfold openAmpFactors
  rw [← (Relabel.matchings e).sum_comp]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← integral_reindex (Relabel.lines e σ).symm]
  apply integral_congr_ae
  apply ae_of_all
  intro q
  dsimp only
  rw [← (Relabel.lines e σ).prod_comp]
  simp

private def univOccurrences (I : Type) [Fintype I] :
    (Finset.univ.val : Multiset I).ToType ≃ I :=
  Equiv.ofBijective (fun x => x.1) (by
    constructor
    · rintro ⟨a, i⟩ ⟨b, j⟩ rfl
      congr 1
      apply Fin.ext
      have hi := i.isLt
      have hj := j.isLt
      simp at hi hj
      omega
    · intro a
      exact ⟨⟨a, ⟨0, by simp⟩⟩, rfl⟩)

def choiceOccurrences (Λ : ProperLorentz) (m : Mon) (β : MonChoices Λ m) :
    m.ToType ≃ (choiceMon Λ m β).ToType :=
  (univOccurrences m.ToType).symm.trans
    (Multiset.mapEquiv Finset.univ.val fun a => ((β a).1 : Idx))

@[simp] theorem choiceOccurrences_idx (Λ : ProperLorentz) (m : Mon)
    (β : MonChoices Λ m) (a : m.ToType) :
    (choiceOccurrences Λ m β a).1 = (β a).1 := by
  change (Multiset.mapEquiv Finset.univ.val (fun a => ((β a).1 : Idx))
    ((univOccurrences m.ToType).symm a)).1 = _
  rw [Multiset.mapEquiv_apply]
  exact congrArg (fun a => ((β a).1 : Idx)) ((univOccurrences m.ToType).apply_symm_apply a)

abbrev WordChoices (Λ : ProperLorentz) {n : ℕ} (m : Fin n → Mon) :=
  (v : Fin n) → MonChoices Λ (m v)

def choiceIndices (Λ : ProperLorentz) {n k : ℕ} {m : Fin n → Mon}
    (β : WordChoices Λ m) : OLeg k m → Idx :=
  Sum.elim (fun _ => 0) fun l => ((β l.1 l.2).1 : Idx)

theorem openAmp_choiceMon (Λ : ProperLorentz) {n : ℕ} (m : Fin n → Mon)
    (β : WordChoices Λ m) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmp (fun v => choiceMon Λ (m v) (β v)) f k p =
      openAmpFactors (fun l => Amono (choiceIndices Λ β l))
        (fun l => Bmono (choiceIndices Λ β l)) f p := by
  change openAmpFactors (fun l => Amono (oidx l)) (fun l => Bmono (oidx l)) f p = _
  rw [openAmpFactors_relabel (fun v => choiceOccurrences Λ (m v) (β v))]
  have h (l : OLeg k m) :
      oidx (Relabel.openLegs (fun v => choiceOccurrences Λ (m v) (β v)) l) =
        choiceIndices Λ β l := by
    cases l with
    | inl j => rfl
    | inr l => exact choiceOccurrences_idx Λ (m l.1) (β l.1) l.2
  simp only [h]

theorem openAmpL_rhoMon_fixed (Λ : ProperLorentz) {n : ℕ}
    (m : Fin n → Mon) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoMon Λ (m v)) f k p =
      ∑ β : WordChoices Λ m, (∏ v, monChoiceCoeff Λ (m v) (β v)) *
        openAmpFactors (fun l => Amono (choiceIndices Λ β l))
          (fun l => Bmono (choiceIndices Λ β l)) f p := by
  rw [openAmpL_rhoMon_choices]
  simp_rw [openAmp_choiceMon]

namespace Ports

variable {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)

theorem internal_exists (l : ILine σ) : ∃ a : Leg m, σ.1 (Sum.inr l.1) = Sum.inr a := by
  cases h : σ.1 (Sum.inr l.1) with
  | inl j =>
    have hl := l.2
    rw [h] at hl
    exact (Fin.not_lt_zero _ hl).elim
  | inr a => exact ⟨a, rfl⟩

def target (l : ILine σ) : Leg m := (internal_exists σ l).choose

@[simp] theorem target_spec (l : ILine σ) :
    σ.1 (Sum.inr l.1) = Sum.inr (target σ l) := (internal_exists σ l).choose_spec

@[simp] theorem target_back (l : ILine σ) :
    σ.1 (Sum.inr (target σ l)) = Sum.inr l.1 := by
  rw [← target_spec]
  exact σ.2.1 _

theorem external_exists (j : Fin k) : ∃ a : Leg m, σ.1 (Sum.inl j) = Sum.inr a := by
  cases h : σ.1 (Sum.inl j) with
  | inl i => exact (σ.2.2 (Sum.inl j) (by rw [h]; rfl)).elim
  | inr a => exact ⟨a, rfl⟩

def attach (j : Fin k) : Leg m := (external_exists σ j).choose

@[simp] theorem attach_spec (j : Fin k) :
    σ.1 (Sum.inl j) = Sum.inr (attach σ j) := (external_exists σ j).choose_spec

@[simp] theorem attach_back (j : Fin k) :
    σ.1 (Sum.inr (attach σ j)) = Sum.inl j := by
  rw [← attach_spec]
  exact σ.2.1 _

theorem source_ne_target (l l' : ILine σ) : l.1 ≠ target σ l' := by
  intro h
  have hl := l.2
  have hl' := l'.2
  rw [h, target_back] at hl
  rw [target_spec, ← h] at hl'
  rw [h] at hl'
  exact (lt_asymm hl hl')

theorem source_ne_attach (l : ILine σ) (j : Fin k) : l.1 ≠ attach σ j := by
  intro h
  have hl := l.2
  rw [h, attach_back] at hl
  exact Fin.not_lt_zero _ hl

theorem target_ne_attach (l : ILine σ) (j : Fin k) : target σ l ≠ attach σ j := by
  intro h
  have he := target_back σ l
  rw [h, attach_back] at he
  cases he

abbrev Port := (ILine σ ⊕ ILine σ) ⊕ Fin k

def leg : Port σ → Leg m := Sum.elim (Sum.elim Subtype.val (target σ)) (attach σ)

theorem leg_injective : Injective (leg σ) := by
  rintro ((a | b) | j) ((a' | b') | j') h
  · exact congrArg (fun a : ILine σ => Sum.inl (Sum.inl a)) (Subtype.ext h)
  · exact (source_ne_target σ a b' h).elim
  · exact (source_ne_attach σ a j' h).elim
  · exact (source_ne_target σ a' b h.symm).elim
  · have hh := congrArg (fun l => σ.1 (Sum.inr l)) h
    simp only [leg, Sum.elim_inl, Sum.elim_inr, target_back, Sum.inr.injEq] at hh
    exact congrArg (fun b : ILine σ => Sum.inl (Sum.inr b)) (Subtype.ext hh)
  · exact (target_ne_attach σ b j' h).elim
  · exact (source_ne_attach σ a' j h.symm).elim
  · exact (target_ne_attach σ b' j h.symm).elim
  · have hh := congrArg (fun l => σ.1 (Sum.inr l)) h
    simp only [leg, Sum.elim_inr, attach_back, Sum.inl.injEq] at hh
    exact congrArg Sum.inr hh

theorem leg_surjective : Surjective (leg σ) := by
  intro a
  cases h : σ.1 (Sum.inr a) with
  | inl j =>
    refine ⟨Sum.inr j, ?_⟩
    apply Sum.inr_injective
    change Sum.inr (attach σ j) = Sum.inr a
    rw [← attach_spec, ← h]
    exact σ.2.1 _
  | inr b =>
    have hab : ovtx (Sum.inr b : OLeg k m) ≠ ovtx (Sum.inr a : OLeg k m) := by
      simpa only [h] using σ.2.2 (Sum.inr a)
    rcases lt_or_gt_of_ne hab with hba | hab
    · have hb : σ.1 (Sum.inr b) = Sum.inr a := by
        rw [← h]
        exact σ.2.1 _
      let l : ILine σ := ⟨b, by rw [hb]; exact hba⟩
      refine ⟨Sum.inl (Sum.inr l), ?_⟩
      apply Sum.inr_injective
      exact (target_spec σ l).symm.trans hb
    · exact ⟨Sum.inl (Sum.inl ⟨a, by rw [h]; exact hab⟩), rfl⟩

def equiv : Port σ ≃ Leg m := Equiv.ofBijective (leg σ) ⟨leg_injective σ, leg_surjective σ⟩

def factor (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : Port σ → Idx → ℂ :=
  Sum.elim (Sum.elim (fun l α => Amono α (q l)) (fun l α => Bmono α (q l)))
    (fun j α => Bmono α (p j))

def legFactor (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (l : Leg m) : Idx → ℂ :=
  factor σ q p ((equiv σ).symm l)

theorem prod_legFactor (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (α : Leg m → Idx) :
    (∏ l : Leg m, legFactor σ q p l (α l)) =
      (∏ l : ILine σ, Amono (α l.1) (q l) * Bmono (α (target σ l)) (q l)) *
      ∏ j : Fin k, Bmono (α (attach σ j)) (p j) := by
  calc
    _ = ∏ t : Port σ, factor σ q p t (α (equiv σ t)) := by
      symm
      apply Fintype.prod_equiv (equiv σ)
      intro t
      simp only [legFactor, Equiv.symm_apply_apply]
    _ = _ := by
      simp only [Fintype.prod_sum_type, factor, Sum.elim_inl, Sum.elim_inr,
        equiv, Equiv.ofBijective_apply, leg, ← Finset.prod_mul_distrib]

end Ports

/-- A matching integrand with arbitrary derivative indices on its fixed occurrences. -/
def matchingIntegrand {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (α : OLeg k m → Idx) (f : Fin n → TestFunction) (p : Fin k → Spacetime)
    (q : ILine σ → Spacetime) : ℂ :=
  (∏ l : ILine σ, Amono (α (Sum.inr l.1)) (q l) *
    Bmono (α (σ.1 (Sum.inr l.1))) (q l) * (weight (q l) : ℂ)) *
  (∏ j : Fin k, Bmono (α (σ.1 (Sum.inl j))) (p j)) *
  ∏ v, fourierE (f v) (openMomentum σ q p v)

theorem matchingIntegrand_eq_prod {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (α : OLeg k m → Idx) (f : Fin n → TestFunction) (p : Fin k → Spacetime)
    (q : ILine σ → Spacetime) :
    matchingIntegrand σ α f p q =
      (∏ l : Leg m, Ports.legFactor σ q p l (α (Sum.inr l))) *
      (∏ l : ILine σ, (weight (q l) : ℂ)) *
      ∏ v, fourierE (f v) (openMomentum σ q p v) := by
  rw [Ports.prod_legFactor]
  simp only [matchingIntegrand, Ports.target_spec, Ports.attach_spec,
    Finset.prod_mul_distrib]
  ring

theorem sum_choice_legFactor (Λ : ProperLorentz) {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (l : Leg m) :
    (∑ β : DerivChoice Λ l.idx, choiceCoeff Λ l.idx β *
      Ports.legFactor σ q p l (β.1 : Idx)) =
        Ports.legFactor σ (fun i => lorT Λ (q i)) (fun j => lorT Λ (p j)) l l.idx := by
  have hA (r : Spacetime) :
      (∑ β : DerivChoice Λ l.idx, choiceCoeff Λ l.idx β * Amono (β.1 : Idx) r) =
        Amono l.idx (lorT Λ r) :=
    (Finset.sum_coe_sort _ _).trans (sum_coeff_Amono Λ r l.idx)
  have hB (r : Spacetime) :
      (∑ β : DerivChoice Λ l.idx, choiceCoeff Λ l.idx β * Bmono (β.1 : Idx) r) =
        Bmono l.idx (lorT Λ r) :=
    (Finset.sum_coe_sort _ _).trans (sum_coeff_Bmono Λ r l.idx)
  unfold Ports.legFactor
  cases h : (Ports.equiv σ).symm l with
  | inl t =>
    cases t with
    | inl i => exact hA (q i)
    | inr i => exact hB (q i)
  | inr j => exact hB (p j)

set_option backward.isDefEq.respectTransparency false in
theorem sum_choice_integrand (Λ : ProperLorentz) {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (f : Fin n → TestFunction) (p : Fin k → Spacetime)
    (q : ILine σ → Spacetime) :
    (∑ β : WordChoices Λ m, (∏ v, monChoiceCoeff Λ (m v) (β v)) *
      matchingIntegrand σ (choiceIndices Λ β) f p q) =
    (∏ l : ILine σ, Amono l.1.idx (lorT Λ (q l)) *
      Bmono (oidx (σ.1 (Sum.inr l.1))) (lorT Λ (q l)) * (weight (q l) : ℂ)) *
    (∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (lorT Λ (p j))) *
    ∏ v, fourierE (f v) (openMomentum σ q p v) := by
  simp_rw [matchingIntegrand_eq_prod]
  simp only [← mul_assoc, ← Finset.sum_mul]
  have hsum :
      (∑ β : WordChoices Λ m, (∏ v, monChoiceCoeff Λ (m v) (β v)) *
        ∏ l : Leg m, Ports.legFactor σ q p l (choiceIndices (k := k) Λ β (Sum.inr l))) =
      ∏ l : Leg m, Ports.legFactor σ (fun i => lorT Λ (q i))
        (fun j => lorT Λ (p j)) l l.idx := by
    simp only [Fintype.prod_sigma, monChoiceCoeff, choiceIndices, Sum.elim_inr,
      ← Finset.prod_mul_distrib]
    calc
      _ = ∏ v : Fin n, ∑ b : MonChoices Λ (m v), ∏ a : (m v).ToType,
          choiceCoeff Λ a.1 (b a) * Ports.legFactor σ q p ⟨v, a⟩ ((b a).1 : Idx) :=
        (Fintype.prod_sum (fun (v : Fin n) (b : MonChoices Λ (m v)) =>
          ∏ a : (m v).ToType, choiceCoeff Λ a.1 (b a) *
            Ports.legFactor σ q p ⟨v, a⟩ ((b a).1 : Idx))).symm
      _ = _ := by
        apply Finset.prod_congr rfl
        intro v _
        calc
          _ = ∏ a : (m v).ToType, ∑ b : DerivChoice Λ a.1,
              choiceCoeff Λ a.1 b * Ports.legFactor σ q p ⟨v, a⟩ (b.1 : Idx) :=
            (Fintype.prod_sum (fun (a : (m v).ToType) (b : DerivChoice Λ a.1) =>
              choiceCoeff Λ a.1 b * Ports.legFactor σ q p ⟨v, a⟩ (b.1 : Idx))).symm
          _ = _ := by
            apply Finset.prod_congr rfl
            intro a _
            exact sum_choice_legFactor Λ σ q p ⟨v, a⟩
  rw [hsum, Ports.prod_legFactor]
  simp only [Ports.target_spec, Ports.attach_spec, oidx, Sum.elim_inr,
    Finset.prod_mul_distrib]
  ring

/- The estimates in this namespace adapt the directed-cut argument in
`Work/openAmpW_memLp.lean`. Here external momenta are fixed and arbitrary; their
norms enter the constant, and the derivative indices may vary at every occurrence. -/
namespace OpenIntegrability
open scoped FourierTransform

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
    (hq : ∀ l, 0 ≤ time (q l)) :
    (∑ l, time (q l)) ≤ (n : ℝ) *
      ((∑ v, ‖openMomentum σ q p v‖) + ∑ j, ‖p j‖) := by
  have hint (l : ILine σ) :
      (1 : ℝ) ≤ (ovtx (σ.1 (Sum.inr l.1))).val - ((l.1.1.val : ℝ) + 1) := by
    have h : l.1.1.val + 1 < (ovtx (σ.1 (Sum.inr l.1))).val := l.2
    have h' : (l.1.1.val : ℝ) + 2 ≤ (ovtx (σ.1 (Sum.inr l.1))).val := by
      exact_mod_cast h
    linarith
  have hv : (∑ v : Fin n, ((v.val : ℝ) + 1) * time (openMomentum σ q p v)) ≤
      n * ∑ v, ‖openMomentum σ q p v‖ := by
    rw [Finset.mul_sum]
    apply Finset.sum_le_sum
    intro v _
    have ht : time (openMomentum σ q p v) ≤ ‖openMomentum σ q p v‖ :=
      (le_abs_self _).trans (PiLp.norm_apply_le (openMomentum σ q p v) timeAxis)
    have hv : (v.val : ℝ) + 1 ≤ n := by exact_mod_cast v.isLt
    exact (mul_le_mul_of_nonneg_left ht (by positivity)).trans
      (mul_le_mul_of_nonneg_right hv (norm_nonneg _))
  have he : -(∑ j : Fin k, ((ovtx (σ.1 (Sum.inl j))).val : ℝ) * time (p j)) ≤
      n * ∑ j, ‖p j‖ := by
    rw [← Finset.sum_neg_distrib, Finset.mul_sum]
    apply Finset.sum_le_sum
    intro j _
    have ht : -time (p j) ≤ ‖p j‖ :=
      (neg_le_abs _).trans (PiLp.norm_apply_le (p j) timeAxis)
    have hj : ((ovtx (σ.1 (Sum.inl j))).val : ℝ) ≤ n := by
      exact_mod_cast Nat.le_of_lt_succ (ovtx (σ.1 (Sum.inl j))).isLt
    rw [← mul_neg]
    exact (mul_le_mul_of_nonneg_left ht (by positivity)).trans
      (mul_le_mul_of_nonneg_right hj (norm_nonneg _))
  have hi : (∑ l, time (q l)) ≤ ∑ l : ILine σ,
      ((ovtx (σ.1 (Sum.inr l.1))).val - ((l.1.1.val : ℝ) + 1)) * time (q l) :=
    Finset.sum_le_sum fun l _ => le_mul_of_one_le_left (hq l) (hint l)
  linarith [open_energy_identity σ q p]

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
    (hq : ∀ l, q l ∈ forwardCone) :
    (∑ l, ‖q l‖) ≤ 2 * n * ((∑ v, ‖openMomentum σ q p v‖) + ∑ j, ‖p j‖) := by
  calc
    _ ≤ ∑ l, 2 * time (q l) :=
      Finset.sum_le_sum fun l _ => cone_norm_le_twice_time (hq l)
    _ = 2 * ∑ l, time (q l) := (Finset.mul_sum ..).symm
    _ ≤ 2 * ((n : ℝ) * ((∑ v, ‖openMomentum σ q p v‖) + ∑ j, ‖p j‖)) :=
      mul_le_mul_of_nonneg_left (open_energy_bound σ q p
        (fun l => (norm_nonneg _).trans (hq l))) (by norm_num)
    _ = _ := by ring

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

private def radiusConstant {k : ℕ} (n : ℕ) (p : Fin k → Spacetime) : ℝ :=
  1 + 2 * n * n + (2 * n + 1) * ∑ j, ‖p j‖

private theorem radiusConstant_nonneg {k : ℕ} (n : ℕ) (p : Fin k → Spacetime) :
    0 ≤ radiusConstant n p := by unfold radiusConstant; positivity

private theorem openRadius_le_vertex_prod {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (q : ILine σ → Spacetime) (p : Fin k → Spacetime)
    (hq : ∀ l, q l ∈ forwardCone) :
    openRadius σ q p ≤ radiusConstant n p * ∏ v : Fin n, (1 + ‖openMomentum σ q p v‖) := by
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
  have hqnorm : ‖q‖ ≤ ∑ l, ‖q l‖ := by
    apply (pi_norm_le_iff_of_nonneg (by positivity)).2
    intro l
    exact Finset.single_le_sum (fun i _ => norm_nonneg (q i)) (Finset.mem_univ l)
  have hb := open_momentum_bound σ q p hq
  have hh := mul_le_mul_of_nonneg_left hs (show 0 ≤ (2 : ℝ) * n by positivity)
  have hp := mul_le_mul_of_nonneg_left hR
    (show 0 ≤ (2 * (n : ℝ) + 1) * ∑ j, ‖p j‖ by positivity)
  change 1 + ‖q‖ + ∑ j, ‖p j‖ ≤ (1 + 2 * n * n + (2 * n + 1) * ∑ j, ‖p j‖) * R
  nlinarith

private def openDegree {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) (a : OLeg k m → Idx) : ℕ :=
  (∑ ℓ : ILine σ, (idxOrder (a (Sum.inr ℓ.1)) + idxOrder (a (σ.1 (Sum.inr ℓ.1))) + 4)) +
    ∑ j : Fin k, idxOrder (a (σ.1 (Sum.inl j)))

private def openKernel {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) (a : OLeg k m → Idx)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : ℂ :=
  (∏ ℓ : ILine σ, Amono (a (Sum.inr ℓ.1)) (q ℓ) * Bmono (a (σ.1 (Sum.inr ℓ.1))) (q ℓ) *
    (weight (q ℓ) : ℂ)) * ∏ j : Fin k, Bmono (a (σ.1 (Sum.inl j))) (p j)

private theorem norm_openKernel_le {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) (a : OLeg k m → Idx)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) :
    ‖openKernel σ a q p‖ ≤ openRadius σ q p ^ openDegree σ a := by
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

private theorem integrand_eq_zero_off_cone {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (a : OLeg k m → Idx) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) (q : ILine σ → Spacetime) (hq : ¬ ∀ l, q l ∈ forwardCone) :
    matchingIntegrand σ a f p q = 0 := by
  obtain ⟨l, hl⟩ := not_forall.mp hq
  have h : (∏ l : ILine σ, Amono (a (Sum.inr l.1)) (q l) *
      Bmono (a (σ.1 (Sum.inr l.1))) (q l) * (weight (q l) : ℂ)) = 0 := by
    apply Finset.prod_eq_zero (Finset.mem_univ l)
    rw [weight_eq_zero hl, Complex.ofReal_zero, mul_zero]
  simp only [matchingIntegrand, h, zero_mul]

private def bound {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : OLeg k m → Idx) (s : ℕ) (f : Fin n → TestFunction) (p : Fin k → Spacetime) : ℝ :=
  radiusConstant n p ^ (openDegree σ a + s) *
    ∏ v : Fin n, fourierBound (openDegree σ a + s) (f v)

private theorem bound_nonneg {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : OLeg k m → Idx) (s : ℕ) (f : Fin n → TestFunction) (p : Fin k → Spacetime) :
    0 ≤ bound σ a s f p := by
  unfold bound
  exact mul_nonneg (pow_nonneg (radiusConstant_nonneg n p) _)
    (Finset.prod_nonneg fun v _ => fourierBound_nonneg _ _)

private theorem weighted_integrand_le {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (a : OLeg k m → Idx) (s : ℕ) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) (q : ILine σ → Spacetime) :
    openRadius σ q p ^ s * ‖matchingIntegrand σ a f p q‖ ≤ bound σ a s f p := by
  have hR := (openRadius_pos σ q p).le
  by_cases hq : ∀ l, q l ∈ forwardCone
  · have hdecay :
        (∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^ (openDegree σ a + s) *
            (∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) ≤
          ∏ v : Fin n, fourierBound (openDegree σ a + s) (f v) := by
      rw [← Finset.prod_pow, ← Finset.prod_mul_distrib]
      exact Finset.prod_le_prod (fun v _ => by positivity) fun v _ => fourier_decay _ _ _
    calc
      _ = openRadius σ q p ^ s * (‖openKernel σ a q p‖ *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        change _ * ‖openKernel σ a q p * _‖ = _
        rw [norm_mul, norm_prod]
      _ ≤ openRadius σ q p ^ s * (openRadius σ q p ^ openDegree σ a *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        gcongr
        exact norm_openKernel_le σ a q p
      _ = openRadius σ q p ^ (openDegree σ a + s) *
          ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖ := by
        rw [pow_add]
        ring
      _ ≤ (radiusConstant n p * ∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^
          (openDegree σ a + s) * ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖ := by
        gcongr
        exact openRadius_le_vertex_prod σ q p hq
      _ = radiusConstant n p ^ (openDegree σ a + s) *
          ((∏ v : Fin n, (1 + ‖openMomentum σ q p v‖)) ^ (openDegree σ a + s) *
            ∏ v : Fin n, ‖fourierE (f v) (openMomentum σ q p v)‖) := by
        rw [mul_pow, mul_assoc]
      _ ≤ bound σ a s f p :=
        mul_le_mul_of_nonneg_left hdecay (pow_nonneg (radiusConstant_nonneg n p) _)
  · rw [integrand_eq_zero_off_cone σ a f p q hq, norm_zero, mul_zero]
    exact bound_nonneg σ a s f p

private theorem integrand_le {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (a : OLeg k m → Idx) (s : ℕ) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) (q : ILine σ → Spacetime) :
    ‖matchingIntegrand σ a f p q‖ ≤ bound σ a s f p * ((1 + ‖q‖) ^ s)⁻¹ := by
  rw [← div_eq_mul_inv, le_div_iff₀ (by positivity)]
  have hR : 1 + ‖q‖ ≤ openRadius σ q p := by
    unfold openRadius
    exact le_add_of_nonneg_right (Finset.sum_nonneg fun j _ => norm_nonneg (p j))
  have h := (mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (by positivity) hR s)
    (norm_nonneg (matchingIntegrand σ a f p q))).trans
      (weighted_integrand_le σ a s f p q)
  simpa only [mul_comm] using h

private theorem measurable_integrand {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (a : OLeg k m → Idx) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) : Measurable (matchingIntegrand σ a f p) := by
  have hA (α : Idx) : Continuous (Amono α) := by unfold Amono time; fun_prop
  have hB (α : Idx) : Continuous (Bmono α) := by unfold Bmono time; fun_prop
  have hF (v : Fin n) : Continuous (fourierE (f v)) := by
    have h : (fun x => fourierSchwartz (f v) x) = fourierE (f v) :=
      funext (fourierSchwartz_apply (f v))
    rw [← h]
    exact (fourierSchwartz (f v)).continuous
  have hM (v : Fin n) : Continuous (fun q : ILine σ → Spacetime => openMomentum σ q p v) := by
    unfold openMomentum
    apply Continuous.add
    · apply Continuous.sub
      · apply continuous_finsetSum
        intro l _
        split_ifs <;> fun_prop
      · apply continuous_finsetSum
        intro l _
        split_ifs <;> fun_prop
    · fun_prop
  unfold matchingIntegrand
  apply Measurable.mul
  · apply Measurable.mul_const
    apply Finset.measurable_prod
    intro l _
    exact (((hA _).comp (continuous_apply l)).measurable.mul
      ((hB _).comp (continuous_apply l)).measurable).mul
        (Complex.measurable_ofReal.comp (measurable_weight.comp (measurable_pi_apply l)))
  · apply Finset.measurable_prod
    intro v _
    exact ((hF v).comp (hM v)).measurable

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

theorem integrable_matchingIntegrand {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) (a : OLeg k m → Idx) (f : Fin n → TestFunction)
    (p : Fin k → Spacetime) : Integrable (matchingIntegrand σ a f p) := by
  apply ((internal_tail_integrable σ).const_mul (bound σ a (internalPower σ) f p)).mono'
    (measurable_integrand σ a f p).aestronglyMeasurable
  exact ae_of_all _ (integrand_le σ a (internalPower σ) f p)

end OpenIntegrability

theorem openAmpL_rhoMon_expand (Λ : ProperLorentz) (n : ℕ)
    (m : Fin n → Mon) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoMon Λ (m v)) f k p = openAmpLorentzLegs Λ m f k p := by
  rw [openAmpL_rhoMon_fixed]
  unfold openAmpFactors openAmpLorentzLegs
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  change (∑ β : WordChoices Λ m, (∏ v, monChoiceCoeff Λ (m v) (β v)) *
    ∫ q, matchingIntegrand σ (choiceIndices Λ β) f p q) = _
  simp_rw [← integral_const_mul]
  rw [← integral_finsetSum _ (fun β _ =>
    (OpenIntegrability.integrable_matchingIntegrand σ (choiceIndices Λ β) f p).const_mul
      (∏ v, monChoiceCoeff Λ (m v) (β v)))]
  apply integral_congr_ae
  exact ae_of_all _ (sum_choice_integrand Λ σ f p)

theorem openAmpL_rhoMon_lorentz (Λ : ProperLorentz) (n : ℕ)
    (m : Fin n → Mon) (f : Fin n → TestFunction) (k : ℕ) (p : Fin k → Spacetime) :
    openAmpL (fun v => rhoMon Λ (m v)) (fun v => onTests ((Λ, 0) : Sym) (f v)) k p =
      openAmp m f k (fun j => lorT Λ (p j)) := by
  rw [openAmpL_rhoMon_expand, openAmpLorentzLegs_onTests]

end PsiCovariantProof

theorem Psi_covariant' (g : Sym) (u : Word) :
    poinOp g (Psi u) = Psi (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) := by
  apply PsiCovariantProof.covariance_of_amplitudes g u
  intro k
  exact Filter.Eventually.of_forall fun p =>
    PsiCovariantProof.openAmpW_covariant_of_monomials g
      (PsiCovariantProof.openAmpL_rhoMon_lorentz g.lor) u k p

end YangMills.FreeField.Consolidated.Theory_PsiCovariant

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 900 lines] **Covariance of the word vectors.** Amplitude identity, for monomials and
then labels: with `g = (Λ, a)`,
`openAmpW (g·u) k p = phase a k p * openAmpW u k (Λᵀ p)`.
Ingredients: `fourierE (onTests g f) k = exp (i ⟪a, k⟫) fourierE f (Λᵀ k)`; the phases multiply
to `exp (i ⟪a, ∑_v k_v⟫) = phase a k p` because internal lines cancel in `∑_v k_v`; the change of
variables `q ↦ Λᵀ q` in the internal lines (`mu_map_adjoint`); and for the leg factors
`∑_β' c_{β'β} Bmono β' p = Bmono β (Λᵀ p)` and the same for `Amono`, where `c` are the
coefficients in `rhoIdx Λ β` (first order: `Bmono e_j p = b_j p_j` with `b = (i,i,i,-1)`, and
`D_i⁻¹ D_j b_i = b_j`). Depends on `fockOp_apply`, `mu_map_adjoint`, `Psi_apply`. -/
theorem Psi_covariant (g : Sym) (u : Word) :
    poinOp g (Psi u) = Psi (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) := by
  exact Consolidated.Theory_PsiCovariant.Psi_covariant' g u

end YangMills.FreeField
