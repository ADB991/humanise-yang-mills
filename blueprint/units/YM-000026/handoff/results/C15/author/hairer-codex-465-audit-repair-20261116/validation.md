# Integration validation

Final ten-file manuscript snapshot: see authored-files.json and the independent review's final fingerprints.

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build-audit-repair existence.tex` from manuscript: success; 1189 pages, 6137040 bytes.
- Final TeX log: no undefined or multiply defined references. Existing manuscript layout warnings remain; this is not a claim of a warning-free whole monograph.
- `python3 scripts/check_blueprint.py`: structure OK, 4 units; this checks neither Lean nor mathematics.
- `git diff --check`: pass.
- Rendered pages 1062, 1063, 1073, 1074, 1095, 1132, 1150 and 1151 inspected for legibility, clipping and overlap. Pages 1063 and 1151 re-inspected after the final wording clarifications. No material rendering problem seen in this sample.
- Independent mathematical reviewer rechecked the final clarifications and all ten hashes; bounded PASS for audit A1–A5/B and endpoint application. Two Luna agents checked pinned Lean text; no Lean elaboration or kernel replay.
- Build artifacts are excluded. Imported Lean and the user's original workspace PDF are untouched.

Baseline published tree d8bc5bf531312f2cdfa03267fe10922f23cd2186 was reproduced before edits; publication is a child of PR465 head59cca1dd759daa18984d0c8e200b0b461a0e3c11, not a replacement branch history.
