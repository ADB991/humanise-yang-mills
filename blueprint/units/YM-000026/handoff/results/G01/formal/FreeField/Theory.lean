import FreeField.Symmetry

/-!
# Free-field witness, module A2: the Fock host is good

The data are defined in `FreeField.Fock` and `FreeField.Symmetry`. This file states the facts
about them as separate lemmas (each with a difficulty tag EASY / MEDIUM / HARD, an estimate of
lines, and its dependencies; see `FreeField/TASKS.md`) and then *proves* `exists_fockHost` and
`exists_wightmanTheory` from them. See `FreeField/DESIGN.md` section 5.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-! ## A. Operators of multiplication and composition type -/

/-- [MEDIUM, 300 lines] **The sectorwise operator exists.** If every `c k` is measurable and
bounded by one and every `T k` preserves `mu^{⊗k}`, then `fockOp c T` acts sectorwise by
`ψ_k ↦ c_k · (ψ_k ∘ T_k)`.

Proof: `ψ_k ∘ T_k` is `Lp.compMeasurePreserving`, of the same norm; multiplying by `c k` does not
increase the `L²` norm, so `sectorMap` is in `L²` with `‖sectorMap … ψ_k‖ ≤ ‖ψ_k‖`, the sequence is
in `ℓ²`, and the resulting map is linear and bounded by one (`LinearMap.mkContinuous`). Then
unfold the three totalised definitions with `dif_pos` and `Exists.choose_spec`. -/
theorem fockOp_apply (c : ∀ k : ℕ, (Fin k → Spacetime) → ℂ)
    (T : ∀ k : ℕ, (Fin k → Spacetime) → (Fin k → Spacetime))
    (hc : ∀ k, Measurable (c k)) (hb : ∀ k p, ‖c k p‖ ≤ 1)
    (hT : ∀ k, MeasurePreserving (T k) (Measure.pi fun _ : Fin k => mu)
      (Measure.pi fun _ : Fin k => mu))
    (ψ : FockCarrier) (k : ℕ) :
    ((fockOp c T ψ) k : (Fin k → Spacetime) → ℂ) =ᵐ[Measure.pi fun _ : Fin k => mu]
      fun p => c k p * (ψ k : (Fin k → Spacetime) → ℂ) (T k p) := by
  sorry

/-! ## B. Translations -/

/-- [EASY, 40 lines] `phase 0 = 1`. Depends on `fockOp_apply`. -/
theorem transOp_zero : transOp 0 = ContinuousLinearMap.id ℂ FockCarrier := by
  sorry

/-- [EASY, 60 lines] `phase x * phase y = phase (x + y)`. Depends on `fockOp_apply`. -/
theorem transOp_add (x y : Spacetime) : (transOp x).comp (transOp y) = transOp (x + y) := by
  sorry

/-- [EASY, 60 lines] `|phase| = 1`. Depends on `fockOp_apply`. -/
theorem transOp_norm (x : Spacetime) (ψ : FockCarrier) : ‖transOp x ψ‖ = ‖ψ‖ := by
  sorry

/-- [MEDIUM, 150 lines] Strong continuity: dominated convergence in each sector, and
`‖transOp x ψ - transOp x₀ ψ‖² = ∑_k ‖…‖²` with a summable majorant `4 ‖ψ_k‖²`
(`tendsto_tsum_of_dominated_convergence`). Depends on `fockOp_apply`. -/
theorem transOp_continuous (ψ : FockCarrier) : Continuous fun x : Spacetime => transOp x ψ := by
  sorry

/-- The translation action on the host. -/
def fockTranslations : TranslationAction fockSpace where
  operator := transOp
  identity := transOp_zero
  add := transOp_add
  unitary := transOp_norm
  stronglyContinuous := transOp_continuous

/-! ## C. The energy–momentum measure -/

/-- [EASY, 30 lines] The indicator of `∅` is `0`. Depends on `fockOp_apply`. -/
theorem projOp_empty : projOp ∅ = 0 := by
  sorry

/-- [EASY, 30 lines] The indicator of `univ` is `1`. Depends on `fockOp_apply`. -/
theorem projOp_univ : projOp Set.univ = ContinuousLinearMap.id ℂ FockCarrier := by
  sorry

/-- [EASY, 60 lines] Product of indicators. Depends on `fockOp_apply`. -/
theorem projOp_inter {A B : Set Spacetime} (hA : MeasurableSet A) (hB : MeasurableSet B) :
    (projOp A).comp (projOp B) = projOp (A ∩ B) := by
  sorry

/-- [EASY, 80 lines] Multiplication by a real function is symmetric
(`ContinuousLinearMap.eq_adjoint_iff`). Depends on `fockOp_apply`. -/
theorem projOp_adjoint {B : Set Spacetime} (hB : MeasurableSet B) :
    ContinuousLinearMap.adjoint (projOp B) = projOp B := by
  sorry

/-- [MEDIUM, 150 lines] Countable additivity in the strong sense: sectorwise dominated
convergence of the partial sums of indicators. Depends on `fockOp_apply`. -/
theorem projOp_hasSum (regions : ℕ → Set Spacetime) (hm : ∀ i, MeasurableSet (regions i))
    (hd : Pairwise (Disjoint on regions)) (ψ : FockCarrier) :
    HasSum (fun i => projOp (regions i) ψ) (projOp (⋃ i, regions i) ψ) := by
  sorry

/-- [EASY, 60 lines] Total mass `∑_k ‖ψ_k‖² = ‖ψ‖²`. -/
theorem diagMeasure_finite (ψ : FockCarrier) : IsFiniteMeasure (diagMeasure ψ) := by
  sorry

/-- [MEDIUM, 120 lines] `diagMeasure ψ B = ∑_k ∫ 1_B(∑p) |ψ_k|² dμ^k = ⟪ψ, E(B) ψ⟫`.
Depends on `fockOp_apply`, `diagMeasure_finite`. -/
theorem diagMeasure_apply {B : Set Spacetime} (hB : MeasurableSet B) (ψ : FockCarrier) :
    (((diagMeasure ψ).real B : ℝ) : ℂ) = inner ℂ ψ (projOp B ψ) := by
  sorry

/-- The energy–momentum measure of the host. -/
def fockEnergyMomentum : EnergyMomentumMeasure fockSpace where
  projection := projOp
  empty := projOp_empty
  univ := projOp_univ
  intersection := projOp_inter
  selfAdjoint := projOp_adjoint
  countablyAdditive := projOp_hasSum
  diagonal := diagMeasure
  finite := diagMeasure_finite
  diagonalIdentity := diagMeasure_apply

/-- [MEDIUM, 120 lines] `charFun (diagMeasure ψ) a = ∑_k ∫ exp (i ⟪∑p, a⟫) |ψ_k|² dμ^k`
(`integral_map`, `integral_withDensity_eq_integral_smul`, `integral_sum_measure`), which is
`⟪ψ, transOp a ψ⟫`. Sign check: `charFun μ t = ∫ exp (⟪x, t⟫ I) ∂μ` and `phase a` has `+i`.
Depends on `fockOp_apply`, `diagMeasure_finite`. -/
theorem charFun_diagMeasure (ψ : FockCarrier) (a : Spacetime) :
    charFun (diagMeasure ψ) a = inner ℂ ψ (transOp a ψ) := by
  sorry

/-- [MEDIUM, 120 lines] Positive energy: `mu` is carried by the closed forward cone, a convex
cone, so `∑ p_j ∈ forwardCone` almost everywhere on every sector (for `k = 0` the sum is `0`,
which lies in the cone). Depends on `fockOp_apply`. -/
theorem projOp_cone : projOp forwardConeᶜ = 0 := by
  sorry

/-! ## D. Poincaré transformations -/

/-- [MEDIUM, 120 lines] The adjoint of the identity is the identity. Depends on `fockOp_apply`. -/
theorem poinOp_one : poinOp 1 = ContinuousLinearMap.id ℂ FockCarrier := by
  sorry

/-- [MEDIUM, 150 lines] `(U(g) U(h) ψ)_k (p) = exp (i⟪a,P⟫) exp (i⟪b, Λᵀ P⟫) ψ_k ((Λ Γ)ᵀ p)` and
`⟪b, Λᵀ P⟫ = ⟪Λ b, P⟫`. Depends on `fockOp_apply`, `mu_map_adjoint`. -/
theorem poinOp_mul (g h : Sym) : poinOp (g * h) = (poinOp g).comp (poinOp h) := by
  sorry

/-- [EASY, 80 lines] Depends on `fockOp_apply`, `mu_map_adjoint`. -/
theorem poinOp_norm (g : Sym) (ψ : FockCarrier) : ‖poinOp g ψ‖ = ‖ψ‖ := by
  sorry

/-- [HARD, 400 lines] Strong continuity on the group. By `poinOp_norm` and density it suffices to
treat `ψ` with finitely many non-zero sectors, each continuous with compact support (dense in
`L²(mu^k)` since `mu` is a Radon measure); then use uniform continuity and dominated convergence,
with the topology of `ProperLorentz` (units of continuous linear maps) giving continuity of
`Λ ↦ Λᵀ p`. Depends on `fockOp_apply`, `mu_map_adjoint`, `poinOp_norm`. -/
theorem poinOp_continuous (ψ : FockCarrier) : Continuous fun g : Sym => poinOp g ψ := by
  sorry

/-- [EASY, 40 lines] `lorT 1 = id`. -/
theorem poinOp_translation (x : Spacetime) :
    poinOp (((1 : ProperLorentz), x) : Sym) = transOp x := by
  sorry

/-- [MEDIUM, 100 lines] `rhoMat 1` is the identity matrix, `derivSubst 1 = id`, hence
`rhoIdx 1 α = single {α} 1` and `rhoMon 1 m = single m 1`. -/
theorem rhoL_one : rhoL 1 = LinearMap.id := by
  sorry

/-- [MEDIUM, 250 lines] `rhoMat (Λ Γ) = rhoMat Λ * rhoMat Γ` (matrix product), so
`derivSubst (Λ Γ) = (derivSubst Λ).comp (derivSubst Γ)`; `rhoL Λ` is the algebra endomorphism of
`AddMonoidAlgebra ℂ Mon` determined on generators, and algebra homomorphisms compose. -/
theorem rhoL_mul (Λ Γ : ProperLorentz) : rhoL (Λ * Γ) = rhoL Λ ∘ₗ rhoL Γ := by
  sorry

/-- [MEDIUM, 120 lines] The inverse of a proper orthochronous Lorentz transformation is one;
then `rhoL_mul` and `rhoL_one` give a two-sided inverse. Depends on `rhoL_one`, `rhoL_mul`. -/
theorem rhoL_bijective (Λ : ProperLorentz) : Bijective (rhoL Λ) := by
  sorry

/-- The Poincaré action on the host and on labels. -/
def fockPoincare : PoincareAction fockSpace labels where
  Symmetry := Sym
  onStates := poinOp
  onLabels := fun g => LinearEquiv.ofBijective (rhoL g.lor) (rhoL_bijective g.lor)
  onTests := onTests
  pureTranslation := fun x => (((1 : ProperLorentz), x) : Sym)
  identity := poinOp_one
  composition := poinOp_mul
  unitary := poinOp_norm
  stronglyContinuous := poinOp_continuous
  coordinates := Homeomorph.refl (ProperLorentz × Spacetime)
  identityCoordinates := ⟨rfl, rfl⟩
  productCoordinates := fun _ _ => ⟨rfl, rfl⟩
  translationCoordinates := fun _ => ⟨rfl, rfl⟩
  pullback := fun _ _ _ => rfl
  translationZero := rfl
  translationAdd := fun x y =>
    Prod.ext (Subtype.ext (one_mul (1 : (Spacetime →L[ℝ] Spacetime)ˣ)).symm) (add_comm x y)

/-! ## E. Word vectors -/

/-- The conjugate word: reverse, conjugate labels and tests. -/
def dagger (u : Word) : Word := u.reverse.map fun a => (adjL a.1, conjugateTest a.2)

/-- [EASY, 60 lines] Transport along `List.length_ofFn`. -/
theorem wightW_ofFn {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction) :
    wightW (List.ofFn fun i => (P i, f i)) = wightmanL P f := by
  sorry

/-- [HARD, 500 lines] **Square integrability of the amplitudes.** By the directed-cut argument
of `matching_integrable`, now with the external momenta among the lines: for an open matching
`∑_j ‖p j‖ + ∑_ℓ ‖q ℓ‖ ≤ C ∏_v (1 + ‖openMomentum σ q p v‖)`, so the amplitude is measurable
and decays faster than any power of `1 + ∑_j ‖p j‖` on the product of cones, where `mu^{⊗k}` has
polynomial growth. -/
theorem openAmpW_memLp (w : Word) (k : ℕ) :
    MemLp (openAmpW w k) 2 (Measure.pi fun _ : Fin k => mu) := by
  sorry

/-- [MEDIUM, 120 lines] No open matching exists when there are more external slots than legs:
for monomials `μ`, `OMatching k μ` is empty if `k > ∑ i, card (μ i)`; take the maximum over the
finite supports. -/
theorem openAmpW_eq_zero (w : Word) : ∃ N : ℕ, ∀ k, N < k → openAmpW w k = 0 := by
  sorry

/-- [EASY, 80 lines] Unfold the totalised definitions. Depends on `openAmpW_memLp`,
`openAmpW_eq_zero`. -/
theorem Psi_apply (w : Word) (k : ℕ) :
    (Psi w) k = (((Real.sqrt (Nat.factorial k))⁻¹ : ℝ) : ℂ) •
      (openAmpW_memLp w k).toLp (openAmpW w k) := by
  sorry

/-- [HARD, 1500 lines] **Cut identity.** Cutting the matchings of the word `u† ++ v` between its
two halves: the lines crossing the cut are `k` in number; a matching of `u† ++ v` with `k` crossing
lines corresponds to `k!` triples (open matching of `u`, open matching of `v`, labellings of the
crossing lines by `Fin k` on both sides), whence the factor `1/k!`. Fubini (by `openAmpW_memLp`
and `matching_integrable`) and, on the `u` side,
`conj (Amono α q * Bmono β q) = (-1)^{α_t + β_t} Amono β q * Bmono α q`,
`conj (fourierE f k) = fourierE (conjugateTest f) (-k)`, `conj (Bmono β p) = (-1)^{β_t} Amono β p`;
the signs assemble to `adjL`. Check in the simplest cases (`FreeField/Check/check_conventions.py`):
`u = v = [({0}, f)]` gives `∫ |f̂|² dμ` on both sides, and `u = v = [({0,0}, f)]` gives
`(1/2!) ∫ |2 f̂(p₁+p₂)|² = 2 ∫ |f̂(p₁+p₂)|²`. The sum is finite by `openAmpW_eq_zero`. -/
theorem cut_identity (u v : Word) :
    ∑' k : ℕ, ((Nat.factorial k : ℂ))⁻¹ *
        ∫ p : Fin k → Spacetime, (starRingEnd ℂ) (openAmpW u k p) * openAmpW v k p
          ∂(Measure.pi fun _ : Fin k => mu) =
      wightW (dagger u ++ v) := by
  sorry

/-- [MEDIUM, 150 lines] **Inner products of word vectors.** `lp` and `L²` inner products
(`lp.inner_eq_tsum`, `MeasureTheory.L2.inner_def`) and `(sqrt (k!))⁻² = 1/k!`.
Depends on `Psi_apply`, `cut_identity`. -/
theorem inner_Psi (u v : Word) : inner ℂ (Psi u) (Psi v) = wightW (dagger u ++ v) := by
  sorry

/-- [EASY, 40 lines] `wightW [] = 1`. Depends on `inner_Psi`. -/
theorem Psi_nil_norm : ‖Psi []‖ = 1 := by
  sorry

/-- [MEDIUM, 150 lines] The Wightman function of a word is additive in each label
(`wightmanL` is a sum over the supports; pass to a common superset of the supports). -/
theorem wightW_add_label (u v : Word) (A A' : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (A + A', f) :: v) = wightW (u ++ (A, f) :: v) + wightW (u ++ (A', f) :: v) := by
  sorry

/-- [EASY, 80 lines] Homogeneity in each label (for `c = 0` both sides vanish). -/
theorem wightW_smul_label (u v : Word) (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (c • A, f) :: v) = c * wightW (u ++ (A, f) :: v) := by
  sorry

/-- [MEDIUM, 150 lines] Additivity in each test: `fourierE` is additive and the matching
integrands are integrable. Depends on `matching_integrable`. -/
theorem wightW_add_test (u v : Word) (A : Mon →₀ ℂ) (f f' : TestFunction) :
    wightW (u ++ (A, f + f') :: v) = wightW (u ++ (A, f) :: v) + wightW (u ++ (A, f') :: v) := by
  sorry

/-- [EASY, 80 lines] Homogeneity in each test. -/
theorem wightW_smul_test (u v : Word) (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (A, c • f) :: v) = c * wightW (u ++ (A, f) :: v) := by
  sorry

/-- [HARD, 2000 lines] **Locality of the Wightman functions.** Exchanging two adjacent letters
with spacelike separated tests changes only the lines between the two vertices, which reverse.
For a matching with `c` such lines the two integrals differ by replacing
`∫ ∏ dμ(q_e) (leg factors) F̂(K - ∑ q_e) Ĝ(K' + ∑ q_e)` by the same with `q_e ↦ -q_e` in the
exponentials; in position space this is `∏_e W_e (y - x)` against `∏_e W_e (x - y)`, where each
`W_e` is a derivative of the boundary value of `F(ζ) = ∫ exp (i ⟪ζ, p⟫) dμ`. For spacelike
`ξ = a e₁` (after a rotation), `F` is constant `= Sr a` along the points
`(a cos θ, 0, 0, i a sin θ)`, `0 < θ < π`, of the tube (by `Sr_euclid`), so the boundary values at
`ξ` and `-ξ` agree, locally uniformly; first for compactly supported tests (the support of
`f ⊗ g` is then a compact subset of the open spacelike region), then for all tests by cut-offs
`f χ_R → f` in the Schwartz topology and `wightmanL_continuous`.
Depends on `Sr_euclid`, `partialDeriv_S_integral`, `matching_integrable`, `wightmanL_continuous`. -/
theorem wightW_local (u v : Word) (A B : Mon →₀ ℂ) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) :
    wightW (u ++ (A, f) :: (B, g) :: v) = wightW (u ++ (B, g) :: (A, f) :: v) := by
  sorry

/-- [EASY, 60 lines] Orthogonality trick: `x = Ψ((A+A',f)::u) - Ψ((A,f)::u) - Ψ((A',f)::u)` has
`⟪Ψ w, x⟫ = 0` for every word `w` by `inner_Psi` and `wightW_add_label`, and `⟪x, x⟫` is a
combination of three such inner products. Depends on `inner_Psi`, `wightW_add_label`. -/
theorem Psi_add_label (A A' : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A + A', f) :: u) = Psi ((A, f) :: u) + Psi ((A', f) :: u) := by
  sorry

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_smul_label`. -/
theorem Psi_smul_label (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((c • A, f) :: u) = c • Psi ((A, f) :: u) := by
  sorry

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_add_test`. -/
theorem Psi_add_test (A : Mon →₀ ℂ) (f f' : TestFunction) (u : Word) :
    Psi ((A, f + f') :: u) = Psi ((A, f) :: u) + Psi ((A, f') :: u) := by
  sorry

/-- [EASY, 60 lines] As `Psi_add_label`. Depends on `inner_Psi`, `wightW_smul_test`. -/
theorem Psi_smul_test (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) (u : Word) :
    Psi ((A, c • f) :: u) = c • Psi ((A, f) :: u) := by
  sorry

/-- [EASY, 30 lines] `dagger ((A,f) :: u) ++ v = dagger u ++ (adjL A, conjugateTest f) :: v`.
Depends on `inner_Psi`. -/
theorem Psi_adjoint (A : Mon →₀ ℂ) (f : TestFunction) (u v : Word) :
    inner ℂ (Psi ((A, f) :: u)) (Psi v) =
      inner ℂ (Psi u) (Psi ((adjL A, conjugateTest f) :: v)) := by
  sorry

/-- [MEDIUM, 150 lines] `f ↦ Ψ((A,f)::u)` is additive (`Psi_add_test`), so continuity at `0`
suffices (`continuous_of_continuousAt_zero`); and
`‖Ψ((A,g)::u)‖² = wightW (dagger u ++ (adjL A, conjugateTest g) :: (A, g) :: u)` tends to `0` as
`g → 0` by `wightmanL_continuous` and continuity of `conjugateTest`.
Depends on `inner_Psi`, `Psi_add_test`, `wightmanL_continuous`. -/
theorem Psi_tempered (A : Mon →₀ ℂ) (u : Word) :
    Continuous fun f : TestFunction => Psi ((A, f) :: u) := by
  sorry

/-- [EASY, 60 lines] Orthogonality trick with `wightW_local`. Depends on `inner_Psi`,
`wightW_local`. -/
theorem Psi_local (A B : Mon →₀ ℂ) (f g : TestFunction) (u : Word)
    (h : FieldSystem.SpacelikeSeparated f g) :
    Psi ((A, f) :: (B, g) :: u) = Psi ((B, g) :: (A, f) :: u) := by
  sorry

/-- [HARD, 900 lines] **Covariance of the word vectors.** Amplitude identity, for monomials and
then labels: with `g = (Λ, a)`,
`openAmpW (g·u) k p = phase a k p * openAmpW u k (Λᵀ p)`.
Ingredients: `fourierE (onTests g f) k = exp (i ⟪a, k⟫) fourierE f (Λᵀ k)`; the phases multiply
to `exp (i ⟪a, ∑_v k_v⟫) = phase a k p` because internal lines cancel in `∑_v k_v`; the change of
variables `q ↦ Λᵀ q` in the internal lines (`mu_map_adjoint`); and for the leg factors
`∑_β' c_{β'β} Bmono β' p = Bmono β (Λᵀ p)` and the same for `Amono`, where `c` are the
coefficients in `rhoIdx Λ β` (first order: `Bmono e_j p = b_j p_j` with `b = (i,i,i,-1)`, and
`D_i⁻¹ D_j b_i = b_j`). Depends on `fockOp_apply`, `mu_map_adjoint`, `Psi_apply`. -/
theorem Psi_covariant (g : Sym) (u : Word) :
    poinOp g (Psi u) = Psi (u.map fun a => (rhoL g.lor a.1, onTests g a.2)) := by
  sorry

/-- [MEDIUM, 200 lines] Uniqueness of the vacuum in the host. If `transOp x ψ = ψ` for all `x`
then for `k ≥ 1` and all `τ` in a countable dense set, `exp (i τ ∑ (p_j)_t) ψ_k = ψ_k` a.e.;
since `∑ (p_j)_t > 0` a.e. (`mu` is absolutely continuous and carried by the cone), `ψ_k = 0`.
The sector `k = 0` is one-dimensional and contains `Psi []`, whose component is `1`.
Depends on `fockOp_apply`, `Psi_apply`. -/
theorem transOp_invariant (ψ : FockCarrier) (h : ∀ x, transOp x ψ = ψ) :
    ∃ c : ℂ, c • Psi [] = ψ := by
  sorry

/-- [HARD, 600 lines] **Faithfulness.** Let `A ≠ 0` and let `k` be the number of legs of some
monomial in its support. The amplitude `openAmpW [(A, f)] k p` is
`fourierE f (∑ p_j) * ∑_{m ∈ supp A, card m = k} A m * ∑_{bijections b} ∏_j Bmono (α_{b j}) (p j)`
(only open matchings pairing all legs with external slots contribute, and monomials with other
numbers of legs do not contribute to sector `k`). The polynomial factor is a non-zero polynomial
(symmetrised monomials of distinct multisets are linearly independent), hence non-zero on a set of
positive measure in the open cone, where `weight > 0`; choose `f` Gaussian, so that `fourierE f`
has no zeros. Depends on `Psi_apply`. -/
theorem Psi_faithful (A : Mon →₀ ℂ) (hA : A ≠ 0) : ∃ f : TestFunction, Psi [(A, f)] ≠ 0 := by
  sorry

/-! ## F. Assembly -/

/-- The Fock host of the generalized free field. -/
def fockHost : Host labels where
  K := fockSpace
  Ψ := Psi
  adj := adjL
  translations := fockTranslations
  energyMomentum := fockEnergyMomentum
  poincare := fockPoincare

theorem fockHost_good : fockHost.Good where
  compat := poinOp_translation
  vacuum_norm := Psi_nil_norm
  add_label := Psi_add_label
  smul_label := Psi_smul_label
  add_test := Psi_add_test
  smul_test := Psi_smul_test
  adjoint := Psi_adjoint
  tempered := Psi_tempered
  locality := Psi_local
  covariant := Psi_covariant
  label_one := fun A => by
    show rhoL 1 A = A
    rw [rhoL_one]; rfl
  label_mul := fun s t A => by
    show rhoL (s.lor * t.lor) A = rhoL s.lor (rhoL t.lor A)
    rw [rhoL_mul]; rfl
  spectral := charFun_diagMeasure
  positive := projOp_cone
  unique := transOp_invariant

/-- **The Fock host.** A good host over the Wick labels whose vacuum expectations are the
explicit Wightman functions `wightmanL`, and in which every non-zero label moves a word vector. -/
theorem exists_fockHost :
    ∃ h : Host labels, h.Good ∧
      (∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
        inner ℂ (h.Ψ []) (h.Ψ (List.ofFn fun i => (P i, f i))) = wightmanL P f) ∧
      (∀ A : Mon →₀ ℂ, A ≠ 0 → ∃ f u, h.Ψ ((A, f) :: u) ≠ 0) := by
  refine ⟨fockHost, fockHost_good, fun n P f => ?_, fun A hA => ?_⟩
  · show inner ℂ (Psi []) (Psi (List.ofFn fun i => (P i, f i))) = wightmanL P f
    rw [inner_Psi]
    show wightW (List.ofFn fun i => (P i, f i)) = _
    exact wightW_ofFn P f
  · obtain ⟨f, hf⟩ := Psi_faithful A hA
    exact ⟨f, [], hf⟩

/-- The Wightman theory of the Wick monomials of the generalized free field: W0–W3, faithful
labels, and the explicit vacuum expectations. -/
theorem exists_wightmanTheory :
    ∃ (H : HilbertSpace) (th : WightmanTheory H labels), th.Axioms ∧ th.fields.Faithful ∧
      ∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
        th.fields.vacuumExpectation P f = wightmanL P f := by
  obtain ⟨h, hg, hvev, hfaith⟩ := exists_fockHost
  obtain ⟨H, th, hax, hv, hf⟩ := h.reconstruct hg
  exact ⟨H, th, hax, hf hfaith, fun n P f => (hv n P f).trans (hvev n P f)⟩

end YangMills.FreeField
