# Provisional proof-unit plan

This plan adapts the 32 source clusters developed in Scott Armstrong's
[Yang-Mills informalization project](https://github.com/scottnarmstrong/yang-mills-informalization)
into mathematical work packages for this monograph. The compiled-Lean source map
was inspected at commit [`8f3c7ccaeabb17b0f928bc1a2e75328691de3032`](https://github.com/scottnarmstrong/yang-mills-informalization/tree/8f3c7ccaeabb17b0f928bc1a2e75328691de3032);
see the [32-cluster disposition and evidence](external-map.md). The IDs below are temporary
planning labels. Canonical `YM-<issue>` IDs are created only when bounded GitHub
issues exist.

One row should normally become one explanation issue, except where a literature
task resolves the result or the split notes require finer interfaces. Dependencies
are conceptual and provisional; they are not a claim about every Lean constant edge.

## Background and interface packages

| ID | Package | External clusters | Treatment |
| --- | --- | --- | --- |
| BG-01 | Lattice gauge theory, compact matrix groups, Wilson measure | I.1 | State conventions; cite standard lattice/gauge background; prove project-specific facts only |
| BG-02 | Field labels, Wilson-family data, marker algebra and polymer estimates | II.1–II.2 | Check the substantive quotient, combinatorial and norm results before deciding what may be cited or compressed |
| BG-03 | Analytic toolkit | III.16 | Shared literature tasks for standard analysis; isolate genuinely project-specific variants |
| BG-04 | Order of constants and RG schedule | III.2 | Parameter ledger/technical appendix; each consuming proof cites the choices it needs |

Background packages can have audit and literature issues without becoming standalone
proof chapters. Their definitions are prerequisites for the proof units below.

## Main-spine proof units

| ID | Mathematical output | External clusters | Depends on | Split or merge guidance |
| --- | --- | --- | --- | --- |
| PU-01 | Block-spin map and symmetric gauge fixing | III.1 | BG-01–BG-04 | Keep as the geometric entry to one RG step |
| PU-02 | Free lattice kernels and covariance estimates | III.3 | BG-01, BG-03, PU-01 | Search literature for standard Green-kernel estimates; retain lattice-specific bounds |
| PU-03 | Change of Gaussian sector and window law | III.4 | PU-01, PU-02, BG-03 | Large cluster: split determinant identities from window/change-of-measure estimates if interfaces separate cleanly |
| PU-04 | Polymer cluster expansion and connected dependence | III.5, III.8 | BG-02, PU-01, PU-03 | Fold III.8 here unless its four selected statements form a reusable theorem |
| PU-05 | Stationary background for the effective action | III.6 | PU-01–PU-03 | Keep distinct from fourth-order matching |
| PU-06 | Fourth-order Wilson-energy matching | III.7 | PU-02, PU-03, PU-05 | Adjacent to PU-05, but a distinct proof job |
| PU-07 | Marginal coupling flow and reset | III.9, VII.5 | PU-04–PU-06, BG-04 | Separate the flow/reset argument from VII.5's logarithmic law; its public regularity use is at the bare-coupling stage |
| PU-08 | Nonlinear RG decomposition and activity update | III.10 | PU-03–PU-07 | Proposed interface: identify the updated activity and the hypotheses passed to the next bound |
| PU-09 | Irrelevant-term and large-field estimates | III.10 | PU-08, BG-03–BG-04 | Proposed interface: state the induction norm, contraction, and large-field output explicitly |
| PU-10 | Uniform constants and closure of the RG induction | III.10, III.2 | PU-08–PU-09 | Proposed interface: determine which parameter choices close the step and are restored by reset |
| PU-11 | Interacting rank and free-Gaussian comparison | III.11 | PU-03, PU-08–PU-10 | Identify the rank/free-field output and its overlap with stress-tensor construction before splitting |
| PU-12 | Determinant budgets | III.11 | PU-03, PU-08–PU-10 | Audit whether the per-site budget is independently stated and whether it precedes the rank comparison in PU-11 |
| PU-13 | Volume-uniform estimates and spacing limit | III.12, III.15 | PU-07–PU-12 | Fold observable/remainder cost accounting here unless it supplies a reusable theorem |
| PU-15 | Public construction run, its Wilson family and ultraviolet rate | III.14, VIII.1 | PU-05–PU-13 | Identify the selected run and its funded bounds; the alternative family in III.13 is not this public family |
| PU-16 | Infinite-volume subsequence and Euclidean axioms | IV.1 | PU-13, PU-15 | Preserve quantifier order: arbitrary requested volume sequence, then chosen refinement/subsequence |
| PU-17 | Phase decomposition of the limit | V.1 | PU-16 | Keep separate while phase hypotheses and measurability are audited |
| PU-18 | Osterwalder-Schrader reconstruction | V.2 | PU-16–PU-17, BG-03 | Priority literature match; check every OS hypothesis against this hierarchy |
| PU-19 | Reconstruction for every phase | V.3 | PU-17–PU-18 | Merge with PU-18 only if it is a routine phasewise application |
| PU-20 | Ward identities, rotations, and conserved stress tensor | III.11, V.3, VI.1 | PU-16–PU-19 | III.11 and V.3 also contain stress-tensor outputs; audit the conceptual input from PU-11 and assign disjoint statements before prose work |
| PU-21 | Free Maxwell stress tensor and local Ward charge | VI.2 | PU-16, PU-20 | Check the Ward normalization and separate it from VI.2's interacting comparison |
| PU-22 | Free Maxwell data and the short-distance comparison | VI.2, VII.1, VII.6, VIII.1 | PU-06, PU-11, PU-16, PU-20–PU-21 | VII.1 supplies the free side; VI.2 supplies the interacting comparison, VIII.1 assembles it, and VII.6 tunes arbitrary scales |
| PU-23 | Selected-phase trace law and exclusion of finite free profiles | VII.2, VII.6, VIII.1 | PU-07, PU-11, PU-16, PU-20–PU-22, PU-24 | Audit the exact trace bridge and use of Gram positivity; do not infer a mass gap |
| PU-24 | Free Wick algebra and reflected Gram positivity | VII.3 | BG-02, PU-16, PU-21 | This supplies a free-field detector; the concluding nonfree statements are in VII.2 and VIII.1 |
| PU-25 | Pointwise OPE and weighted joint estimate | VII.4 | PU-11, PU-16–PU-19 | Include `YM.Independent.Core.point`; split foundation from pointwise consequence if needed |
| PU-26 | Contact extensions | VII.4 | PU-16–PU-17, PU-25 | Include `YM.Contacts.Solstice.celestial`; retain its stated limitations |
| PU-27 | Public theorem assembly | VIII.1 | PU-13, PU-15–PU-26 as required by the audited statement | Explain bridges and quantifier matching; do not repeat prior proofs |
| PU-28 | Simplicity of SU(2) and concrete specialization | VIII.1 plus SU(2) files | PU-27, BG-01 | Prefer a checked literature citation for simplicity of the project's concrete matrix group/Lie algebra |

The former PU-14 proposal has been withdrawn: Scott's revised III.13 outline
identifies that family as an alternative construction for `habitat`. Its proposed
work now belongs in CP-04; PU-15 covers the Wilson family selected for public
assembly. The broad dependencies in the final rows must be narrowed after exact
statement audit. In particular, the external source graph has implementation
cycles between clusters; the table above records the intended mathematical order,
not all imports.

## Focused companion units

| ID | Mathematical output | Audited headline anchors | Relation to main spine |
| --- | --- | --- | --- |
| CP-01 | Finite-leading position reading and four-grade normalization | `YM.Pert.Position.finite_leading`, `YM.Pert.Position.normalized_four` | Uses ultraviolet calibration; exact use by the public theorem remains to be checked |
| CP-02 | Finite-regulator parity and low-order even/odd algebra | `YM.Pert.Parity.parityEndpoint`, `YM.Pert.Parity.low_read` | Follows CP-01; keep finite-regulator and asymptotic claims distinct |
| CP-03 | Asymptotic law for the trajectory's effective coupling | `YM.Pert.Asymptotics.comparison` | VII.5 states this for a constructed family and arbitrary admissible level/volume sequences; it is a separate unused corollary, while VII.5's `zeroUp_bound` feeds the public regularity clause through VIII.1 |
| CP-04 | Alternative Sharp-Gram family and input/output estimates | `YM.SharpGram.habitat`, `YM.SharpGram.inletFirst`, `YM.SharpGram.outletFirst` | III.13 constructs the alternative common family for `habitat`; identify any bridge to the public run before reuse. VII.6's `inletFirst` is a small fixed-field component, while its Sky scaling argument belongs to PU-22/PU-23 |

Companion units receive the same correspondence and mathematical reviews. They
should not silently expand the conclusion of `YangMills.jointExistence`.

## Recommended first wave

Open these bounded tasks before distributing the large RG units:

1. **Build and axiom audit.** Reproduce the pinned build, regenerate the usage
   inventories, and run supported transitive axiom checks for all 17 roots.
2. **Public statement audit.** Check the external `statement.md` line by line
   against the elaborated public definitions and record the exact theorem scope.
3. **External-map synchronization.** Use the pinned compiled-Lean map and its
   [32-cluster disposition](external-map.md); link current unit outlines and key
   statements from task issues without copying generated TSVs.
4. **Literature searches.** Start with SU(2) simplicity, OS reconstruction,
   Gaussian/cluster expansion tools, and standard limit/compactness results.
5. **Two pilot units.** Use PU-28 (SU(2)) and CP-03 (the effective-coupling asymptotic)
   to calibrate citation, source-correspondence, and review standards.
6. **Main-spine interface audit.** Trace the exact handoff from PU-15 through
   PU-19 before assigning the very large nonlinear RG proof units.

Only after those tasks settle the interfaces should coordinators create canonical
unit directories and distribute PU-08–PU-12 among several writers.

## Known limitations of this pass

- No Lean build, proof replay, or axiom audit was performed here.
- The external map is same-revision and now derived from compiled Lean. All 32
  pages have AI-written outlines at differing stages, with open points. Their
  `checked` or `edited` labels do not substitute for this project's independent
  correspondence and mathematical reviews.
- No literature match has yet been independently accepted in `blueprint/background/`.
- The splits inside III.4, III.10, and III.11 are mathematical recommendations;
  their exact statement interfaces and overlap with other packages remain tasks
  for the next audit. The compiled graph corrects source-unit links but does not
  determine a topological expository order.
- The allocation includes alternative constructions. In particular, III.13's
  common family is not identified with the family of the public run in III.14.
- The final dependency closure of `YangMills.jointExistence` must be distinguished
  from the union of all 17 release-root closures.
