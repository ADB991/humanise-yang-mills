# C03 validation (commands actually run)

All commands were run from the repository root on branch `claude/issue-44-c853`, which was cut from
`origin/codex/existence-monograph` at `01ef22c`.

| Command | Result |
| --- | --- |
| Python: recompute SHA-256 of the 13 C03 chapters and compare with `coverage-inventory.json` (before editing) | 13/13 match |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |
| `git diff --check` | clean |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex` (full monograph, TeX Live from Ubuntu apt) | exit 0. The log has one warning (`amsmath: Foreign command \atopwithdelims`, pre-existing, not in C03 files). No undefined references or citations. The tracked `manuscript/existence.pdf` was overwritten by the build and restored with `git checkout`, so this PR does not change it |
| `pdftoppm -r 70` on built pages 120, 125, 126, 148, 156; images inspected | new remark (p.120), repaired theorem statement and injectivity paragraph (p.125), slab constant note (p.148) and reflected-conjugate paragraph (p.156) render correctly |
| `grep`/`sed` reads of the Lean declarations listed in `correspondence.md` | read only; see that file |

Not run: no Lean elaboration, `lake build` or `#print axioms`. Mathlib is unreachable from this environment, and
the common contract says not to repeat the build. No separate wrapper document was built, because the full
monograph build covers all changed chapters.

## Final SHA-256 (after this pass)

| File | SHA-256 | Changed |
| --- | --- | --- |
| manuscript/existence/fullmesh-correlation-cauchy.tex | 0c9564cdb324646022848b6723d8de4ffe7e638a028ced2bac1517db853a6846 | no |
| manuscript/existence/limits.tex | 0566a62b82f3d91586e656f931d0dd62c777d54dc25f8aa109d73ae66f751387 | yes |
| manuscript/existence/smooth-limits.tex | d7e499a5b4984759780fb64d9cec3949f15f170e246564c5b14853fd31278c9d | no |
| manuscript/existence/fullmesh-fixedbounds-producer.tex | ba1f2e020f576f3c0780d4e621b5a94aaaa34d13ae470ad292a04e9c4b56bc0f | yes |
| manuscript/existence/phase-quantitative-producer.tex | e0704a203e7b5a05aaf26b7b40c7fd12828fe6e03bf76161240dba0859960ca4 | no |
| manuscript/existence/reflection.tex | a3600967845dcf8654a3ef0f757a62524350125ba9c3b92684ac982db33c8393 | no |
| manuscript/existence/phases.tex | 4fa43b52ce4667c835c649efcd884294782f2a2db603b60beb24c5ecffe5065b | no |
| manuscript/existence/actual-slab-copy-bounds.tex | 65d4c923281781664b100ca0ee3dbc50b8def489cc1c9fa8694648e0ba98d104 | yes |
| manuscript/existence/slab-regularity.tex | 28cba28763a226c2b7c51c26758114e33cb25b775968afb2a021015385e09a4a | no |
| manuscript/existence/phase-selection.tex | 76adab11cc2aae6f37f6d8de2332cf28ef7afece2a68e2bc2d41defd4ef98a2a | no |
| manuscript/existence/phase-regularity.tex | ca8cf3864927ef5d6d9a64a70f88ea31bb6340559320be56d52a56ed5bf100fd | no |
| manuscript/existence/reflection-transport.tex | 199dd0ea7002fb8fa3fd18d423154f83b7c4cba6136e7fb75913054c1f09a9bf | yes |
| manuscript/existence/phase-fields.tex | ae206df6a01329cc2c333144a235fff1f548feaf7e59b443e7aee1e430c6b02e | no |


## Revision 1 (session `ADB991-claude-20261113-80e9`, issue #122)

Branch `claude/issue-122-80e9`, cut from `origin/codex/existence-monograph` at `5ec6941`. Commands run from the repository root:

| Command | Result |
| --- | --- |
| `sha256sum` of the seven chapters at the base, compared with `review/mathematics.md` | 7/7 equal the reviewed hashes (the chapters had not changed since `6fa64da`) |
| `grep`/`sed` reads of the Lean declarations listed in `correspondence.md` (revision 1 section) and `revision-1.md` | read only |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |
| `git diff --check` | clean |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (TeX Live from Ubuntu apt) | exit 0; 961 pages; no undefined references or citations; one pre-existing warning (`amsmath: Foreign command \atopwithdelims`, not in C03 files). Built out of tree; the tracked PDF is not changed |
| `pdftotext` to locate the changed passages; `pdftoppm -r 60` on pages 129, 132, 135, 136, 140, 144, 166, 167, 170; images inspected | the revised remark (p. 129), index-set definition (p. 132), centring citation (p. 135), station block (p. 136), (H1)–(H6) (p. 140), use of (H4) (p. 144), commutation paragraph (p. 166), two-input application (p. 167) and detector application (p. 170) render correctly; cross-references resolve |

Not run: no Lean elaboration, `lake build` or `#print axioms` (Mathlib is unreachable from this environment).

Final SHA-256 of the changed chapters (the other six C03 chapters are unchanged):

| File | SHA-256 |
| --- | --- |
| manuscript/existence/limits.tex | a55d8e8648688a63323b012a838108733218e2a76d3242a66820570d6d561624 |
| manuscript/existence/reflection-transport.tex | a9bde9510a370e867b5ef45e06c8227f03776d93171056b5c6027447b11e6ff0 |
| manuscript/existence/phase-quantitative-producer.tex | a9f6a0370186a5dbe3c96a04772a9f61ecdfd2b52f5d47cdfc9acdbd03203e6f |
| manuscript/existence/fullmesh-fixedbounds-producer.tex | ebc6177eb2bd4fa98dd0b75d336d49916a6ccfc7407694436cbef3bdf4922c7a |
| manuscript/existence/fullmesh-correlation-cauchy.tex | 19e0825603d24d9f6a8ac2fbc33b62012149f039efb54c243b9034b393f478ee |
| manuscript/existence/phase-fields.tex | f584cf074ddcd6fceed1c6a65bff5e2613454a20d26831680559c924d58c29ae |
| manuscript/existence/actual-slab-copy-bounds.tex | c1e553d1cf8278716619a36c27156f1bd3245a2070dab8ad445798a907b201e6 |

## Follow-up to review #125 (issue #122)

- Basis `c560828e62b5168cd9fc51507a5751de2871efe3`; Lean pin
  `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; unchanged Lean tree
  `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. The author scope was
  rechecked after posting the claim on #122. Two isolated Codex Terra
  sessions revised the disjoint chapter groups and Parent combined the
  commits and checked the author records. Review #125 remains historical.
- `python3 scripts/check_blueprint.py` passed for four units. It verifies
  structure. `python3 -m unittest discover -s tests` passed all 22 tests.
  `git diff --check c560828e62b5168cd9fc51507a5751de2871efe3` passed.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error
  -outdir=/private/tmp/ym-c03-parent-build-20261113 existence.tex` built the
  968-page monograph. The log has no unresolved references, citations or box
  warnings. It retains the existing amsmath `atopwithdelims` warning. The
  build output is outside the checkout.
- `pdftoppm -f PAGE -l PAGE -singlefile -scale-to 950 -png existence.pdf
  page-PAGE` rendered pages 133–135, 141–143, 156–157 and 167–168.
  Parent inspected the revised theorem, threshold argument, merger
  hypotheses, commutation citation and cutoff-covariance passage.
- Source inspection is recorded in `correspondence.md`. Fresh Lean
  elaboration, axiom printing and kernel replay remain unrun. The revised
  arguments retain the stated quantitative input and same-history assumptions.
  Renewed independent review concerns the exact follow-up snapshot.

## Source-leakage pass (issue #183, session `ADB991-claude-20261113-0642`)

Base `codex/existence-monograph` @ `5d91534`. Commands run in this pass:

- `python3 scripts/check_blueprint.py`: exit 0, "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: exit 0, 22 tests OK.
- `latexmk -g -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (from `manuscript/`):
  exit 0, 978 pages, 0 undefined references, no `??` in `pdftotext` output. Changed pages rendered with
  `pdftoppm` and inspected: 136 (rows 48–49), 139–140 (gain definition, row 50), 142 (row 51 remark, row 52),
  148–150 (rows 53–55), 152 (rows 56–57).
- `git diff --check`: clean.
- Lean: source text read with `grep`/`sed` only; no Lean command, elaboration or axiom check was run.

SHA-256 of the changed chapters:

| File | Base `5d91534` | This pass |
| --- | --- | --- |
| `manuscript/existence/fullmesh-fixedbounds-producer.tex` | `b41f625235af595ec3b2c5b5f80cc51942842f5eaae1f006b63841fbc9a1b558` | `668889f30e94498f9e9cc03a34241e8c1832e4edf68a51cfce32453b52c43de0` |
| `manuscript/existence/phase-quantitative-producer.tex` | `0ecef89fe822f61972e9dc16f262aacc8358c36c82b17799be2634f01eba98bd` | `fe27c96006b4762fc99175f50846f1c62ab24d2839e4152caa8dde04a8c11feb` |
