# Validation of the draft public candidate

## Snapshot and scope

- Target base: `d3bb3ded6a7145087456df1f4eab886dc5f622c7` on `codex/existence-monograph`.
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- The owned mathematical section is byte-identical to the independently agent-reviewed author draft. The complete tracked `Lean/` tree is identical between that author snapshot and this target base.
- The public package contains the section, unit metadata, correspondence, this validation record, the integration handoff and a reproducible wrapper. Formal review approvals remain null.

## Commands actually run

1. `python3 scripts/check_blueprint.py` — passed, 3 units.
2. `TEXINPUTS=manuscript//: latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=../build-public34 blueprint/units/YM-000034/evidence/wrapper.tex` — produced a 24-page PDF.
3. `pdftoppm -f 11 -singlefile -scale-to 1300 -png wrapper.pdf page11` and the corresponding command for page 24 — succeeded; rendered pages inspected.

The 24-page wrapper has two undefined external labels, `eq:ope-match-distance` and `eq:ope-match-norm`, in the unchanged OPE-filtration support. Both labels are supplied by `manuscript/existence/ope-grid.tex` in the full assembly. No overflow is reported. Parent rendered and inspected pages 11 and 24; these changed-section pages have readable formulas and intact margins.

## Limits

No fresh pinned-toolchain Lean elaboration, `#check`/`#print axioms` replay or kernel replay was run for this public candidate. The required Lean 4.32.0 environment/cache was unavailable locally; an unrelated installed version is not substituted. Textual source inspection and recorded import/axiom findings in `correspondence.md` are evidence with those limits, not a claim of fresh kernel verification. The separately owned source audit in #37 is not represented as completed here.

The wrapper validates this local section with its declared support; it does not build or accept the full existence argument. The retained quantitative inputs remain explicit draft obligations. Independent responsible human mathematical and Lean-correspondence acceptance is still required.
