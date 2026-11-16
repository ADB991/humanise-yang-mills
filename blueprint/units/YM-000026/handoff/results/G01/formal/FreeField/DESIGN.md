# A generalized free field as a witness of `YangMills.JointExistence`: design (phase 1b)

Status: design and compiling skeleton, revised after two independent reviews (phase 1b). `FreeField/Main.lean` proves `YangMills.jointExistence_of_freeField : YangMills.JointExistence` from the lemmas listed in `FreeField/TASKS.md`, which are left as `sorry`; all data (host space, word vectors, symmetries, adjoint, OPE coefficients) are now defined by explicit formulas. Nothing was posted, committed or pushed. Pins: Lean `v4.32.0`, Mathlib `81a5d257` (2026-07-13).

## 0. Summary of decisions

- **Model.** One hermitian scalar generalized free field `φ` whose one-particle measure on momentum space `ℝ⁴` is absolutely continuous: `dμ = weight(p) dp`, `weight p = (p²)² / log²(e + p²)` on the closed forward cone and `0` outside, `p² = p_t² − |𝐩|²`. No mass shell, no Bessel function, no delta function.
- **Labels.** The free vector space on Wick monomials, a monomial being a finite multiset of derivative multi-indices. I found no smaller family that passes the OPE clause (section 1 gives the reason; this is an observation about the candidates I examined, not a minimality theorem).
- **Hilbert space.** Not a symmetric Fock space and not an abstract GNS space. A *host* `K = ⨁_k L²((ℝ⁴)^k, μ^k)` carries the word vectors `Ψ(w)` given by explicit momentum integrals; the theory lives on the closure of their span. A formal reconstruction lemma (`Host.reconstruct`) turns a host into a `WightmanTheory` with `Axioms`. No operator is ever defined on a function space, so the clause "domain = span of words" costs nothing.
- **All `n`-point functions** are sums over matchings of the legs without self-lines; only the line kernel changes between the Euclidean correlation (`corrL`), the continuation (`contL`) and the Wightman distribution (`wightmanL`). These three are defined for real in `FreeField/Wick.lean`.
- **Group dependence** of the continuum data only through one real scalar multiplying the trace field (the Haar measure of the lattice family depends on the group, of course).
- **Seed and final witness.** `FreeField.hier` is only the *seed* `T₀`. The witness of `JointExistence` is `Adequacy.hier C₀ T₀` over the constant-insertion family, produced by `jointExistence_body_constant_insertions`. With `S` the seed's selected correlation and `M(a) = ∏_i 1[a_i = ⟨0,0⟩]`, the final correlations are `S` at the selected phase `plus`, `2M − S` at the phase `minus`, and `M` at `none` (the mixture); the final channels are `Channel d ⊕ Unit` with an extra zero actor in every grade and the extra grade-zero coefficient `Adequacy.hcoef`. Only the selected phase is tied to the Wightman theory by `root` and `boundary`; the public statement asks neither positivity nor linearity of the other phase or of the mixture, and the lattice clause only sees the mixture `M`. So the phase space is irrelevant for the seed but essential for the final witness: the final lattice trace insertion is zero while the selected continuum trace correlation is not. This weakness of the public statement is what `Adequacy` exploits; it is not specific to the free field.
- **Shortcuts found in the Lean text:** several small ones (section 1), none that removes the Wick algebra or the OPE; I found no degenerate solution of the OPE clause.
- **Verdict:** feasible, no clause fails, but large: about 22,000 lines by my lemma-by-lemma estimates (`TASKS.md`), 20,000 to 36,000 by the second reviewer's.

## 1. What the public text asks, and where it is lenient

Read at `PublicTheory.lean`, `ChallengeSpec.lean` (identical to `Lean/` at the source pin).

Lenient points that the design uses:

1. `FieldSystem.field : Labels →ₗ TestFunction →ₗ (domain →ₗ domain)`: fields are only linear maps on a subspace. No closability, no essential self-adjointness, no continuity in the state. Unbounded operators never have to be handled as such.
2. `DomainAxioms.cyclicVacuum` is an *equality* of the domain with the span of word vectors. Read the other way round, this lets us *define* the domain as that span and the field by `Φ(A,f) Ψ(w) := Ψ((A,f) :: w)`. Well-definedness is the GNS argument and needs only the adjoint identity between word vectors.
3. `HilbertSpace` is any complete complex inner product space in `Type`. No separability. So `H` may be the closure of the span of the word vectors inside any convenient larger space; `denseDomain` is then true by construction.
4. `EnergyMomentumMeasure.projection` is a function on all subsets, constrained only on measurable ones (and on `∅`, `univ`). We may put `0` on non-measurable sets.
5. `PoincareAction.Symmetry` may be `ProperLorentz × Spacetime` itself with `coordinates` the identity homeomorphism. `onLabels` needs no continuity and no finite-dimensionality.
6. `Hierarchy.correlation` and `continuation` are total functions with no built-in linearity or regularity. The regularity clauses (`permutation`, `smooth`, `characterContinuity`, `mixture`) are restricted to `separated n`, and `analytic` to `orderedTube n`; but the OPE clauses and the hypothesis `hH` of `constant_insertion_witness` evaluate the correlation without an explicit separation hypothesis. We put `correlation = 0` off the separated set. This makes `hH` (quantified over *all* configurations) a two-line lemma, and it is harmless in the OPE because `Within` (with `η > 0`, `r > 0`) and `Clear` (with `M r < c/2`) force both grouped configurations to be separated.
7. `Reconstructed.analytic` asks for holomorphy in the complex times for each *fixed* tuple of spatial points; no joint regularity. `boundary` is a one-ray limit of Bochner integrals against product tests.
8. `weight a` in the OPE is the sum of the *tag* grades, and `Field d` may be a filtration; a field sitting in a grade higher than its scaling dimension only weakens both bounds.
9. `covers`, `injective`, `faithful` do not ask for a grading, only that every label lies in the injective image of one finite-dimensional `Field d`. A filtration by scaling dimension does this. `Field 0` is the line of the unit; its zero vector is the tag `⟨0, 0⟩` of `hH`.
10. For the seed the phase space is irrelevant: its `correlation` is independent of the phase, and `Adequacy.Phase` is reused only because all its instances are there. For the final witness the phases matter (section 0).
11. The trace clause fixes a limit of `r⁸ log²(1/r) · traceTwo r`, and `traceTwo` is quadratic in `centeredTrace`. So the theory is group independent and `centeredTrace = λ_G φ` with `λ_G² · 384π = 3 dim 𝔤 / π⁴`.
12. `TraceTest.excludes` follows from `shortDistance` and positivity of the amplitude alone, for an arbitrary function (lemma `wickProfile_excluded`).

Points that are *not* lenient, with the reason:

- **The selected correlation of the seed is tied to the theory.** `root` equates `correlation (some selected)` with the continuation at Euclidean points for strictly increasing times; `permutation` and `smooth` extend this to all separated points; `analytic` and `boundary` tie the continuation to the vacuum expectations. I looked for freedom here (modifications of `continuation` on null sets of spatial configurations, or integrands that are not Bochner integrable) and found none that helps: `boundary` must hold with the true vacuum expectation as limit, including `n = 0` where it reads `continuation = 1`. I do not claim a uniqueness theorem: `boundary` is a spatially smeared statement, and the argument that a holomorphic function with vanishing smeared boundary values vanishes was not written out. Nothing of this applies to the non-selected phase or to the mixture, which in the final witness are `2M − S` and `M`.
- **I found no degenerate solution of the OPE clause.** `remainder` quantifies over all finite families `a`, all spectators `b`, and all `D`, with the single coefficient family fixed beforehand, and the bound `r^{D+1−weight a−ε}` improves without limit as `D` grows. For `a = (φ)` and `b = (φ)` it forces actors whose two-point functions with `φ` are all derivatives `∂^α S`; for `a = (φ,…,φ)` (`k` slots) and `k` spectators it forces actors reproducing all jets of `∏ S(z_i − y_i)`, that is, all Wick monomials of degree `k`. Giving fields other grades does not help (`D` is unbounded), nor does enlarging `Channel` (the actors must be fields of the theory with the right correlations), nor does the freedom of `coefficient` in `(x, o)` (it cannot depend on the spectators). A remainder that vanishes identically would require the translates of `φ` to span a finite-dimensional space of operators. Positivity excludes theories whose higher-point functions are trivial. So, as far as I can see, a model with a non-constant two-point function needs an infinite OPE-closed field algebra, and for a generalized free field the natural one is the Wick algebra. This is a heuristic, not a theorem excluding every pathological witness.
- **A discrete-mass free field cannot serve.** Its composite two-point functions lie in the class excluded by `excludes` (only non-negative powers of `log`), and `faithful` would force a quotient by the Klein–Gordon relation. The continuous weight is needed for `shortDistance` and makes the label algebra free.
- `W2` needs a strongly continuous unitary representation of the full proper orthochronous Lorentz group; `W3` needs commutation for *all* pairs of labels, hence Wick's theorem in some form.

## 2. Field content and grades (task item b)

`FreeField/Labels.lean`, all proved.

- `Idx := Fin 4 → ℕ`, `Mon := Multiset Idx`, `grade m = ∑_{α∈m} (4 + |α|)`. Label space `labels = Mon →₀ ℂ`. No algebra structure is used. The monomial `{α₁,…,α_k}` stands for `:ξ_{α₁}⋯ξ_{α_k}:` with `ξ_α = i^{α_t} ∂^α φ` (the twist R3 of the review, needed for `root`); the empty multiset is the unit and acts as `f ↦ (∫f)·id`.
- `Field d := {m // grade m ≤ d} → ℂ` with the sup norm; finite-dimensional because `{m | grade m ≤ d}` is finite (`finite_gradeLE`: such `m` is below `d • (all α with entries ≤ d)`). `toLabel d` is the inclusion (`toLabel_injective`, `toLabel_covers`).
- `Channel j := {m // grade m = j}`, `actor` the basis vector. `theta` is the basis vector of `{0}` in `Field 4`.
- Token type `Tag = Σ d, Field d`, family `GroupIndependence.haarFamily g Tag`, `project = id`.

Why multisets and `Multiset.ToType`: the legs of a monomial are then a canonical finite type (`(α, i)` with `i < count α m`), so no choice of enumeration enters the Wick sums.

## 3. Spectral weight and trace (task item c)

`weight p = (p²)²/log²(e + p²)` on the closed forward cone. Reasons:

- Lorentz invariance is immediate from the three properties in the subtype `ProperLorentz` (determinant one, `minkowskiSquare` preserved, cone preserved). The action on momentum space is by the Euclidean transpose `Λᵀ` (because all pairings are Euclidean, as `charFun` forces), and `Λᵀ = ηΛ⁻¹η` with `η` the time reflection of the metric, which preserves `weight`. Cheapest invariant measure description: `volume.withDensity`, invariance from `map_linearMap_addHaar_eq_smul_addHaar`.
- `log(e + s) ≥ 1` on `s ≥ 0`: no cut-off, no indicator besides the cone, the density is continuous on the cone and positive on the open cone (used for `faithful`), and `weight p ≤ p_t⁴`, which gives every bound in the OPE.
- The Euclidean two-point function at distance `r` is `Sr r = ∫ exp(−r p_t) weight p dp`, a plain Laplace integral over `ℝ⁴`. After `p = v/r`: `r⁸L² Sr r = ∫_cone exp(−v_t)(v²)² · L²/log²(e + v²/r²) dv`, `L = log(1/r)`. The last factor tends to `1/4` and is at most `max(1, log(1/v²))²` for `0 < r < 1`. Dominated convergence gives `(1/4)·∫_cone exp(−v_t)(v_t² − |𝐯|²)² dv = (1/4)·4π·(8/105)·7! = 384π`. Checked numerically (`scipy`: 1206.3716 both sides). Hence `λ_G² = 3 dim 𝔤/(384 π⁵) = dim 𝔤/(128π⁵)`, which agrees with the constant found in the second review for the unnormalised measure.
- Mass gap: none (the support reaches `p = 0`), and none is needed: `uniqueVacuum` holds because `∑ p_t > 0` almost everywhere on every `k`-particle space, and the OPE bound at spectators uses `sup_{‖ξ‖≥c/2}|∂^γ S ξ| < ∞`, which follows from `|∂^γ S ξ| ≤ C‖ξ‖^{−8−|γ|}`.

`excludes`: `wickProfile_excluded` is a statement about arbitrary functions. Upstream proves it (`YM.TraceExtension.Wick.real_profile`, `no_powerlog`), but I verified that the import closure of `YM/TraceExtension/Wick/Log.lean` is 411 files (57k lines) reaching into the construction, because `Expansion.lean` imports `LogScaling.lean`. So it cannot be copied as a closed generic layer. Options for phase 2: (i) extract `Expansion.lean`, `Gain.lean`, `Log.lean` (318 lines, which look self-contained apart from the import line; to be confirmed by building them alone) and re-prove the expansion of a single `Mode` integral (the content of `Massive.lean` and part of `PolynomialField.lean`, about 300 lines) against the public `Mode.kernel`; (ii) write it independently. Either way about 600 to 800 lines. The coordinator should decide whether (i) is compatible with the claim "no part of the construction".

## 4. The `n`-point functions and their continuation (task item d)

`FreeField/TwoPoint.lean`, `FreeField/Wick.lean` (definitions, compiled).

Conventions, all forced by the public text: `U(a) = ∫ e^{i⟨a,p⟩} dE(p)` with the Euclidean pairing; `U(a)Φ(x)U(a)⁻¹ = Φ(x+a)`; hence `⟨Ω, φ(x)φ(y)Ω⟩ = ∫ e^{i⟨y−x,p⟩} dμ(p)`, analytic where `Im(t_y − t_x) > 0`, which is `orderedTube`. The vector `φ(f)Ω` is `f̂(p) = ∫ f(x) e^{i⟨x,p⟩} dx` (`fourierE`, no `2π`).

- Leg factors: `Amono α p = ∏_{i<3}(−ip_i)^{α_i}·p_t^{α_t}` for the earlier end of a line, `Bmono β p = ∏_{i<3}(ip_i)^{β_i}·(−p_t)^{β_t}` for the later end. Derivation: `⟨ξ_α(x)ξ_β(y)⟩ = i^{α_t+β_t}∂_x^α∂_y^β ∫e^{i⟨y−x,p⟩}dμ`.
- `lineC α β z u = ∫ Amono α · Bmono β · exp(i(z p_t + ⟨u,𝐩⟩)) · weight dp` (complex time difference `z`, real spatial difference `u`).
- `S x = Sr ‖x‖`, `lineS α β ξ = (−1)^{|α|} ∂^{α+β}S(ξ)` with `∂^γ` an iterated `fderiv` (`partialDeriv`). Symmetry `lineS α β ξ = lineS β α (−ξ)` holds for every even function, without smoothness.
- `Matching m`: fixed-point-free involutions of the legs that never pair two legs of one vertex. `wickSum K m = ∑_σ ∏_{lines} K v w α β`, each line taken once, oriented from the earlier to the later vertex. `wickL` is the multilinear extension to labels.
- `corrL P x` = `wickL (lineS at x_w − x_v) P` on `separated n`, `0` elsewhere. `contL P z u` = `wickL (lineC at z_w − z_v, u_w − u_v) P`.
- `wightmanMono m f = ∑_σ ∫ ∏_{lines}(Amono·Bmono·weight)(q_ℓ) · ∏_v fourierE (f v) (k_v) dq`, `k_v` = incoming minus outgoing line momenta (`vertexMomentum`). `wightmanL` its multilinear extension.

Cheapest routes:

- `permutation`: bijection of matchings plus symmetry of `lineS`. Combinatorial, no analysis.
- `smooth`: `Sr` is smooth on `(0,∞)` by differentiation under the integral; `‖·‖` is smooth off `0`.
- `analytic`: `lineC` is holomorphic in `z` on `Im z > 0` by `hasDerivAt_integral_of_dominated_loc_of_deriv_le`.
- `root`: needs the one genuinely analytic fact, Euclidean invariance (EI): for `τ > 0`, `∫ exp(−τp_t + i⟨u,𝐩⟩) weight p dp = Sr(√(τ² + |u|²))`. Proof without several complex variables and without contour shifts: for fixed `τ`, unit vector `e`, the function `G(s) = ∫ exp(−τp_t + s⟨e,𝐩⟩) dμ` is holomorphic on the strip `|Re s| < τ` (since `|𝐩| ≤ p_t` on the cone); for real `s` it equals `Sr(√(τ² − s²))` by an explicit real boost and invariance of `μ`; `s ↦ Sr(√(τ² − s²))` is holomorphic on the same strip (`Sr` extends holomorphically to `Re > 0`); the one-variable identity theorem (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`) gives equality at `s = i|u|`. Then differentiate under the integral.
- `boundary`: for `r > 0` the integrand is bounded by a constant times `|tensorTest|`, so the Bochner integral is honest; Fubini and dominated convergence with the estimate (AI): every matching integrand with Schwartz vertex functions is absolutely integrable. The proof of (AI) uses **directed cuts**, not single vertices (at a vertex the incoming and outgoing momenta can cancel, so a vertex momentum does not control the lines through it; this corrects the outline of phase 1). For the cut after vertex `j` let `Q_j` be the sum of the momenta of the lines from a vertex `≤ j` to a vertex `> j`; then `Q_j = −∑_{v≤j} k_v`. All line momenta lie in the forward cone and every line crosses some cut, so `∑_ℓ (q_ℓ)_t ≤ ∑_j (Q_j)_t ≤ (n−1) ∑_v ‖k_v‖`, and `‖q_ℓ‖ ≤ √2 (q_ℓ)_t`. Hence all line momenta are controlled by the vertex momenta, and the Schwartz decay of `∏_v f̂_v(k_v)` dominates the polynomial factors, including near zero momentum. The same argument with the external momenta counted among the lines gives square integrability of the word amplitudes (`openAmpW_memLp`).
- The same fact (EI), rotated by a complexified boost angle, gives the spacelike symmetry `F(ξ) = F(−ξ)` needed for locality: for spacelike `ξ = a e₁`, the points `(a cos θ, 0, 0, i a sin θ)`, `0 < θ < π`, lie in the tube, `F` is constant `= Sr a` along them by (EI), and the ends are `ξ` and `−ξ`.

## 5. Hilbert space model (task item a)

What the axioms need, clause by clause, and the cheapest supplier:

| Clause | Supplier |
| --- | --- |
| complete `H`, dense domain equal to span of words, fields as linear maps on it, linear in label and test | `Host.reconstruct`: formal |
| `tempered`, `AdjointAxiom`, `LocalCommutativity`, `fieldCovariance` | identities between word vectors (`Host.Good`), extended linearly: formal |
| positivity of the Wightman functional | automatic: word vectors are vectors of a Hilbert space |
| translations, Lorentz unitaries, strong continuity | multiplication by `e^{i⟨a,∑p⟩}` and composition with `(Λᵀ)^{×k}` on `L²(μ^k)`; Mathlib `Lp.compMeasurePreserving`, `Lp.instContinuousSMulDomMulAct` |
| projection-valued measure, `charFun (diagonal ψ) = ⟨ψ,U(·)ψ⟩` | either explicit (multiplication by the indicator of `∑p ∈ B`) or the SNAG theorem of the generic upstream layer (below) |
| `positiveEnergy`, `uniqueVacuum` | support of `μ^k` under the sum map; `∑p_t > 0` a.e. |

Options considered:

1. **Symmetric Fock space with creation and annihilation operators.** Mathlib has none. `Spectra` (external, Lean 4.31) has a bosonic Fock space over a general Hilbert space but no creation or annihilation operators; our fields need kernels that are not products (`f̂(p₁+⋯+p_k)·polynomial`), so the abstract Fock space would have to be identified with `L²_sym(μ^k)` anyway. Wick monomials as operators on an invariant domain of rapidly decaying functions (the review's R5 and Lemma A) need a kernel calculus with symmetrisation over `Fin n → ℝ⁴`, the operator-level Wick theorem for commutators, and a density theorem. Rejected: most expensive.
2. **Pure GNS from the `n`-point functions** (Kolmogorov space of the word kernel, e.g. upstream `YM.Kernel.Gram`, plus SNAG). The operator clauses become formal, but (i) positivity of the Wick-polynomial functional has no proof that avoids exhibiting the vectors (the standard proof *is* the Fock computation), (ii) positive energy needs the tested-support criterion (`Orbit.carrier`) and uniqueness of the vacuum needs a cluster argument. Rejected as stated, but its formal half is kept.
3. **Chosen: concrete GNS in a host.** Define only the *vectors* `Ψ(w) ∈ K = ⨁_k L²((ℝ⁴)^k, μ^k)` by explicit formulas (matchings of the legs of `w` with `k` legs left open), never operators. The space `K` is not symmetrised: the components happen to be symmetric, but nothing needs to know. The theory lives on `H = closure(span Ψ)`. Everything formal is in `Host.reconstruct`; everything analytic is a property of explicit integrals. Positivity is free, the spectral clauses are read off in `K`, and the only place where `H ≠ K` matters (the spectral projections must preserve `H`) is settled by uniqueness of characteristic functions: for `v ∈ H`, `u ⊥ H`, the four vectors `u + i^k v` have the same function `a ↦ ⟨ψ,U(a)ψ⟩`, hence the same diagonal measure (`Measure.ext_of_charFun`), hence `⟨u,E(B)v⟩ = 0`.

The identities the host must satisfy (`Host.Good`, exact Lean statement in `Reconstruction.lean`): head-linearity of `Ψ` in label and test; `⟨Ψ(a::u),Ψ(v)⟩ = ⟨Ψ(u),Ψ(a†::v)⟩`; continuity of `f ↦ Ψ((A,f)::u)`; `Ψ(a::b::u) = Ψ(b::a::u)` for spacelike separated tests; `U(s)Ψ(u) = Ψ(s·u)`; the representation laws for labels; the three spectral statements on `K`; compatibility of translations.

In the Fock host these reduce to: the cut identity `⟨Ψ(u),Ψ(v)⟩ = wightmanL(u† ++ v)` (a bijection between matchings of the concatenated word and pairs of open matchings with an identification of open legs, plus Fubini), covariance and hermiticity of the explicit integrals (changes of variables), locality of `wightmanL` under exchange of adjacent letters (the lines between the two vertices reverse; reduces to `F(ξ) = F(−ξ)` at spacelike `ξ` for products of lines, compact supports first, then closure by `tempered`), and the estimate (AI).

### The concrete host (phase 1b: `Fock.lean`, `Symmetry.lean`, `Theory.lean`)

- `mu = volume.withDensity weight`; `Sector k = Lp ℂ 2 (mu^{⊗k})` over `Fin k → ℝ⁴`; host `FockCarrier = lp Sector 2`, the **unweighted** direct sum.
- **Normalisation.** Mathlib's `lp` has the plain square-sum norm, so the factor `1/k!` is implemented in the vectors: the `k`-particle component of a word vector is its amplitude divided by `sqrt (k!)` (`psiComp`). Then `⟪Ψ u, Ψ v⟫ = ∑_k (1/k!) ∫ conj(amp_u) amp_v dμ^k`, and the cut identity holds with exactly this factor (checked by counting matchings, `Check/check_conventions.py` test 3b: a matching of `u† ++ v` with `k` crossing lines corresponds to `k!` pairs of labelled open matchings).
- **Word amplitudes** (`openAmp`): open matchings are involutions of `Fin k ⊕ Leg m` without fixed points that pair neither two external slots nor two legs of one vertex. The external slots act as a vertex earlier than all others; slot `j` carries the fixed momentum `p j` into the vertex it is attached to and contributes the factor `Bmono` of the leg it is attached to; internal lines are integrated with `Amono · Bmono · weight`; vertex `v` contributes `fourierE (f v)` at its total entering momentum (`openMomentum`). One letter `{β}`: amplitude `Bmono β p · f̂(p)` in the one-particle sector.
- **Operators** on the host all have the form `ψ_k ↦ c_k · (ψ_k ∘ T_k)` and come from one totalised constructor `fockOp c T`: translations (`c = exp(i⟪a, ∑p⟫)`, `T = id`), Poincaré transformations (`T = (Λᵀ)^{×k}`), spectral projections (`c` the indicator of `∑p ∈ B`, and `0` for non-measurable `B`). The diagonal measure of `ψ` is the sum over `k` of the push-forward of `|ψ_k|² dμ^k` under the sum map. The spectral data are therefore defined directly; the SNAG layer is not needed.
- **Group.** `Sym = ProperLorentz × Spacetime` with `(Λ,a)(Γ,b) = (ΛΓ, a + Λb)`; `onTests (Λ,a) f = f(Λ⁻¹(· − a))` through Mathlib's `compCLMOfContinuousLinearEquiv` and `compSubConstCLM`; `(U(Λ,a)ψ)_k(p) = exp(i⟪a,∑p⟫) ψ_k(Λᵀp₁,…)`.
- **Labels.** `adjL` is conjugate-linear with `{α₁,…}† = (−1)^{∑(α_j)_t}{α₁,…}`. The Lorentz action is `rhoL Λ`: on first derivatives the matrix `ρ(Λ) = D⁻¹ΛD`, `D = diag(1,1,1,i)` (columns are images of basis labels; this is the formula of the first review, re-derived from `fieldCovariance` and `ξ_j = D_j ∂_j`); on `ξ_α` the substitution `X_j ↦ ∑_i ρ_{ij} X_i` in `MvPolynomial (Fin 4) ℂ` (`ξ_α ↔ X^α`); on Wick monomials the product of the images of the legs in `AddMonoidAlgebra ℂ Mon`. Translations act trivially on labels. The compatibility `∑_β' c_{β'β} Bmono β' p = Bmono β (Λᵀp)` (and for `Amono`) was checked numerically for first and second order (test 4).
- **Assembly.** `fockHost`, `fockHost_good`, `exists_fockHost` and `exists_wightmanTheory` are proved from 44 named lemmas. The identities of word vectors are reduced to the inner-product formula `inner_Psi : ⟪Ψ u, Ψ v⟫ = wightW (u† ++ v)` (from `cut_identity`) and to properties of the explicit Wightman functions (`wightW_add_label`, …, `wightW_local`, `wightmanL_continuous`) by the orthogonality trick: a combination of word vectors that is orthogonal to all word vectors vanishes.

### Reuse of existing material (survey of 2026-11-13)

I read the survey `lean-qft-survey.md` and checked the points I rely on in `Lean` (source inspection and import-closure computation; I did not build these files outside their tree).

- **Copied upstream files in phase 1b: none.** The owner allows copying generic files. The SNAG layer (`YM/SNAG/{Kernels,Dense,Unital,Approx,Escape}.lean`, `YM/Spectral/{Projection,Frequencies}.lean`, `YM/Compact/{Borel,PVM,State}.lean`, `YM/Distribution/Tests.lean`, `YM/Hilbert/Kolmogorov.lean`, `YM/Analysis/Nonnegative.lean`: 13 files, 1,359 lines; closure exactly these files plus 17 `Mathlib.*` modules; no `sorry`, no `axiom`; checked by source inspection, not built here) was **not** copied, because the host's spectral data are now defined directly (multiplication by indicators, push-forward measures) and the corresponding lemmas (`projOp_*`, `diagMeasure_*`, `charFun_diagMeasure`, `projOp_cone`; about 800 lines, all EASY or MEDIUM) are simpler than the glue to a copied projection-valued measure whose projections would not be explicit. It remains an option for a worker who prefers it for `charFun_diagMeasure`; if used, the copied files and this closure must be recorded here and in `TASKS.md`. The upstream Wick files were not extracted either: `wickProfile_excluded` is being proved independently in `FreeField/Work/WickExcluded.lean`.
- **Not reused: `YM/Hilbert/Kolmogorov.lean` as the Hilbert-space model.** The host design does not need a Kolmogorov space: the word vectors already live in `K`. It would be the right tool for option 2, which was rejected because positivity still needs the vectors.
- **Not reused: `YM.Boundary.harvest`.** Indexed by gauge-specific label tables and requiring a Euclidean OS chamber. `Host.reconstruct` plays its role with hypotheses that a free field can supply directly; `YM/Fields/{Stems,Motion,System}.lean` (about 770 lines) is a guide for its proof, which confirms the size estimate of 800 lines.
- **Possibly reused: `YM/Mink/*`** (6 files, 842 lines, closure inside `YM/Mink` and `YM/Space`): boosts. Only an explicit boost in one plane and `Λᵀ = ηΛ⁻¹η` are needed (about 200 lines new); decide in phase 2 after reading its statements against the public `ProperLorentz`.
- **Not reused: `YM/TraceExtension/Wick/*`** as a closed layer: closure of 411 files (section 3).
- **External repositories: none used.** `Spectra` (no creation operators, wrong shape of kernels), `OSforGFF`/`gaussian-field`/`bochner` (Euclidean measure with OS axioms; the design works on the Minkowski side and has no Bessel function. I do not claim that a Euclidean Gaussian approach is impossible: non-integrability of the covariance function at coinciding points does not by itself exclude a Gaussian random distribution; it was simply not pursued), `OSreconstruction` and `lean-SCV` (several complex variables; the design needs only the one-variable identity theorem), `TauCeti` (guide for an algebraic GNS; too far ahead in toolchain). No dependency is added to the lakefile.

## 6. Mathlib facts relied on (task item e)

Confirmed present at the pin (by search in `.lake/packages/mathlib`):

- `MeasureTheory.charFun` (`∫ exp(⟪x,t⟫ I) ∂μ`) and `Measure.ext_of_charFun`.
- `lp` Hilbert direct sums (`Analysis/InnerProductSpace/l2Space.lean`), `Lp ℂ 2 μ`, `Measure.pi`, `Measure.pi_of_empty`, Fubini, `withDensity`, `integral_withDensity_eq_integral_smul`.
- `Lp.compMeasurePreserving`, `compMeasurePreserving_continuous`, `Lp.instContinuousSMulDomMulAct` (strong continuity of measure-preserving actions).
- `map_linearMap_addHaar_eq_smul_addHaar` (determinant and Lebesgue measure), `PiLp.volume_preserving_toLp`.
- `hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `hasFDerivAt_integral_of_dominated_of_fderiv_le`, `tendsto_integral_filter_of_dominated_convergence`.
- `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `DifferentiableOn.analyticOnNhd`.
- `integral_fun_norm_addHaar`, volume of Euclidean balls, the Gamma integral.
- `SchwartzMap` with `fourierTransformCLM`, `compCLM`, `SchwartzMap.denseRange_toLpCLM`.
- `taylor_mean_remainder_lagrange` (one variable), `ContDiffAt.isSymmSndFDerivAt`.
- `Multiset.ToType` with its `Fintype`, `Finsupp.lmapDomain`, `Fintype.piFinset`.

Missing, to be built:

| Missing | Used in | Lines |
| --- | --- | --- |
| projection-valued measure on the host with its diagonal measures (or the copied SNAG layer, 1,359 lines, plus glue) | A | 400 (or 150) |
| smoothness of parametric integrals to all orders (`ContDiff`) | E | 150 |
| multivariate Taylor formula with remainder for the leg positions | D | 400 |
| continuity of the Poincaré action on Schwartz space is *not* needed (strong continuity is proved in `L²`) | | 0 |
| density of compactly supported functions in Schwartz space with support control (cut-offs `f·χ_R`), for locality with non-compact supports | A | 200 |
| explicit boost in one plane as an element of `ProperLorentz`, and `Λᵀ = ηΛ⁻¹η` | A, E | 200 |
| expansion of the `Mode` integrals (no Bessel function in Mathlib; done by elementary integrals in `E`) | C | 600–800 |

No Fock space, Bochner theorem, Stone theorem, SNAG theorem, Bessel function or several-complex-variables result from Mathlib is needed.

## 7. Module plan and list of `sorry`s

The complete table of open lemmas (file, statement, dependencies, difficulty, lines, order) is `FreeField/TASKS.md`. Summary: 75 `sorry` lemmas, of which 31 EASY, 29 MEDIUM, 13 HARD, and the 2 trace lemmas in progress under `FreeField/Work/`.

| Module | Files | Content | Open lemmas |
| --- | --- | --- | --- |
| shared | `Analytic.lean` | the measure `mu`, bounds on `weight`, Lorentz invariance, Euclidean invariance (EI), smoothness and scaling bound of `∂^γ S`, symmetry and continuation of the line kernels, matching integrability (AI) and continuity of the Wightman functions | 17 |
| A1 | `Reconstruction.lean` | `Host`, `Host.Good`, `Host.reconstruct` | 1 |
| A2 | `Fock.lean`, `Symmetry.lean`, `Theory.lean` | all data of the Fock host (no `sorry`), 44 lemmas, and the proved assembly `fockHost_good`, `exists_fockHost`, `exists_wightmanTheory` | 44 |
| C | `Trace.lean` | `Sr_asymptotic`, `wickProfile_excluded` (in progress), `traceTwo_eq` (proved) | 2 |
| D | `OPE.lean` | `KernelHyp`, generic correlations, the explicit coefficients `gcoef`, point-split correlations `splitCorr`; generic lemmas `gwickGrouped_factor`, `splitCorr_collapse`, `splitCorr_fderiv`, `gope_coefficients`, `gope_remainder`; `lineS_kernelHyp`; proved assembly `exists_ope_coefficient` | 6 |
| E | `Continuation.lean` | five assembly statements over `Analytic.lean` | 5 |

Module D is generic: it concerns Wick sums of an arbitrary line kernel `K` satisfying `KernelHyp` (exchange symmetry, smoothness off the origin, the two derivative identities, the scaling bound). The group, the Hilbert space, the theory and the trace scale enter only in the last theorem. The coefficient of a channel monomial `c` is the sum, over partial matchings `σ` of the cluster legs and over assignments `β` of a Taylor multi-index to each unmatched leg `e` with `{α_e + β_e} = c`, of the internal lines times `∏_e (x_e − o)^{β_e}/β_e!`. Only finite-order Taylor estimates with constants are needed (the factor `r^{−ε}` absorbs constants), but they must be uniform in `o` and in the spectator positions, which the translation-invariant bounds of `KernelHyp` give.

Proved (no `sorry`): `Labels.lean`, `TwoPoint.lean`, `Wick.lean`, `Hierarchy.lean`, `Fock.lean`, `Symmetry.lean` (data and elementary lemmas), `traceTwo_eq`, the assemblies named above, and all of `Main.lean`.

## 8. Feasibility

No clause fails and no step is mathematically open. The lemma-by-lemma estimates of `TASKS.md` add up to about 22,000 lines (EASY 2,000; MEDIUM 5,600; HARD 13,000; trace 1,200); the second reviewer's estimate for the same content is 20,000 to 36,000, and mine should be read as optimistic. The largest risks are (1) `cut_identity` and `openAmpW_memLp`: dependent leg types, multiplicities and `L²` bounds must agree exactly; (2) the analytic bridge `Sr_euclid` → `wightW_local`, `contL_boundary`; (3) `gope_remainder`: uniformity in the unrestricted origin and spectators for every truncation order. The conventions most exposed to sign errors (`Amono`, `Bmono`, `vertexMomentum`, `adjL`, `rhoMat`, the `1/k!`) are now tested numerically in `FreeField/Check/check_conventions.py` (all tests pass; they reproduce the first reviewer's values).

## 9. Points I am unsure of

1. Sign conventions of `Amono`, `Bmono`, `vertexMomentum`, `fourierE`, `adjL`, `rhoMat`: derived by hand, confirmed by the first review and by the numeric tests, but not machine-checked. The tests cover the two-point function, one and two time derivatives, the sign of `adjL` in the simplest inner product, the `1/k!` counting for several multi-letter words, and the leg factors under a generic Lorentz transformation up to third order; they do not test `openMomentum` for words with internal lines, nor `rhoMon` for monomials with several legs.
2. `Host.Good` was checked against every field of `Axioms` on paper; it has not been used in a proof. If a clause turns out to need one more identity, it is cheap to add (the Fock host satisfies every identity of the word vectors that holds in the theory).
3. `exists_ope_coefficient` is quantified over all `g`, `H`, `th`, `lam`; this is true because `OperatorProductExpansion` reads only `correlation`, `coefficient`, `actor`, which do not depend on them.
4. The estimate (AI) is now based on the directed-cut argument of the first review; it has been checked on paper only.
5. The totalised definitions (`psiComp`, `Psi`, `sectorMap`, `fockMap`, `fockOp`, `projOp`) are correct only together with the lemmas that the conditions hold (`openAmpW_memLp`, `openAmpW_eq_zero`, `fockOp_apply`); until these are proved, a mistake in a definition would show up as an unprovable lemma rather than as a type error.
6. The new generic OPE statements (`gwickGrouped_factor`, `splitCorr_collapse`, `splitCorr_fderiv`, `gope_coefficients`, `gope_remainder`) were checked by hand against the proof sketch of the first review, including orientation conventions (`K α β ξ`, `ξ` = later minus earlier; a derivative at the earlier end is `−fderiv`). They have not been tested numerically.
