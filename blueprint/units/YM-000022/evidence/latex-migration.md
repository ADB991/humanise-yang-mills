# LaTeX migration evidence

11 November 2026; maintainer-directed maintenance in
[issue #24](https://github.com/hairer/humanise-yang-mills/issues/24), session
`hairer-codex-workflow-20261111`. Agent assistance: Codex; no new subagent work.

The mathematical text now has one authoritative home:
`manuscript/pilots/running-coupling.tex`, included by `manuscript/main.tex`.
The old `proof.md` and pilot correspondence page are redirects. The former
pilot's source/build record is archived in `pilot-provenance.md`; those old
validation counts are not results of this migration.

The existing LaTeX pilot's gauge normalization, elementary positivity calculation,
spacing argument and interpretation are retained. The uniform extraction is now
an explicit proposition, followed by the detailed tail-positivity and limit-rule
application from YM-000022. The running estimate remains an input. Its existence
is not proved here. This consolidation is draft mathematical content and still
requires independent review, including the inherited positivity argument.

`unit.json` now lists the section, preamble and bibliography as `manuscript`
inputs. The checker hashes those paths and contents plus `correspondence.md` and
the existing mathematical metadata. Both review entries remain null. No approval
was refreshed or invented. Changes to any listed support file conservatively
invalidate review; reviewers must check the explicit input list is complete.

## Commands and results

In the isolated checkout `/private/tmp/ym-latex-self-claims-20261111`:

- `python3 -m unittest discover -s tests`: 22 tests passed. New regressions cover
  manuscript/support edits, changed input lists, renamed/missing/empty files,
  forbidden paths/formats and escaping symlinks. Existing review/ownership/graph
  tests remain in place.
- `python3 scripts/check_blueprint.py`: passed, one unit; not a mathematical check.
- `python3 scripts/check_blueprint.py --fingerprint YM-000022`: generated the
  current digest; no acceptance attached.
- `git diff --check`: passed after removing one trailing blank line.
- Changed Markdown relative links were checked with a Python `re`/`pathlib` scan;
  all resolve after creating this evidence record.
- `git diff --name-only -- Lean`: no changes.

From `manuscript/`:

```sh
mkdir -p build
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex
pdftoppm -scale-to 1400 -png build/main.pdf build/page
```

Build succeeded, producing two pages. The initial BibTeX warning about an empty
year was resolved by recording `n.d.` for the undated HTML edition; the inspected
date remains explicit. The final `.log` and `.blg` have no warnings, undefined
references, or overfull/underfull boxes. Both pages were visually inspected for
readability and layout; the updated bibliography page was inspected again.
Build products stay under the ignored `manuscript/build/` directory.

The local build used the available TeX distribution. The added Ubuntu CI build
has not been run locally. No new Lean build, elaboration, axiom query or kernel
replay was performed during this workflow migration; existing evidence is retained
and distinguished from current structural/rendering checks. Independent mathematical
and Lean-correspondence review remain outstanding.
