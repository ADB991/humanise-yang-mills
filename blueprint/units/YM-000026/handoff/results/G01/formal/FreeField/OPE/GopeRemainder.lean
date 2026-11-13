import FreeField.OPE.Base
import FreeField.OPE.GwickGroupedFactor
import FreeField.OPE.SplitCorrCollapse
import FreeField.OPE.SplitCorrFderiv

import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Data.Nat.Choose.Multinomial
import Mathlib.Algebra.MonoidAlgebra.Lift

/-! Proofs consolidated from `FreeField/Work/gope_remainder.lean`. -/

/-!
Proof of `gope_remainder`, including the finite multinomial regrouping identity
`RemainderProof.splitTaylor_eq_directionalJet`.

Proved here: separation, uniform kernel and split-correlation bounds, joint smoothness,
recursive directional jets, multinomial regrouping, the uniform one-variable Taylor estimate, grading estimates,
factorisation/collapse bookkeeping, multilinear extension, and absorption of constants.
The only skeleton lemmas used with unfinished source proofs are the three listed dependencies:
`gwickGrouped_factor`, `splitCorr_collapse`, and `splitCorr_fderiv`.
-/

set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_GopeRemainder
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

namespace RemainderProof

variable {I J U : Type}

/-- The positive separation radius forces the insertion map to be injective. -/
theorem within_injective {r M η : ℝ} {x : I → Spacetime} {o : Spacetime}
    (hr : 0 < r) (hη : 0 < η) (hW : Hierarchy.Within r M η x o) : Injective x := by
  intro i j hij
  by_contra hne
  have h := hW.2 i j hne
  rw [hij, sub_self, norm_zero] at h
  exact (not_le_of_gt (mul_pos hη hr)) h

/-- Clearance includes separation of all spectator points. -/
theorem clear_injective {c : ℝ} {y : J → Spacetime} {o : Spacetime}
    (hc : 0 < c) (hC : Hierarchy.Clear o y c) : Injective y := by
  intro i j hij
  by_contra hne
  have h := hC.2 i j hne
  rw [hij, sub_self, norm_zero] at h
  exact (not_le_of_gt hc) h

/-- Every split position in the cluster ball stays away from every spectator. -/
theorem cross_separation {r M c : ℝ} {o z : Spacetime} {y : J → Spacetime}
    (hsmall : M * r < c / 2) (hz : ‖z - o‖ ≤ M * r)
    (hC : Hierarchy.Clear o y c) (j : J) : c / 2 < ‖y j - z‖ := by
  have ht := norm_add_le (y j - z) (z - o)
  rw [sub_add_sub_cancel, norm_sub_rev (y j) o] at ht
  have ho := hC.1 j
  linarith

/-- Separation of the actual configuration removes the totalisation in `gcorr`. -/
theorem grouped_injective {r M η c : ℝ} {x : I → Spacetime} {o : Spacetime}
    {y : J → Spacetime} (hr : 0 < r) (hη : 0 < η) (hc : 0 < c)
    (hsmall : M * r < c / 2) (hW : Hierarchy.Within r M η x o)
    (hC : Hierarchy.Clear o y c) : Injective (Sum.elim x y) := by
  intro p q hpq
  cases p with
  | inl i =>
    cases q with
    | inl j => exact congrArg Sum.inl (within_injective hr hη hW hpq)
    | inr j =>
      have hs := cross_separation hsmall (hW.1 i) hC j
      simp only [Sum.elim_inl, Sum.elim_inr] at hpq
      rw [hpq, sub_self, norm_zero] at hs
      linarith
  | inr i =>
    cases q with
    | inl j =>
      have hs := cross_separation hsmall (hW.1 j) hC i
      simp only [Sum.elim_inl, Sum.elim_inr] at hpq
      rw [hpq, sub_self, norm_zero] at hs
      linarith
    | inr j => exact congrArg Sum.inr (clear_injective hc hC hpq)

/-- The collapsed configuration is separated even when an insertion equals its origin. -/
theorem collapsed_injective {c : ℝ} {o : Spacetime} {y : J → Spacetime}
    (hc : 0 < c) (hC : Hierarchy.Clear o y c) :
    Injective (Sum.elim (fun _ : Unit => o) y) := by
  intro p q hpq
  cases p with
  | inl i =>
    cases q with
    | inl j => exact congrArg Sum.inl (Subsingleton.elim _ _)
    | inr j =>
      have hs := hC.1 j
      simp only [Sum.elim_inl, Sum.elim_inr] at hpq
      rw [hpq, sub_self, norm_zero] at hs
      linarith
  | inr i =>
    cases q with
    | inl j =>
      have hs := hC.1 i
      simp only [Sum.elim_inl, Sum.elim_inr] at hpq
      rw [hpq, sub_self, norm_zero] at hs
      linarith
    | inr j => exact congrArg Sum.inr (clear_injective hc hC hpq)

/-- The complete interpolation segment stays in the same cluster ball. -/
theorem segment_mem_ball {r M : ℝ} {o z : Spacetime} {t : ℝ}
    (ht : t ∈ Set.Icc (0 : ℝ) 1) (hz : ‖z - o‖ ≤ M * r) :
    ‖(o + t • (z - o)) - o‖ ≤ M * r := by
  rw [add_sub_cancel_left, norm_smul, Real.norm_eq_abs, abs_of_nonneg ht.1]
  exact (mul_le_of_le_one_left (norm_nonneg _) ht.2).trans hz

/-- Kernel bounds are uniform on the entire complement of a ball, without compactness. -/
theorem kernel_bound_away {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α β : Idx) {d : ℝ} (hd : 0 < d) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ ξ : Spacetime, d ≤ ‖ξ‖ → ‖K α β ξ‖ ≤ C := by
  obtain ⟨C, hC⟩ := hK.bound α β
  refine ⟨max C 0 / d ^ (8 + idxOrder α + idxOrder β), by positivity, ?_⟩
  intro ξ hξ
  have hpos : 0 < ‖ξ‖ := hd.trans_le hξ
  calc
    _ ≤ C / ‖ξ‖ ^ (8 + idxOrder α + idxOrder β) := hC ξ (norm_pos_iff.mp hpos)
    _ ≤ max C 0 / ‖ξ‖ ^ (8 + idxOrder α + idxOrder β) :=
      div_le_div_of_nonneg_right (le_max_left _ _) (by positivity)
    _ ≤ _ := div_le_div_of_nonneg_left (le_max_right _ _) (by positivity)
      (pow_le_pow_left₀ hd.le hξ _)

/-- All split correlations, including those with any fixed raised indices, admit a uniform
bound when their external lines and spectator lines have length at least `d`. -/
theorem splitCorr_bound_away {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    [Fintype U] [Fintype J] (α : U → Idx) (mb : J → Mon) {d : ℝ} (hd : 0 < d) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ z : U → Spacetime, ∀ y : J → Spacetime,
      (∀ u j, d ≤ ‖y j - z u‖) → (∀ i j, i ≠ j → d ≤ ‖y i - y j‖) →
      ‖splitCorr K α z mb y‖ ≤ C := by
  choose C hC hbound using fun a b => kernel_bound_away hK a b hd
  let A : SMatching U mb → U → ℝ := fun τ u =>
    Sum.elim (fun _ => 1) (fun l : PLeg mb => C (α u) l.2.1) (τ.1 (Sum.inl u))
  let B : SMatching U mb → PLeg mb → ℝ := fun τ l =>
    Sum.elim (fun _ => 1) (fun l' : PLeg mb =>
      if Fintype.equivFin J l.1 < Fintype.equivFin J l'.1 then C l.2.1 l'.2.1 else 1)
      (τ.1 (Sum.inr l))
  have hA : ∀ τ u, 0 ≤ A τ u := by
    intro τ u
    dsimp [A]
    cases τ.1 (Sum.inl u) <;> simp [hC]
  have hB : ∀ τ l, 0 ≤ B τ l := by
    intro τ l
    dsimp [B]
    cases τ.1 (Sum.inr l) <;> simp only [Sum.elim_inl, Sum.elim_inr]
    · norm_num
    · split_ifs <;> first | exact hC _ _ | norm_num
  refine ⟨∑ τ, (∏ u, A τ u) * ∏ l, B τ l,
    Finset.sum_nonneg (fun τ _ => mul_nonneg
      (Finset.prod_nonneg fun u _ => hA τ u) (Finset.prod_nonneg fun l _ => hB τ l)), ?_⟩
  intro z y hz hy
  unfold splitCorr
  refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun τ _ => ?_)
  rw [norm_mul, norm_prod, norm_prod]
  apply mul_le_mul
  · apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
    intro u _
    obtain ⟨l, hl⟩ := τ.2.2.1 u
    simp only [A, hl, Sum.elim_inr]
    exact hbound _ _ _ (hz u l.1)
  · apply Finset.prod_le_prod (fun _ _ => norm_nonneg _)
    intro l _
    dsimp [B]
    cases he : τ.1 (Sum.inr l) with
    | inl u => simp
    | inr l' =>
      simp only [Sum.elim_inr]
      split_ifs with h
      · exact hbound _ _ _ (hy l'.1 l.1 ((τ.2.2.2 l).2 l' he))
      · simp
  · exact Finset.prod_nonneg fun _ _ => norm_nonneg _
  · exact Finset.prod_nonneg fun u _ => hA τ u

/- Elementary power estimates below follow the coefficient-bound proof, with spectator
clearance included in the domain of uniformity. -/
section Bounds
variable {M η c : ℝ}

/-- A constant uniform over all allowed positions, origins, and radii in `(0, 1]`. -/
def Bound (M η c : ℝ) (f : (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ) (d : ℝ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ r : ℝ, 0 < r → r ≤ 1 → M * r < c / 2 → ∀ x o y,
    Hierarchy.Within r M η x o → Hierarchy.Clear o y c → ‖f x o y‖ ≤ C * r ^ d

theorem bound_const (k : ℂ) : Bound (I := I) (J := J) M η c (fun _ _ _ => k) 0 := by
  exact ⟨‖k‖, norm_nonneg k, by intros; simp⟩

theorem bound_zero (d : ℝ) : Bound (I := I) (J := J) M η c (fun _ _ _ => 0) d := by
  exact ⟨0, le_rfl, by intros; simp⟩

theorem bound_add {f g : (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ} {d : ℝ}
    (hf : Bound M η c f d) (hg : Bound M η c g d) : Bound M η c (fun x o y => f x o y + g x o y) d := by
  obtain ⟨C, hC, hf⟩ := hf
  obtain ⟨D, hD, hg⟩ := hg
  refine ⟨C + D, add_nonneg hC hD, ?_⟩
  intro r hr hr1 hsmall x o y hW hClear
  calc
    _ ≤ ‖f x o y‖ + ‖g x o y‖ := norm_add_le _ _
    _ ≤ C * r ^ d + D * r ^ d := add_le_add (hf r hr hr1 hsmall x o y hW hClear) (hg r hr hr1 hsmall x o y hW hClear)
    _ = _ := (add_mul _ _ _).symm

theorem bound_mul {f g : (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ} {d e : ℝ}
    (hf : Bound M η c f d) (hg : Bound M η c g e) :
    Bound M η c (fun x o y => f x o y * g x o y) (d + e) := by
  obtain ⟨C, hC, hf⟩ := hf
  obtain ⟨D, hD, hg⟩ := hg
  refine ⟨C * D, mul_nonneg hC hD, ?_⟩
  intro r hr hr1 hsmall x o y hW hClear
  rw [norm_mul, Real.rpow_add hr]
  calc
    _ ≤ (C * r ^ d) * (D * r ^ e) :=
      mul_le_mul (hf r hr hr1 hsmall x o y hW hClear) (hg r hr hr1 hsmall x o y hW hClear)
        (norm_nonneg _) (mul_nonneg hC (Real.rpow_nonneg hr.le _))
    _ = _ := by ring

theorem bound_weaken {f : (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ} {d e : ℝ}
    (hf : Bound M η c f d) (h : e ≤ d) : Bound M η c f e := by
  obtain ⟨C, hC, hf⟩ := hf
  refine ⟨C, hC, ?_⟩
  intro r hr hr1 hsmall x o y hW hClear
  exact (hf r hr hr1 hsmall x o y hW hClear).trans
    (mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_ge hr hr1 h) hC)

theorem bound_sum {A : Type} (s : Finset A)
    (f : A → (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ) (d : ℝ)
    (hf : ∀ a ∈ s, Bound M η c (f a) d) : Bound M η c (fun x o y => ∑ a ∈ s, f a x o y) d := by
  induction s using Finset.induction_on with
  | empty => simpa using bound_zero (I := I) (M := M) (η := η) (c := c) (J := J) d
  | @insert a s ha ih =>
    simpa [Finset.sum_insert, ha] using
      bound_add (hf a (by simp)) (ih (fun b hb => hf b (by simp [hb])))

theorem bound_prod {A : Type} (s : Finset A)
    (f : A → (I → Spacetime) → Spacetime → (J → Spacetime) → ℂ) (d : A → ℝ)
    (hf : ∀ a ∈ s, Bound M η c (f a) (d a)) :
    Bound M η c (fun x o y => ∏ a ∈ s, f a x o y) (∑ a ∈ s, d a) := by
  induction s using Finset.induction_on with
  | empty => simpa using bound_const (I := I) (M := M) (η := η) (c := c) (J := J) 1
  | @insert a s ha ih =>
    simpa [Finset.prod_insert, Finset.sum_insert, ha] using
      bound_mul (hf a (by simp)) (ih (fun b hb => hf b (by simp [hb])))

theorem bound_line {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hη : 0 < η) (a b : Idx) (v w : I) (hvw : v ≠ w) :
    Bound (J := J) M η c (fun x _ _ => K a b (x w - x v)) (-(8 + idxOrder a + idxOrder b : ℕ) : ℝ) := by
  obtain ⟨C, hC⟩ := hK.bound a b
  let n := 8 + idxOrder a + idxOrder b
  refine ⟨max C 0 / η ^ n, div_nonneg (le_max_right _ _) (pow_nonneg hη.le _), ?_⟩
  intro r hr _ _ x o y hW _
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

def legWeight {m : I → Mon} (l : PLeg m) : ℝ := 4 + idxOrder l.2.1

def lineWeight {m : I → Mon} (σ : PMatching m) (l : PLeg m) : ℝ :=
  if Fintype.equivFin I l.1 < Fintype.equivFin I (σ.1 l).1 then
    legWeight l + legWeight (σ.1 l) else 0

theorem bound_internal {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (hη : 0 < η) {m : I → Mon} (σ : PMatching m) :
    Bound (J := J) M η c (fun x _ _ => internalProd K σ x) (- ∑ l : PLeg m, lineWeight σ l) := by
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
  · simpa [hl] using bound_const (I := I) (M := M) (η := η) (c := c) (J := J) 1

theorem sum_legWeight (m : I → Mon) :
    (∑ l : PLeg m, legWeight l) = ∑ i, (grade (m i) : ℝ) := by
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro i _
  simp only [grade, Nat.cast_multiset_sum, Multiset.map_map, Function.comp_def, Nat.cast_add,
    Nat.cast_ofNat]
  exact congrArg Multiset.sum (Multiset.map_univ (m i) (fun a => (4 : ℝ) + idxOrder a))

/-- Each matched leg contributes to exactly one internal line; fixed legs remain unmatched. -/
theorem weight_partition {m : I → Mon} (σ : PMatching m) :
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


end Bounds

/-- The natural grade of a finite indexed collection of legs. -/
def splitGrade [Fintype U] (α : U → Idx) : ℕ := grade (Finset.univ.val.map α)

theorem splitGrade_eq [Fintype U] (α : U → Idx) :
    splitGrade α = ∑ u, (4 + idxOrder (α u)) := by
  simp [splitGrade, grade, Multiset.map_map]

/-- Raising the leg indices adds exactly their total Taylor order. -/
theorem splitGrade_add [Fintype U] (α β : U → Idx) :
    splitGrade (fun u => α u + β u) = splitGrade α + ∑ u, idxOrder (β u) := by
  simp [splitGrade_eq, idxOrder, Finset.sum_add_distrib, add_assoc]

/-- The channel-indexed Taylor polynomial. The indexing is the one used by `gcoefMono`. -/
def splitTaylor (K : Idx → Idx → Spacetime → ℂ) [Fintype U] [Fintype J]
    (α : U → Idx) (D : ℕ) (z : U → Spacetime) (o : Spacetime)
    (mb : J → Mon) (y : J → Spacetime) : ℂ :=
  ∑ j : Fin (D + 1), ∑ ch : Channel j.val,
    ∑ β ∈ (Fintype.piFinset fun _ : U => idxBox (grade ch.1)).filter
        (fun β => (Finset.univ.val.map fun u : U => α u + β u) = ch.1),
      (∏ u : U, monoPow (z u - o) (β u) / (idxFact (β u) : ℂ)) *
        splitCorr K (fun u => α u + β u) (fun _ => o) mb y

/-- There are no Taylor channels below the original unmatched grade. -/
theorem splitTaylor_eq_zero {K : Idx → Idx → Spacetime → ℂ} [Fintype U] [Fintype J]
    (α : U → Idx) (D : ℕ) (z : U → Spacetime) (o : Spacetime)
    (mb : J → Mon) (y : J → Spacetime) (hD : D < splitGrade α) :
    splitTaylor K α D z o mb y = 0 := by
  unfold splitTaylor
  apply Finset.sum_eq_zero
  intro j _
  apply Finset.sum_eq_zero
  intro ch _
  apply Finset.sum_eq_zero
  intro β hβ
  have h := congrArg grade (Finset.mem_filter.mp hβ).2
  change splitGrade (fun u => α u + β u) = grade ch.1 at h
  rw [splitGrade_add, ch.2] at h
  have := j.isLt
  omega

section DirectionalJets
variable [Fintype U] [Fintype J]

/-- Joint smoothness in all split positions; spectator self-lines are constant. -/
theorem splitCorr_contDiffAt {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (z : U → Spacetime) (mb : J → Mon) (y : J → Spacetime)
    (hz : ∀ u j, y j ≠ z u) :
    ContDiffAt ℝ ∞ (fun z => splitCorr K α z mb y) z := by
  unfold splitCorr
  apply ContDiffAt.sum
  intro τ _
  apply ContDiffAt.mul
  · apply contDiffAt_prod
    intro u _
    obtain ⟨l, hl⟩ := τ.2.2.1 u
    simp only [hl, Sum.elim_inr]
    exact ((hK.smooth (α u) l.2.1).contDiffAt
      (isOpen_compl_singleton.mem_nhds (sub_ne_zero.mpr (hz u l.1)))).comp z
      (contDiffAt_const.sub (contDiffAt_apply ℝ Spacetime u z))
  · exact contDiffAt_const

/-- Lift the supplied single-leg jet identity to the whole space of split positions. -/
theorem splitCorr_fderiv_single {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (z : U → Spacetime) (mb : J → Mon) (y : J → Spacetime)
    (hz : ∀ u j, y j ≠ z u) (u : U) (i : Fin 4) :
    fderiv ℝ (fun z => splitCorr K α z mb y) z
        (Pi.single u (EuclideanSpace.single i (1 : ℝ))) =
      splitCorr K (Function.update α u (α u + Pi.single i 1)) z mb y := by
  have hd := (splitCorr_contDiffAt hK α z mb y hz).differentiableAt (by simp)
  have hu : Function.update z u (z u) = z := Function.update_eq_self _ _
  have hc := (hu.symm ▸ hd.hasFDerivAt).comp (z u) (hasFDerivAt_update z (z u))
  have he := congrArg (fun f : Spacetime →L[ℝ] ℂ =>
    f (EuclideanSpace.single i (1 : ℝ))) hc.fderiv
  have hsingle : (ContinuousLinearMap.pi (Pi.single u (ContinuousLinearMap.id ℝ Spacetime)))
      (EuclideanSpace.single i (1 : ℝ)) =
        (Pi.single u (EuclideanSpace.single i (1 : ℝ)) : U → Spacetime) := by
    ext v
    by_cases hv : v = u <;> simp [hv]
  simp only [Function.comp_def, ContinuousLinearMap.comp_apply, hsingle] at he
  rw [hu] at he
  rw [← he]
  exact splitCorr_fderiv hK α z mb y u i (hz u)

/-- Coordinate expansion of a displacement in the finite product of Euclidean spaces. -/
theorem displacement_eq_sum (d : U → Spacetime) :
    d = ∑ u : U, ∑ i : Fin 4,
      (d u i) • Pi.single u (EuclideanSpace.single i (1 : ℝ)) := by
  ext u i
  simp [Finset.sum_apply, Pi.single_apply]

/-- The path derivative is the finite sum of coordinate jets. -/
theorem splitCorr_fderiv_direction {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (z d : U → Spacetime) (mb : J → Mon) (y : J → Spacetime)
    (hz : ∀ u j, y j ≠ z u) :
    fderiv ℝ (fun z => splitCorr K α z mb y) z d =
      ∑ u : U, ∑ i : Fin 4, (d u i : ℂ) *
        splitCorr K (Function.update α u (α u + Pi.single i 1)) z mb y := by
  conv_lhs => arg 2; rw [displacement_eq_sum d]
  simp only [map_sum, map_smul, splitCorr_fderiv_single hK α z mb y hz,
    Complex.real_smul]

/-- Directional jets as a recursion of index-raising operators. -/
def directionalJet (K : Idx → Idx → Spacetime → ℂ) (mb : J → Mon)
    (d : U → Spacetime) (y : J → Spacetime) : ℕ → (U → Idx) → (U → Spacetime) → ℂ
  | 0, α, z => splitCorr K α z mb y
  | n + 1, α, z => ∑ u : U, ∑ i : Fin 4, (d u i : ℂ) *
      directionalJet K mb d y n (Function.update α u (α u + Pi.single i 1)) z

/-- The straight path from the collapsed origin to the split positions. -/
def splitPath (o : Spacetime) (d : U → Spacetime) (t : ℝ) : U → Spacetime :=
  fun u => o + t • d u

theorem splitPath_hasDerivAt (o : Spacetime) (d : U → Spacetime) (t : ℝ) :
    HasDerivAt (splitPath o d) d t := by
  have h : splitPath o d = fun t : ℝ => (fun _ : U => o) + t • d := rfl
  rw [h]
  simpa using ((hasDerivAt_id t).smul_const d).const_add (fun _ : U => o)

theorem splitCorr_path_contDiffAt {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (mb : J → Mon) (o : Spacetime) (d : U → Spacetime)
    (y : J → Spacetime) (t : ℝ) (hz : ∀ u j, y j ≠ splitPath o d t u) :
    ContDiffAt ℝ ∞ (fun s => splitCorr K α (splitPath o d s) mb y) t := by
  apply (splitCorr_contDiffAt hK α _ mb y hz).comp t
  change ContDiffAt ℝ ∞ (fun s : ℝ => (fun _ : U => o) + s • d) t
  fun_prop

theorem directionalJet_hasDerivAt {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (mb : J → Mon) (o : Spacetime) (d : U → Spacetime) (y : J → Spacetime)
    (n : ℕ) (α : U → Idx) (t : ℝ) (hz : ∀ u j, y j ≠ splitPath o d t u) :
    HasDerivAt (fun s => directionalJet K mb d y n α (splitPath o d s))
      (directionalJet K mb d y (n + 1) α (splitPath o d t)) t := by
  induction n generalizing α with
  | zero =>
    have hd := (splitCorr_contDiffAt hK α _ mb y hz).differentiableAt (by simp)
    have hh := hd.hasFDerivAt.comp_hasDerivAt t (splitPath_hasDerivAt o d t)
    convert hh using 1 <;> try rfl
    exact (splitCorr_fderiv_direction hK α _ d mb y hz).symm
  | succ n ih =>
    change HasDerivAt (fun s => ∑ u : U, ∑ i : Fin 4, _ * _)
      (∑ u : U, ∑ i : Fin 4, _ * _) t
    apply HasDerivAt.fun_sum
    intro u _
    apply HasDerivAt.fun_sum
    intro i _
    exact (ih (Function.update α u (α u + Pi.single i 1))).const_mul (d u i : ℂ)

/-- Iterating the path derivative within `[0,1]` gives the recursive directional jets. -/
theorem iteratedDerivWithin_splitCorr {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (mb : J → Mon) (o : Spacetime) (d : U → Spacetime)
    (y : J → Spacetime) (hz : ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u j,
      y j ≠ splitPath o d t u) (n : ℕ) :
    ∀ t ∈ Set.Icc (0 : ℝ) 1,
      iteratedDerivWithin n (fun s => splitCorr K α (splitPath o d s) mb y)
        (Set.Icc (0 : ℝ) 1) t = directionalJet K mb d y n α (splitPath o d t) := by
  induction n with
  | zero => intro t ht; rfl
  | succ n ih =>
    intro t ht
    rw [iteratedDerivWithin_succ]
    rw [derivWithin_congr (fun s hs => ih s hs) (ih t ht)]
    exact (directionalJet_hasDerivAt hK mb o d y n α t (hz t ht)).hasDerivWithinAt.derivWithin
      ((uniqueDiffOn_Icc (by norm_num : (0 : ℝ) < 1)) t ht)

/-- The `n`th directional jet is uniformly of order `r^n` when each displacement has size
at most `M*r`. Only fixed-index kernel bounds are used. -/
theorem directionalJet_bound {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    (α : U → Idx) (mb : J → Mon) {M δ : ℝ} (hM : 0 ≤ M) (hδ : 0 < δ) (n : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (r : ℝ), 0 < r → ∀ d z y,
      (∀ u, ‖d u‖ ≤ M * r) → (∀ u j, δ ≤ ‖y j - z u‖) →
      (∀ i j, i ≠ j → δ ≤ ‖y i - y j‖) →
      ‖directionalJet K mb d y n α z‖ ≤ C * r ^ n := by
  induction n generalizing α with
  | zero =>
    obtain ⟨C, hC, hb⟩ := splitCorr_bound_away hK α mb hδ
    exact ⟨C, hC, fun r hr d z y hd hz hy => by simpa [directionalJet] using hb z y hz hy⟩
  | succ n ih =>
    choose C hC hb using fun u i => ih (Function.update α u (α u + Pi.single i 1))
    refine ⟨∑ u : U, ∑ i : Fin 4, M * C u i, Finset.sum_nonneg (fun u _ =>
      Finset.sum_nonneg (fun i _ => mul_nonneg hM (hC u i))), ?_⟩
    intro r hr d z y hd hz hy
    unfold directionalJet
    refine (norm_sum_le _ _).trans ?_
    simp only [Finset.sum_mul]
    apply Finset.sum_le_sum
    intro u _
    refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun i _ => ?_)
    rw [norm_mul]
    have hdi : ‖(d u i : ℂ)‖ ≤ M * r := by
      simpa only [Complex.norm_real, Real.norm_eq_abs] using (PiLp.norm_apply_le (d u) i).trans (hd u)
    calc
      _ ≤ (M * r) * (C u i * r ^ n) := mul_le_mul hdi (hb u i r hr d z y hd hz hy)
        (norm_nonneg _) (mul_nonneg hM hr.le)
      _ = _ := by rw [pow_succ]; ring

/-- A Taylor estimate for the recursively defined directional polynomial. This is the analytic
part; conversion to the channel-indexed polynomial is a separate finite combinatorial identity. -/
theorem splitCorr_directional_taylor_bound {K : Idx → Idx → Spacetime → ℂ}
    (hK : KernelHyp K) (α : U → Idx) (mb : J → Mon)
    {M c : ℝ} (hM : 0 ≤ M) (hc : 0 < c) (n : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ r : ℝ, 0 < r → M * r < c / 2 →
      ∀ z o y, (∀ u, ‖z u - o‖ ≤ M * r) → Hierarchy.Clear o y c →
      ‖splitCorr K α z mb y -
        ∑ k ∈ Finset.range (n + 1), (k.factorial : ℝ)⁻¹ •
          directionalJet K mb (fun u => z u - o) y k α (fun _ => o)‖ ≤
        C * r ^ (n + 1) := by
  obtain ⟨C, hC, hb⟩ := directionalJet_bound hK α mb hM (half_pos hc) (n + 1)
  refine ⟨C / n.factorial, div_nonneg hC (Nat.cast_nonneg _), ?_⟩
  intro r hr hs z o y hz hClear
  let d : U → Spacetime := fun u => z u - o
  let f : ℝ → ℂ := fun s => splitCorr K α (splitPath o d s) mb y
  have hsep : ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u j,
      c / 2 < ‖y j - splitPath o d t u‖ := by
    intro t ht u j
    exact cross_separation hs (segment_mem_ball ht (hz u)) hClear j
  have hne : ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ u j,
      y j ≠ splitPath o d t u := by
    intro t ht u j heq
    have h := hsep t ht u j
    rw [heq, sub_self, norm_zero] at h
    linarith
  have hf : ContDiffOn ℝ (n + 1) f (Set.Icc (0 : ℝ) 1) := by
    intro t ht
    exact ((splitCorr_path_contDiffAt hK α mb o d y t (hne t ht)).of_le
      (by exact_mod_cast (WithTop.coe_le_coe.mpr (le_top : (n + 1 : ℕ∞) ≤ ⊤)))).contDiffWithinAt
  have hb' : ∀ t ∈ Set.Icc (0 : ℝ) 1,
      ‖iteratedDerivWithin (n + 1) f (Set.Icc (0 : ℝ) 1) t‖ ≤ C * r ^ (n + 1) := by
    intro t ht
    rw [iteratedDerivWithin_splitCorr hK α mb o d y hne (n + 1) t ht]
    exact hb r hr d (splitPath o d t) y hz (fun u j => (hsep t ht u j).le)
      (fun i j hij => (half_le_self hc.le).trans (hClear.2 i j hij))
  have ht := taylor_mean_remainder_bound (by norm_num : (0 : ℝ) ≤ 1) hf
    (by norm_num : (1 : ℝ) ∈ Set.Icc (0 : ℝ) 1) hb'
  have hpoly : taylorWithinEval f n (Set.Icc (0 : ℝ) 1) 0 1 =
      ∑ k ∈ Finset.range (n + 1), (k.factorial : ℝ)⁻¹ •
        directionalJet K mb d y k α (fun _ => o) := by
    rw [taylor_within_apply]
    apply Finset.sum_congr rfl
    intro k _
    rw [iteratedDerivWithin_splitCorr hK α mb o d y hne k 0 (by norm_num)]
    have hp : splitPath o d 0 = fun _ => o := by ext u i; simp [splitPath]
    rw [hp]
    simp only [sub_zero, one_pow, mul_one]
  rw [hpoly] at ht
  have hf1 : f 1 = splitCorr K α z mb y := by
    have hp : splitPath o d 1 = z := by ext u i; simp [splitPath, d]
    change splitCorr K α (splitPath o d 1) mb y = _
    rw [hp]
  rw [hf1] at ht
  simpa only [sub_zero, one_pow, mul_one, div_mul_eq_mul_div] using ht

/- The commutative monoid algebra records how often each coordinate was raised. -/
abbrev JetPoly := AddMonoidAlgebra ℂ (U → Idx)

def jetEval (F : (U → Idx) → ℂ) (α : U → Idx) : JetPoly (U := U) →+ ℂ :=
  AddMonoidAlgebra.liftNC (AddMonoidHom.id ℂ) (fun β => F (α + β.toAdd))

omit [Fintype U] in
@[simp] theorem jetEval_single (F : (U → Idx) → ℂ) (α β : U → Idx) (c : ℂ) :
    jetEval F α (AddMonoidAlgebra.single β c) = c * F (α + β) := by
  simp [jetEval]

omit [Fintype U] in
theorem jetEval_single_mul (F : (U → Idx) → ℂ) (α β : U → Idx)
    (c : ℂ) (p : JetPoly (U := U)) :
    jetEval F α (AddMonoidAlgebra.single β c * p) = c * jetEval F (α + β) p := by
  induction p using AddMonoidAlgebra.induction_linear with
  | zero => simp
  | single γ a => simp [add_assoc, mul_assoc]
  | add p q hp hq => simp [mul_add, hp, hq]

omit [Fintype U] in
theorem add_coord (α : U → Idx) (u : U) (i : Fin 4) :
    α + Pi.single u (Pi.single i 1) = Function.update α u (α u + Pi.single i 1) := by
  ext v j
  by_cases h : v = u <;> simp [h, Pi.single_apply]

def directionPoly (d : U → Spacetime) : JetPoly (U := U) :=
  ∑ p : U × Fin 4, AddMonoidAlgebra.single
    (Pi.single p.1 (Pi.single p.2 1)) (d p.1 p.2 : ℂ)

theorem directionalJet_eq_poly (K : Idx → Idx → Spacetime → ℂ) (mb : J → Mon)
    (d z : U → Spacetime) (y : J → Spacetime) (n : ℕ) (α : U → Idx) :
    directionalJet K mb d y n α z =
      jetEval (fun α => splitCorr K α z mb y) α (directionPoly d ^ n) := by
  induction n generalizing α with
  | zero => simp [directionalJet, AddMonoidAlgebra.one_def]
  | succ n ih =>
    rw [pow_succ', directionPoly, Finset.sum_mul, map_sum]
    simp only [jetEval_single_mul, add_coord, Fintype.sum_prod_type]
    simp only [directionPoly, Fintype.sum_prod_type] at ih
    exact Finset.sum_congr rfl fun u _ => Finset.sum_congr rfl fun i _ =>
      congrArg ((d u i : ℂ) * ·) (ih _)

theorem sum_coord (β : U × Fin 4 → ℕ) :
    (∑ p : U × Fin 4, β p • (Pi.single p.1 (Pi.single p.2 1) : U → Idx)) =
      fun u i => β (u, i) := by
  ext u i
  simp [Fintype.sum_prod_type, Finset.sum_apply, Pi.single_apply, ite_apply, Pi.mul_apply]

theorem directionPoly_pow (d : U → Spacetime) (n : ℕ) :
    directionPoly d ^ n =
      ∑ β ∈ Finset.piAntidiag (Finset.univ : Finset (U × Fin 4)) n,
        AddMonoidAlgebra.single (fun u i => β (u, i))
          ((Nat.multinomial Finset.univ β : ℂ) *
            ∏ p : U × Fin 4, (d p.1 p.2 : ℂ) ^ β p) := by
  rw [directionPoly, Finset.sum_pow_eq_sum_piAntidiag]
  apply Finset.sum_congr rfl
  intro β _
  simp only [AddMonoidAlgebra.single_pow, AddMonoidAlgebra.prod_single,
    sum_coord, AddMonoidAlgebra.natCast_def, AddMonoidAlgebra.single_mul_single, zero_add]

theorem multinomial_div_factorial (β : U × Fin 4 → ℕ) (n : ℕ)
    (hβ : ∑ p, β p = n) :
    (n.factorial : ℂ)⁻¹ * (Nat.multinomial Finset.univ β : ℂ) =
      (∏ p : U × Fin 4, ((β p).factorial : ℂ))⁻¹ := by
  have hfact : (∏ p : U × Fin 4, ((β p).factorial : ℂ)) *
      (Nat.multinomial Finset.univ β : ℂ) = (n.factorial : ℂ) := by
    exact_mod_cast hβ ▸ Nat.multinomial_spec Finset.univ β
  have hn : (n.factorial : ℂ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  have hp : (∏ p : U × Fin 4, ((β p).factorial : ℂ)) ≠ 0 := by
    exact Finset.prod_ne_zero_iff.mpr fun p _ => by exact_mod_cast Nat.factorial_ne_zero (β p)
  apply (mul_right_cancel₀ hp)
  rw [inv_mul_cancel₀ hp, mul_assoc, mul_comm _ (∏ p : U × Fin 4, ((β p).factorial : ℂ)),
    hfact, inv_mul_cancel₀ hn]

theorem directionalJet_multinomial (K : Idx → Idx → Spacetime → ℂ) (mb : J → Mon)
    (d z : U → Spacetime) (y : J → Spacetime) (n : ℕ) (α : U → Idx) :
    (n.factorial : ℝ)⁻¹ • directionalJet K mb d y n α z =
      ∑ β ∈ Finset.piAntidiag (Finset.univ : Finset (U × Fin 4)) n,
        (∏ u : U, monoPow (d u) (fun i => β (u, i)) /
          (idxFact (fun i => β (u, i)) : ℂ)) *
          splitCorr K (fun u i => α u i + β (u, i)) z mb y := by
  rw [directionalJet_eq_poly, directionPoly_pow, map_sum, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro β hβ
  rw [jetEval_single, Complex.real_smul]
  simp only [Complex.ofReal_inv, Complex.ofReal_natCast, ← mul_assoc]
  rw [multinomial_div_factorial β n (Finset.mem_piAntidiag.mp hβ).1]
  congr 1
  simp only [monoPow, idxFact, Nat.cast_prod, Fintype.prod_prod_type, div_eq_mul_inv,
    Finset.prod_mul_distrib, ← Finset.prod_inv_distrib]
  exact mul_comm _ _

theorem coord_le_total (β : U → Idx) (u : U) (i : Fin 4) :
    β u i ≤ ∑ v, idxOrder (β v) := by
  exact (Finset.single_le_sum (fun j _ => Nat.zero_le (β u j)) (Finset.mem_univ i)).trans
    (Finset.single_le_sum (fun v _ => Nat.zero_le (idxOrder (β v))) (Finset.mem_univ u))

/-- Regroup a finite family of Taylor assignments by its raised multiset, or by its total
order. The coordinate box in the coefficient definition imposes no additional restriction. -/
theorem sum_taylor_assignments (α : U → Idx) (D : ℕ) (hD : splitGrade α ≤ D)
    (F : (U → Idx) → ℂ) :
    (∑ j : Fin (D + 1), ∑ ch : Channel j.val,
      ∑ β ∈ (Fintype.piFinset fun _ : U => idxBox (grade ch.1)).filter
        (fun β => (Finset.univ.val.map fun u : U => α u + β u) = ch.1), F β) =
      ∑ k ∈ Finset.range (D - splitGrade α + 1),
        ∑ β ∈ Finset.piAntidiag (Finset.univ : Finset (U × Fin 4)) k,
          F (fun u i => β (u, i)) := by
  let S (j : Fin (D + 1)) (ch : Channel j.val) : Finset (U → Idx) :=
    (Fintype.piFinset fun _ : U => idxBox (grade ch.1)).filter
      (fun β => (Finset.univ.val.map fun u : U => α u + β u) = ch.1)
  let L := Finset.univ.sigma fun j : Fin (D + 1) => Finset.univ.sigma (S j)
  let R := (Finset.range (D - splitGrade α + 1)).sigma fun k =>
    Finset.piAntidiag (Finset.univ : Finset (U × Fin 4)) k
  have hgrade (j : Fin (D + 1)) (ch : Channel j.val) (β : U → Idx)
      (hβ : β ∈ S j ch) : splitGrade α + ∑ u, idxOrder (β u) = j.val := by
    have hh := congrArg grade (Finset.mem_filter.mp hβ).2
    change splitGrade (fun u => α u + β u) = grade ch.1 at hh
    rwa [splitGrade_add, ch.2] at hh
  calc
    _ = ∑ t ∈ L, F t.2.2 := by simp only [L, S, Finset.sum_sigma]
    _ = ∑ t ∈ R, F (fun u i => t.2 (u, i)) := by
      apply Finset.sum_bij (fun t _ =>
        (⟨∑ u, idxOrder (t.2.2 u), fun p => t.2.2 p.1 p.2⟩ :
          Σ _ : ℕ, U × Fin 4 → ℕ))
      · rintro ⟨j, ch, β⟩ ht
        have hβ : β ∈ S j ch := (Finset.mem_sigma.mp (Finset.mem_sigma.mp ht).2).2
        have hg := hgrade j ch β hβ
        simp only [R, Finset.mem_sigma, Finset.mem_range, Finset.mem_piAntidiag,
          Finset.mem_univ, implies_true, and_true]
        constructor
        · have := j.isLt
          omega
        · simp [Fintype.sum_prod_type, idxOrder]
      · rintro ⟨j, ch, β⟩ ht ⟨j', ch', β'⟩ ht' he
        have hβ : β ∈ S j ch := (Finset.mem_sigma.mp (Finset.mem_sigma.mp ht).2).2
        have hβ' : β' ∈ S j' ch' := (Finset.mem_sigma.mp (Finset.mem_sigma.mp ht').2).2
        have hb : β = β' := by
          funext u i
          exact congrFun (congrArg (fun t : Σ _ : ℕ, U × Fin 4 → ℕ => t.2) he) (u, i)
        have hc : ch.1 = ch'.1 := by
          rw [← (Finset.mem_filter.mp hβ).2, ← (Finset.mem_filter.mp hβ').2, hb]
        have hj : j = j' := Fin.ext (ch.2.symm.trans ((congrArg grade hc).trans ch'.2))
        subst j'
        have hch : ch = ch' := Subtype.ext hc
        subst ch'
        subst β'
        rfl
      · rintro ⟨k, γ⟩ ht
        obtain ⟨hk, hγ⟩ := Finset.mem_sigma.mp ht
        have hk' := Finset.mem_range.mp hk
        change k < D - splitGrade α + 1 at hk'
        have hsum : ∑ u, idxOrder (fun i => γ (u, i)) = k := by
          simpa [Fintype.sum_prod_type, idxOrder] using (Finset.mem_piAntidiag.mp hγ).1
        let β : U → Idx := fun u i => γ (u, i)
        let m : Mon := Finset.univ.val.map (fun u => α u + β u)
        have hm : grade m = splitGrade α + k := by
          change splitGrade (fun u => α u + β u) = _
          rw [splitGrade_add, hsum]
        have hmlt : grade m < D + 1 := by
          rw [hm]
          omega
        let j : Fin (D + 1) := ⟨grade m, hmlt⟩
        let ch : Channel j.val := ⟨m, rfl⟩
        refine ⟨⟨j, ch, β⟩, ?_, ?_⟩
        · simp only [L, Finset.mem_sigma, Finset.mem_univ, true_and]
          apply Finset.mem_filter.mpr
          refine ⟨?_, rfl⟩
          apply Fintype.mem_piFinset.mpr
          intro u
          apply Fintype.mem_piFinset.mpr
          intro i
          apply Finset.mem_range.mpr
          have hb := coord_le_total β u i
          change β u i < grade m + 1
          change (∑ u, idxOrder (β u)) = k at hsum
          omega
        · apply Sigma.ext hsum
          apply heq_of_eq
          funext p
          rfl
      · intro t _
        rfl
    _ = _ := by simp only [R, Finset.sum_sigma]

/-- Regroup the recursive directional derivatives by the count of each
coordinate direction at each leg. Their multinomial multiplicity divided by `k!` is
`1 / ∏_u (β_u!)`. The channel condition gives `k = grade(channel) - splitGrade α`, and
`idxBox (grade(channel))` contains every such assignment. No analytic hypothesis is needed. -/
theorem splitTaylor_eq_directionalJet (K : Idx → Idx → Spacetime → ℂ)
    (α : U → Idx) (mb : J → Mon) (D : ℕ) (hD : splitGrade α ≤ D)
    (z : U → Spacetime) (o : Spacetime) (y : J → Spacetime) :
    splitTaylor K α D z o mb y =
      ∑ k ∈ Finset.range (D - splitGrade α + 1), (k.factorial : ℝ)⁻¹ •
        directionalJet K mb (fun u => z u - o) y k α (fun _ => o) := by
  unfold splitTaylor
  simp_rw [directionalJet_multinomial]
  exact sum_taylor_assignments α D hD (fun β =>
    (∏ u : U, monoPow (z u - o) (β u) / (idxFact (β u) : ℂ)) *
      splitCorr K (fun u => α u + β u) (fun _ => o) mb y)

end DirectionalJets

/-- The channel remainder follows from the uniform directional Taylor estimate and the finite
multinomial reindexing identity. Its constant is chosen before every geometric variable. -/
theorem splitCorr_taylor_bound {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    [Fintype U] [Fintype J] (α : U → Idx) (mb : J → Mon)
    (M c : ℝ) (hM : 0 ≤ M) (hc : 0 < c) (D : ℕ) (hD : splitGrade α ≤ D) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ r : ℝ, 0 < r → r ≤ 1 → M * r < c / 2 →
      ∀ z o y, (∀ u, ‖z u - o‖ ≤ M * r) → Hierarchy.Clear o y c →
      ‖splitCorr K α z mb y - splitTaylor K α D z o mb y‖ ≤
        C * r ^ ((D : ℝ) + 1 - splitGrade α) := by
  obtain ⟨C, hC, hb⟩ := splitCorr_directional_taylor_bound hK α mb hM hc (D - splitGrade α)
  refine ⟨C, hC, ?_⟩
  intro r hr hr1 hs z o y hz hClear
  rw [splitTaylor_eq_directionalJet K α mb D hD z o y]
  have he : (D : ℝ) + 1 - splitGrade α = ((D - splitGrade α + 1 : ℕ) : ℝ) := by
    rw [Nat.cast_add, Nat.cast_sub hD, Nat.cast_one]
    ring
  rw [he, Real.rpow_natCast]
  exact hb r hr hs z o y hz hClear

/-- Including the high-grade case requires no Taylor expansion. -/
theorem bound_split_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    [Fintype U] [Fintype J] (α : U → Idx) (v : U → I) (mb : J → Mon)
    {M η c : ℝ} (hM : 0 ≤ M) (hc : 0 < c) (D : ℕ) :
    Bound M η c (fun x o y => splitCorr K α (x ∘ v) mb y -
      splitTaylor K α D (x ∘ v) o mb y) ((D : ℝ) + 1 - splitGrade α) := by
  by_cases hD : splitGrade α ≤ D
  · obtain ⟨C, hC, hb⟩ := splitCorr_taylor_bound hK α mb M c hM hc D hD
    exact ⟨C, hC, fun r hr hr1 hs x o y hW hClear =>
      hb r hr hr1 hs (x ∘ v) o y (fun u => hW.1 (v u)) hClear⟩
  · have hlt : D < splitGrade α := Nat.lt_of_not_ge hD
    have hb : Bound M η c (fun x _ y => splitCorr K α (x ∘ v) mb y) 0 := by
      obtain ⟨C, hC, hb⟩ := splitCorr_bound_away hK α mb (half_pos hc)
      refine ⟨C, hC, ?_⟩
      intro r hr hr1 hs x o y hW hClear
      simp only [Real.rpow_zero, mul_one]
      apply hb
      · intro u j
        exact (cross_separation hs (hW.1 (v u)) hClear j).le
      · intro i j hij
        exact (half_le_self hc.le).trans (hClear.2 i j hij)
    have he : (D : ℝ) + 1 - splitGrade α ≤ 0 := by
      have h : (D : ℝ) + 1 ≤ splitGrade α := by exact_mod_cast hlt
      linarith
    simpa only [splitTaylor_eq_zero α D _ _ mb _ hlt, sub_zero] using bound_weaken hb he

variable [Fintype I] [Fintype J]

/-- The grade partition is exactly the exponent cancellation needed by each block. -/
theorem splitGrade_unmatched {m : I → Mon} (σ : PMatching m) :
    (splitGrade (fun e : Unmatched σ => e.1.2.1) : ℝ) =
      ∑ e : Unmatched σ, legWeight e.1 := by
  simp [splitGrade_eq, legWeight]

/-- A single partial matching contributes a remainder of order `D + 1 - grade(m)`. -/
theorem bound_matching_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    {M η c : ℝ} (hM : 0 ≤ M) (hη : 0 < η) (hc : 0 < c)
    {m : I → Mon} (σ : PMatching m) (mb : J → Mon) (D : ℕ) :
    Bound M η c (fun x o y => internalProd K σ x *
      (splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e => x e.1.1) mb y -
        splitTaylor K (fun e : Unmatched σ => e.1.2.1) D (fun e => x e.1.1) o mb y))
      ((D : ℝ) + 1 - ∑ i, (grade (m i) : ℝ)) := by
  have hb := bound_mul (bound_internal (M := M) hK hη σ)
    (bound_split_remainder (η := η) hK (fun e : Unmatched σ => e.1.2.1)
      (fun e => e.1.1) mb hM hc D)
  have he : -(∑ l : PLeg m, lineWeight σ l) +
      ((D : ℝ) + 1 - splitGrade (fun e : Unmatched σ => e.1.2.1)) =
        (D : ℝ) + 1 - ∑ i, (grade (m i) : ℝ) := by
    rw [splitGrade_unmatched]
    have hp := weight_partition σ
    linarith
  rwa [he] at hb

/-- Collapse identifies every individual Taylor monomial with its channel actor. -/
theorem splitTaylor_collapse {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) {V : Type} [Fintype V]
    (α : V → Idx) (D : ℕ) (z : V → Spacetime) (o : Spacetime)
    (mb : J → Mon) (y : J → Spacetime) :
    splitTaylor K α D z o mb y =
      ∑ j : Fin (D + 1), ∑ ch : Channel j.val,
        (∑ β ∈ (Fintype.piFinset fun _ : V => idxBox (grade ch.1)).filter
          (fun β => (Finset.univ.val.map fun u : V => α u + β u) = ch.1),
          ∏ u : V, monoPow (z u - o) (β u) / (idxFact (β u) : ℂ)) *
          gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y := by
  unfold splitTaylor
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro ch _
  rw [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro β hβ
  rw [splitCorr_collapse hK, (Finset.mem_filter.mp hβ).2]

/-- Factorisation and collapse match the coefficient formula term for term. -/
theorem monomial_remainder_eq {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) (m : I → Mon)
    (mb : J → Mon) (D : ℕ) (x : I → Spacetime) (o : Spacetime) (y : J → Spacetime) :
    gwickGrouped K m x mb y -
      ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoefMono K m ch.1 x o *
        gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y =
      ∑ σ : PMatching m, internalProd K σ x *
        (splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e => x e.1.1) mb y -
          splitTaylor K (fun e : Unmatched σ => e.1.2.1) D (fun e => x e.1.1) o mb y) := by
  rw [gwickGrouped_factor hK]
  simp only [mul_sub, Finset.sum_sub_distrib]
  congr 1
  simp only [splitTaylor_collapse hK, Finset.mul_sum, gcoefMono, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro ch _
  simp only [mul_assoc]
  refine Finset.sum_congr ?_ ?_
  · ext β
    simp only [Finset.mem_filter, Fintype.mem_piFinset]
  · intro β _
    rfl

/-- The remainder estimate for monomial labels. -/
theorem bound_monomial_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    {M η c : ℝ} (hM : 0 ≤ M) (hη : 0 < η) (hc : 0 < c)
    (m : I → Mon) (mb : J → Mon) (D : ℕ) :
    Bound M η c (fun x o y => gwickGrouped K m x mb y -
      ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoefMono K m ch.1 x o *
        gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y)
      ((D : ℝ) + 1 - ∑ i, (grade (m i) : ℝ)) := by
  simp_rw [monomial_remainder_eq hK.symm]
  exact bound_sum _ _ _ (fun σ _ => bound_matching_remainder hK hM hη hc σ mb D)

/-- Reindex finite assignments through an equivalence of the vertex types. -/
theorem sum_piFinset_reindex {A B X : Type} [Fintype A] [Fintype B]
    [DecidableEq A] [DecidableEq B]
    (e : A ≃ B) (s : A → Finset X) (f : (A → X) → ℂ) :
    (∑ g ∈ Fintype.piFinset (s ∘ e.symm), f (g ∘ e)) =
      ∑ g ∈ Fintype.piFinset s, f g := by
  apply Finset.sum_bij (fun g _ => g ∘ e)
  · intro g hg
    apply Fintype.mem_piFinset.mpr
    intro a
    simpa using Fintype.mem_piFinset.mp hg (e a)
  · intro g hg h hh heq
    funext b
    have := congrFun heq (e.symm b)
    simpa using this
  · intro h hh
    refine ⟨h ∘ e.symm, ?_, ?_⟩
    · apply Fintype.mem_piFinset.mpr
      intro b
      exact Fintype.mem_piFinset.mp hh (e.symm b)
    · ext a
      simp
  · intro g _
    rfl

/-- Separate insertion and spectator choices in a finite multilinear expansion. -/
theorem sum_piFinset_sum {A B X : Type} [Fintype A] [Fintype B]
    [DecidableEq A] [DecidableEq B]
    (s : A → Finset X) (t : B → Finset X) (f : (A ⊕ B → X) → ℂ) :
    (∑ g ∈ Fintype.piFinset (Sum.elim s t), f g) =
      ∑ m ∈ Fintype.piFinset s, ∑ mb ∈ Fintype.piFinset t, f (Sum.elim m mb) := by
  rw [← Finset.sum_product (Fintype.piFinset s) (Fintype.piFinset t)
    (fun p => f (Sum.elim p.1 p.2))]
  apply Finset.sum_bij (fun g _ => (g ∘ Sum.inl, g ∘ Sum.inr))
  · intro g hg
    exact Finset.mem_product.mpr ⟨
      Fintype.mem_piFinset.mpr (fun a => Fintype.mem_piFinset.mp hg (Sum.inl a)),
      Fintype.mem_piFinset.mpr (fun b => Fintype.mem_piFinset.mp hg (Sum.inr b))⟩
  · intro g hg h hh heq
    funext a
    cases a with
    | inl a => exact congrFun (congrArg Prod.fst heq) a
    | inr b => exact congrFun (congrArg Prod.snd heq) b
  · rintro ⟨m, mb⟩ hh
    refine ⟨Sum.elim m mb, ?_, rfl⟩
    apply Fintype.mem_piFinset.mpr
    intro a
    cases a with
    | inl a => exact Fintype.mem_piFinset.mp (Finset.mem_product.mp hh).1 a
    | inr b => exact Fintype.mem_piFinset.mp (Finset.mem_product.mp hh).2 b
  · intro g _
    congr 1
    funext a
    cases a <;> rfl

/-- The totalised grouped correlation equals its monomial expansion on separated points. -/
theorem ggrouped_expansion (K : Idx → Idx → Spacetime → ℂ) (a : I → Tag)
    (x : I → Spacetime) (b : J → Tag) (y : J → Spacetime)
    (hx : Injective (Sum.elim x y)) :
    ggrouped K a x b y =
      ∑ m ∈ Fintype.piFinset (fun i => (tagLabel (a i)).support),
        ∑ mb ∈ Fintype.piFinset (fun j => (tagLabel (b j)).support),
          (∏ i, tagLabel (a i) (m i)) * (∏ j, tagLabel (b j) (mb j)) *
            gwickGrouped K m x mb y := by
  unfold ggrouped gcorr
  rw [if_pos (show WithLp.toLp 2 ((Sum.elim x y) ∘ (Fintype.equivFin (I ⊕ J)).symm) ∈
    WilsonFamily.separated _ from hx.comp (Equiv.injective _))]
  let e := Fintype.equivFin (I ⊕ J)
  let s : I ⊕ J → Finset Mon := Sum.elim
    (fun i => (tagLabel (a i)).support) (fun j => (tagLabel (b j)).support)
  let F : (I ⊕ J → Mon) → ℂ := fun μ =>
    (∏ k, tagLabel (Sum.elim a b k) (μ k)) *
      wickSum (fun v w α β => K α β (Sum.elim x y (e.symm w) - Sum.elim x y (e.symm v)))
        (μ ∘ e.symm)
  have hw : wickL (fun v w α β => K α β (Sum.elim x y (e.symm w) -
      Sum.elim x y (e.symm v))) (fun k => tagLabel (Sum.elim a b (e.symm k))) =
      ∑ μ ∈ Fintype.piFinset (s ∘ e.symm), F (μ ∘ e) := by
    unfold wickL
    apply Finset.sum_congr
    · congr 1
      funext k
      dsimp [s, Function.comp_def]
      cases e.symm k <;> rfl
    · intro μ _
      dsimp [F]
      have hp : (∏ k, tagLabel (Sum.elim a b (e.symm k)) (μ k)) =
          ∏ k, tagLabel (Sum.elim a b k) (μ (e k)) := by
        apply Fintype.prod_equiv e.symm
        intro k
        simp
      rw [hp]
      congr 2
      ext k
      simp
  change wickL (fun v w α β => K α β (Sum.elim x y (e.symm w) -
      Sum.elim x y (e.symm v))) (fun k => tagLabel (Sum.elim a b (e.symm k))) = _
  rw [hw, sum_piFinset_reindex e s F]
  dsimp only [s]
  rw [sum_piFinset_sum]
  apply Finset.sum_congr rfl
  intro m _
  apply Finset.sum_congr rfl
  intro mb _
  dsimp [F]
  rw [Fintype.prod_sum_type]
  rfl

theorem tagLabel_actor (j : ℕ) (ch : Channel j) :
    tagLabel (⟨j, actor j ch⟩ : Tag) = Finsupp.single ch.1 1 := by
  exact toLabel_single j ⟨ch.1, ch.2.le⟩ 1

/-- A channel actor has just one monomial, with coefficient one. -/
theorem actor_expansion (K : Idx → Idx → Spacetime → ℂ) (j : ℕ) (ch : Channel j)
    (o : Spacetime) (b : J → Tag) (y : J → Spacetime)
    (hx : Injective (Sum.elim (fun _ : Unit => o) y)) :
    ggrouped K (fun _ : Unit => (⟨j, actor j ch⟩ : Tag)) (fun _ => o) b y =
      ∑ mb ∈ Fintype.piFinset (fun j => (tagLabel (b j)).support),
        (∏ j, tagLabel (b j) (mb j)) *
          gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y := by
  rw [ggrouped_expansion K _ _ _ _ hx]
  simp only [tagLabel_actor, Finsupp.support_single _ (one_ne_zero : (1 : ℂ) ≠ 0),
    Fintype.piFinset_singleton, Finset.sum_singleton, Finsupp.single_eq_same,
    Finset.prod_const_one, one_mul]

/-- This only uses the filtration, so labels need not be homogeneous. -/
theorem support_grade (a : Tag) (m : Mon) (hm : m ∈ (tagLabel a).support) :
    grade m ≤ a.1 := by
  have hh := Finsupp.mem_support_iff.mp hm
  change Finsupp.mapDomain (Subtype.val : GradeLE a.1 → Mon)
    ((Finsupp.linearEquivFunOnFinite ℂ ℂ (GradeLE a.1)).symm a.2) m ≠ 0 at hh
  obtain ⟨m', rfl⟩ := Finsupp.mem_range_of_mapDomain_ne_zero hh
  exact m'.2

/-- Move a finite sum through the dependent pair of channel indices. -/
theorem sum_channels_comm {A : Type} (s : Finset A) (D : ℕ)
    (f : (j : Fin (D + 1)) → Channel j.val → A → ℂ) :
    (∑ j : Fin (D + 1), ∑ ch : Channel j.val, ∑ a ∈ s, f j ch a) =
      ∑ a ∈ s, ∑ j : Fin (D + 1), ∑ ch : Channel j.val, f j ch a := by
  calc
    _ = ∑ j : Fin (D + 1), ∑ a ∈ s, ∑ ch : Channel j.val, f j ch a := by
      apply Finset.sum_congr rfl
      intro j _
      exact Finset.sum_comm
    _ = _ := Finset.sum_comm

/-- On the small-radius domain, multilinearity expresses the full remainder as a finite sum
of the monomial remainders, with weights independent of all positions. -/
theorem remainder_expansion (K : Idx → Idx → Spacetime → ℂ) (a : I → Tag) (b : J → Tag)
    (D : ℕ) (x : I → Spacetime) (o : Spacetime) (y : J → Spacetime)
    (hx : Injective x) (hxy : Injective (Sum.elim x y))
    (hoy : Injective (Sum.elim (fun _ : Unit => o) y)) :
    ggrouped K a x b y -
      ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoef K I a j.val ch x o *
        ggrouped K (fun _ : Unit => (⟨j.val, actor j.val ch⟩ : Tag)) (fun _ => o) b y =
      ∑ m ∈ Fintype.piFinset (fun i => (tagLabel (a i)).support),
        ∑ mb ∈ Fintype.piFinset (fun j => (tagLabel (b j)).support),
          ((∏ i, tagLabel (a i) (m i)) * (∏ j, tagLabel (b j) (mb j))) *
            (gwickGrouped K m x mb y -
              ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoefMono K m ch.1 x o *
                gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y) := by
  rw [ggrouped_expansion K a x b y hxy]
  simp only [mul_sub, Finset.sum_sub_distrib]
  congr 1
  simp only [actor_expansion K _ _ o b y hoy, gcoef, if_pos hx,
    Finset.sum_mul, Finset.mul_sum]
  simp_rw [← sum_channels_comm]
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro ch _
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro m _
  apply Finset.sum_congr rfl
  intro mb _
  ring

/-- All finite constants can be chosen uniformly before the positions. -/
theorem bound_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K)
    {M η c : ℝ} (hM : 0 ≤ M) (hη : 0 < η) (hc : 0 < c)
    (a : I → Tag) (b : J → Tag) (D : ℕ) :
    Bound M η c (fun x o y => ggrouped K a x b y -
      ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoef K I a j.val ch x o *
        ggrouped K (fun _ : Unit => (⟨j.val, actor j.val ch⟩ : Tag)) (fun _ => o) b y)
      ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ)) := by
  have hb : Bound M η c (fun x o y =>
      ∑ m ∈ Fintype.piFinset (fun i => (tagLabel (a i)).support),
        ∑ mb ∈ Fintype.piFinset (fun j => (tagLabel (b j)).support),
          ((∏ i, tagLabel (a i) (m i)) * (∏ j, tagLabel (b j) (mb j))) *
            (gwickGrouped K m x mb y -
              ∑ j : Fin (D + 1), ∑ ch : Channel j.val, gcoefMono K m ch.1 x o *
                gwickGrouped K (fun _ : Unit => ch.1) (fun _ => o) mb y))
      ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ)) := by
    apply bound_sum
    intro m hm
    apply bound_sum
    intro mb _
    have ht := bound_mul (bound_const ((∏ i, tagLabel (a i) (m i)) *
      (∏ j, tagLabel (b j) (mb j)))) (bound_monomial_remainder hK hM hη hc m mb D)
    simp only [zero_add] at ht
    apply bound_weaken ht
    apply sub_le_sub_left
    apply Finset.sum_le_sum
    intro i _
    exact_mod_cast support_grade (a i) (m i) (Fintype.mem_piFinset.mp hm i)
  obtain ⟨C, hC, hb⟩ := hb
  refine ⟨C, hC, ?_⟩
  intro r hr hr1 hs x o y hW hClear
  dsimp only
  rw [remainder_expansion K a b D x o y (within_injective hr hη hW)
    (grouped_injective hr hη hc hs hW hClear) (collapsed_injective hc hClear)]
  exact hb r hr hr1 hs x o y hW hClear

end RemainderProof
variable {I J : Type}

theorem gope_remainder' {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    [Fintype J] (a : I → Tag) (b : J → Tag) (M η c ε : ℝ) :
    0 ≤ M → 0 < η → 0 < c → 0 < ε → ∀ D : ℕ, ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o y, Hierarchy.Within r M η x o → Hierarchy.Clear o y c →
        ‖ggrouped K a x b y -
          ∑ j : Fin (D + 1), ∑ i : Channel j.val, gcoef K I a j.val i x o *
            ggrouped K (fun _ : Unit => (⟨j.val, actor j.val i⟩ : Tag)) (fun _ => o) b y‖
          ≤ r ^ ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ) - ε) := by
  intro hM hη hc hε D
  obtain ⟨C, hC, hb⟩ := RemainderProof.bound_remainder hK hM hη hc a b D
  have hlarge : ∀ᶠ r : ℝ in 𝓝[>] 0, C ≤ r ^ (-ε) :=
    (tendsto_rpow_neg_nhdsGT_zero (neg_neg_of_pos hε)).eventually (eventually_ge_atTop C)
  have hsmall : ∀ᶠ r : ℝ in 𝓝[>] 0, r ≤ 1 :=
    (eventually_le_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds
  have hsep : ∀ᶠ r : ℝ in 𝓝[>] 0, M * r < c / 2 := by
    have ht : Tendsto (fun r : ℝ => M * r) (𝓝[>] 0) (𝓝 (0 : ℝ)) := by
      simpa using (tendsto_const_nhds.mul
        (tendsto_id.mono_left nhdsWithin_le_nhds :
          Tendsto (fun r : ℝ => r) (𝓝[>] 0) (𝓝 0)))
    exact ht.eventually (eventually_lt_nhds (half_pos hc))
  filter_upwards [self_mem_nhdsWithin, hsmall, hsep, hlarge] with r hr hr1 hs hCr
  intro x o y hW hClear
  calc
    _ ≤ C * r ^ ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ)) := hb r hr hr1 hs x o y hW hClear
    _ ≤ r ^ (-ε) * r ^ ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ)) :=
      mul_le_mul_of_nonneg_right hCr (Real.rpow_nonneg (le_of_lt hr) _)
    _ = _ := by rw [← Real.rpow_add hr]; congr 1; ring

end YangMills.FreeField.Consolidated.OPE_GopeRemainder

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [HARD, 2500 lines] **Remainder bound.** For `r` small (`M r < c / 2`, `r < 1`) all points of
both grouped configurations are distinct, so `ggrouped` is the multilinear extension of
`gwickGrouped`. By `gwickGrouped_factor` it is `∑_σ internalProd · F_σ (x ∘ vertex)` with
`F_σ z = splitCorr K idx z mb y`. If the grade `g₀` of the unmatched legs is `≤ D`, expand
`F_σ` about `(o,…,o)` to total order `D - g₀` along the segment (`taylor_mean_remainder` in one
variable; iterated derivatives by `splitCorr_fderiv`): the Taylor terms are, by
`splitCorr_collapse`, exactly the terms of `gcoefMono` for the channels of grade `≤ D` times the
correlation of the actor, and the remainder is at most `(M r)^{D-g₀+1}` times a bound for
`splitCorr` with raised indices on the segment, which is uniform in `o`, `y` because every
argument of `K` has norm `≥ c / 2` (`hK.bound`). If `g₀ > D` nothing is subtracted and
`|internalProd · F_σ| ≤ C r^{g₀ - w'} ≤ C r^{D+1-w'}`. Sum over the finitely many `σ` and
monomials; `w' ≤ weight a`; absorb the constant in `r^{-ε}`.
Depends on `gwickGrouped_factor`, `splitCorr_collapse`, `splitCorr_fderiv`. -/
theorem gope_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    [Fintype J] (a : I → Tag) (b : J → Tag) (M η c ε : ℝ) :
    0 ≤ M → 0 < η → 0 < c → 0 < ε → ∀ D : ℕ, ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o y, Hierarchy.Within r M η x o → Hierarchy.Clear o y c →
        ‖ggrouped K a x b y -
          ∑ j : Fin (D + 1), ∑ i : Channel j.val, gcoef K I a j.val i x o *
            ggrouped K (fun _ : Unit => (⟨j.val, actor j.val i⟩ : Tag)) (fun _ => o) b y‖
          ≤ r ^ ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ) - ε) := by
  exact Consolidated.OPE_GopeRemainder.gope_remainder' hK a b M η c ε

end YangMills.FreeField
