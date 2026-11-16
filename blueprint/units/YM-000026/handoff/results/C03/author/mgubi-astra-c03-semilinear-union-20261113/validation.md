# Validation and delivery boundary

This is an author draft for issue #289, stacked on PR #279 at
`cf159178c35699a8b3a4455aae26f6a52bccefec` (which includes PR #270).
The incremental change has six files: one chapter and these five new records.
The ten inherited author records are immutable; their review status is not renewed.

## Checks actually run

- `python3 blueprint/units/YM-000026/handoff/results/C03/author/mgubi-astra-c03-semilinear-union-20261113/verify.py`: PASS, 39 frozen/current versions and nine upstream source hashes. The ten old author records, source metadata, canonical chapter prefix and whole-word operator proof are unchanged.
- `python3 scripts/check_blueprint.py`: PASS (four units).
- `git diff --check`: PASS.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym-c03-semilinear-build existence.tex`, with output redirected to `/tmp/ym-c03-semilinear-build/build-final.log`: exit 0, 990 pages. The existing build was inspected and resumed after the session interruption rather than restarted.
- The final detailed log has no undefined-reference warnings or TeX errors. It retains the previously known 1.82599pt overfull box in `public-run-binding.tex`, lines 39–47, outside this task.
- PyMuPDF rendered PDF pages 174, 176–182 to `/tmp/ym-c03-semilinear-render/page-N.png`; each was visually inspected. The changed statements, equations, proofs and subsection transition are legible and unclipped.
- Final live issue #289 comments and PR #279 were reread on 2026-11-13: the claim remains sole and unexpired; PR #279 remains open at the frozen base above (now ready rather than draft).

Local build artifacts are `/tmp/ym-c03-semilinear-build/existence.pdf`,
`/tmp/ym-c03-semilinear-build/build-final.log` and
`/tmp/ym-c03-semilinear-build/existence.log`. These temporary artifacts are not
repository outputs. The manifest freezes the chapter and inspected inputs; it
intentionally does not pretend to fingerprint its own verifier or these records.

No fresh Lean elaboration or test-suite run is claimed. Lean, its toolchain and
dependencies were not edited. This task changes mathematical prose and evidence,
not the blueprint checker. It does not construct analytic suppliers, derivative
orientation, calibrated actions, reference conjugacy, Lorentz actions or Ward
identities. The new algebraic involution is conditional on the explicitly stated
same-table raw symmetry and inclusion-orientation receipts. Independent
mathematical and source review of this new draft remains required.
