# G04 validation (commands actually run)

Basis `17b8f913d3ec1dd7d38b9b8f9756b889b2c72d1c`, branch `claude/issue-60-15a6`.

1. Label existence: a shell loop extracted every `\ref`/`\eqref` target from
   `argument-outline.tex` and grepped `\label{...}` in `manuscript/existence/*.tex`
   and `manuscript/pilots/*.tex`.
   - First run: six section labels were guessed wrong. They were corrected to the
     actual labels (e.g. `ex-phase-fields`, `sec:ex-quadratic-pole-transport`).
   - Final run: all targets resolve.
2. Environment types: for each `Proposition/Theorem/Lemma/Input~\ref{..}`, the line
   at or above the label was grepped for `\begin{...}`. Five wrong prefixes were
   fixed (`ex-centered-producers`, `ex-centered-main-bound` and
   `ex-euclidean-semigroup` are theorems; `ex-phase-original-null` is a lemma;
   `ex-pure-ground` is a theorem).
3. LaTeX: a temporary wrapper copied `manuscript/existence.tex`, added
   `\input{existence/argument-outline}` after `statement`, and appended the five
   bibitems of P2. It was built with
   `latexmk -pdf -interaction=nonstopmode -outdir=<scratch>`, and the wrapper was
   then deleted.
   - First build: exit 0, but three undefined references (`sec:running-coefficient`,
     `eq:running`). The running-coupling pilot is not included in `existence.tex`, so
     these were reworded as prose.
   - Final build: exit 0, 964 pages. The only warnings are the pre-existing amsmath
     `\atopwithdelims` warning and one 2pt overfull line. No undefined references or
     citations.
4. Rendered pages 23–28 (Section 2) rasterised with `pdftoppm -r 60` and inspected:
   - page 24 (context, plan start), 26 (Steps 4–6), 28 (table, open interfaces);
   - the section-range table was corrected after inspection: Step 5 ends at the
     third section of `phase-quantitative-producer.tex` (`ex-public-same-run-cauchy`).
5. `git diff --check`: clean.
6. `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests`:
   see the PR body for outcomes (run after these files were written).
7. Bibliographic metadata for the new citations: INSPIRE-HEP REST API
   (`inspirehep.net/api/literature?q=doi ...`). The only reachable bibliographic host;
   crossref, publisher sites, zbMATH and MathSciNet are blocked here.

Not run: Lean (the outline makes no new source claims and uses no declarations);
no independent review.
