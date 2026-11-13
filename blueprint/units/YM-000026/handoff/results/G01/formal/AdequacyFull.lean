import Adequacy
import Solution

/-!
# Unconditional corollary in the full project

The body of `YangMills.JointExistence` holds with a Wilson family whose insertions do not depend
on the gauge configuration. The input hierarchy is the concrete `YangMills.hierarchy F Q`
produced by `YangMills.constructed`; its selected correlation is a `MultilinearMap` in the field
components (`YM.Spec.Table.classMoment`), hence vanishes when one slot carries the zero vector.
-/

set_option autoImplicit false

namespace YangMills

private theorem tag_snd_eq_zero {ι : Type} {β : ι → Type} [∀ i, Zero (β i)] {i₀ : ι}
    (t : (i : ι) × β i) (h : t = ⟨i₀, 0⟩) : t.2 = 0 := by
  subst h; rfl

theorem jointExistence_with_constant_insertions :
    ∀ g : GaugeGroup, g.IsSimple → ∃ C : WilsonFamily g,
      (WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
        ∃ T : Hierarchy C, T.Properties (p ∘ q)) ∧
      (∀ (N p : ℕ) (v : C.Token) (x : Site (C.period p * C.denominator N))
        (U V : Configuration g (C.period p * C.denominator N)),
        C.insertion N p v x U = C.insertion N p v x V) := by
  intro g hg
  obtain ⟨C, _, _, _, orders⟩ := YangMills.constructed.{0,0} g hg 1 zero_lt_one
  obtain ⟨q, S, F, L, Q, M, X, core, _⟩ := orders YM.Extraction.Order.full
  refine jointExistence_body_constant_insertions (wilsonFamily C) (hierarchy F Q)
    core.reconstruction core.ope core.nonfree ?_
  rintro n a x ⟨k, hk⟩
  have hz : (a k).2 = 0 := tag_snd_eq_zero (β := (hierarchy F Q).Field) (a k) hk
  exact MultilinearMap.map_coord_zero
    (S.classMoment (YM.OPE.spectator F (some (hierarchy F Q).selected)) (fun i => (a i).1) x)
    k hz

end YangMills

#print axioms YangMills.jointExistence_with_constant_insertions
