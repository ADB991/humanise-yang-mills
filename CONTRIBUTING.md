# Contributing

The unit of contribution is a bounded proof, literature search, source audit,
review, or tooling task. The final document should give detailed proofs at the
level of a research monograph. Useful contributions include locating an applicable
published theorem, checking its hypotheses, or identifying a gap in an interpretation.

## Before starting

For a public repository, use your own GitHub account and fork; ordinary contributors
do not need collaborator access. Authenticate your agent under your account, and
never ask for or use the project owner's token. See the [access guide](docs/access.md)
for login options, coordinator roles, and private repositories.

Read [AGENTS.md](AGENTS.md), the [coordination rules](docs/coordination.md), and the
[proof standard](docs/proof-standard.md). Check the task issue, existing notes,
and open PRs before investing substantial compute. Read
[source/README.md](source/README.md) for the source version and build evidence.

Use an agent session identifier such as `alice-codex-01`. The contributor remains
responsible for the submission. Multiple sessions under one GitHub account must
have distinct identifiers and claims. Select a task that fits a single session;
split large tasks at mathematical interfaces rather than arbitrary line counts.

## Claim a task

On a ready issue, post the claim request described in
[coordination.md](docs/coordination.md). Wait for the named coordinator's explicit
grant with an expiry in UTC. Contributors without write access can request claims
by commenting; the coordinator manages assignment and labels.

Use the [agent prompt](docs/agent-prompts.md) to authorise your agent to post
task-related GitHub comments and open a PR on your behalf. If it cannot access
GitHub, post its prepared messages yourself.

## Work in isolation

Fork the repository, clone your fork, and add the canonical repository as `upstream`.
In a local clone with that remote, for example:

```sh
git fetch upstream
git worktree add -b codex/issue-123-session-01 ../ym-123-session-01 upstream/main
```

Replace `123` and the session suffix with your actual task and session. The branch
prefix is only a convention. Do not run multiple agents in one working directory
or share a writable Lean build directory between their worktrees. Prefer the
upstream project's supported dependency cache mechanism.

## Write a proof unit

First check the shared [literature notes](blueprint/background/README.md) and search
for existing results that supply the required steps. Use a precise reference when
it applies; prove the remaining steps in detail. A theorem formalised from scratch
in the upstream code may still be standard mathematics. Its Lean implementation
does not by itself justify a new exposition task.

The canonical extraction issue supplies the stable unit ID: issue 123 becomes
`YM-000123`. Later revision and review issues refer to that existing unit.
Copy `templates/proof-unit/` to `blueprint/units/YM-000123/`, fill `unit.json`,
and write `proof.md`. Replace every template placeholder.

The metadata names the declarations this unit owns, its dependencies, source
revision, and review state. Other units cite it instead of explaining those
declarations again. A source path identifies the location; the qualified name
identifies the declaration. Consult [blueprint/README.md](blueprint/README.md).

Post a useful checkpoint on the issue at least every four hours of active work
and before stopping. Include exact findings, blockers, and a branch or draft PR.
Request renewal before expiry if needed. A progress comment does not renew a claim.

## Submit and hand off

Run the structural checker and relevant, documented Lean checks. Push your branch
and open a focused PR using the supplied template. Link the issue with `Refs #123`;
do not automatically close the task when an unreviewed draft merges.

On the issue, report the PR, what is established, what remains uncertain, and
what the next contributor should do. Put longer reusable findings in a uniquely
named `Bots/notes/` file and link it. Small incomplete drafts can be merged as
drafts when they preserve useful work; they do not count as finished proof units.

Review the mathematics separately from its correspondence to Lean. Reviewers
record the precise content fingerprint and supporting evidence. The coordinator
closes a task only when its stated acceptance criteria are met.

## Credit and reuse

List human contributors and agent assistance in the PR and proof unit. Cite
external mathematical sources precisely. Preserve upstream notices. The maintainer
must select the project's code and exposition licences before soliciting public
contributions; this scaffold does not make that choice on contributors' behalf.
