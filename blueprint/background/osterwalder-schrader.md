# Osterwalder–Schrader reconstruction: reference and hypothesis checklist

- Literature task: [issue #6](https://github.com/hairer/humanise-yang-mills/issues/6).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Status: source statements checked; **conditional match, not independently accepted**. The checklist does not certify applicability to the complete project hierarchy.
- Contributor and agent assistance: TrishenGunaratnam; Codex research, source inspection and drafting, session `TrishenGunaratnam-codex-02`.
- Independent review: pending; reviewed commit and review link not yet assigned.
- Scope confirmation: [maintainer reply](https://github.com/hairer/humanise-yang-mills/issues/6#issuecomment-6799207940) to the scoped claim request. Requested expiry: 2026-11-11 18:00 UTC.
- Repository snapshot inspected: `ecc06d13de67e479666203061918e537316994e3`. `origin` is the contributor's fork; `upstream` is the canonical repository.

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

Open questions are the five application gates above. These are unresolved source
matches and exposition obligations, not declarations that the formal source is
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
Lean/YM/Work/B02.lean
```

The following searches were run to locate the bounded definitions and consumers:

```sh
rg -n 'structure Hierarchy|def Hierarchy|growth|Euclidean|rotation|cluster|positiv|structure Relativistic|structure Realizes' Lean/YM/Euclid/Words.lean Lean/YM/OS/Schwinger.lean Lean/YM/OS/Dynamics.lean Lean/YM/Spec/Closed.lean Lean/YM/Fields/System.lean Lean/YM/EveryPhase/Pack.lean Lean/ChallengeSpec.lean
rg -n 'def Capped|structure Capped|structure Basic|def Homogeneous|def Smooth|def RealSpin' Lean/YM/Euclid
rg -n 'structure Pantry|theorem contour|lemma contour|def contour|E0|linearGrowth|factorial|Factorial' Lean/YM/Bid Lean/YM/Next/BOUNDARY Lean/YM/Boundary -g '*.lean'
```

Some preliminary searches used guessed filenames that did not exist. The actual
paths above were subsequently located with `rg`; no negative conclusion rests
on a missing guessed path. Direct PDF downloads from Project Euclid and Springer
returned HTML responses, not usable PDFs; a local rendering attempt failed.
The primary articles were read through the web tool's indexed full text. Source
equation numbering and prose were checked there; scanned formula typography has
not been visually certified. Reviewers should check OS II (2.1), (4.1)–(4.2)
in the original scan before accepting a quantitative application.

No fresh Lean build, axiom replay, full dependency-tree audit, or independent
review was performed. Existing build evidence is separate from this citation
decision. Structural checking does not validate the bibliography or hypotheses.
No manuscript or Lean source was changed. Publication was held until the contributor explicitly authorised draft submission.

Validation on 11 November 2026: SHA-256 comparison of the 24 named inspected
source files against `Lean/SOURCES.sha256` passed. `python3
scripts/check_blueprint.py` passed, reporting `Blueprint structure OK: 1 units.
Lean and mathematics were not verified.` The existing unit is unrelated to this
note. `git diff --no-index --check /dev/null
blueprint/background/osterwalder-schrader.md` produced no whitespace diagnostics;
its status 1 records the new-file difference. This note remains unreviewed.
