# G01 review: mathematics

Session `hairer-claude-g01-review-20261113`. Evidence labels: **(S)** read in source, **(I)** reviewer's inference, **(U)** unresolved. Hashes of everything read are in `validation.md`.

## M1. `adequacy.md` (b): identically vanishing insertions are excluded

Checked step by step against `Lean/PublicWilson.lean` and `Lean/ChallengeSpec.lean`. Correct.

- Arity zero: `smear` has one summand, `mesh^0 = 1`, and the moment is the total mass of `wilsonLaw`. That mass is one because the prior is a product of probability measures and the density \(e^{-\beta S}/Z\) has \(0<Z<\infty\): \(S\) is bounded on configurations, since \(|\operatorname{Re}\operatorname{tr}V|\le r_G\) for unitary \(V\) (I; also proved in Lean as `YangMills.Adequacy.wilsonLaw_probability`, see `lean.md`). `separated 0` is all of `Points 0`, and the integral over `Points 0` is evaluation at the single point (I). So \(S^{\mathrm{mix}}_\emptyset=1\).
- Arity one: `separated 1` is all of `Points 1`, so `smooth` makes \(S^{\mathrm{mix}}_A\) smooth on \(\mathbb R^4\). If all smeared one-point moments vanish, then \(\int tS^{\mathrm{mix}}_A=0\) for every test, hence \(S^{\mathrm{mix}}_A\equiv0\).
- The remainder clause with \(I=J=\emptyset\), \(D=0\) and \(\varepsilon=\tfrac12\) gives \(|1-0|\le r^{1/2}\) for small \(r\). This is a contradiction. `Within` and `Clear` are vacuous for empty families.

## M2. `adequacy.md` (c): the constant-insertion witness

I re-derived every step for both the main version (hypothesis (H2), a vector \(u\ne0\), two new channels) and the Variant (vanishing at the tag \((0,0)\), one new channel with actor \(0\)). The Variant is the one formalised. **No error found.** The points where a gap would be most likely:

1. **Order of choice.** The family is built from \(T_0\) alone, before any \(p\), and one hierarchy serves every strictly increasing \(p\), with \(q=\mathrm{id}\). This matches `JointExistence`, which quantifies \(\exists C\) before \(\forall p\) (S).
2. **`Converges` at every suitable period, not only on the sequence.** Rows are \(M_{\boldsymbol A}\int t\) for every \(P\). For suitable \(P\), every lattice point \(a\cdot\mathrm{valMinAbs}(y)\) at which \(t\ne0\) lies in the open cube. The map \(y\mapsto a\,\mathrm{valMinAbs}(y)\) is a bijection of \(\mathbb Z/\ell\) onto \(a\mathbb Z\cap(-(P+1)/2,(P+1)/2]\). So `smear` is exactly the Riemann sum of \(t\) over \(a\mathbb Z^{4n}\) times \(M_{\boldsymbol A}\), and it converges to \(M_{\boldsymbol A}\int t\) (I). Eventual suitability along \(p\) follows from \(p(k)\ge k\) and compact support.
3. **Coefficients independent of \(D\), of the state and of the spectators.** \(h_a\) depends only on \((a,x,o)\) (S, definition `hcoef`).
4. **The coefficient bound for the new channel.** The weight \(w(a)\ge0\) is a sum of natural numbers, so \(r^{-w-\varepsilon/2}\ge1\) for \(r\le1\). Then \(|h_a|\le(1+K)r^{-w-\varepsilon/2}\le r^{-w-\varepsilon}\) once \(r^{-\varepsilon/2}\ge1+K\). The threshold may depend on \((a,M,\eta,\varepsilon,j,i)\), as the clause allows.
5. **The remainder in the three states.** The expansion is linear in the correlation for fixed coefficients, so \(R^-=2R^{\mathrm{mix}}-R^+\). Here \(R^{\mathrm{mix}}=0\) exactly, because \(m\) vanishes on positive grades and the new channel restores the grade-zero identity. Also \(R^+\) equals the old remainder, because the new term is \(h_a\,S_{(0,0),b}=0\) by the vanishing hypothesis (Variant), or because the two new terms cancel by (H2) (main version). Grade zero occurs in the sum for every \(D\ge0\). The threshold is the one supplied by \(T_0\) for the state `some T₀.selected`, uniformly in positions.
6. **`Reconstructed` and `TraceTest`.** Every clause other than `represents`, `normalized`, `fullSupport`, `characterContinuity` and `mixture` mentions only `theory`, `toLabel`, `continuation`, `centeredTrace` and the selected correlation, all of which are unchanged. The five listed clauses hold for the two-point phase space with mass \(\tfrac12\) at each point. `mixture` is \(\tfrac12S+\tfrac12(2M-S)=M\).
7. **Arity zero and the empty cluster.** \(M_\emptyset=1\), and \(h_\emptyset=1-\sum_ic^{0,i}_\emptyset\,m(E_{0,i})\) repairs the identity used in (b). There is no conflict with (b).

**Hypotheses for the constructed witness.** (H1) is the projection of `(hierarchy F Q).Properties`. The vanishing hypothesis holds because `correlation s v x` is by definition `S.classMoment (spectator F s) (fun i => (v i).1) x (fun i => (v i).2)`, and `classMoment` returns a `MultilinearMap` (S, `Lean/HierarchyBridge.lean` 37, `Lean/YM/Euclid/Lift.lean` 58–59, 67). A multilinear map vanishes when one argument is zero. I agree with the author that this holds for every state, not only the selected one.

## M3. New finding: the public statement does not distinguish gauge groups (I)

This strengthens finding 1 of the G01 README. It is a paper argument by the reviewer. It has not been formalised and has not been reviewed.

**Claim.** Suppose the constructed witness exists for a single simple gauge group \(g_0\), in the sense that `YangMills.constructed g₀` holds. Then the body of `JointExistence` holds for **every** gauge group \(g\) with \(\dim_{\mathbb R}\mathfrak g>0\), in particular for every simple \(g\), with a family whose insertions are constant.

**Proof.**

1. Let \(T_0\) be the selected-multilinear hierarchy over a family \(C_0\) for \(g_0\) given by `constructed` (as in `AdequacyFull.lean`). It satisfies (H1) and the vanishing hypothesis. Its selected correlation is multilinear in the field components (M2).
2. *Rescale the trace field.* Let \(\lambda=\sqrt{\dim\mathfrak g/\dim\mathfrak g_0}>0\). Replace `centeredTrace` \(\Theta\) by \(\lambda\Theta\) and change nothing else. `centered` survives because `toLabel 4` and `field` are linear in the label. By multilinearity, `traceTwo` is multiplied by \(\lambda^2\), so `shortDistance` now holds with limit \(\lambda^2\cdot3\dim\mathfrak g_0/\pi^4=3\dim\mathfrak g/\pi^4\). `excludes` survives: if \(\lambda^2T=_{\text{ev}}\) `wickProfile terms`, then \(T=_{\text{ev}}\) `wickProfile` of the same list with every coefficient divided by \(\lambda^2\). `amplitudePositive` holds since \(\dim\mathfrak g>0\). `Reconstructed` and `OperatorProductExpansion` do not mention `centeredTrace` (S), so they are unchanged.
3. *Move to the group \(g\).* The fields of `Hierarchy C` refer to the family \(C\) only through the domain of `project`, and the clauses of `Reconstructed`, `OperatorProductExpansion` and `TraceTest` mention the group only through `Module.finrank ℝ g.lieAlgebra` (S, by reading every field in `Lean/ChallengeSpec.lean`). Take any family \(C_0'\) over \(g\) with `Token` the type of tags, using a Haar probability measure on the compact group `g.image`. Copy all data of the rescaled \(T_0\), with `project := id`. The copy satisfies (H1) for \(g\) and the vanishing hypothesis.
4. Apply `YangMills.constant_insertion_witness` to \((C_0',T_0')\). ∎

**Consequence.** Read as a specification, `JointExistence` is equivalent to its instance at any one simple group, provided the witness for that group can be chosen with multilinear selected correlations. A proof of it for \(SU(2)\) of this form yields it for \(SU(3)\), for \(E_8\), and for \(SU(2)\) in a reducible representation. The gauge group, its representation and the Wilson action enter the public statement only through the lattice clause, and (c) shows that clause can be met without reading the configuration. This is again a statement about the specification. It says nothing against `YangMills.constructed`, whose conclusion for each \(g\) concerns the specific lattice family of that \(g\).

**Recommendation.** Formalise this on top of `formal/Adequacy.lean`. It should take one short file: a rescaling lemma for `TraceTest` under multilinearity, a re-homing of a hierarchy to another family, and the corollary. Give the result to C16 together with finding 1 (see `README.md`, request Q1).

## M4. Open question: can a generalised free field supply \(T_0\)? (U)

M3 needs `constructed` for one group. A sharper question is whether any explicit theory satisfies (H1) and the vanishing hypothesis. If one does, `JointExistence` is provable with no Yang–Mills content at all. I have **not** established this. I record it because `adequacy.md` (d)(3) says the three non-lattice properties remain "as hard as before", and that sentence depends on the answer.

Facts in favour (I):

- `TraceTest.excludes` follows from `shortDistance` alone (M5). The ledger (A10) and `Lean/README.md` already note that the exclusion does not rule out continuous Källén–Lehmann superpositions.
- A scalar generalised free field \(\phi\) with Källén–Lehmann weight \(\rho(s)\sim c\,s^2/\log^2s\) as \(s\to\infty\), cut off near \(s=0\), is tempered. Its Euclidean two-point function is \(\int\rho(s)\sqrt s\,K_1(\sqrt s\,r)/(4\pi^2r)\,ds\). After the substitution \(s=u^2/r^2\) it behaves like \(c'r^{-8}\log^{-2}(1/r)\), and \(c'\) can be tuned to \(3\dim\mathfrak g/\pi^4\). With grade-four field \(\Theta=\phi\), `centered` holds.
- Grading the Wick monomials \(:\!\partial^{\alpha_1}\phi\cdots\partial^{\alpha_k}\phi\!:\) by \(4k+\sum|\alpha_i|\) gives finite-dimensional grades. The cluster expansion by Wick's theorem plus Taylor expansion of the external contractions has the power counting the OPE clauses require, with logarithms absorbed by \(\varepsilon\). Correlations are multilinear, so the vanishing hypothesis holds.

To be checked before anyone relies on this: existence of the Wick monomials as Wightman fields on a common domain (true for generalised free fields with tempered spectral measure, but it needs a reference); uniformity of the remainder in the spectator positions under `Clear`, including spectators far away; `covers`, `faithful` and the Poincaré action on the labels of derivative monomials; and the exact form of `W0.spectralRepresentation`. I suggest the coordinator open a bounded literature-and-proof task for this question. G06 should not treat (d)(3) as established until it is settled.

## M5. Statement ledger: spot checks

I re-read Part A against `PublicTheory.lean`, `PublicWilson.lean` and `ChallengeSpec.lean` and found no disagreement. Specific checks:

- **A1** (quantifier order), **A3** (`localSupport` concerns links with both endpoints in the stencil; gauge transformation convention), **A4** (normalisation by \(r_G\), each pair \(i<j\) counted once), **A5** (full mesh limit at every suitable period): agree (S).
- **A7**, inference that `root` determines the continuation on the tube: correct (I). The points \((it_j)\) with \(t\) strictly increasing form an open subset of \(i\mathbb R^n\) inside the convex tube, which is a totally real set of maximal dimension, so the identity theorem applies.
- **A7**, operator order: the first label is the outermost operator, and this is consistent with increasing imaginary parts under the spectral convention of `W0` (I).
- **A10**, `excludes` adds nothing to `shortDistance`: confirmed (S). `YangMills.publicTrace` (`Lean/TraceBridge.lean` 35–44) proves it through `Wick.euclidean_excludes`, whose hypotheses are `EuclideanAsymptotic F A` and `0 < A` only (`Lean/YM/TraceExtension/Wick/Refute.lean` 75–80).
- **A11**, `Order.refine` composes both components and `Order.full` is `(full, full)`: confirmed (S, `Lean/YM/Extraction/Orders.lean` 25, 40–42).
- **P9.2**, the public `mixture` is proved from `EveryPhase.Completed.at_words`: confirmed. In `YangMills.publicReconstruction` the bullet using `decomposition.weak` discharges `characterContinuity` and the next bullet, using `h.at_words`, discharges `mixture` (S, `Lean/HierarchyBridge.lean`).

## M6. `adequacy.md` (d) and (e)

(d)(1), (2) and (4) are correct. For (d)(3), see M4. Request Q2: replace "so the three non-lattice properties are as hard as before" by a statement of what is shown, for example: "the construction does not produce a selected theory; it reuses that of \(T_0\). Whether the three non-lattice properties can be met by an explicit theory (for instance a generalised free field) is open; see the G01 review, M4." Also add the group-independence of M3.

The items of (e) are framed as observations and need no change. Each of (e)(1)–(4) also blocks M3, since M3 uses construction (c) in its last step. None of them blocks the rescaling in M3 step 2, which only adjusts the trace amplitude.
