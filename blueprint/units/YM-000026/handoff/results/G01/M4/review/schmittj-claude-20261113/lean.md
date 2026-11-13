# Lean-correspondence review

Identity, reviewed commit and hashes: [README](README.md), [validation](validation.md). Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All readings are from the text of the source; **nothing was elaborated or built in this review**. Line numbers are file-local. (S) = read in the definition; (I) = my inference.

## 1. Public definitions relied on, with my reading

### `Lean/PublicTheory.lean`

- `YangMills.timeAxis`, `time`, `spatial`, `forwardCone`, `minkowskiSquare`, `spacelike` (l.53–68). Time is the last of four coordinates of `EuclideanSpace ℝ (Fin 4)`; the cone is closed, $\{|\mathbf x|\le t\}$; `spacelike` is strict. (S)
- `YangMills.TestFunction := SchwartzMap Spacetime ℂ`; `conjugateTest` is pointwise conjugation (l.70–74). (S)
- `YangMills.HilbertSpace`, `FieldLabels` (l.79–99). Bundled types in `Type`; no separability, no topology on labels. (S)
- `YangMills.FieldSystem` (l.105–109). `domain : Submodule ℂ H.carrier`, `vacuum : domain`, `field : Labels.carrier →ₗ[ℂ] TestFunction →ₗ[ℂ] (domain →ₗ[ℂ] domain)`. Fields are everywhere defined on `domain` and map it to itself; complex-linear in the label and in the test. No closability clause appears anywhere. (S)
- `YangMills.FieldSystem.vector`, `vacuumExpectation` (l.115–124). First index outermost. (S)
- `YangMills.FieldSystem.DomainAxioms` (l.127–133). `cyclicVacuum` is an **equality** of `domain` with the algebraic span of the word vectors (words in arbitrary labels, including the empty word). `tempered` is continuity of `test ↦ (field label test state).1` into `H.carrier`, for each label and each state of `domain`, in the Schwartz topology. (S)
- `YangMills.FieldSystem.AdjointAxiom` (l.136–141). Uses a conjugate-linear `adjointLabel`; no involutivity clause. (S)
- `YangMills.FieldSystem.SpacelikeSeparated`, `LocalCommutativity` (l.145–156). Closed supports (`tsupport`), every difference strictly spacelike; commutation as maps on `domain`, for **all** pairs of labels. (S)
- `YangMills.FieldSystem.Faithful` (l.159–161). Every nonzero label has a test with nonzero operator; equivalently the map label $\mapsto$ (test $\mapsto$ operator) is injective. (S)
- `YangMills.TranslationAction` (l.169–177). (S)
- `YangMills.EnergyMomentumMeasure` (l.180–200). `projection` is a function on **all** subsets; `empty` and `univ` are unconditional; `intersection`, `selfAdjoint`, `countablyAdditive`, `diagonalIdentity` carry measurability hypotheses. `diagonal state` is a finite measure with $\langle\psi,E(B)\psi\rangle$ on measurable $B$. Idempotence follows from `intersection`. (S)
- `YangMills.ProperLorentz`, `PoincareCoordinates`, `PoincareAction` (l.209–246). `Symmetry` is a type with `One`, `Mul`, a topology, and a homeomorphism to `ProperLorentz × Spacetime` carrying the semidirect law; one may take it to be that product itself. `onTests g f x = f (Λ⁻¹ (x - a))`. `onLabels : Symmetry → Labels.carrier ≃ₗ[ℂ] Labels.carrier`, with no continuity. (S) The topology on `ProperLorentz` is the subtype topology of the units of continuous linear maps, which in finite dimension is the matrix topology. (I)
- `YangMills.WightmanTheory` (l.255–262) and `W0` (l.270–278). `spectralRepresentation : charFun (energyMomentum.diagonal state) momentum = inner ℂ state (translations.operator momentum state)`, for every state of `H` and every vector. Mathlib: `charFun μ t = ∫ x, exp (⟪x, t⟫ * I) ∂μ` (read in a local Mathlib checkout that is **not** the pinned revision; `Mathlib/MeasureTheory/Measure/CharacteristicFunction.lean` l.128 at Mathlib `a3a10db0`; the pin is `81a5d257`). So the pairing is the inner product of `EuclideanSpace ℝ (Fin 4)`, time included, with sign $+i$. The variable named `momentum` is the translation vector. It is stated for the joint measure, not per axis. `positiveEnergy : projection forwardConeᶜ = 0`. `uniqueVacuum`: translation-invariant vectors are multiples of the vacuum. No mass-gap clause. (S)
- `W1`, `W2`, `W3`, `Axioms` (l.282–319). `W2` asks that `onLabels` be a representation (`labelIdentity`, `labelComposition`), invariance of `domain` and vacuum, and `fieldCovariance`. (S)

### `Lean/PublicWilson.lean`

- `YangMills.Points n := PiLp 2 (fun _ : Fin n => Spacetime)` (l.10). (S)
- `YangMills.WilsonFamily` (l.35–46). `Token : Type` arbitrary; `haar` a Haar probability measure on `g.image`. (S) Exists for every `g` because `g.image` is a compact group. (I)
- `YangMills.WilsonFamily.separated n` (l.59–71): injective tuples, open. (S)
- `YangMills.WilsonFamily.Converges` (l.85–90) is used only through the already formalised construction; not re-read in depth.

### `Lean/ChallengeSpec.lean`

- `YangMills.Hierarchy` (l.24–48). `Field d` carries `NormedAddCommGroup`, `NormedSpace ℂ`, **`FiniteDimensional ℂ`**; `Channel d` is a `Fintype`; `Character` a compact metric Borel space; `correlation {n} : Option Character → (Fin n → Σ d, Field d) → Points n → ℂ` and `continuation {n} : (Fin n → Σ d, Field d) → (Fin n → ℂ) → (Fin n → Space) → ℂ` are total functions with no built-in linearity; `coefficient {I} [Fintype I] (a : I → Σ d, Field d) (j : ℕ) : Channel j → (I → Spacetime) → Spacetime → ℂ` has no argument for $D$, the spectators or the state. (S)
- `Hierarchy.grouped` (l.58–61): evaluates `correlation` on `I ⊕ J` enumerated by `Fintype.equivFin`. The enumeration is not canonical, so a proof needs permutation symmetry of `correlation`; the candidate's is symmetric on all configurations. (S)/(I)
- `Hierarchy.weight` (l.63): sum of the **tag grades** `(a i).1`, not of intrinsic scaling dimensions. With a filtration, a vector of low intrinsic grade may sit in a high `Field d`; both OPE bounds then become weaker, never stronger. (S)/(I)
- `Hierarchy.Within`, `Clear` (l.65–68). (S) `Within r M η x o` with $\eta>0$, $r>0$ forces the $x_i$ pairwise distinct; with $M=0$ it forces $|I|\le1$.
- `Hierarchy.OperatorProductExpansion` (l.70–80). Quantifier order: `coefficients`: $\forall I,a,M,\eta,\varepsilon$, hypotheses, $\forall j,i$, $\forall^{\rm ev}r$, $\forall x,o$. `remainder`: $\forall I,J,a,b,M,\eta,c,\varepsilon$, hypotheses, $\forall D$, $\forall^{\rm ev}r$, $\forall x,o,y$, geometry, $\forall s$. Bounds are `≤ r ^ (real exponent)` with no constant. The sum runs over `j : Fin (D+1)` and all channels of grade `j`. The spectator-side object is `grouped s (fun _ : Unit => ⟨j, actor j i⟩) (fun _ => o) b y`. Both are upper bounds only. (S)
- `Hierarchy.orderedTube`, `complexShift`, `imaginaryTimes`, `spatialPoints`, `tensorTest` (l.95–115). (S)
- `Hierarchy.Reconstructed` (l.117–143). `covers : Surjective (fun a : T.Tag => T.toLabel a.1 a.2)` concerns the **label space** only. `root` has hypothesis `StrictMono fun i => time (x i)` and compares `continuation` at `imaginaryTimes x` with `correlation (some T.selected)`; there is no Wick-rotation map on labels. `boundary` is a `Tendsto` along `𝓝[>] 0` of a Bochner integral over `Points n`, with no integrability clause. (S) The measure on `Points n` is Lebesgue measure in the standard normalisation, and for `n = 0` a unit point mass (I; instance not elaborated).
- `Hierarchy.timePair`, `traceTwo` (l.146–149): points $(\mathbf 0,-r/2)$ and $(\mathbf 0,r/2)$ in this order, so `root` applies for $r>0$. (S)
- `Hierarchy.Mode`, `Mode.kernel`, `Track`, `wickProfile` (l.152–166). (S)
- `Hierarchy.TraceTest` (l.168–175). (S)
- `YangMills.JointExistence` (l.186–188). (S)

### Other declarations

- `YangMills.constant_insertion_witness`, `YangMills.jointExistence_body_constant_insertions`, `YangMills.Adequacy.vanishes_of_homogeneous` (`blueprint/units/YM-000026/handoff/results/G01/formal/Adequacy.lean` l.718–763). Hypotheses: `C₀ : WilsonFamily g`, `T₀ : Hierarchy C₀`, `T₀.Reconstructed`, `T₀.OperatorProductExpansion`, `T₀.TraceTest`, and `hH` over all `n`, tags and **all** configurations. No regularity of `C₀`. Statement read; proof and compilation not rechecked here. (S)
- `YM.TraceExtension.Wick.euclidean_excludes` (`Lean/YM/TraceExtension/Wick/Refute.lean` l.75–80): hypotheses `EuclideanAsymptotic F A` and `0 < A`; the proof uses `real_profile` and `no_powerlog` only. `YM.TraceExtension.EuclideanAsymptotic` (`LogScaling.lean` l.74–75) has the same normalising factor as `shortDistance`. `YangMills.publicTrace` (`Lean/TraceBridge.lean` l.35–44) derives `excludes` this way. (S) The declaration is typed for the internal `F`; the argument is generic. (I)

## 2. Where the record's reading of a definition is inaccurate

1. **`FieldSystem.field` (record l.38, 46).** The record's $\phi(f)=a(\hat f)+a^*(\hat f)$ is not complex-linear in $f$, and "1 acts as the identity" is not linear in $f$ at all. The definition demands complex linearity in the test.
2. **`Reconstructed.root` (record l.78).** The record treats the continuation of the base field as sufficient. The clause quantifies over all tags and uses the same tag on both sides; for derivative labels the two sides differ by $(-i)^{\alpha_t}$ unless the operator assigned to the label is twisted.
3. **`Reconstructed.boundary` (record l.79).** The record reads it as a distributional boundary value. It is a limit of Bochner integrals, so integrability at each $r>0$ is part of what must hold (otherwise the integral is $0$). It does hold for the candidate.
4. **`W0.spectralRepresentation` together with (K5) of `mathematics.md` (record l.37–42).** The record's displayed measure, field and kernel cannot be simultaneously consistent with the Lean normalisation, in which no $2\pi$ occurs: the kernel of the two-point distribution is $\int e^{i\langle\xi,p\rangle}d\mu$ for the same $\mu$ whose Laplace transform is `traceTwo`.
5. **`DomainAxioms.cyclicVacuum` (record l.20–21, 106).** Read correctly as an equality. The record presents it as a difficulty; it is satisfied by definition once the fields act on a larger invariant space, and it then transfers every other clause to the span.
6. **`Reconstructed.covers` (record l.46).** "The filtration is forced by `covers`" is too strong (first review M4). `covers` forces only that each label lies in one grade space.
7. **`W2` (record l.107).** "covariance with finite-dimensional label transformations" is not a Lean requirement. `onLabels` must be a representation of the whole group on the label space by linear bijections.
8. **`OperatorProductExpansion` (record §4).** Read correctly, including the independence of the coefficients from $D$, spectators and state. The record does not note that `weight` uses tag grades; this is harmless for a filtration (it weakens the bounds).

## 3. Not checked

No Lean was elaborated. The `MeasureSpace` instance on `Points n` and the pinned Mathlib definition of `charFun` were not inspected at the pinned revision. A formal instantiation of `Hierarchy` by the candidate does not exist; the correspondence above is between the public predicates and a mathematical construction, not between two formal objects.
