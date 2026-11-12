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
