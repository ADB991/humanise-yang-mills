# Transitive axiom and kernel-replay evidence for `3456e5e`

## Scope and command

This evidence covers the 17 roots in `source/upstream.json` and
`Lean/verification/joint-headlines.txt`. Those two ordered lists were byte-equivalent
after rendering the JSON targets one per line; each had SHA-256 digest
`4a5d4eba5d143858d12466aa818c4bfe202e548fc208b87264932a857f492745`.

The pinned verifier was run from `Lean/` on 11 November 2026:

```sh
env PATH=/Users/hairer/.elan/toolchains/leanprover--lean4---v4.32.0/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin \
  /usr/bin/time -p lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 VerifyJoint.lean
```

It exited successfully after 828.66 seconds. The complete retained output is only
24 lines and has SHA-256 digest
`f565c053c1ed5264923a7865d6e536c9108e0c749bd074c63124d6da4444166d`.

## Per-root results

`VerifyJoint.lean` calls Lean's transitive `collectAxioms` for every endpoint and
rejects any name outside its explicit list `propext`, `Classical.choice`, and
`Quot.sound`.

| Release root | Reported transitive axioms |
| --- | --- |
| `YangMills.jointExistence` | `propext`, `Classical.choice`, `Quot.sound` |
| `YangMills.constructed` | `propext`, `Classical.choice`, `Quot.sound` |
| `YangMills.su2Simple` | `propext`, `Classical.choice`, `Quot.sound` |
| `YangMills.su2Theory` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Nonperturbative.existence` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Nonperturbative.continuum` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Nonperturbative.continuum_with_position_tests` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Contacts.Solstice.celestial` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Pert.Position.finite_leading` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Pert.Position.normalized_four` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Pert.Parity.parityEndpoint` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Pert.Parity.low_read` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Pert.Asymptotics.comparison` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.SharpGram.habitat` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.SharpGram.inletFirst` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.SharpGram.outletFirst` | `propext`, `Classical.choice`, `Quot.sound` |
| `YM.Independent.Core.point` | `propext`, `Classical.choice`, `Quot.sound` |

No `sorryAx`, project-defined axiom, `Lean.ofReduceBool`, or other nonstandard
axiom appears in any endpoint result.

## Type comparison and replay

The same run reported:

```text
TYPE_MATCH YangMills.jointExistence
REPLAY_START project=100168 external=14364
REPLAY_PASS project=100168 external=14364 endpoints=17 duplicateAliases=0
```

Before replay, the verifier loads `Challenge` into a separate environment and
checks that `YangMills.jointExistence` has exactly the same elaborated type and
universe parameters there as in the solution. It rejects implementation modules
in the reference environment. For the release-root closure it rejects unsafe or
partial project declarations, project axiom declarations, and unexpected axioms
at the external boundary. It then imports only the pinned external modules and
asks Lean's kernel replay facility to check the 100,168 reachable project
declarations.

## Supplementary archive-wide scan

The following check is broader in one direction and narrower in another: it scans
all declarations owned by modules whose names begin with `YM`, whether or not a
release root reaches them, but it does not include the separate public bridge
modules.

```sh
lake env lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 verification/Inventory.lean
```

The first run failed in 2.95 seconds because the downloaded default-target
artifact did not contain `.lake/build/lib/lean/YM.olean`. After `lake build YM`
built that aggregate root in 38.21 seconds without source changes, the second run
passed in 36.66 seconds:

```text
INVENTORY_PASS
DECLARATION_SCAN declarations=249713 directSorryAx=0 projectAxioms=0
```

The failed and successful logs are both retained; their SHA-256 digests are
`df8484e67012a885409fc2b2a1ceee1a0d41fa5ee0cf730671639c76a17cf873`
and `03d413ca89eb91bd7bb023b404ff4117a47e7095b6be35ae10575087aa019ed8`,
respectively.

## Deliberate reference placeholder

`Lean/Challenge.lean` contains a deliberate `sorry` in its reference copy of
`YangMills.jointExistence`. The file states that this placeholder belongs only to
the challenge and that `Solution.lean` supplies the proof. Consequently the
`WilsonReference` build emits a warning that `Challenge.lean:5:8` uses `sorry`.

This placeholder is not suppressed or counted as a proved theorem. The verifier
uses the reference declaration only for the exact type comparison described
above, checks that the reference import graph contains no implementation module,
and replays the solution declaration from the implementation environment. None
of the 17 solution-root axiom reports contains `sorryAx`.

## Limits of the evidence

- A transitive axiom report establishes which axiom constants occur in an
  elaborated proof term. It does not establish that a theorem's hypotheses or
  definitions capture the intended mathematics or physics.
- Kernel replay checks the reachable closure, not the 150,151 project declarations
  classified as outside all 17 release roots by `Usage.lean`.
- The supplementary scan detects direct `sorryAx` uses and axiom declarations in
  `YM` modules; it is not itself a transitive semantic audit of every unused
  declaration.
- The result trusts Lean 4.32.0, its kernel and replay implementation, and the
  pinned external libraries. No independent proof assistant or second Lean
  implementation was used.
- No native-computation axiom appeared in the endpoint closures. This excludes a
  `Lean.ofReduceBool` dependency in those reported terms, but it is not a general
  audit of every computation performed while building the archive.
