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

## Revision 2 (session `ADB991-claude-20261112-6574`, branch `claude/issue-47-6574`)

Answers the independent review in PR #80 (`review/`). Revised chapter
hashes:

| Chapter | SHA-256 | Review items |
| --- | --- | --- |
| predictor-branch.tex | `2ac3c8a13fcb98a2a126607c20899a5d58a037879780ddcd0f059df3eec98c20` | M1 (path endpoints Ly+i → L(y+e_b)+i, patch embedding stated), M2 (new `lem:branch-nearest-projection` with proof), M7(a), M7(h) |
| seed-geometry.tex | `b1939f55b51d0e1050f481280e1d6c436f0142c30febc61c7ae8ef53e3ec4c71` | M2 (uses the lemma), M3 (new `def:geometry-sector-conditions`, incidence convention) |
| seed-energy.tex | `6c73fbbf76db453dd067738862676f7a44f9e403cdd7f720d589c87f8ae29998` | M2 (Taylor bound from the lemma; δ with Dδ ≤ ρ), M3 (references; orientation step argued with the incidence convention) |
| seed-hit-comparison.tex | `e0f47bad6e08b0a8827c9dd00f13860fb4ed65d5cd6e257623ddf5b9e0424ce0` | M3 (reference) |
| gaussian-warnings.tex | `c70767f4c20a97de71c37afff7a37f231ae40c457836a6877b43ed7587f492fe` | M5 (plateau conclusion, contraction defined, new `lem:warning-vanishes` with the radius transfer B → 2B, margin R_c ≥ R_p + B), M7(f) |
| leaf-transfer.tex | `71c0a8e267f24dc5cce884a14e7b82eb4c270381838c6e23c1453a68a6c5ff21` | M4 (hypotheses (A), (B); ingredient vs density) |
| polynomial-moment-attenuation.tex | `b64d7a241dffaeed4fc6e6b4d01bf31e830c9a38c3629591ece6854400fdde2b` | M6 (d ≤ j−2, α > 0, constants before L) |
| mixed-activity-prices.tex | `7cf6671cbe3aab3321f5c44b6193ad4a858c18dd1afe26d4c6c332a741273c60` | M7(b) (B_c > 0, B_f ≤ 2B_c) |
| seed-guides.tex | `832eacb89513d2214c1358c4b1a59785fce4f13b4180a5bbd0a73ca5174cabba` | M7(c) (ℓ_{a,i} = path length + 4), M7(d) (ℓ¹ norm), M7(e) (transports from one V) |
| seed-unhit-comparison.tex | `600a5ed1e871835e6288815f1d358585d657f9ad924d662147dc6500a306607b` | M7(d) |

Unchanged: local-transfer, local-splitting, local-sections, cluster-expansion,
seed-tree-patch (hashes as below). Records: `ledger.md` (M8: I3, I4/I4', X1,
X2, X3, X5, rows 29, 33, 77), `correspondence.md` (L1, L2, L5, L6, L8, L9,
L12–L15), `findings.md`, `validation.md`.

The review found one error in a displayed formula (M1), which the
author pass below had missed; it is now repaired. M9 (C13, C11, C07) is
cross-package and was not edited here. Every revised chapter needs
renewed independent review.

## Established in the first pass (author check, not a review)

All 15 chapters were read in full, and every displayed estimate was
rederived from its stated premises. The first pass reported no
mathematical error; the review then found the wrong path endpoints in
two displays of predictor-branch (M1), repaired in revision 2. The
repairs are listed in `findings.md`: one typesetting corruption, one implicit
constant choice made explicit (checked against `YM.Work.E09.assemble`), and
local notation repairs.

## Remaining

- Analytic inputs: X1 has the conditional supplier
  `thm:ex-lattice-volant-supplier` (C02); X2 has the candidate
  `eq:local-covariance` (C07, unchecked); X3 is produced by C07
  `warning-safety.tex` (form not checked) (corrected in revision 2). X4 and X5 (path data and flat stack) are "assigned to
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
