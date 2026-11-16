# Validation and integration limits

Author session `mgubi-astra-c14-curve-r1-20261113`, starting at PR256 head `f3a0a4b485b434c2abdb5fe1bd87e132bd4d1553`. Live issue55 read at start: 28 comments, claim6864383645 latest, following review260's release. No conflicting output claim observed. Submission recheck again found 28 comments with the same claim latest and PR256 OPEN at the unchanged starting head. Parent owns submission handoff/release and inspects before publication.

## Actual checks

- Read repo contribution/coordination/proof guidance, source README, claim scope, review260's four complete reports, current chart theorem and normalization consumer, prior216/242 and immediate source declarations. Bots/shared-literature guidance consulted; no new external theorem invoked.
- `python3 scripts/check_blueprint.py`: PASS, four units; no mathematical or Lean validation implied.
- `git diff --check`: PASS.
- New `verify.py`: PASS 22 frozen/current versions and 11 imported-source manifest hashes; empty Lean/source diff. Existing author verifier: PASS 16 versions and nine imported-source hashes. The old current chapter fingerprint is preserved as an immutable input at f3a0a4b; a separate WORKTREE entry records the revised chapter. No reviewer fingerprint was changed.
- Full build from `manuscript/`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym-c14-curve-r1-build existence.tex`; PASS, 983 pages. Console log `/tmp/c14-curve-r1-fullbuild.log`, detailed log `/tmp/ym-c14-curve-r1-build/existence.log`, PDF in the same directory. No undefined references. The only overfull box is the inherited 1.82599pt box in unchanged public-run-binding lines39–47.
- Rendered with `/tmp/c14-pdf-env/bin/python` and PyMuPDF. Inspected pages836–838 and840–841, including the joint input, prescribed-scale distinction, theorem and uniform-test completion. Text and displays fit without overlap or clipping. PNGs `/tmp/ym-c14-curve-r1-build/page-NNN.png`.
- Exploratory attempt: one edit command used a root-relative path from manuscript/ and failed before changing a file; corrected from repository root. The documented main.tex build succeeded but is the three-page pilot, so it was not counted as full validation. The complete existence target above was then built. Poppler was unavailable, so PyMuPDF was used for rendering.

## PR216 integration check

Compared the canonical base chapter, PR216 at `4c141ec86b5cb20e7d837a343b26bbe91e57394a`, and this working chapter with `git merge-file -p current base pr216`, using extracted files under `/tmp/c14-r1-*.tex`. The command returned four textual conflict regions in `/tmp/c14-r1-combined.tex`: prescribed-scale opening, post-selection qualification, gallery premises, and final input summary. This is not a clean-merge claim or a combined build.

The optical subsection does not conflict. During integration, retain PR216's eventual optical comparison and source-caveat repairs, but retain this response's universal-over-admissible-choices chart theorem and the relocation of calibration premises into its separate one-curve joint input. Preserve the explicit prescribed-sequence hypothesis and the all-sequence downstream caveat. PR216's firesky cross-reference concerns the stronger funded prescribed-sequence route; its existence does not turn Stations.ranging into that route. Reconcile the closing ledger accordingly. Those four overlapping prose regions require integration review; no PR216 edit or record is included in this response.

## Not claimed

No Lean build/elaboration/axiom audit, analytic supplier construction, all-sequence calibrated-trace production, or whole-C14 review. No checker test suite was run because the checker was not changed. Parent inspection is author-side integration checking; renewed independent mathematics/source review of this new fingerprint remains required. No formal approval, merge, closure or human acceptance.
