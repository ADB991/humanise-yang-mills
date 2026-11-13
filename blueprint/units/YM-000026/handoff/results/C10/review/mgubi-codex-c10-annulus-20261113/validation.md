# Actual review validation

Review worktree: `/tmp/ym-c10-review-20261113`. Reviewed author head:
`ebc64a227e0572bd4fe8f6ecb744f6529ef01e07`, PR95. The report is submitted
separately against `codex/existence-monograph`; it does not carry the author's
manuscript changes into a second PR.

## Commands and results

- `gh issue view 51 --repo hairer/humanise-yang-mills --json ...` and
  `gh pr view 95 --repo hairer/humanise-yang-mills --json ...`: read the full
  task, author handoff, current head and discussion. Checked the live issue
  after posting the review claim and before submission; no competing claim
  appeared. PR95 remained open at the same reviewed head at the final check.
- `git fetch origin codex/existence-monograph pull/95/head:refs/remotes/origin/pr-95`
  and `git worktree add -b codex/review-c10-annulus-20261113
  /tmp/ym-c10-review-20261113 origin/pr-95`: succeeded; isolated worktree at
  the intended author head.
- Targeted `rg`, `sed`, `cat`, `nl` reads: all four chapters, canonical evidence,
  relevant author findings/ledgers, earlier review history, source definitions
  and proof portions named in `correspondence.md`, and the C11 consumer/radial
  lemma. The source inspection is bounded, not a full-tree or transitive audit.
- `git diff --stat 81538d6..HEAD -- <four annulus files>`: confirms the review
  covers four materially changed files (779 insertions, 196 deletions).
- Python `hashlib.sha256` checks: all four manuscript files match the immutable
  PR95 blobs and the author's final hash table. Recorded in `hashes.json`.
- Python SHA-256 comparison of the 16 files in `inspected-source.sha256` with
  `Lean/SOURCES.sha256`: all match the pinned manifest.
- `python3 scripts/check_blueprint.py`: exit 0,
  `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check`: exit 0.
- `git diff --exit-code HEAD -- manuscript Lean`: exit 0 before the report
  commit; neither manuscript nor Lean source was edited.

A source-navigation glob `Lean/YM/Tensor*` matched no files; the definition was
then located with `rg` at `Lean/YM/Analysis/Homogeneous.lean`. A guessed
`path-stationary-chart.tex` filename did not exist; the section is in
`path-attachment-producer.tex` and was read there. Some broad initial read
outputs were truncated; relevant passages were subsequently read in narrower
ranges. These navigation failures are not successful checks.

## Checks not run

No Lean elaboration, full build or `#print axioms` replay; the source pin and
separately owned #37 build work are preserved. No LaTeX build or render was
run because the only new files are review reports. The author's reported
938-page build is not claimed as this review's validation. No human acceptance,
whole-package review, review of the other thirteen C10 chapters, or independent
proof of the (W)/(S), fixed-film-ticket, or quadratic-Hessian supplier was
performed. No approval metadata or earlier review fingerprints were refreshed.
