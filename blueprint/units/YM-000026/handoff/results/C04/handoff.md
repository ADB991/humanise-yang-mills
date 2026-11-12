# C04 author handoff

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
