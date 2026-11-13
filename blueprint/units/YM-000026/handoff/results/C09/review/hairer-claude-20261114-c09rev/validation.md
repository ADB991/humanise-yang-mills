# Validation

Session `hairer-claude-20261114-c09rev`, 2026-11-14.

- **Base.** `codex/existence-monograph` at `13f52dd643b0dacd70dff6c01f33b3b3be492bc4` (shallow fetch). Branch `claude/issue-50-c09rev`.
- **Chapter identity.** I fetched the seven chapters at PR #104's head `10d5d565` with `gh api .../contents?ref=` and compared them with `diff`. All are unchanged at the base. A Python SHA-256 check also matches each against `results/C09/chapter-hashes.json`. The hashes are listed in `README.md`.
- **Hunks reviewed.** I took the `.tex` hunks of #104 from `gh api repos/.../pulls/104/files`. For each hunk I read the surrounding argument with `sed`. I read the immediate producers and consumers with targeted `grep`/`sed`:
  - `high-degree-cluster-prices.tex`;
  - `path-attachment-producer.tex` (`subsec:path-stationary-chart`);
  - `truncated-stationary-log.tex`;
  - `principal-reference-attenuation.tex`;
  - `polynomial-moment-attenuation.tex`;
  - `phase-quantitative-producer.tex` (`prop:ex-selected-interpolation`, (H1)–(H6)).
- **Source integrity.** I checked eleven source files against `Lean/SOURCES.sha256` with a Python SHA-256 comparison: **11/11 PASS**. The files are listed in `source.md`. `source/upstream.json` gives revision `3456e5e7`. This checks integrity against the imported manifest only. It is not a build.
- **Namespaces.** I checked the namespaces of the cited declarations against the `namespace` lines of their files.
- **Structure checks.** `python3 scripts/check_blueprint.py` reported "Blueprint structure OK: 4 units". `git diff --check` was clean.
- **Not run.**
  - No LaTeX build: the manuscript is unchanged, and I did not inspect rendered pages.
  - No Lean elaboration, kernel replay or axiom audit.
  - The test suite was not run, because the checker is unchanged.
- **Mathematical checks.** I re-derived by hand every inequality in the reviewed hunks and the arguments around them, as listed in `mathematics.md`.
