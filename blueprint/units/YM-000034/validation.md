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

## 2026-11-13 revision for issue #34

- Isolated checkout `/private/tmp/ym-issue34-revision-20261113`, branch
  `codex/issue-34-revision-20261113`; fetched upstream basis
  `bac6004b01919c9d0e5958bdadc85e2d34f22732`. The Lean tree at the basis is
  `328ad19b404d2db2a578319ea3e4eba4b27e34ef`; the source pin remains
  `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Rechecked the live issue and claim, original PR #70, reports in #128,
  and the source entry points and immediate definitions listed in the
  revised correspondence. No current overlapping author claim was observed.
- A Python scan found 18 distinct `ref`/`eqref`/`autoref` targets in the
  original branch chapter, 15 labels in `ope-filtration.tex` and an empty
  intersection; no local `newcommand`, `renewcommand`, `def`,
  `DeclareMathOperator` or `newtheorem` definitions were found in that file.
  This justifies removing it from this wrapper and unit support list. The
  subsequent two-pass LaTeX log independently checks the resulting local
  references.
- `python3 scripts/check_blueprint.py` passed: 4 units, with no Lean or
  mathematics verified. `git diff --check` passed during authoring; final
  committed-diff whitespace and unit fingerprint are recorded below.
- From `manuscript/`, twice ran `pdflatex -interaction=nonstopmode
  -halt-on-error -jobname=issue34 -output-directory=/private/tmp/ym-issue34-tex
  ../blueprint/units/YM-000034/evidence/wrapper.tex`. Both passes exited 0;
  final PDF has 20 pages, with no undefined references or over/underfull box
  warnings. `pdftoppm -f 14 -l 20 -scale-to 1100 -png` rendered the revised
  pages; all seven were visually inspected, including test and recording
  hypotheses, raw-fast proposition and washout proof.
- No fresh Lean elaboration, axiom print, import-closure audit or kernel
  replay was run. The prior agent review does not carry to the new
  fingerprint. Local wrapper validation is not full-manuscript integration;
  the same-data chart, quantitative purchases, recording and physical trace
  producer obligations remain separate.
- Revision unit fingerprint from `python3 scripts/check_blueprint.py
  --fingerprint YM-000034`: `01500ca93fd84b5d773c55a5fc4c4467f972175de13dce410f8f3bc8b12ed989`.
  This includes the revised correspondence and the three manuscript paths
  retained in `unit.json`. Prior reports and null approvals are unchanged;
  they do not certify the revised fingerprint.
- `git diff --check bac6004b01919c9d0e5958bdadc85e2d34f22732
  0da39b29c8321989e55065d8c4a6af609cd9df85` passed on the committed
  mathematical revision. The final candidate adds only this validation line
  and its updated manifest entry; its committed diff is also checked.
