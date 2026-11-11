# First-pass proof architecture

This outline maps the imported Lean release to the planned research monograph. It
uses Scott Armstrong's compiled-Lean map at external commit
[`8f3c7ccaeabb17b0f928bc1a2e75328691de3032`](https://github.com/scottnarmstrong/yang-mills-informalization/tree/8f3c7ccaeabb17b0f928bc1a2e75328691de3032)
and is pinned to OpenAI-YM revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. It is a planning document: theorem
types, proof details, literature matches, and axioms still require independent audit.

## Evidence used for this map

- The release-root audit in `Lean/verification/Usage.lean`, inspected through
  bounded read-only agent reports. The command was not rerun in this pass.
- The checked-in declaration/module usage inventories, used by those agents as
  navigation aids rather than accepted mathematical classifications.
- Scott Armstrong's
  [Yang–Mills informalization map](https://github.com/scottnarmstrong/yang-mills-informalization/tree/8f3c7ccaeabb17b0f928bc1a2e75328691de3032),
  inspected at commit `8f3c7ccaeabb17b0f928bc1a2e75328691de3032`.
  It targets the same OpenAI-YM revision and supplies 32 source clusters,
  declaration ownership, 989 selected statements, a glossary, a theorem
  restatement, and unit outlines at varying review stages. Its [method](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/method.md)
  now derives dependencies from compiled Lean and compares release-root reachability
  with OpenAI's record. All unit pages have outlines at varying AI review stages;
  none is an independently reviewed proof in this project. See the
  [cluster-by-cluster comparison](external-map.md) and Scott's
  [data dictionary](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/data/README.md)
  for the different scopes of source allocation and compiled reachability.

The external map is the source-correspondence layer for this first pass. Its
allocation includes alternative constructions beyond the public theorem's own
closure. This
repository should link to its unit IDs and source data rather than recreate a
second declaration-to-cluster inventory. Exact hypotheses and proof obligations
must still be checked here before prose is accepted.

## The public theorem at the top

The main public endpoint is `YangMills.jointExistence`. At a high level, it asserts
the existence, for each compact matrix gauge group with simple Lie algebra, of a
Wilson family and suitable refinements along each requested increasing sequence of
volumes. The resulting hierarchy packages Wilson convergence, reconstruction,
operator-product information, and a trace test. This description is provisional;
the exact quantified statement belongs in the statement-audit task.

The proof architecture has one main spine and several focused release branches:

```mermaid
flowchart TD
  A["Lattice gauge theory and construction data"]
  B["Ultraviolet RG construction"]
  C["Uniform bounds and common Wilson family"]
  D["Infinite-volume subsequence"]
  E["Phase decomposition and OS reconstruction"]
  F["Ward identities and stress tensor"]
  G["Short-distance identification and interaction evidence"]
  H["OPE and contact extensions"]
  I["Public theorem assembly"]
  J["Concrete SU(2) specialization"]
  K["Perturbative position and parity branch"]
  L["Running-coupling proxy branch"]
  M["Sharp-Gram fixed-field branch"]

  A --> B --> C --> D --> E --> F --> G --> I --> J
  D --> H --> I
  B --> K
  B --> L
  B --> M
  K -.-> I
  L -.-> I
  M -.-> I
```

The dotted arrows indicate editorial association, not a verified formal dependency
of `YangMills.jointExistence`. Each focused branch must be checked before the
monograph claims that it is part of the public theorem.

## Source clusters

The external map groups the source into eight parts and 32 units:

| Part | Source clusters | Mathematical role |
| --- | --- | --- |
| I | I.1 | Lattice, symmetry, gauge-group, and Wilson-measure setup |
| II | II.1–II.2 | Field labels, polymer activities, norms, Wilson-family and construction records |
| III | III.1–III.16 | Ultraviolet RG: blocking, kernels, Gaussian/polymer machinery, background, flow, nonlinear estimates, uniformity, construction run, analytic tools |
| IV | IV.1 | Infinite-volume subsequence and Euclidean axioms |
| V | V.1–V.3 | Phase decomposition and Wightman reconstruction |
| VI | VI.1–VI.2 | Ward identities, stress tensor, and Maxwell comparison |
| VII | VII.1–VII.6 | Short-distance Maxwell behavior, trace anomaly, nonfreeness, OPE/contacts, running coupling, and fixed-field estimates |
| VIII | VIII.1 | Assembly of the public theorem |

These are ownership and navigation clusters. Their compiled-graph `builds_on`
summaries contain mutual implementation dependencies and are not a topological
proof order. A cluster
is not automatically a chapter or a proof task. In particular, Part III contains
about 70% of the mapped source, while several clusters mainly organize definitions,
parameter choices, analytic utilities, or accounting.

The revised outlines identify [III.13](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-13.md)
as an alternative common-family construction for `YM.SharpGram.habitat`. The
Wilson family of the public construction is selected in
[III.14](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-14.md)
and assembled in VIII.1. The two families are not identified by that outline.
Likewise, VII.1 supplies the free side of the short-distance comparison, while
the interacting comparison crosses VI.2 and VIII.1; the free Wick and Gram results
of VII.3 support a finite-profile exclusion concluded through VII.2 and VIII.1.

## Proposed monograph parts

1. **Setting and construction data.** Define the gauge-theoretic, lattice,
   Wilson-family, field-label, and polymer framework. Quote standard background
   where possible and state project-specific conventions precisely.
2. **One-step renormalization framework.** Develop blocking, symmetric gauge
   fixing, free kernels, Gaussian changes, and the polymer/cluster expansion.
3. **Effective action and coupling flow.** Construct the stationary background,
   match Wilson energy to fourth order, and derive the marginal flow/reset.
4. **Nonlinear RG estimates.** Prove the one-step induction, irrelevant and
   large-field bounds, determinant/free-Gaussian comparison, and parameter closure.
5. **Uniformity and the construction run.** Obtain volume-uniform estimates and
   spacing limits, then select the funded run and its common Wilson family for
   the public theorem. Treat III.13's alternative family separately.
6. **Infinite volume.** Extract a subsequence for every requested volume sequence
   and establish the Euclidean hierarchy.
7. **Phases and reconstruction.** Decompose the limit into phases and reconstruct
   the corresponding Wightman theories.
8. **Symmetry and stress tensor.** Establish Ward identities, rotations,
   conservation, and the free-Maxwell comparison used later.
9. **Identification and interaction evidence.** Prove the short-distance Maxwell
   behavior, trace statement, nonfree criterion, and the precisely delimited
   running-coupling conclusion.
10. **OPE, contacts, and fixed-field consequences.** Present the pointwise OPE,
    contact extensions, and selected scaling/Sharp-Gram consequences.
11. **Assembly and concrete gauge groups.** Translate the internal construction
    into the public theorem and specialize it to SU(2).

This chapter order follows the mathematical transfer of information. It need not
follow source-file order. Detailed candidate proof units and dependencies are in
[unit-plan.md](unit-plan.md).

## Editorial boundaries

- Standard results should be located and cited before a new proof is written.
  The consuming unit must check the cited hypotheses and prove any unmatched step.
- Generated declarations, coercions, instances, record constructors, and tactic
  artifacts do not receive prose units. Any mathematical content they encode remains.
- The public bridges receive a correspondence and assembly explanation; they do
  not cause the underlying proofs to be repeated.
- The theorem does not acquire a mass-gap, uniqueness of the subsequential limit,
  clustering, or other physical conclusion merely from the project title. Every
  such claim requires an exact audited declaration.

## External-map handoff

Before opening an explanation issue, consult the [disposition table](external-map.md)
and record the relevant pinned external unit ID and key-statement rows. Review any
external outline's open points and source correspondence before using it; its AI
`checked`/`edited` status does not meet this project's review standard. If this
project develops a proof first, link the PR from the corresponding external work
item. The external map's Lean source pin must match `source/upstream.json`;
future revisions require an explicit comparison.
