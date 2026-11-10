# Launching and maintaining the project

## Prepare GitHub

- Follow the [access guide](access.md): individual accounts, forks for ordinary
  public contributors, and elevated roles only for trusted coordinators/integrators.
  Keep owner credentials private. Consider organisation ownership when a separate
  Triage role would help distribute coordination without granting content write access.
- Choose licences for original exposition and tooling before inviting contributions.
  Preserve the upstream formalisation's licence and notices separately.
- Push this scaffold to the default branch. Enable Issues and Actions. The included
  workflow checks repository structure; it does not build or certify the Lean proof.
- Protect `main`: require PR review and the `Blueprint structure` check, require
  branches to be up to date before merging, and dismiss stale approvals. This
  matters when two individually valid PRs claim the same declaration.
- Create the labels below. Name coordinators in task issues and announce changes
  of coordinator explicitly. Contributors can request assignments by commenting;
  coordinators need collaborator access on a personal repository, or Triage or
  higher on an organisation repository. See the [access guide](access.md).
- Keep a small ready queue and invite a pilot group. Expand after reviewing one
  complete unit and adjusting the task size and proof standard.

Suggested labels:

| Group | Labels |
| --- | --- |
| Status | `status:proposed`, `status:ready`, `status:claimed`, `status:blocked`, `status:in-review`, `status:done` |
| Kind | `kind:audit`, `kind:map`, `kind:literature`, `kind:explain`, `kind:review-lean`, `kind:review-math`, `kind:integrate`, `kind:tooling` |
| Priority | `priority:critical`, `priority:normal` |

Issue forms and the PR template are included. The labels, branch rules, live
issues, and GitHub settings must be configured separately; creating files locally
does not activate those settings.

## First tasks after release

Create these as separate issues, with concrete outputs and named coordinators.
Do not invent theorem names or mathematical divisions before inspecting the source.

| Task | Deliverable | Prerequisites |
| --- | --- | --- |
| Import and reproduce | Fixed upstream snapshot, provenance, build recipe and logs in `source/` | Release and redistribution terms |
| Audit target statements | Exact final declarations, definitions, hypotheses, scope and axiom report | Imported source; build for full audit |
| Extract dependency data | Reproducible declaration inventory and target dependency closure | Pinned environment and identified targets |
| Identify reusable literature results | Checked references, matched hypotheses, and shared background notes | Identified mathematical interfaces |
| Design the proof map | Conceptual units, literature interfaces, prerequisites, notation, and first ready issues | Statement audit; dependency data; initial literature search |
| Develop a pilot proof unit | Detailed proof using applicable references, with independent Lean/mathematical reviews | Stable interface and a claim |
| Assemble an initial chapter | Connected exposition with explicit dependency status | Reviewed pilot and adjacent units |

Static statement inspection can start while a central build runs. Avoid distributing
hundreds of explanation tasks before the target statement and proof interfaces
have been checked. Separate mapping and writing: many agents should reuse one
dependency index instead of independently rediscovering the whole project.

## Build the index once

Use the released project's pinned Lean version to inspect its compiled environment.
Extract fully qualified declarations, types, source locations where available,
and references from both declaration types and values. Retain provenance and
record missing/opaque information. A module import graph or text search is a
navigation aid, not an exact declaration dependency graph; automation can insert
dependencies not visible in tactic text.

Start with the final declarations' transitive closure. Distinguish mathematical
results from generated helpers, instances, and routine library machinery. Keep the
raw graph reproducible, then curate a much smaller conceptual graph in `blueprint/`.
Classify groups into results to prove, existing results to cite and apply, formal
scaffolding to suppress, and unresolved cases. Include project-local helper code
in this assessment: standard mathematics may have been formalised from scratch.
Search the literature before deciding to reconstruct a proof. Once an applicable
literature result is matched to its formal interface, its internal implementation
need not generate further exposition tasks. Retain the full graph for source audit.
Use stable names, not line ranges, as identities. Store large generated indexes and
build logs as revision-labelled artifacts with checksums; keep their provenance,
generation commands, and locations in Git.

The extractor is intentionally a post-release task: the correct implementation
depends on the actual toolchain, project layout, and available declaration metadata.

## Integrate and maintain

Maintain an outline and glossary through dedicated tasks. Authors link to shared
definitions instead of redefining them. State the intended reader's prerequisites
in the outline. Integrators check that every substantive step has a detailed proof
or an applicable literature reference, hypotheses match at interfaces, and all
remaining gaps are visible. Routine formal helper coverage is not a completion
metric. Local reviews are not a substitute for this global check.

Before changing an accepted dependency statement, identify its reverse dependencies
and open re-review tasks for affected uses. This includes changing the statement
or applicability of a shared literature result. The local fingerprint checker does not
automatically determine whether a changed dependency invalidates a downstream proof.

Keep upstream frozen during an explanation wave. Import updates in a dedicated
PR, compare declarations and dependencies, and explicitly migrate or invalidate
affected explanations and reviews. Do not silently replace the source beneath
contributors. Record mathematical/editorial decisions in Git and link the issue
that established them.

Monitor reviewed units, unresolved gaps, high-impact prerequisites, and review
backlog. If review is the bottleneck, recruit reviewers before adding more writers.
