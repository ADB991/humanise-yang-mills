import FreeField.OPE.Base


/-! Proofs consolidated from `FreeField/Work/gwickGrouped_factor.lean`. -/

set_option autoImplicit false
set_option linter.unusedSectionVars false
noncomputable section
namespace YangMills.FreeField.Consolidated.OPE_GwickGroupedFactor
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

namespace FactorProof

variable {I J : Type} [Fintype I] [Fintype J] {m : I → Mon} {mb : J → Mon}

private def vertex : PLeg m ⊕ PLeg mb → I ⊕ J :=
  Sum.elim (fun l => Sum.inl l.1) (fun l => Sum.inr l.1)

private abbrev Full (m : I → Mon) (mb : J → Mon) :=
  {φ : Equiv.Perm (PLeg m ⊕ PLeg mb) //
    (∀ l, φ (φ l) = l) ∧ ∀ l, vertex (φ l) ≠ vertex l}

private def clusterFun (φ : Full m mb) (a : PLeg m) : PLeg m :=
  Sum.elim id (fun _ => a) (φ.1 (Sum.inl a))

private theorem clusterFun_involutive (φ : Full m mb) : Involutive (clusterFun φ) := by
  intro a
  cases h : φ.1 (Sum.inl a) with
  | inl a' =>
    have h' : φ.1 (Sum.inl a') = Sum.inl a := by rw [← h, φ.2.1]
    simp [clusterFun, h, h']
  | inr b => simp [clusterFun, h]

private def cluster (φ : Full m mb) : PMatching m :=
  ⟨⟨clusterFun φ, clusterFun φ, clusterFun_involutive φ, clusterFun_involutive φ⟩,
    clusterFun_involutive φ, by
      intro a ha
      cases h : φ.1 (Sum.inl a) with
      | inl a' =>
        have hv := φ.2.2 (Sum.inl a)
        simpa [clusterFun, h, vertex] using hv
      | inr b => exact (ha (by simp [clusterFun, h])).elim⟩

private theorem cluster_apply (φ : Full m mb) (a : PLeg m) :
    (cluster φ).1 a = Sum.elim id (fun _ => a) (φ.1 (Sum.inl a)) := rfl

private theorem cluster_fixed_iff (φ : Full m mb) (a : PLeg m) :
    (cluster φ).1 a = a ↔ ∃ b : PLeg mb, φ.1 (Sum.inl a) = Sum.inr b := by
  rw [cluster_apply]
  cases h : φ.1 (Sum.inl a) with
  | inl a' =>
    have hn : a' ≠ a := by
      intro he
      exact φ.2.2 (Sum.inl a) (by simp [h, he])
    simp [hn]
  | inr b => simp

private def embed (σ : PMatching m) : Unmatched σ ⊕ PLeg mb → PLeg m ⊕ PLeg mb :=
  Sum.elim (fun a => Sum.inl a.1) Sum.inr

private theorem embed_injective (σ : PMatching m) : Injective (embed (mb := mb) σ) := by
  rintro (a | b) (a' | b') h <;> simp_all [embed, Subtype.ext_iff]

private def residualFun (φ : Full m mb) (l : Unmatched (cluster φ) ⊕ PLeg mb) :
    Unmatched (cluster φ) ⊕ PLeg mb :=
  match h : φ.1 (embed (cluster φ) l) with
  | Sum.inl a => Sum.inl ⟨a, by
      cases l with
      | inl u =>
        obtain ⟨b, hb⟩ := (cluster_fixed_iff φ u.1).1 u.2
        simp [embed, hb] at h
      | inr b =>
        apply (cluster_fixed_iff φ a).2
        exact ⟨b, by change φ.1 (Sum.inr b) = Sum.inl a at h; rw [← h, φ.2.1]⟩⟩
  | Sum.inr b => Sum.inr b

private theorem embed_residualFun (φ : Full m mb) (l : Unmatched (cluster φ) ⊕ PLeg mb) :
    embed (cluster φ) (residualFun φ l) = φ.1 (embed (cluster φ) l) := by
  unfold residualFun
  split <;> rename_i a h <;> exact h.symm

private def residual (φ : Full m mb) : SMatching (Unmatched (cluster φ)) mb := by
  have hi : Involutive (residualFun φ) := by
    intro l
    apply embed_injective (cluster φ)
    rw [embed_residualFun, embed_residualFun, φ.2.1]
  refine ⟨⟨residualFun φ, residualFun φ, hi, hi⟩, hi, ?_, ?_⟩
  · intro u
    obtain ⟨b, hb⟩ := (cluster_fixed_iff φ u.1).1 u.2
    refine ⟨b, embed_injective (cluster φ) ?_⟩
    simpa [embed] using (embed_residualFun φ (Sum.inl u)).trans hb
  · intro b
    constructor
    · intro h
      have he := congrArg (embed (cluster φ)) h
      change embed (cluster φ) (residualFun φ (Sum.inr b)) = _ at he
      rw [embed_residualFun] at he
      exact φ.2.2 (Sum.inr b) (congrArg vertex he)
    · intro b' h
      have he := congrArg (embed (cluster φ)) h
      change embed (cluster φ) (residualFun φ (Sum.inr b)) = _ at he
      rw [embed_residualFun] at he
      change φ.1 (Sum.inr b) = Sum.inr b' at he
      have hv := φ.2.2 (Sum.inr b)
      simpa [he, vertex] using hv

private def joinFun (σ : PMatching m) (τ : SMatching (Unmatched σ) mb) :
    PLeg m ⊕ PLeg mb → PLeg m ⊕ PLeg mb :=
  Sum.elim (fun a => if h : σ.1 a = a then embed σ (τ.1 (Sum.inl ⟨a, h⟩))
    else Sum.inl (σ.1 a)) (fun b => embed σ (τ.1 (Sum.inr b)))

private theorem joinFun_embed (σ : PMatching m) (τ : SMatching (Unmatched σ) mb)
    (l : Unmatched σ ⊕ PLeg mb) :
    joinFun σ τ (embed σ l) = embed σ (τ.1 l) := by
  cases l with
  | inl a => simp [joinFun, embed, a.2]
  | inr b => rfl

private theorem joinFun_nonfixed (σ : PMatching m) (τ : SMatching (Unmatched σ) mb)
    (a : PLeg m) (ha : σ.1 a ≠ a) : joinFun σ τ (Sum.inl a) = Sum.inl (σ.1 a) := by
  simp [joinFun, ha]

private def join (σ : PMatching m) (τ : SMatching (Unmatched σ) mb) : Full m mb := by
  have hi : Involutive (joinFun σ τ) := by
    rintro (a | b)
    · by_cases ha : σ.1 a = a
      · change joinFun σ τ (joinFun σ τ (embed σ (Sum.inl ⟨a, ha⟩))) = _
        rw [joinFun_embed, joinFun_embed, τ.2.1]
        rfl
      · have ha' : σ.1 (σ.1 a) ≠ σ.1 a := fun h => ha (σ.1.injective h)
        rw [joinFun_nonfixed σ τ a ha, joinFun_nonfixed σ τ _ ha', σ.2.1]
    · change joinFun σ τ (joinFun σ τ (embed σ (Sum.inr b))) = _
      rw [joinFun_embed, joinFun_embed, τ.2.1]
      rfl
  refine ⟨⟨joinFun σ τ, joinFun σ τ, hi, hi⟩, hi, ?_⟩
  rintro (a | b)
  · by_cases ha : σ.1 a = a
    · obtain ⟨b, hb⟩ := τ.2.2.1 ⟨a, ha⟩
      simp [joinFun, ha, hb, embed, vertex]
    · simpa [joinFun, ha, vertex] using σ.2.2 a ha
  · cases h : τ.1 (Sum.inr b) with
    | inl a => simp [joinFun, h, embed, vertex]
    | inr b' => simpa [joinFun, h, embed, vertex] using (τ.2.2.2 b).2 b' h

private theorem join_apply_embed (σ : PMatching m) (τ : SMatching (Unmatched σ) mb)
    (l : Unmatched σ ⊕ PLeg mb) :
    (join σ τ).1 (embed σ l) = embed σ (τ.1 l) := joinFun_embed σ τ l

private theorem embed_residual (φ : Full m mb) (l : Unmatched (cluster φ) ⊕ PLeg mb) :
    embed (cluster φ) ((residual φ).1 l) = φ.1 (embed (cluster φ) l) :=
  embed_residualFun φ l

private theorem cluster_join (σ : PMatching m) (τ : SMatching (Unmatched σ) mb) :
    cluster (join σ τ) = σ := by
  apply Subtype.ext
  apply Equiv.ext
  intro a
  rw [cluster_apply]
  by_cases ha : σ.1 a = a
  · obtain ⟨b, hb⟩ := τ.2.2.1 ⟨a, ha⟩
    simp [join, joinFun, ha, hb, embed]
  · simp [join, joinFun, ha]

private theorem join_cluster_residual (φ : Full m mb) :
    join (cluster φ) (residual φ) = φ := by
  apply Subtype.ext
  apply Equiv.ext
  rintro (a | b)
  · by_cases ha : (cluster φ).1 a = a
    · exact (join_apply_embed (cluster φ) (residual φ) (Sum.inl ⟨a, ha⟩)).trans
        (embed_residual φ (Sum.inl ⟨a, ha⟩))
    · change joinFun (cluster φ) (residual φ) (Sum.inl a) = _
      rw [joinFun_nonfixed _ _ _ ha, cluster_apply]
      cases h : φ.1 (Sum.inl a) with
      | inl a' => rfl
      | inr b => exact (ha ((cluster_fixed_iff φ a).2 ⟨b, h⟩)).elim
  · exact (join_apply_embed (cluster φ) (residual φ) (Sum.inr b)).trans
      (embed_residual φ (Sum.inr b))

/-- The matching bijection, with multiplicities retained as distinct legs. -/
private def decompEquiv : (Σ σ : PMatching m, SMatching (Unmatched σ) mb) ≃ Full m mb :=
  Equiv.ofBijective (fun d => join d.1 d.2) (by
    constructor
    · rintro ⟨σ, τ⟩ ⟨σ', τ'⟩ h
      change join σ τ = join σ' τ' at h
      have hs : σ = σ' := by simpa only [cluster_join] using congrArg cluster h
      subst σ'
      have ht : τ = τ' := by
        apply Subtype.ext
        apply Equiv.ext
        intro l
        apply embed_injective σ
        rw [← join_apply_embed, h, join_apply_embed]
      subst τ'
      rfl
    · intro φ
      exact ⟨⟨cluster φ, residual φ⟩, join_cluster_residual φ⟩)

private def rank : I ⊕ J → ℕ :=
  Sum.elim (fun i => (Fintype.equivFin I i).val)
    (fun j => Fintype.card I + (Fintype.equivFin J j).val)

private theorem rank_injective : Injective (rank (I := I) (J := J)) := by
  rintro (a | a) (b | b) h
  · exact congrArg Sum.inl ((Fintype.equivFin I).injective (Fin.ext h))
  · have ha := (Fintype.equivFin I a).isLt
    simp only [rank, Sum.elim_inl, Sum.elim_inr] at h
    omega
  · have hb := (Fintype.equivFin I b).isLt
    simp only [rank, Sum.elim_inl, Sum.elim_inr] at h
    omega
  · simp only [rank, Sum.elim_inr, Nat.add_left_cancel_iff] at h
    exact congrArg Sum.inr ((Fintype.equivFin J).injective (Fin.ext h))

private def indices : PLeg m ⊕ PLeg mb → Idx :=
  Sum.elim (fun a => a.2.1) (fun b => b.2.1)

private def positions (x : I → Spacetime) (y : J → Spacetime) :
    PLeg m ⊕ PLeg mb → Spacetime := Sum.elim (fun a => x a.1) (fun b => y b.1)

private def fullTerm (K : Idx → Idx → Spacetime → ℂ) (x : I → Spacetime)
    (y : J → Spacetime) (φ : Full m mb) : ℂ :=
  ∏ l, if rank (vertex l) < rank (vertex (φ.1 l)) then
    K (indices l) (indices (φ.1 l)) (positions x y (φ.1 l) - positions x y l) else 1

private def splitTerm (K : Idx → Idx → Spacetime → ℂ) (x : I → Spacetime)
    (y : J → Spacetime) (σ : PMatching m) (τ : SMatching (Unmatched σ) mb) : ℂ :=
  (∏ u : Unmatched σ, Sum.elim (fun _ => (1 : ℂ))
    (fun b : PLeg mb => K u.1.2.1 b.2.1 (y b.1 - x u.1.1)) (τ.1 (Sum.inl u))) *
  ∏ b : PLeg mb, Sum.elim (fun _ => (1 : ℂ))
    (fun b' : PLeg mb => if Fintype.equivFin J b.1 < Fintype.equivFin J b'.1 then
      K b.2.1 b'.2.1 (y b'.1 - y b.1) else 1) (τ.1 (Sum.inr b))

private theorem prod_extend_one {A : Type} [Fintype A] (p : A → Prop)
    [DecidablePred p] (f : {a // p a} → ℂ) :
    (∏ a, if h : p a then f ⟨a, h⟩ else 1) = ∏ a, f a := by
  rw [← Fintype.prod_subtype_mul_prod_subtype p]
  have hyes (a : {a // p a}) : (if h : p a.1 then f ⟨a.1, h⟩ else 1) = f a :=
    dif_pos a.2
  have hno (a : {a // ¬p a}) : (if h : p a.1 then f ⟨a.1, h⟩ else 1) = 1 :=
    dif_neg a.2
  simp_rw [hyes, hno]
  simp

private theorem fullTerm_join (K : Idx → Idx → Spacetime → ℂ) (x : I → Spacetime)
    (y : J → Spacetime) (σ : PMatching m) (τ : SMatching (Unmatched σ) mb) :
    fullTerm K x y (join σ τ) = internalProd K σ x * splitTerm K x y σ τ := by
  let f : PLeg m ⊕ PLeg mb → ℂ := fun l =>
    if rank (vertex l) < rank (vertex ((join σ τ).1 l)) then
      K (indices l) (indices ((join σ τ).1 l))
        (positions x y ((join σ τ).1 l) - positions x y l) else 1
  let g : PLeg m → ℂ := fun a =>
    if Fintype.equivFin I a.1 < Fintype.equivFin I (σ.1 a).1 then
      K a.2.1 (σ.1 a).2.1 (x (σ.1 a).1 - x a.1) else 1
  let u : Unmatched σ → ℂ := fun a => Sum.elim (fun _ => (1 : ℂ))
    (fun b : PLeg mb => K a.1.2.1 b.2.1 (y b.1 - x a.1.1)) (τ.1 (Sum.inl a))
  have hleft (a : PLeg m) : f (Sum.inl a) = g a * (if h : σ.1 a = a then u ⟨a, h⟩ else 1) := by
    by_cases ha : σ.1 a = a
    · obtain ⟨b, hb⟩ := τ.2.2.1 ⟨a, ha⟩
      have hr : (Fintype.equivFin I a.1).val <
          Fintype.card I + (Fintype.equivFin J b.1).val :=
        lt_of_lt_of_le (Fintype.equivFin I a.1).isLt (Nat.le_add_right _ _)
      simp [f, g, u, join, joinFun, ha, hb, embed, vertex, rank, indices, positions, hr]
    · simp [f, g, join, joinFun, ha, vertex, rank, indices, positions]
  have hright (b : PLeg mb) : f (Sum.inr b) = Sum.elim (fun _ => (1 : ℂ))
      (fun b' : PLeg mb => if Fintype.equivFin J b.1 < Fintype.equivFin J b'.1 then
        K b.2.1 b'.2.1 (y b'.1 - y b.1) else 1) (τ.1 (Sum.inr b)) := by
    cases hb : τ.1 (Sum.inr b) with
    | inl a =>
      have hr : ¬ Fintype.card I + (Fintype.equivFin J b.1).val <
          (Fintype.equivFin I a.1.1).val := by have := (Fintype.equivFin I a.1.1).isLt; omega
      simp [f, join, joinFun, hb, embed, vertex, rank, indices, positions, hr]
    | inr b' => simp [f, join, joinFun, hb, embed, vertex, rank, indices, positions]
  change (∏ l, f l) = _
  rw [Fintype.prod_sum_type]
  simp_rw [hleft, hright]
  rw [Finset.prod_mul_distrib, mul_assoc]
  apply congrArg ((∏ a, g a) * ·)
  apply congrArg (· * _)
  exact prod_extend_one (fun a : PLeg m => σ.1 a = a) u

/-- Changing which endpoint represents an edge does not change a symmetric product.
Adapted from the already completed `splitCorr_collapse` Work proof. -/
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

private def rawLegEquiv : PLeg m ⊕ PLeg mb ≃ PLeg (Sum.elim m mb) where
  toFun := Sum.elim (fun a => ⟨Sum.inl a.1, a.2⟩) (fun b => ⟨Sum.inr b.1, b.2⟩)
  invFun := fun l => match l with
    | ⟨Sum.inl i, a⟩ => Sum.inl ⟨i, a⟩
    | ⟨Sum.inr j, b⟩ => Sum.inr ⟨j, b⟩
  left_inv := by rintro (a | b) <;> rfl
  right_inv := by rintro ⟨(i | j), a⟩ <;> rfl

private def legEquiv : PLeg m ⊕ PLeg mb ≃
    Leg ((Sum.elim m mb) ∘ (Fintype.equivFin (I ⊕ J)).symm) :=
  rawLegEquiv.trans (Equiv.sigmaCongrLeft (Fintype.equivFin (I ⊕ J)).symm).symm

private theorem legEquiv_vertex (l : PLeg m ⊕ PLeg mb) :
    (legEquiv l).1 = Fintype.equivFin (I ⊕ J) (vertex l) := by
  cases l <;> rfl

private theorem legEquiv_idx (l : PLeg m ⊕ PLeg mb) :
    (legEquiv l).idx = indices l := by
  have hh (a b : I ⊕ J) (h : a = b) (t : ((Sum.elim m mb) a).ToType) :
      (h ▸ t).1 = t.1 := by subst h; rfl
  cases l with
  | inl a =>
    change (Eq.ndrec (a := Sum.inl a.1) (motive := fun v => ((Sum.elim m mb) v).ToType)
      a.2 ((Fintype.equivFin (I ⊕ J)).symm_apply_apply (Sum.inl a.1)).symm).1 = a.2.1
    rw [hh]
  | inr b =>
    change (Eq.ndrec (a := Sum.inr b.1) (motive := fun v => ((Sum.elim m mb) v).ToType)
      b.2 ((Fintype.equivFin (I ⊕ J)).symm_apply_apply (Sum.inr b.1)).symm).1 = b.2.1
    rw [hh]

private def matchingEquiv : Full m mb ≃
    Matching ((Sum.elim m mb) ∘ (Fintype.equivFin (I ⊕ J)).symm) :=
  (legEquiv (m := m) (mb := mb)).permCongr.subtypeEquiv (by
    intro φ
    simp only [Equiv.permCongr_apply]
    constructor
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        simp [hi]
      · intro l
        obtain ⟨l, rfl⟩ := (legEquiv (m := m) (mb := mb)).surjective l
        simp only [Equiv.symm_apply_apply, legEquiv_vertex]
        exact fun he => hv l ((Fintype.equivFin (I ⊕ J)).injective he)
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        have h := hi (legEquiv l)
        simpa using h
      · intro l
        have h := hv (legEquiv l)
        simp only [Equiv.symm_apply_apply, legEquiv_vertex] at h
        exact fun he => h (congrArg (Fintype.equivFin (I ⊕ J)) he))

private theorem term_reindex (K : Idx → Idx → Spacetime → ℂ)
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) (x : I → Spacetime)
    (y : J → Spacetime) (φ : Full m mb) :
    fullTerm K x y φ =
      ∏ l, if l.1 < ((matchingEquiv φ).1 l).1 then
        K l.idx ((matchingEquiv φ).1 l).idx
          ((Sum.elim x y) ((Fintype.equivFin (I ⊕ J)).symm ((matchingEquiv φ).1 l).1) -
            (Sum.elim x y) ((Fintype.equivFin (I ⊕ J)).symm l.1)) else 1 := by
  let f : PLeg m ⊕ PLeg mb → ℂ := fun l =>
    K (indices l) (indices (φ.1 l)) (positions x y (φ.1 l) - positions x y l)
  let p : PLeg m ⊕ PLeg mb → Prop := fun l => rank (vertex l) < rank (vertex (φ.1 l))
  let q : PLeg m ⊕ PLeg mb → Prop := fun l =>
    Fintype.equivFin (I ⊕ J) (vertex l) < Fintype.equivFin (I ⊕ J) (vertex (φ.1 l))
  have hp : ∀ l, p (φ.1 l) ↔ ¬ p l := by
    intro l
    dsimp [p]
    rw [φ.2.1]
    have hn : rank (vertex (φ.1 l)) ≠ rank (vertex l) :=
      fun h => φ.2.2 l (rank_injective h)
    omega
  have hq : ∀ l, q (φ.1 l) ↔ ¬ q l := by
    intro l
    dsimp [q]
    rw [φ.2.1]
    have hn := (Fintype.equivFin (I ⊕ J)).injective.ne (φ.2.2 l)
    exact ⟨not_lt_of_gt, fun h => lt_of_le_of_ne (le_of_not_gt h) hn⟩
  have hf : ∀ l, f (φ.1 l) = f l := by
    intro l
    dsimp [f]
    rw [φ.2.1, hK, neg_sub]
  change (∏ l, if p l then f l else 1) = _
  rw [orient_prod φ.1 φ.2.1 p q hp hq f hf]
  apply Fintype.prod_equiv (legEquiv (m := m) (mb := mb))
  intro l
  have ht : (matchingEquiv φ).1 (legEquiv l) = legEquiv (φ.1 l) := by
    change legEquiv (φ.1 (legEquiv.symm (legEquiv l))) = _
    rw [Equiv.symm_apply_apply]
  rw [ht, legEquiv_vertex, legEquiv_vertex, legEquiv_idx, legEquiv_idx]
  simp only [Equiv.symm_apply_apply]
  have hx : ∀ l : PLeg m ⊕ PLeg mb, (Sum.elim x y) (vertex l) = positions x y l := by
    intro l; cases l <;> rfl
  simp only [hx]
  rfl

private theorem grouped_eq_sum (K : Idx → Idx → Spacetime → ℂ)
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) (m : I → Mon) (x : I → Spacetime)
    (mb : J → Mon) (y : J → Spacetime) :
    gwickGrouped K m x mb y = ∑ φ : Full m mb, fullTerm K x y φ := by
  unfold gwickGrouped wickSum
  symm
  apply Fintype.sum_equiv matchingEquiv
  intro φ
  exact term_reindex K hK x y φ

private theorem sum_equiv_sigma {A C : Type} {B : A → Type} [Fintype A]
    [∀ a, Fintype (B a)] [Fintype C] (e : (Σ a, B a) ≃ C) (F : C → ℂ) :
    (∑ c, F c) = ∑ a, ∑ b, F (e ⟨a, b⟩) :=
  (e.sum_comp F).symm.trans (Fintype.sum_sigma _)

private theorem decomp_sum (F : Full m mb → ℂ) :
    (∑ φ, F φ) = ∑ σ : PMatching m, ∑ τ : SMatching (Unmatched σ) mb, F (join σ τ) := by
  exact sum_equiv_sigma (A := PMatching m) (B := fun σ => SMatching (Unmatched σ) mb)
    (C := Full m mb) (decompEquiv (m := m) (mb := mb)) F

private theorem sum_fullTerm_join (K : Idx → Idx → Spacetime → ℂ)
    (x : I → Spacetime) (y : J → Spacetime) (σ : PMatching m) :
    (∑ τ : SMatching (Unmatched σ) mb, fullTerm K x y (join σ τ)) =
      internalProd K σ x *
        splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e : Unmatched σ => x e.1.1) mb y := by
  unfold splitCorr
  rw [Finset.mul_sum]
  apply Finset.sum_congr
  · ext τ
    simp only [Finset.mem_univ]
  intro τ _
  exact fullTerm_join K x y σ τ

end FactorProof

variable {I J : Type}

theorem gwickGrouped_factor' {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) [Fintype I] [Fintype J] (m : I → Mon)
    (x : I → Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    gwickGrouped K m x mb y =
      ∑ σ : PMatching m, internalProd K σ x *
        splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e : Unmatched σ => x e.1.1) mb y := by
  refine (FactorProof.grouped_eq_sum K hK m x mb y).trans
    ((FactorProof.decomp_sum (m := m) (mb := mb)
      (FactorProof.fullTerm K x y)).trans ?_)
  exact Finset.sum_congr rfl (fun σ _ => FactorProof.sum_fullTerm_join K x y σ)

end YangMills.FreeField.Consolidated.OPE_GwickGroupedFactor

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-- [HARD, 1200 lines] **Factorisation.** Split every matching of the legs of `m` and `mb` into
its lines inside the cluster `I` (a partial matching `σ`) and the rest (a matching of the
unmatched cluster legs and the spectator legs with no line inside the unmatched cluster legs).
Purely combinatorial; `hK` is used only to re-orient lines (the enumerations of `I`, `J` and
`I ⊕ J` need not be compatible). No condition on the points. -/
theorem gwickGrouped_factor {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) [Fintype I] [Fintype J] (m : I → Mon)
    (x : I → Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    gwickGrouped K m x mb y =
      ∑ σ : PMatching m, internalProd K σ x *
        splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e : Unmatched σ => x e.1.1) mb y := by
  exact Consolidated.OPE_GwickGroupedFactor.gwickGrouped_factor' hK m x mb y

end YangMills.FreeField
