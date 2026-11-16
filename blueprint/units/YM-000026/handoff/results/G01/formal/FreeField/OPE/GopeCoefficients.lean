import FreeField.OPE.Base

import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! Proofs consolidated from `FreeField/Work/gope_coefficients.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_GopeCoefficients
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

namespace CoefficientProof

variable {I : Type} {M η : ℝ}

/-- A constant uniform over all allowed positions, origins, and radii in `(0, 1]`. -/
private def Bound (M η : ℝ) (f : (I → Spacetime) → Spacetime → ℂ) (d : ℝ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ r : ℝ, 0 < r → r ≤ 1 → ∀ x o,
    Hierarchy.Within r M η x o → ‖f x o‖ ≤ C * r ^ d

private theorem bound_const (c : ℂ) : Bound (I := I) M η (fun _ _ => c) 0 := by
  exact ⟨‖c‖, norm_nonneg c, by intros; simp⟩

private theorem bound_zero (d : ℝ) : Bound (I := I) M η (fun _ _ => 0) d := by
  exact ⟨0, le_rfl, by intros; simp⟩

private theorem bound_add {f g : (I → Spacetime) → Spacetime → ℂ} {d : ℝ}
    (hf : Bound M η f d) (hg : Bound M η g d) : Bound M η (fun x o => f x o + g x o) d := by
  obtain ⟨C, hC, hf⟩ := hf
  obtain ⟨D, hD, hg⟩ := hg
  refine ⟨C + D, add_nonneg hC hD, ?_⟩
  intro r hr hr1 x o hW
  calc
    _ ≤ ‖f x o‖ + ‖g x o‖ := norm_add_le _ _
    _ ≤ C * r ^ d + D * r ^ d := add_le_add (hf r hr hr1 x o hW) (hg r hr hr1 x o hW)
    _ = _ := (add_mul _ _ _).symm

private theorem bound_mul {f g : (I → Spacetime) → Spacetime → ℂ} {d e : ℝ}
    (hf : Bound M η f d) (hg : Bound M η g e) :
    Bound M η (fun x o => f x o * g x o) (d + e) := by
  obtain ⟨C, hC, hf⟩ := hf
  obtain ⟨D, hD, hg⟩ := hg
  refine ⟨C * D, mul_nonneg hC hD, ?_⟩
  intro r hr hr1 x o hW
  rw [norm_mul, Real.rpow_add hr]
  calc
    _ ≤ (C * r ^ d) * (D * r ^ e) :=
      mul_le_mul (hf r hr hr1 x o hW) (hg r hr hr1 x o hW)
        (norm_nonneg _) (mul_nonneg hC (Real.rpow_nonneg hr.le _))
    _ = _ := by ring

private theorem bound_weaken {f : (I → Spacetime) → Spacetime → ℂ} {d e : ℝ}
    (hf : Bound M η f d) (h : e ≤ d) : Bound M η f e := by
  obtain ⟨C, hC, hf⟩ := hf
  refine ⟨C, hC, ?_⟩
  intro r hr hr1 x o hW
  exact (hf r hr hr1 x o hW).trans
    (mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_ge hr hr1 h) hC)

private theorem bound_sum {A : Type} (s : Finset A)
    (f : A → (I → Spacetime) → Spacetime → ℂ) (d : ℝ)
    (hf : ∀ a ∈ s, Bound M η (f a) d) : Bound M η (fun x o => ∑ a ∈ s, f a x o) d := by
  induction s using Finset.induction_on with
  | empty => simpa using bound_zero (I := I) (M := M) (η := η) d
  | @insert a s ha ih =>
    simpa [Finset.sum_insert, ha] using
      bound_add (hf a (by simp)) (ih (fun b hb => hf b (by simp [hb])))

private theorem bound_prod {A : Type} (s : Finset A)
    (f : A → (I → Spacetime) → Spacetime → ℂ) (d : A → ℝ)
    (hf : ∀ a ∈ s, Bound M η (f a) (d a)) :
    Bound M η (fun x o => ∏ a ∈ s, f a x o) (∑ a ∈ s, d a) := by
  induction s using Finset.induction_on with
  | empty => simpa using bound_const (I := I) (M := M) (η := η) 1
  | @insert a s ha ih =>
    simpa [Finset.prod_insert, Finset.sum_insert, ha] using
      bound_mul (hf a (by simp)) (ih (fun b hb => hf b (by simp [hb])))

private theorem bound_monoPow (hM : 0 ≤ M) (v : I) (β : Idx) :
    Bound M η (fun x o => monoPow (x v - o) β) (idxOrder β) := by
  refine ⟨M ^ idxOrder β, pow_nonneg hM _, ?_⟩
  intro r hr _ x o hW
  simp only [monoPow, norm_prod, norm_pow, Complex.norm_real, Real.norm_eq_abs]
  calc
    _ ≤ ∏ k : Fin 4, (M * r) ^ β k := by
      apply Finset.prod_le_prod
      · intro k _; positivity
      · intro k _
        apply pow_le_pow_left₀ (abs_nonneg _)
        exact (PiLp.norm_apply_le (x v - o) k).trans (hW.1 v)
    _ = (M * r) ^ idxOrder β := by simp only [idxOrder, Finset.prod_pow_eq_pow_sum]
    _ = M ^ idxOrder β * r ^ (idxOrder β : ℝ) := by rw [Real.rpow_natCast, mul_pow]

private theorem bound_line {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hη : 0 < η) (a b : Idx) (v w : I) (hvw : v ≠ w) :
    Bound M η (fun x _ => K a b (x w - x v)) (-(8 + idxOrder a + idxOrder b : ℕ) : ℝ) := by
  obtain ⟨C, hC⟩ := hK.bound a b
  let n := 8 + idxOrder a + idxOrder b
  refine ⟨max C 0 / η ^ n, div_nonneg (le_max_right _ _) (pow_nonneg hη.le _), ?_⟩
  intro r hr _ x o hW
  have hdist := hW.2 w v (Ne.symm hvw)
  have hpos : 0 < ‖x w - x v‖ := lt_of_lt_of_le (mul_pos hη hr) hdist
  calc
    _ ≤ C / ‖x w - x v‖ ^ n := hC _ (norm_pos_iff.mp hpos)
    _ ≤ max C 0 / ‖x w - x v‖ ^ n :=
      div_le_div_of_nonneg_right (le_max_left _ _) (pow_nonneg (norm_nonneg _) _)
    _ ≤ max C 0 / (η * r) ^ n :=
      div_le_div_of_nonneg_left (le_max_right _ _) (pow_pos (mul_pos hη hr) _)
        (pow_le_pow_left₀ (mul_nonneg hη.le hr.le) hdist _)
    _ = _ := by
      rw [Real.rpow_neg hr.le, Real.rpow_natCast, mul_pow]
      simp [div_eq_mul_inv, mul_assoc, mul_comm, n]

variable [Fintype I]

private def legWeight {m : I → Mon} (l : PLeg m) : ℝ := 4 + idxOrder l.2.1

private def lineWeight {m : I → Mon} (σ : PMatching m) (l : PLeg m) : ℝ :=
  if Fintype.equivFin I l.1 < Fintype.equivFin I (σ.1 l).1 then
    legWeight l + legWeight (σ.1 l) else 0

private theorem bound_internal {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hη : 0 < η) {m : I → Mon} (σ : PMatching m) :
    Bound M η (fun x _ => internalProd K σ x) (- ∑ l : PLeg m, lineWeight σ l) := by
  unfold internalProd
  rw [← Finset.sum_neg_distrib]
  apply bound_prod
  intro l _
  unfold lineWeight
  by_cases hl : Fintype.equivFin I l.1 < Fintype.equivFin I (σ.1 l).1
  · simp only [hl, if_true]
    have hn : l.1 ≠ (σ.1 l).1 := fun h => (ne_of_lt hl) (congrArg (Fintype.equivFin I) h)
    convert bound_line hK hη l.2.1 (σ.1 l).2.1 l.1 (σ.1 l).1 hn using 1
    simp [legWeight, Nat.cast_add]
    ring
  · simpa [hl] using bound_const (I := I) (M := M) (η := η) 1

private theorem sum_legWeight (m : I → Mon) :
    (∑ l : PLeg m, legWeight l) = ∑ i, (grade (m i) : ℝ) := by
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro i _
  simp only [grade, Nat.cast_multiset_sum, Multiset.map_map, Function.comp_def, Nat.cast_add,
    Nat.cast_ofNat]
  exact congrArg Multiset.sum (Multiset.map_univ (m i) (fun a => (4 : ℝ) + idxOrder a))

/-- Each matched leg contributes to exactly one internal line; fixed legs remain unmatched. -/
private theorem weight_partition {m : I → Mon} (σ : PMatching m) :
    (∑ l : PLeg m, lineWeight σ l) + (∑ e : Unmatched σ, legWeight e.1) =
      ∑ i, (grade (m i) : ℝ) := by
  have hb : (∑ l : PLeg m,
      if Fintype.equivFin I l.1 < Fintype.equivFin I (σ.1 l).1 then legWeight (σ.1 l) else 0) =
      ∑ l : PLeg m,
      if Fintype.equivFin I (σ.1 l).1 < Fintype.equivFin I l.1 then legWeight l else 0 := by
    apply Fintype.sum_equiv σ.1
    intro l
    rw [σ.2.1]
  have hs : (∑ l : PLeg m, lineWeight σ l) =
      ∑ l : PLeg m, if σ.1 l = l then 0 else legWeight l := by
    simp only [lineWeight, ite_add_zero, Finset.sum_add_distrib]
    rw [hb, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro l _
    by_cases hfix : σ.1 l = l
    · simp [hfix]
    · have hn := (Fintype.equivFin I).injective.ne (σ.2.2 l hfix)
      rcases lt_or_gt_of_ne hn with h | h
      · simp [hfix, h, not_lt_of_gt h]
      · simp [hfix, h, not_lt_of_gt h]
  have hu : (∑ e : Unmatched σ, legWeight e.1) =
      ∑ l : PLeg m, if σ.1 l = l then legWeight l else 0 := by
    rw [← Finset.sum_filter]
    exact (Finset.sum_subtype _ (by simp) legWeight).symm
  rw [hs, hu, ← Finset.sum_add_distrib, ← sum_legWeight m]
  apply Finset.sum_congr rfl
  intro l _
  split_ifs <;> simp

/-- The channel grade is the unmatched grade plus the total Taylor order. -/
private theorem channel_weight {m : I → Mon} (σ : PMatching m)
    (β : Unmatched σ → Idx) (c : Mon)
    (hβ : (Finset.univ.val.map fun e : Unmatched σ => e.1.2.1 + β e) = c) :
    (grade c : ℝ) = (∑ e : Unmatched σ, legWeight e.1) +
      ∑ e : Unmatched σ, (idxOrder (β e) : ℝ) := by
  rw [← hβ]
  simp [grade, Multiset.map_map, legWeight, idxOrder,
    Finset.sum_add_distrib, add_assoc]


private theorem bound_term {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hM : 0 ≤ M) (hη : 0 < η) {m : I → Mon} (σ : PMatching m)
    (β : Unmatched σ → Idx) (c : Mon)
    (hβ : (Finset.univ.val.map fun e : Unmatched σ => e.1.2.1 + β e) = c) :
    Bound M η (fun x o => internalProd K σ x *
      ∏ e : Unmatched σ, monoPow (x e.1.1 - o) (β e) / (idxFact (β e) : ℂ))
      ((grade c : ℝ) - ∑ i, (grade (m i) : ℝ)) := by
  have ht : Bound M η (fun x o =>
      ∏ e : Unmatched σ, monoPow (x e.1.1 - o) (β e) / (idxFact (β e) : ℂ))
      (∑ e : Unmatched σ, (idxOrder (β e) : ℝ)) := by
    apply bound_prod
    intro e _
    simpa only [div_eq_mul_inv, add_zero] using
      bound_mul (bound_monoPow (η := η) hM e.1.1 (β e))
        (bound_const ((idxFact (β e) : ℂ)⁻¹))
  have hb := bound_mul (bound_internal (M := M) hK hη σ) ht
  have he : -(∑ l : PLeg m, lineWeight σ l) + (∑ e : Unmatched σ, (idxOrder (β e) : ℝ)) =
      (grade c : ℝ) - ∑ i, (grade (m i) : ℝ) := by
    have hp := weight_partition σ
    have hc := channel_weight σ β c hβ
    linarith
  rwa [he] at hb

private theorem bound_gcoefMono {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hM : 0 ≤ M) (hη : 0 < η) (m : I → Mon) (c : Mon) :
    Bound M η (gcoefMono K m c) ((grade c : ℝ) - ∑ i, (grade (m i) : ℝ)) := by
  unfold gcoefMono
  apply bound_sum
  intro σ _
  apply bound_sum
  intro β hβ
  exact bound_term hK hM hη σ β c (Finset.mem_filter.mp hβ).2

private theorem support_grade (a : Tag) (m : Mon) (hm : m ∈ (tagLabel a).support) :
    grade m ≤ a.1 := by
  have hh := Finsupp.mem_support_iff.mp hm
  change Finsupp.mapDomain (Subtype.val : GradeLE a.1 → Mon)
    ((Finsupp.linearEquivFunOnFinite ℂ ℂ (GradeLE a.1)).symm a.2) m ≠ 0 at hh
  obtain ⟨m', rfl⟩ := Finsupp.mem_range_of_mapDomain_ne_zero hh
  exact m'.2

private theorem bound_gcoef {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hM : 0 ≤ M) (hη : 0 < η) (a : I → Tag) (j : ℕ) (c : Channel j) :
    Bound M η (gcoef K I a j c) ((j : ℝ) - ∑ i, ((a i).1 : ℝ)) := by
  have hs : Bound M η (fun x o =>
      ∑ μ ∈ Fintype.piFinset (fun i : I => (tagLabel (a i)).support),
        (∏ i, tagLabel (a i) (μ i)) * gcoefMono K μ c.1 x o)
      ((j : ℝ) - ∑ i, ((a i).1 : ℝ)) := by
    apply bound_sum
    intro μ hμ
    have hb := bound_mul (bound_const (∏ i, tagLabel (a i) (μ i))) (bound_gcoefMono hK hM hη μ c.1)
    simp only [zero_add, c.2] at hb
    apply bound_weaken hb
    apply sub_le_sub_left
    apply Finset.sum_le_sum
    intro i _
    exact_mod_cast support_grade (a i) (μ i) (Fintype.mem_piFinset.mp hμ i)
  obtain ⟨C, hC, hs⟩ := hs
  refine ⟨C, hC, ?_⟩
  intro r hr hr1 x o hW
  unfold gcoef
  split_ifs
  · exact hs r hr hr1 x o hW
  · simp only [norm_zero]
    exact mul_nonneg hC (Real.rpow_nonneg hr.le _)

end CoefficientProof
variable {I J : Type}

theorem gope_coefficients' {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    (a : I → Tag) (M η ε : ℝ) :
    0 ≤ M → 0 < η → 0 < ε → ∀ (j : ℕ) (i : Channel j), ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o, Hierarchy.Within r M η x o →
        ‖gcoef K I a j i x o‖ ≤ r ^ ((j : ℝ) - ∑ i, ((a i).1 : ℝ) - ε) := by
  intro hM hη hε j i
  obtain ⟨C, hC, hb⟩ := CoefficientProof.bound_gcoef hK hM hη a j i
  have hlarge : ∀ᶠ r : ℝ in 𝓝[>] 0, C ≤ r ^ (-ε) :=
    (tendsto_rpow_neg_nhdsGT_zero (neg_neg_of_pos hε)).eventually (eventually_ge_atTop C)
  have hsmall : ∀ᶠ r : ℝ in 𝓝[>] 0, r ≤ 1 :=
    (eventually_le_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds
  filter_upwards [self_mem_nhdsWithin, hsmall, hlarge] with r hr hr1 hCr
  intro x o hW
  calc
    _ ≤ C * r ^ ((j : ℝ) - ∑ i, ((a i).1 : ℝ)) := hb r hr hr1 x o hW
    _ ≤ r ^ (-ε) * r ^ ((j : ℝ) - ∑ i, ((a i).1 : ℝ)) :=
      mul_le_mul_of_nonneg_right hCr (Real.rpow_nonneg (le_of_lt hr) _)
    _ = _ := by rw [← Real.rpow_add hr]; congr 1; ring

end YangMills.FreeField.Consolidated.OPE_GopeCoefficients

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [MEDIUM, 500 lines] **Coefficient bound.** For monomials of true total grade `w' ≤ weight a`:
an internal line between legs `α`, `α'` is at most `C (η r)^{-(8+|α|+|α'|)}` by `hK.bound` and
`Within`; the matched legs carry total grade `w' - g₀`, `g₀` the grade of the unmatched legs;
the Taylor monomials are at most `(M r)^{|β|}` with `g₀ + ∑|β_e| = j`. So each term is at most
`C r^{j - w'} ≤ C r^{j - weight a}` for `r < 1`, there are finitely many terms, and the constant
is absorbed by `r^{-ε}`. Uses only `hK.bound`. -/
theorem gope_coefficients {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    (a : I → Tag) (M η ε : ℝ) :
    0 ≤ M → 0 < η → 0 < ε → ∀ (j : ℕ) (i : Channel j), ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o, Hierarchy.Within r M η x o →
        ‖gcoef K I a j i x o‖ ≤ r ^ ((j : ℝ) - ∑ i, ((a i).1 : ℝ) - ε) := by
  exact Consolidated.OPE_GopeCoefficients.gope_coefficients' hK a M η ε

end YangMills.FreeField
