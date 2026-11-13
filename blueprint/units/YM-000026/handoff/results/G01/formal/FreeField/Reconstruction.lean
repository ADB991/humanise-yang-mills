import FreeField.Labels

/-!
# Free-field witness, module A1: a reconstruction theorem with a concrete host space

See `FreeField/DESIGN.md`, section (a).

The public `WightmanTheory` asks for unbounded operators on a common invariant domain that is
*equal* to the span of the polynomial vectors. This file isolates the part of the construction
that is formal. A `Host` is a Hilbert space `K` carrying
* a vector `Ψ w` for every word `w` in the letters (label, test function): the would-be
  `Φ(A₁,f₁) ⋯ Φ(A_n,f_n) Ω`;
* unitary translations, a projection-valued energy–momentum measure and a Poincaré action,
  in the form of the public structures.
No operator is defined on `K`. `Host.Good` lists the identities between the vectors `Ψ w` that
are needed. `Host.reconstruct` then produces a Wightman theory on the closure of the span of the
`Ψ w`, with domain that span. The field operators are *defined* by `Φ(A,f) Ψ(w) = Ψ((A,f) :: w)`;
they are well defined by the adjoint identity (the argument of the GNS construction), and
positivity is automatic because the `Ψ w` are vectors of a Hilbert space.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open MeasureTheory
open scoped InnerProductSpace

/-- A Hilbert space hosting the polynomial vectors of a field theory. -/
structure Host (Lab : FieldLabels) where
  /-- The host Hilbert space; it may be larger than the closure of the polynomial vectors. -/
  K : HilbertSpace
  /-- The vector of a word; the head of the list is the outermost (leftmost) field. -/
  Ψ : List (Lab.carrier × TestFunction) → K.carrier
  adj : Lab.carrier →ₛₗ[starRingEnd ℂ] Lab.carrier
  translations : TranslationAction K
  energyMomentum : EnergyMomentumMeasure K
  poincare : PoincareAction K Lab

/-- The identities between word vectors that make a `Host` a Wightman theory. -/
structure Host.Good {Lab : FieldLabels} (h : Host Lab) : Prop where
  compat (x : Spacetime) :
    h.poincare.onStates (h.poincare.pureTranslation x) = h.translations.operator x
  vacuum_norm : ‖h.Ψ []‖ = 1
  add_label (A A' : Lab.carrier) (f : TestFunction) (u : List (Lab.carrier × TestFunction)) :
    h.Ψ ((A + A', f) :: u) = h.Ψ ((A, f) :: u) + h.Ψ ((A', f) :: u)
  smul_label (c : ℂ) (A : Lab.carrier) (f : TestFunction)
      (u : List (Lab.carrier × TestFunction)) :
    h.Ψ ((c • A, f) :: u) = c • h.Ψ ((A, f) :: u)
  add_test (A : Lab.carrier) (f f' : TestFunction) (u : List (Lab.carrier × TestFunction)) :
    h.Ψ ((A, f + f') :: u) = h.Ψ ((A, f) :: u) + h.Ψ ((A, f') :: u)
  smul_test (c : ℂ) (A : Lab.carrier) (f : TestFunction)
      (u : List (Lab.carrier × TestFunction)) :
    h.Ψ ((A, c • f) :: u) = c • h.Ψ ((A, f) :: u)
  adjoint (A : Lab.carrier) (f : TestFunction) (u v : List (Lab.carrier × TestFunction)) :
    inner ℂ (h.Ψ ((A, f) :: u)) (h.Ψ v) =
      inner ℂ (h.Ψ u) (h.Ψ ((h.adj A, conjugateTest f) :: v))
  tempered (A : Lab.carrier) (u : List (Lab.carrier × TestFunction)) :
    Continuous fun f : TestFunction => h.Ψ ((A, f) :: u)
  locality (A B : Lab.carrier) (f g : TestFunction) (u : List (Lab.carrier × TestFunction)) :
    FieldSystem.SpacelikeSeparated f g →
      h.Ψ ((A, f) :: (B, g) :: u) = h.Ψ ((B, g) :: (A, f) :: u)
  covariant (s : h.poincare.Symmetry) (u : List (Lab.carrier × TestFunction)) :
    h.poincare.onStates s (h.Ψ u) =
      h.Ψ (u.map fun a => (h.poincare.onLabels s a.1, h.poincare.onTests s a.2))
  label_one (A : Lab.carrier) : h.poincare.onLabels 1 A = A
  label_mul (s t : h.poincare.Symmetry) (A : Lab.carrier) :
    h.poincare.onLabels (s * t) A = h.poincare.onLabels s (h.poincare.onLabels t A)
  spectral (ψ : h.K.carrier) (a : Spacetime) :
    charFun (h.energyMomentum.diagonal ψ) a = inner ℂ ψ (h.translations.operator a ψ)
  positive : h.energyMomentum.projection forwardConeᶜ = 0
  unique (ψ : h.K.carrier) :
    (∀ x, h.translations.operator x ψ = ψ) → ∃ c : ℂ, c • h.Ψ [] = ψ

/-- [HARD (long, formal), 1000–1500 lines; no dependencies] **Reconstruction from a host.** A good host yields a Wightman theory satisfying W0–W3 whose
vacuum expectations are the inner products `⟪Ψ [], Ψ w⟫`, and which is faithful as soon as every
non-zero label moves some word vector.

Proof idea (DESIGN.md (a), about 800 lines, no analysis beyond Mathlib):
* `H` is the topological closure of `D = span (range Ψ)` in `K`, a complete subspace; `domain` is
  `D` inside it, so `denseDomain` and `cyclicVacuum` hold by construction.
* Let `J : (words →₀ ℂ) →ₗ K` extend `Ψ` and let `L_a` prepend the letter `a` to every word. If
  `J x = 0` then `J (L_a x)` is orthogonal to every `Ψ v` by `adjoint`, and it lies in `D`, hence
  vanishes. So `L_a` descends to `D`; `add_label` … `smul_test` give bilinearity in the letter.
* `AdjointAxiom`, `tempered`, `LocalCommutativity` are `adjoint`, `tempered`, `locality` extended
  linearly. The Poincaré operators map `D` to `D` by `covariant`, hence `H` to `H`; W2 follows.
* Energy–momentum: for measurable `B` the host projection maps `H` to `H`. Indeed, for `v ∈ H`
  and `u ⊥ H`, `⟪u, U(a) v⟫ = 0 = ⟪v, U(a) u⟫` for all `a`, so the four vectors `u + i^k v` have
  the same characteristic function `a ↦ ⟪ψ, U(a) ψ⟫`; by `spectral` and
  `MeasureTheory.Measure.ext_of_charFun` their diagonal measures agree, and polarisation gives
  `⟪u, E(B) v⟫ = 0`. For non-measurable `B` put `projection B = 0`.
* `uniqueVacuum`, `positiveEnergy`, `spectralRepresentation` restrict from `K`. -/
theorem Host.reconstruct {Lab : FieldLabels} (h : Host Lab) (hg : h.Good) :
    ∃ (H : HilbertSpace) (th : WightmanTheory H Lab), th.Axioms ∧
      (∀ (n : ℕ) (P : Fin n → Lab.carrier) (f : Fin n → TestFunction),
        th.fields.vacuumExpectation P f =
          inner ℂ (h.Ψ []) (h.Ψ (List.ofFn fun i => (P i, f i)))) ∧
      ((∀ A : Lab.carrier, A ≠ 0 → ∃ f u, h.Ψ ((A, f) :: u) ≠ 0) → th.fields.Faithful) := by
  sorry

end YangMills.FreeField
