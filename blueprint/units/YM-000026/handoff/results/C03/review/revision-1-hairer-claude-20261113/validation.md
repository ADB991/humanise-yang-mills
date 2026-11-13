# C03 revision 1 review: validation record

Session `hairer-claude-c03-rev1-review-20261113`, 13 November 2026, about 10:10–11:00 UTC. Worktree: a separate checkout at `codex/existence-monograph` `69c254b58e98c4bc82d7554c87a651f947934db0`, on branch `claude/issue-122-c03-rev1-review`. The only files written are in this directory. Build products are under the ignored `manuscript/build/`.

**No Lean was built, elaborated or replayed.** The Lean release and Mathlib cache hosts are unreachable from this environment (HTTP 403 and no connection; see the G01 review of the same day).

## Commands

| Command | Result |
| --- | --- |
| `git diff --stat 5ec6941 df34654` | 14 files, 390 insertions, 116 deletions: seven chapters and seven author records |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` | exit 0; `Output written on build/existence.pdf (961 pages, 5021864 bytes)`; `grep -c undefined build/existence.log` = 0 |
| `pdftotext -f P -l P build/existence.pdf -` to locate the changed passages; `pdftoppm -r 70 -png` | changed passages on PDF pages 129, 133, 136, 140, 166, 167, 170; pages 140 and 166 viewed as images, the others read as text; rendering correct |
| `python3 scripts/check_blueprint.py` (before writing) | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`, exit 0 |
| `python3 scripts/check_blueprint.py` (after writing) | same, exit 0 |
| `git diff --check` | no output |
| `grep`/`sed` on `Lean/` for every Lean anchor cited in `README.md` | as recorded there |

## Content hashes (`sha256sum`) at `69c254b`

The seven chapter hashes equal the "after" hashes recorded in the author's `../validation.md`.

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/limits.tex` | `a55d8e8648688a63323b012a838108733218e2a76d3242a66820570d6d561624` |
| `manuscript/existence/reflection-transport.tex` | `a9bde9510a370e867b5ef45e06c8227f03776d93171056b5c6027447b11e6ff0` |
| `manuscript/existence/phase-quantitative-producer.tex` | `a9f6a0370186a5dbe3c96a04772a9f61ecdfd2b52f5d47cdfc9acdbd03203e6f` |
| `manuscript/existence/fullmesh-fixedbounds-producer.tex` | `ebc6177eb2bd4fa98dd0b75d336d49916a6ccfc7407694436cbef3bdf4922c7a` |
| `manuscript/existence/fullmesh-correlation-cauchy.tex` | `19e0825603d24d9f6a8ac2fbc33b62012149f039efb54c243b9034b393f478ee` |
| `manuscript/existence/phase-fields.tex` | `f584cf074ddcd6fceed1c6a65bff5e2613454a20d26831680559c924d58c29ae` |
| `manuscript/existence/actual-slab-copy-bounds.tex` | `c1e553d1cf8278716619a36c27156f1bd3245a2070dab8ad445798a907b201e6` |
| `results/C03/README.md` | `f02c9c87545dd58f693e41e7536517494848573691b27549cec1edb97259cae3` |
| `results/C03/correspondence.md` | `7d98346ad32f68068abaa683ca9923ab2025bc3825cba44bda3fee5c8c517666` |
| `results/C03/findings.md` | `da6b351ff04e0c12bdcde8f807b947d77f75c93f7702ec61364e6c2d3338d57a` |
| `results/C03/handoff.md` | `03ab49e3d27cba48d6c997186cf98d30d680381040c7262123deb8aec55e3f57` |
| `results/C03/ledger.md` | `9cccc71421bad1bd5cfcbbbf15b2ba61515b405a5595e3169fbb60b5e2c7f219` |
| `results/C03/revision-1.md` | `4c51b48ce2cffa8234f2c0e297dddc2de0f9f8badf0a573f74d37e552a4f6b19` |
| `results/C03/validation.md` | `b75e96e6da43b0d3338391e2f7d5ced3c2905d97b0fddd070ed897aeabedd8c9` |

I read the PR #123 diffs of `correspondence.md`, `findings.md`, `handoff.md` and `README.md`, not the whole files. They are consistent with `revision-1.md`. The added correspondence row for `ex-ordinary-reflection` lists the full premises of `YM.Bid.B04`; R3 asks that they also appear in the manuscript paragraph and the ledger row. I read the ledger diff in full.
