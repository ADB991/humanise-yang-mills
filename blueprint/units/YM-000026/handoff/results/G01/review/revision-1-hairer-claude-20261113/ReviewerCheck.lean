import GroupIndependence

/-!
Reviewer check for G01 revision 1 (session hairer-claude-g01-rev1-review-20261113).
Each `example` restates a claim of `formal/README.md` in the reviewer's own words, using only
the public specification, and proves it from the author's theorem. If a statement in the
author's file said something different, the corresponding `example` would fail to elaborate.
-/
set_option autoImplicit false
open YangMills Filter
open scoped Topology

/-- The body of `JointExistence` at `g`, copied from `ChallengeSpec.lean` lines 186–188. -/
def JEBody (g : GaugeGroup) : Prop := ∃ C : WilsonFamily g,
  WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
    ∃ T : Hierarchy C, T.Properties (p ∘ q)

/-- Sanity: `JointExistence` is exactly `∀ simple g, JEBody g`. -/
example : JointExistence ↔ ∀ g : GaugeGroup, g.IsSimple → JEBody g := Iff.rfl

/-- M3 over the public specification: from one hierarchy over `g₀` with the three public
properties, the vanishing hypothesis and the homogeneity hypothesis, the body of
`JointExistence` holds at any `g` of positive dimension. -/
example {g₀ g : GaugeGroup} (C₀ : WilsonFamily g₀) (T₀ : Hierarchy C₀)
    (hR : T₀.Reconstructed) (hO : T₀.OperatorProductExpansion) (hT : T₀.TraceTest)
    (hH : ∀ (n : ℕ) (a : Fin n → T₀.Tag) (x : Points n), (∃ k, a k = ⟨0, 0⟩) →
      T₀.correlation (some T₀.selected) a x = 0)
    (hom : GroupIndependence.HomogeneousTrace T₀ (GroupIndependence.scale g₀ g))
    (hg : 0 < Module.finrank ℝ g.lieAlgebra) : JEBody g := by
  obtain ⟨C, ⟨hreg, h⟩, _⟩ := group_transfer_jointExistence_body C₀ T₀ hR hO hT hH hom hg
  exact ⟨C, hreg, h⟩

/-- The homogeneity hypothesis is implied by degree-two homogeneity of the selected two-point
correlation in the grade-four slots. -/
example {g₀ : GaugeGroup} {C₀ : WilsonFamily g₀} (T₀ : Hierarchy C₀)
    (h : ∀ (c : ℂ) (u : T₀.Field 4) (x : Points 2),
      T₀.correlation (some T₀.selected) (fun _ : Fin 2 => ⟨4, c • u⟩) x =
        c ^ 2 * T₀.correlation (some T₀.selected) (fun _ : Fin 2 => ⟨4, u⟩) x)
    (lam : ℝ) : GroupIndependence.HomogeneousTrace T₀ lam :=
  GroupIndependence.homogeneousTrace_of_homogeneous T₀ h lam

/-- The scalar is `sqrt (dim g / dim g₀)`, as stated. -/
example (g₀ g : GaugeGroup) : GroupIndependence.scale g₀ g =
    Real.sqrt ((Module.finrank ℝ g.lieAlgebra : ℝ) / (Module.finrank ℝ g₀.lieAlgebra : ℝ)) :=
  rfl

#print axioms YangMills.group_transfer_witness
#print axioms YangMills.group_transfer_jointExistence_body
#print axioms YangMills.GroupIndependence.homogeneousTrace_of_homogeneous
