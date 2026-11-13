# Validation and handoff

All commands ran in `/tmp/ym-astra-c15-20261113` (filesystem resolves to `/private/tmp/ym-astra-c15-20261113`), starting at `be0e87db8c520491d25145d3c61f61b97f0ff42d`, branch `codex/astra-c15-trace-review-20261113`.

## Actual checks

- `gh issue view 56 --repo hairer/humanise-yang-mills --json body,comments`: succeeded. Read all returned comments; author claim released and parent-posted bounded review claim valid. Rechecked before submission.
- `gh pr view 105 --repo hairer/humanise-yang-mills --json body,comments,reviews,headRefOid`: succeeded; head `f8022ce0705481b246ee9f8ae933f79848d4320d`; no PR comments or reviews returned at initial inspection.
- `cat`, `sed -n`, and `rg -n` focused inspections of the three manuscripts, the source files listed in `hashes.json`, the immediate supplier/consumer statements, author evidence/ledger, shared trace evidence and coordination/trust records. Source inspection was textual. Large output was sometimes truncated by the tool; relevant missing blocks (notably `Wick/Massive.lean` and supplier statements) were fetched separately. No whole Lean-tree ingestion.
- A Python SHA-256/`git show` comparison found all three reviewed manuscripts byte-identical to PR105 head, and all 24 inspected source files identical to their entries in `Lean/SOURCES.sha256`. Eleven read-only supplier/consumer files have frozen interface hashes.
- Reproducible retained check: `python3 blueprint/units/YM-000026/handoff/results/C15/review/mgubi-astra-c15-trace-20261113/check_integrity.py`: exit 0, `Integrity PASS: {'author': 3, 'source': 24, 'interface': 11}`; also confirms source revision/toolchain and author handoff hashes.
- `python3 scripts/check_blueprint.py`: exit 0, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check`: exit 0, no output. Repeated after final report additions.

No LaTeX was changed, so no artificial wrapper, PDF rebuild or rendered-page inspection was performed. No Lean build, elaboration, axiom query or verifier replay was performed. No network literature search was performed; no new literature theorem is invoked. Existing source audit and author rendering evidence are identified as inherited only.

## Prepared PR105 review / issue handoff

Independent bounded review of `trace-spectrum.tex`, `trace-profiles.tex`, and `trace-asymptotic.tex` at PR105 head f8022ce finds no local mathematical or textual Lean-correspondence defect. The spectral undamping and full Schwartz boundary identification, radial-moment bootstrap (including exceptional remainder order), exact finite mass-shell class, coefficient `3 dim(g)/pi^4`, and arbitrary-positive-null-sequence argument were checked independently. Detailed reports and frozen hashes accompany this review.

The result is locally conditional and does not approve all C15. `C15-to-C16-TraceTest` stays open: rounded pointwise comparison has no located manuscript producer; same stress/chart/reference normalization and external33/34 weighted premises remain to be delivered. The existing C14 gallery wording discrepancy (unit instead of curvature-square field, and missing coefficient weights) was confirmed as a separate read-only integration issue. No manuscript or author file was edited. Human acceptance and machine approvals remain unset.

Parent session should inspect this report-only draft PR, post the bounded review/handoff as appropriate, and release its issue56 claim. The subagent does not post the PR105 review or release the parent-posted claim. Future C14 fixes or material changes to any reviewed statement require renewed correspondence checks; this review is not a fresh approval of another contributor's work.
