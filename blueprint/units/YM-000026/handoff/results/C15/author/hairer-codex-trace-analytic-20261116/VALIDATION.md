# Validation

Final integrated manuscript SHA-256:

- trace-firesky-gallery.tex: 39c6d0459becbaa0ab7fa75c779eeac09ce437d659d9572933fe02ea8a575339
- trace-scribe-producer.tex: 78844a97748b4d555aa6d56c1b7d73b2d57ae0c45491053bdf53c6594ef43e3a

Commands actually run in the isolated integration clone:

- From manuscript/: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build-analytic existence.tex`: PASS, 1149 pages.
- Final log scan: no undefined or multiply-defined references. Two initially unresolved references were corrected to explicit citations of the external branch unit before this final build.
- `python3 scripts/check_blueprint.py`: PASS, 4 units. This is a structural check, not mathematical verification.
- `git diff --check`: PASS.
- PDFKit rendered new proof pages 970, 971, 973, 978, 979, 1096, 1097 and 1101; inspected. Endpoint display was split after visual inspection, rebuilt and rechecked on page978. Existing unrelated overfull boxes remain elsewhere.
- Independent mathematical and textual-source reviews: PASS in CAPACITY-REVIEW, STAMP-REVIEW, JETS-REVIEW at final integrated fingerprints. Scope limitations in those records apply.

No Lean source changed. No Lean elaboration/kernel replay run. Prior review snapshots and the user's modified local PDF were left unchanged. Build artifacts are not part of this submission.
