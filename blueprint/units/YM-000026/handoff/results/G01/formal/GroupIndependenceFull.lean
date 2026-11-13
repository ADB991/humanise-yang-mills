import GroupIndependence
import Solution

/-!
# Group independence of the public statement, in the full project

The constructed witness for ONE simple gauge group `g₀` (`YangMills.constructed g₀`) yields the
body of `YangMills.JointExistence`, with constant insertions, at EVERY gauge group `g` whose Lie
algebra has positive dimension, in particular at every simple `g`.

The two hypotheses of `YangMills.group_transfer_jointExistence_body` beyond the three public
properties hold for `YangMills.hierarchy F Q` because its correlation is a `MultilinearMap` in
the field components (`YM.Spec.Table.classMoment`): it vanishes when one slot is zero
(`MultilinearMap.map_coord_zero`) and is homogeneous of degree two in two slots
(`MultilinearMap.map_smul_univ`).
-/

set_option autoImplicit false

namespace YangMills

private theorem tag_snd_eq_zero_gi {ι : Type} {β : ι → Type} [∀ i, Zero (β i)] {i₀ : ι}
    (t : (i : ι) × β i) (h : t = ⟨i₀, 0⟩) : t.2 = 0 := by
  subst h; rfl

/-- The constructed witness at one simple group `g₀` gives the body of `JointExistence`, with
constant insertions, at every group `g` of positive dimension. The proof uses
`YangMills.constructed` at `g₀` only. -/
theorem jointExistence_body_any_group_of_one_simple :
    ∀ g₀ : GaugeGroup, g₀.IsSimple → ∀ g : GaugeGroup, 0 < Module.finrank ℝ g.lieAlgebra →
      ∃ C : WilsonFamily g,
        (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
          ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
        (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
          (U V : Configuration g (C.period p * C.denominator N)),
          C.insertion N p v x U = C.insertion N p v x V) := by
  intro g₀ hg₀ g hg
  obtain ⟨C, _, _, _, orders⟩ := YangMills.constructed.{0,0} g₀ hg₀ 1 zero_lt_one
  obtain ⟨q, S, F, L, Q, M, X, core, _⟩ := orders YM.Extraction.Order.full
  refine group_transfer_jointExistence_body (wilsonFamily C) (hierarchy F Q)
    core.reconstruction core.ope core.nonfree ?_ ?_ hg
  · rintro n a x ⟨k, hk⟩
    have hz : (a k).2 = 0 := tag_snd_eq_zero_gi (β := (hierarchy F Q).Field) (a k) hk
    exact MultilinearMap.map_coord_zero
      (S.classMoment (YM.OPE.spectator F (some (hierarchy F Q).selected)) (fun i => (a i).1) x)
      k hz
  · refine Filter.Eventually.of_forall fun r => ?_
    have h := MultilinearMap.map_smul_univ
      (S.classMoment (YM.OPE.spectator F (some (hierarchy F Q).selected))
        (fun _ : Fin 2 => 4) (Hierarchy.timePair r))
      (fun _ : Fin 2 => ((Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) /
        (Module.finrank ℝ g₀.lieAlgebra : ℝ)) : ℝ) : ℂ))
      (fun _ : Fin 2 => (hierarchy F Q).centeredTrace)
    simp only [Fin.prod_univ_two, smul_eq_mul, ← pow_two] at h
    exact h

/-- The same for every simple `g`: simplicity in the public sense implies positive dimension. -/
theorem jointExistence_body_any_simple_of_one_simple :
    ∀ g₀ : GaugeGroup, g₀.IsSimple → ∀ g : GaugeGroup, g.IsSimple →
      ∃ C : WilsonFamily g,
        (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
          ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
        (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
          (U V : Configuration g (C.period p * C.denominator N)),
          C.insertion N p v x U = C.insertion N p v x V) :=
  fun g₀ hg₀ g hg => jointExistence_body_any_group_of_one_simple g₀ hg₀ g
    (GroupIndependence.finrank_pos_of_isSimple g hg)

/-- Hence the existence of one simple gauge group, together with the constructed witness at that
group, gives the whole of `JointExistence`. -/
theorem jointExistence_of_one_simple (g₀ : GaugeGroup) (hg₀ : g₀.IsSimple) : JointExistence :=
  fun g hg =>
    let ⟨C, h, _⟩ := jointExistence_body_any_simple_of_one_simple g₀ hg₀ g hg
    ⟨C, h⟩

end YangMills

#print axioms YangMills.jointExistence_body_any_group_of_one_simple
#print axioms YangMills.jointExistence_body_any_simple_of_one_simple
#print axioms YangMills.jointExistence_of_one_simple
