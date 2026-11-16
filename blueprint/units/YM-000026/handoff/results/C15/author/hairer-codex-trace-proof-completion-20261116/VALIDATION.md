# Validation and final fingerprints

All three additions passed independent mathematics and textual source-correspondence review, conditional on their explicit incoming hypotheses. Reports are adjacent. Final SHA-256:

- trace-coffer-supplier.tex: `9c39161b009a3a8b3a56dd7bbf3e203ca2e8d1a54db26049ae8ad88136b2d168`
- trace-firesky-gallery.tex: `c0db6429bc0b7afeec793cc2d53cb2e5d9d70758dd1060debe7117929d6290d8`
- trace-scribe-producer.tex: `56ebf795263c42bba04faceb1c92e5fe659e2629475a0adb3b4a299884a2bbe1`

Parent validation on the integrated final manuscript:

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build-proof existence.tex` from manuscript/: PASS, 1138 pages. No undefined or multiply defined references. Existing unrelated overfull-box warnings remain.
- Rendered with PDFKit; inspected pages 970, 972, 1070 and 1089, covering the schedule, status, planted gluing/propagation, and shell deduction. Equations and prose are legible and within the page.
- `python3 scripts/check_blueprint.py`: PASS, 4 units. This is structural validation only.
- `git diff --check`: PASS.
- No Lean elaboration or kernel replay. Reviewers checked actual imported source and manifest hashes; this is textual correspondence evidence.

Local working clone: /tmp/ym56-proof-20261116. Build log: /tmp/ym56-proof-build.log. Build artifacts are not committed.
