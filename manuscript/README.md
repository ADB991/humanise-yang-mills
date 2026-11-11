# Mathematical manuscript

LaTeX is the authoritative mathematical text from the first draft onward.
Write sections here as soon as their local statements and input interfaces are
precise. A completed blueprint and fully proved prerequisites are not required
before writing. State outstanding inputs exactly and track their status in the
linked blueprint unit; never conceal a missing argument.

`main.tex` assembles section files with `\input`. `preamble.tex` defines shared
notation and theorem environments; `references.bib` holds conventional references.
The running-coefficient pilot is the first section, owned by
[YM-000022](../blueprint/units/YM-000022/correspondence.md). Its blueprint contains
correspondence and review evidence, not a second version of the proof.

## Build and inspect

From the repository root, with a TeX distribution providing latexmk and BibTeX:

```sh
mkdir -p manuscript/build
cd manuscript
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex
```

The result is `manuscript/build/main.pdf`. Build products are ignored by Git.
Inspect the rendered pages after changes; resolve missing references and layout
warnings before submission. CI builds the manuscript as well as checking metadata.

## Writing and review

Use ordinary mathematical language, conventional references and the shared
[notation contract](../docs/notation.md). Give complete arguments for substantive
steps not supplied by checked references. Check every cited result's hypotheses.
Keep Lean identifiers, audit logs, and source crosswalks in the blueprint.

Create a section from `templates/proof-unit/section.tex`; place its `unit.json`
and `correspondence.md` in the canonical blueprint directory. List the section
and all local mathematical support files in `unit.json`'s `manuscript` array,
including nested inputs, macros and bibliography. Shared support-file edits
invalidate every listed dependent unit's review fingerprint. Claim shared-file
edits explicitly; adding a section also needs a bounded edit to `main.tex`.

Draft status is visible in the assembled manuscript; inclusion does not imply
acceptance. Independent mathematical and Lean-correspondence reviews remain
necessary. Integration checks notation, interfaces and the full chain of inputs;
it improves the existing LaTeX rather than translating a separate Markdown proof.
