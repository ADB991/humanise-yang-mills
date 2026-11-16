# Validation of bounded C02 response

- `python3 scripts/check_blueprint.py`: passed; structural check only, not Lean or mathematical verification.
- `python3 -m unittest discover -s tests`: passed, 22 tests.
- `git diff --check`: passed before record creation; repeat on final candidate.
- `pdflatex -interaction=nonstopmode -halt-on-error -output-directory=/private/tmp/ym-c02-latex existence.tex` from `manuscript/`: three passes succeeded; output is an out-of-tree 970-page PDF. No source PDF changed. Final log checked for undefined references, multiply-defined labels and overfull boxes.
- Rendered and visually inspected pages 69, 95 and 119 of the PDF; the sampled layouts were legible and contained no clipping.
- Source inspection: `YM.MergeProof.Accent.sail` and `vista` in `Lean/YM/MergeProof/Arbol.lean`, `YM.Vac.suffices_bill` and `treasury` in `Lean/YM/Vac/Treasury.lean`; review reports and their named source locations. This is not a replay of the pinned Lean project or a fresh axiom audit.
- `git cat-file -t` for `027b4de`, `84587b7`, `383e247`, `9595b79`: each unavailable locally.
- One initial source search used an unmatched `Lean/YM/Calendar*` shell glob and failed; the correct `Arbol.lean` and `Treasury.lean` paths were inspected. Two attempted preparatory edits was run from the manuscript directory with a repository-relative path and failed without changing files; the edit was rerun from the repository root.

Independent mathematical and Lean correspondence review is outstanding; no acceptance, approval, merge, public posting or publication is asserted.

- After Checker Alpha interim findings R1–R4, `pdflatex` was rerun successfully on the revised candidate; `python3 scripts/check_blueprint.py` and staged `git diff --check` were repeated.
- Following the renewal finding on the terminal bank, reran the blueprint checker, staged whitespace check, and the LaTeX build on the corrected candidate.
