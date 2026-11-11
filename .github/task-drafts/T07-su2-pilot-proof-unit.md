# [Task] Pilot proof unit: SU(2) simplicity and concrete specialisation

**Suggested labels:** `kind:explain`, `status:blocked`, `priority:normal`

## Task kind

Explain.

## Proposed coordinator

`@hairer` (must be confirmed by a maintainer when this issue is published).

## Mathematical interface and source scope

Write the pilot exposition for provisional PU-28, anchored at
`YangMills.su2Simple` and `YangMills.su2Theory` in `Lean/ConcreteSU2.lean`, source
revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Explain the exact final
specialisation from the generic public theorem to the concrete SU(2) object.

When this draft is published, replace the output placeholder below with
`blueprint/units/YM-<six-digit issue number>/`; that issue number is the canonical
unit ID.

## Expository treatment and literature search

Use T04's verified reference for the standard SU(2) simplicity fact and prove the
project-specific matching and specialisation steps in detail. Write for the
research monograph: ordinary mathematics in manuscript LaTeX, with Lean correspondence
and audit detail kept in the unit metadata and correspondence sections. Suppress
only implementation scaffolding shown not to carry mathematical content.

## Owned outputs and exclusions

- Own `blueprint/units/YM-<this issue number>/` and
  `manuscript/sections/su2-specialisation.tex`, using `templates/proof-unit/`.
  Include the section in `manuscript/main.tex` as a bounded integration edit.
- Cover the two named declarations and the bounded definitions/instances required
  to interpret their specialisation.
- Depend on the audited generic public theorem as an interface; do not reproduce
  `YangMills.jointExistence`, the RG construction, or unrelated SU(2) background.
- Do not edit shared outline, glossary, background, or other manuscript files. Request a
  separate task for a discovered shared-file correction.

## Prerequisites and overlap search

Blocked until [#2](https://github.com/hairer/humanise-yang-mills/issues/2)'s
build/axiom evidence,
[#3](https://github.com/hairer/humanise-yang-mills/issues/3)'s statement audit,
and [#5](https://github.com/hairer/humanise-yang-mills/issues/5)'s SU(2)
literature note are accepted. Search live claims, PRs, existing unit metadata, and
`Bots/notes/` before posting a self-claim.

## Acceptance criteria

- `unit.json` names the exact source revision, owned declarations, dependencies,
  agent/human contributors, and current `draft` status.
- The LaTeX section states the concrete object and theorem exactly and gives every
  project-specific step in the specialisation. The cited standard theorem has a
  precise locator and its hypotheses are checked.
- The prose does not imply that simplicity supplies the generic Yang--Mills
  existence proof or any unstated mass-gap result.
- Source correspondence names all meaning-relevant definitions and instances and
  distinguishes inspected evidence from interpretation.
- `python3 scripts/check_blueprint.py` passes; all other commands actually run are
  recorded with outcomes.
- Completion produces a draft only. Separate, independently owned
  `review-lean` and `review-math` issues are required before `reviewed` status.

