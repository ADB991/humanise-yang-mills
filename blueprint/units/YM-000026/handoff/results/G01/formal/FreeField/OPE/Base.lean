import FreeField.Hierarchy
import FreeField.Analytic

/-!
# Free-field witness, module D: the operator product expansion

See `FreeField/DESIGN.md` section 7 and `FreeField/TASKS.md`.

These are the unchanged kernel, matching, point-split correlation, and coefficient
definitions used by the OPE proof layers. `FreeField.OPE` imports those layers and assembles
`exists_ope_coefficient`; see `FreeField/CONSOLIDATION.md` for the layout.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

/-! ## Hypotheses on a line kernel -/

/-- What the expansion needs from a line kernel. For `lineS`: `lineS_kernelHyp`. -/
structure KernelHyp (K : Idx → Idx → Spacetime → ℂ) : Prop where
  /-- exchange of the two ends -/
  symm : ∀ α β ξ, K α β ξ = K β α (-ξ)
  smooth : ∀ α β, ContDiffOn ℝ ∞ (K α β) {(0 : Spacetime)}ᶜ
  /-- a derivative at the earlier end (`ξ = y - x`, derivative in `x`) raises `α` -/
  deriv_left : ∀ α β (i : Fin 4) (ξ : Spacetime), ξ ≠ 0 →
    fderiv ℝ (K α β) ξ (EuclideanSpace.single i (1 : ℝ)) = -K (α + Pi.single i 1) β ξ
  /-- a derivative at the later end raises `β` -/
  deriv_right : ∀ α β (i : Fin 4) (ξ : Spacetime), ξ ≠ 0 →
    fderiv ℝ (K α β) ξ (EuclideanSpace.single i (1 : ℝ)) = K α (β + Pi.single i 1) ξ
  /-- scaling bound: a line between legs of grades `4 + |α|` and `4 + |β|` -/
  bound : ∀ α β, ∃ C : ℝ, ∀ ξ : Spacetime, ξ ≠ 0 →
    ‖K α β ξ‖ ≤ C / ‖ξ‖ ^ (8 + idxOrder α + idxOrder β)

/-! ## Generic correlations -/

variable {I J : Type}

/-- The correlation built from `K`; for `K = lineS` this is `corrL` (by `rfl`). -/
def gcorr (K : Idx → Idx → Spacetime → ℂ) {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (x : Points n) : ℂ :=
  if x ∈ WilsonFamily.separated n then
    wickL (fun v w α β => K α β (x.ofLp w - x.ofLp v)) P
  else 0

/-- The grouped correlation of tags, as in `Hierarchy.grouped`. -/
def ggrouped (K : Idx → Idx → Spacetime → ℂ) [Fintype I] [Fintype J] (a : I → Tag)
    (x : I → Spacetime) (b : J → Tag) (y : J → Spacetime) : ℂ :=
  gcorr K (fun k => tagLabel (((Sum.elim a b) ∘ (Fintype.equivFin (I ⊕ J)).symm) k))
    (WithLp.toLp 2 ((Sum.elim x y) ∘ (Fintype.equivFin (I ⊕ J)).symm))

/-- The grouped Wick sum of monomials (no separation condition). -/
def gwickGrouped (K : Idx → Idx → Spacetime → ℂ) [Fintype I] [Fintype J] (m : I → Mon)
    (x : I → Spacetime) (mb : J → Mon) (y : J → Spacetime) : ℂ :=
  wickSum (fun v w α β => K α β
      ((Sum.elim x y) ((Fintype.equivFin (I ⊕ J)).symm w) -
        (Sum.elim x y) ((Fintype.equivFin (I ⊕ J)).symm v)))
    ((Sum.elim m mb) ∘ (Fintype.equivFin (I ⊕ J)).symm)

/-! ## Partial matchings and the coefficients -/

/-- Legs of monomials indexed by an arbitrary type. -/
abbrev PLeg (m : I → Mon) : Type := Σ i : I, (m i).ToType

/-- Partial matchings of the legs (internal lines of a cluster): involutions whose non-fixed
legs are paired with legs of other vertices. -/
abbrev PMatching [Fintype I] (m : I → Mon) : Type :=
  {σ : Equiv.Perm (PLeg m) // (∀ ℓ, σ (σ ℓ) = ℓ) ∧ ∀ ℓ, σ ℓ ≠ ℓ → (σ ℓ).1 ≠ ℓ.1}

/-- The unmatched legs of a partial matching. -/
abbrev Unmatched [Fintype I] {m : I → Mon} (σ : PMatching m) : Type := {ℓ : PLeg m // σ.1 ℓ = ℓ}

/-- The product over the internal lines, each counted once (oriented by an enumeration of `I`;
by `KernelHyp.symm` the orientation is immaterial). -/
def internalProd (K : Idx → Idx → Spacetime → ℂ) [Fintype I] {m : I → Mon} (σ : PMatching m)
    (x : I → Spacetime) : ℂ :=
  ∏ ℓ : PLeg m, if Fintype.equivFin I ℓ.1 < Fintype.equivFin I (σ.1 ℓ).1 then
    K ℓ.2.1 (σ.1 ℓ).2.1 (x (σ.1 ℓ).1 - x ℓ.1) else 1

/-- Multi-indices with entries at most `N`. -/
def idxBox (N : ℕ) : Finset Idx := Fintype.piFinset fun _ : Fin 4 => Finset.range (N + 1)

/-- The monomial `y^β`. -/
def monoPow (y : Spacetime) (β : Idx) : ℂ := ∏ i : Fin 4, ((y i : ℝ) : ℂ) ^ β i

/-- `β!`. -/
def idxFact (β : Idx) : ℕ := ∏ i : Fin 4, (β i).factorial

/-- The coefficient of the channel monomial `c` in the expansion of the monomials `m` at `x`
about `o`: sum over partial matchings `σ` and over assignments `β` of a Taylor multi-index to
every unmatched leg `e` such that the multiset `{α_e + β_e}` is `c`, of the internal lines times
`∏_e (x_e - o)^{β_e} / β_e!`. -/
def gcoefMono (K : Idx → Idx → Spacetime → ℂ) [Fintype I] (m : I → Mon) (c : Mon)
    (x : I → Spacetime) (o : Spacetime) : ℂ :=
  ∑ σ : PMatching m,
    ∑ β ∈ (Fintype.piFinset fun _ : Unmatched σ => idxBox (grade c)).filter
        (fun β => (Finset.univ.val.map fun e : Unmatched σ => e.1.2.1 + β e) = c),
      internalProd K σ x *
        ∏ e : Unmatched σ, monoPow (x e.1.1 - o) (β e) / (idxFact (β e) : ℂ)

/-- **The coefficient family**: multilinear extension of `gcoefMono` to tags, and `0` when the
insertion points are not pairwise distinct. -/
def gcoef (K : Idx → Idx → Spacetime → ℂ) : Coef := fun I _ a _ ch x o =>
  if Injective x then
    ∑ μ ∈ Fintype.piFinset (fun i : I => (tagLabel (a i)).support),
      (∏ i, tagLabel (a i) (μ i)) * gcoefMono K μ ch.1 x o
  else 0

/-! ## Point-split correlations -/

/-- Matchings of point-split legs `U` with the legs of the spectators: every element of `U` is
paired with a spectator leg, the other spectator legs among themselves without self-lines. -/
abbrev SMatching (U : Type) [Fintype U] [Fintype J] (mb : J → Mon) : Type :=
  {τ : Equiv.Perm (U ⊕ PLeg mb) // (∀ ℓ, τ (τ ℓ) = ℓ) ∧
    (∀ u : U, ∃ ℓ' : PLeg mb, τ (Sum.inl u) = Sum.inr ℓ') ∧
    ∀ ℓ : PLeg mb, τ (Sum.inr ℓ) ≠ Sum.inr ℓ ∧
      ∀ ℓ' : PLeg mb, τ (Sum.inr ℓ) = Sum.inr ℓ' → ℓ'.1 ≠ ℓ.1}

/-- The correlation of the multi-local normal product `:∏_u ξ_{α u}(z u):` with the spectator
monomials `mb` at `y`. No line joins two elements of `U`, so this is smooth in `z` as long as
no `z u` meets a spectator point. -/
def splitCorr (K : Idx → Idx → Spacetime → ℂ) {U : Type} [Fintype U] [Fintype J] (α : U → Idx)
    (z : U → Spacetime) (mb : J → Mon) (y : J → Spacetime) : ℂ :=
  ∑ τ : SMatching U mb,
    (∏ u : U, Sum.elim (fun _ => (1 : ℂ))
      (fun ℓ' : PLeg mb => K (α u) ℓ'.2.1 (y ℓ'.1 - z u)) (τ.1 (Sum.inl u))) *
    ∏ ℓ : PLeg mb, Sum.elim (fun _ => (1 : ℂ))
      (fun ℓ' : PLeg mb => if Fintype.equivFin J ℓ.1 < Fintype.equivFin J ℓ'.1 then
        K ℓ.2.1 ℓ'.2.1 (y ℓ'.1 - y ℓ.1) else 1) (τ.1 (Sum.inr ℓ))

end YangMills.FreeField
