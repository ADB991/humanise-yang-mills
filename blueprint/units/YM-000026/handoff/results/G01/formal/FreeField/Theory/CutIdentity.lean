import FreeField.Theory.Base
import FreeField.Analytic.MatchingIntegrable
import FreeField.Theory.OpenAmpWMemLp

/-! Proofs consolidated from `FreeField/Work/cut_identity.lean`. -/

set_option autoImplicit false
noncomputable section

namespace YangMills.FreeField.Consolidated.Theory_CutIdentity
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

namespace CutIdentity

/-! The following correspondence uses the actual leg types, rather than their
multi-indices. In particular, equal entries in a `Multiset.ToType` remain distinct. -/

abbrev Pairing (A : Type) := {s : A → A // Involutive s}

abbrev OpenPairing (J A : Type) :=
  {s : Pairing (J ⊕ A) // ∀ j, ∃ a, s.1 (Sum.inl j) = Sum.inr a}

variable {J A B : Type}

def attach (s : OpenPairing J A) (j : J) : A := (s.2 j).choose

@[simp] theorem partner_slot (s : OpenPairing J A) (j : J) :
    s.1.1 (Sum.inl j) = Sum.inr (attach s j) := (s.2 j).choose_spec

@[simp] theorem partner_attach (s : OpenPairing J A) (j : J) :
    s.1.1 (Sum.inr (attach s j)) = Sum.inl j := by
  rw [← partner_slot]
  exact s.1.2 _

theorem attach_injective (s : OpenPairing J A) : Injective (attach s) := by
  intro i j h
  apply Sum.inl_injective
  rw [← partner_attach s i, ← partner_attach s j, h]

def glueFun (s : OpenPairing J A) (t : OpenPairing J B) : A ⊕ B → A ⊕ B
  | Sum.inl a => Sum.elim (fun j => Sum.inr (attach t j)) Sum.inl (s.1.1 (Sum.inr a))
  | Sum.inr b => Sum.elim (fun j => Sum.inl (attach s j)) Sum.inr (t.1.1 (Sum.inr b))

@[simp] theorem glueFun_attach_left (s : OpenPairing J A) (t : OpenPairing J B) (j : J) :
    glueFun s t (Sum.inl (attach s j)) = Sum.inr (attach t j) := by
  simp [glueFun]

@[simp] theorem glueFun_attach_right (s : OpenPairing J A) (t : OpenPairing J B) (j : J) :
    glueFun s t (Sum.inr (attach t j)) = Sum.inl (attach s j) := by
  simp [glueFun]

theorem glueFun_involutive (s : OpenPairing J A) (t : OpenPairing J B) :
    Involutive (glueFun s t) := by
  intro x
  cases x with
  | inl a =>
    cases h : s.1.1 (Sum.inr a) with
    | inl j =>
      have ha : attach s j = a := by
        have h' := s.1.2 (Sum.inr a)
        simpa [h] using h'
      simp [glueFun, h, ha]
    | inr a' =>
      have h' : s.1.1 (Sum.inr a') = Sum.inr a := by
        simpa [h] using s.1.2 (Sum.inr a)
      simp [glueFun, h, h']
  | inr b =>
    cases h : t.1.1 (Sum.inr b) with
    | inl j =>
      have hb : attach t j = b := by
        have h' := t.1.2 (Sum.inr b)
        simpa [h] using h'
      simp [glueFun, h, hb]
    | inr b' =>
      have h' : t.1.1 (Sum.inr b') = Sum.inr b := by
        simpa [h] using t.1.2 (Sum.inr b)
      simp [glueFun, h, h']

def glue (s : OpenPairing J A) (t : OpenPairing J B) : Pairing (A ⊕ B) :=
  ⟨glueFun s t, glueFun_involutive s t⟩

abbrev Crossing (s : Pairing (A ⊕ B)) := {a : A // ∃ b, s.1 (Sum.inl a) = Sum.inr b}

def crossingMate (s : Pairing (A ⊕ B)) (a : Crossing s) : B := a.2.choose

@[simp] theorem partner_crossing (s : Pairing (A ⊕ B)) (a : Crossing s) :
    s.1 (Sum.inl a.1) = Sum.inr (crossingMate s a) := a.2.choose_spec

@[simp] theorem partner_crossingMate (s : Pairing (A ⊕ B)) (a : Crossing s) :
    s.1 (Sum.inr (crossingMate s a)) = Sum.inl a.1 := by
  rw [← partner_crossing]
  exact s.2 _

def glueCrossing (s : OpenPairing J A) (t : OpenPairing J B) (j : J) :
    Crossing (glue s t) :=
  ⟨attach s j, attach t j, glueFun_attach_left s t j⟩

theorem glueCrossing_bijective (s : OpenPairing J A) (t : OpenPairing J B) :
    Bijective (glueCrossing s t) := by
  constructor
  · intro i j h
    exact attach_injective s (congrArg Subtype.val h)
  · rintro ⟨a, b, hab⟩
    change glueFun s t (Sum.inl a) = Sum.inr b at hab
    cases h : s.1.1 (Sum.inr a) with
    | inl j =>
      refine ⟨j, Subtype.ext ?_⟩
      have h' := s.1.2 (Sum.inr a)
      simpa [glueCrossing, h] using h'
    | inr a' => simp [glueFun, h] at hab

def glueSlots (s : OpenPairing J A) (t : OpenPairing J B) : J ≃ Crossing (glue s t) :=
  Equiv.ofBijective (glueCrossing s t) (glueCrossing_bijective s t)

def cutLeftFun (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) : J ⊕ A → J ⊕ A
  | Sum.inl j => Sum.inr (e j).1
  | Sum.inr a => match h : s.1 (Sum.inl a) with
    | Sum.inl a' => Sum.inr a'
    | Sum.inr b => Sum.inl (e.symm ⟨a, b, h⟩)

@[simp] theorem cutLeftFun_slot (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (j : J) :
    cutLeftFun s e (Sum.inl j) = Sum.inr (e j).1 := rfl

theorem cutLeftFun_internal (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (a a' : A)
    (h : s.1 (Sum.inl a) = Sum.inl a') :
    cutLeftFun s e (Sum.inr a) = Sum.inr a' := by
  simp only [cutLeftFun]
  split <;> rename_i h' <;> simp_all

@[simp] theorem cutLeftFun_crossing (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s)
    (a : Crossing s) : cutLeftFun s e (Sum.inr a.1) = Sum.inl (e.symm a) := by
  have h := partner_crossing s a
  simp only [cutLeftFun]
  split <;> rename_i h' <;> simp_all

theorem cutLeftFun_involutive (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) :
    Involutive (cutLeftFun s e) := by
  intro x
  cases x with
  | inl j => simp
  | inr a =>
    cases h : s.1 (Sum.inl a) with
    | inl a' =>
      have h' : s.1 (Sum.inl a') = Sum.inl a := by simpa [h] using s.2 (Sum.inl a)
      rw [cutLeftFun_internal s e a a' h, cutLeftFun_internal s e a' a h']
    | inr b =>
      let c : Crossing s := ⟨a, b, h⟩
      change cutLeftFun s e (cutLeftFun s e (Sum.inr c.1)) = _
      rw [cutLeftFun_crossing, cutLeftFun_slot, Equiv.apply_symm_apply]

def cutLeft (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) : OpenPairing J A :=
  ⟨⟨cutLeftFun s e, cutLeftFun_involutive s e⟩, fun j => ⟨(e j).1, rfl⟩⟩

def cutRightFun (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) : J ⊕ B → J ⊕ B
  | Sum.inl j => Sum.inr (crossingMate s (e j))
  | Sum.inr b => match h : s.1 (Sum.inr b) with
    | Sum.inl a => Sum.inl (e.symm ⟨a, b, by simpa [h] using s.2 (Sum.inr b)⟩)
    | Sum.inr b' => Sum.inr b'

@[simp] theorem cutRightFun_slot (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (j : J) :
    cutRightFun s e (Sum.inl j) = Sum.inr (crossingMate s (e j)) := rfl

theorem cutRightFun_internal (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (b b' : B)
    (h : s.1 (Sum.inr b) = Sum.inr b') :
    cutRightFun s e (Sum.inr b) = Sum.inr b' := by
  simp only [cutRightFun]
  split <;> rename_i h' <;> simp_all

@[simp] theorem cutRightFun_crossing (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s)
    (a : Crossing s) : cutRightFun s e (Sum.inr (crossingMate s a)) =
      Sum.inl (e.symm a) := by
  have h := partner_crossingMate s a
  simp only [cutRightFun]
  split <;> rename_i h' <;> simp_all

theorem cutRightFun_involutive (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) :
    Involutive (cutRightFun s e) := by
  intro x
  cases x with
  | inl j => simp
  | inr b =>
    cases h : s.1 (Sum.inr b) with
    | inr b' =>
      have h' : s.1 (Sum.inr b') = Sum.inr b := by simpa [h] using s.2 (Sum.inr b)
      rw [cutRightFun_internal s e b b' h, cutRightFun_internal s e b' b h']
    | inl a =>
      have h' : s.1 (Sum.inl a) = Sum.inr b := by simpa [h] using s.2 (Sum.inr b)
      let c : Crossing s := ⟨a, b, h'⟩
      have hc : crossingMate s c = b := by
        apply Sum.inr_injective
        rw [← partner_crossing, h']
      rw [← hc]
      simp

def cutRight (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) : OpenPairing J B :=
  ⟨⟨cutRightFun s e, cutRightFun_involutive s e⟩, fun j => ⟨crossingMate s (e j), rfl⟩⟩

@[simp] theorem attach_cutLeft (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (j : J) :
    attach (cutLeft s e) j = (e j).1 := by
  apply Sum.inr_injective
  exact (partner_slot (cutLeft s e) j).symm

@[simp] theorem attach_cutRight (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) (j : J) :
    attach (cutRight s e) j = crossingMate s (e j) := by
  apply Sum.inr_injective
  exact (partner_slot (cutRight s e) j).symm

theorem crossingMate_mk (s : Pairing (A ⊕ B)) (a : A) (b : B)
    (h : s.1 (Sum.inl a) = Sum.inr b) : crossingMate s ⟨a, b, h⟩ = b := by
  apply Sum.inr_injective
  exact (partner_crossing s ⟨a, b, h⟩).symm.trans h

@[simp] theorem glue_cut (s : Pairing (A ⊕ B)) (e : J ≃ Crossing s) :
    glue (cutLeft s e) (cutRight s e) = s := by
  apply Subtype.ext
  funext x
  cases x with
  | inl a =>
    cases h : s.1 (Sum.inl a) with
    | inl a' =>
      change Sum.elim _ _ (cutLeftFun s e (Sum.inr a)) = _
      rw [cutLeftFun_internal s e a a' h]
      rfl
    | inr b =>
      change Sum.elim _ _ (cutLeftFun s e (Sum.inr a)) = _
      rw [cutLeftFun_crossing s e ⟨a, b, h⟩]
      simp [crossingMate_mk, h]
  | inr b =>
    cases h : s.1 (Sum.inr b) with
    | inr b' =>
      change Sum.elim _ _ (cutRightFun s e (Sum.inr b)) = _
      rw [cutRightFun_internal s e b b' h]
      rfl
    | inl a =>
      change Sum.elim _ _ (cutRightFun s e (Sum.inr b)) = _
      simp only [cutRightFun]
      split <;> rename_i h' <;> simp_all

@[simp] theorem glueSlots_val (s : OpenPairing J A) (t : OpenPairing J B) (j : J) :
    (glueSlots s t j).1 = attach s j := rfl

@[simp] theorem crossingMate_glueSlots (s : OpenPairing J A) (t : OpenPairing J B) (j : J) :
    crossingMate (glue s t) (glueSlots s t j) = attach t j := by
  apply Sum.inr_injective
  rw [← partner_crossing]
  exact glueFun_attach_left s t j

@[simp] theorem cutLeft_glue (s : OpenPairing J A) (t : OpenPairing J B) :
    cutLeft (glue s t) (glueSlots s t) = s := by
  apply Subtype.ext
  apply Subtype.ext
  funext x
  change cutLeftFun (glue s t) (glueSlots s t) x = s.1.1 x
  cases x with
  | inl j => simp
  | inr a =>
    cases h : s.1.1 (Sum.inr a) with
    | inr a' =>
      apply cutLeftFun_internal
      simp [glue, glueFun, h]
    | inl j =>
      have ha : attach s j = a := by simpa [h] using s.1.2 (Sum.inr a)
      rw [← ha]
      change cutLeftFun (glue s t) (glueSlots s t) (Sum.inr (glueSlots s t j).1) = _
      rw [cutLeftFun_crossing, Equiv.symm_apply_apply]

@[simp] theorem cutRight_glue (s : OpenPairing J A) (t : OpenPairing J B) :
    cutRight (glue s t) (glueSlots s t) = t := by
  apply Subtype.ext
  apply Subtype.ext
  funext x
  change cutRightFun (glue s t) (glueSlots s t) x = t.1.1 x
  cases x with
  | inl j => simp
  | inr b =>
    cases h : t.1.1 (Sum.inr b) with
    | inr b' =>
      apply cutRightFun_internal
      simp [glue, glueFun, h]
    | inl j =>
      have hb : attach t j = b := by simpa [h] using t.1.2 (Sum.inr b)
      rw [← hb, ← crossingMate_glueSlots s t j]
      rw [cutRightFun_crossing, Equiv.symm_apply_apply]

abbrev LabeledPairing (J A B : Type) := Σ s : Pairing (A ⊕ B), J ≃ Crossing s

def cutPair (d : LabeledPairing J A B) : OpenPairing J A × OpenPairing J B :=
  (cutLeft d.1 d.2, cutRight d.1 d.2)

theorem cutPair_injective : Injective (cutPair : LabeledPairing J A B → _) := by
  rintro ⟨s, e⟩ ⟨s', e'⟩ h
  have hl : cutLeft s e = cutLeft s' e' := congrArg Prod.fst h
  have hr : cutRight s e = cutRight s' e' := congrArg Prod.snd h
  have hs : s = s' := by
    rw [← glue_cut s e, ← glue_cut s' e', hl, hr]
  cases hs
  have he : e = e' := by
    ext j
    rw [← attach_cutLeft s e j, ← attach_cutLeft s e' j, hl]
  cases he
  rfl

/-- A pair of open pairings is exactly a closed pairing with a common labelling
of its crossing lines. There is one labelling, not two independent labellings. -/
def gluingEquiv : (OpenPairing J A × OpenPairing J B) ≃ LabeledPairing J A B where
  toFun p := ⟨glue p.1 p.2, glueSlots p.1 p.2⟩
  invFun := cutPair
  left_inv p := by rcases p with ⟨s, t⟩; simp [cutPair]
  right_inv d := by
    apply cutPair_injective
    simp [cutPair]

theorem glue_left_internal_iff (s : OpenPairing J A) (t : OpenPairing J B) (a a' : A) :
    (glue s t).1 (Sum.inl a) = Sum.inl a' ↔ s.1.1 (Sum.inr a) = Sum.inr a' := by
  cases h : s.1.1 (Sum.inr a) <;> simp [glue, glueFun, h]

theorem glue_right_internal_iff (s : OpenPairing J A) (t : OpenPairing J B) (b b' : B) :
    (glue s t).1 (Sum.inr b) = Sum.inr b' ↔ t.1.1 (Sum.inr b) = Sum.inr b' := by
  cases h : t.1.1 (Sum.inr b) <;> simp [glue, glueFun, h]

variable {V W : Type}

def NoSelfOpen (vtx : A → V) (s : OpenPairing J A) : Prop :=
  ∀ a a', s.1.1 (Sum.inr a) = Sum.inr a' → vtx a' ≠ vtx a

def NoSelfClosed (avtx : A → V) (bvtx : B → W) (s : Pairing (A ⊕ B)) : Prop :=
  (∀ a a', s.1 (Sum.inl a) = Sum.inl a' → avtx a' ≠ avtx a) ∧
  (∀ b b', s.1 (Sum.inr b) = Sum.inr b' → bvtx b' ≠ bvtx b)

theorem noSelf_glue_iff (avtx : A → V) (bvtx : B → W)
    (s : OpenPairing J A) (t : OpenPairing J B) :
    NoSelfClosed avtx bvtx (glue s t) ↔ NoSelfOpen avtx s ∧ NoSelfOpen bvtx t := by
  simp only [NoSelfClosed, NoSelfOpen, glue_left_internal_iff, glue_right_internal_iff]

abbrev AdmissibleOpen (J : Type) (vtx : A → V) := {s : OpenPairing J A // NoSelfOpen vtx s}

abbrev AdmissibleClosed (avtx : A → V) (bvtx : B → W) :=
  {s : Pairing (A ⊕ B) // NoSelfClosed avtx bvtx s}

/-- The same bijection with the normal-ordering constraint imposed on both sides. -/
def admissibleGluingEquiv (avtx : A → V) (bvtx : B → W) :
    (AdmissibleOpen J avtx × AdmissibleOpen J bvtx) ≃
      Σ s : AdmissibleClosed avtx bvtx, J ≃ Crossing s.1 :=
  (Equiv.subtypeProdEquivProd (p := NoSelfOpen avtx) (q := NoSelfOpen bvtx)).symm |>.trans
    ((gluingEquiv (J := J) (A := A) (B := B)).subtypeEquiv
      (fun p => (noSelf_glue_iff avtx bvtx p.1 p.2).symm)) |>.trans
    (Equiv.subtypeSigmaEquiv (fun s : Pairing (A ⊕ B) => J ≃ Crossing s)
      (NoSelfClosed avtx bvtx))

def ofOMatching {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    AdmissibleOpen (Fin k) (fun a : Leg m => a.1) := by
  refine ⟨⟨⟨σ.1, σ.2.1⟩, ?_⟩, ?_⟩
  · intro j
    cases h : σ.1 (Sum.inl j) with
    | inl j' => exact False.elim (σ.2.2 (Sum.inl j) (by simp [h, ovtx]))
    | inr a => exact ⟨a, h⟩
  · intro a a' h hvertex
    change σ.1 (Sum.inr a) = Sum.inr a' at h
    change a'.1 = a.1 at hvertex
    exact σ.2.2 (Sum.inr a) (by simp [ovtx, h, hvertex])

def toOMatching {n k : ℕ} {m : Fin n → Mon}
    (s : AdmissibleOpen (Fin k) (fun a : Leg m => a.1)) : OMatching k m := by
  refine ⟨s.1.1.2.toPerm s.1.1.1, s.1.1.2, ?_⟩
  intro x
  change ovtx (s.1.1.1 x) ≠ ovtx x
  cases x with
  | inl j =>
    rw [partner_slot]
    simp [ovtx]
  | inr a =>
    cases h : s.1.1.1 (Sum.inr a) with
    | inl j =>
      intro hzero
      have hval := congrArg Fin.val hzero
      change 0 = a.1.val + 1 at hval
      omega
    | inr a' =>
      intro hvertex
      exact s.2 a a' h (Fin.succ_injective n hvertex)

/-- Identify the library's open matchings, including all occurrence information,
with the admissible open pairings used in the gluing equivalence. -/
def oMatchingEquiv {n : ℕ} (k : ℕ) (m : Fin n → Mon) :
    OMatching k m ≃ AdmissibleOpen (Fin k) (fun a : Leg m => a.1) where
  toFun := ofOMatching
  invFun := toOMatching
  left_inv σ := by apply Subtype.ext; apply Equiv.ext; intro x; rfl
  right_inv s := by apply Subtype.ext; apply Subtype.ext; apply Subtype.ext; rfl

def oMatchingGluingEquiv {n r : ℕ} (k : ℕ) (m : Fin n → Mon) (l : Fin r → Mon) :
    (OMatching k m × OMatching k l) ≃
      Σ s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1),
        Fin k ≃ Crossing s.1 :=
  (Equiv.prodCongr (oMatchingEquiv k m) (oMatchingEquiv k l)).trans
    (admissibleGluingEquiv (fun a : Leg m => a.1) (fun b : Leg l => b.1))

def cutVertexEquiv (n r : ℕ) : Fin n ⊕ Fin r ≃ Fin (n + r) :=
  (Equiv.sumCongr Fin.revPerm (Equiv.refl _)).trans finSumFinEquiv

/-- The left word is reversed when it appears on the closed side of the cut. -/
def cutMon {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon) : Fin (n + r) → Mon :=
  fun i => Sum.elim m l ((cutVertexEquiv n r).symm i)

/-- Transport occurrences by preserving the multi-index and transporting only
its occurrence number. This avoids identifying repeated multi-indices. -/
def occurrenceEquiv {m l : Mon} (h : m = l) : m.ToType ≃ l.ToType :=
  Equiv.sigmaCongrRight fun α => finCongr (congrArg (Multiset.count α) h)

def cutLegEquiv {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon) :
    Leg m ⊕ Leg l ≃ Leg (cutMon m l) :=
  (Equiv.sumSigmaDistrib (fun i : Fin n ⊕ Fin r => (Sum.elim m l i).ToType)).symm |>.trans
    (Equiv.sigmaCongr (cutVertexEquiv n r) fun i => occurrenceEquiv (by simp [cutMon]))

@[simp] theorem cutLegEquiv_vertex {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon)
    (a : Leg m ⊕ Leg l) :
    (cutLegEquiv m l a).1 = cutVertexEquiv n r (Sum.map Sigma.fst Sigma.fst a) := by
  cases a <;> rfl

@[simp] theorem cutLegEquiv_idx {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon)
    (a : Leg m ⊕ Leg l) :
    (cutLegEquiv m l a).idx = Sum.elim Leg.idx Leg.idx a := by
  cases a <;> rfl

theorem noSelfClosed_iff (avtx : A → V) (bvtx : B → W) (s : Pairing (A ⊕ B)) :
    NoSelfClosed avtx bvtx s ↔
      ∀ x, Sum.map avtx bvtx (s.1 x) ≠ Sum.map avtx bvtx x := by
  constructor
  · rintro ⟨ha, hb⟩ (a | b)
    · cases h : s.1 (Sum.inl a) with
      | inl a' => simpa using ha a a' h
      | inr b => simp
    · cases h : s.1 (Sum.inr b) with
      | inl a => simp
      | inr b' => simpa using hb b b' h
  · intro h
    constructor
    · intro a a' ha hv
      exact h (Sum.inl a) (by simp [ha, hv])
    · intro b b' hb hv
      exact h (Sum.inr b) (by simp [hb, hv])

def closedToMatching {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1)) :
    Matching (cutMon m l) := by
  let e := cutLegEquiv m l
  let f : Leg (cutMon m l) → Leg (cutMon m l) := fun x => e (s.1.1 (e.symm x))
  have hf : Involutive f := by
    intro x
    dsimp [f]
    rw [Equiv.symm_apply_apply, s.1.2, Equiv.apply_symm_apply]
  refine ⟨hf.toPerm f, hf, ?_⟩
  intro x hx
  obtain ⟨y, rfl⟩ := e.surjective x
  change (e (s.1.1 (e.symm (e y)))).1 = (e y).1 at hx
  rw [Equiv.symm_apply_apply] at hx
  have h := (noSelfClosed_iff _ _ s.1).mp s.2 y
  exact h ((cutVertexEquiv n r).injective (by simpa [e] using hx))

def matchingToClosed {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : Matching (cutMon m l)) :
    AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1) := by
  let e := cutLegEquiv m l
  let f : Leg m ⊕ Leg l → Leg m ⊕ Leg l := fun x => e.symm (σ.1 (e x))
  have hf : Involutive f := by
    intro x
    dsimp [f]
    rw [Equiv.apply_symm_apply, σ.2.1, Equiv.symm_apply_apply]
  refine ⟨⟨f, hf⟩, (noSelfClosed_iff _ _ _).mpr ?_⟩
  intro x hx
  apply σ.2.2 (e x)
  have hv := congrArg (cutVertexEquiv n r) hx
  change cutVertexEquiv n r (Sum.map Sigma.fst Sigma.fst (f x)) =
    cutVertexEquiv n r (Sum.map Sigma.fst Sigma.fst x) at hv
  rw [← cutLegEquiv_vertex, ← cutLegEquiv_vertex] at hv
  simpa [e, f] using hv

def closedMatchingEquiv {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon) :
    AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1) ≃
      Matching (cutMon m l) where
  toFun := closedToMatching
  invFun := matchingToClosed
  left_inv s := by
    apply Subtype.ext
    apply Subtype.ext
    funext x
    simp [closedToMatching, matchingToClosed]
  right_inv σ := by
    apply Subtype.ext
    apply Equiv.ext
    intro x
    simp [closedToMatching, matchingToClosed]

theorem card_labellings (C : Type) [Fintype C] [DecidableEq C] (k : ℕ) :
    Fintype.card (Fin k ≃ C) =
      if Fintype.card C = k then k.factorial else 0 := by
  by_cases h : Fintype.card C = k
  · rw [if_pos h]
    let e : Fin k ≃ C := Fintype.equivOfCardEq (by simp [h])
    simpa using Fintype.card_equiv e
  · rw [if_neg h]
    haveI : IsEmpty (Fin k ≃ C) := ⟨fun e => h (by
      simpa using (Fintype.card_congr e).symm)⟩
    exact Fintype.card_of_isEmpty

/-- Exact multiplicity of the gluing operation, as a finite-sum identity. -/
theorem sum_glue [Fintype A] [Fintype B] (k : ℕ) (F : Pairing (A ⊕ B) → ℂ) :
    (∑ s : OpenPairing (Fin k) A, ∑ t : OpenPairing (Fin k) B, F (glue s t)) =
      (k.factorial : ℂ) *
        ∑ s : Pairing (A ⊕ B), if Fintype.card (Crossing s) = k then F s else 0 := by
  have h := (gluingEquiv (J := Fin k) (A := A) (B := B)).sum_comp
    (fun d : LabeledPairing (Fin k) A B => F d.1)
  change (∑ p : OpenPairing (Fin k) A × OpenPairing (Fin k) B, F (glue p.1 p.2)) =
    ∑ d : LabeledPairing (Fin k) A B, F d.1 at h
  rw [Fintype.sum_prod_type, Fintype.sum_sigma] at h
  rw [h, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro s _
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  change (Fintype.card (Fin k ≃ Crossing s) : ℂ) * F s = _
  rw [card_labellings]
  split_ifs <;> simp

def gluedMatching {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) : Matching (cutMon m l) :=
  closedMatchingEquiv m l ((oMatchingGluingEquiv k m l (σ, τ)).1)

theorem gluedMatching_apply {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : Leg m ⊕ Leg l) :
    (gluedMatching σ τ).1 (cutLegEquiv m l a) =
      cutLegEquiv m l (glueFun (ofOMatching σ).1 (ofOMatching τ).1 a) := by
  change cutLegEquiv m l (glueFun (ofOMatching σ).1 (ofOMatching τ).1
    ((cutLegEquiv m l).symm (cutLegEquiv m l a))) = _
  rw [Equiv.symm_apply_apply]

@[simp] theorem cutVertexEquiv_inl (n r : ℕ) (i : Fin n) :
    cutVertexEquiv n r (Sum.inl i) = i.rev.castAdd r := rfl

@[simp] theorem cutVertexEquiv_inr (n r : ℕ) (i : Fin r) :
    cutVertexEquiv n r (Sum.inr i) = i.natAdd n := rfl

theorem cutLeg_left_lt_iff {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon)
    (a a' : Leg m) :
    (cutLegEquiv m l (Sum.inl a)).1 < (cutLegEquiv m l (Sum.inl a')).1 ↔ a'.1 < a.1 := by
  simp only [cutLegEquiv_vertex, Sum.map_inl, cutVertexEquiv_inl]
  change a.1.rev < a'.1.rev ↔ a'.1 < a.1
  exact Fin.rev_lt_rev

theorem cutLeg_right_lt_iff {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon)
    (b b' : Leg l) :
    (cutLegEquiv m l (Sum.inr b)).1 < (cutLegEquiv m l (Sum.inr b')).1 ↔ b.1 < b'.1 := by
  simp only [cutLegEquiv_vertex, Sum.map_inr, cutVertexEquiv_inr]
  change n + b.1.val < n + b'.1.val ↔ b.1.val < b'.1.val
  omega

theorem cutLeg_left_lt_right {n r : ℕ} (m : Fin n → Mon) (l : Fin r → Mon)
    (a : Leg m) (b : Leg l) :
    (cutLegEquiv m l (Sum.inl a)).1 < (cutLegEquiv m l (Sum.inr b)).1 := by
  simp only [cutLegEquiv_vertex, Sum.map_inl, Sum.map_inr,
    cutVertexEquiv_inl, cutVertexEquiv_inr]
  change a.1.rev.val < n + b.1.val
  have := a.1.rev.isLt
  omega

theorem internalPartner_exists {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) : ∃ b : Leg m, σ.1 (Sum.inr a.1) = Sum.inr b := by
  cases h : σ.1 (Sum.inr a.1) with
  | inr b => exact ⟨b, rfl⟩
  | inl j =>
    have ha := a.2
    rw [h] at ha
    change a.1.1.succ < (0 : Fin (n + 1)) at ha
    exact False.elim (not_lt_of_ge (Fin.zero_le _) ha)

def internalPartner {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) : Leg m := (internalPartner_exists σ a).choose

@[simp] theorem internalPartner_spec {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) : σ.1 (Sum.inr a.1) = Sum.inr (internalPartner σ a) :=
  (internalPartner_exists σ a).choose_spec

@[simp] theorem internalPartner_partner {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) : σ.1 (Sum.inr (internalPartner σ a)) = Sum.inr a.1 := by
  rw [← internalPartner_spec]
  exact σ.2.1 _

theorem internalPartner_lt {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) : a.1.1 < (internalPartner σ a).1 := by
  have h := a.2
  rw [internalPartner_spec] at h
  change a.1.1.val + 1 < (internalPartner σ a).1.val + 1 at h
  change a.1.1.val < (internalPartner σ a).1.val
  omega

def leftLine {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) : Line (gluedMatching σ τ) := by
  refine ⟨cutLegEquiv m l (Sum.inl (internalPartner σ a)), ?_⟩
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.inl (internalPartner σ a))).1 <
    (cutLegEquiv m l (Sum.elim _ _ (σ.1 (Sum.inr (internalPartner σ a))))).1
  rw [internalPartner_partner]
  exact (cutLeg_left_lt_iff m l _ _).mpr (internalPartner_lt σ a)

def rightLine {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (b : ILine τ) : Line (gluedMatching σ τ) := by
  refine ⟨cutLegEquiv m l (Sum.inr b.1), ?_⟩
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.inr b.1)).1 <
    (cutLegEquiv m l (Sum.elim _ _ (τ.1 (Sum.inr b.1)))).1
  rw [internalPartner_spec]
  exact (cutLeg_right_lt_iff m l _ _).mpr (internalPartner_lt τ b)

def crossingLine {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) : Line (gluedMatching σ τ) := by
  refine ⟨cutLegEquiv m l (Sum.inl (attach (ofOMatching σ).1 j)), ?_⟩
  rw [gluedMatching_apply, glueFun_attach_left]
  exact cutLeg_left_lt_right m l _ _

theorem internalPartner_injective {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    Injective (internalPartner σ) := by
  intro a b h
  apply Subtype.ext
  apply Sum.inr_injective
  rw [← internalPartner_partner σ a, ← internalPartner_partner σ b, h]

theorem internalPartner_ne_attach {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (a : ILine σ) (j : Fin k) : internalPartner σ a ≠ attach (ofOMatching σ).1 j := by
  intro h
  have h' := internalPartner_partner σ a
  rw [h] at h'
  change (ofOMatching σ).1.1.1 (Sum.inr (attach (ofOMatching σ).1 j)) = Sum.inr a.1 at h'
  rw [partner_attach] at h'
  cases h'

def lineGlue {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) :
    (ILine σ ⊕ ILine τ) ⊕ Fin k → Line (gluedMatching σ τ) :=
  Sum.elim (Sum.elim (leftLine σ τ) (rightLine σ τ)) (crossingLine σ τ)

theorem lineGlue_injective {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) : Injective (lineGlue σ τ) := by
  rintro ((a | b) | j) ((a' | b') | j') h
  all_goals
    have hval := (cutLegEquiv m l).injective (congrArg Subtype.val h)
    simp only [Sum.inl.injEq, Sum.inr.injEq, Sum.inl_ne_inr, Sum.inr_ne_inl] at hval
  · exact congrArg (fun a => Sum.inl (Sum.inl a)) (internalPartner_injective σ hval)
  · exact False.elim (internalPartner_ne_attach σ a j' hval)
  · exact congrArg (fun b => Sum.inl (Sum.inr b)) (Subtype.ext hval)
  · exact False.elim (internalPartner_ne_attach σ a' j hval.symm)
  · exact congrArg Sum.inr (attach_injective (ofOMatching σ).1 hval)

theorem lineGlue_surjective {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) : Surjective (lineGlue σ τ) := by
  intro z
  obtain ⟨x, hx⟩ := (cutLegEquiv m l).surjective z.1
  have hz : (cutLegEquiv m l x).1 <
      ((gluedMatching σ τ).1 (cutLegEquiv m l x)).1 := by rw [hx]; exact z.2
  rw [gluedMatching_apply] at hz
  cases x with
  | inl a =>
    change (cutLegEquiv m l (Sum.inl a)).1 <
      (cutLegEquiv m l (Sum.elim _ _ (σ.1 (Sum.inr a)))).1 at hz
    cases h : σ.1 (Sum.inr a) with
    | inl j =>
      have ha : attach (ofOMatching σ).1 j = a := by
        apply Sum.inr_injective
        rw [← partner_slot]
        change σ.1 (Sum.inl j) = Sum.inr a
        rw [← h]
        exact σ.2.1 _
      refine ⟨Sum.inr j, Subtype.ext ?_⟩
      change cutLegEquiv m l (Sum.inl (attach (ofOMatching σ).1 j)) = z.1
      rw [ha, hx]
    | inr a' =>
      rw [h] at hz
      have ht : a'.1 < a.1 := (cutLeg_left_lt_iff m l a a').mp hz
      have hback : σ.1 (Sum.inr a') = Sum.inr a := by simpa [h] using σ.2.1 (Sum.inr a)
      let c : ILine σ := ⟨a', by
        rw [hback]
        change a'.1.val + 1 < a.1.val + 1
        exact Nat.add_lt_add_right ht 1⟩
      have hc : internalPartner σ c = a := by
        apply Sum.inr_injective
        exact (internalPartner_spec σ c).symm.trans hback
      refine ⟨Sum.inl (Sum.inl c), Subtype.ext ?_⟩
      change cutLegEquiv m l (Sum.inl (internalPartner σ c)) = z.1
      rw [hc, hx]
  | inr b =>
    change (cutLegEquiv m l (Sum.inr b)).1 <
      (cutLegEquiv m l (Sum.elim _ _ (τ.1 (Sum.inr b)))).1 at hz
    cases h : τ.1 (Sum.inr b) with
    | inl j =>
      rw [h] at hz
      exact False.elim ((not_lt_of_gt (cutLeg_left_lt_right m l _ b)) hz)
    | inr b' =>
      rw [h] at hz
      have ht : b.1 < b'.1 := (cutLeg_right_lt_iff m l b b').mp hz
      let c : ILine τ := ⟨b, by
        rw [h]
        change b.1.val + 1 < b'.1.val + 1
        exact Nat.add_lt_add_right ht 1⟩
      exact ⟨Sum.inl (Sum.inr c), Subtype.ext hx⟩

/-- The variables needed for Fubini: the two internal line sets and the shared slots
are exactly the lines of the glued matching. -/
def lineEquiv {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) :
    (ILine σ ⊕ ILine τ) ⊕ Fin k ≃ Line (gluedMatching σ τ) :=
  Equiv.ofBijective (lineGlue σ τ) ⟨lineGlue_injective σ τ, lineGlue_surjective σ τ⟩

@[simp] theorem lineEquiv_left {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) :
    lineEquiv σ τ (Sum.inl (Sum.inl a)) = leftLine σ τ a := rfl

@[simp] theorem lineEquiv_right {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (b : ILine τ) :
    lineEquiv σ τ (Sum.inl (Sum.inr b)) = rightLine σ τ b := rfl

@[simp] theorem lineEquiv_crossing {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) :
    lineEquiv σ τ (Sum.inr j) = crossingLine σ τ j := rfl

@[simp] theorem leftLine_source {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) :
    (leftLine σ τ a).1.1 = cutVertexEquiv n r (Sum.inl (internalPartner σ a).1) :=
  cutLegEquiv_vertex m l _

@[simp] theorem leftLine_target {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) :
    ((gluedMatching σ τ).1 (leftLine σ τ a).1).1 =
      cutVertexEquiv n r (Sum.inl a.1.1) := by
  change ((gluedMatching σ τ).1 (cutLegEquiv m l (Sum.inl (internalPartner σ a)))).1 = _
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.elim _ _ (σ.1 (Sum.inr (internalPartner σ a))))).1 = _
  rw [internalPartner_partner]
  exact cutLegEquiv_vertex m l _

@[simp] theorem rightLine_source {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (b : ILine τ) :
    (rightLine σ τ b).1.1 = cutVertexEquiv n r (Sum.inr b.1.1) :=
  cutLegEquiv_vertex m l _

@[simp] theorem rightLine_target {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (b : ILine τ) :
    ((gluedMatching σ τ).1 (rightLine σ τ b).1).1 =
      cutVertexEquiv n r (Sum.inr (internalPartner τ b).1) := by
  change ((gluedMatching σ τ).1 (cutLegEquiv m l (Sum.inr b.1))).1 = _
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.elim _ _ (τ.1 (Sum.inr b.1)))).1 = _
  rw [internalPartner_spec]
  exact cutLegEquiv_vertex m l _

@[simp] theorem crossingLine_source {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) :
    (crossingLine σ τ j).1.1 =
      cutVertexEquiv n r (Sum.inl (attach (ofOMatching σ).1 j).1) :=
  cutLegEquiv_vertex m l _

@[simp] theorem crossingLine_target {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) :
    ((gluedMatching σ τ).1 (crossingLine σ τ j).1).1 =
      cutVertexEquiv n r (Sum.inr (attach (ofOMatching τ).1 j).1) := by
  change ((gluedMatching σ τ).1
    (cutLegEquiv m l (Sum.inl (attach (ofOMatching σ).1 j)))).1 = _
  rw [gluedMatching_apply, glueFun_attach_left]
  exact cutLegEquiv_vertex m l _

def joinMomenta {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) :
    Line (gluedMatching σ τ) → Spacetime :=
  fun a => Sum.elim (Sum.elim q q') p ((lineEquiv σ τ).symm a)

@[simp] theorem joinMomenta_left {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) (a : ILine σ) :
    joinMomenta σ τ q q' p (leftLine σ τ a) = q a := by
  change Sum.elim (Sum.elim q q') p
    ((lineEquiv σ τ).symm (lineEquiv σ τ (Sum.inl (Sum.inl a)))) = _
  rw [Equiv.symm_apply_apply]
  rfl

@[simp] theorem joinMomenta_right {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) (a : ILine τ) :
    joinMomenta σ τ q q' p (rightLine σ τ a) = q' a := by
  change Sum.elim (Sum.elim q q') p
    ((lineEquiv σ τ).symm (lineEquiv σ τ (Sum.inl (Sum.inr a)))) = _
  rw [Equiv.symm_apply_apply]
  rfl

@[simp] theorem joinMomenta_crossing {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) (j : Fin k) :
    joinMomenta σ τ q q' p (crossingLine σ τ j) = p j := by
  change Sum.elim (Sum.elim q q') p
    ((lineEquiv σ τ).symm (lineEquiv σ τ (Sum.inr j))) = _
  rw [Equiv.symm_apply_apply]
  rfl

theorem line_integral_reindex {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l)
    (F : (Line (gluedMatching σ τ) → Spacetime) → ℂ) :
    (∫ q : (ILine σ ⊕ ILine τ) ⊕ Fin k → Spacetime,
      F (fun a => q ((lineEquiv σ τ).symm a))) = ∫ q, F q := by
  simpa [MeasurableEquiv.piCongrLeft, Equiv.piCongrLeft, Equiv.piCongrLeft'] using
    (volume_measurePreserving_piCongrLeft (fun _ => Spacetime) (lineEquiv σ τ)).integral_comp' F

@[simp] theorem omatching_slot {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (j : Fin k) : σ.1 (Sum.inl j) = Sum.inr (attach (ofOMatching σ).1 j) :=
  partner_slot (ofOMatching σ).1 j

theorem openMomentum_eq {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (q : ILine σ → Spacetime) (p : Fin k → Spacetime) (v : Fin n) :
    openMomentum σ q p v =
      (∑ a : ILine σ, if (internalPartner σ a).1 = v then q a else 0) -
        (∑ a : ILine σ, if a.1.1 = v then q a else 0) +
        ∑ j : Fin k, if (attach (ofOMatching σ).1 j).1 = v then p j else 0 := by
  simp only [openMomentum, internalPartner_spec, omatching_slot, ovtx, Sum.elim_inr,
    (Fin.succ_injective n).eq_iff]

/-- Reversing the left word negates all of its vertex momenta, including the
momenta of its internal lines. -/
theorem vertexMomentum_left {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) (v : Fin n) :
    vertexMomentum (gluedMatching σ τ) (joinMomenta σ τ q q' p)
        (cutVertexEquiv n r (Sum.inl v)) = -openMomentum σ q p v := by
  unfold vertexMomentum
  rw [← (lineEquiv σ τ).sum_comp, ← (lineEquiv σ τ).sum_comp]
  simp only [Fintype.sum_sum_type, lineEquiv_left, lineEquiv_right, lineEquiv_crossing,
    leftLine_source, leftLine_target, rightLine_source, rightLine_target,
    crossingLine_source, crossingLine_target, joinMomenta_left, joinMomenta_right,
    joinMomenta_crossing, (cutVertexEquiv n r).injective.eq_iff, Sum.inl.injEq,
    Sum.inr_ne_inl, ite_false, Finset.sum_const_zero, add_zero, openMomentum_eq]
  abel

theorem vertexMomentum_right {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) (v : Fin r) :
    vertexMomentum (gluedMatching σ τ) (joinMomenta σ τ q q' p)
        (cutVertexEquiv n r (Sum.inr v)) = openMomentum τ q' p v := by
  unfold vertexMomentum
  rw [← (lineEquiv σ τ).sum_comp, ← (lineEquiv σ τ).sum_comp]
  simp only [Fintype.sum_sum_type, lineEquiv_left, lineEquiv_right, lineEquiv_crossing,
    leftLine_source, leftLine_target, rightLine_source, rightLine_target,
    crossingLine_source, crossingLine_target, joinMomenta_left, joinMomenta_right,
    joinMomenta_crossing, (cutVertexEquiv n r).injective.eq_iff, Sum.inr.injEq,
    Sum.inl_ne_inr, ite_false, Finset.sum_const_zero, add_zero, zero_add, openMomentum_eq]
  abel

def cutCrossingNumber {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : Matching (cutMon m l)) : ℕ :=
  Fintype.card (Crossing (matchingToClosed σ).1)

/-- The factorial multiplicity identity for the original matching types. -/
theorem sum_gluedMatching {n r : ℕ} (k : ℕ) (m : Fin n → Mon) (l : Fin r → Mon)
    (F : Matching (cutMon m l) → ℂ) :
    (∑ σ : OMatching k m, ∑ τ : OMatching k l, F (gluedMatching σ τ)) =
      (k.factorial : ℂ) *
        ∑ σ : Matching (cutMon m l), if cutCrossingNumber σ = k then F σ else 0 := by
  have h := (oMatchingGluingEquiv k m l).sum_comp
    (fun d => F (closedMatchingEquiv m l d.1))
  change (∑ p : OMatching k m × OMatching k l, F (gluedMatching p.1 p.2)) =
    ∑ d : (Σ s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1),
      Fin k ≃ Crossing s.1), F (closedMatchingEquiv m l d.1) at h
  rw [Fintype.sum_prod_type, Fintype.sum_sigma] at h
  rw [h, ← (closedMatchingEquiv m l).sum_comp
    (fun σ => if cutCrossingNumber σ = k then F σ else 0), Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro s _
  have hs : matchingToClosed (closedMatchingEquiv m l s) = s :=
    (closedMatchingEquiv m l).symm_apply_apply s
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul,
    cutCrossingNumber, hs]
  change (Fintype.card (Fin k ≃ Crossing s.1) : ℂ) * F (closedMatchingEquiv m l s) = _
  rw [card_labellings]
  split_ifs <;> simp

theorem slot_integral_permutation (k : ℕ) (e : Equiv.Perm (Fin k))
    (F : (Fin k → Spacetime) → ℂ) :
    (∫ p, F (fun j => p (e j)) ∂(Measure.pi fun _ : Fin k => mu)) =
      ∫ p, F p ∂(Measure.pi fun _ : Fin k => mu) := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  simpa [MeasurableEquiv.piCongrLeft, Equiv.piCongrLeft, Equiv.piCongrLeft'] using
    (measurePreserving_piCongrLeft (fun _ : Fin k => mu) e.symm).integral_comp' F

theorem conj_Bmono (α : Idx) (p : Spacetime) :
    (starRingEnd ℂ) (Bmono α p) = (-1 : ℂ) ^ α timeAxis * Amono α p := by
  simp only [Bmono, Amono, map_mul, map_prod, map_pow, map_neg, Complex.conj_I,
    Complex.conj_ofReal, neg_mul]
  rw [neg_pow]
  ring

theorem conj_Amono (α : Idx) (p : Spacetime) :
    (starRingEnd ℂ) (Amono α p) = (-1 : ℂ) ^ α timeAxis * Bmono α p := by
  simp only [Bmono, Amono, map_mul, map_prod, map_pow, map_neg, Complex.conj_I,
    Complex.conj_ofReal, neg_mul, neg_neg]
  rw [neg_pow (time p : ℂ)]
  have h : (-1 : ℂ) ^ α timeAxis * (-1 : ℂ) ^ α timeAxis = 1 := by
    rw [← mul_pow]; simp
  calc
    _ = ((-1 : ℂ) ^ α timeAxis * (-1 : ℂ) ^ α timeAxis) *
        ((∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ α i.castSucc) *
          (time p : ℂ) ^ α timeAxis) := by rw [h, one_mul]
    _ = _ := by ring

theorem conj_line (α β : Idx) (p : Spacetime) :
    (starRingEnd ℂ) (Amono α p * Bmono β p * (weight p : ℂ)) =
      (-1 : ℂ) ^ (α timeAxis + β timeAxis) *
        (Amono β p * Bmono α p * (weight p : ℂ)) := by
  rw [map_mul, map_mul, conj_Amono, conj_Bmono, Complex.conj_ofReal, pow_add]
  ring

theorem conj_fourierE (f : TestFunction) (p : Spacetime) :
    (starRingEnd ℂ) (fourierE f p) = fourierE (conjugateTest f) (-p) := by
  rw [fourierE, ← integral_conj, fourierE]
  apply integral_congr_ae
  filter_upwards [] with x
  change (starRingEnd ℂ) (f x * Complex.exp (Complex.I * (⟪x, p⟫_ℝ : ℂ))) =
    (starRingEnd ℂ) (f x) * Complex.exp (Complex.I * (⟪x, -p⟫_ℝ : ℂ))
  rw [map_mul, ← Complex.exp_conj]
  simp only [map_mul, Complex.conj_I, Complex.conj_ofReal, inner_neg_right,
    Complex.ofReal_neg, neg_mul, mul_neg]

theorem integrable_amplitude_pair (u v : Word) (k : ℕ) :
    Integrable (fun p : Fin k → Spacetime =>
      (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p)
        (Measure.pi fun _ : Fin k => mu) :=
  (openAmpW_memLp u k).star.integrable_mul (openAmpW_memLp v k)

/-- Number of lines crossing the cut immediately before vertex `b`. -/
def crossingCount {n : ℕ} {m : Fin n → Mon} (b : ℕ) (σ : Matching m) : ℕ :=
  Fintype.card {a : Leg m // a.1.val < b ∧ b ≤ (σ.1 a).1.val}

def matchingIntegrand {n : ℕ} {m : Fin n → Mon} (σ : Matching m)
    (f : Fin n → TestFunction) (q : Line σ → Spacetime) : ℂ :=
  (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)) *
    ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v)

/-- The integrand of one open matching, before its internal momenta are integrated. -/
def openIntegrand {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (f : Fin n → TestFunction) (q : ILine σ → Spacetime) (p : Fin k → Spacetime) : ℂ :=
  (∏ a : ILine σ, Amono a.1.idx (q a) * Bmono (internalPartner σ a).idx (q a) *
    (weight (q a) : ℂ)) *
  (∏ j : Fin k, Bmono (attach (ofOMatching σ).1 j).idx (p j)) *
  ∏ v : Fin n, fourierE (f v) (openMomentum σ q p v)

def cutTest {n r : ℕ} (f : Fin n → TestFunction) (g : Fin r → TestFunction) :
    Fin (n + r) → TestFunction :=
  fun i => Sum.elim (fun v => conjugateTest (f v)) g ((cutVertexEquiv n r).symm i)

def matchingSign {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) : ℂ :=
  (∏ a : ILine σ, (-1 : ℂ) ^ (a.1.idx timeAxis + (internalPartner σ a).idx timeAxis)) *
  ∏ j : Fin k, (-1 : ℂ) ^ (attach (ofOMatching σ).1 j).idx timeAxis

def openLegMap {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    (ILine σ ⊕ ILine σ) ⊕ Fin k → Leg m :=
  Sum.elim (Sum.elim Subtype.val (internalPartner σ)) (attach (ofOMatching σ).1)

theorem openLegMap_bijective {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    Bijective (openLegMap σ) := by
  have hsa (a : ILine σ) (j : Fin k) : a.1 ≠ attach (ofOMatching σ).1 j := by
    intro h
    have h' := internalPartner_spec σ a
    rw [h] at h'
    change (ofOMatching σ).1.1.1 (Sum.inr (attach (ofOMatching σ).1 j)) = _ at h'
    rw [partner_attach] at h'
    cases h'
  have hst (a b : ILine σ) : a.1 ≠ internalPartner σ b := by
    intro h
    have h' := internalPartner_spec σ a
    rw [h, internalPartner_partner] at h'
    have hb : b.1 = internalPartner σ a := Sum.inr_injective h'
    have ha := internalPartner_lt σ a
    have hb' := internalPartner_lt σ b
    rw [h] at ha
    rw [hb] at hb'
    exact (lt_asymm ha hb')
  constructor
  · rintro ((a | a) | j) ((b | b) | j') h
    all_goals change _ = _ at h
    · exact congrArg (fun a => Sum.inl (Sum.inl a)) (Subtype.ext h)
    · exact False.elim (hst a b h)
    · exact False.elim (hsa a j' h)
    · exact False.elim (hst b a h.symm)
    · exact congrArg (fun a => Sum.inl (Sum.inr a)) (internalPartner_injective σ h)
    · exact False.elim (internalPartner_ne_attach σ a j' h)
    · exact False.elim (hsa b j h.symm)
    · exact False.elim (internalPartner_ne_attach σ b j h.symm)
    · exact congrArg Sum.inr (attach_injective (ofOMatching σ).1 h)
  · intro a
    cases h : σ.1 (Sum.inr a) with
    | inl j =>
      refine ⟨Sum.inr j, ?_⟩
      apply Sum.inr_injective
      change Sum.inr (attach (ofOMatching σ).1 j) = Sum.inr a
      rw [← omatching_slot, ← h]
      exact σ.2.1 _
    | inr b =>
      have hab : b.1 ≠ a.1 := by
        intro he
        exact σ.2.2 (Sum.inr a) (by simp [h, ovtx, he])
      rcases lt_or_gt_of_ne hab with hba | hab
      · have hb : σ.1 (Sum.inr b) = Sum.inr a := by simpa [h] using σ.2.1 (Sum.inr a)
        let c : ILine σ := ⟨b, by
          rw [hb]
          exact Fin.succ_lt_succ_iff.mpr hba⟩
        refine ⟨Sum.inl (Sum.inr c), ?_⟩
        apply Sum.inr_injective
        exact (internalPartner_spec σ c).symm.trans hb
      · let c : ILine σ := ⟨a, by
          rw [h]
          exact Fin.succ_lt_succ_iff.mpr hab⟩
        exact ⟨Sum.inl (Sum.inl c), rfl⟩

theorem matchingSign_eq {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    matchingSign σ = ∏ v, (-1 : ℂ) ^ tdeg (m v) := by
  let e := Equiv.ofBijective (openLegMap σ) (openLegMap_bijective σ)
  have h := e.prod_comp (fun a : Leg m => (-1 : ℂ) ^ a.idx timeAxis)
  have ht (v : Fin n) : (∏ a : (m v).ToType, (-1 : ℂ) ^ a.1 timeAxis) =
      (-1 : ℂ) ^ tdeg (m v) := by
    rw [Finset.prod_pow_eq_pow_sum]
    congr 1
    change (Finset.univ.val.map (fun a : (m v).ToType => a.1 timeAxis)).sum = _
    exact congrArg Multiset.sum (Multiset.map_univ (m v) (fun a : Idx => a timeAxis))
  rw [Fintype.prod_sigma] at h
  simp only [Leg.idx, ht] at h
  change (∏ a, (-1 : ℂ) ^ (openLegMap σ a).idx timeAxis) = _ at h
  rw [← h]
  simp only [Fintype.prod_sum_type, openLegMap,
    Sum.elim_inl, Sum.elim_inr, matchingSign, pow_add, Finset.prod_mul_distrib]

theorem matchingSign_sq {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m) :
    matchingSign σ * matchingSign σ = 1 := by
  rw [matchingSign_eq, ← Finset.prod_mul_distrib]
  simp_rw [← mul_pow]
  simp

@[simp] theorem leftLine_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) :
    (leftLine σ τ a).1.idx = (internalPartner σ a).idx := by
  exact cutLegEquiv_idx m l (Sum.inl (internalPartner σ a))

@[simp] theorem leftLine_partner_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine σ) :
    ((gluedMatching σ τ).1 (leftLine σ τ a).1).idx = a.1.idx := by
  change ((gluedMatching σ τ).1 (cutLegEquiv m l (Sum.inl (internalPartner σ a)))).idx = _
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.elim _ _ (σ.1 (Sum.inr (internalPartner σ a))))).idx = _
  rw [internalPartner_partner]
  exact cutLegEquiv_idx m l (Sum.inl a.1)

@[simp] theorem rightLine_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine τ) :
    (rightLine σ τ a).1.idx = a.1.idx := cutLegEquiv_idx m l (Sum.inr a.1)

@[simp] theorem rightLine_partner_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (a : ILine τ) :
    ((gluedMatching σ τ).1 (rightLine σ τ a).1).idx = (internalPartner τ a).idx := by
  change ((gluedMatching σ τ).1 (cutLegEquiv m l (Sum.inr a.1))).idx = _
  rw [gluedMatching_apply]
  change (cutLegEquiv m l (Sum.elim _ _ (τ.1 (Sum.inr a.1)))).idx = _
  rw [internalPartner_spec]
  exact cutLegEquiv_idx m l (Sum.inr (internalPartner τ a))

@[simp] theorem crossingLine_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) :
    (crossingLine σ τ j).1.idx = (attach (ofOMatching σ).1 j).idx :=
  cutLegEquiv_idx m l (Sum.inl (attach (ofOMatching σ).1 j))

@[simp] theorem crossingLine_partner_idx {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (j : Fin k) :
    ((gluedMatching σ τ).1 (crossingLine σ τ j).1).idx =
      (attach (ofOMatching τ).1 j).idx := by
  change ((gluedMatching σ τ).1
    (cutLegEquiv m l (Sum.inl (attach (ofOMatching σ).1 j)))).idx = _
  rw [gluedMatching_apply, glueFun_attach_left]
  exact cutLegEquiv_idx m l (Sum.inr (attach (ofOMatching τ).1 j))

/-- Conjugation and reversal identify all leg factors and Fourier factors pointwise. -/
theorem integrand_contraction {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (f : Fin n → TestFunction)
    (g : Fin r → TestFunction) (q : ILine σ → Spacetime)
    (q' : ILine τ → Spacetime) (p : Fin k → Spacetime) :
    (starRingEnd ℂ) (openIntegrand σ f q p) * openIntegrand τ g q' p *
        (∏ j, (weight (p j) : ℂ)) =
      matchingSign σ * matchingIntegrand (gluedMatching σ τ) (cutTest f g)
        (joinMomenta σ τ q q' p) := by
  unfold matchingIntegrand
  rw [← (lineEquiv σ τ).prod_comp, ← (cutVertexEquiv n r).prod_comp]
  simp only [Fintype.prod_sum_type, lineEquiv_left, lineEquiv_right, lineEquiv_crossing,
    leftLine_idx, leftLine_partner_idx, rightLine_idx, rightLine_partner_idx,
    crossingLine_idx, crossingLine_partner_idx, joinMomenta_left, joinMomenta_right,
    joinMomenta_crossing, vertexMomentum_left, vertexMomentum_right,
    cutTest, Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr]
  simp only [openIntegrand, matchingSign, map_mul, map_prod, conj_Amono, conj_Bmono,
    Complex.conj_ofReal, conj_fourierE, pow_add, Finset.prod_mul_distrib]
  ring

/-- Tonelli for the finite products needed to identify the slot density. -/
theorem lintegral_fin_prod {n : ℕ} {X : Type*} [MeasurableSpace X]
    (μ : Fin n → Measure X) [∀ i, SigmaFinite (μ i)]
    (f : Fin n → X → ℝ≥0∞) (hf : ∀ i, Measurable (f i)) :
    (∫⁻ x, ∏ i, f i (x i) ∂Measure.pi μ) = ∏ i, ∫⁻ x, f i x ∂μ i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [← ((measurePreserving_piFinSuccAbove μ 0).symm).lintegral_comp_emb
      (MeasurableEquiv.measurableEmbedding _)]
    simp only [MeasurableEquiv.piFinSuccAbove_symm_apply, Fin.insertNthEquiv,
      Fin.prod_univ_succ, Fin.insertNth_zero, Equiv.coe_fn_mk, Fin.cons_succ,
      Fin.zero_succAbove, cast_eq, Fin.cons_zero]
    have ht : Measurable (fun x : Fin n → X => ∏ i, f i.succ (x i)) :=
      Finset.measurable_prod _ (fun i _ => (hf i.succ).comp (measurable_pi_apply i))
    rw [lintegral_prod_mul (hf 0).aemeasurable ht.aemeasurable,
      ih (fun i => μ i.succ) (fun i => f i.succ) (fun i => hf i.succ)]

def slotWeight (k : ℕ) (p : Fin k → Spacetime) : ℝ := ∏ j, weight (p j)

theorem slotWeight_nonneg (k : ℕ) (p : Fin k → Spacetime) : 0 ≤ slotWeight k p :=
  Finset.prod_nonneg fun _ _ => weight_nonneg _

theorem measurable_slotWeight (k : ℕ) : Measurable (slotWeight k) :=
  Finset.measurable_prod _ fun j _ => measurable_weight.comp (measurable_pi_apply j)

theorem slot_measure (k : ℕ) :
    (Measure.pi fun _ : Fin k => mu) =
      volume.withDensity (fun p => ENNReal.ofReal (slotWeight k p)) := by
  letI : SigmaFinite mu := by unfold mu; infer_instance
  apply Measure.pi_eq
  intro s hs
  rw [withDensity_apply _ (MeasurableSet.univ_pi hs)]
  simp only [slotWeight, ENNReal.ofReal_prod_of_nonneg (fun j _ => weight_nonneg _)]
  change (∫⁻ p, ∏ j, ENNReal.ofReal (weight (p j))
    ∂(Measure.pi (fun _ : Fin k => volume)).restrict (Set.pi Set.univ s)) = _
  rw [Measure.restrict_pi_pi, lintegral_fin_prod _ _ (fun _ => measurable_weight.ennreal_ofReal)]
  apply Finset.prod_congr rfl
  intro j _
  exact (withDensity_apply _ (hs j)).symm

theorem integral_slots (k : ℕ) (F : (Fin k → Spacetime) → ℂ) :
    (∫ p, F p ∂(Measure.pi fun _ : Fin k => mu)) =
      ∫ p, (slotWeight k p : ℂ) * F p := by
  rw [slot_measure, integral_withDensity_eq_integral_toReal_smul
    (measurable_slotWeight k).ennreal_ofReal (ae_of_all _ fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (slotWeight_nonneg _ _), Complex.real_smul]

/-- The measurable change of variables used for Fubini. -/
def momentumEquiv {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) :
    (((ILine σ → Spacetime) × (ILine τ → Spacetime)) × (Fin k → Spacetime)) ≃ᵐ
      (Line (gluedMatching σ τ) → Spacetime) :=
  (MeasurableEquiv.prodCongr
    (MeasurableEquiv.sumPiEquivProdPi (fun _ : ILine σ ⊕ ILine τ => Spacetime)).symm
    (MeasurableEquiv.refl _)).trans
  ((MeasurableEquiv.sumPiEquivProdPi
    (fun _ : (ILine σ ⊕ ILine τ) ⊕ Fin k => Spacetime)).symm.trans
    (MeasurableEquiv.piCongrLeft (fun _ => Spacetime) (lineEquiv σ τ)))

@[simp] theorem momentumEquiv_apply {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l)
    (z : ((ILine σ → Spacetime) × (ILine τ → Spacetime)) × (Fin k → Spacetime)) :
    momentumEquiv σ τ z = joinMomenta σ τ z.1.1 z.1.2 z.2 := by
  funext a
  obtain ⟨a, rfl⟩ := (lineEquiv σ τ).surjective a
  simp only [momentumEquiv, MeasurableEquiv.trans_apply,
    MeasurableEquiv.piCongrLeft_apply_apply, joinMomenta, Equiv.symm_apply_apply]
  rcases a with (a | b) | j <;> rfl

theorem momentumEquiv_preserving {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) :
    MeasurePreserving (momentumEquiv σ τ) volume volume :=
  (volume_measurePreserving_piCongrLeft (fun _ => Spacetime) (lineEquiv σ τ)).comp
    ((volume_measurePreserving_sumPiEquivProdPi_symm
      (fun _ : (ILine σ ⊕ ILine τ) ⊕ Fin k => Spacetime)).comp
      ((volume_measurePreserving_sumPiEquivProdPi_symm
        (fun _ : ILine σ ⊕ ILine τ => Spacetime)).prod (MeasurePreserving.id volume)))

theorem line_fubini {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l)
    (F : (Line (gluedMatching σ τ) → Spacetime) → ℂ) (hF : Integrable F) :
    (∫ z, F z) = ∫ p, ∫ q, ∫ q', F (joinMomenta σ τ q q' p) := by
  have hi := (momentumEquiv_preserving σ τ).integrable_comp_of_integrable hF
  change Integrable (fun z => F (momentumEquiv σ τ z)) (volume.prod volume) at hi
  rw [← (momentumEquiv_preserving σ τ).integral_comp' F]
  calc
    _ = ∫ p, ∫ z, F (momentumEquiv σ τ (z, p)) := integral_prod_symm _ hi
    _ = _ := ?_
  apply integral_congr_ae
  filter_upwards [hi.prod_left_ae] with p hp
  simpa only [momentumEquiv_apply, Measure.volume_eq_prod] using integral_prod _ hp

def matchingAmp {n k : ℕ} {m : Fin n → Mon} (σ : OMatching k m)
    (f : Fin n → TestFunction) (p : Fin k → Spacetime) : ℂ :=
  ∫ q, openIntegrand σ f q p

theorem openAmp_eq_sum {n : ℕ} (m : Fin n → Mon) (f : Fin n → TestFunction)
    (k : ℕ) (p : Fin k → Spacetime) :
    openAmp m f k p = ∑ σ : OMatching k m, matchingAmp σ f p := by
  simp only [openAmp, matchingAmp, openIntegrand, internalPartner_spec, omatching_slot,
    oidx, Sum.elim_inr]

/-- Fubini for one pair of open matchings, including the slot density. -/
theorem matching_contraction {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (f : Fin n → TestFunction)
    (g : Fin r → TestFunction) :
    (∫ p, (starRingEnd ℂ) (matchingAmp σ f p) * matchingAmp τ g p
      ∂(Measure.pi fun _ : Fin k => mu)) =
      matchingSign σ * ∫ z, matchingIntegrand (gluedMatching σ τ) (cutTest f g) z := by
  rw [integral_slots, line_fubini σ τ (matchingIntegrand _ (cutTest f g))
    (matching_integrable _ _ _)]
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with p
  calc
    _ = ∫ q, ∫ q', (starRingEnd ℂ) (openIntegrand σ f q p) *
        openIntegrand τ g q' p * ∏ j, (weight (p j) : ℂ) := by
      simp only [integral_mul_const, integral_const_mul, integral_conj, matchingAmp,
        slotWeight, Complex.ofReal_prod]
      ring
    _ = _ := by
      simp_rw [integrand_contraction, integral_const_mul]

theorem matching_pair_integrable {n r k : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : OMatching k m) (τ : OMatching k l) (f : Fin n → TestFunction)
    (g : Fin r → TestFunction) :
    Integrable (fun p => (starRingEnd ℂ) (matchingAmp σ f p) * matchingAmp τ g p)
      (Measure.pi fun _ : Fin k => mu) := by
  have hF : Integrable (matchingIntegrand (gluedMatching σ τ) (cutTest f g)) :=
    matching_integrable _ _ _
  have hi := ((momentumEquiv_preserving σ τ).integrable_comp_of_integrable hF).const_mul
    (matchingSign σ)
  have hprod : Integrable (fun z :
      ((ILine σ → Spacetime) × (ILine τ → Spacetime)) × (Fin k → Spacetime) =>
      (starRingEnd ℂ) (openIntegrand σ f z.1.1 z.2) * openIntegrand τ g z.1.2 z.2 *
        ∏ j, (weight (z.2 j) : ℂ)) := by
    apply hi.congr
    filter_upwards [] with z
    simpa only [Function.comp_apply, momentumEquiv_apply] using
      (integrand_contraction σ τ f g z.1.1 z.1.2 z.2).symm
  have hp := hprod.integral_prod_right
  rw [slot_measure, integrable_withDensity_iff_integrable_smul'
    (measurable_slotWeight k).ennreal_ofReal (ae_of_all _ fun _ => ENNReal.ofReal_lt_top)]
  simp only [ENNReal.toReal_ofReal (slotWeight_nonneg _ _), Complex.real_smul]
  apply hp.congr
  filter_upwards [] with p
  rw [Measure.volume_eq_prod]
  rw [integral_mul_const,
    integral_prod_mul (fun q => (starRingEnd ℂ) (openIntegrand σ f q p))
      (fun q' => openIntegrand τ g q' p), integral_conj]
  simp only [matchingAmp, slotWeight, Complex.ofReal_prod]
  ring

theorem integrable_finite_pair {X I J : Type*} [MeasurableSpace X]
    (μ : Measure X) (s : Finset I) (t : Finset J) (F : I → X → ℂ) (G : J → X → ℂ)
    (h : ∀ i ∈ s, ∀ j ∈ t, Integrable (fun x => (starRingEnd ℂ) (F i x) * G j x) μ) :
    Integrable (fun x => (starRingEnd ℂ) (∑ i ∈ s, F i x) * ∑ j ∈ t, G j x) μ := by
  simp only [map_sum, Finset.sum_mul]
  simp only [Finset.mul_sum]
  exact integrable_finsetSum _ fun i hi => integrable_finsetSum _ (h i hi)

theorem integral_finite_pair {X I J : Type*} [MeasurableSpace X]
    (μ : Measure X) (s : Finset I) (t : Finset J) (F : I → X → ℂ) (G : J → X → ℂ)
    (h : ∀ i ∈ s, ∀ j ∈ t, Integrable (fun x => (starRingEnd ℂ) (F i x) * G j x) μ) :
    (∫ x, (starRingEnd ℂ) (∑ i ∈ s, F i x) * ∑ j ∈ t, G j x ∂μ) =
      ∑ i ∈ s, ∑ j ∈ t, ∫ x, (starRingEnd ℂ) (F i x) * G j x ∂μ := by
  simp only [map_sum, Finset.sum_mul]
  simp only [Finset.mul_sum]
  rw [integral_finsetSum _ (fun i hi => integrable_finsetSum _ (h i hi))]
  exact Finset.sum_congr rfl (fun i hi => integral_finsetSum _ (h i hi))

theorem monomial_pair_integrable {n r : ℕ} (k : ℕ) (m : Fin n → Mon) (l : Fin r → Mon)
    (f : Fin n → TestFunction) (g : Fin r → TestFunction) :
    Integrable (fun p => (starRingEnd ℂ) (openAmp m f k p) * openAmp l g k p)
      (Measure.pi fun _ : Fin k => mu) := by
  simp only [openAmp_eq_sum]
  exact integrable_finite_pair _ _ _ _ _ fun σ _ τ _ => matching_pair_integrable σ τ f g

/-- Fixed-sector contraction for monomials; the factorial comes solely from gluing. -/
theorem monomial_contraction {n r : ℕ} (k : ℕ) (m : Fin n → Mon) (l : Fin r → Mon)
    (f : Fin n → TestFunction) (g : Fin r → TestFunction) :
    (∫ p, (starRingEnd ℂ) (openAmp m f k p) * openAmp l g k p
      ∂(Measure.pi fun _ : Fin k => mu)) =
      (∏ v, (-1 : ℂ) ^ tdeg (m v)) * (k.factorial : ℂ) *
        ∑ σ : Matching (cutMon m l), if cutCrossingNumber σ = k then
          ∫ z, matchingIntegrand σ (cutTest f g) z else 0 := by
  simp only [openAmp_eq_sum]
  rw [integral_finite_pair _ _ _ _ _ (fun σ _ τ _ => matching_pair_integrable σ τ f g)]
  simp_rw [matching_contraction, matchingSign_eq, ← Finset.mul_sum]
  rw [sum_gluedMatching k m l (fun σ => ∫ z, matchingIntegrand σ (cutTest f g) z), mul_assoc]

theorem closedMatching_apply {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1))
    (a : Leg m ⊕ Leg l) :
    (closedMatchingEquiv m l s).1 (cutLegEquiv m l a) = cutLegEquiv m l (s.1.1 a) := by
  change cutLegEquiv m l (s.1.1 ((cutLegEquiv m l).symm (cutLegEquiv m l a))) = _
  rw [Equiv.symm_apply_apply]

def crossingMap {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1))
    (a : Crossing s.1) :
    {x : Leg (cutMon m l) // x.1.val < n ∧ n ≤ ((closedMatchingEquiv m l s).1 x).1.val} := by
  refine ⟨cutLegEquiv m l (Sum.inl a.1), ?_, ?_⟩
  · exact a.1.1.rev.isLt
  · rw [closedMatching_apply, partner_crossing]
    change n ≤ n + (crossingMate s.1 a).1.val
    omega

theorem crossingMap_bijective {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (s : AdmissibleClosed (fun a : Leg m => a.1) (fun b : Leg l => b.1)) :
    Bijective (crossingMap s) := by
  constructor
  · intro a b h
    exact Subtype.ext (Sum.inl_injective ((cutLegEquiv m l).injective (congrArg Subtype.val h)))
  · intro x
    obtain ⟨a | b, hx⟩ := (cutLegEquiv m l).surjective x.1
    · have ht := x.2.2
      rw [← hx, closedMatching_apply] at ht
      cases h : s.1.1 (Sum.inl a) with
      | inl a' =>
        rw [h] at ht
        exact False.elim (Nat.not_le_of_gt a'.1.rev.isLt ht)
      | inr b => exact ⟨⟨a, b, h⟩, Subtype.ext hx⟩
    · have ht := x.2.1
      rw [← hx] at ht
      change n + b.1.val < n at ht
      omega

theorem cutCrossingNumber_eq {n r : ℕ} {m : Fin n → Mon} {l : Fin r → Mon}
    (σ : Matching (cutMon m l)) : cutCrossingNumber σ = crossingCount n σ := by
  obtain ⟨s, rfl⟩ := (closedMatchingEquiv m l).surjective σ
  have hs : matchingToClosed (closedMatchingEquiv m l s) = s :=
    (closedMatchingEquiv m l).symm_apply_apply s
  unfold cutCrossingNumber crossingCount
  rw [hs]
  exact Fintype.card_congr (Equiv.ofBijective (crossingMap s) (crossingMap_bijective s))

def cutLabels {n r : ℕ} (P : Fin n → (Mon →₀ ℂ)) (Q : Fin r → (Mon →₀ ℂ)) :
    Fin (n + r) → (Mon →₀ ℂ) :=
  fun i => Sum.elim (fun v => adjL (P v)) Q ((cutVertexEquiv n r).symm i)

def cutMonEquiv (n r : ℕ) : ((Fin n → Mon) × (Fin r → Mon)) ≃ (Fin (n + r) → Mon) where
  toFun a := cutMon a.1 a.2
  invFun m := (fun i => m (cutVertexEquiv n r (Sum.inl i)),
    fun i => m (cutVertexEquiv n r (Sum.inr i)))
  left_inv a := by
    apply Prod.ext <;> funext i <;>
      simp only [cutMon, Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr]
  right_inv m := by
    funext i
    obtain ⟨j, rfl⟩ := (cutVertexEquiv n r).surjective i
    cases j <;> simp only [cutMon, Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr]

@[simp] theorem adjL_support (P : Mon →₀ ℂ) : (adjL P).support = P.support := by
  ext m
  simp [Finsupp.mem_support_iff, adjL_apply]

theorem cutMon_mem_support {n r : ℕ} (P : Fin n → (Mon →₀ ℂ)) (Q : Fin r → (Mon →₀ ℂ))
    (m : Fin n → Mon) (l : Fin r → Mon) :
    cutMon m l ∈ Fintype.piFinset (fun i => (cutLabels P Q i).support) ↔
      m ∈ Fintype.piFinset (fun i => (P i).support) ∧
      l ∈ Fintype.piFinset (fun i => (Q i).support) := by
  simp only [Fintype.mem_piFinset]
  constructor
  · intro h
    constructor
    · intro i
      simpa only [cutMon, cutLabels, Equiv.symm_apply_apply, Sum.elim_inl, adjL_support]
        using h (cutVertexEquiv n r (Sum.inl i))
    · intro i
      simpa only [cutMon, cutLabels, Equiv.symm_apply_apply, Sum.elim_inr]
        using h (cutVertexEquiv n r (Sum.inr i))
  · rintro ⟨hm, hl⟩ i
    obtain ⟨j, rfl⟩ := (cutVertexEquiv n r).surjective i
    cases j with
    | inl j =>
      simpa only [cutMon, cutLabels, Equiv.symm_apply_apply, Sum.elim_inl, adjL_support] using hm j
    | inr j =>
      simpa only [cutMon, cutLabels, Equiv.symm_apply_apply, Sum.elim_inr] using hl j

theorem cutLabels_coefficient {n r : ℕ} (P : Fin n → (Mon →₀ ℂ)) (Q : Fin r → (Mon →₀ ℂ))
    (m : Fin n → Mon) (l : Fin r → Mon) :
    (∏ i, cutLabels P Q i (cutMon m l i)) =
      (∏ i, (-1 : ℂ) ^ tdeg (m i)) * (starRingEnd ℂ) (∏ i, P i (m i)) * ∏ j, Q j (l j) := by
  rw [← (cutVertexEquiv n r).prod_comp]
  simp [cutLabels, cutMon, Fintype.prod_sum_type, adjL_apply, Finset.prod_mul_distrib]

/-- Expanding the closed labels is a finite change of indices preserving occurrences. -/
theorem sum_cut_labels {n r : ℕ} (P : Fin n → (Mon →₀ ℂ)) (Q : Fin r → (Mon →₀ ℂ))
    (K : (Fin (n + r) → Mon) → ℂ) :
    (∑ a ∈ Fintype.piFinset (fun i => (cutLabels P Q i).support),
      (∏ i, cutLabels P Q i (a i)) * K a) =
    ∑ m ∈ Fintype.piFinset (fun i => (P i).support),
      ∑ l ∈ Fintype.piFinset (fun i => (Q i).support),
        ((∏ i, (-1 : ℂ) ^ tdeg (m i)) * (starRingEnd ℂ) (∏ i, P i (m i)) *
          ∏ j, Q j (l j)) * K (cutMon m l) := by
  rw [← Finset.sum_product']
  symm
  apply Finset.sum_bij (fun a _ => cutMon a.1 a.2)
  · intro a ha
    exact (cutMon_mem_support P Q a.1 a.2).mpr (Finset.mem_product.mp ha)
  · intro a _ b _ hab
    exact (cutMonEquiv n r).injective hab
  · intro a ha
    obtain ⟨b, rfl⟩ := (cutMonEquiv n r).surjective a
    exact ⟨b, Finset.mem_product.mpr ((cutMon_mem_support P Q b.1 b.2).mp ha), rfl⟩
  · intro a _
    rw [cutLabels_coefficient]

/-- The part of the closed Wick sum with exactly `k` crossing lines. -/
def closedSlice {n : ℕ} (b : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction)
    (k : ℕ) : ℂ :=
  ∑ m ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (m i)) *
    ∑ σ : Matching m, if crossingCount b σ = k then
      ∫ q : Line σ → Spacetime, matchingIntegrand σ f q else 0

/-- Finite label expansion of the monomial contraction formula. -/
theorem label_contraction {n r : ℕ} (P : Fin n → (Mon →₀ ℂ)) (Q : Fin r → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (g : Fin r → TestFunction) (k : ℕ) :
    (∫ p, (starRingEnd ℂ) (openAmpL P f k p) * openAmpL Q g k p
      ∂(Measure.pi fun _ : Fin k => mu)) =
      (k.factorial : ℂ) * closedSlice n (cutLabels P Q) (cutTest f g) k := by
  have hi (m : Fin n → Mon) (l : Fin r → Mon) :
      Integrable (fun p => (starRingEnd ℂ) ((∏ i, P i (m i)) * openAmp m f k p) *
        ((∏ j, Q j (l j)) * openAmp l g k p)) (Measure.pi fun _ : Fin k => mu) := by
    convert (monomial_pair_integrable k m l f g).const_mul
      ((starRingEnd ℂ) (∏ i, P i (m i)) * ∏ j, Q j (l j)) using 1
    funext p
    rw [map_mul]
    ring
  unfold openAmpL closedSlice
  rw [integral_finite_pair _ _ _ _ _ (fun m _ l _ => hi m l), sum_cut_labels, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro m hm
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro l hl
  calc
    _ = ((starRingEnd ℂ) (∏ i, P i (m i)) * ∏ j, Q j (l j)) *
        ∫ p, (starRingEnd ℂ) (openAmp m f k p) * openAmp l g k p
          ∂(Measure.pi fun _ : Fin k => mu) := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      filter_upwards [] with p
      rw [map_mul]
      ring
    _ = _ := by
      rw [monomial_contraction]
      simp_rw [cutCrossingNumber_eq]
      ring

/-- Regrouping the closed Wick sum by crossing number requires no rearrangement
of an infinite family of integrals: each matching contributes at one index. -/
theorem hasSum_closedSlice {n : ℕ} (b : ℕ) (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) : HasSum (closedSlice b P f) (wightmanL P f) := by
  unfold closedSlice wightmanL
  apply hasSum_sum
  intro m _
  apply HasSum.mul_left
  unfold wightmanMono
  apply hasSum_sum
  intro σ _
  exact hasSum_ite_eq' (crossingCount b σ) _

theorem tsum_closedSlice {n : ℕ} (b : ℕ) (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) :
    ∑' k : ℕ, closedSlice b P f k = wightmanL P f :=
  (hasSum_closedSlice b P f).tsum_eq

theorem closedSlice_ofFn {n : ℕ} (b k : ℕ) (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) :
    closedSlice b (Word.lab (List.ofFn fun i => (P i, f i)))
      (Word.test (List.ofFn fun i => (P i, f i))) k = closedSlice b P f k := by
  exact congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
    closedSlice b (fun i => (s.2 i).1) (fun i => (s.2 i).2) k)
    (List.equivSigmaTuple.apply_symm_apply ⟨n, fun i => (P i, f i)⟩)

theorem ofFn_cut_word (u v : Word) :
    (List.ofFn fun i => (cutLabels u.lab v.lab i, cutTest u.test v.test i)) = dagger u ++ v := by
  have h : (fun i => (cutLabels u.lab v.lab i, cutTest u.test v.test i)) =
      Fin.append (fun i : Fin u.length => (adjL (u.lab i.rev), conjugateTest (u.test i.rev)))
        v.get := by
    funext i
    obtain ⟨j, rfl⟩ := (cutVertexEquiv u.length v.length).surjective i
    cases j <;>
      simp only [cutLabels, cutTest, Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr] <;>
      simp only [cutVertexEquiv_inl, cutVertexEquiv_inr, Fin.append_left, Fin.append_right,
        Fin.rev_rev, Word.lab, Word.test]
  rw [h, List.ofFn_fin_append, List.ofFn_get]
  congr 1
  have hrev : (List.ofFn fun i : Fin u.length => u.get i.rev) = u.reverse := by
    apply List.ext_getElem
    · simp
    · intro i hi hi'
      simp [Fin.rev, Nat.sub_sub, Nat.add_comm]
  rw [dagger, ← hrev, List.map_ofFn]
  rfl

/-- Contraction in one particle sector, after expanding the finite label supports. -/
theorem sector_contraction (u v : Word) (k : ℕ)
    (_hpair : Integrable (fun p : Fin k → Spacetime =>
      (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p)
        (Measure.pi fun _ : Fin k => mu))
    (_hclosed : ∀ (m : Fin (dagger u ++ v).length → Mon) (σ : Matching m),
      Integrable (matchingIntegrand σ (dagger u ++ v).test)) :
    (∫ p : Fin k → Spacetime, (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p
      ∂(Measure.pi fun _ : Fin k => mu)) =
      (Nat.factorial k : ℂ) *
        closedSlice u.length (dagger u ++ v).lab (dagger u ++ v).test k := by
  have h := label_contraction u.lab v.lab u.test v.test k
  have hw := closedSlice_ofFn u.length k (cutLabels u.lab v.lab) (cutTest u.test v.test)
  rw [ofFn_cut_word] at hw
  change _ = (Nat.factorial k : ℂ) * _
  rw [hw]
  exact h

end CutIdentity

theorem cut_identity' (u v : Word) :
    ∑' k : ℕ, ((Nat.factorial k : ℂ))⁻¹ *
        ∫ p : Fin k → Spacetime, (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p
          ∂(Measure.pi fun _ : Fin k => mu) =
      wightW (dagger u ++ v) := by
  calc
    _ = ∑' k : ℕ,
        CutIdentity.closedSlice u.length (dagger u ++ v).lab (dagger u ++ v).test k := by
      apply tsum_congr
      intro k
      rw [CutIdentity.sector_contraction u v k
        (CutIdentity.integrable_amplitude_pair u v k)
        (fun m σ => matching_integrable m σ (dagger u ++ v).test)]
      have hk : (Nat.factorial k : ℂ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero k
      rw [← mul_assoc, inv_mul_cancel₀ hk, one_mul]
    _ = _ := CutIdentity.tsum_closedSlice _ _ _

end YangMills.FreeField.Consolidated.Theory_CutIdentity

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 1500 lines] **Cut identity.** Cutting the matchings of the word `u† ++ v` between its
two halves: the lines crossing the cut are `k` in number; a matching of `u† ++ v` with `k` crossing
lines corresponds to `k!` triples (open matching of `u`, open matching of `v`, labellings of the
crossing lines by `Fin k` on both sides), whence the factor `1/k!`. Fubini (by `openAmpW_memLp`
and `matching_integrable`) and, on the `u` side,
`conj (Amono α q * Bmono β q) = (-1)^{α_t + β_t} Amono β q * Bmono α q`,
`conj (fourierE f k) = fourierE (conjugateTest f) (-k)`, `conj (Bmono β p) = (-1)^{β_t} Amono β p`;
the signs assemble to `adjL`. Check in the simplest cases (`FreeField/Check/check_conventions.py`):
`u = v = [({0}, f)]` gives `∫ |f̂|² dμ` on both sides, and `u = v = [({0,0}, f)]` gives
`(1/2!) ∫ |2 f̂(p₁+p₂)|² = 2 ∫ |f̂(p₁+p₂)|²`. The sum is finite by `openAmpW_eq_zero`. -/
theorem cut_identity (u v : Word) :
    ∑' k : ℕ, ((Nat.factorial k : ℂ))⁻¹ *
        ∫ p : Fin k → Spacetime, (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p
          ∂(Measure.pi fun _ : Fin k => mu) =
      wightW (dagger u ++ v) := by
  exact Consolidated.Theory_CutIdentity.cut_identity' u v

end YangMills.FreeField
