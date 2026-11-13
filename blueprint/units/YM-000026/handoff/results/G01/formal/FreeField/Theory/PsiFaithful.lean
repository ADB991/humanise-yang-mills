import FreeField.Theory.Base
import FreeField.Theory.PsiApply

import Mathlib.Algebra.MvPolynomial.Funext
import Mathlib.Topology.Algebra.MvPolynomial
import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier

/-! Proofs consolidated from `FreeField/Work/Psi_faithful.lean`. -/

/-!
Faithfulness from the explicit one-insertion amplitudes. A coefficient of the sector polynomial
recovers a label coefficient times a positive integer. Polynomial uniqueness on a real box in the
open cone, Fourier inversion of a smooth bump, and positivity of the spectral density then give a
nonzero amplitude modulo almost-everywhere equality. This also treats the zero-particle sector.

The only skeleton theorem invoked is `Psi_apply`; its statement supplies the `MemLp` witness used
to identify the amplitude with its `L²` representative.
-/

set_option autoImplicit false
noncomputable section

namespace YangMills.FreeField.Consolidated.Theory_PsiFaithful
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace PsiFaithful

/-- The normalization of every particle sector is nonzero, including the vacuum sector. -/
theorem normalization_ne_zero (k : ℕ) :
    ((((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ)) ≠ 0 := by
  exact_mod_cast inv_ne_zero (Real.sqrt_ne_zero'.mpr (by positivity))

theorem ae_zero_of_toLp_zero {k : ℕ} {g : (Fin k → Spacetime) → ℂ}
    {hg : MemLp g 2 (Measure.pi fun _ : Fin k => mu)} (h : hg.toLp g = 0) :
    g =ᵐ[Measure.pi fun _ : Fin k => mu] 0 := by
  exact hg.coeFn_toLp.symm.trans
    (h ▸ Lp.coeFn_zero ℂ 2 (Measure.pi fun _ : Fin k => mu))

/-- The totalized Fock constructor loses no nonzero amplitude once `Psi_apply` is available. -/
theorem Psi_ne_zero_of_amplitude (w : Word) (k : ℕ)
    (h : ¬ openAmpW w k =ᵐ[Measure.pi fun _ : Fin k => mu] 0) : Psi w ≠ 0 := by
  intro hw
  have hz : (Psi w) k = 0 := by rw [hw]; rfl
  rw [Psi_apply] at hz
  have hz' := (smul_eq_zero.mp hz).resolve_left (normalization_ne_zero k)
  exact h (ae_zero_of_toLp_zero hz')

/-- For one vertex, an external slot must be paired with a leg at that vertex. -/
theorem external_target {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) (j : Fin k) :
    ∃ ℓ : Leg m, σ.1 (Sum.inl j) = Sum.inr ℓ := by
  cases h : σ.1 (Sum.inl j) with
  | inl j' => exact False.elim (σ.2.2 (Sum.inl j) (by simp [h, ovtx]))
  | inr ℓ => exact ⟨ℓ, rfl⟩

/-- For one vertex, a vertex leg must be paired with an external slot. -/
theorem internal_target {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) (ℓ : Leg m) :
    ∃ j : Fin k, σ.1 (Sum.inr ℓ) = Sum.inl j := by
  cases h : σ.1 (Sum.inr ℓ) with
  | inl j => exact ⟨j, rfl⟩
  | inr ℓ' =>
    exact False.elim (σ.2.2 (Sum.inr ℓ) (by
      simp only [h, ovtx, Sum.elim_inr]
      exact congrArg Fin.succ (Subsingleton.elim _ _)))

/-- There are no internal lines in the amplitude of one field insertion. -/
theorem no_internal_lines {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) :
    IsEmpty (ILine σ) := by
  refine ⟨fun ℓ => ?_⟩
  obtain ⟨j, hj⟩ := internal_target σ ℓ.1
  have h := ℓ.2
  simp [hj, ovtx] at h

/-- A one-vertex open matching is a bijection from external slots to vertex legs. -/
def externalEquiv {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) : Fin k ≃ Leg m where
  toFun j := (external_target σ j).choose
  invFun ℓ := (internal_target σ ℓ).choose
  left_inv j := by
    apply Sum.inl_injective
    rw [← (internal_target σ _).choose_spec, ← (external_target σ j).choose_spec]
    exact σ.2.1 _
  right_inv ℓ := by
    apply Sum.inr_injective
    rw [← (external_target σ _).choose_spec, ← (internal_target σ ℓ).choose_spec]
    exact σ.2.1 _

theorem matching_card {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) :
    k = (m 0).card := by
  simpa [Leg] using Fintype.card_congr (externalEquiv σ)

theorem openMomentum_single {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (v : Fin 1) :
    openMomentum σ q p v = totalMom p := by
  letI := no_internal_lines σ
  have h (j : Fin k) : ovtx (σ.1 (Sum.inl j)) = v.succ := by
    obtain ⟨ℓ, hℓ⟩ := external_target σ j
    simp only [hℓ, ovtx, Sum.elim_inr]
    exact congrArg Fin.succ (Subsingleton.elim _ _)
  simp [openMomentum, h, totalMom]

/-- One field insertion has a Fourier factor and a finite symmetrized monomial factor. -/
theorem openAmp_single (m : Fin 1 → Mon) (f : Fin 1 → TestFunction)
    (k : ℕ) (p : Fin k → Spacetime) :
    openAmp m f k p = fourierE (f 0) (totalMom p) *
      ∑ σ : OMatching k m, ∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (p j) := by
  unfold openAmp
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro σ _
  letI := no_internal_lines σ
  simp [openMomentum_single, mul_comm, MeasureTheory.volume_pi, measureReal_def]

/-- Twisted momentum coordinates in which the leg factors are ordinary monomials. -/
def momentumCoords {k : ℕ} (p : Fin k → Spacetime) (ji : Fin k × Fin 4) : ℂ :=
  if ji.2 = timeAxis then -(p ji.1 ji.2 : ℂ) else Complex.I * (p ji.1 ji.2 : ℂ)

def matchingPower {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m) :
    (Fin k × Fin 4) →₀ ℕ :=
  Finsupp.equivFunOnFinite.symm fun ji => oidx (σ.1 (Sum.inl ji.1)) ji.2

theorem eval_matchingPower {k : ℕ} {m : Fin 1 → Mon} (σ : OMatching k m)
    (p : Fin k → Spacetime) :
    MvPolynomial.eval (momentumCoords p) (MvPolynomial.monomial (matchingPower σ) (1 : ℂ)) =
      ∏ j : Fin k, Bmono (oidx (σ.1 (Sum.inl j))) (p j) := by
  rw [MvPolynomial.eval_monomial, one_mul, Finsupp.prod_fintype _ _ (fun _ => pow_zero _)]
  change (∏ ji : Fin k × Fin 4, momentumCoords p ji ^ oidx (σ.1 (Sum.inl ji.1)) ji.2) = _
  rw [Fintype.prod_prod_type]
  apply Finset.prod_congr rfl
  intro j _
  rw [Fin.prod_univ_castSucc]
  have h (i : Fin 3) : i.castSucc ≠ timeAxis := by
    intro heq
    have hv : i.val = 3 := congrArg Fin.val heq
    have hi := i.isLt
    omega
  simp only [momentumCoords, Bmono, time, h, ↓reduceIte]

/-- The sector polynomial before evaluation at the twisted momenta. -/
def sectorPolynomial (A : Mon →₀ ℂ) (k : ℕ) : MvPolynomial (Fin k × Fin 4) ℂ :=
  ∑ m ∈ A.support, MvPolynomial.C (A m) *
    ∑ σ : OMatching k (fun _ : Fin 1 => m), MvPolynomial.monomial (matchingPower σ) 1

/-- With one vertex, a leg is just an occurrence in its monomial. -/
def legEquiv (m : Mon) : Leg (fun _ : Fin 1 => m) ≃ m.ToType where
  toFun ℓ := ℓ.2
  invFun ℓ := ⟨0, ℓ⟩
  left_inv := by
    rintro ⟨v, ℓ⟩
    have hv : v = 0 := Subsingleton.elim _ _
    cases hv
    rfl
  right_inv _ := rfl

/-- The multiset of external derivative indices recovers the original Wick monomial. -/
theorem matching_recovers_monomial {k : ℕ} {m : Mon}
    (σ : OMatching k (fun _ : Fin 1 => m)) :
    Finset.univ.val.map (fun j : Fin k => oidx (σ.1 (Sum.inl j))) = m := by
  let e : Fin k ≃ m.ToType := (externalEquiv σ).trans (legEquiv m)
  have he (j : Fin k) : (e j).1 = oidx (σ.1 (Sum.inl j)) := by
    rw [(external_target σ j).choose_spec]
    rfl
  have hm : Finset.univ.val.map e = (Finset.univ : Finset m.ToType).val := by
    exact congrArg Finset.val (Finset.univ_map_equiv_to_embedding e)
  calc
    _ = (Finset.univ.val.map e).map (fun ℓ : m.ToType => ℓ.1) := by
      rw [Multiset.map_map]
      congr 1
      exact funext fun j => (he j).symm
    _ = m := by rw [hm]; exact Multiset.map_univ_coe m

theorem matchingPower_determines_monomial {k : ℕ} {m m' : Mon}
    (σ : OMatching k (fun _ : Fin 1 => m)) (τ : OMatching k (fun _ : Fin 1 => m'))
    (h : matchingPower σ = matchingPower τ) : m = m' := by
  rw [← matching_recovers_monomial σ, ← matching_recovers_monomial τ]
  congr 1
  funext j i
  exact congrArg (fun d : (Fin k × Fin 4) →₀ ℕ => d (j, i)) h

/-- Any ordering of a monomial's legs supplies an open matching. -/
def matchingOfEquiv {k : ℕ} {m : Mon}
    (e : Fin k ≃ Leg (fun _ : Fin 1 => m)) : OMatching k (fun _ : Fin 1 => m) :=
  ⟨{ toFun := Sum.elim (fun j => Sum.inr (e j)) (fun ℓ => Sum.inl (e.symm ℓ))
     invFun := Sum.elim (fun j => Sum.inr (e j)) (fun ℓ => Sum.inl (e.symm ℓ))
     left_inv := by intro x; cases x <;> simp
     right_inv := by intro x; cases x <;> simp },
    by intro x; cases x <;> simp,
    by
      intro x
      cases x with
      | inl j => exact Fin.succ_ne_zero _
      | inr ℓ => exact Ne.symm (Fin.succ_ne_zero _)⟩

theorem matching_nonempty (m : Mon) : Nonempty (OMatching m.card (fun _ : Fin 1 => m)) := by
  exact ⟨matchingOfEquiv (Fintype.equivOfCardEq (by simp [Leg]))⟩

/-- Distinct multisets cannot cancel at the coefficient belonging to a fixed matching. -/
theorem coefficient_sectorPolynomial (A : Mon →₀ ℂ) (k : ℕ) (m : Mon) (hm : m ∈ A.support)
    (σ : OMatching k (fun _ : Fin 1 => m)) :
    (sectorPolynomial A k).coeff (matchingPower σ) = A m *
      ((Finset.univ.filter fun τ : OMatching k (fun _ : Fin 1 => m) =>
        matchingPower τ = matchingPower σ).card : ℂ) := by
  simp only [sectorPolynomial, MvPolynomial.coeff_sum, MvPolynomial.coeff_C_mul,
    MvPolynomial.coeff_monomial]
  rw [Finset.sum_eq_single m]
  · congr 1
    simp [Finset.sum_boole]
  · intro m' _ hne
    have h (τ : OMatching k (fun _ : Fin 1 => m')) : matchingPower τ ≠ matchingPower σ := by
      intro heq
      exact hne (matchingPower_determines_monomial τ σ heq)
    simp [h]
  · exact fun h => False.elim (h hm)

theorem sectorPolynomial_ne_zero (A : Mon →₀ ℂ) (hA : A ≠ 0) :
    ∃ k, sectorPolynomial A k ≠ 0 := by
  obtain ⟨m, hm⟩ := Finsupp.support_nonempty_iff.mpr hA
  obtain ⟨σ⟩ := matching_nonempty m
  refine ⟨m.card, fun hz => ?_⟩
  have hc := coefficient_sectorPolynomial A m.card m hm σ
  rw [hz, MvPolynomial.coeff_zero] at hc
  have hn : (Finset.univ.filter fun τ : OMatching m.card (fun _ : Fin 1 => m) =>
      matchingPower τ = matchingPower σ).card ≠ 0 := by
    exact Finset.card_ne_zero.mpr ⟨σ, by simp⟩
  exact (mul_ne_zero (Finsupp.mem_support_iff.mp hm) (Nat.cast_ne_zero.mpr hn)) hc.symm

theorem amplitude_polynomial (A : Mon →₀ ℂ) (f : TestFunction) (k : ℕ)
    (p : Fin k → Spacetime) :
    openAmpW [(A, f)] k p =
      fourierE f (totalMom p) * MvPolynomial.eval (momentumCoords p) (sectorPolynomial A k) := by
  change openAmpL (fun _ : Fin 1 => A) (fun _ => f) k p = _
  unfold openAmpL
  rw [show (∑ μ ∈ Fintype.piFinset (fun _ : Fin 1 => A.support),
      (∏ i, A (μ i)) * openAmp μ (fun _ => f) k p) =
      ∑ m ∈ A.support, A m * openAmp (fun _ : Fin 1 => m) (fun _ => f) k p from ?_]
  · simp only [openAmp_single, sectorPolynomial, map_sum, map_mul, MvPolynomial.eval_C,
      eval_matchingPower, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro m _
    simp only [mul_left_comm]
  · apply Finset.sum_equiv (Equiv.funUnique (Fin 1) Mon)
    · intro μ
      simp only [Fintype.mem_piFinset, Equiv.funUnique, Equiv.piUnique, Equiv.coe_fn_mk]
      exact ⟨fun h => h 0, fun h i => by simpa [Subsingleton.elim i 0] using h⟩
    · intro μ _
      simp only [Fin.prod_univ_one, Equiv.funUnique, Equiv.piUnique, Equiv.coe_fn_mk]
      congr 2
      exact funext fun i => congrArg μ (Subsingleton.elim i 0)

def coneInterior : Set Spacetime := {p | ‖spatial p‖ < time p}

theorem coneInterior_open : IsOpen coneInterior := by
  apply isOpen_lt
  · unfold spatial
    fun_prop
  · unfold time
    fun_prop

theorem weight_pos {p : Spacetime} (hp : p ∈ coneInterior) : 0 < weight p := by
  change ‖spatial p‖ < time p at hp
  have ht : 0 < time p := lt_of_le_of_lt (norm_nonneg _) hp
  have hs : 0 < minkowskiSquare p := by
    unfold minkowskiSquare
    nlinarith [norm_nonneg (spatial p)]
  have hc : p ∈ forwardCone := hp.le
  rw [weight, if_pos hc]
  apply div_pos (sq_pos_of_pos hs) (sq_pos_of_pos (Real.log_pos ?_))
  have he : 1 < Real.exp 1 := Real.one_lt_exp_iff.mpr zero_lt_one
  linarith

/-- A direct proof here avoids introducing an additional skeleton dependency. -/
theorem weight_measurable : Measurable weight := by
  have ht : Continuous time := by unfold time; fun_prop
  have hs : Continuous spatial := by unfold spatial; fun_prop
  have hm : Continuous minkowskiSquare := (ht.pow 2).sub (hs.norm.pow 2)
  unfold weight
  apply Measurable.ite
  · exact (isClosed_le hs.norm ht).measurableSet
  · exact (hm.measurable.pow_const 2).div
      ((measurable_const.add hm.measurable).log.pow_const 2)
  · exact measurable_const

theorem mu_open_pos {U : Set Spacetime} (hU : IsOpen U) {p : Spacetime}
    (hp : p ∈ U) (hc : p ∈ coneInterior) : 0 < mu U := by
  apply pos_iff_ne_zero.mpr
  intro hz
  have hz' := (withDensity_apply_eq_zero weight_measurable.ennreal_ofReal).mp hz
  have hsub : U ∩ coneInterior ⊆ {x | ENNReal.ofReal (weight x) ≠ 0} ∩ U := by
    intro x hx
    exact ⟨ne_of_gt (ENNReal.ofReal_pos.mpr (weight_pos hx.2)), hx.1⟩
  exact (ne_of_gt ((hU.inter coneInterior_open).measure_pos volume ⟨p, hp, hc⟩))
    (measure_mono_null hsub hz')

/-- A continuous function which is nonzero at interior-cone momenta is nonzero in `L²`. -/
theorem not_ae_zero_of_continuous {k : ℕ} {g : (Fin k → Spacetime) → ℂ}
    (hg : Continuous g) {p : Fin k → Spacetime} (hp : ∀ j, p j ∈ coneInterior)
    (hgp : g p ≠ 0) : ¬ g =ᵐ[Measure.pi fun _ : Fin k => mu] 0 := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  intro hz
  have hU : IsOpen {q | g q ≠ 0} := hg.isOpen_support
  obtain ⟨s, hs, hsub⟩ := isOpen_pi_iff'.mp hU p hgp
  have hpos : 0 < (Measure.pi fun _ : Fin k => mu) (Set.pi Set.univ s) := by
    rw [Measure.pi_pi]
    rw [CanonicallyOrderedAdd.prod_pos]
    exact fun j _ => mu_open_pos (hs j).1 (hs j).2 (hp j)
  exact (ne_of_gt hpos) (measure_mono_null hsub hz)

def coordinateInterval (i : Fin 4) : Set ℝ :=
  if i = timeAxis then Set.Ioo 4 5 else Set.Ioo (-1) 1

def twistCoordinate (i : Fin 4) (x : ℝ) : ℂ :=
  if i = timeAxis then -(x : ℂ) else Complex.I * (x : ℂ)

theorem twistCoordinate_injective (i : Fin 4) : Injective (twistCoordinate i) := by
  intro x y hxy
  by_cases hi : i = timeAxis
  · simp only [twistCoordinate, hi, ↓reduceIte] at hxy
    exact Complex.ofReal_injective (neg_injective hxy)
  · simp only [twistCoordinate, hi, ↓reduceIte] at hxy
    exact Complex.ofReal_injective (mul_left_cancel₀ Complex.I_ne_zero hxy)

theorem coordinateInterval_infinite (i : Fin 4) : (coordinateInterval i).Infinite := by
  unfold coordinateInterval
  split_ifs <;> exact Set.Ioo_infinite (by norm_num)

theorem box_in_cone (p : Spacetime) (hp : ∀ i, p i ∈ coordinateInterval i) :
    p ∈ coneInterior := by
  have ht : 4 < time p := by simpa [coordinateInterval, time] using (hp timeAxis).1
  have h0 : -1 < p 0 ∧ p 0 < 1 := by simpa [coordinateInterval, timeAxis] using hp 0
  have h1 : -1 < p 1 ∧ p 1 < 1 := by simpa [coordinateInterval, timeAxis] using hp 1
  have h2 : -1 < p 2 ∧ p 2 < 1 := by simpa [coordinateInterval, timeAxis] using hp 2
  have hs := EuclideanSpace.real_norm_sq_eq (spatial p)
  simp only [Fin.sum_univ_three, spatial, WithLp.ofLp_toLp] at hs
  change ‖spatial p‖ ^ 2 = (p 0) ^ 2 + (p 1) ^ 2 + (p 2) ^ 2 at hs
  have hsq0 : (p 0) ^ 2 < 1 := by
    nlinarith [mul_pos (sub_pos.mpr h0.2) (by linarith : 0 < 1 + p 0)]
  have hsq1 : (p 1) ^ 2 < 1 := by
    nlinarith [mul_pos (sub_pos.mpr h1.2) (by linarith : 0 < 1 + p 1)]
  have hsq2 : (p 2) ^ 2 < 1 := by
    nlinarith [mul_pos (sub_pos.mpr h2.2) (by linarith : 0 < 1 + p 2)]
  change ‖spatial p‖ < time p
  nlinarith [norm_nonneg (spatial p)]

/-- A nonzero complex polynomial cannot vanish throughout the real open forward cone. -/
theorem polynomial_nonzero_on_cone {k : ℕ} (P : MvPolynomial (Fin k × Fin 4) ℂ)
    (hP : P ≠ 0) : ∃ p : Fin k → Spacetime,
      (∀ j, p j ∈ coneInterior) ∧ MvPolynomial.eval (momentumCoords p) P ≠ 0 := by
  by_contra hn
  push Not at hn
  apply hP
  apply MvPolynomial.funext_set
    (fun ji : Fin k × Fin 4 => twistCoordinate ji.2 '' coordinateInterval ji.2)
    (fun ji => (coordinateInterval_infinite ji.2).image (twistCoordinate_injective ji.2).injOn)
  intro z hz
  have hx : ∀ ji : Fin k × Fin 4, ∃ x : ℝ,
      x ∈ coordinateInterval ji.2 ∧ twistCoordinate ji.2 x = z ji := fun ji => hz ji trivial
  choose x hx hxz using hx
  let p : Fin k → Spacetime := fun j => WithLp.toLp 2 (fun i => x (j, i))
  have hp : ∀ j, p j ∈ coneInterior := fun j => box_in_cone (p j) (fun i => hx (j, i))
  have heq : momentumCoords p = z := by
    funext ji
    exact hxz ji
  rw [← heq, hn p hp, map_zero]

open scoped FourierTransform

/-- Relate the project's Fourier convention to Mathlib's Fourier transform. -/
theorem fourierE_eq_fourier (f : TestFunction) (p : Spacetime) :
    fourierE f p = (𝓕 f) ((-(2 * Real.pi)⁻¹ : ℝ) • p) := by
  rw [fourierE, SchwartzMap.fourier_coe, Real.fourier_eq']
  congr 1
  funext x
  rw [real_inner_smul_right, smul_eq_mul, mul_comm]
  congr 2
  push_cast
  field_simp

theorem fourierE_continuous (f : TestFunction) : Continuous (fourierE f) := by
  change Continuous (fun p => fourierE f p)
  simp_rw [fourierE_eq_fourier]
  exact (𝓕 f).continuous.comp
    (show Continuous (fun p : Spacetime => (-(2 * Real.pi)⁻¹ : ℝ) • p) by fun_prop)

/-- Fourier inversion of a smooth bump supplies any one required nonzero Fourier value. -/
theorem exists_test_fourier_ne_zero (p : Spacetime) : ∃ f : TestFunction, fourierE f p ≠ 0 := by
  let q : Spacetime := (-(2 * Real.pi)⁻¹ : ℝ) • p
  let b : ContDiffBump q := default
  let g : TestFunction :=
    (b.hasCompactSupport.comp_left (g := fun x : ℝ => (x : ℂ)) (by simp)).toSchwartzMap
      (Complex.ofRealCLM.contDiff.comp b.contDiff)
  refine ⟨𝓕⁻ g, ?_⟩
  rw [fourierE_eq_fourier, FourierTransform.fourier_fourierInv_eq]
  change (b q : ℂ) ≠ 0
  have hb : b q = 1 := b.one_of_mem_closedBall (Metric.mem_closedBall_self b.rIn_pos.le)
  simp [hb]

theorem momentumCoords_continuous (k : ℕ) :
    Continuous (@momentumCoords k) := by
  apply continuous_pi
  intro ji
  unfold momentumCoords
  split_ifs <;> fun_prop

theorem amplitude_single_continuous (A : Mon →₀ ℂ) (f : TestFunction) (k : ℕ) :
    Continuous (openAmpW [(A, f)] k) := by
  change Continuous (fun p => openAmpW [(A, f)] k p)
  simp_rw [amplitude_polynomial]
  apply Continuous.mul
  · apply (fourierE_continuous f).comp
    unfold totalMom
    fun_prop
  · exact (MvPolynomial.continuous_eval (sectorPolynomial A k)).comp (momentumCoords_continuous k)

theorem exists_amplitude_ne_zero (A : Mon →₀ ℂ) (hA : A ≠ 0) :
    ∃ (f : TestFunction) (k : ℕ),
      ¬ openAmpW [(A, f)] k =ᵐ[Measure.pi fun _ : Fin k => mu] 0 := by
  obtain ⟨k, hk⟩ := sectorPolynomial_ne_zero A hA
  obtain ⟨p, hp, hP⟩ := polynomial_nonzero_on_cone (sectorPolynomial A k) hk
  obtain ⟨f, hf⟩ := exists_test_fourier_ne_zero (totalMom p)
  refine ⟨f, k, not_ae_zero_of_continuous (amplitude_single_continuous A f k) hp ?_⟩
  rw [amplitude_polynomial]
  exact mul_ne_zero hf hP

end PsiFaithful

theorem Psi_faithful' (A : Mon →₀ ℂ) (hA : A ≠ 0) : ∃ f : TestFunction, Psi [(A, f)] ≠ 0 := by
  obtain ⟨f, k, hf⟩ := PsiFaithful.exists_amplitude_ne_zero A hA
  exact ⟨f, PsiFaithful.Psi_ne_zero_of_amplitude [(A, f)] k hf⟩

end YangMills.FreeField.Consolidated.Theory_PsiFaithful

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 600 lines] **Faithfulness.** Let `A ≠ 0` and let `k` be the number of legs of some
monomial in its support. The amplitude `openAmpW [(A, f)] k p` is
`fourierE f (∑ p_j) * ∑_{m ∈ supp A, card m = k} A m * ∑_{bijections b} ∏_j Bmono (α_{b j}) (p j)`
(only open matchings pairing all legs with external slots contribute, and monomials with other
numbers of legs do not contribute to sector `k`). The polynomial factor is a non-zero polynomial
(symmetrised monomials of distinct multisets are linearly independent), hence non-zero on a set of
positive measure in the open cone, where `weight > 0`; choose `f` Gaussian, so that `fourierE f`
has no zeros. Depends on `Psi_apply`. -/
theorem Psi_faithful (A : Mon →₀ ℂ) (hA : A ≠ 0) : ∃ f : TestFunction, Psi [(A, f)] ≠ 0 := by
  exact Consolidated.Theory_PsiFaithful.Psi_faithful' A hA

end YangMills.FreeField
