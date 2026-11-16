# Actual validation and remaining limits

Base PR256: `f9ddbdbb6eead22d18611fe7460e6ea35a56658e`. New increment: the bounded passages of trace-calibration-producer.tex and actual-stress-normalization.tex, plus five records in this directory. The PR against canonical also includes the inherited PR256 dependency. Prior author/reviewer files are immutable; their fingerprints are not refreshed.

## Checks run

- Read live issue280 body and comments at start: only claim6865255138, expiring 2026-11-14 12:30 UTC. Read complete mathematics/source reports of reviews269 and260 and the prior PR256 author response/validation, together with the current theorem, gluing proof and normalization consumer. Source declarations and immediate receipts/callers are listed in correspondence.md. Read repository guidance and consulted the prior shared literature/Bots search; no new external theorem is invoked.
- Final submission recheck: issue280 open with the same sole unexpired claim; PR256 open/draft at unchanged `f9ddbdbb6eead22d18611fe7460e6ea35a56658e`; canonical base unchanged at `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. New fork branch absent before publication.
- `python3 blueprint/units/YM-000026/handoff/results/C14/author/mgubi-astra-c14-chart-validity-20261113/verify.py`: PASS38 frozen/current versions,10 inspected source/toolchain/dependency hashes matching the upstream checksum manifest, unchanged source metadata and all old PR256 records. Imported Lean tree: `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. This is a bounded import check, not a full archive replay.
- `python3 scripts/check_blueprint.py`: PASS, four units. The checker verifies blueprint structure, not mathematical validity.
- `git diff --check`: PASS. The only manuscript diff is the two scoped chapters; the new record directory is the only other increment.
- Full `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym-c14-chart-validity-build existence.tex` from manuscript/: successful 984-page build. An initial10.28549pt overfull line in the new corollary proof was removed by shortening that sentence. The final build has only the inherited1.82599pt public-run-binding box at lines39–47 and no undefined-reference or compilation error. Final log/PDF are `/tmp/ym-c14-chart-validity-build/build-final.log` and `/tmp/ym-c14-chart-validity-build/existence.pdf`.

- Rendered the final PDF using PyMuPDF and visually inspected pages836–837 (one-curve input),839–841 (radius notation, validity theorem, prescribed-sequence corollary and completion), and846 (completed-U consumer). Images are `/tmp/ym-c14-chart-validity-render/page-836.png`, `page-837.png`, `page-839.png`, `page-840.png`, `page-841.png`, and `page-846.png`. All changed text, equations, references and page transitions are legible. Page842 was rendered as a boundary only. The consumer uses a named hyperlink to the completion paragraph, avoiding the inherited numeric value of an unnumbered paragraph label.

## Separate PR216 compatibility check

Extracted canonical `69b2631` and PR216 `4c141ec86b5cb20e7d837a343b26bbe91e57394a` chapter blobs, then ran `git merge-file -p current base pr216` in scratch. It returns exit4 with four conflict regions in `/tmp/ym-chart-validity-combined.tex`: the prescribed-scale opening, post-selection qualification, gallery premises, and closing input summary, as already documented by the prior response. The new validity/existence split does not integrate PR216. No combined build or combined mathematical review was performed. Its eventual optical comparison and its stronger funded prescribed-sequence route must be retained when those separate patches are reconciled; they are not silently included here.

## Coverage and limits

The author checked all changed prose and its immediate proof: universal validity on a supplied chart family, the separate conditional existence corollary, the fixed-table one-curve application, and completed-U uniform tests. Parent inspection is author-side integration. The named chart receipts, optical/beam/trace/shell-flux producer obligations and same-witness requirements stay open. Review269's proposed station restriction is not used or verified. No derivative/Ward production, stronger sequence existence, whole-C14 closure or human acceptance is claimed.

No Lean elaboration, transitive axiom audit or source build was run. No checker/test implementation changed, so no project test suite was run. Independent different-account mathematics and textual source reviews remain required at the new fingerprints. All prose is draft.
