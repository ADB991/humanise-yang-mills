# Validation of the draft public candidate

## Snapshot and scope

- Target base: `d3bb3ded6a7145087456df1f4eab886dc5f622c7` on `codex/existence-monograph`.
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- The owned mathematical section is byte-identical to the independently agent-reviewed author draft. The complete tracked `Lean/` tree is identical between that author snapshot and this target base.
- The public package contains the section, unit metadata, correspondence, this validation record, the integration handoff and a reproducible wrapper. Formal review approvals remain null.

## Commands actually run

1. `python3 scripts/check_blueprint.py` — passed, 3 units.
2. `TEXINPUTS=manuscript//: latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=../build-public33 blueprint/units/YM-000033/evidence/wrapper.tex` — produced a 18-page PDF.
3. `pdftoppm -f 11 -singlefile -scale-to 1300 -png wrapper.pdf page11` and the corresponding command for page 18 — succeeded; rendered pages inspected.

The 18-page wrapper has no undefined references. Its inherited receiver-lemma paragraph has a 5.3389pt overfull box; the changed section has no reported overflow. Parent rendered and inspected pages 11 and 18.

## Limits

No fresh pinned-toolchain Lean elaboration, `#check`/`#print axioms` replay or kernel replay was run for this public candidate. The required Lean 4.32.0 environment/cache was unavailable locally; an unrelated installed version is not substituted. Textual source inspection and recorded import/axiom findings in `correspondence.md` are evidence with those limits, not a claim of fresh kernel verification. The separately owned source audit in #37 is not represented as completed here.

The wrapper validates this local section with its declared support; it does not build or accept the full existence argument. The retained quantitative inputs remain explicit draft obligations. Independent responsible human mathematical and Lean-correspondence acceptance is still required.

## 2026-11-13 author revision (issue #33)

- Isolated checkout `/private/tmp/ym-issue33-revision-20261113`, branch
  `codex/issue-33-revision-20261113`; upstream branch fetched at
  `84a6a9371caddd2f9967b9d6924e156ec097610e`. Source pin unchanged;
  `HEAD:Lean` at the basis is `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.
- Read the live claim, original PR #71 and mathematics/Lean review reports
  #126 with corrected R2 in #127, and the source declarations and their
  immediate inputs listed in the revised correspondence.
- `python3 scripts/check_blueprint.py` passed: 4 units, no Lean or mathematics
  verified. `git diff --check` passed during authoring. The final fingerprint
  and final staged whitespace results are recorded in the candidate handoff.
- From `manuscript/`, `pdflatex -interaction=nonstopmode -halt-on-error
  -jobname=issue33 -output-directory=/private/tmp/ym-issue33-tex
  ../blueprint/units/YM-000033/evidence/wrapper.tex` was run repeatedly;
  the final two passes exited zero, 21 pages. `pdftoppm` rendered pages 14–20;
  the initial render and final render of pages 19–21 were inspected. A
  stranded lemma heading was corrected and checked. There is an inherited
  5.3389pt overfull box in the unchanged receiver support chapter. The final
  log reports only the documented external references
  `prop:ex-lattice-charge-bounds` (twice) and
  `prop:ex-trace-mission-price-transfer` (once); their definitions exist in
  `trace-local-charge.tex` and `trace-mission-price.tex`, outside the wrapper.
- Two attempted Python edits ran with `manuscript/` as cwd while using a
  repository-relative path and failed with `FileNotFoundError`; each was
  rerun successfully at repository root. The shell continued to a TeX build
  after those errors. A `pdftotext` layout attempt failed because the command
  is unavailable; rendering and visual inspection used `pdftoppm` instead.
- No fresh Lean elaboration, target axiom print or kernel replay was run.
  The wrapper does not establish the full manuscript or the upstream chart,
  response, priced-mission and common-data producers. The pre-revision
  independent review and its fingerprint are not carried to changed content.
- Revision unit fingerprint from `python3 scripts/check_blueprint.py
  --fingerprint YM-000033`: `ad3b82466a1b69b610548e1af518251def5ac1cd4a6bc5757a91b3cc46cba4aa`.
  This fingerprints the revised correspondence and the five manuscript paths
  listed in `unit.json`; the two prior review reports and null approvals are
  unchanged and do not certify the new fingerprint.
