# Newly merged shared evidence

The handoff branch preserves its frozen mathematical snapshot. The maintainer's
main branch at `4cf1c97dd820c9996d0242f9956d123a940e2dff` also contains the following separately authored
blueprint additions/reviews. They are read-only inputs, not new work to duplicate.
Read their actual content and live issue review status before relying on them;
being merged does not itself establish mathematical acceptance. The handoff did
not modify these contributors' outputs or claim fresh review of their contents.

- [blueprint/background/balaban-gauge-averaging.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/background/balaban-gauge-averaging.md)
- [blueprint/background/osterwalder-schrader.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/background/osterwalder-schrader.md)
- [blueprint/interfaces/gaussian-sector.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/interfaces/gaussian-sector.md)
- [blueprint/interfaces/nonlinear-rg-step.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/interfaces/nonlinear-rg-step.md)
- [blueprint/interfaces/rank-determinant-stress.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/interfaces/rank-determinant-stress.md)
- [blueprint/units/YM-000022/reviews/lean-mgubi.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/units/YM-000022/reviews/lean-mgubi.md)
- [blueprint/units/YM-000022/reviews/mathematics-mgubi.md](https://github.com/hairer/humanise-yang-mills/blob/4cf1c97dd820c9996d0242f9956d123a940e2dff/blueprint/units/YM-000022/reviews/mathematics-mgubi.md)

If these files are absent from your checkpoint clone, fetch canonical main and
read these pinned versions with `git show <commit>:<path>` (or the links above).
Recheck for later contributions without assuming they preserve the same evidence.
Do not merge or modify their owned files as part of a chapter package.

## Review arriving during publication

[PR63](https://github.com/hairer/humanise-yang-mills/pull/63) was observed while
publishing the final release. It is a non-author Lean-correspondence review of
issue14's rank/determinant/stress interface and **requests changes; no acceptance**.
Its reported findings concern omitted hypotheses/quantifiers and source-name or
consumer mismatches, including reception/castle and the stress/shell interfaces.
C12/C13/C14, C16 and G01/G06 must read that review and its live responses before
reusing the interface note. The stopped parent has not independently checked the
findings or altered mathematical text in response; reconciliation belongs to the
assigned packages. The review's separate output and claim remain external.
