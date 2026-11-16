# Validation

Base: e9ea7c447ef33913191ed9c54dbd31dd841ea47d.

- `python3 scripts/check_blueprint.py`: PASS, four units; structural validation only.
- `git diff --check`: PASS.
- `/Library/TeX/texbin/latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym337-build existence.tex`, from manuscript/: PASS, 1203 pages. Final log has no undefined or multiply-defined references.
- PDFKit rendered pages 1153, 1155, 1156; inspected the shortened receipt and endpoint statement/proof. Layout and mathematical displays are readable.
- Independent mathematical review: PASS for the bounded assembly and consolidation, at fingerprints.json identities.
- Independent source correspondence: PASS at the same identities. No Lean build or axiom replay was run.

The canonical funded-family and reconstruction hypotheses remain explicit. This supplies the trace requirement, not the separate remaining joint-existence clauses. No generated PDF or historical evidence was modified.
