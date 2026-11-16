import FreeField.OPE.Base


/-! Proofs consolidated from `FreeField/Work/splitCorr_collapse.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_SplitCorrCollapse
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

namespace CollapseProof

private def univEquiv (U : Type) [Fintype U] :
    (Finset.univ.val : Multiset U).ToType ≃ U :=
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

/-- Enumerate occurrences, preserving the index even when indices repeat. -/
private def indexEquiv {U : Type} [Fintype U] (α : U → Idx) :
    U ≃ (Finset.univ.val.map α : Mon).ToType :=
  (univEquiv U).symm.trans (Multiset.mapEquiv Finset.univ.val α)

private theorem indexEquiv_idx {U : Type} [Fintype U] (α : U → Idx) (u : U) :
    (indexEquiv α u).1 = α u := by
  change (Multiset.mapEquiv Finset.univ.val α ((univEquiv U).symm u)).1 = _
  rw [Multiset.mapEquiv_apply]
  exact congrArg α ((univEquiv U).apply_symm_apply u)

/-- Reorient each pair by transporting the selected endpoint through the involution. -/
private theorem orient_prod {L : Type} [Fintype L] (σ : Equiv.Perm L)
    (hσ : ∀ l, σ (σ l) = l) (p q : L → Prop) [DecidablePred p] [DecidablePred q]
    (hp : ∀ l, p (σ l) ↔ ¬ p l) (hq : ∀ l, q (σ l) ↔ ¬ q l)
    (f : L → ℂ) (hf : ∀ l, f (σ l) = f l) :
    (∏ l, if p l then f l else 1) = ∏ l, if q l then f l else 1 := by
  rw [← Finset.prod_filter, ← Finset.prod_filter]
  apply Finset.prod_bij (fun l _ => if q l then l else σ l)
  · intro l hl
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hl ⊢
    split_ifs with h
    · exact h
    · exact (hq l).2 h
  · intro a ha b hb hab
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at ha hb
    split_ifs at hab with hqa hqb hqb
    · exact hab
    · have := (hp b).1 (hab ▸ ha)
      exact (this hb).elim
    · have := (hp a).1 (hab.symm ▸ hb)
      exact (this ha).elim
    · exact σ.injective hab
  · intro b hb
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hb
    by_cases hpb : p b
    · exact ⟨b, by simp [hpb], by simp [hb]⟩
    · refine ⟨σ b, by simp [(hp b).2 hpb], ?_⟩
      have hnq : ¬ q (σ b) := by simpa [hq] using hb
      simp [hnq, hσ]
  · intro a ha
    split_ifs
    · rfl
    · exact (hf a).symm

variable {U J : Type} [Fintype U] [Fintype J]

private def vertex (mb : J → Mon) : U ⊕ PLeg mb → Unit ⊕ J :=
  Sum.elim (fun _ => Sum.inl ()) (fun l => Sum.inr l.1)

private def indices (α : U → Idx) (mb : J → Mon) : U ⊕ PLeg mb → Idx :=
  Sum.elim α (fun l => l.2.1)

private def positions (o : Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    U ⊕ PLeg mb → Spacetime := Sum.elim (fun _ => o) (fun l => y l.1)

private def rawLegEquiv (α : U → Idx) (mb : J → Mon) :
    U ⊕ PLeg mb ≃ PLeg (Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) where
  toFun := Sum.elim (fun u => ⟨Sum.inl (), indexEquiv α u⟩)
    (fun l => ⟨Sum.inr l.1, l.2⟩)
  invFun := fun l => match l with
    | ⟨Sum.inl _, a⟩ => Sum.inl ((indexEquiv α).symm a)
    | ⟨Sum.inr j, a⟩ => Sum.inr ⟨j, a⟩
  left_inv := by intro l; cases l <;> simp
  right_inv := by rintro ⟨(_ | j), a⟩ <;> simp

private def legEquiv (α : U → Idx) (mb : J → Mon) :
    U ⊕ PLeg mb ≃ Leg ((Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) ∘
      (Fintype.equivFin (Unit ⊕ J)).symm) :=
  (rawLegEquiv α mb).trans
    (Equiv.sigmaCongrLeft (Fintype.equivFin (Unit ⊕ J)).symm).symm

private theorem legEquiv_vertex (α : U → Idx) (mb : J → Mon) (l : U ⊕ PLeg mb) :
    (legEquiv α mb l).1 = Fintype.equivFin (Unit ⊕ J) (vertex mb l) := by
  cases l <;> rfl

private theorem legEquiv_idx (α : U → Idx) (mb : J → Mon) (l : U ⊕ PLeg mb) :
    (legEquiv α mb l).idx = indices α mb l := by
  have hh (a b : Unit ⊕ J) (h : a = b)
      (t : ((Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) a).ToType) :
      (h ▸ t).1 = t.1 := by subst h; rfl
  cases l with
  | inl u =>
    change (Eq.ndrec (a := Sum.inl ()) (motive := fun v =>
      ((Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) v).ToType)
      (indexEquiv α u) ((Fintype.equivFin (Unit ⊕ J)).symm_apply_apply (Sum.inl ())).symm).1 = α u
    rw [hh, indexEquiv_idx]
  | inr l =>
    change (Eq.ndrec (a := Sum.inr l.1) (motive := fun v =>
      ((Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) v).ToType)
      l.2 ((Fintype.equivFin (Unit ⊕ J)).symm_apply_apply (Sum.inr l.1)).symm).1 = l.2.1
    rw [hh]

omit [Fintype U] [Fintype J] in
private theorem matching_property (mb : J → Mon) (τ : Equiv.Perm (U ⊕ PLeg mb)) :
    ((∀ u : U, ∃ l : PLeg mb, τ (Sum.inl u) = Sum.inr l) ∧
      ∀ l : PLeg mb, τ (Sum.inr l) ≠ Sum.inr l ∧
        ∀ l' : PLeg mb, τ (Sum.inr l) = Sum.inr l' → l'.1 ≠ l.1) ↔
    ∀ l, vertex mb (τ l) ≠ vertex mb l := by
  constructor
  · rintro ⟨hu, hl⟩ (u | l)
    · obtain ⟨l, h⟩ := hu u
      simp [h, vertex]
    · cases h : τ (Sum.inr l) with
      | inl u => simp [vertex]
      | inr l' => simpa [h, vertex] using (hl l).2 l' h
  · intro h
    constructor
    · intro u
      cases hh : τ (Sum.inl u) with
      | inl v => simpa [hh, vertex] using h (Sum.inl u)
      | inr l => exact ⟨l, rfl⟩
    · intro l
      constructor
      · intro hh
        exact h (Sum.inr l) (congrArg (vertex mb) hh)
      · intro l' hh
        simpa [hh, vertex] using h (Sum.inr l)

private def matchingEquiv (α : U → Idx) (mb : J → Mon) :
    SMatching U mb ≃ Matching ((Sum.elim (fun _ : Unit => (Finset.univ.val.map α : Mon)) mb) ∘
      (Fintype.equivFin (Unit ⊕ J)).symm) :=
  (legEquiv α mb).permCongr.subtypeEquiv (by
    intro τ
    simp only [Equiv.permCongr_apply]
    constructor
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        simp [hi]
      · intro l
        obtain ⟨l, rfl⟩ := (legEquiv α mb).surjective l
        simp only [Equiv.symm_apply_apply, legEquiv_vertex]
        exact fun he => (matching_property mb τ).1 hv l
          ((Fintype.equivFin (Unit ⊕ J)).injective he)
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        have h := hi (legEquiv α mb l)
        simpa using h
      · apply (matching_property mb τ).2
        intro l
        have h := hv (legEquiv α mb l)
        simp only [Equiv.symm_apply_apply, legEquiv_vertex] at h
        exact fun he => h (congrArg (Fintype.equivFin (Unit ⊕ J)) he))

private def rank : Unit ⊕ J → ℕ :=
  Sum.elim (fun _ => 0) (fun j => (Fintype.equivFin J j).val + 1)

private theorem rank_injective : Injective (rank (J := J)) := by
  rintro (a | a) (b | b) h
  · cases a; cases b; rfl
  · simp [rank] at h
  · simp [rank] at h
  · simp only [rank, Sum.elim_inr, Nat.add_right_cancel_iff] at h
    exact congrArg Sum.inr ((Fintype.equivFin J).injective (Fin.ext h))

private theorem term_eq (K : Idx → Idx → Spacetime → ℂ)
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) (α : U → Idx)
    (o : Spacetime) (mb : J → Mon) (y : J → Spacetime) (τ : SMatching U mb) :
    (∏ u : U, Sum.elim (fun _ => (1 : ℂ))
      (fun l : PLeg mb => K (α u) l.2.1 (y l.1 - o)) (τ.1 (Sum.inl u))) *
    ∏ l : PLeg mb, Sum.elim (fun _ => (1 : ℂ))
      (fun l' : PLeg mb => if Fintype.equivFin J l.1 < Fintype.equivFin J l'.1 then
        K l.2.1 l'.2.1 (y l'.1 - y l.1) else 1) (τ.1 (Sum.inr l)) =
    ∏ l, if l.1 < ((matchingEquiv α mb τ).1 l).1 then
      K l.idx ((matchingEquiv α mb τ).1 l).idx
        ((Sum.elim (fun _ : Unit => o) y) ((Fintype.equivFin (Unit ⊕ J)).symm
            ((matchingEquiv α mb τ).1 l).1) -
         (Sum.elim (fun _ : Unit => o) y) ((Fintype.equivFin (Unit ⊕ J)).symm l.1))
      else 1 := by
  let f : U ⊕ PLeg mb → ℂ := fun l => K (indices α mb l) (indices α mb (τ.1 l))
    (positions o mb y (τ.1 l) - positions o mb y l)
  let p : U ⊕ PLeg mb → Prop := fun l => rank (vertex mb l) < rank (vertex mb (τ.1 l))
  let q : U ⊕ PLeg mb → Prop := fun l =>
    Fintype.equivFin (Unit ⊕ J) (vertex mb l) < Fintype.equivFin (Unit ⊕ J) (vertex mb (τ.1 l))
  have hv := (matching_property mb τ.1).1 τ.2.2
  have hp : ∀ l, p (τ.1 l) ↔ ¬ p l := by
    intro l
    dsimp [p]
    rw [τ.2.1]
    have hn : rank (vertex mb (τ.1 l)) ≠ rank (vertex mb l) :=
      fun h => hv l (rank_injective h)
    omega
  have hq : ∀ l, q (τ.1 l) ↔ ¬ q l := by
    intro l
    dsimp [q]
    rw [τ.2.1]
    have hn := (Fintype.equivFin (Unit ⊕ J)).injective.ne (hv l)
    exact ⟨not_lt_of_gt, fun h => lt_of_le_of_ne (le_of_not_gt h) hn⟩
  have hf : ∀ l, f (τ.1 l) = f l := by
    intro l
    dsimp [f]
    rw [τ.2.1, hK, neg_sub]
  calc
    _ = ∏ l, if p l then f l else 1 := by
      rw [Fintype.prod_sum_type]
      congr 1
      · apply Finset.prod_congr rfl
        intro u _
        obtain ⟨l, hl⟩ := τ.2.2.1 u
        simp [p, f, hl, rank, vertex, indices, positions]
      · apply Finset.prod_congr rfl
        intro l _
        dsimp [p, f]
        cases hl : τ.1 (Sum.inr l) <;>
          simp [rank, vertex, indices, positions]
    _ = ∏ l, if q l then f l else 1 := orient_prod τ.1 τ.2.1 p q hp hq f hf
    _ = _ := by
      apply Fintype.prod_equiv (legEquiv α mb)
      intro l
      have ht : (matchingEquiv α mb τ).1 (legEquiv α mb l) = legEquiv α mb (τ.1 l) := by
        change (legEquiv α mb) (τ.1 ((legEquiv α mb).symm (legEquiv α mb l))) = _
        rw [Equiv.symm_apply_apply]
      rw [ht, legEquiv_vertex, legEquiv_vertex, legEquiv_idx, legEquiv_idx]
      simp only [Equiv.symm_apply_apply]
      have hx : ∀ l : U ⊕ PLeg mb,
          (Sum.elim (fun _ : Unit => o) y) (vertex mb l) = positions o mb y l := by
        intro l; cases l <;> rfl
      simp only [hx]
      rfl

end CollapseProof
variable {I J : Type}

theorem splitCorr_collapse' {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) {U : Type} [Fintype U] [Fintype J] (α : U → Idx)
    (o : Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    splitCorr K α (fun _ => o) mb y =
      gwickGrouped K (fun _ : Unit => (Finset.univ.val.map α : Mon)) (fun _ => o) mb y := by
  unfold splitCorr gwickGrouped wickSum
  apply Fintype.sum_equiv (CollapseProof.matchingEquiv α mb)
  intro τ
  exact CollapseProof.term_eq K hK α o mb y τ

end YangMills.FreeField.Consolidated.OPE_SplitCorrCollapse

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [MEDIUM, 400 lines] **Collapse.** With all split legs at one point `o`, the point-split
correlation is the grouped Wick sum of the single monomial `{α u | u}` at `o` with the
spectators (choose a bijection of `U` with the legs of that multiset preserving indices). -/
theorem splitCorr_collapse {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) {U : Type} [Fintype U] [Fintype J] (α : U → Idx)
    (o : Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    splitCorr K α (fun _ => o) mb y =
      gwickGrouped K (fun _ : Unit => (Finset.univ.val.map α : Mon)) (fun _ => o) mb y := by
  exact Consolidated.OPE_SplitCorrCollapse.splitCorr_collapse' hK α o mb y

end YangMills.FreeField
