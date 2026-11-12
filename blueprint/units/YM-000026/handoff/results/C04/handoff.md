# C04 author handoff

## Revision 1 (session `ADB991-claude-20261112-74c4`), answering review PR #76

Claim: https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6835732783
Basis: `codex/existence-monograph` at `d02fcb5`. All eleven chapters had, at
the start of this revision, exactly the SHA-256 recorded in
`review/mathematics.md` (reviewed at `18d0327`), so the review applies to the
text that was revised.

Final hashes after this revision:

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/complex-heat.tex` | f22685be41a0255a1441ad4d98ddef46666e32f293ed4979ffebf7ee98b46ad0 |
| `manuscript/existence/analytic-boundary.tex` | 348f849f1581db7c5d6d0fecce8d1eec2ec151a237b5ebae20df46fab9db793b |
| `manuscript/existence/fourier-support.tex` | 12ad5b3f8e8aefe97efe6e62be29a3375b5cec24ba1947d95ab6589db075a973 |
| `manuscript/existence/label-descent.tex` | 894d899b2dc2b222c1fe52b850131c92bcb3657264fffe5a919322099fb6cb69 |
| `manuscript/existence/lorentz-covariance.tex` | bb4405501b90463cc405dd6896c04711863ba08c2227f12c6659400a7aa4e75a |
| `manuscript/existence/full-tube.tex` | 0fdaeac63aa66986cae347ffdfe846a398096f6eeb87e00e80a1c8779adeb02a |
| `manuscript/existence/heat-vectors.tex` | 9e00afa255750126bd8511581002cfe22380b0d2c78918796ff4b716248a67b1 |
| `manuscript/existence/reconstruction.tex` | 4abab76e83388d42f59b778bddeca1519e6a5790a8667347fc2055745f0420e0 |
| `manuscript/existence/boundary-detection.tex` | d3207f915e5d6a535ec0a3f40981c7e8555e3d272daebdadc3672e75ab0b41a9 |
| `manuscript/existence/spectral-measure.tex` | 9de3ba7c3ea0d2839424e260aebd31bac261363812b0079c3591b23af8970c9a |
| `manuscript/existence/locality.tex` | 82bafd2588b64f09957e1a681169b4f182b3d3ea851945d6458ce303f3fb5893 |

Changed in this revision: complex-heat (M4), analytic-boundary (M10),
fourier-support (M10/L6), lorentz-covariance (M10/L9: general form of
`lem:schwartz-motion`), full-tube (M10), heat-vectors (M6), reconstruction
(M5), boundary-detection (M10 twice), spectral-measure (M10), locality (M1).
Unchanged: label-descent. Built PDF (not committed): 897 pages.

Required items of the review: M1, M4, M5, M6 done in the chapters; M2, M3,
M7, M8, L5, L7 done in `ledger.md`; L1, L2, L9 done in `correspondence.md`.
L3 and L4 concern `reconstruction-evidence.md`, which C04 does not own; the
corrections are written out in `correspondence.md` for its owner. M9 concerns
the shared bibliography (`existence.tex`) and is left to G03. All M10
clarifications were adopted.

What changed mathematically: nothing in any theorem's content. Two
statements were made more precise (`prop:heat-cups` now states the
translation identity it proves; `lem:schwartz-motion` now states the
affine-group continuity its proof gives), one hypothesis was quantified
(`prop:word-motion`), and one appeal to Riesz uniqueness was replaced by a
complete π–λ argument.

Still open after this revision:
- E4 (field levels, inclusions, union) has **no identified producer
  statement** in the manuscript. This is the main open input of C04; it is
  shared by C05 and C14. A coordinator should decide which package owns it.
- The nonzero-label clause of the endpoint (review M3) needs a producer
  outside C04 (Lean candidate `YM.Table.alive` with `YM.Table.pin_inj`).
- Producers of E1–E3, E4b, E5a/b, null equality, calibrated actions,
  involution identity and unique heat are named by label but their content
  was not re-checked here.
- No Lean elaboration (Mathlib unreachable from this sandbox).

For the renewed reviewer: all eleven chapters except label-descent changed,
so their fingerprints changed; the diffs are small and local (see the table
in `correspondence.md`, section "Revision answering review PR #76").

## Original pass (session `ADB991-claude-20261112-5b03`)

## Final hashes (SHA-256)

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/complex-heat.tex` | f069409bffc8a10c8d2c294a32073a30a53211104f62d6da849e9e5d5579ba21 |
| `manuscript/existence/analytic-boundary.tex` | 1c282b20444bb16c68ca01001bfcc7c6871746ae88ee1fc49018e8d6168613e3 |
| `manuscript/existence/fourier-support.tex` | 7da33ddfdb0ce8533441e935c566a56cd251ac4bd701f1c39d20da6869f8bf12 |
| `manuscript/existence/label-descent.tex` | 894d899b2dc2b222c1fe52b850131c92bcb3657264fffe5a919322099fb6cb69 |
| `manuscript/existence/lorentz-covariance.tex` | eca0747edec7f2b1f6b5c3b76ba2b365fa530c36433cc78acb8e6c0d6a63f592 |
| `manuscript/existence/full-tube.tex` | e4152d81a8059b5345a7e6a58e5d235536cb1b3fc34114e642176aee76efab9f |
| `manuscript/existence/heat-vectors.tex` | 31e865e455f9487d2d1c64c8fa361c799309b1e0ebf9d3c7dd6e539e2d27320e |
| `manuscript/existence/reconstruction.tex` | 9cf06bc780df01e8f372b2cc72c64130909b4ce3182e8fa4373414d0714a0a49 |
| `manuscript/existence/boundary-detection.tex` | b152255ca88fd6e4d3401fa74f31bd0ee98e028a1141b7714a942e777dcedf53 |
| `manuscript/existence/spectral-measure.tex` | c4fc14d4b0a29c8411096e40f68fb2b332cb10aa4c04a192ed00f1e585e400d2 |
| `manuscript/existence/locality.tex` | 3ea90586d69437267ad7754dd936c8fe02c7da320698fcd3da1cc6c663a2d5b5 |

Changed in this pass: complex-heat, reconstruction, boundary-detection,
spectral-measure. The other seven are unchanged from the inventory hashes.
Built PDF (not committed): 873 pages.

## Established (author side, conditional on the ledger's inputs)

- All eleven chapters audited in full; one substantive gap (F1) repaired with
  a detailed proof that follows `YM.Work.C28`; notation repairs N1–N3.
- With F1, every hypothesis of the reconstruction propositions
  (`input:word-boundary`, `eq:word-motion-input` and the translation
  hypothesis) is discharged inside C04 from C04 outputs, apart from the
  incoming edges in ledger.md.

## Still open

- The incoming edges E1–E5, C03-to-C04-reflection-J,
  C14-to-C04-calibrated-actions, C14-to-C04-null-equality,
  C03-to-C04-unique-heat and the new C03-C14-to-C04-involution-identity
  (findings F2). Their producers must acknowledge the exact statements.
- O1 (Williams theorem number, for G03), O2 (dependency note for G06), O3
  (UniqueHeat in the endpoint, for G01).
- No Lean elaboration was possible here.
- Material edits invalidate the earlier agent review fingerprints of
  complex-heat, reconstruction, boundary-detection and spectral-measure in
  `reviews/draft-review.md`; they need renewed independent review.

## For the independent reviewer (`results/C04/review/`)

Review at the hashes above. Priorities: (1) the proof of
`cor:word-motion-inputs` against `Lean/YM/Work/C28.lean`, including what
`Urs`, `Descends.ties` and `Descends.commutes` contain; (2) whether the
involution-identity requirement F2 is real and correctly stated; (3) that
N1–N3 introduced no inconsistency elsewhere (grep for `\mathcal V`, `T_E`,
`\tau_a`). Unchanged chapters may reuse earlier review evidence only after
checking that their hashes are unchanged.

## For the next author

The C04 author scope is complete as far as this session can tell. If a review
returns substantive changes, the fixes belong to a new C04 author claim.

## Metadata for the integrator

No new manuscript file was created, so `unit.json`'s `manuscript` list needs
no addition. Its fingerprint changes because four listed chapters changed;
approvals remain unset.
