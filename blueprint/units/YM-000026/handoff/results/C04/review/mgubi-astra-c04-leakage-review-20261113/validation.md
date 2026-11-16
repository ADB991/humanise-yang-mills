# Validation for the C04 row-only review

Target `9e7326b832793a0a8db6d08d045e024874f1178b`; parent `2017d6f3ee648beb054322e9b994eb3c757cbcf6`; source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Separate workspace `/tmp/ym-astra-c04-leakage-20261113`; branch `codex/astra-c04-leakage-review-20261113`.

## Actual checks

- Read current repository instructions and source README; read full issue 184/comments and PR 203 body/comments/reviews/files. Read relevant issue-45 history and PR 91's body and report. The audit issue/PR discussion had been read in the preceding bounded C02 session; for this task, inspected the frozen source-leakage README and inventory row 58 directly. Searched Bots and shared background notes and read the OS note's coordinate-comparison entries.
- `git diff HEAD^ HEAD` confirms exactly two author outputs: a one-clause deletion in `complex-heat.tex` and the new row-response record. Focused `cat`/`sed`/`rg` reads inspected the coordinate paragraph, statement convention, three Euclidean insertion exceptions and immediate pinned definitions listed in `lean.md`.
- Exact byte comparison: replacing `, as does the formal source` by the empty string in the parent chapter yields the target chapter, with no other change.
- Verified both author chapter hashes: parent SHA-256 `f22685be41a0255a1441ad4d98ddef46666e32f293ed4979ffebf7ee98b46ad0`; target SHA-256 `6244fe9aeec28cc871a96662141af784845d663a62b853d48de0af3a9128abd1`.
- `python3 .../verify_inputs.py`: **PASS: 15 frozen file hashes/blob IDs; unchanged target/parent Lean tree. PASS: exact one-clause deletion and both author chapter hashes.** The verifier uses `git show` at the immutable target, not current integration-base files.
- `python3 scripts/check_blueprint.py`: **Blueprint structure OK: 4 units. Lean and mathematics were not verified.**
- `python3 scripts/check_blueprint.py --fingerprint YM-000026` at the frozen target: `2fa8001623b9ddd015fa5c5167bd378cf1a6a81f239bb66494084c6153433598`. This unit fingerprint is not acceptance of all C04 content.
- `git diff --check`: clean; staged/final whitespace and report-only scope checked during submission.
- Rechecked live issue 184, PR 203 and latest issue-45 handoff before submission: target still OPEN at the exact reviewed head, no conflicting reviewer claim; author scope remains disjoint. Parent owns the PR review and release.

`inputs.json` SHA-256: `c39d6c92f96a37ba8767a9ca1a46dbbeb894ccbc9443b7a41c3bcef70f4d967b`.

The report commit is transplanted alone to fetched `origin/codex/existence-monograph` because PR 203 is unmerged. Only five session-owned review/evidence files enter this PR; the frozen author changes do not. The verifier remains tied to the target commit after transplantation.

## Unrun checks and limits

No fresh Lean build, elaboration, axiom report, kernel/Comparator replay or transitive proof audit. No new LaTeX build or render: this session changes reports only. The author's 978-page build and inspected page 175 are attributed historical author evidence, not rerun or independently certified here. No checker test suite (checker unchanged), no new external-paper verification, no global C04 acceptance or source validation. The small evidence verifier itself was executed. No old review fingerprint, author record or manuscript was changed. Human acceptance remains unset.
