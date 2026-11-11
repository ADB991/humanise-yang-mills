# Preliminary source audit: OpenAI-YM-20261028

| Field | Value |
| --- | --- |
| Source revision | `3456e5e75cf8d4cd558955a5c7638fba2d68f464` |
| Toolchain | `leanprover/lean4:v4.32.0` |
| Audit status | **Dependency roots identified; theorem and axiom audit incomplete** |
| Release roots | 17 theorem declarations |

The source snapshot is imported under `Lean/`. This first pass uses the supplied
dependency audit in `Lean/verification/Usage.lean` and its manifest
`Lean/verification/joint-headlines.txt`. It identifies the release roots and a
preliminary mathematical architecture. It does not establish that the source has
built in this repository or that the public statements have the intended physical
interpretation.

## Audited release roots

### Main public theorem and assembly

- `YangMills.jointExistence`
- `YangMills.constructed`
- `YM.Nonperturbative.existence`
- `YM.Nonperturbative.continuum`
- `YM.Nonperturbative.continuum_with_position_tests`

### Concrete SU(2) specialization

- `YangMills.su2Simple`
- `YangMills.su2Theory`

### Focused release headlines

- `YM.Independent.Core.point`
- `YM.Contacts.Solstice.celestial`
- `YM.Pert.Position.finite_leading`
- `YM.Pert.Position.normalized_four`
- `YM.Pert.Parity.parityEndpoint`
- `YM.Pert.Parity.low_read`
- `YM.Pert.Asymptotics.comparison`
- `YM.SharpGram.habitat`
- `YM.SharpGram.inletFirst`
- `YM.SharpGram.outletFirst`

The focused headlines are not all premises of `YangMills.jointExistence`. They
include companion results and narrower interfaces. The blueprint therefore keeps
the main existence-theorem spine separate from these branches.

| Declaration group | Source path |
| --- | --- |
| `YangMills.jointExistence` | `Lean/Solution.lean` |
| `YangMills.constructed` | `Lean/Construction.lean` |
| `YangMills.su2Simple`, `YangMills.su2Theory` | `Lean/ConcreteSU2.lean` |
| `YM.Nonperturbative.existence` | `Lean/YM/Nonperturbative/Headlines.lean` |
| `YM.Nonperturbative.continuum*` | `Lean/YM/Nonperturbative/Continuum.lean` |
| `YM.Independent.Core.point` | `Lean/YM/Independent/Core.lean` |
| `YM.Contacts.Solstice.celestial` | `Lean/YM/Contacts/Solstice/Result.lean` |
| Position headlines | `Lean/YM/Pert/Position/Crest.lean`, `Lean/YM/Pert/Position/Four.lean` |
| Parity headlines | `Lean/YM/Pert/Parity/End.lean`, `Lean/YM/Pert/Parity/EvenLow.lean` |
| `YM.Pert.Asymptotics.comparison` | `Lean/YM/Pert/Asymptotics/RawAxis.lean` |
| Sharp-Gram headlines | `Lean/YM/SharpGram/Measured.lean`, `Lean/YM/SharpGram/Clauses.lean` |

## What Usage.lean checks

The audit command requires every manifest root to be a theorem and rejects an
empty or duplicate manifest. Starting from each root, it follows constants used
in declaration types and values, together with constructors of reached inductive
types. It records reached project declarations, an endpoint/immediate-user witness,
and module-level inventories.

The project-owned audit universe contains modules whose names begin with `YM` plus
the enumerated public, bridge, construction, solution, contact, and SU(2) modules.
Dependencies in Lean and Mathlib are outside that project inventory.

Important limits:

- This is constant reachability, not a mathematical proof graph.
- It does not distinguish mathematical content from generated declarations,
  record plumbing, coercions, instances, or tactic scaffolding.
- A witness records one traversal path where closures overlap, not every path.
- It does not perform `#print axioms`, validate theorem meanings, or independently
  verify correspondence between the source and an English statement.
- The checked-in declaration and module TSVs were not regenerated in this pass.

## Preliminary main spine

The top-level construction reported by the audit is:

```text
constructionRun / fundedRun
  → continuum_with_position_tests
  → Nonperturbative.existence
  → YangMills.constructed
  → YangMills.jointExistence
  → YangMills.su2Theory
```

`YangMills.su2Theory` also uses the concrete gauge group and
`YangMills.su2Simple`. The continuum construction packages Wilson limits,
reconstruction, OPE, trace tests, contacts, and position-test data. The bridge
files translate those internal results into the public interface; they are an
assembly layer, not independent proofs of all the packaged mathematics.

See [the proof outline](../blueprint/outline.md) and
[provisional unit plan](../blueprint/unit-plan.md) for the mathematical map.

## Required next audit

Before any unit is marked reviewed:

1. Reproduce the build described by the upstream project and retain the log.
2. Inspect and record the elaborated type and relevant definitions of every release root.
3. Run the pinned toolchain's supported transitive axiom checks for the roots.
4. Check the public theorem restatement and all stated limitations against Lean.
5. Regenerate the usage inventories and compare them with the checked-in files.

This document records a preliminary audit performed through bounded read-only
inspection. No Lean commands were run during this mapping pass.
