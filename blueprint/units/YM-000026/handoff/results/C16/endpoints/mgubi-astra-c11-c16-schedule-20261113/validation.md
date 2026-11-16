# Validation and delivery boundary

Report-only endpoint comparison; 2026-11-13. Owned output is this directory only.
C16 base and C11 target are recorded separately in hashes.json. All 13 frozen
input SHA-256 hashes were computed with `git show REV:path` and independently
recomputed against those objects. They are not hashes of assumed current
working-tree C11 files. The imported Lean tree is unchanged.

Checks actually run:

- `python3 scripts/check_blueprint.py`: PASS, 4 units; the checker explicitly
  does not verify Lean or mathematics.
- `git diff --check`: PASS.
- `git diff 69b2631 -- Lean manuscript source`: empty.
- `git rev-parse HEAD HEAD:Lean`: canonical base and imported tree match the
  identities in the reports.
- Source definitions and relevant proof bodies listed in source.md were read;
  elementary exponents, adjacent-stage indices and startup base/successor cases
  were checked by hand. No automated proof claim follows from hash verification.
- Live issue #178 was rechecked at start and before submission (19:44 UTC):
  our claim remains current; the earlier C12 endpoint claim is released and
  the new C02 finite-menu claim is explicitly disjoint. PR #223 remains open
  with head `1a084088a29f0ae4e4f59d3c414344a74e0843c5`.

No manuscript was changed. No LaTeX build/render, Lean elaboration, axiom replay,
checker-test suite or global dependency-cycle check was run for this report.
Existing builds and reviews are contextual evidence only. The parent inspected
the two reports for integration; because this account authored C16 that does
not constitute independent C16 acceptance.

Proposed handoff: acknowledge the C16-to-C11 **numerical schedule** endpoint
conditionally on the fixed common inputs stated in mathematics.md. No new
schedule correction is requested. Preserve the analytic and same-history
obligations with C11, and leave every other edge and package acceptance open.
The parent owns the issue acknowledgement and claim release.
