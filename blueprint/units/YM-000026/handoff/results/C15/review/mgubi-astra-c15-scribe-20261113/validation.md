# Validation and review limits

Session `mgubi-astra-c15-scribe-20261113`, 2026-11-13.
Worktree `/tmp/ym-astra-c15-scribe-20261113` (macOS resolves it under
`/private/tmp`), branch `codex/astra-c15-scribe-review-20261113`, base
`e058a615f318232519f871e6ee4d8054367b5a1a`.

## Commands actually run

| Check | Result |
| --- | --- |
| `git status --short` on entry | Clean isolated worktree. |
| Reads with `cat`, `sed -n`, `nl -ba`, `rg -n` | Read repository instructions and review contract/template; issue56 all comments; PR105 body/comments/reviews; author part-B records and chapter evidence; both complete target chapters; relevant source declarations and immediate manuscript interfaces enumerated in the reports. Large truncated tool outputs were followed by focused declaration reads where needed. |
| `gh issue view 56 --repo hairer/humanise-yang-mills --json body,comments` | Initial sandbox network attempt failed; authorized elevated read succeeded. Parent claim was live, with no overlapping successor. |
| `gh pr view 105 --repo hairer/humanise-yang-mills --json body,comments,reviews,headRefOid` | Succeeded; target head `f8022ce0705481b246ee9f8ae933f79848d4320d`; existing bounded review PR107 kept separate. |
| `rg -l 'scribe\|Prosper\|C15\|trace' Bots blueprint/background` and background/README reads | No directly applicable literature supplier located; Bots contains only its README at this base. No new proof from an external literature result was developed. |
| `head -20 source/upstream.sha256` | Failed: guessed path absent. Located actual imported manifest `Lean/SOURCES.sha256` using `rg --files`; integrity check below uses that manifest. |
| `shasum -a 256` on both targets; `git show <PR105-head>:<scribe-path> \| shasum -a 256` | Both target hashes equal the author handoff. PR105 byte identity for both targets is additionally checked by the script below. |
| `python3 blueprint/units/YM-000026/handoff/results/C15/review/mgubi-astra-c15-scribe-20261113/check_integrity.py` | PASS: 2 target files, 39 source files, 13 interface/evidence snapshots. Revision and toolchain match source/upstream.json; targets exactly equal PR105 bytes and author hashes; every inspected source file equals its entry in Lean/SOURCES.sha256. |
| `python3 scripts/check_blueprint.py` | Exit 0: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `git diff --check` | Exit 0. Staged report files checked again before commit. |
| `gh issue view 56 --repo hairer/humanise-yang-mills --json comments --jq '.comments[-3:] \| .[] \| {url,createdAt,body}'` before submission | Succeeded; the parent's scribe claim remains the latest comment, unexpired, and disjoint from the released PR107 scope. |

The hash manifest covers **files**, not a claim that every line of every source
or interface file was reviewed. The two target chapters were read in full;
source/interface scope is the declaration/statement list in
lean-correspondence.md. Integrity verifies bytes, not mathematical validity.

The initial `git add` could not create the worktree index lock because its
metadata lives in the protected main checkout `.git/worktrees/` directory.
Staging/commit/push use the authorized escalation; this is not a content-check
failure.

## Explicitly unrun or outside scope

- No Lean build, fresh elaboration, `#print`, `#print axioms`, or kernel replay.
  No alteration to Lean, the pinned toolchain or dependencies. The separate
  clean-build/source-trust audit is not repeated.
- No new LaTeX build, PDF render or visual inspection: this is a report-only
  review, and no mathematical LaTeX was changed. The author's build claims
  were read but not independently rerun or adopted as proof evidence.
- No full review of sensor33, branch34, the other eighteen C15 chapters, the
  C14 producers, or whole-argument dependency closure. Immediate statements
  were read at the frozen versions, and remaining dependencies are explicit.
- No refresh of another reviewer's fingerprints, no status change to reviewed,
  no human acceptance, no merge or publication.

Only this session's assigned review directory is a writable output. The parent
will inspect the delivery, post the PR105 review, and release its issue claim.
