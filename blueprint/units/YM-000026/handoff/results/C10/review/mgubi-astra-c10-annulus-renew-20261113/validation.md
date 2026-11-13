# Actual validation and limits

Worktree `/tmp/ym-astra-c10-annulus-renew-20261113`, branch `codex/astra-c10-annulus-renew-20261113`, reviewed base `ddc3c90f7fcc4e10048b173e58d41f25f0107730`. All commands below were run on 13 November 2026.

## Reads and reproducible checks

- Read AGENTS, CONTRIBUTING, coordination/proof standard, source README, review template, checkpoint, common contract, agent prompt, C10 package, relevant author records and the previous bounded annulus review. `rg --files Bots` found only `Bots/README.md`; no C10 Bots note exists in this tree. Searched shared background notes for normalization/Casimir/running material.
- `gh issue view 147 --repo hairer/humanise-yang-mills --comments`, corresponding #51 comments, and bodies/comments of PR95/99/131: read claim, author revisions, old R1 and exact PR head metadata. Initial sandbox network attempt failed; authorized escalated reads succeeded. Rechecked live #147 and latest #51 comments before submission: delegated claim remains unexpired and no conflicting successor appeared.
- `cat` of both full target chapters, targeted `sed`/`nl` reads of recording-yield's hypothesis and Scope passages, current ledger/handoff and canonical running-coefficient definitions. Initial combined author-record output was truncated; relevant findings, ledger rows, handoff and revision sections were subsequently opened separately. Irrelevant portions of the full part-B audit were not relied upon.
- `git diff ebc64a227e0572bd4fe8f6ecb744f6529ef01e07 HEAD -- manuscript/existence/annulus* ...`: inspected exact revision hunks and affected author records. `git diff --name-only` confirms only same-data and two-wave changed among the four annulus files. This is why the scope remains a revision recheck.
- Python `hashlib.sha256` and `git show` comparisons froze 11 current prose/author-record files and their previous-target hashes in `hashes.json`; no old acceptance fingerprint was rewritten. Current target hashes agree with the author's revision 1/2 records. The two other annulus files are byte-identical to the prior review target.
- Python comparison of the seven source files named in `inspected-source.sha256` against `Lean/SOURCES.sha256`: all seven match. Only bounded excerpts and immediate definitions were inspected, as detailed in `correspondence.md`; a hash does not certify a whole file was reviewed.
- Focused web search for sl_N Killing-form normalization; opened MIT 18.745 Lecture 10, pp. 1–2 text, original definitions and matrix-unit calculation. Kirillov PDF open/find timed out and supplies no evidence. The independent calculation in the review does not depend on that failed fetch or on a search snippet.
- `python3 scripts/check_blueprint.py`: exit 0, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `git diff --check` and staged `git diff --cached --check`: clean.
- `git diff --exit-code HEAD -- manuscript Lean`: exit 0; protected mathematical/source files unchanged. Staged name inspection shows only the six owned review files.

Navigation failures: guessed shell globs `manuscript/*running*` and `manuscript/units/YM-000022*` did not match; `rg --files` then located `manuscript/pilots/running-coupling.tex`. A guessed `Lean/YM/Gauge/Basic.lean` path did not exist; the needed simplicity definition was read from `Lie.lean`. These are navigation failures, not mathematical checks.

## Not run or not established

No Lean build, elaboration, `#print axioms`, kernel replay, full source import verification, numerical experiment or transitive dependency audit. No LaTeX build/render, because only review records changed; the author's reported builds are not claimed as reviewer validation. No fresh proof certificate for unchanged fleet/Fourier/radial/common-strip arguments. No proof of W/S/T, no supplier closure, no other C10 chapter review, and no review of shooting/history task #136. No metadata approval, refresh of an earlier review, human acceptance, merge, or publication of the monograph.

The first `git add` could not create the shared worktree index lock under the sandbox. Authorized escalation was used to stage/commit; no credential or repository configuration was changed.
