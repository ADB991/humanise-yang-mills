# Osterwalder–Schrader reconstruction: reference and hypothesis checklist

- Literature task: [issue #6](https://github.com/hairer/humanise-yang-mills/issues/6).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Status: original source formulas visually checked; author hypothesis comparison completed with the specific unmatched inputs below; **conditional match, not independently accepted**. A completed comparison is not a proved application to the complete project hierarchy.
- Contributor and agent assistance: TrishenGunaratnam; Codex research, source inspection and drafting, session `TrishenGunaratnam-codex-02`.
- Independent review: pending; reviewed commit and review link not yet assigned.
- Scope confirmation: [maintainer reply](https://github.com/hairer/humanise-yang-mills/issues/6#issuecomment-6799207940) to the scoped claim request. Requested expiry: 2026-11-11 18:00 UTC.
- Repository snapshot inspected: `ecc06d13de67e479666203061918e537316994e3`. `origin` is the contributor's fork; `upstream` is the canonical repository.
- Follow-up session: `TrishenGunaratnam-codex-02-followup`, [self-claim](https://github.com/hairer/humanise-yang-mills/issues/6#issuecomment-6802505032), until 2026-11-11 21:20 UTC. The original authoring claim was released before this follow-up.

This is an internal literature/source-match record, following the background-note
template. It does not create a proof unit or an authoritative manuscript section.
Under the current repository rules, later mathematical exposition and proofs belong
directly in manuscript LaTeX; this file records their citation gates and evidence.

## Result to be used

The intended application is reconstruction of relativistic fields from the
appropriate Euclidean correlations. It has three distinct interfaces:

1. **Coordinate OS construction:** `YM.Table.Hierarchy` supplies
   `YM.OS.realization`, whose output is a `YM.OS.Chamber`: a Hilbert-space Gram
   construction and compatible time/space evolution.
2. **Selected relativistic reconstruction:** the stronger data in
   `YM.Spec.Materializes` and its consumers lead to a contour and a field system
   satisfying `YM.Boundary.Wightman.Realizes`, including vacuum uniqueness.
3. **Every-character reconstruction and integration:** `YM.EveryPhase.Completed`
   quantifies over every character, with common labels and boundary mixture laws.

The first output must not be substituted for the second or third. A literature
citation for a scalar reconstructed theory does not alone identify the project's
chosen spaces, quotient labels, contours, or phasewise choices.

**Citation decision:** the corrected 1975 OS theorem is a relevant candidate,
not yet a checked plug-in replacement. In particular, fixed-arity `Capped`
estimates are not the theorem's uniform-in-arity growth assumption. Stronger
`Spread.AllCopy` estimates are present and are a serious candidate for the missing
comparison; they must not be ignored or assumed already converted to the paper's
Schwartz seminorms. No failure of the project's complete reconstruction theorem
is inferred from an unresolved literature match.

## Mathematical reference

The following are primary sources. Printed page numbers below are journal pages,
not a search engine's PDF page labels.

| Reference | Inspected statement and locator | Use and limit |
| --- | --- | --- |
| K. Osterwalder and R. Schrader, *Axioms for Euclidean Green's functions*, Communications in Mathematical Physics **31** (1973), 83–112, [DOI](https://doi.org/10.1007/BF01645738), [article text/PDF](https://projecteuclid.org/journals/communications-in-mathematical-physics/volume-31/issue-2/Axioms-for-Euclidean-Greens-functions/cmp/1103858969.pdf) | §2 pp. 85–87; §3 pp. 88–89; §6 pp. 102–104 | Defines the test spaces and E0–E4; describes spinor/multiplet conventions. The original sufficiency claim needs the 1975 correction. |
| K. Osterwalder and R. Schrader, *Axioms for Euclidean Green's functions II*, Communications in Mathematical Physics **42** (1975), 281–305, with an appendix by S. Summers, [DOI](https://doi.org/10.1007/BF01608978), [article text/PDF](https://projecteuclid.org/journals/communications-in-mathematical-physics/volume-42/issue-3/Axioms-for-Euclidean-Greens-functions-II-with-an-Appendix-by/cmp/1103899050.pdf) | §I p. 282; §II p. 284, (2.1); §IV.1 p. 287, (4.1)–(4.2) and named Theorem E′ (or E″) → R′ | Corrected sufficient reconstruction theorem: strengthened regularity plus E1–E4. Its norm and arity quantifiers are part of the hypothesis, not optional notation. |
| Yu. M. Zinoviev, *Equivalence of the Euclidean and Wightman Field Theories*, [arXiv:hep-th/9408009v1](https://arxiv.org/pdf/hep-th/9408009v1), 2 August 1994 | §4, E5 on pp. 21–22; Theorem 4.1 on p. 23 | Alternative using E0–E5, including an additional weak spectral condition formulated through inverse-Laplace limits. It is not a theorem from reflection positivity alone. No project match for E5 is certified here. |

OS II explicitly identifies the incorrect lemma in OS I and gives strengthened
sufficient conditions. Its linear-growth version controls distribution order
linearly in arity with factorially bounded constants. A separate revised
equivalence theorem appears in §III, p. 285, with a stronger distribution topology;
that is not ordinary fixed-arity temperedness. The paper's main text treats one
real scalar field; §I, Remark 5, p. 283 points to the multiplet extension.

For the main candidate, use **OS II §IV.1**, not the similarly named condition
E0′ in OS I §3, Remark 3. Their meanings differ. Record the exact norm convention
in OS II (2.1) and condition (4.1) when establishing the application. Holomorphic
continuation by itself does not settle tempered boundary values.

### Exact formulas checked against the original scan

The locators in this subsection were checked visually in the original journal
scans, not inferred from OCR. OS II uses the joint Schwartz seminorm

\[
 |f|_p=\sup_{x\in\mathbb R^m,\ |\alpha|\leq p}
       (1+\textstyle\sum_{j=1}^m x_j^2)^{p/2}|D^\alpha f(x)|
 \qquad\text{(§II, printed p. 284, (2.1)).}
\]

Its space \(\mathcal S_0(\mathbb R^{4n})\) has the induced Schwartz topology:
all derivatives of its elements vanish whenever any two four-dimensional
arguments coincide. Flatness on this set is stronger than just setting the
function value to zero there. This is not the space of all Schwartz tests and
is not the space of tests supported in one fixed separated compact set.

The exact corrected alternatives on printed p. 287 are:

| Source condition | Quantifiers and bound | Matching decision |
| --- | --- | --- |
| E0′, (4.1) | \(\mathfrak S_0=1\), \(\mathfrak S_n\in\mathcal S_0'(\mathbb R^{4n})\); there are one positive integer \(s\) and positive numbers \(\sigma_n\leq a(n!)^b\), with \(a,b\) independent of \(n\), such that \(|\mathfrak S_n(f)|\leq\sigma_n|f|_{ns}\) for every \(n\geq1\) and every flat-diagonal test \(f\). | A fixed component family must have one such arity-independent \(s,a,b\). Neither fixed-arity `Capped` nor fixed-word `Breathes` states this bound. `AllCopy` has suitable arity structure but is an operator bound, requiring a distribution comparison. |
| E0″, (4.2) | \(\mathfrak S_0=1\), \(\mathfrak S_n\in\mathcal S'(\mathbb R^{4n})\); one \(s\) and a factorially bounded \(\sigma_n\) satisfy \(|\mathfrak S_n(f_1\otimes\cdots\otimes f_n)|\leq\sigma_n\prod_i|f_i|_s\) for all \(f_i\in\mathcal S(\mathbb R^4)\). | This requires a distribution on the full Schwartz space and a product estimate. It is not obtained merely by checking separated products or by substituting a joint \(|f|_{ns}\) estimate. No such extension/product estimate is certified by this audit. |

The named theorem **E′ (or E″) → R′** immediately below these formulas gives
a uniquely determined Wightman theory from the chosen corrected regularity
condition and E1–E4. Part (b), (4.3), gives a positive integer \(w\) and bounds
\(|\mathfrak W_n(f)|\leq\omega_n|f|_{nw}\), where
\(0<\omega_n\leq a b^{n^2}\). The output constants are not asserted to have
factorial growth. This named theorem must not be confused with **Theorem 4.1
on printed p. 288**, an intermediate analyticity/estimate theorem.

The inherited hypotheses were checked in OS I §3, printed p. 88 (PDF page 6):
E1 is proper Euclidean covariance; E2 is positivity for all finite sequences
of ordered positive-time joint tests, using reflection and conjugate reversal;
E3 is permutation symmetry; E4 is the spatial-translation cluster limit for
two such finite sequences. OS I p. 89, Remark 2, also gives the covariant
compact-test cluster formulation (3.1). They are distributional requirements,
not assertions about one separated point or one field component.

For the **unselected** family, there is a documented weaker conclusion rather
than a need to assume unique vacuum: OS II p. 283, Remark 6, retains the
subset correspondences of OS I p. 89, Remark 3, with the corrected changes.
In particular, omitting E4 retains R0–R3 and R5, omitting the cluster axiom R4.
This does not remove the corrected regularity, covariance, positivity or symmetry
requirements. It does not prove `Wightman.Realizes.unique` for a mixture.

OS II p. 283, Remark 5, explicitly allows a denumerable collection of arbitrary
spinor fields, referring to OS I §6, pp. 102–104. OS I pp. 102–103 specifies
the component covariance, adjoint indexing and statistics signs. Consequently
the scalar theorem is not the only available version; the project's exact
component/representation and mixed-correlation identifications must still be
checked before applying that extension. No uniformity across all label degrees
is inferred from the scalar statement.

Zinoviev v1 pp. 21–23 was also visually checked. Its E5 is precisely the
iterated inverse-Laplace limit in (4.12), with (4.13) and (2.54) defining the
test transforms: for each relevant odd distribution there is a threshold
\(K\), then all integers \(k>K\), all \(1\leq l\leq m\), and all stated test
tuples must satisfy the limit. The time-cutoff limits precede the integer-index
limits. Theorem 4.1 on p. 23 gives E0–E5 ↔ R0–R5. Merely producing a momentum
PVM after reconstruction does not establish this input condition.

## Match to the formalisation

All declaration paths below refer to the pinned imported Lean revision. Findings
are bounded source inspection, not a new elaboration, kernel check, or independent
proof audit. “Unresolved” means this inspection did not establish the required
bridge; it does not mean no such argument exists elsewhere in the source.

### Input checklist

| Requirement or convention | Exact project anchor | Assessment and required comparison |
| --- | --- | --- |
| Four-dimensional Euclidean space; time reflection | `YM.timeAxis`, `YM.Signed` in `Lean/YM/Space/Index.lean`; `YM.Word.reflect` in `Lean/YM/Euclid/Words.lean` | Source uses the final coordinate for time. The articles use the first coordinate. Record the coordinate permutation and analytic/Fourier sign conventions, especially the direction of the spectral cone. |
| Arity zero and normalization | `YM.Table.Basic.trivial`, `YM.Table.Basic.unital`, `Lean/YM/Euclid/Table.lean` | Empty correlations equal one; unit insertions have explicit laws. These directly supply the normalization part, with the project's label convention. |
| Euclidean correlations as distributions, not arbitrary diagonal values | `YM.Table.value`, `YM.Table.Smooth`, `Lean/YM/Euclid/Table.lean`; `YM.Test`, `YM.Test.applyTo`, `Lean/YM/Euclid/Test.lean` | The table is smooth only on distinct-point configurations. Its initial tests are compact smooth tests supported there. OS I §2 and OS II §II use a Schwartz subspace flat on coincidence diagonals. Establish a continuous extension from compact separated tests to that exact space; do not use the table's arbitrary values off configuration space. |
| Strong regularity/growth across every arity | `YM.Table.Capped` in `Lean/YM/Euclid/Table.lean` | Its quantifier order permits constants to depend on arity, every fixed label tuple, and derivative order. That signature alone supplies neither linear arity growth nor factorial control. The needed uniform bridge is unresolved. |
| Stronger growth candidate | `YM.OS.Spread.radius`, `YM.OS.Spread.AllCopy`, `YM.OS.Spread.Laws.cap`, `Lean/YM/OS/Slabs.lean`; `YM.OS.irons`, `Lean/YM/OS/Halves.lean` | For bounded label degree and norm, `AllCopy` supplies an operator-norm bound uniform over word length, with radius `C^length * (length/r)^(A*length)`. `irons` additionally assumes `YM.OS.Tiled`. Convert these slab bounds to the chosen distribution seminorm, preserving constants through configuration covers, smearing, and arity. Do not treat `Tiled` as a consequence of `Hierarchy` alone. |
| E1: translations | `YM.Table.Homogeneous`, `YM.Table.Hierarchy.translations`, `Lean/YM/Euclid/Table.lean`, `Words.lean` | Translation invariance is explicit on configuration space. Transport it through the distribution extension and quotient labels. |
| E1: full continuous rotations and component action | `YM.Table.RealSpin` in `Table.lean`; `YM.Signed` in `Space/Index.lean`; `YM.Table.Rotation`, `.Laws`, `.Oriented` in `Lean/YM/Euclid/Stress.lean` | `RealSpin` uses the finite signed-permutation group and must not be described as full continuous rotation covariance. `Rotation.Laws` and `Rotation.Oriented` supply the stronger candidate data separately. Verify their passage to component distributions and their finite-dimensional representation conventions. |
| E2: reflection positivity for arbitrary finite polynomial sums | `YM.Table.RP`, `YM.Table.PastTest`, `YM.Table.RPSmear`, `YM.Table.Hierarchy.onTests`, `Lean/YM/Euclid/Words.lean` | Both word and smeared Gram inequalities are explicit, with varying arities in a finite sum. Reflection reverses the word and conjugates/transforms its labels; the Gram form is antilinear in the first entry. Compare first on compact ordered positive-time tests, then justify continuity/density on the article's full test space. Checking only products of one-point tests would be insufficient. |
| Reflection positivity on other planes | `YM.Table.ClassWords.transported`, `Lean/YM/Euclid/OtherPlanes.lean` | Requires a hierarchy, full rotation laws, `Rotation.Oriented`, and `T.respects S`. This is an additional transport result, not a hidden field of `Hierarchy`. |
| E3: permutation symmetry and statistics | `YM.Table.Symmetric.same`, `YM.Table.Basic`, `Lean/YM/Euclid/Table.lean` | Exact simultaneous permutation of points and labels is supplied. It is a bosonic symmetry statement. A spinor reference with graded signs would require a separate statistics match; the word “spin” in a source name is not evidence of fermionic statistics. |
| E4: clustering / unique vacuum | `YM.OS.Selection.Certificate.heat` and `.still`, `Lean/YM/Phase/Mixture.lean`; `YM.Boundary.Wightman.Realizes.unique`, `Lean/YM/Fields/System.lean` | `Hierarchy` has no cluster field. Selected-phase `UniqueHeat` is a candidate input for a clustering/uniqueness argument, but the required smeared cluster statement must be established. Do not infer it for an unselected mixture, and do not use `Realizes.unique` as an input to a theorem intended to produce that same realization. |
| Scalar theorem versus the project's label system | `YM.Table.Field` in `Lean/YM/Euclid/Null.lean`; `YM.Table.Union`, `YM.DiffPlan.joint` in `Lean/YM/Euclid/Union.lean`; `Rotation.Laws` in `Stress.lean` | Each fixed-level quotient is finite-dimensional; finitely many union labels can be lifted to one level under the stated inclusion hypotheses. A compatible component/multiplet application, including common constants, adjoints, identifications between levels and a common reconstructed domain, remains to be written. Applying a scalar theorem separately to each label does not supply mixed correlations. |

### Output and no-circularity checklist

| Desired conclusion | Project definition or consumer | What the citation must actually provide |
| --- | --- | --- |
| A chamber and translation evolution | `YM.OS.realization`, `YM.OS.Chamber` in `Lean/YM/OS/Dynamics.lean`; `YM.OS.Semigroup` in `Lean/YM/OS/Flow.lean` | A directly inspected source theorem from `Hierarchy`, with strongly continuous self-adjoint time contractions and commuting spatial unitaries. No full Poincaré representation, fields, or unique vacuum is in this conclusion. |
| Analytic continuation and joint tempered boundary | `YM.Boundary.Waves.Region`, `.Opens`, `.NonTangentialFree`, `YM.Boundary.Contour.From`, `Lean/YM/Boundary/Contour.lean` | Match the strict complex-time region, Euclidean root values, integrability, and convergence against **joint** Schwartz tests on the same quotient labels. Pointwise continuation or separate-variable convergence alone is insufficient. |
| A relativistic field realization | `YM.Boundary.Fields.Total`, `.sharpPair`, `.commutes`, `YM.Boundary.Wightman.Realizes`, `Lean/YM/Fields/System.lean` | Match dense common domain, cyclic normalized vacuum, distributional fields, adjoints, locality, strong Poincaré action, spectral PVM/cone and the specified vacuum uniqueness. `faithful` also asks that a nonzero quotient label is detected by the field; this needs a project-specific identification. |
| Produce reconstruction from earlier data | `YM.Bid.Pantry`, `Lean/YM/Bid/Corners.lean`; `YM.Next.BOUNDARY.contour`, `.after_materializes`, `.Compatible.vacuum`, `Lean/YM/Next/BOUNDARY/Stage.lean` | These are useful earlier interfaces: `Pantry.counter` contains the stronger spread laws; `after_materializes` produces contours and selected `Realizes` from `Materializes` and spin descent. Check citation applicability there, rather than starting with `Spec.Final.realization`, which already contains the target. |
| Selected versus unselected theory | `YM.Spec.Relativistic`, `YM.Spec.Final`, `Lean/YM/Spec/Closed.lean`; `.unselected_pantry`, `.selected_pantry` in `Stage.lean` | Keep the full-table contour and selected-phase contour distinct. `FieldCore` permits the unselected theory without vacuum uniqueness; `.Compatible.vacuum` adds the clause from `UniqueHeat`. A reference requiring clustering is not automatically a reference for the unselected mixture. |
| Every character, not just almost every character | `YM.OS.Selection.Certificate.states`, `.sym`, `.retains`, `.coordinates`, `.calculus`, `Lean/YM/Phase/Mixture.lean`; `YM.EveryPhase.Almanac.copy`, `Lean/YM/EveryPhase/Pack.lean`; `YM.EveryPhase.Completed`, `.all_characters`, `Lean/YM/EveryPhase/Extension.lean` | Hierarchy and rotation candidates are supplied for every character; `Almanac.copy` makes stronger bounds uniform in the character. `.almostEvery` only proves an almost-everywhere heat statement and cannot alone supply `.Completed.euclid` for every character. Extra source arguments are required. |
| Integrate boundary distributions to the unselected contour | `YM.EveryPhase.Completed.depends`, `.at_words`, `.at_boundary`, `Extension.lean`; `Lean/YM/EveryPhase/Barycenter.lean` | Pointwise reconstruction for each phase does not prove continuity/measurability or justify exchanging boundary limits and phase integration. These remain distinct obligations with uniform estimates and the actual phase measure. |

### Completed comparison: what is supplied and what is not

The following decisions finish the bounded author comparison. “Bridge required”
is a result of that comparison, not a claim that a missing reference check has
been silently satisfied.

| Item | Decision at the inspected input interface |
| --- | --- |
| Dimension, coordinate and pairing convention | Supplied up to the explicit coordinate map \((p_0,p_1,p_2,p_3)\mapsto(p_3,p_0,p_1,p_2)\), taking project time axis 3 to article time axis 0. It preserves the Euclidean norm and Lebesgue measure and conjugates the reflection. Both distribution pairings are complex linear in the test, with conjugation in the reflected first Gram argument. The project's radian Fourier conventions are documented in `Lean/YM/Distribution/Tests.lean`; no sign-free identification of a prescribed momentum PVM is claimed. |
| E0 normalization | Supplied by `Table.Basic.trivial`. This does not supply continuity or an arity estimate. |
| E0′ distribution and growth | Bridge required: produce the flat-diagonal distribution extension and the exact \(\sigma_n|f|_{ns}\) estimate for each finite component family. The source and norm are now exact and checked; the estimate is not proved here. |
| E1 | Kernel translations and full quotient rotations are supplied by `Hierarchy.translations`, `Rotation.Laws`, and `Rotation.Oriented` when their separate hypotheses are present. Transport to the chosen distribution extension and identify the article's component action. `Hierarchy.spin` alone supplies only signed permutations. |
| E2 | Supplied on compact separated positive-time joint tests by `Hierarchy.onTests`, including finite sums of different arities and labels. The article's ordered tests form a restriction of this compact domain. Extension to its noncompact flat Schwartz tests requires the same continuous extension and density argument as E0′. |
| E3 | Supplied on configurations by `Basic.toSymmetric.same`. Simultaneous point/label permutations give bosonic mixed-kernel symmetry. The assertion must pass through the extension; arbitrary spinor statistics are not being asserted. |
| E4 | `Selection.Certificate.heat` supplies selected heat-ground uniqueness, not the article's smeared spatial cluster formula by definition. That formula needs a separate derivation for a full E′ → R′ application. For the unselected family use the corrected nonclustering subset above; do not demand E4 or assert R4 there. |
| Component system | `Rotation.Laws.filtered` preserves the finite levels and `DiffPlan.joint` lifts each finite tuple to a common level. These provide a concrete comparison interface. The article's mixed component distributions, adjoints and Lorentz representation must be identified; independent scalar reconstructions do not suffice. |
| Project-specific outputs | The article does not identify a prescribed `Contour`, quotient-label faithfulness, every-character choices, or boundary barycenters. Those require the source's compatibility/identification arguments, not stronger wording of the citation. |

### The direct source route is already explicit

Further bounded inspection resolves an ambiguity in the earlier draft: a lack
of a checked OS II citation match does **not** leave the source with only
uncontrolled pointwise analytic continuation. The following concrete source
route constructs a *joint tempered* boundary without invoking E0′ as a premise:

1. `YM.Work.C01.answer` in `Lean/YM/Work/C01.lean` obtains centered insertion
   bounds and compatible quotient operators from `Bid.Pantry.counter.cap`.
2. `YM.Work.C03.defined_power` in `Lean/YM/Work/C03.lean` obtains `Waves.Breathes`
   with exponent the sum of the insertion exponents. `YM.Work.C04.answer` in
   `Lean/YM/Work/C04.lean` supplies integrability, height continuity and tested
   Cauchy–Riemann identities (`Bounds`, `Along`, `Lines`).
3. `YM.Boundary.Waves.seeks` and `.jointly` in `Lean/YM/Shift/Osc.lean` construct
   continuous complex-linear functionals on **joint Schwartz tests**, with an
   explicit continuous `toll` seminorm bound, using the tested Taylor remainder.
   The result is `Surface S` and `NonTangentialFree`, not merely separate-variable
   convergence. The prerequisite definitions are in `Lean/YM/Shift/Ridge.lean`;
   `Distn` in `Lean/YM/Distribution/Tests.lean` is a continuous linear map on
   Schwartz tests.
4. `YM.Org.Show.Rhythm.opens` in `Lean/YM/Org/Theatre.lean` applies that result.
   `YM.Next.BOUNDARY.rhythm` and `.contour` assemble the inputs from `Bid.Pantry`.
   `.Compatible.vacuum` separately adds `UniqueHeat`; the unselected construction
   does not borrow it from the selected phase.

This is a source crosswalk, not a new proof or an independent validity judgment.
`Breathes` has quantifiers \(\forall n,v\ \exists m,C\), so this route alone
does not certify OS II's arity-uniform E0′. It instead supplies a precise
alternative proof boundary for later LaTeX exposition. A consumer can explain
this direct route without claiming to have verified the different E0′ premise.

The paper's scalar Wightman conclusion and the project's richer `Realizes` record
must be compared field by field. No claim of a mass gap, every-phase uniformity,
label faithfulness, or continued stress-tensor identities follows just from an OS
reference. Stress outputs are outside this literature task.

## Application and remaining proof obligations

The following gates specify what a future consuming proof must establish before
using the candidate reference. They are proposed mathematical inputs for later
LaTeX exposition, not new proved lemmas in this Markdown record.

1. **Fix the family to reconstruct.** Name the full table or the selected
   character table and the original quotient label space. Name each component
   sequence and its adjoint/rotation action, including compatibility as the level
   increases. Do not obtain these objects by assuming the final realization.
2. **Construct the distribution input.** Extend the compact-separated kernel
   pairing to the exact flat-diagonal Schwartz space. Establish continuity and
   the chosen corrected growth condition with the right arity quantifiers. The
   raw table values on coincident configurations cannot specify an extension.
3. **Match all remaining hypotheses.** Verify continuous rotations, translations,
   reflected adjoints, mixed-label symmetry and positivity in the same extension.
   If applying the full theorem, establish its cluster hypothesis for that family.
   A nonclustering reconstruction requires the corresponding corrected subset
   version, with an explicit weaker conclusion and no unique-vacuum assertion.
4. **Identify the reconstructed object.** Match the output distributions with the
   prescribed contour and prove the component/quotient field identifications,
   common domain, faithfulness and vacuum convention. A uniqueness statement
   about distributions is not by itself the needed intertwiner between specified
   field systems. `Stage.lean` exposes relevant compatibility and attachment data.
5. **For PU-19, repeat with uniform phase control.** Establish hypotheses for
   every character with uniform constants where integration requires them; prove
   measurability/continuity and boundary-limit interchange separately. No
   exceptional-set deletion is allowed if the intended conclusion is all characters.

The strongest quantitative lead in this inspection is `Spread.AllCopy`, transported
uniformly by `Almanac.copy`. A separately scoped application proof should either
derive OS II's precise growth condition from that interface or use the project's
direct contour/temperedness route without asserting the OS hypothesis. No
conversion proof has been completed here.

An alternative is Zinoviev's Theorem 4.1. To use it one must prove its E5
inverse-Laplace limit condition, not merely point to the existence of the project's
eventual momentum PVM. Using a PVM obtained from the reconstruction being justified
would be circular. This alternate application is unresolved too.

The selected phase's heat condition and the unselected mixture should therefore
remain separate in the proof map. This note supports the distinction proposed in
[PR #18](https://github.com/hairer/humanise-yang-mills/pull/18) for issue #11, but
does not edit that author's interface audit or assign its declarations a second
proof owner. The draft there was inspected at branch
`codex/issue-11-continuum-interfaces`; it is navigation evidence, not accepted proof.
The provisional unit plan and that interface draft credit Scott Armstrong's
[Yang-Mills informalization project](https://github.com/scottnarmstrong/yang-mills-informalization)
for prior navigation and clustering. This note checks the named source interfaces
directly and does not treat that map as proof evidence.

## Search and unresolved questions

Searches on 11 November 2026 included `Osterwalder Schrader Axioms Euclidean
Greens functions II 1975 theorem linear growth condition pdf`, `Osterwalder
Schrader 1973 Axioms Euclidean Greens functions project euclid 83 112`, and
`Osterwalder linear growth sn`. The actual primary-paper text, rather than a
search-result summary, was used for the named theorem and correction.

- **Selected candidate:** OS II §IV.1 with its corrected growth hypothesis.
- **Inspected alternative:** OS II §III's stronger distribution-topology
  equivalence; no project match to that topology is established.
- **Inspected alternative:** Zinoviev v1 §4 E5 and Theorem 4.1; its weak spectral
  condition remains a specific additional input, not a way to omit regularity.
- **Rejected:** unqualified sufficiency of OS I E0–E4, reflection positivity alone,
  smoothness away from diagonals alone, fixed-arity bounds in place of uniform
  arity control, and use of the already-constructed Wightman theory as its own input.
- **Not used as mathematical evidence:** tertiary axiom summaries, search snippets,
  unrelated claimed Yang–Mills constructions returned by search, and a student's
  thesis returned as a possible lead for the norm notation.
- **Overlap:** existing background notes and `Bots/notes/` were checked, along
  with the live issue comments, open PR list, and issue #11 / PR #18 interface
  draft. No other claim on this literature note was found.

The author reference inspection and bounded comparison are complete; the five
application gates above remain mathematical obligations before a cite-and-apply
replacement is justified. They are not declarations that the formal source is
incorrect or that the corrected reconstruction theorem cannot apply. Independent
mathematical and Lean-correspondence review is required before acceptance.

### Evidence and limitations

Actual source inspections included `cat` or bounded `sed -n` reads of:

```text
Lean/YM/Space/Index.lean
Lean/YM/Euclid/{Register,Table,Test,Words,Null,Union,Stress,OtherPlanes}.lean
Lean/YM/OS/{Schwinger,Flow,Dynamics,Slabs,Halves}.lean
Lean/YM/Phase/Mixture.lean
Lean/YM/Bid/Corners.lean
Lean/YM/Next/BOUNDARY/Stage.lean
Lean/YM/Spec/Closed.lean
Lean/YM/Fields/System.lean
Lean/YM/Boundary/Contour.lean
Lean/YM/EveryPhase/{Pack,Extension,Barycenter}.lean
Lean/YM/Work/{B02,C01,C03,C04}.lean
Lean/YM/Shift/{Ridge,Osc}.lean
Lean/YM/Org/Theatre.lean
Lean/YM/Distribution/{Tests,Product}.lean
```

The following searches were run to locate the bounded definitions and consumers:

```sh
rg -n 'structure Hierarchy|def Hierarchy|growth|Euclidean|rotation|cluster|positiv|structure Relativistic|structure Realizes' Lean/YM/Euclid/Words.lean Lean/YM/OS/Schwinger.lean Lean/YM/OS/Dynamics.lean Lean/YM/Spec/Closed.lean Lean/YM/Fields/System.lean Lean/YM/EveryPhase/Pack.lean Lean/ChallengeSpec.lean
rg -n 'def Capped|structure Capped|structure Basic|def Homogeneous|def Smooth|def RealSpin' Lean/YM/Euclid
rg -n 'structure Pantry|theorem contour|lemma contour|def contour|E0|linearGrowth|factorial|Factorial' Lean/YM/Bid Lean/YM/Next/BOUNDARY Lean/YM/Boundary -g '*.lean'
```

Some preliminary searches used guessed filenames that did not exist. The actual
paths above were subsequently located with `rg`; no negative conclusion rests
on a missing guessed path. Initial direct downloads from Project Euclid and
Springer returned HTML; indexed primary full text was used in the first draft.
The follow-up located pre-existing local copies of both original journal scans
and rendered them with `pdftoppm`. OS II printed pp. 283–284 and 287, and OS I
printed pp. 86, 88–89, were visually inspected; multiplet statements on OS I
pp. 102–104 and the OS II p. 282 correction were additionally read from the PDF.
Zinoviev v1 was downloaded from arXiv; pp. 21–23 were rendered and visually
inspected. The scan-access/formula-typography limitation is therefore resolved.
No copyrighted scan or rendered page is added to the repository.

| Inspected PDF | SHA-256 | Page convention |
| --- | --- | --- |
| OS I, local `1103858969.pdf` | `9e45658863823a5a769891141f8eb7b935f0ddfec62f6554d9f802d8157da878` | PDF page 1 = printed p. 83; 30 PDF pages. |
| OS II, local `1103899050.pdf` | `643a45d3037f788ba80ecfef2f218778d7d511102f75ffc44468e20c16382c71` | PDF page 1 = printed p. 281; 26 PDF pages, including an unnumbered terminal page. |
| Zinoviev, arXiv v1 PDF | `4e9e572800baebbe79540d6b9cbe472a03d8932d556f7db56453bb6b00d1d5aa` | Printed/PDF pp. 21–23 agree; 26 pages. |

The follow-up used bounded `sed -n` reads and `rg -n` searches of the named
source files, PDF text extraction with `pypdf`, `pdftoppm -f ... -l ... -png`
for the named page ranges, visual inspection of the resulting PNGs, and
`shasum -a 256` of the PDFs. PDF text extraction had font warnings for Zinoviev;
the limit and theorem statements were checked visually rather than trusted to OCR.

No fresh Lean build, axiom replay, full dependency-tree audit, or independent
review was performed. Existing build evidence is separate from this citation
decision. Structural checking does not validate the bibliography or hypotheses.
No manuscript or Lean source was changed. Publication was held until the contributor explicitly authorised draft submission.

Validation on 11 November 2026 (updated in the follow-up): SHA-256 comparison of the 32 named inspected
source files against `Lean/SOURCES.sha256` passed. `python3
scripts/check_blueprint.py` passed, reporting `Blueprint structure OK: 1 units.
Lean and mathematics were not verified.` The existing unit is unrelated to this
note. `git diff --check` passed for the follow-up. The earlier new-file whitespace
check also passed. This note remains unreviewed. The live AGENTS.md,
CONTRIBUTING.md, docs/coordination.md, docs/agent-prompts.md and
docs/proof-standard.md were read again; this output is a permitted internal
background record, and any new authoritative proof must be written once in
`manuscript/` LaTeX, with build/render checks and linked correspondence metadata.
