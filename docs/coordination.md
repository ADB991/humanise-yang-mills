# Coordinating parallel work

GitHub is the live coordination channel. Repository files are durable knowledge,
not distributed locks. A local `Bots/` message is invisible to other contributors
until it is published, and may not be merged into their branch.

| Information | Canonical home |
| --- | --- |
| Scope, claim, expiry, progress, blockers, handoff | One task issue and its comments |
| Proposed edits and review discussion | Pull request and its comments |
| Cross-cutting question or policy decision | Dedicated issue, linked from affected tasks |
| Interfaces, dependencies, correspondence, review records | `blueprint/` |
| Reusable literature results and source matches | `blueprint/background/` |
| Durable discoveries, failed approaches, resume notes | `Bots/notes/` |
| Authoritative mathematical text, from first draft onward | `manuscript/` |

Use a GitHub Project to display the issue queue through saved views. The existing
issue comments are authoritative; labels and assignments are summaries. GitHub-hosted
agent sessions are optional, with a self-claim posted and checked before launch.
See [Projects and Agents](github-features.md) for setup and dispatch rules.

## Define tasks before distributing them

Each issue names a coordinator, task type, source revision, exact declarations or
mathematical interface, owned output paths, prerequisites, and acceptance criteria.
The contributor preparing or claiming it checks existing issues, PRs, and proof-unit
metadata for overlap. Any trusted contributor may publish a well-scoped task as
ready when its stated prerequisites are satisfied; labels can be updated later by
someone with permissions. Record readiness in the issue comment if necessary.
A blocked or disputed scope must be resolved before claiming. Reserve shared
outline/glossary edits separately. A coordinator helps resolve conflicts and
organize review; ordinary claims do not require their permission.

Writing starts directly in LaTeX once the local statement and input interfaces
are precise. The entire proof map and all prerequisite proofs need not be complete.
State outstanding mathematical inputs explicitly and track them in the blueprint.

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

Contributors are trusted to claim bounded work themselves. No manual grant or
renewal approval is required. Use this protocol:

1. Read the issue, all comments, linked PRs, and overlapping tasks/outputs. Check
   that the scope is ready and there is no unexpired claim on it. Inspect prior
   work before taking over an expired or released claim.
2. Post the following comment; its URL is the claim identifier:

```text
CLAIM
Session: <GitHub account>-<agent>-<unique suffix>
Scope: <task and exact owned output paths>
Until: <YYYY-MM-DD HH:MM UTC; at most 24 hours from posting>
Plan: <two or three sentences>
```

3. Re-read the live issue and overlapping tasks immediately after posting. If no
   conflicting earlier claim exists, begin. Update the assignee and `status:claimed`
   label if you have permission; otherwise the comment suffices.

The earliest valid claim comment wins an accidental race for overlapping scope,
including across issues. Use GitHub's creation timestamp, breaking ties by numeric
comment ID. The later claimant posts a release and chooses disjoint work. If the
scope or ordering is ambiguous, pause the overlapping work and resolve it in the
issues with the other contributor or coordinator. A GitHub comment is not an
atomic lock; the post-claim recheck is essential. A label, branch, or old request
alone never establishes ownership.

Recheck on starting, resuming and submitting. Before expiry, the holder may post
`CLAIM RENEWED`, naming the session, original claim URL, unchanged scope and a new
UTC expiry at most 24 hours ahead, after checking for conflicts. After expiry,
make a new claim and check for a successor first. A renewal cannot displace an
intervening valid claim. Progress comments and draft PRs do not renew a claim.
Keep the comment history; post corrections instead of silently editing expiries.

On completion, release, or inability to continue, post `CLAIM RELEASED` with the
claim URL and a branch/PR handoff. Only claim work you can begin now. Do not take
over a live claim without the holder's release. Review remains independent;
self-claiming does not permit self-approval, merging, or publication.

If GitHub access is unavailable, have the contributor post the prepared comment
and relay the live conflict check before substantial work. A local note is not a
claim. Maintainer-directed setup and bounded maintenance remain exempt from the
queue-claim requirement.

### Transition from manual grants

Existing unexpired grants retain their scope and expiry. Their holders can renew
under this protocol. Pending `CLAIM REQUEST` comments do not silently become
claims: post a new `CLAIM` and recheck. This repository-wide policy supersedes
legacy instructions to wait for a coordinator's grant in existing issues and task
drafts; their mathematical prerequisites, exclusions and acceptance criteria
still apply. No retroactive change to claim ordering is implied.

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

## Scaling coordination

Keep a small ready queue and assign area coordinators as the mathematical
organization stabilizes. Coordinators resolve disputed overlaps, help split tasks,
and arrange independent reviews; they are not an approval bottleneck for claims.
There is no automatic claim bot. If concurrency makes manual conflict checks
unreliable, add and test a bot that serializes self-claims without introducing
per-claim human approval. GitHub workflow concurrency alone is not a lock.
