# C08 validation

Author draft snapshot f5e0a726fb62c3a8bd649a52785f0a44ab8345b3, based on the released checkpoint 9d11cca4644bad07126bfa372cc85fb120dee7ba.
The draft PR applies the four changed chapter files byte for byte to target
9d055ef0c168f7c0e647ba8276358eb95f0c2669. Comparison with the released checkpoint found no upstream changes
to these chapters or the C08 results directory. The tracked Lean tree
328ad19b404d2db2a578319ea3e4eba4b27e34ef matches the pinned source 3456e5e75cf8d4cd558955a5c7638fba2d68f464.

The author ran \`latexmk -pdf -interaction=nonstopmode -halt-on-error\` on the
released manuscript assembly with these four chapter files, using a scratch
output directory. The final 872-page build succeeded. The final log contained
the inherited amsmath warning. The recorded checks found no undefined
references, citations, duplicate labels, or overfull/underfull boxes.
The author rendered and inspected the changed pages, including the final
warning estimate on page 370. This is validation of the released-base assembly.
The current target assembly was not rebuilt. Earlier successful 876- and
877-page scratch builds used pinned consumer chapters and preceded the final
high-degree edit, so they provide historical rendering evidence.

Parent reran \`python3 scripts/check_blueprint.py\` in the author checkout
(two units, structure only), and \`git diff --check\` from the release to the
author snapshot. Both passed. The public chapter fingerprints are recorded
in \`fingerprints.md\` and \`manifest.json\`.

Checker alpha performed an independent interim mathematics and textual
Lean-correspondence review of the Gaussian reassembly and leaf expansion
edits under their stated hypotheses, with no local mathematical defect
identified. The reviewer inspected the saved build evidence. The chronology
of the limited compatibility build was clarified after that review.
The same two chapter files are carried here. The later singleton and
high-degree changes, the full current package, and cross-package interfaces
require independent review. Fresh Lean elaboration, axiom queries, and kernel
checks were unrun. Human acceptance is pending.
