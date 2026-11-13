# G01 proposed patches

Author draft, session `schmittj-claude-g01-20261112`, issue #58. Not reviewed. These are proposals for the owners of the files concerned; G01 edited none of them. `manuscript/existence/statement.tex` and `assembly.tex` belong to C16; `blueprint/interfaces/continuum-reconstruction.md` belongs to issue #11 (PR #18); `source/build.md` belongs to issues #2 and #37. Line numbers refer to `statement.tex` with SHA-256 `43ca06106e2190e81f617d3fc7f668df06909d9a747309eff5e7045ba92f5378`. Ledger references are to `statement-ledger.md`.

Summary: no sentence of `statement.tex` was found to be wrong, and none claims a mathematical conclusion beyond `YangMills.JointExistence`, with one technical exception by presupposition (P4). Revised after an author-side cross-check (see `validation.md`): P4, P6, P7 and P9.1 were corrected. Patches P1–P3 and P5–P7 replace imprecise wording by the exact content of the Lean clauses or add limitations a reader needs. None is required to remove a false statement.

## P1. Define "regular" (lines 35–43, 113)

Justification: line 113 uses "one regular Wilson family" but the word is not defined; the Lean predicate is `YangMills.WilsonRegularity` (`Lean/ChallengeSpec.lean` 12–22) with exactly four fields. Ledger A1, A3.

Proposed replacement for lines 35–37 ("Each insertion is continuous in \(U\). … The running condition is"), together with P3:

```latex
We call the family \emph{regular} if the following four conditions hold.
Each insertion \(U\mapsto O_{N,p,v}(x;U)\) is continuous. Each insertion is
invariant under every lattice gauge transformation
\(U_i(y)\mapsto g(y)U_i(y)g(y+e_i)^{-1}\), \(g:\Lambda_{N,p}\to G\).
For each token \(v\) there is a finite set \(\Sigma_v\subset\mathbb Z^4\),
independent of \(N\), \(p\) and \(x\), such that \(O_{N,p,v}(x;U)\) depends
only on those links of \(U\) both of whose endpoints lie in \(x+\Sigma_v\),
reduced modulo \(P_pD_N\). Finally, the coefficients satisfy the running
condition
```

## P2. Hypotheses on the group (lines 16–24)

Justification: `YangMills.GaugeGroup` and `YangMills.GaugeGroup.IsSimple` (`Lean/PublicTheory.lean` 25–45). The invariant subspaces are subspaces of \(\mathfrak g\) (`ideal ≤ gauge.lieAlgebra`); connectedness and irreducibility are not assumed; the action is normalised by the dimension of the given representation (`YangMills.wilsonEnergy`, `Lean/PublicWilson.lean` 25–27). Ledger A2, C7.

Proposed replacement for lines 22–24 ("We assume that … are \(0\) and \(\mathfrak g\).") :

```latex
We assume that \(\mathfrak g\) is nonabelian and simple: some two elements of
\(\mathfrak g\) do not commute, and the only real subspaces of \(\mathfrak g\)
invariant under every \(\operatorname{ad}X\), \(X\in\mathfrak g\), are \(0\)
and \(\mathfrak g\). The group \(G\) is compact, being closed in \(U(r_G)\).
It is not assumed to be connected, and the given representation is not
assumed to be irreducible; the Wilson action of Section~\ref{ex-lattice} is
normalized by the dimension \(r_G\) of this representation, so the same
abstract group in two representations gives two instances of the problem.
```

## P3. Locality of insertions (lines 35–37)

Included in the text of P1. Justification: `WilsonRegularity.localSupport` (`Lean/ChallengeSpec.lean` 19–22) is the specific statement that two configurations agreeing on all links with both endpoints in the translated stencil give the same value; "controls the insertion" does not say this. Ledger A3.

## P4. Boundary values (lines 107–110)

Justification: `Hierarchy.Reconstructed.boundary` (`Lean/ChallengeSpec.lean` 139–143) with `complexShift`, `spatialPoints`, `tensorTest` (99–115) and `FieldSystem.vacuumExpectation` (`Lean/PublicTheory.lean` 115–124). The Lean clause fixes the order of the operators and uses product tests; it is a statement about Bochner integrals and contains no integrability clause, while the internal source has one (`YM.Boundary.Waves.Opens.int`, `Lean/YM/Boundary/Contour.lean` 90–94). The English "its integrals … converge" presupposes integrability. Ledger A7, C6.

Proposed replacement for lines 107–110:

```latex
For every strictly increasing \(\boldsymbol h\in\mathbb R^n\) and all
\(f_1,\ldots,f_n\in\mathcal S(\mathbb R^4)\),
\[
 \lim_{\epsilon\downarrow0}\int_{(\mathbb R^4)^n}
 F_{\boldsymbol A}\bigl((t_j+i\epsilon h_j)_j;(\boldsymbol x_j)_j\bigr)
 \prod_{j=1}^nf_j(\boldsymbol x_j,t_j)\,d\boldsymbol x\,d\boldsymbol t
 =\bigl\langle\Omega,\Phi(A_1,f_1)\Phi(A_2,f_2)\cdots\Phi(A_n,f_n)\Omega
   \bigr\rangle .
\]
```

The display fixes the operator order, the product form of the test and the sign of the imaginary shift, all as in the Lean clause. On integrability there are two faithful options, and the owner should choose one explicitly. (i) Describe the public predicate exactly: add "Here the integral is understood with the convention that it is zero when the integrand is not integrable; the target contains no separate integrability requirement." (ii) Keep ordinary integrals and attribute their existence to the construction: add "For the theory constructed below the integrands are absolutely integrable", which is a property of the constructed witness (`YM.Boundary.Waves.Opens.int`), stronger than the target, and should be said only where the manuscript proves it (I did not audit that proof). Integrability must not be presented as a clause of the public target: `Reconstructed` has no such field.

## P5. The words "character" and "phases" (lines 63–65, 74–77)

Justification: `Hierarchy.Character : Type` is a bare compact metric space; for non-selected points the public statement asserts only smoothness, symmetry, continuity, the mixture identity and the common OPE estimates. Ledger A6, C2.

Proposed addition after line 77:

```latex
At this level of the statement the points of \(X\) carry no further
structure, and only the selected point \(\chi_*\) is required to have a
reconstructed relativistic theory. For \(\chi\ne\chi_*\) the target asks for
the regularity, symmetry, continuity and mixture properties just listed and
for the common operator-product estimates of Section~\ref{ex-assembly},
nothing more. In the construction \(X\) is a space of characters of a
commutative algebra and every point has a reconstruction; that is a property
of the detailed theorem, not of the target.
```

The final sentence relies on the #11 interface note and `Lean/Construction.lean` 27 (`∀ i, (view (L.actors i)).Axioms`); G01 did not inspect the definition of `F.α.space.X`.

## P6. Scope paragraph (lines 132–137)

Justification: ledger A8, A10, C1, C3, C4. The paragraph is correct; the proposal states the limits explicitly so that the names "trace test" and "non-freeness" cannot be over-read. `Hierarchy.TraceTest` (`Lean/ChallengeSpec.lean` 168–175); `Hierarchy.centeredTrace : Field 4` (48); `WightmanTheory.W0` (`Lean/PublicTheory.lean` 270–278); `WilsonRegularity.running` (`Lean/ChallengeSpec.lean` 13–14).

Proposed replacement for lines 132–137:

```latex
The full endpoint also specifies a common operator-product expansion and a
short-distance test on one centered field of grade four, described in
Section~\ref{ex-assembly}. These are additional obligations on the same
hierarchy. The scope of the target should be read literally. The spectral
conclusions are that the energy-momentum spectrum lies in the closed forward
cone and that the translation-invariant vectors form the line
\(\mathbb C\Omega\); no gap above the vacuum in the spectrum is asserted. The short-distance test prescribes the leading behaviour
\(r^{-8}\log^{-2}(r^{-1})\) of one two-point function on the time axis and,
as a consequence, excludes its coincidence near \(r=0\) with any finite
combination of the mass-shell profiles of Section~\ref{sec:trace-profiles};
it does not exclude infinite or continuous superpositions of masses and makes
no assertion about truncated correlations of higher order. The target
requires a positive limit of \(\beta_{N,p}/\log(a_N^{-1})\) but does not
prescribe its value. The grade-four field is existentially chosen, subject
to the stated test (vanishing vacuum one-point functional, the exact
asymptotic coefficient, and the profile exclusion); the target contains no
stress-tensor or Ward-identity normalization identifying it physically, and
that identification belongs to the detailed construction. More generally the
target concerns a theory of the constructed gauge-invariant observables: the
insertions \(O_{N,p,v}\) are part of what is constructed, no lattice formula
is prescribed for them beyond regularity and the joint convergence
requirements, and the lattice measure enters the target only through the
mixed correlations. Identifying a particular label with a separately
prescribed physical observable requires its own construction argument.
```

## P7. Forward reference for the detailed theorem (optional, after line 130)

Justification: `YangMills.constructed` (`Lean/Construction.lean` 15–31) and `YangMills.jointExistence` (`Lean/Solution.lean` 4–10); ledger A11. `statement.tex` does not say that the target is obtained from a family statement indexed by a penalty \(b>0\) at \(b=1\); `assembly.tex` does. A one-sentence pointer records this. No claim is made that the public families obtained for different \(b\) differ, or that no canonical choice exists; neither was examined.

```latex
The detailed construction is parameterized by a positive blocking penalty;
the target is obtained from the value \(1\) in the conditional assembly of
Proposition~\ref{ex-conditional-existence}. No uniqueness assertion is made.
```

## P8. `source/build.md`: manifest check (for #2/#37 owners)

Justification: `source-trust.md`, section "Source manifest". In a fresh clone at `5535cc1`, `sha256sum -c SOURCES.sha256` reports 9,497 files OK and 10 absent; the absent ones are the ten `verification/*.log` files listed in the manifest, which are not tracked in the Git import. The sentence "All 9,507 listed files reported `OK`" is therefore not reproducible from the repository.

Proposed replacement for that sentence in `source/build.md`:

```markdown
On the extracted upstream distribution all 9,507 listed files reported `OK`. In a clone of this repository the ten `verification/*.log` files named in the manifest are absent, because they are not tracked in the Git import; the remaining 9,497 files, including every `.lean` file, report `OK`. This checks the imported files against the distribution's manifest; it does not independently authenticate the manifest or establish a Lean proof.
```

G01 did not itself run the full manifest check; the counts are the #37 observation relayed in the task. G01 verified only the fourteen files listed in `validation.md`.

## P9. Additions for the #11 interface note (for its owner)

The reviewer of PR #18 requested four additions (see `README.md`, section "Issue #11"). From the statement audit:

1. Requested addition 4 (two different orders) is confirmed at statement level and can be worded as follows: "In `YangMills.constructed`, `Properties` and `Ordered` are stated on the order with full mesh and period component `(p.refine q).per`, while `F : Final C (p.refine q) S` is indexed by the refined order, whose mesh component is `p.mesh ∘ q.mesh` (`Order.refine` composes both components, `Lean/YM/Extraction/Orders.lean` 40); in `jointExistence`, where `p.mesh` is the identity, this is `q.mesh`. `Properties` takes a period sequence only; its clause `wilson` is `WilsonFamily.Converges ((p.refine q).per) …`, which demands the full mesh limit at every suitable period; `YangMills.wilsonLimit` (`Lean/HierarchyBridge.lean` 44–56) obtains it from the full-mesh `Ordered` conjunct, not from `F.room.ordered`. The checkable PU-16 output for the public endpoint is therefore the full-mesh statement."
2. A further addition, not among the four: "The public `Hierarchy.Reconstructed.mixture` is a pointwise identity at separated Euclidean configurations. `YangMills.publicReconstruction` proves it from `EveryPhase.Completed.at_words` (`Lean/HierarchyBridge.lean` 105–112), not from `Headline.Reconstruction.average`, which is the identity for boundary distributions. The two should be listed as distinct outputs of PU-19."
3. A further addition: "`Hierarchy.Reconstructed.boundary` omits the integrability field `YM.Boundary.Waves.Opens.int`; a unit that proves the boundary limit should state integrability as part of its output even though the public bridge does not consume it."

G01 has no finding on requested additions 1–3 (the fields of `YM.Spec.Seed`, the unselected contour `allWorld`, and `Certificate.flux`): they concern internal structures that do not occur in the public statement.
