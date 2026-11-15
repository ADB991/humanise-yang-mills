# Actual auxiliary family for the trace chart

Session: hairer-codex-trace-history-20261115. Refs #398, #372, #56.
Base: 72eabe5453958edb70efd8e3548834b1a5657f50.
Claim: https://github.com/hairer/humanise-yang-mills/issues/398#issuecomment-6902260748.

## Result

The new `prop:restart-chart-family` chooses the endpoint re-expression and each
backward output once, retaining all previously constructed entries. Its exact
budget radius is b(x)^2, not the distinct recording radius b(r(x)); the local
compiler's radius inequalities are verified. Its threshold is the phase
threshold. Its evaluated density equals the recursively defined frozen-coupling
course at every level, and its integral is the original Wilson partition function.
No injectivity of evaluation or uniqueness of representations is claimed.

`cor:rank-trace-all-levels` verifies the full F3 window, including the
re-expressed endpoint. It removes the vague extra test-threshold compatibility
premise: Station.Meets consists precisely of clip equality and the scalar tests
explicitly verified here. This is conditional on the existing funded chart/stamp,
selected-path and local-closure hypotheses, rather than a new analytic estimate.
The existing selected readout/stamp proposition supplies F5 under its own stated
funded hypotheses. Joint chart selection and physical stress calibration are not
proved by this change.

## Source correspondence

Imported Lean pin: 3456e5e75cf8d4cd558955a5c7638fba2d68f464. A cheaper source reader
assisted; the independent reviewer separately checked the relevant source.

- YM.Next.Rank.Station.Meets, Next/RANK/StationMeter.lean: eight exact tests.
- YM.PhysicalNext.InteractingRank.groomSky, TraceExtension/Prom/Port/Leashes.lean:
  clip and numerical tests on the actual constructed representation.
- Soft.leafSky/thicketSky, TraceExtension/Prom/Port/Soft/Grows.lean: endpoint
  parser followed by descending updates; same evaluated course throughout.
- NylonSky.use_/embroideredSky, TraceExtension/Prom/Port/Soft/Coupons.lean:
  all-level witnesses, distinct from backing-family equality at the endpoint.
- Spear, PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/Spear.lean:
  exact phase thresholds and walls radii.

These are direct finite induction, normalization and asymptotic arguments;
no new external literature theorem is needed. The existing dawn retiming,
local compiler, endpoint, path and clock proofs supply the earlier interfaces.

## Validation and review

Independent mathematics and textual source-correspondence PASS at the hashes
in REVIEW.md, with upstream analytic inputs explicitly outside review scope.
The reviewer verified five imported source files against Lean/SOURCES.sha256.
No Lean elaboration performed. Author validation:

- Full latexmk build: exit 0, 1127 pages, no unresolved or multiply defined references.
- Rendered pages 756 and 943 inspected: formulas and new text legible.
- python3 scripts/check_blueprint.py: PASS (four units).
- git diff --check: PASS.

The local checkout overlaid the merged manuscript baseline; only the two named
manuscript files and this new evidence directory belong to the submission.
