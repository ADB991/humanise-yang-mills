import GroupIndependence
import FreeField.Wick

/-!
# Free-field witness, module B (data): the hierarchy

See `FreeField/DESIGN.md`, section (b). All fields of `YangMills.Hierarchy` are filled in here;
the Wightman theory and the OPE coefficient functions are parameters (they are supplied in
`FreeField.Main` from the existence statements of modules A and D).
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

/-- Tags: a grade together with a field of that grade. This is also the token type. -/
abbrev Tag : Type := Σ d, Field d

/-- The label of a tag. -/
def tagLabel (a : Tag) : Mon →₀ ℂ := toLabel a.1 a.2

/-- The type of OPE coefficient families. -/
abbrev Coef : Type 1 :=
  ∀ (I : Type) [Fintype I], (I → Tag) → (j : ℕ) → Channel j → (I → Spacetime) → Spacetime → ℂ

/-- The hierarchy of the generalized free field over the Haar family of `g`.
* The correlation does not depend on the phase; the two-point phase space of `Adequacy` is reused
  only because all its instances are available.
* `lam` rescales the trace field `φ`; the group enters only here. -/
def hier (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels) (coef : Coef)
    (lam : ℂ) : Hierarchy (GroupIndependence.haarFamily g Tag) where
  H := H
  labels := labels
  theory := th
  Field := Field
  toLabel := toLabel
  project := id
  Character := Adequacy.Phase
  phaseMeasure := Adequacy.Phase.measure
  selected := Adequacy.Phase.plus
  correlation := fun _ a x => corrL (fun i => tagLabel (a i)) x
  continuation := fun a z u => contL (fun i => tagLabel (a i)) z u
  Channel := Channel
  actor := actor
  coefficient := fun {I} _ a j => coef I a j
  centeredTrace := lam • theta

variable (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels) (coef : Coef)
  (lam : ℂ)

/-- The vanishing hypothesis of `YangMills.constant_insertion_witness`: the correlation is
multilinear in the labels, and the zero vector of grade zero has the zero label. -/
theorem hier_vanishes (n : ℕ) (a : Fin n → (hier g H th coef lam).Tag) (x : Points n)
    (h : ∃ k, a k = ⟨0, 0⟩) :
    (hier g H th coef lam).correlation (some (hier g H th coef lam).selected) a x = 0 := by
  obtain ⟨k, hk⟩ := h
  refine corrL_eq_zero_of_zero _ x k ?_
  show tagLabel (a k) = 0
  rw [hk]
  exact map_zero (toLabel 0)

theorem theta_label_ne_zero : toLabel 4 theta ≠ 0 := by
  rw [Ne, map_eq_zero_iff _ (toLabel_injective 4)]
  intro h
  have := congrFun h phiMon
  simp [theta] at this

end YangMills.FreeField
