import FreeField.TwoPoint

/-!
# Free-field witness: Wick sums, the correlations, their continuation, and the Wightman functions

See `FreeField/DESIGN.md`, section (d). Everything in this file is a definition, except for two
elementary vanishing lemmas.

For monomials `m v` at the vertices `v : Fin n`, the legs are the pairs (vertex, element of the
multiset). A matching is a fixed-point-free involution of the legs that never pairs two legs of
the same vertex (normal ordering: no self-lines). Every `n`-point function of the model is a sum
over matchings; only the line kernel changes between the Euclidean correlation, its analytic
continuation, and the Wightman distribution.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open MeasureTheory
open scoped BigOperators Classical InnerProductSpace

variable {n : ℕ}

/-- The legs of the monomials `m v`. -/
abbrev Leg (m : Fin n → Mon) : Type := Σ v : Fin n, (m v).ToType

/-- The derivative multi-index carried by a leg. -/
def Leg.idx {m : Fin n → Mon} (ℓ : Leg m) : Idx := ℓ.2.1

/-- Complete contraction schemes without self-lines. -/
abbrev Matching (m : Fin n → Mon) : Type :=
  {σ : Equiv.Perm (Leg m) // (∀ ℓ, σ (σ ℓ) = ℓ) ∧ ∀ ℓ, (σ ℓ).1 ≠ ℓ.1}

/-- The Wick sum of a family of line kernels `K v w α β` (used only for `v < w`): the sum over
matchings of the product over lines, each line oriented from its earlier to its later vertex. -/
def wickSum (K : Fin n → Fin n → Idx → Idx → ℂ) (m : Fin n → Mon) : ℂ :=
  ∑ σ : Matching m, ∏ ℓ : Leg m,
    if ℓ.1 < (σ.1 ℓ).1 then K ℓ.1 (σ.1 ℓ).1 ℓ.idx (σ.1 ℓ).idx else 1

/-- Multilinear extension of the Wick sum from monomials to labels. -/
def wickL (K : Fin n → Fin n → Idx → Idx → ℂ) (P : Fin n → (Mon →₀ ℂ)) : ℂ :=
  ∑ μ ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (μ i)) * wickSum K μ

/-- A zero label in one slot kills the Wick sum. -/
theorem wickL_eq_zero_of_zero (K : Fin n → Fin n → Idx → Idx → ℂ) (P : Fin n → (Mon →₀ ℂ))
    (k : Fin n) (hk : P k = 0) : wickL K P = 0 := by
  unfold wickL
  have : Fintype.piFinset (fun i => (P i).support) = ∅ := by
    rw [Fintype.piFinset_eq_empty]
    exact ⟨k, by simp [hk]⟩
  rw [this, Finset.sum_empty]

/-- Line kernels of the Euclidean correlation at the points `x`. -/
def kernelS (x : Fin n → Spacetime) : Fin n → Fin n → Idx → Idx → ℂ :=
  fun v w α β => lineS α β (x w - x v)

/-- Line kernels of the continuation at complex times `z` and spatial points `u`. -/
def kernelC (z : Fin n → ℂ) (u : Fin n → Space) : Fin n → Fin n → Idx → Idx → ℂ :=
  fun v w α β => lineC α β (z w - z v) (u w - u v)

/-- The Euclidean correlation (Schwinger function) of the labels `P` at `x`: the Wick sum at
pairwise distinct points, and `0` otherwise. -/
def corrL (P : Fin n → (Mon →₀ ℂ)) (x : Points n) : ℂ :=
  if x ∈ WilsonFamily.separated n then wickL (kernelS x.ofLp) P else 0

/-- The analytic continuation of the Wightman function of the labels `P`. -/
def contL (P : Fin n → (Mon →₀ ℂ)) (z : Fin n → ℂ) (u : Fin n → Space) : ℂ :=
  wickL (kernelC z u) P

theorem corrL_eq_zero_of_zero (P : Fin n → (Mon →₀ ℂ)) (x : Points n) (k : Fin n)
    (hk : P k = 0) : corrL P x = 0 := by
  unfold corrL
  split_ifs
  · exact wickL_eq_zero_of_zero _ P k hk
  · rfl

/-! ## The Wightman distributions in momentum space -/

/-- The Fourier transform in the Euclidean pairing and without any `2π`:
`f̂(k) = ∫ f(x) e^{i⟨x,k⟩} dx`. With this convention `φ(f)Ω` is the one-particle function `f̂`. -/
def fourierE (f : TestFunction) (k : Spacetime) : ℂ :=
  ∫ x : Spacetime, f x * Complex.exp (Complex.I * ((⟪x, k⟫_ℝ : ℝ) : ℂ))

/-- The lines of a matching, each represented by its earlier leg. -/
abbrev Line {m : Fin n → Mon} (σ : Matching m) : Type := {ℓ : Leg m // ℓ.1 < (σ.1 ℓ).1}

/-- The momentum entering the vertex `v`: incoming lines (from earlier vertices) minus outgoing
lines (to later vertices). -/
def vertexMomentum {m : Fin n → Mon} (σ : Matching m) (q : Line σ → Spacetime) (v : Fin n) :
    Spacetime :=
  (∑ ℓ : Line σ, if (σ.1 ℓ.1).1 = v then q ℓ else 0) -
    ∑ ℓ : Line σ, if ℓ.1.1 = v then q ℓ else 0

/-- The Wightman function `⟨Ω, m₀(f₀) ⋯ m_{n-1}(f_{n-1}) Ω⟩` of Wick monomials: for each matching,
the integral over the line momenta, each with the measure `weight · dp`, of the product of the
leg factors and of the Fourier transforms of the tests at the vertex momenta. -/
def wightmanMono (m : Fin n → Mon) (f : Fin n → TestFunction) : ℂ :=
  ∑ σ : Matching m, ∫ q : Line σ → Spacetime,
    (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)) *
      ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v)

/-- Multilinear extension of the Wightman functions from monomials to labels. -/
def wightmanL (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction) : ℂ :=
  ∑ μ ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (μ i)) * wightmanMono μ f

/-- A single vertex with exactly one leg admits no matching. -/
theorem isEmpty_matching_single (α : Idx) : IsEmpty (Matching (fun _ : Fin 1 => ({α} : Mon))) := by
  refine ⟨fun σ => ?_⟩
  have hcard : Fintype.card (({α} : Mon).ToType) = 1 := by
    rw [Multiset.card_coe]; rfl
  obtain ⟨e⟩ : Nonempty (({α} : Mon).ToType) := Fintype.card_pos_iff.1 (by omega)
  exact σ.2.2 ⟨0, e⟩ (Subsingleton.elim _ _)

/-- The one-point function of a monomial with one leg vanishes. -/
theorem wightmanL_single_leg (c : ℂ) (α : Idx) (f : Fin 1 → TestFunction) :
    wightmanL (fun _ : Fin 1 => Finsupp.single ({α} : Mon) c) f = 0 := by
  unfold wightmanL
  refine Finset.sum_eq_zero fun μ hμ => ?_
  have hμ0 : μ = fun _ => ({α} : Mon) := by
    funext i
    have := Fintype.mem_piFinset.1 hμ i
    have h2 := Finsupp.support_single_subset this
    simpa using h2
  subst hμ0
  haveI := isEmpty_matching_single α
  simp [wightmanMono]

end YangMills.FreeField
