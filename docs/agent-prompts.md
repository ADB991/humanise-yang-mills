# Instructions to give your agent

Replace the bracketed fields. Give the agent a fresh clone or worktree, access to
the task issue, and an explicit compute/time budget. These prompts work without
assuming a particular agent product or multi-agent feature.

Authenticate through your own GitHub account before starting; see the
[access guide](access.md). Never include a token in these prompts. Public
contributors normally work in a fork without collaborator access to the main repo.

## Contribute one task

```text
Help with https://github.com/hairer/humanise-yang-mills.
Read README.md, AGENTS.md, CONTRIBUTING.md, and the linked coordination and proof
standards. My GitHub account is [ACCOUNT]; your unique session is [SESSION].
Your budget is [TIME/COMPUTE LIMIT].

Inspect the live issues and open PRs. Work on [ISSUE URL], or recommend one small
ready task suited to your capabilities if I have not specified an issue. Check
for existing work before proposing anything new.

You may post task-related claim requests, progress, questions, and handoffs under
my account and open a draft pull request on my behalf. Wait for the designated
coordinator's explicit, unexpired grant before substantial task work. If you
cannot access GitHub, prepare the messages for me to post and wait for the grant.
Do not treat a local Bots file or an unassigned issue as a claim.

After receiving the claim, use an isolated branch/worktree. Read only the relevant
source and expand through dependencies as needed. Preserve Lean/. Produce the
agreed deliverable with precise source citations, mathematical reasoning, and
explicit uncertainties. Follow the proof-unit template for explanation work.

Aim for a research monograph with detailed proofs. Search the shared literature
notes and original sources before developing a proof; prefer an applicable existing
result with a precise citation. Check its hypotheses here, and prove any extra
step or variant. Give detailed arguments for substantive steps not supplied by
references. An outline of the ideas is insufficient. Standard machinery may be
implemented from scratch in Lean; this does not require translating its proof.
Keep formal scaffolding out of the manuscript and source crosswalks in the blueprint.

Use issue comments for live coordination and PR comments for review. Preserve
useful durable discoveries in the proof unit or a concise Bots/ note. Request
new tasks for out-of-scope work. Stop at claim expiry or budget exhaustion and
leave a handoff; do not silently abandon unfinished work.

Run applicable checks and report the commands actually run. Submit one focused
PR linked to the task, report what remains unverified, and request independent
review. Do not merge, publish, or approve your own contribution.
```

## Review an existing unit

```text
Review [UNIT ID / PR URL] for [LEAN CORRESPONDENCE / MATHEMATICAL VALIDITY].
Read AGENTS.md, docs/proof-standard.md, the task discussion, and templates/review.md.
I authorise task-related GitHub comments and a review submission. Obtain the
review task's confirmed claim; use session [SESSION] and budget [LIMIT].

Check the pinned source and the actual argument independently. Do not rely on the
author's confidence or another agent's approval. Identify concrete errors, missing
hypotheses, unsupported steps, and unresolved dependencies. Separate definite
findings from questions. Record the exact content fingerprint you inspected.

Check that substantive steps have detailed proofs or verified, applicable literature
references. Inspect the cited statements and their hypotheses. Look for existing
results that could replace unnecessary rederivations, and for gaps disguised as
standard facts. Do not demand prose for helpers that serve only formal implementation.

Produce a review report with evidence and required changes. Do not silently rewrite
the author's work or mark the unit accepted. A human reviewer must take
responsibility for acceptance. Leave a concise handoff on the review issue.
```

## Coordinate a wave of work

```text
Help me coordinate [AREA] in humanise-yang-mills. Read the repository instructions,
the source audit, the current proof map, and the live issues and PRs. I authorise
you to create and update task issues and post coordination comments within this
area. Only grant claims on issues where a maintainer has designated you as the
coordinator. Do not merge PRs or publish mathematical conclusions.

Propose a small set of bounded tasks with exact interfaces, declarations, output
paths, prerequisites, and acceptance criteria. Search for overlap first. Give
priority to shared prerequisites and tasks that unblock other contributors.
Reserve shared editorial files separately. Do not guess theorems from filenames.

Classify mathematical interfaces before assigning prose: prove in detail, cite and
apply, suppress formal scaffolding, or investigate. Search for reusable literature
results and create shared reference notes. Do not distribute one translation task
per Lean helper. The output must give the full mathematical argument at research
monograph level, with detailed proofs for steps not supplied by cited results.

For your assigned issues, serialise claim grants, use explicit UTC expiries,
track blockers, and preserve handoffs. Never grant overlapping live claims.
Assign independent review tasks when drafts are ready. Measure useful reviewed
results and unresolved dependencies, not tokens spent or pages generated.
```

Codex supports repository instructions in `AGENTS.md` and isolated Git worktrees;
see the official [instruction guide](https://developers.openai.com/codex/guides/agents-md/)
and [worktree guide](https://developers.openai.com/codex/app/worktrees/).
For other tools, explicitly include the same repository instructions in the prompt.
