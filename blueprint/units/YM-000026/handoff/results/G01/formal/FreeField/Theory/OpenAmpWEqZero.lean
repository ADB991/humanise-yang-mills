import FreeField.Theory.Base


/-! Proofs consolidated from `FreeField/Work/openAmpW_eq_zero.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_OpenAmpWEqZero
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

private theorem open_matching_card_le {n k : ℕ} {m : Fin n → Mon}
    (σ : OMatching k m) : k ≤ ∑ i, (m i).card := by
  have hex : ∀ j : Fin k, ∃ ℓ : Leg m, σ.1 (Sum.inl j) = Sum.inr ℓ := by
    intro j
    cases h : σ.1 (Sum.inl j) with
    | inl j' => exact False.elim (σ.2.2 (Sum.inl j) (by simp [h, ovtx]))
    | inr ℓ => exact ⟨ℓ, rfl⟩
  let attach : Fin k → Leg m := fun j => (hex j).choose
  have ha (j : Fin k) : σ.1 (Sum.inl j) = Sum.inr (attach j) := (hex j).choose_spec
  have hi : Function.Injective attach := by
    intro i j h
    apply Sum.inl_injective
    apply σ.1.injective
    rw [ha, ha, h]
  simpa only [Fintype.card_fin, Leg, Fintype.card_sigma, Multiset.card_coe] using
    Fintype.card_le_of_injective attach hi

theorem openAmpW_eq_zero' (w : Word) : ∃ N : ℕ, ∀ k, N < k → openAmpW w k = 0 := by
  let S := Fintype.piFinset (fun i => (w.lab i).support)
  refine ⟨S.sup (fun m => ∑ i, (m i).card), ?_⟩
  intro k hk
  funext p
  change openAmpL w.lab w.test k p = 0
  unfold openAmpL
  apply Finset.sum_eq_zero
  intro m hm
  have hlt : (∑ i, (m i).card) < k := lt_of_le_of_lt
    (Finset.le_sup (s := S) (f := fun m : Fin w.length → Mon => ∑ i, (m i).card) hm) hk
  have : IsEmpty (OMatching k m) :=
    ⟨fun σ => (not_le_of_gt hlt) (open_matching_card_le σ)⟩
  simp [openAmp]


end YangMills.FreeField.Consolidated.Theory_OpenAmpWEqZero

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 120 lines] No open matching exists when there are more external slots than legs:
for monomials `μ`, `OMatching k μ` is empty if `k > ∑ i, card (μ i)`; take the maximum over the
finite supports. -/
theorem openAmpW_eq_zero (w : Word) : ∃ N : ℕ, ∀ k, N < k → openAmpW w k = 0 := by
  exact Consolidated.Theory_OpenAmpWEqZero.openAmpW_eq_zero' w

end YangMills.FreeField
