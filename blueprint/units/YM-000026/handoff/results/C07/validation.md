# C07 validation

The eight revised chapters match author snapshot 35173bd5c8e33a8eaed6e35531739d85ac061aae, based on the
released checkpoint 9d11cca4644bad07126bfa372cc85fb120dee7ba. Comparing the release with the PR base 81538d6dcf2e71f24cc74a4afc556dd015046691
found no competing changes to those chapters or the C07 record directory.
The tracked Lean tree 328ad19b404d2db2a578319ea3e4eba4b27e34ef matches the pinned revision 3456e5e75cf8d4cd558955a5c7638fba2d68f464.

The author ran the structural checker, whitespace checks and full LaTeX
builds on the released assembly using pdflatex with nonstop interaction
and halt-on-error. The last recorded build succeeded with 874 pages. The
author rendered and inspected the changed passages. The recorded diagnostics
found no unresolved references or layout errors in the final assembly.
The existing amsmath warning was observed in the build history. Parent
reran python3 scripts/check_blueprint.py in the author checkout (two units,
structure only), checked the committed diff for whitespace errors, verified
all 30 entries in the frozen author-review manifest against committed bytes,
and confirmed the saved PDF has 874 pages. The current target assembly was
not rebuilt for this draft.

The author compared 9,477 Lean files with the checked-in source checksum
manifest without a missing file or mismatch in that subset. The full
manifest check reported 9,497 matching entries and ten missing verification
logs. The pinned Lean 4.32.0 and compiled dependencies were unavailable
in the author checkout. Fresh Lean elaboration, per-declaration axiom
queries, kernel replay and Comparator were unrun. The earlier
[source audit](https://github.com/hairer/humanise-yang-mills/blob/9d11cca4644bad07126bfa372cc85fb120dee7ba/source/evidence/axioms-3456e5e.md)
reports propext, Classical.choice and Quot.sound for the 17 release roots
and discloses the reference Challenge.lean placeholder used in type
comparison. It supplies historical endpoint evidence, with no fresh
per-declaration C07 result.

The author checked the hypotheses of [Jaffard (1990), Proposition 2, p. 464](https://www.numdam.org/item/AIHPC_1990__7_5_461_0/)
for qualitative inverse localization. The manuscript retains its explicit
weighted-conjugation proof for period-uniform constants and principal
windows. Dimock's finite-cube axial gauge and Demko–Moss–Smith's band-matrix
inverse decay were examined as background.

Independent mathematics and textual Lean correspondence review of the
eight changed chapters and exact C08 interface are pending. Earlier
bounded reviews retain their original scope.
