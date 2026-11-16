import Adequacy

/-!
# Free-field witness, module B (algebra): labels, grades and the finite-dimensional filtration

See `FreeField/DESIGN.md`, section (b).

The label space is the free complex vector space on *Wick monomials*. A Wick monomial is a finite
multiset of multi-indices `α : Fin 4 → ℕ`; the multiset `{α₁, …, α_k}` stands for the normal
ordered product `:ξ_{α₁} ⋯ ξ_{α_k}:`, where `ξ_α = i^{α_t} ∂^α φ` (`α_t` the number of time
derivatives) and `φ` is the generalized free field. The empty multiset is the unit.

No algebra structure on labels is used anywhere: the public statement only asks for a vector
space of labels.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function
open scoped BigOperators Classical

/-- Multi-indices of derivatives; the last coordinate is time, as in `YangMills.timeAxis`. -/
abbrev Idx := Fin 4 → ℕ

/-- Wick monomials: finite multisets of derivative multi-indices. -/
abbrev Mon := Multiset Idx

/-- The order `|α|` of a multi-index. -/
def idxOrder (α : Idx) : ℕ := ∑ i, α i

/-- The grade (scaling dimension) of a Wick monomial: `4` for each factor plus the number of
derivatives. -/
def grade (m : Mon) : ℕ := (m.map fun α => 4 + idxOrder α).sum

@[simp] theorem grade_zero : grade (0 : Mon) = 0 := rfl

@[simp] theorem grade_singleton (α : Idx) : grade ({α} : Mon) = 4 + idxOrder α := by
  simp [grade]

theorem idxOrder_zero : idxOrder (0 : Idx) = 0 := by simp [idxOrder]

/-- The bundled label space. -/
abbrev labels : FieldLabels := ⟨Mon →₀ ℂ⟩

/-- Monomials of grade at most `d`. -/
abbrev GradeLE (d : ℕ) : Type := {m : Mon // grade m ≤ d}

/-- Monomials of grade exactly `j`: the channels of the operator product expansion. -/
abbrev Channel (j : ℕ) : Type := {m : Mon // grade m = j}

theorem card_le_grade (m : Mon) : Multiset.card m ≤ grade m := by
  have h := Multiset.card_nsmul_le_sum (s := m.map fun α => 4 + idxOrder α) (a := 1)
    (by
      intro x hx
      obtain ⟨α, _, rfl⟩ := Multiset.mem_map.1 hx
      omega)
  simpa [grade] using h

theorem idxOrder_le_grade {m : Mon} {α : Idx} (h : α ∈ m) : idxOrder α ≤ grade m := by
  have h1 : 4 + idxOrder α ≤ (m.map fun α => 4 + idxOrder α).sum :=
    Multiset.single_le_sum (fun _ _ => Nat.zero_le _) _ (Multiset.mem_map_of_mem _ h)
  unfold grade
  omega

/-- A multiset bounding every monomial of grade at most `d`. -/
def bigMon (d : ℕ) : Mon := d • (Fintype.piFinset fun _ : Fin 4 => Finset.range (d + 1)).val

theorem le_bigMon {m : Mon} {d : ℕ} (h : grade m ≤ d) : m ≤ bigMon d := by
  rw [Multiset.le_iff_count]
  intro α
  by_cases hα : α ∈ m
  · have hmem : α ∈ Fintype.piFinset fun _ : Fin 4 => Finset.range (d + 1) := by
      rw [Fintype.mem_piFinset]
      intro i
      rw [Finset.mem_range]
      have h1 : α i ≤ idxOrder α := Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
      have h2 := idxOrder_le_grade hα
      omega
    have hc : Multiset.count α (Fintype.piFinset fun _ : Fin 4 => Finset.range (d + 1)).val = 1 :=
      Multiset.count_eq_one_of_mem (Finset.nodup _) hmem
    rw [bigMon, Multiset.count_nsmul, hc, mul_one]
    exact (Multiset.count_le_card α m).trans ((card_le_grade m).trans h)
  · rw [Multiset.count_eq_zero_of_notMem hα]
    exact Nat.zero_le _

theorem finite_gradeLE (d : ℕ) : Set.Finite {m : Mon | grade m ≤ d} := by
  refine Set.Finite.subset (Multiset.powerset (bigMon d)).toFinset.finite_toSet ?_
  intro m hm
  simp only [Finset.mem_coe, Multiset.mem_toFinset, Multiset.mem_powerset]
  exact le_bigMon hm

instance (d : ℕ) : Finite (GradeLE d) := (finite_gradeLE d).to_subtype

instance (d : ℕ) : Fintype (GradeLE d) := Fintype.ofFinite _

instance (j : ℕ) : Finite (Channel j) :=
  Finite.of_injective (fun c : Channel j => (⟨c.1, c.2.le⟩ : GradeLE j))
    (fun _ _ h => Subtype.ext (congrArg (fun x : GradeLE j => x.1) h))

instance (j : ℕ) : Fintype (Channel j) := Fintype.ofFinite _

/-- The fields of grade at most `d`, in coordinates with respect to the monomial basis. With
the supremum norm this is a finite-dimensional normed space. `Field 0` is the line spanned by
the unit. -/
abbrev Field (d : ℕ) : Type := GradeLE d → ℂ

/-- Inclusion of the fields of grade at most `d` into the label space. -/
def toLabel (d : ℕ) : Field d →ₗ[ℂ] (Mon →₀ ℂ) :=
  (Finsupp.lmapDomain ℂ ℂ (Subtype.val : GradeLE d → Mon)) ∘ₗ
    (Finsupp.linearEquivFunOnFinite ℂ ℂ (GradeLE d)).symm.toLinearMap

theorem toLabel_injective (d : ℕ) : Injective (toLabel d) := by
  unfold toLabel
  rw [LinearMap.coe_comp]
  exact (Finsupp.mapDomain_injective Subtype.val_injective).comp
    (LinearEquiv.injective _)

theorem toLabel_single (d : ℕ) (m : GradeLE d) (c : ℂ) :
    toLabel d (Pi.single m c) = Finsupp.single m.1 c := by
  unfold toLabel
  have h : (Finsupp.linearEquivFunOnFinite ℂ ℂ (GradeLE d)).symm (Pi.single m c) =
      Finsupp.single m c := by
    ext x
    simp [Finsupp.single_apply]
  rw [LinearMap.comp_apply, LinearEquiv.coe_coe, h, Finsupp.lmapDomain_apply,
    Finsupp.mapDomain_single]

/-- Every label lies in one grade space (`Reconstructed.covers`). -/
theorem toLabel_covers : Surjective (fun a : (Σ d, Field d) => toLabel a.1 a.2) := by
  intro P
  refine ⟨⟨P.support.sup grade, fun m => P m.1⟩, ?_⟩
  have hP : P = ∑ m ∈ P.support, Finsupp.single m (P m) := by
    conv_lhs => rw [← Finsupp.sum_single P]
    rfl
  have hv : (fun m : GradeLE (P.support.sup grade) => P m.1) =
      ∑ m ∈ P.support.attach, Pi.single (⟨m.1, Finset.le_sup m.2⟩ : GradeLE _) (P m.1) := by
    funext m
    rw [Finset.sum_apply]
    by_cases hm : m.1 ∈ P.support
    · rw [Finset.sum_eq_single ⟨m.1, hm⟩]
      · simp
      · intro b _ hb
        rw [Pi.single_apply, if_neg]
        intro h
        exact hb (Subtype.ext (congrArg Subtype.val h).symm)
      · intro h; exact absurd (Finset.mem_attach _ _) h
    · rw [Finsupp.notMem_support_iff.1 hm]
      symm
      refine Finset.sum_eq_zero fun b _ => ?_
      rw [Pi.single_apply, if_neg]
      intro h
      exact hm (by rw [h]; exact b.2)
  show toLabel _ (fun m : GradeLE (P.support.sup grade) => P m.1) = P
  rw [hv, map_sum]
  simp only [toLabel_single]
  conv_rhs => rw [hP]
  exact Finset.sum_attach P.support fun m => Finsupp.single m (P m)

/-- The actor of a channel: the basis vector of its monomial. -/
def actor (j : ℕ) (c : Channel j) : Field j := Pi.single (⟨c.1, c.2.le⟩ : GradeLE j) 1

/-- The monomial `φ` (no derivatives), of grade four. -/
def phiMon : GradeLE 4 := ⟨{(0 : Idx)}, by simp [idxOrder_zero]⟩

/-- The basis vector of `φ` in `Field 4`. The trace field of the witness is a real multiple. -/
def theta : Field 4 := Pi.single phiMon 1

theorem toLabel_theta (c : ℂ) : toLabel 4 (c • theta) = Finsupp.single ({(0 : Idx)} : Mon) c := by
  have : c • theta = Pi.single phiMon c := by
    unfold theta
    rw [← Pi.single_smul, smul_eq_mul, mul_one]
  rw [this, toLabel_single]
  rfl

end YangMills.FreeField
