# Instructions for contributing agents

## Start here

Read `CONTRIBUTING.md`, `docs/coordination.md`, and `docs/proof-standard.md`.
Read the task issue, its comments, linked PRs, and relevant `Bots/` notes.
Do not read the whole Lean tree into context. Begin with the task's declarations,
their definitions and immediate dependencies, and expand only as needed. The
editorial target is a research monograph with detailed proofs and appropriate
literature references. The number of Lean declarations translated is not a goal.

## Scope and coordination

- Work on one bounded task per agent session with an unexpired self-claim posted
  on its issue. Follow `docs/coordination.md`: check for overlap, post `CLAIM`,
  then recheck before working. No coordinator approval is required. A branch,
  label, or unposted intention is not a claim.
- Maintainer-directed repository setup and explicit bounded maintenance requests
  do not require a queue claim. This exception does not reserve mathematical work.
- Use issue comments for claims, progress, questions, and handoffs; PR comments for
  review. Use `Bots/` only for concise knowledge that future sessions need.
- Recheck the live issue before starting, on resuming, and before submitting.
  Stop substantial work at expiry unless you have posted a valid renewal after
  rechecking for overlap; renewal does not need manual approval.
- Respect the task's declared outputs. Request a split or new task for discoveries
  outside scope. Shared files such as the outline and glossary have their own tasks.
- Give each concurrent agent a separate worktree or clone and a distinct session
  identifier. Subagents stay within the parent's claim and have disjoint outputs;
  the parent owns their integration and reports their involvement.
- If GitHub access is unavailable, prepare a claim comment or handoff for the
  contributor to post. Do not infer ownership from a stale local checkout.
- Use the contributing human's authorised GitHub authentication or the designated
  project App. Never request or share the repository owner's token; keep credentials
  out of prompts, notes, and commits. See `docs/access.md`.

## Mathematical integrity

- Preserve `Lean/` and its pinned toolchain and dependencies. Changes to upstream
  code belong in an explicitly assigned source-maintenance task.
- State exact hypotheses, quantifiers, spaces, and conclusions. Inspect definitions
  and instances; never infer mathematical meaning from a declaration's name.
- Cite fully qualified declarations, source revision, and paths. Line numbers are
  supplementary. Distinguish inspected evidence from conjectured interpretation.
- Search the shared literature notes and original mathematical sources before
  developing a proof. Prefer a verified existing result to rederiving it. Cite the
  precise version and check its hypotheses, definitions, and conventions here.
- Give detailed proofs for all substantive steps not supplied by applicable cited
  results. Explain how cited results apply, and prove any extra step or variant.
  A proof outline or a description of the new ideas alone is insufficient.
- Omit Lean implementation scaffolding from the monograph. Group routine formal
  helpers by their mathematical purpose; do not assign one prose unit per helper.
  Inspect enough of the source to justify the grouping. Uncertain classifications
  remain open questions, not permission to omit mathematical content.
- Keep source correspondence and audit details in the blueprint. Write the main
  manuscript in ordinary mathematical language with conventional references.
- Record gaps and assumptions explicitly. Do not invent an argument to fill a gap.
- Separate formal assumptions, theorem hypotheses, and external background results.
  Never suppress axiom findings or change statements to make checking succeed.
- Reuse canonical proof units and notation. Request new ownership rather than
  duplicate an existing explanation.

## Deliver and review

- Write the authoritative mathematical text directly in `manuscript/*.tex` or
  its subdirectories. Follow `templates/proof-unit/` for the linked blueprint
  record, correspondence, and evidence; do not duplicate the proof in Markdown.
  Drafts may use precisely stated outstanding inputs; do not wait for the whole
  blueprint or all prerequisite proofs to be complete.
- Record commands actually run and their results. Unrun checks remain unrun.
- Run `python3 scripts/check_blueprint.py` for blueprint changes. Run the test suite
  when changing that checker. Build changed LaTeX and check the rendered pages.
  Lean commands must match the pinned upstream project.
- Treat all new prose as a draft. Independent Lean correspondence and mathematical
  reviews are needed for `reviewed` status; never approve your own work.
- Material edits invalidate review fingerprints. Do not refresh another reviewer's
  approval yourself; obtain renewed review.
- Submit one focused PR and a short handoff, including remaining uncertainties.
  Do not merge, relicense, or publish results unless explicitly authorised.
