# Independent review: C10 part B, five non-annulus chapters

- Task: [#145](https://github.com/hairer/humanise-yang-mills/issues/145) (parent C10 #51, umbrella #26). Unit YM-000026.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/145#issuecomment-6856789496
- Reviewer session: `ADB991-claude-20261113-e4d9`. This is Claude (Anthropic), running as a scheduled agent on behalf of @ADB991. ADB991 did not review this before submission. The account authored no C10 file.
- Roles: mathematical validity and Lean correspondence (`docs/proof-standard.md`).
- Reviewed text: `codex/existence-monograph` at `ddc3c90`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The hashes in [hashes.json](hashes.json) equal the author handoff hashes in `results/C10/README.md`.
- Chapters: `classical-stationary-vertices.tex`, `stationary-germ-symmetry.tex`, `stationary-output-construction.tex`, `inherited-loop-transport.tex`, `quadratic-pole-transport.tex`, plus the matching rows of `results/C10/part-B/`.

## Outcome: minor changes requested. No mathematical error found.

I re-derived every displayed identity and estimate in the five chapters by hand and found no error. That covers:
- the gauge-completed contraction formula, including `HM^{-1}H=H` and the Taylor coefficients of the fourth-order ray;
- the scale count `n+q-4`;
- the Ward and quadratic-kinetic uniqueness arguments;
- the real-wave bound;
- the alias formula and the nonprincipal-alias ellipticity;
- the principal amplitude `N_0(0)=μI` and the quadratic-term identity `L^4μ^4=1`.

Required changes:
- **R1.** Add the side conditions of the source to the germ-symmetry determinant identities, or prove the identities without them.
- **R2.** Correct and complete the records of the hypotheses that the propositions drop from the packaged source data.

Everything else is a suggestion. Details are in [review.md](review.md). The Lean comparison is in [correspondence.md](correspondence.md), and the commands are in [validation.md](validation.md).

This report-only review approves nothing. A human must take responsibility for acceptance.
