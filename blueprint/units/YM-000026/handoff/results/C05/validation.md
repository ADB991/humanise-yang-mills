# C05 validation (commands actually run)

Environment: Linux container, 4 cores. Branch `claude/issue-46-0c65` from
`codex/existence-monograph` at `01ef22c`. All commands were run from the repository
root unless a `manuscript/` directory is shown.

| Command | Result |
| --- | --- |
| `sha256sum` of the 14 owned chapters at `01ef22c`, compared with `coverage-inventory.json` | all 14 equal the inventory start hashes |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |
| `git diff --check` | clean |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (fresh output directory) | exit 0. 875 pages (snapshot 872). `existence.log`: 0 `LaTeX Warning`, no undefined references, no overfull boxes. The tracked `manuscript/existence.pdf` was **not** rebuilt or changed |
| `pdftoppm` of pp. 196–197, 200, 692–699 of that build, inspected visually | new subsection 193.5 / `prop:ope-match-assembly`, the dictionary table, and the edited paragraphs render correctly. No overlong lines in the table |
| Lean: `sed`/`grep` reads listed in `correspondence.md` | source text only. **No** `lake build`, elaboration or `#print axioms` (Mathlib not reachable here) |

Not run: any Lean command beyond reading source text; independent review; any
check of chapters outside C05 beyond reading the cited producer statements.

## Content hashes (SHA-256)

| File | Start (`01ef22c`) | Final (this PR) |
| --- | --- | --- |
| `manuscript/existence/ope-prescription.tex` | b332b2c3cd21bc6224659e9f1452b8c37a81a451e907f94728ab5ecdbdd4bd78 | unchanged |
| `manuscript/existence/ope-homogeneous.tex` | 621f8e99c7f2dce813333c8fbe022cfabef7f47a457ada36e707f08aab62b7e7 | unchanged |
| `manuscript/existence/ope-phase-prices.tex` | 09ad65853eda7485300a4d2d5a4ed60f0cd907bb4b7bfb89c8674a17a3b3d17b | fe3492ffc0dad8c246cbc47125a9cc62331b0f35e5f3185cfb2cec8acd3a9151 |
| `manuscript/existence/ope-filtration.tex` | de3eb826e348a10fddb6b7be08e73f63389296209fb670f4987a9df91ae77255 | d9bbb667ae873ccfb98430adc14cce424bba05458746f10d614e551fecc27c62 |
| `manuscript/existence/ope-grouping.tex` | 9c04100186186b48f2610b9ac9c7fc940b09a6ad25e0f1fba655d4bb84048211 | unchanged |
| `manuscript/existence/ope-grouping-algebra.tex` | 118058d63807ff051928347e71b539f1e9313852c1f7801807a8b63cda284390 | unchanged |
| `manuscript/existence/ope-singletons.tex` | 38f846d42a399c17f1b39394ed9ae0aa93d6d3a0e09d4cde656dd8ccdeab1f9e | unchanged |
| `manuscript/existence/ope-local-projection.tex` | 55db2f7c2fe260fc22b23d80ac72bd566343b0cf73d6e579d918995fa36c7e53 | c84af06b54a356e4a779f027242b8efc4c559b6a898e6370c0f5c59088228a6c |
| `manuscript/existence/reference-cone.tex` | e240a87f8acc898d50ac364ed7a884b91629cbf083d16049bd4dacf0c405af6a | unchanged |
| `manuscript/existence/reference-difference.tex` | cd94054fa77810c56b5f6838986b93a9b4fcf93a4182fe044b807cdce4ad854a | unchanged |
| `manuscript/existence/reference-match.tex` | f95a52249ed63a5d93479ee1484781fb88bedf42a7389cef1dd49bcc705eaf94 | unchanged |
| `manuscript/existence/ope-cutoff.tex` | 68eee7274a5ac6780fb898b87752fe80c60ba0ce8088205c88f8e9002a7c325f | 47d64b1bc5528ce42d59b100adebb1adf426d61aad424c25614d59c55d3d636d |
| `manuscript/existence/ope-grid.tex` | 7aa64011922fc4318f6f13a542187a0865afeb2ebed19792b4069f4b5857b98b | 26011dc5fd7a26893ec58b7a86bb13bb55fe14a1cd2581c07cbf9ba927c68769 |
| `manuscript/existence/ope-estimates.tex` | 6ffbdcd702e5b097338182750dbf8af81fef644628e72f899bd98acffcfe0760 | unchanged |

The start hashes of the unchanged files equal those of the independent local passes
recorded in `../../../ope-evidence.md`, so those passes still refer to the current text.
The final hashes were computed after the last prose edit; the report files under
`results/C05/` are not mathematical inputs and are not hashed here.

## Revision 2 (session `ADB991-claude-20261112-3b89`, commit 5d68524)

Final SHA-256 of the chapters changed in revision 2 (the other four C05 chapters are unchanged from revision 1):

```
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

Commands actually run, with results:

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` in `manuscript/`: exit 0, 877 pages, no undefined references, no overfull boxes; one pre-existing amsmath `\atopwithdelims` warning outside C05. Tracked PDF untouched. Rendered pages 190 (`eq:ope-mixed-covariance`) and 690 (`reference-match` opening) inspected as images; the other changed passages were located in the text dump (pp. 195, 203, 208, 683, 684, 703).
- `python3 scripts/check_blueprint.py`: OK. `python3 -m unittest discover -s tests`: 22 OK. `git diff --check`: clean.
- Lean: text reads only (`YM/Euclid/Stress.lean`, `YM/Euclid/Table.lean`, `YM/RG/Masks.lean`, `YM/OPE/Grouping/Family.lean`, `YM/MergeProof/Twigs.lean`, `YM/Extension/UV/Canon/Bourse.lean`). No elaboration: Mathlib sources are unreachable from this sandbox.

Not performed: independent review of revision 2; Lean elaboration; literature (the chapters cite none).
