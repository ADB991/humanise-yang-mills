# G04 validation, 2026-11-13

Outline SHA-256: `60bec1c9d639e17e08ad455c9dc9cf596fc9704ea1acc0698459192c1e990b47`. Basis: `bac6004b01919c9d0e5958bdadc85e2d34f22732`; Lean revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

- `python3 scripts/check_blueprint.py`: passed, 4 units; this checker explicitly does not verify Lean or mathematics.
- `git diff --check`: passed for the tracked manuscript edit.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/g04-build /private/tmp/g04-work/existence-review.tex`, run from `manuscript/`: passed. The temporary wrapper inserts the outline after the statement and supplies five historical bibliography entries; neither change is present in the repository's main include or bibliography. The final log contained no undefined-reference, undefined-citation or overfull-box warnings. The review PDF has 974 pages.
- Rendered and visually inspected pages 23–29 of the review PDF; the section and its transition to the lattice chapter are legible, including the map and open interfaces.
- The live issue and comments were rechecked on 2026-11-13 at approximately 13:31 UTC; the claim remains unexpired and no newer claim appears.

No Lean build or independent mathematical/Lean correspondence review was run. The original first build command used an incorrect wrapper input path and failed before compilation; it was corrected for the successful builds above. An attempted combined visual contact sheet failed because the system Python lacks Pillow; pages were inspected individually instead.
