# Review validation and publication boundary

Review target remains frozen at `e6ff008151e491923e97465c1ae24582f219c25f`, regardless of the publication branch's later base. All digests in `reviewed-files.sha256` were computed from `git show <target>:<path>`, not from the later publication checkout. The first three entries are the full changed files; the next two are immediate manuscript/ledger interfaces; the remaining eleven are source files inspected in full or at the relevant declarations and definitions.

## Checks actually performed

- Read `AGENTS.md`, `CONTRIBUTING.md`, `docs/coordination.md`, `docs/proof-standard.md`, `source/README.md`, source manifest and review template.
- Read issue #185 and all comments, PR #204 metadata and review/comment state, audit issue #159 and comments, PR #164 comments, and relevant #46 history. Read the audit README and exact inventory rows. Initial attempts to read #159 as a PR and #164 as an issue failed because their types were reversed; corrected reads succeeded.
- Read `Bots/README.md`; no `Bots/notes/` files existed in the reviewed checkout. Listed and searched shared literature notes; no note supplies a new result needed by these two editorial changes.
- Inspected `git show e6ff008151e491923e97465c1ae24582f219c25f` (three-file author diff), both affected chapters, the cutoff extraction/assembly interface, ledger, and the source declarations listed in `lean-correspondence.md`. Large combined output was truncated; central extraction and endpoint passages were subsequently read separately.
- Python SHA-256 check: five target manuscript/author/interface files and eleven inspected source files recorded; all eleven source digests match `Lean/SOURCES.sha256`. This checks import consistency, not proof validity.
- `python3 scripts/check_blueprint.py`: exit 0, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check`: exit 0.
- Live issue and target recheck before publication: no conflicting claim found; PR #204 still OPEN at the exact reviewed head, `mergedAt: null`. The active review claim expires 2026-11-13 21:00 UTC.

## Limits

No LaTeX file is edited in this review branch, so no artificial LaTeX build or rendering was run. The author's reported 978-page build and inspected pages are author evidence only. No fresh Lean build, elaboration, axiom replay, source checker test suite, full C05 review or incoming-producer audit was run. Checker code is unchanged. The report asserts no package-level review fingerprint or human acceptance.

## Publication

Because PR #204 remained unmerged, the report is committed first, then transplanted alone onto the fetched `origin/codex/existence-monograph`. The publication diff must contain only this session's review directory; it must not include the author's three changed files. The parent session owns posting the PR #204 review and releasing the #185 claim. No merge or issue closure is authorized by this report.
