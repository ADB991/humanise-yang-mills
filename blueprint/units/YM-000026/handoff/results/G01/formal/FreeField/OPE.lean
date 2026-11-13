import FreeField.Hierarchy
import FreeField.Analytic

/-!
# Free-field witness, module D: the operator product expansion

See `FreeField/DESIGN.md` section 7 and `FreeField/TASKS.md`.

The expansion is a statement about Wick sums built from a line kernel `K α β ξ` (the two-point
function of the legs `ξ_α` at `x` and `ξ_β` at `y`, as a function of `ξ = y - x`). Everything in
this file except the last two declarations is generic in `K` and independent of the gauge group,
the Hilbert space and the Wightman theory. The coefficient family is defined explicitly
(`gcoef`), and `exists_ope_coefficient` is proved from the generic statements and
`lineS_kernelHyp`.
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

/-- [EASY, 100 lines] **Kernel estimates for `S`.** `symm` is `lineS_symm`; `smooth` is
`partialDeriv_S_contDiffOn`; the derivative identities are `partialDeriv_S_succ` with
`(-1)^{|α + e_i|} = -(-1)^{|α|}` and `α + β + e_i = (α + e_i) + β = α + (β + e_i)`; `bound` is
`partialDeriv_S_bound` with `idxOrder (α + β) = idxOrder α + idxOrder β`.
Depends on `lineS_symm`, `partialDeriv_S_contDiffOn`, `partialDeriv_S_succ`,
`partialDeriv_S_bound`. -/
theorem lineS_kernelHyp : KernelHyp lineS := by
  sorry

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

/-! ## Generic statements -/

/-- [HARD, 1200 lines] **Factorisation.** Split every matching of the legs of `m` and `mb` into
its lines inside the cluster `I` (a partial matching `σ`) and the rest (a matching of the
unmatched cluster legs and the spectator legs with no line inside the unmatched cluster legs).
Purely combinatorial; `hK` is used only to re-orient lines (the enumerations of `I`, `J` and
`I ⊕ J` need not be compatible). No condition on the points. -/
theorem gwickGrouped_factor {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) [Fintype I] [Fintype J] (m : I → Mon)
    (x : I → Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    gwickGrouped K m x mb y =
      ∑ σ : PMatching m, internalProd K σ x *
        splitCorr K (fun e : Unmatched σ => e.1.2.1) (fun e : Unmatched σ => x e.1.1) mb y := by
  sorry

/-- [MEDIUM, 400 lines] **Collapse.** With all split legs at one point `o`, the point-split
correlation is the grouped Wick sum of the single monomial `{α u | u}` at `o` with the
spectators (choose a bijection of `U` with the legs of that multiset preserving indices). -/
theorem splitCorr_collapse {K : Idx → Idx → Spacetime → ℂ}
    (hK : ∀ α β ξ, K α β ξ = K β α (-ξ)) {U : Type} [Fintype U] [Fintype J] (α : U → Idx)
    (o : Spacetime) (mb : J → Mon) (y : J → Spacetime) :
    splitCorr K α (fun _ => o) mb y =
      gwickGrouped K (fun _ : Unit => (Finset.univ.val.map α : Mon)) (fun _ => o) mb y := by
  sorry

/-- [MEDIUM, 200 lines] **Jets.** Moving one split leg: a derivative in its position raises its
multi-index. Each matching has exactly one line at `u₀`, `K (α u₀) β (y j - z u₀)`, and
`d/dz` of it in direction `e_i` is `-fderiv … = K (α u₀ + e_i) β …` by `deriv_left`. -/
theorem splitCorr_fderiv {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) {U : Type}
    [Fintype U] [Fintype J] (α : U → Idx) (z : U → Spacetime) (mb : J → Mon)
    (y : J → Spacetime) (u₀ : U) (i : Fin 4) (hz : ∀ j, y j ≠ z u₀) :
    fderiv ℝ (fun t : Spacetime => splitCorr K α (Function.update z u₀ t) mb y) (z u₀)
        (EuclideanSpace.single i (1 : ℝ)) =
      splitCorr K (Function.update α u₀ (α u₀ + Pi.single i 1)) z mb y := by
  sorry

/-- [MEDIUM, 500 lines] **Coefficient bound.** For monomials of true total grade `w' ≤ weight a`:
an internal line between legs `α`, `α'` is at most `C (η r)^{-(8+|α|+|α'|)}` by `hK.bound` and
`Within`; the matched legs carry total grade `w' - g₀`, `g₀` the grade of the unmatched legs;
the Taylor monomials are at most `(M r)^{|β|}` with `g₀ + ∑|β_e| = j`. So each term is at most
`C r^{j - w'} ≤ C r^{j - weight a}` for `r < 1`, there are finitely many terms, and the constant
is absorbed by `r^{-ε}`. Uses only `hK.bound`. -/
theorem gope_coefficients {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    (a : I → Tag) (M η ε : ℝ) :
    0 ≤ M → 0 < η → 0 < ε → ∀ (j : ℕ) (i : Channel j), ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o, Hierarchy.Within r M η x o →
        ‖gcoef K I a j i x o‖ ≤ r ^ ((j : ℝ) - ∑ i, ((a i).1 : ℝ) - ε) := by
  sorry

/-- [HARD, 2500 lines] **Remainder bound.** For `r` small (`M r < c / 2`, `r < 1`) all points of
both grouped configurations are distinct, so `ggrouped` is the multilinear extension of
`gwickGrouped`. By `gwickGrouped_factor` it is `∑_σ internalProd · F_σ (x ∘ vertex)` with
`F_σ z = splitCorr K idx z mb y`. If the grade `g₀` of the unmatched legs is `≤ D`, expand
`F_σ` about `(o,…,o)` to total order `D - g₀` along the segment (`taylor_mean_remainder` in one
variable; iterated derivatives by `splitCorr_fderiv`): the Taylor terms are, by
`splitCorr_collapse`, exactly the terms of `gcoefMono` for the channels of grade `≤ D` times the
correlation of the actor, and the remainder is at most `(M r)^{D-g₀+1}` times a bound for
`splitCorr` with raised indices on the segment, which is uniform in `o`, `y` because every
argument of `K` has norm `≥ c / 2` (`hK.bound`). If `g₀ > D` nothing is subtracted and
`|internalProd · F_σ| ≤ C r^{g₀ - w'} ≤ C r^{D+1-w'}`. Sum over the finitely many `σ` and
monomials; `w' ≤ weight a`; absorb the constant in `r^{-ε}`.
Depends on `gwickGrouped_factor`, `splitCorr_collapse`, `splitCorr_fderiv`. -/
theorem gope_remainder {K : Idx → Idx → Spacetime → ℂ} (hK : KernelHyp K) [Fintype I]
    [Fintype J] (a : I → Tag) (b : J → Tag) (M η c ε : ℝ) :
    0 ≤ M → 0 < η → 0 < c → 0 < ε → ∀ D : ℕ, ∀ᶠ r : ℝ in 𝓝[>] 0,
      ∀ x o y, Hierarchy.Within r M η x o → Hierarchy.Clear o y c →
        ‖ggrouped K a x b y -
          ∑ j : Fin (D + 1), ∑ i : Channel j.val, gcoef K I a j.val i x o *
            ggrouped K (fun _ : Unit => (⟨j.val, actor j.val i⟩ : Tag)) (fun _ => o) b y‖
          ≤ r ^ ((D : ℝ) + 1 - ∑ i, ((a i).1 : ℝ) - ε) := by
  sorry

/-! ## The hierarchy -/

/-- **Operator product expansion.** The explicit coefficient family `gcoef lineS` satisfies both
clauses of `OperatorProductExpansion` for the hierarchy of every gauge group, Wightman theory and
trace scale. -/
theorem exists_ope_coefficient :
    ∃ coef : Coef, ∀ (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels)
      (lam : ℂ), (hier g H th coef lam).OperatorProductExpansion := by
  refine ⟨gcoef lineS, fun g H th lam => ?_⟩
  exact
    { coefficients := fun {I} _ a M η ε hM hη hε j i =>
        gope_coefficients lineS_kernelHyp a M η ε hM hη hε j i
      remainder := fun {I J} _ _ a b M η c ε hM hη hc hε D => by
        filter_upwards [gope_remainder lineS_kernelHyp a b M η c ε hM hη hc hε D]
          with r hr x o y hW hC s
        exact hr x o y hW hC }

end YangMills.FreeField
