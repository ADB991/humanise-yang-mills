# G01 statement ledger: `YangMills.JointExistence` against `manuscript/existence/statement.tex`

Author draft, session `schmittj-claude-g01-20261112`, issue #58. Not reviewed. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; worktree commit `b2f59c320ec41ad3485b495d4c4fe2b9af17957d`. File hashes are in `validation.md`.

Evidence labels: **(S)** read in the quoted source statement or definition; **(I)** my inference from what was read (no Lean was elaborated or built); **(U)** unresolved. Verdicts compare the English with the Lean: FAITHFUL, WEAKER (English claims less or is less specific), STRONGER (English claims more than the Lean statement), DIFFERENT, OMITTED (Lean clause with no English counterpart in the audited text), NOT IN LEAN. Line numbers are file-local and supplementary. "ST" abbreviates `manuscript/existence/statement.tex`; "AS" abbreviates `manuscript/existence/assembly.tex`, whose statement of the operator-product and trace requirements ST defers to (ST 132–134). AS is owned by C16; only its statements were read, not its proofs.

Scope of this ledger: the statement and its meaning. Nothing here asserts that the proof of the statement is, or is not, complete.

## Part A. Lean to English

### A1. Top-level quantifiers

```lean
def JointExistence : Prop := ∀ g : GaugeGroup, g.IsSimple → ∃ C : WilsonFamily g,
  WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
    ∃ T : Hierarchy C, T.Properties (p ∘ q)
```

`Lean/ChallengeSpec.lean` 186–188, `YangMills.JointExistence`. (S)

Meaning. For every gauge group `g` satisfying `IsSimple`: one family `C` exists, and `WilsonRegularity C` is a property of `C` alone. After `C` is fixed, for every strictly increasing `p : ℕ → ℕ` (a sequence of period indices, not of periods) there are a strictly increasing `q` and one `T : Hierarchy C` with `T.Properties (p ∘ q)`. `q` and `T` may depend on `p`; `C` may not. All of `T` (Hilbert space, labels, graded field spaces, phase space, measure, selected point, correlations, continuation, channels, coefficients, the distinguished grade-four element) is one existential witness; the four fields of `Properties` refer to that one `T`. Nothing is asserted about the relation between the hierarchies obtained for different `p`, nor about uniqueness of `T` for a given `p`. (S)

English. ST 113–115: "The existence target is one regular Wilson family such that, for every strictly increasing period-index sequence \(p(k)\), a strictly increasing \(q(k)\) and one hierarchy with the preceding properties can be found." ST 128–130: "The same \(q\) and hierarchy work for all arities, tokens and tests. The hierarchy may depend on the requested sequence; the Wilson family may not." The universal quantifier over the group is ST 16 ("Fix a closed subgroup").

Verdict: FAITHFUL. Remark: "regular" is used in ST 113 without a definition by that name; it must mean exactly the four conditions of A3 (see patch P1).

### A2. Gauge group and simplicity

```lean
abbrev UnitaryRepresentation (n : ℕ) := Matrix.unitaryGroup (Fin (n + 1)) ℂ
structure GaugeGroup where
  n : ℕ
  image : Subgroup (UnitaryRepresentation n)
  imageClosed : IsClosed (image : Set (UnitaryRepresentation n))
  lieAlgebra : Submodule ℝ (Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
  generates : ∀ X, X ∈ lieAlgebra ↔ ∀ t : ℝ, NormedSpace.exp (t • X) ∈
      Set.range (fun u : image ↦ (u.1 : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ))
def IsSimple (gauge : GaugeGroup) : Prop :=
  (∃ X ∈ gauge.lieAlgebra, ∃ Y ∈ gauge.lieAlgebra, X * Y - Y * X ≠ 0) ∧
  ∀ ideal : Submodule ℝ (Matrix (Fin (gauge.n + 1)) (Fin (gauge.n + 1)) ℂ),
    ideal ≤ gauge.lieAlgebra →
    (∀ X ∈ gauge.lieAlgebra, ∀ Y ∈ ideal, X * Y - Y * X ∈ ideal) →
    ideal = ⊥ ∨ ideal = gauge.lieAlgebra
```

`Lean/PublicTheory.lean` 20–45, `YangMills.GaugeGroup`, `YangMills.GaugeGroup.IsSimple`. (S)

Meaning. A gauge group is a closed subgroup \(G\) of \(U(r)\), \(r=n+1\ge1\), given as a set of matrices (so the representation is the inclusion, faithful by construction). The field `lieAlgebra` is not free data: `generates` forces it to equal \(\{X:\exp(tX)\in G\ \forall t\in\mathbb R\}\). `IsSimple` says that two elements of \(\mathfrak g\) do not commute, and that every real subspace \(I\subseteq\mathfrak g\) with \([\mathfrak g,I]\subseteq I\) is \(0\) or \(\mathfrak g\). (S)

What is not assumed. \(G\) is compact automatically (closed in \(U(r)\)) (I). \(G\) is not assumed connected or simply connected: any closed subgroup of \(U(r)\) whose identity component has simple Lie algebra qualifies, for example \(SO(3)\subset U(3)\), \(O(3)\subset U(3)\), or a finite extension of \(SU(2)\) (I). The representation is not assumed irreducible or of minimal dimension: \(SU(2)\) embedded in \(U(5)\) by \(\mathbf 2\oplus\mathbf 3\) is a different `GaugeGroup` with a different Wilson action, because the action of A4 is normalised by \(\operatorname{Re}\operatorname{tr}/r\) in the given representation (S for the normalisation, I for the example).

English. ST 16–24: "Fix a closed subgroup \(G\subset U(r_G)\), with its specified faithful matrix representation. Its real Lie algebra is \(\mathfrak g=\{X\in M_{r_G}(\mathbb C):\exp(tX)\in G\text{ for every }t\in\mathbb R\}\). We assume that \(\mathfrak g\) is nonabelian and simple: its only real subspaces invariant under every \(\operatorname{ad}X\), \(X\in\mathfrak g\), are \(0\) and \(\mathfrak g\)."

Verdict: FAITHFUL. The English "real subspaces" must be read as subspaces of \(\mathfrak g\) (Lean: `ideal ≤ gauge.lieAlgebra`); patch P2 makes this and the non-assumptions explicit.

SU(2) specialisation. `Lean/ConcreteSU2.lean` 8–18: `YangMills.su2` is built from `YM.Next.Foundations.SUtwo`, defined in `Lean/YM/Next/FOUNDATIONS/SU2.lean` 36–48 with `n := 1` and carrier `{X | X.val.det = 1}` inside the unitary group of \(2\times2\) matrices, that is \(SU(2)\) in its defining representation; its `lieAlgebra` is `G.lie` and `generates` is `Iff.rfl` (S). `YangMills.su2Simple` is `YM.Examples.SU2.simple`, and `YangMills.su2Theory` is literally `jointExistence su2 su2Simple` with the body of `JointExistence` written out (S). ST, AS and `manuscript/existence/lattice.tex` do not mention the SU(2) specialisation (grep, see `validation.md`). Verdict: OMITTED from the manuscript; no error.

### A3. The Wilson family and its regularity

```lean
structure WilsonFamily (g : GaugeGroup) where
  period : ℕ → ℕ+
  denominator : ℕ → ℕ+
  periodStrict : StrictMono fun p => (period p).val
  denominatorStrict : StrictMono fun N => (denominator N).val
  beta : ℕ → ℕ → ℝ
  haar : Measure g.image
  probability : IsProbabilityMeasure haar
  invariantHaar : haar.IsHaarMeasure
  Token : Type
  insertion (N p : ℕ) : Token → Site (period p * denominator N) →
    Configuration g (period p * denominator N) → ℂ
```

`Lean/PublicWilson.lean` 35–46. (S)

```lean
structure WilsonRegularity {g : GaugeGroup} (C : WilsonFamily g) : Prop where
  running : ∃ slope : ℝ, 0 < slope ∧ ∀ ε : ℝ, 0 < ε →
    ∀ᶠ N : ℕ in atTop, ∀ p, |C.beta N p / Real.log (C.mesh N)⁻¹ - slope| < ε
  continuous (N p v x) : Continuous (C.insertion N p v x)
  invariant (N p v x) (t : Site (C.period p * C.denominator N) → g.image) (U) :
    C.insertion N p v x (fun e => t e.1 * U e * (t (e.1 + Pi.single e.2 1))⁻¹) =
      C.insertion N p v x U
  localSupport (v : C.Token) : ∃ stencil : Finset (Axis → ℤ), ∀ N p (x : Site (C.period p * C.denominator N)),
    let sites := stencil.image fun z => (fun i => (z i : ZMod (C.period p * C.denominator N).val)) + x
    ∀ U V, (∀ e, e.1 ∈ sites → e.1 + Pi.single e.2 1 ∈ sites → U e = V e) →
      C.insertion N p v x U = C.insertion N p v x V
```

`Lean/ChallengeSpec.lean` 12–22. (S)

Meaning. The family consists of strictly increasing positive integers \(P_p\) (`period`) and \(D_N\) (`denominator`), the lattice \((\mathbb Z/P_pD_N)^4\) with spacing \(a_N=D_N^{-1}\) (`mesh`, `Lean/PublicWilson.lean` 50), real \(\beta_{N,p}\), the normalised Haar measure on \(G\), an arbitrary type of tokens, and for each \((N,p)\), token \(v\) and site \(x\) a complex function \(O_{N,p,v}(x;\cdot)\) of the link configuration. Regularity: (a) `running`: there is \(\sigma>0\) such that for every \(\varepsilon>0\) there is \(N_0\) with \(|\beta_{N,p}/\log D_N-\sigma|<\varepsilon\) for all \(N\ge N_0\) and all \(p\); (b) each \(O_{N,p,v}(x;\cdot)\) is continuous; (c) each is invariant under \(U(x,i)\mapsto t(x)U(x,i)t(x+e_i)^{-1}\) for every \(t:\text{sites}\to G\); (d) for each token \(v\) there is one finite set \(\Sigma_v\subset\mathbb Z^4\), independent of \(N,p,x\), such that \(O_{N,p,v}(x;U)\) depends only on those links both of whose endpoints lie in \(x+\Sigma_v\) reduced modulo \(P_pD_N\). (S)

What is not asserted. (i) The value of \(\sigma\): the public statement has only \(\exists\sigma>0\) (S). In the proof, `YangMills.regular` (`Lean/HierarchyBridge.lean` 16–25) uses `2*Pert.Asymptotics.b0 g.core`, and `Lean/YM/Pert/Asymptotics/RawAxis.lean` 13 defines `b0 G := 11*G.casimir / (48*Real.pi^2)`, with `casimir` defined in `Lean/YM/Gauge/Colors.lean` 180–182 (S); this value is not part of `JointExistence`. (ii) Any relation between the insertions at different \((N,p)\) or at different sites \(x\): the function `insertion` is arbitrary in each argument; no translation covariance in \(x\), no fixed lattice expression, and no non-constancy is required (S). Constant functions satisfy (b), (c), (d) (I). See C3. (iii) The sign of \(\beta_{N,p}\) for small \(N\); (a) forces \(\beta_{N,p}>0\) for large \(N\) uniformly in \(p\) (I).

English. ST 29–43: "The lattice family consists of strictly increasing positive integer sequences \(P_p\) and \(D_N\), a spacing \(a_N=D_N^{-1}\), real coefficients \(\beta_{N,p}\), and local gauge-invariant insertion functions \(O_{N,p,v}(x;U)\) indexed by tokens \(v\). The periodic lattice has \(P_pD_N\) sites along each axis and physical period \(P_p\). … Each insertion is continuous in \(U\). For each token a single finite integer-offset stencil controls the insertion at every spacing, period and placement. The running condition is [display ex-running-input] … In particular, the choice of \(N_0\) is uniform in the period index."

Verdicts. `period`, `denominator`, `mesh`, `beta`: FAITHFUL. `running`: FAITHFUL, including the quantifier order \(\exists\sigma\,\forall\varepsilon\,\exists N_0\,\forall N\ge N_0\,\forall p\). `continuous`: FAITHFUL. `invariant`: FAITHFUL (the transformation is spelled out in `lattice.tex` 63–66, same convention). `localSupport`: WEAKER in precision: "controls" does not say which links matter; the Lean clause is the specific statement in (d). Patch P3. `haar`: FAITHFUL via `lattice.tex` 45 ("probability Haar measure"); ST itself only refers to Section `ex-lattice`.

### A4. The Wilson measure, moments and smearing

```lean
def plaquette {g : GaugeGroup} {l : ℕ+} (U : Configuration g l) (x : Site l) (i j : Axis) : g.image :=
  U (x,i) * (U (x + Pi.single i 1,j) * ((U (x + Pi.single j 1,i))⁻¹ * (U (x,j))⁻¹))
def wilsonEnergy {g : GaugeGroup} {l : ℕ+} (U : Configuration g l) : ℝ :=
  ∑ p : Site l × Directions,
    (1 - ((plaquette U p.1 p.2.val.1 p.2.val.2).val.val.trace).re / ((g.n+1 : ℕ) : ℝ))
def wilsonLaw (g : GaugeGroup) (l : ℕ+) (β : ℝ) (haar : Measure g.image) : Measure (Configuration g l) :=
  let prior : Measure (Configuration g l) := Measure.pi fun _ => haar
  let density := fun U : Configuration g l => Real.exp (-β * wilsonEnergy U)
  prior.withDensity fun U => ENNReal.ofReal (density U / ∫ V, density V ∂prior)
def finiteMoment (N p : ℕ) {n : ℕ} (labels : Fin n → C.Token) (x : Fin n → Site (C.period p * C.denominator N)) : ℂ :=
  ∫ U, ∏ i, C.insertion N p (labels i) (x i) U ∂wilsonLaw g (C.period p * C.denominator N) (C.beta N p) C.haar
def place (N p : ℕ) (y : Site (C.period p * C.denominator N)) : Spacetime :=
  WithLp.toLp 2 fun i => C.mesh N * (ZMod.valMinAbs (y i) : ℝ)
def suitable (p : ℕ) {n : ℕ} (t : SeparatedTest n) : Prop :=
  tsupport t ⊆ {x : Points n | ∀ i a, -((C.period p).val / (2:ℝ)) < x i a ∧ x i a < (C.period p).val / (2:ℝ)}
def smear (N p : ℕ) {n : ℕ} (v : Fin n → C.Token) (t : SeparatedTest n) : ℂ :=
  (C.mesh N : ℂ) ^ (4*n) * ∑ x : Fin n → Site (C.period p * C.denominator N),
    t (WithLp.toLp 2 fun i => C.place N p (x i)) * C.finiteMoment N p v x
```

`Lean/PublicWilson.lean` 20–33, 51–57, 73–81; `Directions := {p : Axis × Axis // p.1 < p.2}` (line 13); `SeparatedTest n := _root_.TestFunction (separated n) ℂ ⊤` (line 73), where `separated n` is the open set of injective tuples (lines 59–71). (S)

Meaning. The measure is \(Z^{-1}\exp(-\beta S(U))\prod_{\text{links}}dH_G\) with \(S(U)=\sum_x\sum_{i<j}(1-\operatorname{Re}\operatorname{tr}U_{ij}(x)/r_G)\), \(U_{ij}(x)=U_i(x)U_j(x+e_i)U_i(x+e_j)^{-1}U_j(x)^{-1}\); each unordered pair of directions is counted once; the trace is in the given representation and divided by its dimension. Moments integrate the product of the insertions. Sites are embedded by the least-absolute residue times \(a_N\). A separated test is a \(C^\infty\) complex function on \((\mathbb R^4)^n\) with compact support contained in the set of pairwise distinct points (I for the reading of Mathlib's `TestFunction Ω F ⊤`; that file was not opened). `smear` is \(a_N^{4n}\sum_{\boldsymbol x}f(a_N\boldsymbol x)M_{N,p}(\boldsymbol v;\boldsymbol x)\), the sum being over all \(n\)-tuples of sites, including coinciding ones, where \(f\) vanishes. `suitable p t` requires the closed support to lie in the open cube \((-P_p/2,P_p/2)^{4n}\). (S)

English. `lattice.tex` 27–59 for the action and law; ST 45–57: "A separated test is a smooth complex function with compact support in this set, extended by zero outside it. … [display ex-smearing] … Here the coordinates of \(\boldsymbol x\) are chosen in the centered fundamental cell. A period is suitable for \(f\) if its support lies strictly inside that physical cell in every coordinate."

Verdict: FAITHFUL (action normalisation, plaquette orientation, one count per pair \(i<j\), product Haar prior, normalisation, smearing weight, centred cell, suitability all agree).

### A5. `Properties.wilson`: the ordered limit

```lean
def Converges (volumeOrder : ℕ → ℕ)
    (unselected : {n : ℕ} → (Fin n → C.Token) → Points n → ℂ) : Prop :=
  ∀ n (v : Fin n → C.Token) (t : SeparatedTest n),
    (∀ᶠ k : ℕ in atTop, C.suitable (volumeOrder k) t) ∧ ∃ row : ℕ → ℂ,
    (∀ p, C.suitable p t → Tendsto (fun N => C.smear N p v t) atTop (𝓝 (row p))) ∧
    Tendsto (fun k => row (volumeOrder k)) atTop (𝓝 (∫ x, t x * unselected v x))
-- in Properties:
  wilson : C.Converges order (fun v => T.correlation none (T.project ∘ v))
```

`Lean/PublicWilson.lean` 85–90; `Lean/ChallengeSpec.lean` 178. (S)

Meaning. For every arity \(n\), tokens \(\boldsymbol v\) and separated test \(f\): (1) \(f\) is suitable for \(P_{p(q(k))}\) for all large \(k\); (2) there are numbers \(w_p\) (depending on \(n,\boldsymbol v,f\)) such that for every period index \(p\) for which \(f\) is suitable, not only those on the sequence, the full sequence \(W_{N,p}(\boldsymbol v;f)\) converges to \(w_p\) as \(N\to\infty\); (3) \(w_{p(q(k))}\to\int f\,S^{\mathrm{mix}}_{\boldsymbol A}\) as \(k\to\infty\), where \(A_i=\texttt{project}(v_i)\) and the mixed correlation is `correlation none`. The mesh limit is a full limit; the volume limit is along the subsequence \(p\circ q\); the order is mesh first. The right-hand integral is a Bochner integral over `Points n` with Mathlib's `volume`; the integrand is continuous with compact support by `Reconstructed.smooth`, so it is an ordinary Lebesgue integral (I; which `MeasureSpace` instance on `PiLp 2 (fun _ : Fin n => EuclideanSpace ℝ (Fin 4))` is selected was not elaborated, (U) minor: any candidate is Lebesgue measure on \(\mathbb R^{4n}\)). Clause (1) is automatic from strict monotonicity and compact support (I).

English. ST 116–128: "For each separated test there are row limits \(w_p(\boldsymbol v;f)\) satisfying [ex-row-target: \(\lim_{N\to\infty}W_{N,p}=w_p\) at each suitable fixed \(p\)], [ex-volume-target: \(\lim_{k}w_{p(q(k))}=\int f S^{\mathrm{mix}}_{\boldsymbol A}\)] where \(A_i\) is the class of \(v_i\). Suitability holds eventually along the selected period sequence."

Verdict: FAITHFUL.

### A6. The hierarchy data

`Lean/ChallengeSpec.lean` 24–48, `YangMills.Hierarchy` (not reproduced here; fields: `H`, `labels`, `theory`, `Field d` finite-dimensional normed complex spaces, `toLabel d : Field d →ₗ[ℂ] labels.carrier`, `project : C.Token → Σ d, Field d`, `Character` compact metric Borel space, `phaseMeasure`, `selected`, `correlation : Option Character → (Fin n → Σ d, Field d) → Points n → ℂ`, `continuation`, `Channel d` finite, `actor d : Channel d → Field d`, `coefficient`, `centeredTrace : Field 4`). (S)

Meaning and English. ST 59–77 lists \(\mathcal F_d\), the linear maps to the label space, the token map, \(X,\nu,\chi_*\), \(S^\chi\) and \(S^{\mathrm{mix}}\). The correspondences `Option Character`: `some χ` \(\leftrightarrow S^\chi\), `none` \(\leftrightarrow S^{\mathrm{mix}}\) are as ST says. `Channel`, `actor`, `coefficient` appear in AS 10–16; `centeredTrace` in AS 42 as \(\Theta\).

Verdict: FAITHFUL for the data named. Two remarks on names. (a) `Character` is a bare type: the public statement gives its points no algebraic meaning. ST 63–65 calls its elements "character" and "phases"; this is NOT IN LEAN as far as the public statement goes (the internal construction does take characters of an algebra, see the #11 note). (b) `centeredTrace` is a bare element of `Field 4`; the public statement does not say it is the trace of a stress tensor. See C1. (c) `correlation` is a plain function of the tuple of tags. No public clause requires it to be linear in the field components at fixed grades, or to depend on a tag only through its label, for any state (S, by reading every field of `Reconstructed`, `OperatorProductExpansion`, `TraceTest`). ST's phrase "correlations" of "graded fields" (65–68) suggests the usual multilinear objects; that property is NOT IN LEAN at public level. For the constructed hierarchy it holds by definition (`YM.Table.classMoment` is a `MultilinearMap`, `Lean/YM/Euclid/Lift.lean` 58–59). See C3 and `adequacy.md`.

### A7. `Properties.reconstruction`: `Hierarchy.Reconstructed`

`Lean/ChallengeSpec.lean` 117–143 (S). Clause by clause:

| Lean clause | Meaning | English (ST) | Verdict |
| --- | --- | --- | --- |
| `axioms : T.theory.Axioms` | W0–W3 of A8 | Definition `ex-reconstructed`, 79–100 | see A8 |
| `faithful : T.theory.fields.Faithful` | every nonzero label \(A\) has a test \(f\) with \(\Phi(A,f)\ne0\) as a map \(\mathcal D\to\mathcal D\) | 99: "Every nonzero label acts nontrivially for some test" | FAITHFUL |
| `injective (d)` | each `toLabel d` is injective | 61: "complex-linear injection into a common field-label space" | FAITHFUL |
| `acts` | some graded field and test give a nonzero operator | 99–100: "at least one smeared field is nonzero" | FAITHFUL |
| `covers` | every label is `toLabel d a` for a single pair \((d,a)\) | 61–62: "every label is represented at some grade" | FAITHFUL |
| `represents` | `project` is surjective onto \(\coprod_d\mathcal F_d\) | 62–63: "Tokens map onto the disjoint union" | FAITHFUL |
| `normalized`, `fullSupport` | \(\nu\) is a probability measure, positive on nonempty open sets | 63–64 | FAITHFUL |
| `permutation (s)` | for every \(s\) (each \(\chi\) and mixed), every separated \(\boldsymbol x\), every permutation | 68–69: "permutation symmetric" | FAITHFUL |
| `smooth (s)` | `ContDiffOn ℝ ∞` on the separated set, for every \(s\) | 68: "smooth on configuration space" | FAITHFUL |
| `characterContinuity` | for separated \(\boldsymbol x\), \(\chi\mapsto S^\chi_{\boldsymbol A}(\boldsymbol x)\) continuous (pointwise in \(\boldsymbol x\)) | 69: "continuous in \(\chi\)" | FAITHFUL |
| `mixture` | \(\int_X S^\chi_{\boldsymbol A}(\boldsymbol x)\,d\nu=S^{\mathrm{mix}}_{\boldsymbol A}(\boldsymbol x)\) at separated \(\boldsymbol x\) | 70–73 | FAITHFUL |
| `analytic` | for every spatial tuple (coincidences allowed) \(z\mapsto F_{\boldsymbol A}(z;\boldsymbol x)\) is complex differentiable on \(\{\operatorname{Im}z_1<\dots<\operatorname{Im}z_n\}\subset\mathbb C^n\) | 102–104 | FAITHFUL |
| `root` | if the times of \(x_1,\dots,x_n\) are strictly increasing then \(F_{\boldsymbol A}((it_j)_j;(\boldsymbol x_j)_j)=S^{\chi_*}_{\boldsymbol A}(x)\) | 104–106 | FAITHFUL |
| `boundary` | for strictly increasing \(h\in\mathbb R^n\) and Schwartz \(f_1,\dots,f_n\): \(\int_{\mathbb R^{4n}}F_{\boldsymbol A}((t_j+irh_j)_j;(\boldsymbol x_j)_j)\prod_jf_j(\boldsymbol x_j,t_j)\,dx\to\langle\Omega,\Phi(A_1,f_1)\cdots\Phi(A_n,f_n)\Omega\rangle\) as \(r\downarrow0\) | 107–110: "its integrals on \(z_i=t_i+i\epsilon h_i\) converge as \(\epsilon\downarrow0\) to the corresponding vacuum expectation of the smeared fields" | WEAKER in precision (operator order and product form of the test not displayed); see also the integrability remark below. Patch P4 |

Operator order. `FieldSystem.vacuumExpectation` (`Lean/PublicTheory.lean` 121–124) is `inner ℂ vacuum (vector (List.ofFn …))`, and `vector (letter :: word) = field letter.1 letter.2 (vector word)` (115–118), so the first index is the outermost operator: \(\langle\Omega,\Phi(A_1,f_1)\Phi(A_2,f_2)\cdots\Phi(A_n,f_n)\Omega\rangle\), with Mathlib's inner product conjugate-linear in the first slot (S for the definitions, I for the Mathlib convention). This order is consistent with the tube \(\operatorname{Im}z_1<\dots<\operatorname{Im}z_n\) and with \(U(a)=\int e^{i\langle p,a\rangle}dE(p)\) of A8 (I).

Integrability in `boundary`. The Lean clause is a statement about the Bochner integral `∫ x : Points n, …`, which Mathlib defines to be \(0\) for a non-integrable integrand; `Reconstructed` contains no integrability or measurability clause for \(x\mapsto F(\ldots)\prod f_j\) (S). The internal source does carry one: `YM.Boundary.Waves.Opens.int` in `Lean/YM/Boundary/Contour.lean` 90–94 (S), but it is not exported into `JointExistence`. The English "its integrals … converge" presupposes that the integrals exist. Verdict on this point: STRONGER by presupposition, at the level of the public statement only; no mathematical error is implied for the constructed witness. Patch P4 records it.

Not asserted by `Reconstructed` or anywhere in `JointExistence` (S, by reading all fields): linearity of the correlations in the field components (A6 (c)); Euclidean or translation invariance of the correlations as an explicit clause; reflection positivity; any bound or clustering; any property of the values of `correlation` off the separated set; any Wightman theory, positivity or continuation for \(\chi\ne\chi_*\); uniqueness of `continuation`. (I): for the selected phase the continuation is determined on the tube by `root` (the ordered imaginary points form a totally real set of full dimension in a connected domain), so `boundary` does tie the Wightman functions on product tests to \(S^{\chi_*}\).

### A8. `WightmanTheory.Axioms`

`Lean/PublicTheory.lean` 104–319 (S).

| Lean clause | Meaning | English (ST) | Verdict |
| --- | --- | --- | --- |
| `HilbertSpace` 79–83 | complete complex inner-product space (no separability clause) | 80 | FAITHFUL |
| `FieldSystem` 105–109 | subspace \(\mathcal D\), \(\Omega\in\mathcal D\), \(\Phi\) linear in label, linear in test \(f\in\mathcal S(\mathbb R^4;\mathbb C)\), values linear maps \(\mathcal D\to\mathcal D\) | 81–85 | FAITHFUL |
| `DomainAxioms.normalizedVacuum`, `denseDomain` | \(\|\Omega\|=1\), \(\mathcal D\) dense | 81–82 | FAITHFUL |
| `DomainAxioms.cyclicVacuum` | \(\mathcal D\) equals the algebraic span of all \(\Phi(A_1,f_1)\cdots\Phi(A_k,f_k)\Omega\), \(k\ge0\) | 87: "The domain is the span of field words applied to the vacuum" | FAITHFUL |
| `DomainAxioms.tempered` | \(f\mapsto\Phi(A,f)\psi\in\mathcal H\) continuous on Schwartz space, each \(A\), \(\psi\in\mathcal D\) | 85–86 | FAITHFUL |
| `AdjointAxiom` 136–141 | \(\langle\Phi(A,f)\psi,\eta\rangle=\langle\psi,\Phi(A^*,\bar f)\eta\rangle\), \(A\mapsto A^*\) conjugate-linear; involutivity is not a separate clause but follows from applying the identity twice together with density of \(\mathcal D\) and `Faithful` (I) | 87–92 | FAITHFUL |
| `TranslationAction` 169–177, `translationCompatibility` 261–262 | strongly continuous isometric translation group, equal to the restriction of the Poincaré action | 93–94 | FAITHFUL |
| `PoincareAction` 219–246 | a topological type with unit and product, homeomorphic to `ProperLorentz × Spacetime` with the semidirect law \((\Lambda,b)(\Lambda',b')=(\Lambda\Lambda',\Lambda b'+b)\); isometric operators with \(U(1)=1\), \(U(gh)=U(g)U(h)\), strongly continuous; tests transform by \((gf)(x)=f(\Lambda^{-1}(x-b))\) | 93–95: "A strongly continuous unitary representation of the proper orthochronous Poincaré group … the ordinary affine pullback of tests" | FAITHFUL. Unitarity follows because every element has an inverse in these coordinates (I) |
| `ProperLorentz` 209–212 | invertible linear maps with determinant \(1\), preserving \(t^2-|\boldsymbol x|^2\) and mapping the closed forward cone onto itself | 24–27, 93–94 | FAITHFUL |
| `W0.spectralRepresentation`, `EnergyMomentumMeasure` 180–200, 271–273 | a projection-valued measure \(E\) on \(\mathbb R^4\) with \(\langle\psi,U(a)\psi\rangle=\int e^{i\langle p,a\rangle}d\langle\psi,E(p)\psi\rangle\), Euclidean pairing \(\langle p,a\rangle\) (Mathlib `charFun`, I) | 96: "Its translation spectral measure" | FAITHFUL |
| `W0.positiveEnergy` | \(E(\mathbb R^4\setminus\overline V_+)=0\), \(\overline V_+=\{|\boldsymbol p|\le E\}\) closed | 96: "supported in \(\overline V_+\)" | FAITHFUL |
| `W0.uniqueVacuum` | every vector fixed by all translations is a complex multiple of \(\Omega\) | 97 | FAITHFUL |
| `W2.labelIdentity`, `labelComposition` | the label maps form a representation of the whole symmetry type (the full Poincaré group, translations included) by complex-linear bijections; no continuity or finite-dimensionality is asserted, and nothing requires pure translations to act trivially on labels | 95: "the specified action on labels" | WEAKER (not stated that it is a representation). Reader risk: the usual covariance law, in which translations fix the label and Lorentz transformations act by a finite-dimensional representation, is not what the public clause says. The constructed action is of the usual kind: `onLabels` uses only the Lorentz component (`Lean/PublicView.lean` 56–57) (S) |
| `W2.domainInvariant`, `vacuumInvariant`, `fieldCovariance` | \(U(g)\mathcal D\subseteq\mathcal D\), \(U(g)\Omega=\Omega\), \(U(g)\Phi(A,f)\psi=\Phi(gA,gf)U(g)\psi\) | 94–95 | FAITHFUL |
| `W3.locality`, `SpacelikeSeparated` 145–156 | if \(x-y\) is strictly spacelike for all \(x\in\operatorname{supp}f\), \(y\in\operatorname{supp}g\) (closed supports), then \(\Phi(A,f)\Phi(B,g)=\Phi(B,g)\Phi(A,f)\) on \(\mathcal D\) | 98–99 | FAITHFUL |

The spectral conclusions are exactly: spectrum in the closed forward cone, and the translation-invariant vectors form the one-dimensional space \(\mathbb C\Omega\). No clause asserts that \(\{0\}\) is isolated in the spectrum or that any neighbourhood of the origin of the cone minus \(\{0\}\) is \(E\)-null (S).

### A9. `Properties.ope`: `Hierarchy.OperatorProductExpansion`

`Lean/ChallengeSpec.lean` 58–80 (S); the text is not reproduced here.

Meaning. `weight a` \(=\sum_i d_i\) for graded fields \(a_i\in\mathcal F_{d_i}\). `Within r M η x o`: \(|x_i-o|\le Mr\) and \(|x_i-x_j|\ge\eta r\) for \(i\ne j\). `Clear o y c`: \(|o-y_i|\ge c\), \(|y_i-y_j|\ge c\) (no upper bound on spectator positions). `coefficients`: for every finite index type \(I\) (the empty type included), \(a\), \(M\ge0\), \(\eta,\varepsilon>0\), degree \(j\), channel \(i\): for all sufficiently small \(r>0\) and all \(x,o\) in the cluster geometry, \(|c^{j,i}_a(x;o)|\le r^{j-w(a)-\varepsilon}\). `remainder`: for every \(a,b,M\ge0,\eta,c,\varepsilon>0\) and \(D\): for all sufficiently small \(r>0\), all \(x,o,y\) in the geometry and every \(s\) (each \(\chi\) and the mixed state): \(|S^s_{a,b}(x,y)-\sum_{j\le D}\sum_{i\in\mathcal C_j}c^{j,i}_a(x;o)S^s_{E_{j,i},b}(o,y)|\le r^{D+1-w(a)-\varepsilon}\). The coefficients do not depend on \(s\), on the spectators, or on \(D\); thresholds in \(r\) are chosen after \((a,b,M,\eta,c,\varepsilon,D)\) (and, for coefficients, after \((j,i)\)) and before \((x,o,y,s)\). The estimates concern Euclidean correlations only. `actor` is not asserted injective or spanning. (S)

English. AS 10–40 (ST 132–134 defers to it). AS states both bounds with the same exponents, the same geometry, phase independence of the coefficients, "\(s\) can be any character or the mixed state", and "There is no assertion of one threshold working for all truncation degrees."

Verdict: FAITHFUL as stated in AS; OMITTED from ST itself except by forward reference. No patch needed for ST beyond the pointer.

### A10. `Properties.nonfree`: `Hierarchy.TraceTest`

```lean
def timePair (r : ℝ) : Points 2 := WithLp.toLp 2 fun i => WithLp.toLp 2 (Fin.snoc (fun _ : Fin 3 => (0:ℝ))
    (Fin.append (fun _ : Fin 1 => -(r/2)) (fun _ : Fin 1 => r/2) i))
def traceTwo (r : ℝ) := T.correlation (some T.selected) (fun _ : Fin 2 => ⟨4,T.centeredTrace⟩) (timePair r)
def Mode.kernel (m : Mode) (r : ℝ) (p : Space) : ℝ :=
  let E := Real.sqrt ((m.mass:ℝ)^2 + ‖p‖^2)
  1 / (2*E) * E^m.timeOrder * m.numerator p * Real.exp (-r*E)
def wickProfile (terms : List (ℂ × Track)) (r : ℝ) : ℂ :=
  (terms.map fun (c,t) => c * ((∏ i, ∫ p : Space, (t.modes i).kernel r p : ℝ) : ℂ)).sum
structure TraceTest : Prop where
  centered (f : YangMills.TestFunction) : inner ℂ T.theory.fields.vacuum.1
      (T.theory.fields.field (T.toLabel 4 T.centeredTrace) f T.theory.fields.vacuum).1 = 0
  amplitudePositive : 0 < 3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi^4
  shortDistance : Tendsto (fun r : ℝ => (r^8 * (Real.log r⁻¹)^2) • T.traceTwo r)
    (𝓝[>] 0) (𝓝 ((3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi^4 : ℝ) : ℂ))
  excludes (terms : List (ℂ × Track)) : ¬ T.traceTwo =ᶠ[𝓝[>] 0] wickProfile terms
```

`Lean/ChallengeSpec.lean` 145–175 (S); `Mode` has `mass : ℝ≥0`, `spatialOrder timeOrder : ℕ`, a continuous `numerator : Space → ℝ` positively homogeneous of degree `spatialOrder`; a `Track` is a finite tuple of modes.

Meaning. There is an element \(\Theta\in\mathcal F_4\) with: (1) \(\langle\Omega,\Phi(\Theta,f)\Omega\rangle=0\) for all Schwartz \(f\); (2) a statement about \(\mathfrak g\) only, \(3\dim_{\mathbb R}\mathfrak g/\pi^4>0\), which holds for every nonzero \(\mathfrak g\) (I); (3) with \(T(r)=S^{\chi_*}_{\Theta,\Theta}((\boldsymbol0,-r/2),(\boldsymbol0,r/2))\), \(r^8\log^2(1/r)\,T(r)\to3\dim_{\mathbb R}\mathfrak g/\pi^4\) as \(r\downarrow0\); (4) for every finite list of pairs (complex coefficient, track), \(T\) does not coincide on any interval \((0,\delta)\) with \(\sum_kc_k\prod_i\int_{\mathbb R^3}\frac{\omega^{k_i}P_i(p)}{2\omega}e^{-r\omega}dp\), \(\omega=\sqrt{m_i^2+|p|^2}\). (S)

What clause (4) adds. In the source, (4) is derived from (3) and positivity of the constant alone: `YangMills.publicTrace` (`Lean/TraceBridge.lean` 35–44) calls `Wick.euclidean_excludes H.shortDistance H.positive`, whose hypotheses are `EuclideanAsymptotic F A` and `0 < A` (`Lean/YM/TraceExtension/Wick/Refute.lean` 75–76; `Lean/YM/TraceExtension/LogScaling.lean` 74–75) (S). So within the public statement (4) carries no information beyond (3). What is excluded is exactly: exact agreement near \(r=0\), on the time axis, of this one two-point function with a finite linear combination of finite products of the displayed one-particle Laplace integrals. Not excluded by any public clause: infinite sums or continuous superpositions in the mass (in particular a generalised free field whose Källén–Lehmann weight reproduces the \(r^{-8}\log^{-2}\) behaviour); nothing is asserted about truncated \(n\)-point functions for \(n\ge3\), so no non-Gaussianity statement in the usual sense is made (S for the absence of such clauses; I for the generalised-free-field remark, which agrees with `Lean/README.md` line 26 and with `manuscript/existence/trace-profiles.tex` 233–237).

English. AS 42–58: "The trace requirement concerns a centered grade-four field \(\Theta\). … Its vacuum one-point functional vanishes, and the required asymptotic is [ex-trace-limit] … Theorem `thm:profile-exclusion` shows that this asymptotic implies the required exclusion of finite complex linear combinations of mass-shell tracks, including empty products." The mode profile `eq:profile-mode` in `trace-profiles.tex` 163–170 is the same integrand as `Mode.kernel`. ST 132–133: "The full endpoint also specifies a common operator-product expansion and a short-distance trace test".

Verdict: FAITHFUL in AS and `trace-profiles.tex`; ST only names it. The word "trace" (ST 133, AS 42) has no public stress-tensor identification (C1); "centered" is not merely a name: it records the explicit clause `TraceTest.centered`, the vanishing of the vacuum one-point functional. Neither word asserts that this label is self-adjoint.

### A11. From `YangMills.constructed` to `YangMills.jointExistence`

```lean
theorem constructed (g : GaugeGroup) (hg : g.IsSimple) (b : ℝ) (hb : 0 < b) :
    ∃ C : YM.Family g.core, C.path.levels.clock.kernel.penalty = b ∧ C.Makes ∧
      WilsonRegularity (wilsonFamily C) ∧
      ∀ p : Extraction.Order, ∃ (q : Extraction.Order) (S : Table C.book)
        (F : Final C (p.refine q) S) (L : EveryPhase.Almanac F) (Q : Reader …) (M : Contacts.Devices …) (X : Climb.Scaling S),
        (hierarchy F Q).Properties (p.refine q).per ∧ (hierarchy F Q).Contacts ∧
        (Extraction.Order.mk Extraction.Sequence.full (p.refine q).per).Ordered C S ∧ … (14 further conjuncts)
theorem YangMills.jointExistence : YangMills.JointExistence := by
  intro g hg
  obtain ⟨C,_,_,reg,orders⟩ := YangMills.constructed.{0,0} g hg 1 zero_lt_one
  refine ⟨YangMills.wilsonFamily C,reg,fun p hp => ?_⟩
  let a : YM.Extraction.Order := ⟨.full,⟨p,hp⟩⟩
  obtain ⟨q,S,F,L,Q,M,X,core,_⟩ := orders a
  exact ⟨q.per,q.per.monotone,YangMills.hierarchy F Q,core⟩
```

`Lean/Construction.lean` 15–31; `Lean/Solution.lean` 4–10 (S).

Meaning. `constructed` is quantified over the group and over every real \(b>0\); for each it gives an internal family whose blocking-kernel penalty equals \(b\), and for every internal order (a pair of strictly increasing maps, mesh and period, `Lean/YM/Extraction/Orders.lean` 20–40) a refining order \(q\) and one tuple of witnesses for which the public `Properties` holds along the period component \((p\circ q)_{\mathrm{per}}\) together with further conclusions. `jointExistence` takes \(b=1\), the public family `wilsonFamily C`, the internal order (identity mesh, given \(p\)), and returns the period component `q.per` of the refinement (the field `Sequence.monotone` has type `StrictMono`), the hierarchy `hierarchy F Q`, and the first conjunct. All other conjuncts, the mesh component of \(q\), and the dependence on \(b\) are discarded. `Order.refine` composes both components: `refine f g := Order.mk (f.mesh.after g.mesh) (f.per.after g.per)` with `Sequence.after s t = s ∘ t` (`Lean/YM/Extraction/Orders.lean` 25, 40), so in `constructed`, for a general order `p`, `F` is indexed by the order with mesh component `p.mesh ∘ q.mesh` and period component `p.per ∘ q.per`. Only in the specialisation made by `jointExistence`, where `p.mesh` is `Sequence.full` (the identity), does the mesh component reduce to `q.mesh`. `Properties` takes a period sequence only, not a two-component order; its `wilson` field requires the full mesh limit, and in `constructed` this is supplied by the separate conjunct `Ordered` on the order with `mesh := full` and `per := (p.refine q).per`. (S)

English. AS 91–135: Input `ex-joint-input` ("For the fixed group \(G\) and each chosen positive blocking penalty \(b\), there is one lattice family … For every extraction order \((u,p)\), there is a refinement \((v,q)\) and one set of graded fields, phase data, correlations and selected relativistic theory …") and the proof of Proposition `ex-conditional-existence` ("choose \(b=1\) … Apply the input to the extraction order \((\mathrm{id},p)\) … Take \(q\) as the public volume subsequence"). ST does not mention the detailed theorem.

Verdict: FAITHFUL at statement level. Input `ex-joint-input` is weaker than `constructed` (it omits `Contacts`, the nested expansion, the every-character axioms, the detailed trace clauses and the position tests); this is a WEAKER description, sufficient for the public projection.

## Part B. English to Lean

Every assertion of ST, by line, with its Lean anchor.

| ST lines | Assertion | Lean anchor | Verdict |
| --- | --- | --- | --- |
| 4–9 | two limits, mesh then period; family chosen before both | `WilsonFamily.Converges`; quantifier order of `JointExistence` | FAITHFUL |
| 6–7 | "the period tends to infinity" | along \(p\circ q\) only | FAITHFUL given 113–115 |
| 11–14 | reader prerequisites | none (editorial) | not a claim about Lean |
| 16–24 | group, Lie algebra, simplicity | A2 | FAITHFUL |
| 24–27 | coordinates, Minkowski form, closed cone | `timeAxis`, `minkowskiSquare`, `forwardCone`, `Lean/PublicTheory.lean` 51–68 | FAITHFUL |
| 29–34 | family data, lattice size | A3 | FAITHFUL |
| 35–37 | continuity, one stencil per token | A3 | FAITHFUL / WEAKER in precision (P3) |
| 37–43 | running condition, uniform in \(p\) | A3 `running` | FAITHFUL |
| 45–57 | separated tests, smearing, suitability | A4 | FAITHFUL |
| 59–63 | graded spaces, injections, covering, tokens onto \(\coprod_d\mathcal F_d\) | A6, A7 | FAITHFUL |
| 63–65 | \(X\), \(\nu\), \(\chi_*\) "describe the phases" | A6 | data FAITHFUL; the words "character", "phases" are NOT IN LEAN at public level (C2, P5) |
| 65–73 | \(S^\chi\), \(S^{\mathrm{mix}}\) smooth, symmetric, continuous in \(\chi\), mixture | A7 | FAITHFUL for the listed properties; the word "correlations" should not be read as implying multilinearity in the fields, which no public clause states (A6 (c)) |
| 74–75 | "The mixed correlations are the Wilson limits. The selected correlations are the Euclidean correlations to be continued" | `Properties.wilson`; `Reconstructed.root` | FAITHFUL |
| 75–77 | the two roles are distinct | no clause identifies them | FAITHFUL (correct warning) |
| 79–100 | Definition `ex-reconstructed`, first paragraph | A8 | FAITHFUL |
| 102–110 | continuation, root, boundary values | A7 | FAITHFUL; boundary clause WEAKER in precision and STRONGER by presupposed integrability (P4) |
| 113–115 | existence target | A1 | FAITHFUL |
| 116–128 | row and volume limits | A5 | FAITHFUL |
| 128–130 | same \(q\), hierarchy for all tests; dependence on sequence | A1 | FAITHFUL |
| 132–134 | OPE and trace test are further obligations on the same hierarchy | `Properties.ope`, `.nonfree` | FAITHFUL; content OMITTED from ST, present in AS |
| 134–137 | "a theory of the constructed gauge-invariant observables; identifying a particular label with a separately prescribed physical observable requires its own construction argument" | no clause of `JointExistence` identifies a label with a prescribed observable | FAITHFUL (correct limitation) |

No sentence of ST, AS 1–58 and 91–147, `lattice.tex` 1–121 or `trace-profiles.tex` 1–8 and 219–237 was found that asserts or suggests a mass gap. A case-insensitive search of `manuscript/existence.tex`, `manuscript/existence/*.tex`, `manuscript/main.tex` and `manuscript/README.md` for "mass gap", "mass-gap", "spectral gap", "confinement", "generalized free", "asymptotic freedom", "non-free", "nonfree", "non-Gaussian", "Clay", "Millennium" returned no line (command in `validation.md`); the hits for "massive" and "interacting" are internal technical uses (free massive reference fields, interacting block integrals) and make no claim about the spectrum.

## Part C. What a reader of ST might believe that the formal statement does not establish, and where the formal statement is weaker than its natural reading

Each item states the exact definition that causes it.

**C1. The "trace" is a name.** (S) `Hierarchy.centeredTrace : Field 4` (`Lean/ChallengeSpec.lean` 48) is an unconstrained element of the grade-four space; `TraceTest` constrains only its vacuum expectation and its two-point function on the time axis. The identification with a stress-tensor trace exists only in the detailed theorem, as `YM.Nonperturbative.Headline.TraceExclusions.identified` (`Lean/YM/Nonperturbative/HeadlineSpec.lean`, structure `TraceExclusions`), which is discarded by `Solution.lean`. The public statement fixes the numerical asymptotic coefficient of the chosen field through `shortDistance`, but supplies no independent stress-tensor or Ward-identity normalisation identifying that field physically (S). `traceTwo` evaluates the unrestricted function `correlation` at the tag of \(\Theta\) in both slots; quadratic dependence on \(\Theta\) is not part of the public definition. For a hierarchy whose correlations are multilinear, as the constructed one is, replacing \(\Theta\) by \(\lambda\Theta\) multiplies the two-point function by \(\lambda^2\); so an otherwise suitable centred field with asymptotic coefficient \(c\ne0\) can be normalised to the prescribed coefficient, and conversely rescaling a field that satisfies `shortDistance` destroys it (I).

**C2. Only the selected point carries a quantum field theory.** (S) For \(\chi\ne\chi_*\) the public statement asserts smoothness, permutation symmetry, continuity in \(\chi\), the mixture identity and the common OPE estimates, and nothing else: no Hilbert space, no positivity, no continuation. The detailed theorem has more (`∀ i, (view (L.actors i)).Axioms` in `Lean/Construction.lean` 27, and `Headline.Reconstruction.characters`), again discarded. (S) The Wilson measure enters `JointExistence` only through `Properties.wilson`, which concerns `correlation none`. The selected theory is linked to it only by `mixture` and by sharing the OPE coefficients. ST 74–77 says this correctly; a reader should not conclude that the selected theory is "the" continuum limit of the Wilson moments unless \(X\) is a single point, which is not asserted.

**C3. The lattice clause does not force the insertions to read the configuration.** (S) `WilsonFamily.insertion` is chosen by the prover separately for every \((N,p,v,x)\); `WilsonRegularity` requires continuity, gauge invariance and the stencil condition, all of which constant functions satisfy. The Wilson measure enters `JointExistence` only through `correlation none`. (I) Identically vanishing insertions are excluded (arity-zero normalisation together with the OPE remainder for an empty cluster). (I, not formalised, not independently reviewed) Constant insertions are not excluded: starting from the constructed witness one obtains another witness of `JointExistence` whose insertions are constants, by adding a second phase with correlations \(2M-S\) and two grade-zero channels. The argument uses that the public `correlation` need not be multilinear and that non-selected phases need not be positive. The earlier version of this item left the question open; it is now treated in full, with proof, scope and caveats, in `adequacy.md`. This concerns the strength of the public statement as a specification, not the constructed witness or the Lean proof. ST 134–137 states a related limitation in words; patch P6 proposes a sharper one.

**C4. The running slope is not fixed.** (S) Only \(\exists\sigma>0\). The one-loop value appears in the proof (`YangMills.regular`), not in the statement. ST does not claim otherwise.

**C5. No invariance or positivity of the Euclidean correlations is stated.** (S) See the list at the end of A7. Properties of this kind for the selected phase are consequences of the Wightman axioms through `root` and `boundary` only to the extent that those clauses determine the correlations; ST does not claim them.

**C6. Integrals with Mathlib's default value.** (S) `Reconstructed.boundary`, `Reconstructed.mixture`, `WilsonFamily.Converges` and `wickProfile` use Bochner integrals without integrability hypotheses. (I) For `mixture`, `Converges` and `wickProfile` integrability follows from other clauses or from the explicit integrand (continuity on a compact space; continuity with compact support; exponential decay with an integrable singularity \(|p|^{-1}\) in three dimensions). This holds for positive radii, which is all the right-hand limit in `excludes` uses; at \(r=0\) a massless mode with constant numerator is not integrable. For `boundary`, integrability is not stated in the public clauses and has not been derived from them here; I have no proof that it cannot be derived.

**C7. The group need not be connected and the representation need not be irreducible.** (S)/(I) See A2. ST's wording is accurate but silent.

**C8. Index sequences.** (S) \(p\) is a sequence of period indices; the physical periods are \(P_{p(q(k))}\). ST 114 says "period-index sequence", correctly; `Lean/README.md` line 9 says "sequence of volumes".

**C9. Universe and size.** (S) `HilbertSpace.carrier`, `FieldLabels.carrier`, `Field d`, `Character`, `Token` are in `Type` (universe 0). No consequence for the mathematics was identified.

## Part D. Comparison with `Lean/README.md`

The README's four bullets agree with A3–A10 as far as they go (S). Three differences from the Lean statement, none reproduced in ST: (i) "sequence of volumes" for a sequence of period indices; (ii) "Changing links outside that patch leaves the insertion unchanged" is correct only with "patch" read as the set of links with both endpoints in the translated stencil; (iii) "The detailed theorem identifies this field as the physical centered stress trace" is a statement about `constructed`, not about `jointExistence`. The README's scope sentence, "A positive mass gap, general exclusion of continuous-mass generalized free fields and all-orders MS-bar matching are outside its scope", agrees with A8 and A10.
