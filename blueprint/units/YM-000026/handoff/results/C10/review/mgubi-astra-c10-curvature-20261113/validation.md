# Validation and review provenance

Review session began 2026-11-13 15:06 UTC, with a 75-minute active-work limit.
The report was prepared within that limit. Parent delegation and ownership:
https://github.com/hairer/humanise-yang-mills/issues/146#issuecomment-6856854049
(until 18:00 UTC). Separate worktree and branch:
`/tmp/ym-astra-c10-curvature-20261113`,
`codex/astra-c10-curvature-review-20261113`.

## Checks actually run

- Read `AGENTS.md`, `CONTRIBUTING.md`, coordination/proof-standard documents,
  source README and audit provenance, review template, relevant Bots index,
  shared background index, C10 task/contract/prompt and part-A records. Read
  issue 146 and its comments, issue 51 author history and PR 95 context. The live
  pre-submission recheck found the issue-146 claim unchanged and unexpired;
  issue 51 is closed, PR 95 is merged at
  `e1b730e585052f18ba630e1e0448098f16064795`. Subsequent annulus revisions and
  reviewers 143/145/147 are outside these report outputs.
- Read all three manuscript chapters, expanding truncated output with focused
  reads, and inspected the immediate source definitions/proof steps listed in
  `correspondence.md`. Supplier interfaces were checked only as needed, rather
  than certifying all supplier chapters.
- `git rev-parse HEAD` returned
  `ddc3c90f7fcc4e10048b173e58d41f25f0107730`. Initial `git status --short` was
  empty. No tracked source or manuscript file was edited.
- Python SHA-256 calculation produced the three hashes in `hashes.json`; they
  agree with the final part-A author snapshot. The 34 source files in
  `inspected-source.sha256` each matched `Lean/SOURCES.sha256` exactly. A file
  appearing in this manifest means relevant contents were inspected, not that
  every declaration in that source file received a full independent review.
- `python3 scripts/check_blueprint.py --fingerprint YM-000026` returned
  `ed009c136a8203ceccaf24cde9289ea68be414598004610e221faff9ceaa6f32`.
  This is checkout identification, not a whole-unit review fingerprint being
  approved. `scoped_sha256` hashes the UTF-8 compact, sorted-key JSON encoding
  of the `files` array, with separators `(',', ':')`.
- `python3 scripts/check_blueprint.py` passed: `Blueprint structure OK: 4 units.
  Lean and mathematics were not verified.`
- `git diff --check` passed; the staged check is repeated before commit so newly
  added reports are also included.
- Parent read both substantive reports and requested no changes before submission.

## Checks not run and limits

No Lean elaboration, clean rebuild, axiom replay, checker test suite, or LaTeX
build/render was run. This task changes only review reports; there is no changed
LaTeX to build, and the source inspection found no visual ambiguity requiring a
scratch rendering. The blueprint checker is unchanged. Prior author builds and
prebuilt-artifact evidence were consulted as prior records, not rerun or claimed
as this review's verification.

No external literature result was used as an unverified supplier. The reviewed
steps are supported by the displayed local proofs and inspected source/interface
statements. This does not certify all imported dependencies, the global C10/C11
contracts, or an unconditional existence theorem. Human acceptance remains unset;
no old approval or review fingerprint has been refreshed.
