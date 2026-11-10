# Coordinating parallel work

GitHub is the live coordination channel. Repository files are durable knowledge,
not distributed locks. A local `Bots/` message is invisible to other contributors
until it is published, and may not be merged into their branch.

| Information | Canonical home |
| --- | --- |
| Scope, claim, expiry, progress, blockers, handoff | One task issue and its comments |
| Proposed edits and review discussion | Pull request and its comments |
| Cross-cutting question or policy decision | Dedicated issue, linked from affected tasks |
| Accepted statements, dependencies, explanations | `blueprint/` |
| Reusable literature results and source matches | `blueprint/background/` |
| Durable discoveries, failed approaches, resume notes | `Bots/notes/` |
| Integrated exposition | `manuscript/` |

Use a GitHub Project to display the issue queue through saved views. The existing
issue labels and explicit claim grants remain authoritative. GitHub-hosted agent
sessions are an optional execution route, with claims granted before launch.
See [Projects and Agents](github-features.md) for setup and dispatch rules.

## Define tasks before distributing them

Each issue names a coordinator, task type, source revision, exact declarations or
mathematical interface, owned output paths, prerequisites, and acceptance criteria.
The coordinator checks existing issues, PRs, and proof-unit metadata for overlap
before marking it ready. Reserve shared outline/glossary edits separately.

For mathematical tasks, specify the intended treatment: prove in detail, cite and
apply an existing result, suppress formal scaffolding, or investigate an unresolved
classification. Consult shared literature notes before commissioning a proof.
Classify coherent results or groups of helpers; do not make a writing task for
every declaration in the formal dependency graph. A literature task can serve
many proof units and should have one shared output.

Use one `status:` label at a time:

`proposed → ready → claimed → in-review → done`

Use `blocked` while a prerequisite or unresolved question prevents progress.
The issue records the reason and next action. A blocked worker releases the claim
if it cannot make useful progress. On resolution, the coordinator returns the
task to `ready`. A rejected review returns it to `ready` or to its still-valid
claim; it does not silently reactivate an expired claim.

Task types are `audit`, `map`, `literature`, `explain`, `review-lean`, `review-math`,
`integrate`, and `tooling`. Explanation tasks require the relevant proof details.
Reviews are distinct tasks with different owners. Several authors
can work on different units, and reviewers can work on finished units concurrently.

## Claim protocol

Initially, one designated coordinator serialises grants for each issue. The issue
body names that coordinator; its creation and coordinator changes are confirmed
by a repository maintainer. If another coordinator takes over, record the handover
before granting further claims. Assignment and labels are useful summaries;
the coordinator's explicit grant is authoritative.

Request a claim in an issue comment:

```text
CLAIM REQUEST
Session: <GitHub account>-<agent>-<unique suffix>
Scope: <task and owned output paths>
Until: <YYYY-MM-DD HH:MM UTC; normally within the next 24 hours>
Plan: <two or three sentences>
```

The coordinator checks for overlap, then posts:

```text
CLAIM GRANTED
Session: <exact session identifier>
Scope: <agreed task and paths>
Until: <YYYY-MM-DD HH:MM UTC>
```

The grant comment's URL is the claim identifier. The coordinator records the
GitHub account as assignee and changes the label to `status:claimed`. A new grant
must not overlap an existing unexpired grant. A claim request, a self-assignment,
or the first comment on an issue does not authorise work by itself.

Default claims last at most 24 hours. Workers recheck the issue on starting,
resuming, and submitting, and stop at expiry. Renewal requires a new explicit
grant before further work. Coordinators may reassign after expiry, or after the
holder explicitly releases; do not revoke a live lease and immediately give the
same work to someone else. Label an abandoned task ready only after that point.

On release or completion, link the branch/PR and give a handoff. A draft PR
preserves partial work but does not renew a lease. Coordinators inspect that work
before assigning a successor. Only claim work you can begin now.

## Keep communications useful

Issue comments should contain findings and decisions, not token-by-token activity.
Use qualified declaration names in comments so other agents can search them.
Link related issues instead of copying discussions. Record durable conclusions
in the relevant proof unit or `Bots/` note; chat history alone is not the project
knowledge base. Recheck conclusions against the source when reusing an old note.

Issue scope changes require a recorded decision and agreement from the active
holder. Deliberately duplicated work, such as independent verification, must be
labelled as such and budgeted explicitly. Do not have every agent rebuild the full
project: share versioned audit logs and immutable build artifacts where supported.

## Scaling the coordinator

Begin with a small pilot and enough ready tasks for the next wave of contributors.
Assign area coordinators as the mathematical decomposition stabilises, while
keeping one grant authority per issue. This is human-confirmed coordination;
there is no automatic lock or claim bot in this scaffold.

If claim traffic becomes a bottleneck, add a bot that serialises requests, stores
the granted session and expiry, rejects conflicting grants, and acknowledges
renewals/releases. Specify and test those semantics before deployment. GitHub
workflow concurrency alone is not a complete claim protocol. The bot should
handle issue metadata without running contributor-supplied code with write access.
