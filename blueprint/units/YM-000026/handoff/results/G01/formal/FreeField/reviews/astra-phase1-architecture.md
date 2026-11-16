The conditional reduction is valid. **I found no BLOCKER: no false admitted statement, hidden admitted definition, or missing hypothesis in `Host.Good` that I could establish.** The architecture looks mathematically viable. The main problems are an inaccurate description of the final witness and interfaces that package too much unfinished work into two existential lemmas.

I read the public files first, then the design and every `FreeField/` file. I re-elaborated all ten Lean files without producing build artifacts and inspected the declarations’ axiom dependencies. No file was modified.

1. **MAJOR — The final witness is not the phase-independent hierarchy described in the design.** [Main.lean:117](FreeField/Main.lean:117), [DESIGN.md:26](FreeField/DESIGN.md:26), [DESIGN.md:30](FreeField/DESIGN.md:30), [Adequacy.lean:113](Adequacy.lean:113).

   `FreeField.hier` is an intermediate hierarchy, call it \(T_0\). `jointExistence_body_constant_insertions` replaces it by `Adequacy.hier C₀ T₀`. Writing
   \[
   S(a,x)=T_0.\mathrm{correlation}(\mathrm{some}\ T_0.\mathrm{selected},a,x),
   \qquad
   M(a)=\prod_i {\bf1}_{a_i=\langle0,0\rangle},
   \]
   the **final** correlations are
   \[
   \mathrm{correlation}(\mathrm{none})=M,\qquad
   \mathrm{correlation}(\mathrm{plus})=S,\qquad
   \mathrm{correlation}(\mathrm{minus})=2M-S.
   \]
   Its channels are `FreeField.Channel d ⊕ Unit`, with an additional zero actor in every grade. The extra grade-zero coefficient is `Adequacy.hcoef`; the other added coefficients vanish.

   This is permitted by the public specification. Only the selected phase is linked to the Wightman theory by `root` and `boundary`. Neither positivity nor label-linearity is required of the other phase or the mixture. For example, a single grade-zero zero tag has final selected correlation \(0\), minus correlation \(2\), and mixed correlation \(1\). For two trace insertions, the mixed correlation is zero and the minus correlation is the negative of the selected correlation.

   Thus the phase space is irrelevant to the **seed**, but essential to the **final constant-insertion construction**. The final lattice trace insertion is zero; its selected continuum trace correlation is nonzero. Full support of the phase measure does not close this gap. This is a genuine weakness of the public specification, already exploited by the proved `Adequacy` construction, rather than an unsound inference in `Main.lean`. The design should state it explicitly.

2. **MAJOR — The two large existential lemmas need intermediate interfaces before implementation is divided among workers.** [Theory.lean:40](FreeField/Theory.lean:40), [OPE.lean:38](FreeField/OPE.lean:38), [DESIGN.md:165](FreeField/DESIGN.md:165).

   There is presently **no definition of the Fock host, its measure, its word vectors, its adjoint, or its Poincaré label action**. Those occur in comments; `exists_fockHost` asserts their combined outcome. Likewise, there is no definition of the proposed partial-matching coefficient family; `exists_ope_coefficient` asserts existence.

   This is an honest skeleton, not a hidden placeholder definition. The existential types are sufficient for the final reduction. Nevertheless, the claim that the tasks have no dependencies is useful only at the level of their current theorem statements. Their proofs share substantial prerequisites: matching integrability with seminorm bounds, derivative identities, Euclidean continuation, and uniform kernel estimates. Separate workers cannot reliably implement these aggregate statements without agreeing on those interfaces first.

   I recommend retaining the final statements as assembly theorems and splitting their implementation obligations as described below.

3. **MINOR — Several design claims exceed what the definitions or argument establish.** [DESIGN.md:26](FreeField/DESIGN.md:26), [DESIGN.md:36](FreeField/DESIGN.md:36), [DESIGN.md:117](FreeField/DESIGN.md:117), [Theory.lean:19](FreeField/Theory.lean:19).

   The following should be corrected or qualified:

   - Correlations are not constrained *only* on `separated`: the OPE and `hH` contain evaluations without an explicit separatedness hypothesis. The present convention survives those obligations, for the reasons below.
   - “The correlation is forced to be the Schwinger function” applies at most to the selected correlation. The final unselected and minus correlations provide explicit counterexamples to the unrestricted claim.
   - The argument that no cheaper field content or grading can work is not a minimality theorem. In particular, reconstructing uniqueness from the unusually weak continuation interface requires care: `boundary` is spatially smeared, not a boundary-value assertion for every fixed spatial tuple.
   - Non-local-integrability of a covariance function alone does not exclude a Gaussian random **distribution**. It is insufficient grounds for dismissing every Euclidean Gaussian approach.
   - Ordinary Mathlib `lp` has the unweighted square-sum norm. The proposed \(1/k!\) normalization must be implemented, for example by dividing the component vectors by \(\sqrt{k!}\). No present definition fixes this choice.

   None of these observations supplies a counterexample to one of the ten admitted statements.

4. **OK-CONFIRMED — The final theorem is literally the public target, and the unfinished dependency boundary is exactly the advertised ten lemmas.** [Main.lean:112](FreeField/Main.lean:112).

   Lean reports:
   ```text
   YangMills.jointExistence_of_freeField : YangMills.JointExistence
   ```
   Its axiom dependencies are:
   ```text
   [propext, sorryAx, Classical.choice, Quot.sound]
   ```
   All ten source files re-elaborate successfully, with exactly ten expected `sorry` warnings.

   The complete inventory of declarations whose bodies directly contain `sorry` is:

   | Declaration, within `YangMills.FreeField` | Location |
   |---|---|
   | `Host.reconstruct` | [Reconstruction.lean:91](FreeField/Reconstruction.lean:91) |
   | `exists_fockHost` | [Theory.lean:40](FreeField/Theory.lean:40) |
   | `corrL_perm` | [Continuation.lean:31](FreeField/Continuation.lean:31) |
   | `corrL_contDiffOn` | [Continuation.lean:43](FreeField/Continuation.lean:43) |
   | `contL_differentiableOn` | [Continuation.lean:55](FreeField/Continuation.lean:55) |
   | `contL_root` | [Continuation.lean:69](FreeField/Continuation.lean:69) |
   | `contL_boundary` | [Continuation.lean:83](FreeField/Continuation.lean:83) |
   | `exists_ope_coefficient` | [OPE.lean:38](FreeField/OPE.lean:38) |
   | `Sr_asymptotic` | [Trace.lean:28](FreeField/Trace.lean:28) |
   | `wickProfile_excluded` | [Trace.lean:44](FreeField/Trace.lean:44) |

   The additional `FreeField` theorems transitively depending on them are `exists_wightmanTheory`, `hier_reconstructed`, `hier_shortDistance`, and `hier_traceTest`, followed by the final theorem outside the namespace.

   **No data definition transitively depends on `sorryAx`. There are no custom `axiom` or explicit `opaque` declarations.** No data is extracted by `Classical.choice` from an admitted existence statement: `Main` eliminates the existential theorems within a proof. The `.some` at [Trace.lean:79](FreeField/Trace.lean:79) selects a `Unique` instance from a proved cardinality-one fact. `Fintype.ofFinite` likewise uses proved finiteness. These are legitimate uses of choice.

5. **OK-CONFIRMED — The seed hierarchy’s data have the advertised meanings.** [Labels.lean:43](FreeField/Labels.lean:43), [Hierarchy.lean:31](FreeField/Hierarchy.lean:31).

   The instantiation is:

   | Data | Actual seed definition |
   |---|---|
   | Labels | `Mon →₀ ℂ`, with `Mon := Multiset (Fin 4 → ℕ)` |
   | Grade | Sum of \(4+|\alpha|\) over the monomial’s legs |
   | `Field d` | Functions `GradeLE d → ℂ`, with finite-dimensional coordinate-space instances |
   | `Tag` | `Σ d, Field d` |
   | `toLabel` | Finite-support inclusion of the filtration stage |
   | `Channel j` | Monomials of exact grade `j` |
   | `actor` | The corresponding basis vector |
   | `coefficient` | The supplied `coef : Coef` |
   | `correlation` | Phase-independent `corrL` applied to tag labels |
   | `continuation` | `contL` applied to tag labels |
   | `H`, `theory` | Parameters supplied by `exists_wightmanTheory` |
   | `project` | Identity on tags |
   | `Character` | The two-element `Adequacy.Phase` |
   | Measure | Half a Dirac mass at each phase |
   | `selected` | `plus` |
   | `centeredTrace` | `lam • theta`, where `theta` represents the undifferentiated scalar |

   `Field d` is a filtration, not a homogeneous component. That is allowed: the public specification requires injectivity separately at each grade and joint coverage, not independence of the images across grades.

   The seed Wilson family’s zero insertion and zero beta, from `haarFamily`, are merely inputs supplying Haar measure and types. `Main` does not incorrectly assert that this seed family satisfies the requested running coupling or convergence.

6. **OK-CONFIRMED — The default-value and coincidence conventions do not make a public obligation fail.** [Wick.lean:62](FreeField/Wick.lean:62), [TwoPoint.lean:22](FreeField/TwoPoint.lean:22), [ChallengeSpec.lean:65](ChallengeSpec.lean:65).

   The relevant conventions are:

   | Convention | Effect and audit result |
   |---|---|
   | `weight = 0` outside the forward cone | Intended spectral support. Inside the cone, \(p^2\ge0\), so the logarithmic denominator is at least \(1\); no accidental division-by-zero branch. |
   | `corrL = 0` off `separated` | Allowed by permutation, smoothness, phase continuity, and mixture, which explicitly restrict to separated configurations. |
   | Mathlib integrals return zero when nonintegrable | Relevant to `Sr`, `lineC`, `fourierE`, and `wightmanMono`. Their intended uses still require honest integrability proofs. This has not been replaced by a proof that a divergent integral is useful. |
   | `Sr` at nonpositive arguments | Its zero-by-nonintegrability values do not enter the positive-distance trace limit or separated two-point evaluations. |
   | `lineC` outside the upper half-plane | Its totalized values are not used by `analytic`, ordered `root`, or the positive-\(r\) boundary approach. An exact real-time value of this integral must not be confused with its distributional boundary value. |
   | `fderiv` at nondifferentiable points | The totalized derivative at the singular origin is irrelevant when line arguments are nonzero. Smoothness away from the origin remains a genuine obligation. |
   | Later endpoint contributes `1` in `wickSum` | Counts each undirected matching line exactly once; it does not omit a contraction. |
   | Zero label has empty support | Correctly kills the multilinear extension. Empty *families*, by contrast, have the empty-product normalization, not zero. |

   The less immediate cases also work:

   **Root.** Strict monotonicity of the times implies injectivity of the full point configuration. Thus `root` never requests agreement with an artificially zero coincident correlation.

   **OPE.** For \(r>0\), `Within r M η` with \(\eta>0\) separates distinct insertion slots. `Clear o y c` separates spectators and gives \(\|o-y_j\|\ge c\). Eventually \(Mr<c/2\), so
   \[
   \|x_i-y_j\|\ge c-Mr>c/2.
   \]
   Therefore both the original grouped configuration and each one-actor-plus-spectators configuration are separated. Empty insertion or spectator families cause no exception. The many legs of a Wick monomial are internal combinatorial objects, not additional coincident hierarchy slots.

   **Trace.** `timePair r` is separated for \(r>0\), as explicitly proved inside `traceTwo_eq`. The convention at \(r=0\) cannot affect either germ in `TraceTest`.

   **`hH`.** This really quantifies over all configurations. `hier_vanishes` handles separated configurations through zero-label multilinearity and the remaining configurations through the zero convention. This is valid, not vacuous. Incidentally, zeroing all coincident correlations is sufficient but not logically necessary for `hH`; a zero-label-preserving extension would also suffice.

7. **OK-CONFIRMED — `Host.Good` appears sufficient and satisfiable; its strongest obligations have plausible concrete suppliers.** [Reconstruction.lean:39](FreeField/Reconstruction.lean:39).

   I checked its fields against W0–W3.

   Let \(D=\operatorname{span}\{\Psi(w)\}\) and \(H=\overline D\). If a finite linear combination of word vectors vanishes, the adjoint identity makes its prepended image orthogonal to every word vector. That image itself lies in \(D\), hence vanishes. This establishes the missing well-definedness needed to descend prepend operations to \(D\). Head-linearity then gives the two required complex-linear maps.

   The remaining transfers are legitimate:

   - Wordwise continuity extends to each state’s finite linear combination; no continuity in the state variable is required.
   - Wordwise adjointness and locality extend linearly.
   - Covariance gives domain invariance; the empty word gives vacuum invariance.
   - Translation invariance of the closed span, including inverse translations, makes it reducing.
   - The characteristic-function/polarization argument in the comments can establish that measurable spectral projections preserve this closed span. The host supplies finite diagonal measures, so characteristic-function uniqueness is applicable.
   - Uniqueness and positive energy then restrict to \(H\).
   - A nonzero prepended word vector witnesses a nonzero field operator.

   No involutivity hypothesis on `adj` is missing for the public adjoint clause. Nor does the public interface require continuity of the label action or continuity of fields in their state argument.

   `Good.unique` is stronger than uniqueness just on the reconstructed subspace, but it is compatible with the proposed unsymmetrized host: every positive-particle sector has strictly positive total energy almost everywhere, and the zero-particle sector is one-dimensional. No mass gap is needed.

   This route avoids proving density of polynomial vectors in the whole symmetric Fock space. That is a real saving. It still requires substantial Fock combinatorics to establish the word-vector identities; positivity has been represented geometrically, not obtained without work.

8. **OK-CONFIRMED — Group dependence, trace normalization, centering, and exclusion are correctly assembled.** [Main.lean:58](FreeField/Main.lean:58), [Trace.lean:105](FreeField/Trace.lean:105), [GroupIndependence.lean:225](GroupIndependence.lean:225).

   The normalization is exactly
   \[
   \lambda_G=\sqrt{\frac{3\dim\mathfrak g/\pi^4}{384\pi}},
   \qquad
   \lambda_G^2=\frac{\dim\mathfrak g}{128\pi^5}.
   \]
   `traceScale_sq` proves the cancellation needed by the limit. `traceTwo_eq` proves, for positive \(r\),
   \[
   \operatorname{traceTwo}(r)=\lambda_G^2\,S_r(r).
   \]
   The proposed spectral calculation has the stated constant:
   \[
   \frac14\,4\pi\int_0^\infty e^{-E}
      \left(\int_0^E(E^2-k^2)^2k^2\,dk\right)dE
   =\frac14\,4\pi\,\frac8{105}\,7!
   =384\pi.
   \]
   Thus `hier_shortDistance` targets precisely \(3\dim\mathfrak g/\pi^4\), with no missing Fourier normalization.

   The proof of positive dimension uses the nonzero commutator in `g.IsSimple`: zero finrank would make the Lie algebra bottom, forcing that commutator to vanish. The ideal condition is unnecessary here.

   Centering follows from the one-leg, one-vertex matching set being empty. `excludes` is correctly obtained from the generic `wickProfile_excluded` lemma and positive amplitude. That lemma remains substantive: the public `Mode.numerator` is continuous and homogeneous, not necessarily polynomial. Homogeneity nevertheless reduces its angular contribution to a constant, leaving the relevant radial asymptotics. I found no counterexample arising from this generality.

   The continuum theory and coefficient family can be chosen once, independently of \(G\). Their existence statements contain no group parameter. The lattice Haar measure still depends on the group; “only the scalar depends on the group” is accurate for the continuum field construction, not for all Wilson-family data.

The clause-to-lemma mapping is as follows. “Conditional” means that the assembly is checked, while one of the ten listed lemmas remains admitted.

| Public clause or reduction hypothesis | Supplier | Audit |
|---|---|---|
| `Reconstructed.axioms` | `exists_fockHost` → `Host.reconstruct` → `exists_wightmanTheory` | Conditional; all W0–W3 obligations have host suppliers |
| `faithful` | Nonzero-word condition in `exists_fockHost`, faithfulness conclusion of `Host.reconstruct` | Conditional; correctly applied |
| `injective d` | `toLabel_injective` | Proved; no admitted dependency |
| `acts` | Faithfulness applied to `toLabel 4 theta`, using `theta_label_ne_zero` | Valid; does not rely on a possibly zero trace scale |
| `covers` | `toLabel_covers` | Proved using the maximum grade of finite support |
| `represents` | `project = id` | Genuine surjectivity |
| `normalized` | `Adequacy.Phase` probability instance | Proved |
| `fullSupport` | `Phase.measure_isOpenPos` | Both points have positive mass |
| `permutation` | `corrL_perm` | Conditional; correct specialization |
| `smooth` | `corrL_contDiffOn` | Conditional; only separated configurations required |
| `characterContinuity` | Seed: `continuous_const`; final: discrete topology | Both valid |
| `mixture` | Seed: integration of a constant; final: \((S+(2M-S))/2=M\) | Both valid, with different meanings |
| `analytic` | `contL_differentiableOn` | Conditional; ordered differences have positive imaginary part |
| `root` | `contL_root` | Conditional; time ordering guarantees separation |
| `boundary` | `contL_boundary`, followed by the vacuum-expectation identity | Conditional; target rewritten correctly |
| `OPE.coefficients` | `exists_ope_coefficient`; final extra channel handled by `Adequacy.hier_ope` | Conditional for seed; transfer proved |
| `OPE.remainder` | Same | Conditional for seed; final transfer uses `hH` |
| `TraceTest.centered` | Vacuum-expectation identity and `wightmanL_single_leg` | Correct one-point reduction |
| `amplitudePositive` | `finrank_pos_of_isSimple`, positivity of \(\pi\) | Proved |
| `shortDistance` | `Sr_asymptotic`, `traceTwo_eq`, `traceScale_sq` | Conditional; exact required constant |
| `excludes` | `wickProfile_excluded` and `hier_shortDistance` | Conditional; all hypotheses supplied |
| Adequacy’s `C₀`, `T₀` | `haarFamily g Tag`, `FreeField.hier ...` | Correct dependent types |
| Adequacy’s `hR` | `hier_reconstructed` | All fields supplied |
| Adequacy’s `hO` | `hope g H th _` | Correct instantiation of the universal conclusion |
| Adequacy’s `hT` | `hier_traceTest ... hpos hvev` | Correct |
| Adequacy’s `hH` | `hier_vanishes` | Proved for every configuration |
| Final Wilson regularity and convergence | Existing `Adequacy` construction | Not asserted for the seed family |
| Refinement quantifier | Existing theorem chooses `q = id` | Correctly satisfies the literal target |

My recommendations are to keep the overall route and make the following changes before substantial implementation.

First, expose the shared mathematical interfaces. For the host construction, separate the actual measure and Hilbert-space definitions, word-vector membership and estimates, the cut identity, symmetry actions, spectral data, locality, and faithfulness. Fix the factorial normalization and open-leg factors before proving identities. The cut identity should be a named theorem for arbitrary words, not an explanation embedded in the proof of existence.

For OPE, define the coefficient family first. Then prove a generic theorem about Wick correlations from a smooth symmetric line kernel with derivative identities, short-distance bounds, and bounds away from zero. Group, Hilbert space, theory, and trace scale should enter only the final wrapper. The current theorem’s universal quantification over them is valid, but obscures that the proof is entirely about explicit scalar functions and finite combinatorics.

Second, exploit the actual strength of the public bounds. Exact leading coefficients, optimal scaling degrees, and convergence of an infinite OPE are unnecessary. Finite-order Taylor estimates with constants suffice, because \(r^{-\varepsilon}\) absorbs fixed constants. What does remain essential is uniformity in the unrestricted origin and spectator positions. The proposed translation-invariant kernel bounds supply that; estimates merely on a compact set of configurations would not.

Third, do not assume that a much smaller field family will solve the same problem. I found no verified substantial shortcut eliminating the Wick algebra. Setting coefficients to zero fails once \(D\) makes the required remainder tend to zero. Raising input grades only delays this obstruction. Raising channel grades can make the coefficient estimate stronger and can postpone a needed actor beyond a truncation where the remainder already has to decay. The current filtration avoids those problems.

There are modest analytic simplifications available:

- **Keep the existing spectral density but avoid evaluating its asymptotic constant.** Define
  \[
  B=\frac14\int_{\text{cone}}e^{-p_t}(p^2)^2\,dp.
  \]
  Prove \(0<B<\infty\) and the limit with constant \(B\), then use \(\lambda_G=\sqrt{(3\dim\mathfrak g/\pi^4)/B}\). The public constant is still exact. This removes the angular/Gamma evaluation, although it requires changing the present trace-lemma interface.
- **A positive spectral mixture can give a closed-form radial kernel.** For \(0\le t\le1\), let
  \[
  C(t)=\int_{\text{cone}}e^{-p_t}(p^2)^{2-t}\,dp,\qquad
  w_*(s)=\int_0^1\frac{4t}{C(t)}s^{2-t}\,dt,
  \]
  and use density \(w_*(p^2)\) on the cone. Scaling gives
  \[
  S_*(r)=4r^{-8}\int_0^1t\,r^{2t}\,dt
  =\frac{1-r^2(1+2L)}{r^8L^2},
  \qquad L=\log(1/r),
  \]
  with the removable value \(S_*(1)=2\). Its required scaled limit is \(1\). The density is positive on the open cone and polynomially bounded; the same field labels, host strategy, continuation strategy, and OPE architecture apply. The spectral-mixture framework is standard; this normalization and calculation are my proposed alternative. See [Dütsch–Rehren on generalized free fields and power-law spectral weights](https://arxiv.org/pdf/math-ph/0209035).

The second alternative simplifies the trace formula but introduces parameter-integral work. I would not claim it makes the whole formalization substantially cheaper: the host and OPE remain the dominant costs.

My effort estimates, including supporting lemmas but avoiding double-counting the shared integrability work, are:

| Admitted lemma | Estimated new Lean lines |
|---|---:|
| `Host.reconstruct` | 1,200–2,200 |
| `exists_fockHost` | 9,000–16,000 |
| `corrL_perm` | 400–800 |
| `corrL_contDiffOn` | 600–1,000 |
| `contL_differentiableOn` | 400–800 |
| `contL_root` | 1,000–2,000 |
| `contL_boundary` | 800–1,600 |
| `exists_ope_coefficient` | 5,000–9,000 |
| `Sr_asymptotic` | 600–1,000 |
| `wickProfile_excluded` | 1,000–2,000 |
| **Total** | **Approximately 20,000–36,000** |

These are planning estimates, not lower bounds. Proven reusable infrastructure could reduce them. The design’s 16,000–24,000 estimate is possible but optimistic.

The three largest risks are:

1. **Word-vector normalization and the cut identity:** dependent leg types, permutation multiplicities, \(L^2\) membership, and seminorm estimates must agree exactly.
2. **The analytic bridge:** Euclidean invariance, differentiation, smeared boundary limits, and locality must share compatible conventions and sufficiently strong integrability statements.
3. **Uniform OPE remainder estimates:** all finite insertion and spectator families, every truncation order, unrestricted translations, and spectators arbitrarily far away must be handled by one coefficient family.

I did not prove any of the ten admitted lemmas, fully formalize the analytic estimates, or certify every sign and orientation convention beyond the checks relevant to this reduction. I did not audit the claimed upstream reusable files, independently re-prove the existing lattice/Riemann-sum development, or establish a minimality theorem excluding pathological cheaper witnesses allowed by the public continuation interface. The compilation checks used the installed Mathlib and existing imported artifacts; they were not a clean rebuild of the dependency tree.
