# Validation for additional C05 revision-2 review

- Unit/package: YM-000026 / C05; additional revision-2 verification.
- Author PR: [#72](https://github.com/hairer/humanise-yang-mills/pull/72), final head `889deac713c6004e383fe0e5f4ec6f6510aacd46` (merged 2026-11-12 20:34:43 UTC).
- Compared with: `8b15d44410a2784d25e765b5b7b9ca2b05e5582c`.
- Source: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; Lean `leanprover/lean4:v4.32.0`.
- Reviewer: independent OpenAI Codex subagent under authorized account `mgubi`, session `mgubi-codex-review72-20261112`; not a C05 author. Independence is agent-based. No human acceptance is asserted.
- Claim: [issue #46](https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6835587411), checked again before submission.
- Whole-unit snapshot fingerprint: `59ad9fe6249c394cb2a6c005bf188de1a521c7ae5f8fb85a431f09c5a1d981a0`; this identifies the snapshot, not a whole-unit review. File hashes and coverage are in [validation](mgubi-revision2-validation.md).

## Scope and actual checks

- Read the contribution, coordination, proof-standard, C05/common-contract and relevant background/Bots guidance; read live issue #46, PR #72 and prior reviews #79/#85 before claiming. The additional review and disjoint filenames were explicitly disclosed. The live issue was rechecked before submission; the maintainer acknowledged the claim. PR #72's final head was still the hash above.
- Read every changed manuscript hunk and all five changed author records in `git diff 8b15d44..889deac`; expanded to full `ope-estimates.tex` and `ope-homogeneous.tex`, critical matching/local-trial passages, and the cited immediate Lean definitions. Four unaffected C05 chapters were not freshly re-audited. The wider unit's manuscript-list completeness is not certified by this bounded package review.
- Used `git show origin/pr85-review72:...` to inspect prior review reports without changing them. Findings were checked against the actual manuscript and source, not accepted solely from those reports.
- Commands actually run include scoped `rg`, `sed`, `nl`, `git diff`, `git show`, `gh issue view 37/46`, `gh pr view 72`, and the Python SHA-256 comparison below. Two exploratory guessed Lean paths did not exist; they were resolved with `rg --files` to `YM/OPE/Interpolate/Chart.lean` and `YM/Work/B17.lean`, then read. No failed lookup is treated as missing source content.
- `python3 scripts/check_blueprint.py --fingerprint YM-000026`: returned the snapshot fingerprint above. This is not an approval.
- `python3 scripts/check_blueprint.py`: **pass**, “Blueprint structure OK: 2 units. Lean and mathematics were not verified.”
- `git diff --check`: **pass**, no whitespace errors.
- Python `hashlib.sha256` comparison of the 16 source files listed below with their entries in `Lean/SOURCES.sha256`: **16/16 match**. This subset check is not a new full manifest audit.
- No manuscript or Lean edits. No LaTeX build/render in this audit-only pass; the author's build is reported in their validation, not rerun or adopted as our own. No tests of the unchanged checker, Lean elaboration, axiom replay, external package rebuild or full source rebuild.
- Existing source build evidence is reused via #37/#67/#75/#78, with its limitations stated in the separate Lean report. No new original literature theorem was invoked; source-specific interface findings did not require one.

## Reviewed changed-file SHA-256 at the final author head

```text
afe35d81e14adb57438693b66dbf33018308913c74358ee2edf9c4297651c5ea  blueprint/units/YM-000026/handoff/results/C05/correspondence.md
5c7576b9c7ff785fce98d2a9fae916ab042d7cad446edd9129a66197f773b5f7  blueprint/units/YM-000026/handoff/results/C05/findings.md
ea76d1aa43122654872735fa24d05e504a711afeba1a7345a3728583893730f9  blueprint/units/YM-000026/handoff/results/C05/handoff.md
77d5e5a2223a04483d6e3ee260ec0dca7ab11ade0f07f6acddd8631699200ad1  blueprint/units/YM-000026/handoff/results/C05/ledger.md
e366c95e729a5e571d854d1100a2ef1d2100ac5e8796672d0ce1d07986e9f901  blueprint/units/YM-000026/handoff/results/C05/validation.md
1aa2a360a7bb904ac0f219c343f7671e794cc903c4bae97c0d53b853c951e119  manuscript/existence/ope-cutoff.tex
e326a241d76b1a812011ad30ba82db0304f82494d04313f71574866bc1b219e6  manuscript/existence/ope-estimates.tex
fe7e319955e7d464072a9ec8dd5bd72eaed5088ba118f7ae375d56aad55d997a  manuscript/existence/ope-filtration.tex
6610a544b4ea45e2dfcc5724fe17cb28c2788863b0138610f88e3598ac0bafc0  manuscript/existence/ope-grid.tex
e62c50f9a498ba0f1cc68d5d00370ea07922c465dfe98d2012aa6cb769de7405  manuscript/existence/ope-grouping-algebra.tex
9cd9bb9bbb1745190d2948fd8fcd07f281a489c63c26a85a483e2bdb2e401714  manuscript/existence/ope-grouping.tex
d7c4b1670a7162e1c790c25c654aa6d381521925ccd1dcbf86b25f9d0718bbfe  manuscript/existence/ope-homogeneous.tex
42eafce7a786c12f6336e122216b480cf57c3a4c931aea966547252f2b489b31  manuscript/existence/ope-local-projection.tex
706902afa57eee4fa8cb52b3e2dda909555e31c452654ef0e109aa7ed570b855  manuscript/existence/ope-phase-prices.tex
6a09389c404ff2e9e5c29e9901f7f88e43a30e57552012d08ad430ac31b70505  manuscript/existence/reference-match.tex
```

## Checked source-file SHA-256

```text
4e06de719fe8a11c855275537d13cde113cbb3fbe3726a5cdfb71dbb0b6b57f2  Lean/YM/OPE/Prices/Circuit.lean
3806a25f308589ebc7ac453a88442ef965e9f4f3a8acf3b826b5b0ac2bb2b318  Lean/YM/Overlay/Prior.lean
f2e62404fde7feac52c2971052d562f283a0b7ed6a6c79e59cba9da1b51930f6  Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean
4f2a9b761b1a170ec4527dad7c1cc0062c0385d871c8831c54e684a13ef87a5f  Lean/YM/RG/Masks.lean
a442cd3240a1500e3da8000cf6656d22578f9739ba221b5fa23af77b66c287e8  Lean/YM/Euclid/Stress.lean
4aa0a8c1b530b627c005ee629ff0a40c96d0169e27102bffc2dc14378fc6bc3e  Lean/YM/Euclid/Table.lean
345a9f09614962321af7adc61edb76ef254123ffbe32025d2fb3f109804d843e  Lean/YM/OPE/Orbits/Quotes.lean
e898e3282613ede688c3096bfc411c7deff3a4ea1fbb9397c3745b6935ab600f  Lean/YM/OPE/Orbits/Receipts.lean
0694e1b51d4414be4c993f9aa1814b7f0a4dc7c553359aeacc38a788f089cd8f  Lean/YM/Work/B17.lean
0575212d982f5ef87cfc75bf31da0994749a34f2664641eccf011f6eb921df93  Lean/YM/OPE/Grouping/Family.lean
512466346b3352b6d99b62606989760129efd4edba3d885f94e0bf251cde48e4  Lean/YM/OPE/Grouping/Care.lean
128a43c642b798e2f97c0e524efd5893ebf0cc8b852fd100792447fc2239cb18  Lean/YM/OPE/Grouping/Fibers.lean
a807f0bf684debd74a26c70f33a358418ea088a0b706206b208aa62adcdb8d86  Lean/YM/OPE/Interpolate/Chart.lean
50a2e303c4d0241d9817fb6493e83fc485f4d77cd70dfa3f416235a7f315ab6f  Lean/YM/Source/Insertion.lean
19e62f803b78e583503cab5c5074f1b2b883a5ef6e282eedee409b60eecc1cfe  Lean/YM/Lattice/Support.lean
1f3289f39aaf21c46673dd92190111ea2cbe129adfc2d2e31c8e06098905b60f  Lean/YM/MergeProof/North/Freckles.lean
```

## Acceptance boundary

Reports identify the final author content, not later branch contents. Review outcome remains conditional and requests the three stated corrections. Material changes require renewed review. No other reviewer fingerprint or unit status was refreshed, and no human acceptance is represented.
