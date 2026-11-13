# Review validation and provenance

Session: `mgubi-codex-review82-20261112`, 2026-11-12 UTC.
Isolated worktree: `/tmp/ym-review82-20261112`.
Branch: `codex/review82-20261112`.

## Scope and coordination

The first claim was released after the post-claim recheck identified the earlier full-package reviewer. No substantive mathematical review preceded that correction. The replacement [claim](https://github.com/hairer/humanise-yang-mills/issues/43#issuecomment-6835851191) explicitly labels this as a second, deliberately duplicated, bounded review, with separate outputs and a ninety-minute work budget. It does not take over the earlier reviewer. Issue comments were checked after posting and before submission.

The reviewed author head remains `93fd8657d90942fb17ba3298c755a73b0a642592`; GitHub reports PR82 merged into `codex/existence-monograph`. Merge status is not evidence of mathematical acceptance. The independent full review subsequently posted [PR89](https://github.com/hairer/humanise-yang-mills/pull/89). Its treasury-cutoff finding was independently checked and attributed in both reports; its other findings are not incorporated as this reviewer's conclusions.

## Commands actually run and results

- `gh pr view 82 --repo hairer/humanise-yang-mills --json headRefOid,state,baseRefName,url`: confirmed exact head, merged state and target branch. Earlier reads included author, body, changed files and review records.
- `gh issue view 43 --repo hairer/humanise-yang-mills --json comments ...`: read the live claim/review handoffs; the cached full issue and targeted recent-comment rechecks informed the bounded scope.
- `git fetch origin pull/82/head:refs/remotes/origin/review82-head`, followed by an isolated worktree on that ref: succeeded.
- `git diff HEAD^ HEAD -- manuscript/existence`: reviewed the PR delta, with targeted rereads of the finite-menu, construction and service chapters where the large output was truncated. This is not represented as a complete line-by-line audit of all twelve chapters.
- Targeted `rg`, `sed` and `nl -ba` reads inspected the source declarations and immediate joins named in `lean.md`. Shared literature notes were searched with `rg`; no external literature result was used to close the focused elementary calculations.
- `git rev-parse HEAD HEAD:Lean`: returned the author head above and Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.
- A Python `hashlib.sha256` check read each of the twelve paths in the author's manifest, computed its actual file hash, and asserted equality of the entire map. Passed; output is `hashes.json`.
- `python3 scripts/check_blueprint.py --fingerprint YM-000026`: returned `d3b1b8c18e25833946f4e760ad55e2156ecedcf5b166939f3d4e1dafbb8b3286`.
- `python3 scripts/check_blueprint.py`: passed: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check`: passed for tracked changes. The reports were subsequently staged and checked with `git diff --cached --check` before commit.

One attempted read of `templates/proof-unit/review/README.md` and a search of the not-yet-created review directory failed because those paths did not exist. The actual `templates/review.md` was then read. These were discovery failures, not failed mathematical checks.

## Checks not run

No new Lean build, Lean elaboration, or axiom audit. The versioned issue37 evidence is inherited, not recreated or strengthened by this review. No LaTeX build/render check: this change writes review evidence only, with no manuscript or bibliography edits. The author-reported 877-page build and render samples were not repeated. No tests of the blueprint checker, since the checker was not changed.

Only this review directory is changed. No author manuscript, author record, other review, shared unit metadata, acceptance fingerprint, source, dependency pin, or toolchain is edited. These agent reports request a correction and record a limited independent inspection; they do not grant responsible human acceptance.
