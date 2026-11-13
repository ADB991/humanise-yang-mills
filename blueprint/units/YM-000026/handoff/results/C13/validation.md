# C13 validation

The released-checkpoint build of the exact eight submitted chapter texts passed:
`latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=C13_BUILD_DIR existence.tex`
from `manuscript/`, exit 0, 874 pages. The log had no unresolved references,
duplicate labels or overfull/underfull boxes matching the checked diagnostics.
The corrected diagonal passage was visually inspected on page 679; six other
targeted pages were inspected at identical chapter content in the prior build.
Earlier author checks also included periodic axial-tree elimination diagnostics
for L = 2, 3, 4 (free links/selected plaquettes: 49/45, 244/240, 769/765).

The blueprint checker and Git whitespace check passed on the reconstructed
checkpoint. The submission preparation verified all 22 chapter hashes against
the frozen candidate and reran the blueprint and staged whitespace checks.
The build uses the released checkpoint. A combined build with later supplier
merges was not run. The Lean source is unchanged at the project pin.
No fresh Lean elaboration, kernel or axiom replay was run for this submission.
Historical source checks have the limits documented under `source/`.
