# Validation

Run in isolated clone /tmp/ym55-completion-20261116 at base81fea8d.

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym55-build existence.tex`
  from manuscript/: success, 1197 pages. Final log reports no undefined or multiply-defined references.
- Rendered changed proof pages with macOS PDFKit via Swift; inspected pages
  905,944,947,970,993,1017. Mathematical displays and paragraph layout are legible;
  the corrected arrow on page1017 was re-rendered and rechecked after final build.
- First Swift invocation could not write its default module cache; reran successfully
  with `-module-cache-path /tmp/ym55-swift-cache`. No escalation was needed.
- `python3 scripts/check_blueprint.py`: Blueprint structure OK,4 units.
- `git diff --check`: success.
- All10 changed manuscript SHA-256 hashes occur in the independent review reports;
  verification script asserted each equality before publication.
- `git diff --name-only -- Lean source`: empty. Lean and the source pin unchanged.
- Latest canonical fetch before publication remained81fea8d. Live issue55 was
  rechecked; no conflicting claim appeared after claim6916305618.
- No Lean compilation or new axiom audit run. Source review is textual. No generated
  PDF or shared integration file committed. The user's original workspace PDF is
  untouched; all writing/building occurred in the isolated clone.
