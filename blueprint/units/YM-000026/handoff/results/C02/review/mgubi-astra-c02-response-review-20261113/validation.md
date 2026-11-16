# Scope, provenance and actual validation

Session: `mgubi-astra-c02-response-review-20261113`; separate worktree `/tmp/ym-astra-c02-response-20261113`; branch `codex/astra-c02-response-review-20261113`. No child agents. Parent owns issue/PR review posting and claim release. Reviewer owns only this directory.

The target is PR168 head `6005f350dfab5abdeb57f5602a1d81b78fd565f5`, with merge base `97128ab3e9157aceaa22690dc2a3075819c38068`. The first live PR read returned base `bee45a795ca4c81fb1ddf44f55ee06abbd3cbfad`, head unchanged, state OPEN, eight changed files and no comments/reviews. The parent subsequently reported that PR168 merged at the same head. The review remains on frozen bytes regardless of merge status.

## Scope and inherited evidence

The complete response diff and four changed author records were read. Source inspection was limited to changed claims and immediate definitions/applications. `hashes.json` freezes all eight changed files, four immediate manuscript supports, and selected source files; a file hash is not a claim of whole-file review. All seven payload hashes in `response-manifest-20261113.json` match committed and working bytes at the review target. That manifest's own SHA-256 is `877d5beeffcc4974dd06d7ea9ef8e3b01bed2506ef9bf7a313b32ccae9c562f4`.

The existing PR89 and PR94 reports and their issue handoffs are evidence of prior findings, not automatically renewed approval. The mathematical report identifies which requests this response resolves and which it leaves open. The old twelve-chapter manifest is historical, not a manifest of this response. No review of the other eight C02 chapters is inferred from unchanged bytes. The unit fingerprint identifies the assembly at the target but does not turn this into a whole-unit review.

Read-only orientation included AGENTS.md, CONTRIBUTING.md, coordination/proof standards, source README/manifest, review template, C02 handoff/common contract/known open edges/upstream-evidence and agent prompt, issue43 and its comments, PR168/89/94 bodies and comments/reviews, the prior reports, and author records. Relevant `Bots/` and shared-background searches produced no new theorem used by this review. No original-paper or external literature verification is claimed; the unchanged citation concerns remain outside scope.

## Commands actually run

- `gh issue view 43 --repo hairer/humanise-yang-mills --json body,comments`: read live discussion and parent claim, including its disjoint author/reviewer outputs and expiry. An initial sandboxed API call failed with a connection error; the authorized escalated read succeeded.
- `gh pr view 168 --repo hairer/humanise-yang-mills --json body,comments,reviews,files,baseRefOid,headRefOid,state`: froze live target; `gh pr view 89` and `94` with body/comments/reviews read the earlier reviews. Temporary JSON snapshots were outside tracked outputs.
- `git diff bee45a795ca4c81fb1ddf44f55ee06abbd3cbfad...HEAD -- <four changed chapters>` and `git merge-base ... HEAD`: inspected the full response delta and established the merge base above.
- Targeted `rg`, `sed`, and `cat` reads: checked the declarations/applications enumerated in `lean.md` and the mathematical immediate supports. Some exploratory searches named absent `Lean/YM/Daisy`, `Photo.lean`, `Trees.lean` or an unmatched `Lean/YM/Cluster*` glob; those lookups failed and were replaced by the exact paths. They made no changes. Large combined outputs were sometimes truncated, so the relevant sections were reread in smaller extracts; no full-tree read was performed.
- Python SHA-256 comparison of `git show <target>:<path>` with current bytes: all eight response files, all seven author manifest entries, and frozen immediate supports/source files matched. `verify.py` retains the committed-object checks so that publication on a newer base does not silently change the reviewed target.
- `git rev-parse HEAD HEAD:Lean <target>:Lean`: target head and unchanged Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.
- `git diff <target> --exit-code -- Lean source/upstream.json`: exit 0, no tracked source or pin change.
- `python3 scripts/check_blueprint.py`: **passed, four units**. It explicitly does not verify Lean or mathematics.
- `python3 scripts/check_blueprint.py --fingerprint YM-000026`: `ee353221a7064daba28025fcc0fea26646e8aab7172d56dd312971bf73c35c28` at the frozen target.
- `git diff --check`: **passed** before report staging; staged/committed checks are repeated for submission.

## Checks not performed

No LaTeX or PDF build/render was run: this is a report-only review, with no manuscript edits, permitted by COMMON-CONTRACT.md. The author's older 970-page record and later 971-page PR-body claim are attributed validation, not replayed or independently verified by this reviewer. No repository test suite was rerun because neither checker nor implementation changed. No Lean build, elaboration, axiom audit, kernel replay, Comparator run, full transitive source audit, or global producer/consumer closure check was run. No approval metadata is written.

## Submission

The submission recheck of issue43 found no new overlapping claim. PR168 was MERGED with unchanged head `6005f350dfab5abdeb57f5602a1d81b78fd565f5`, merge commit `66fe4133312c920a8fa4fbc186870ebbf6051171`, and no PR comments/reviews. `git fetch origin codex/existence-monograph` updated the local base to `d4af2b7`. The response is therefore already in the target branch; no author commits need publication through the report PR.

`python3 <this-directory>/verify.py` passed: **42 frozen file hashes, all seven author payload hashes, source pin/tree, and unchanged current tracked source**. The blueprint checker was rerun successfully. The report is staged and whitespace/scope checks are repeated for submission. The frozen checks use `git show` at the review target, so publication against a newer base cannot retarget this verdict. Parent inspection, PR review posting and issue claim release remain separate from this reviewer report PR.
