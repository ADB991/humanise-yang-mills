# Provisional proof-unit plan

This plan turns the 32 source clusters in the external informalization map into
mathematical work packages. The IDs below are temporary planning labels. Canonical
`YM-<issue>` IDs are created only when bounded GitHub issues exist.

One row should normally become one explanation issue, except where a literature
task resolves the result or the split notes require finer interfaces. Dependencies
are conceptual and provisional; they are not a claim about every Lean constant edge.

## Background and interface packages

| ID | Package | External clusters | Treatment |
| --- | --- | --- | --- |
| BG-01 | Lattice gauge theory, compact matrix groups, Wilson measure | I.1 | State conventions; cite standard lattice/gauge background; prove project-specific facts only |
| BG-02 | Field labels, lattice representatives, polymer records and norms | II.1–II.2 | Definitions and navigation; extract only mathematical classification or norm lemmas used later |
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
| PU-07 | Marginal coupling flow and reset | III.9, VII.5 | PU-04–PU-06, BG-04 | Include the narrow running-coupling asymptotic only after its exact proxy limitation is audited |
| PU-08 | Nonlinear RG decomposition and activity update | III.10 | PU-03–PU-07 | First required split of the 49k-line cluster |
| PU-09 | Irrelevant-term and large-field estimates | III.10 | PU-08, BG-03–BG-04 | Second required split; define the induction norm and contraction statement explicitly |
| PU-10 | Uniform constants and closure of the RG induction | III.10, III.2 | PU-08–PU-09 | Third required split; keep the global choice order visible |
| PU-11 | Interacting rank and free-Gaussian comparison | III.11 | PU-03, PU-08–PU-10 | Split the 42k-line cluster at the rank/comparison interface |
| PU-12 | Determinant budgets | III.11 | PU-03, PU-11 | Separate if determinant estimates have an independent statement; otherwise merge into PU-11 |
| PU-13 | Volume-uniform estimates and spacing limit | III.12, III.15 | PU-07–PU-12 | Fold observable/remainder cost accounting here unless it supplies a reusable theorem |
| PU-14 | One common Wilson family | III.13 | PU-06–PU-13 | State carefully which labels and limits are simultaneous |
| PU-15 | Construction run and ultraviolet rate | III.14 | PU-05–PU-14 | Formal interface to the funded/nonperturbative construction |
| PU-16 | Infinite-volume subsequence and Euclidean axioms | IV.1 | PU-13–PU-15 | Preserve quantifier order: arbitrary requested volume sequence, then chosen refinement/subsequence |
| PU-17 | Phase decomposition of the limit | V.1 | PU-16 | Keep separate while phase hypotheses and measurability are audited |
| PU-18 | Osterwalder-Schrader reconstruction | V.2 | PU-16–PU-17, BG-03 | Priority literature match; check every OS hypothesis against this hierarchy |
| PU-19 | Reconstruction for every phase | V.3 | PU-17–PU-18 | Merge with PU-18 only if it is a routine phasewise application |
| PU-20 | Ward identities, rotations, and conserved stress tensor | VI.1 | PU-16–PU-19 | Separate symmetry derivation from the free comparison |
| PU-21 | Free Maxwell stress tensor and local Ward charge | VI.2 | PU-16, PU-20 | Literature-heavy comparison with project-specific normalizations |
| PU-22 | Short-distance convergence to free Maxwell fields | VII.1 | PU-06, PU-11, PU-16, PU-20–PU-21 | Check the topology and observables in the exact convergence claim |
| PU-23 | Trace of the stress tensor and trace anomaly | VII.2 | PU-07, PU-11, PU-16, PU-20–PU-22 | Keep the claimed physical interpretation within the formal statement |
| PU-24 | Gram positivity and exclusion of free-field profiles | VII.3 | PU-16, PU-20–PU-21 | Nonfreeness unit; do not relabel as a mass-gap result |
| PU-25 | Pointwise OPE and weighted joint estimate | VII.4 | PU-11, PU-16–PU-19 | Include `YM.Independent.Core.point`; split foundation from pointwise consequence if needed |
| PU-26 | Contact extensions | VII.4 | PU-16–PU-17, PU-25 | Include `YM.Contacts.Solstice.celestial`; retain its stated limitations |
| PU-27 | Public theorem assembly | VIII.1 | PU-13–PU-26 as required by the audited statement | Explain bridges and quantifier matching; do not repeat prior proofs |
| PU-28 | Simplicity of SU(2) and concrete specialization | VIII.1 plus SU(2) files | PU-27, BG-01 | Prefer a checked literature citation for simplicity of the project's concrete matrix group/Lie algebra |

The broad dependencies in the final rows must be narrowed after exact statement
audit. In particular, the external source graph has implementation cycles between
clusters; the table above records the intended mathematical order, not all imports.

## Focused companion units

| ID | Mathematical output | Audited headline anchors | Relation to main spine |
| --- | --- | --- | --- |
| CP-01 | Finite-leading position reading and four-grade normalization | `YM.Pert.Position.finite_leading`, `YM.Pert.Position.normalized_four` | Uses ultraviolet calibration; exact use by the public theorem remains to be checked |
| CP-02 | Finite-regulator parity and low-order even/odd algebra | `YM.Pert.Parity.parityEndpoint`, `YM.Pert.Parity.low_read` | Follows CP-01; keep finite-regulator and asymptotic claims distinct |
| CP-03 | Running-coupling comparison proxy | `YM.Pert.Asymptotics.comparison` | Likely a focused consequence of PU-07; does not by itself identify the physical X-scheme coupling |
| CP-04 | Sharp-Gram habitat and input/output estimates | `YM.SharpGram.habitat`, `YM.SharpGram.inletFirst`, `YM.SharpGram.outletFirst` | Draws on PU-11/PU-13-style estimates; retain as a companion unless assembly audit proves it is on the main spine |

Companion units receive the same correspondence and mathematical reviews. They
should not silently expand the conclusion of `YangMills.jointExistence`.

## Recommended first wave

Open these bounded tasks before distributing the large RG units:

1. **Build and axiom audit.** Reproduce the pinned build, regenerate the usage
   inventories, and run supported transitive axiom checks for all 17 roots.
2. **Public statement audit.** Check the external `statement.md` line by line
   against the elaborated public definitions and record the exact theorem scope.
3. **External-map synchronization.** Record the current external-map commit and
   link its 32 units and key statements from task issues; avoid copying generated TSVs.
4. **Literature searches.** Start with SU(2) simplicity, OS reconstruction,
   Gaussian/cluster expansion tools, and standard limit/compactness results.
5. **Two pilot units.** Use PU-28 (SU(2)) and CP-03 (the narrow asymptotic proxy)
   to calibrate citation, source-correspondence, and review standards.
6. **Main-spine interface audit.** Trace the exact handoff from PU-15 through
   PU-19 before assigning the very large nonlinear RG proof units.

Only after those tasks settle the interfaces should coordinators create canonical
unit directories and distribute PU-08–PU-12 among several writers.

## Known limitations of this pass

- No Lean build, proof replay, or axiom audit was performed here.
- The external map is same-revision and detailed, but its 32 unit pages remain
  automatic outlines and have not been checked line by line against proofs.
- No literature match has yet been independently accepted in `blueprint/background/`.
- The splits inside III.4, III.10, and III.11 are mathematical recommendations;
  their exact declaration interfaces remain tasks for the next audit.
- The final dependency closure of `YangMills.jointExistence` must be distinguished
  from the union of all 17 release-root closures.
