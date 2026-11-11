# [Task] Pilot proof unit: running-coupling comparison proxy

**Suggested labels:** `kind:explain`, `status:blocked`, `priority:normal`

## Task kind

Explain.

## Proposed coordinator

`@hairer` (must be confirmed by a maintainer when this issue is published).

## Mathematical interface and source scope

Write the pilot exposition for provisional CP-03, anchored at
`YM.Pert.Asymptotics.comparison` in
`Lean/YM/Pert/Asymptotics/RawAxis.lean`, source revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

Determine its exact recurrence/asymptotic inputs and conclusion from the declaration
and immediate dependencies. This is a deliberately narrow companion result: it
must not be identified with a physical X-scheme running coupling unless the formal
definitions and a separately reviewed bridge establish that identification.

When this draft is published, replace the output placeholder below with
`blueprint/units/YM-<six-digit issue number>/`; that issue number is the canonical
unit ID.

## Expository treatment and literature search

Search for an applicable standard result on the scalar recurrence or asymptotic
comparison actually present. Cite and apply it if its hypotheses and normalisations
match; otherwise give the needed detailed elementary proof. Explain the
project-specific definitions and limitation of the proxy without narrating Lean
tactics.

## Owned outputs and exclusions

- Own only `blueprint/units/YM-<this issue number>/`, created from
  `templates/proof-unit/`.
- Own `YM.Pert.Asymptotics.comparison` and only the bounded helper declarations
  required for its mathematical proof.
- Do not absorb PU-07's full marginal coupling flow, CP-01/CP-02 position/parity
  results, the public theorem assembly, or any physical-identification claim.
- Do not edit shared outline, glossary, background, or manuscript files. Propose a
  separate literature/background task if a reusable result is discovered.

## Prerequisites and overlap search

Blocked until [#2](https://github.com/hairer/humanise-yang-mills/issues/2)'s
build/axiom evidence,
[#3](https://github.com/hairer/humanise-yang-mills/issues/3)'s statement audit,
and [#4](https://github.com/hairer/humanise-yang-mills/issues/4)'s mapping of the
relevant source cluster are accepted. Search live claims, PRs, unit metadata, and
`Bots/notes/` for the same declaration before granting a claim.

## Acceptance criteria

- `unit.json` records the exact declaration, source revision, dependencies, and
  contributors, with status `draft`.
- The statement spells out the sequence/recurrence, parameter range, constants,
  quantifiers, asymptotic regime, and strength of comparison exactly.
- Every substantive estimate is proved in detail or supplied by a precisely cited
  and hypothesis-checked result.
- The note states clearly what the result does and does not establish about a
  physical running coupling, with no extrapolation beyond the formal statement.
- Source correspondence and commands actually run are recorded.
- `python3 scripts/check_blueprint.py` passes. Separate, independently owned
  Lean-correspondence and mathematical-review issues are required before
  `reviewed` status.

