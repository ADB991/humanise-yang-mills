# C06 handoff

Author session `ADB991-claude-20261112-8949`. Branch `claude/issue-47-8949`,
based on `codex/existence-monograph` at `01ef22c`.

## Final SHA-256 of owned chapters

| Chapter | SHA-256 | Changed in this pass |
| --- | --- | --- |
| local-transfer.tex | `42ccf5ebb31aa2d9b9d189fb8db8257277906c2af5ae88b5807f854921970d97` | no |
| local-splitting.tex | `8123c63aadbf07bfcc06ca202dcd8e76da79fb0f2bc2e81554a29210c7181950` | yes (R4) |
| local-sections.tex | `a9987194194cc332b06e0b4d58e7420ff33169663e10914ec80fe41f096397ac` | no |
| polynomial-moment-attenuation.tex | `a5505965ecfe8237cc61363a67eea0b8bc9bda96cb06ca8ecb2d95b1f028dbd4` | no |
| leaf-transfer.tex | `1b6736fc629a49ee89d9ee11c40331b97033d3feb5e5af1742b78722d0c150d6` | yes (R1) |
| cluster-expansion.tex | `d1c1f944325f63e9b50c91af45658fcb0a835471faef782b0a6ae88051c16374` | yes (R3) |
| mixed-activity-prices.tex | `d37f32c32a106f58209d34c385a43f309b748df2a1dc084f5ea3e61b4938388e` | yes (R5, R6) |
| gaussian-warnings.tex | `d0dfa7f19b8739045bd6070bfe04da6201889fda36b70a0e0fbc0d51c866a953` | no |
| seed-geometry.tex | `cc151ccf8dedc3eacbac0a81e7236a07d6f5c3f568de7ce67db8f55eb364ccf8` | no (= frozen pass hash in parent correspondence) |
| seed-guides.tex | `82af41d3f79cacd82a39654e9ea40b6eab5871620d07a8a5dd05daf39d21a7c5` | yes (R7); the earlier conditional pass at `32c815ad…` no longer applies |
| seed-hit-comparison.tex | `ee9d8e60c71226a663f60a85bb6f75577de8007c4eef9ab5de91c950db7baf78` | no (= frozen pass hash) |
| seed-tree-patch.tex | `0056e738e7869e570fa8192af90c0e4b2594a62217c24d5957ca0eed071016e6` | no (= frozen pass hash) |
| predictor-branch.tex | `d28e0335d1185ed292cde76111a7f3112d2e79d30a74d5c62fd87ab31821fba1` | no (= frozen review-request hash) |
| seed-unhit-comparison.tex | `64db95a12991aa182893f0aabcb3ba8848786b09f0051dd48024041d85026416` | yes (R7); the earlier request at `6a1aa82f…` no longer applies |
| seed-energy.tex | `3ae894b6f772d1532b3404d5d024ef9ca2567789de55bc6c099f115e38f10d75` | yes (R2) |

## Established (author check, not a review)

All 15 chapters were read in full, and every displayed estimate was
rederived from its stated premises. No mathematical error was found. The
repairs are listed in `findings.md`: one typesetting corruption, one implicit
constant choice made explicit (checked against `YM.Work.E09.assemble`), and
local notation repairs.

## Remaining

- Analytic inputs with no located producer label: X1 (nonlinear transition,
  `eq:transfer-nonlinear-input`), X2 (physical covariance bound), X3 (local
  plateau estimates). X4 and X5 (path data and flat stack) are "assigned to
  the lattice author" in the parent correspondence, but no package owns them
  in the inventory. G06 should decide where they are produced.
- Cross-package acknowledgements: I1 and I2 (C05), I3 (C01), I4 and I5 (C08),
  I6 (C07).
- Notation proposals N1–N4 for G05; literature leads for G03.

## For the independent reviewer (claim `results/C06/review/`)

- Mathematics: concentrate on the changed chapters (diff against `01ef22c`)
  and on the unchanged chapters with no recorded pass (local-transfer,
  local-sections, polynomial-moment-attenuation, cluster-expansion,
  mixed-activity-prices, gaussian-warnings).
- Lean correspondence: R2 against `YM.Work.E09.assemble`; R5 names against
  `packet-estimates.tex`.

## For the next author

Do not start any repair here before the review. Watch the C13 consumer
`actual-harvested-owner-energy.tex`, which reruns the energy
allocation at threshold ν and should make the same `c_F` choice explicit.
