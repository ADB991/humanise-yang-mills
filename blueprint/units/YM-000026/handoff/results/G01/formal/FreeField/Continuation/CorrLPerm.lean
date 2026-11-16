import FreeField.Continuation.Base
import FreeField.Analytic.LineSSymm


/-! Proofs consolidated from `FreeField/Work/corrL_perm.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Continuation_CorrLPerm
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable {n : ℕ}

namespace CorrPermProof

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

private def legEquiv (m : Fin n → Mon) (π : Equiv.Perm (Fin n)) :
    Leg (m ∘ π) ≃ Leg m := Equiv.sigmaCongrLeft (β := fun v => (m v).ToType) π

private theorem legEquiv_vertex (m : Fin n → Mon) (π : Equiv.Perm (Fin n))
    (l : Leg (m ∘ π)) : (legEquiv m π l).1 = π l.1 := rfl

private theorem legEquiv_idx (m : Fin n → Mon) (π : Equiv.Perm (Fin n))
    (l : Leg (m ∘ π)) : (legEquiv m π l).idx = l.idx := rfl

private def matchingEquiv (m : Fin n → Mon) (π : Equiv.Perm (Fin n)) :
    Matching (m ∘ π) ≃ Matching m :=
  (legEquiv m π).permCongr.subtypeEquiv (by
    intro σ
    simp only [Equiv.permCongr_apply]
    constructor
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        simp [hi]
      · intro l
        obtain ⟨l, rfl⟩ := (legEquiv m π).surjective l
        simp only [Equiv.symm_apply_apply, legEquiv_vertex]
        exact fun he => hv l (π.injective he)
    · rintro ⟨hi, hv⟩
      constructor
      · intro l
        have h := hi (legEquiv m π l)
        simpa using h
      · intro l
        have h := hv (legEquiv m π l)
        simp only [Equiv.symm_apply_apply, legEquiv_vertex] at h
        exact fun he => h (congrArg π he))

private theorem wickSum_perm (m : Fin n → Mon) (x : Fin n → Spacetime)
    (π : Equiv.Perm (Fin n)) :
    wickSum (kernelS (x ∘ π)) (m ∘ π) = wickSum (kernelS x) m := by
  unfold wickSum
  apply Fintype.sum_equiv (matchingEquiv m π)
  intro σ
  let f : Leg (m ∘ π) → ℂ := fun l =>
    lineS l.idx (σ.1 l).idx (x (π (σ.1 l).1) - x (π l.1))
  let p : Leg (m ∘ π) → Prop := fun l => l.1 < (σ.1 l).1
  let q : Leg (m ∘ π) → Prop := fun l => π l.1 < π (σ.1 l).1
  have hp : ∀ l, p (σ.1 l) ↔ ¬ p l := by
    intro l
    dsimp [p]
    rw [σ.2.1]
    have hn := σ.2.2 l
    exact ⟨not_lt_of_gt, fun h => lt_of_le_of_ne (le_of_not_gt h) hn⟩
  have hq : ∀ l, q (σ.1 l) ↔ ¬ q l := by
    intro l
    dsimp [q]
    rw [σ.2.1]
    have hn := π.injective.ne (σ.2.2 l)
    exact ⟨not_lt_of_gt, fun h => lt_of_le_of_ne (le_of_not_gt h) hn⟩
  have hf : ∀ l, f (σ.1 l) = f l := by
    intro l
    dsimp [f]
    rw [σ.2.1, lineS_symm, neg_sub]
  calc
    _ = ∏ l, if q l then f l else 1 := orient_prod σ.1 σ.2.1 p q hp hq f hf
    _ = _ := by
      apply Fintype.prod_equiv (legEquiv m π)
      intro l
      have ht : (matchingEquiv m π σ).1 (legEquiv m π l) = legEquiv m π (σ.1 l) := by
        change (legEquiv m π) (σ.1 ((legEquiv m π).symm (legEquiv m π l))) = _
        rw [Equiv.symm_apply_apply]
      rw [ht, legEquiv_vertex, legEquiv_vertex, legEquiv_idx, legEquiv_idx]
      rfl

private theorem wickL_perm (P : Fin n → (Mon →₀ ℂ)) (x : Fin n → Spacetime)
    (π : Equiv.Perm (Fin n)) :
    wickL (kernelS (x ∘ π)) (P ∘ π) = wickL (kernelS x) P := by
  let e : (Fin n → Mon) ≃ (Fin n → Mon) :=
    { toFun := fun m => m ∘ π
      invFun := fun m => m ∘ π.symm
      left_inv := by intro m; funext i; simp
      right_inv := by intro m; funext i; simp }
  unfold wickL
  symm
  apply Finset.sum_equiv e
  · intro m
    simp only [Fintype.mem_piFinset]
    change (∀ i, m i ∈ (P i).support) ↔ ∀ i, m (π i) ∈ (P (π i)).support
    constructor
    · intro h i; exact h (π i)
    · intro h i; simpa using h (π.symm i)
  · intro m hm
    change (∏ i, P i (m i)) * wickSum (kernelS x) m =
      (∏ i, P (π i) (m (π i))) * wickSum (kernelS (x ∘ π)) (m ∘ π)
    rw [wickSum_perm, Equiv.prod_comp π (fun i => P i (m i))]

end CorrPermProof

theorem corrL_perm' (P : Fin n → (Mon →₀ ℂ)) (x : Points n) (hx : x ∈ WilsonFamily.separated n)
    (π : Equiv.Perm (Fin n)) :
    corrL (P ∘ π) (WithLp.toLp 2 (x.ofLp ∘ π)) = corrL P x := by
  have hxπ : WithLp.toLp 2 (x.ofLp ∘ π) ∈ WilsonFamily.separated n :=
    (show Injective x.ofLp from hx).comp π.injective
  rw [corrL, if_pos hxπ, corrL, if_pos hx]
  exact CorrPermProof.wickL_perm P x.ofLp π

end YangMills.FreeField.Consolidated.Continuation_CorrLPerm

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {n : ℕ}

/-- [MEDIUM, 400 lines; depends on `lineS_symm`] **Permutation symmetry** of the Euclidean
correlations.

Proof idea: a permutation `π` of the vertices induces a bijection of legs and of matchings. The
factor of a line is unchanged, because the line kernel is symmetric,
`lineS α β ξ = lineS β α (-ξ)`: `S` is even, so `∂^γ S (-ξ) = (-1)^{|γ|} ∂^γ S ξ`. Only the
orientation convention (earlier to later vertex) is affected. About 250 lines, combinatorial.
The hypothesis `hx` is not needed for the statement to hold (both sides vanish off the separated
set) but it is where smoothness of `S`, hence evenness of derivatives, is available. -/
theorem corrL_perm (P : Fin n → (Mon →₀ ℂ)) (x : Points n) (hx : x ∈ WilsonFamily.separated n)
    (π : Equiv.Perm (Fin n)) :
    corrL (P ∘ π) (WithLp.toLp 2 (x.ofLp ∘ π)) = corrL P x := by
  exact Consolidated.Continuation_CorrLPerm.corrL_perm' P x hx π

end YangMills.FreeField
