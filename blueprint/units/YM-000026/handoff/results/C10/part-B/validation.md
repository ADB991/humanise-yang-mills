# C10 part-B validation (commands actually run, 2026-11-12)

Worktree `/home/jo314/ym-wt/c10`, branch `claude/c10-author`, base `80be46a`. No commit, push or GitHub post was made.

## Hashes (SHA-256)

| Chapter | Before (from `c10-start-hashes.txt`) | After |
| --- | --- | --- |
| `classical-stationary-vertices.tex` | 40a22ff050d43d1df00657a9c7b2d02b2872420eb0ff2465bf2b54c1a45a5f2b | 56b010e88895f14a006cfaecd0525ac138d7eb7593a3fdf5ff20628432c491eb |
| `annulus-fleet-face-estimates.tex` | e07280594b35c5ae41ae70f0a549982b638f0186d3e9fb8a78bb3c24f9bc8727 | e27e691b17948d45c32bad54e117bb83e7e19d348f3e0472a1bb8842c38f6182 |
| `annulus-two-wave-estimates.tex` | adc35ff0bd3ae5f33bf22b548a85de49bea218ab7f1c6599f081fcb4d4ba40b8 | 7aa0211039fb33a7144e7f529cb341feda57bf2b828800320a096f1733ec7e0d |
| `annulus-recording-yield.tex` | 0d096770b3a84aec96f9a59ddcdf49476abd944a01adf58c4137d9037a1ef608 | f27088a05595a1fb09ba7542610db40b8d36ef5fd09997216e2fa05f7e2d091b |
| `annulus-same-data-binding.tex` | 095be0354ac9e6f715fb18ded93d62dce4201427195a4685a04d1f2f0ce613ba | 1dd1d1ec16f2d9480bcc8444919eb95fab812422821f8796038dd70385f4879d |
| `stationary-germ-symmetry.tex` | 340d602e93352d876efa4caffbf645e3ecd0f3e9bdf33ebbbf223c4c5f4fb023 | 8020bd109bfe0468374cd2e5c5857596cb099259c61415d823c2394f033a08f5 |
| `stationary-output-construction.tex` | 33913d09974f195d4533d78df8a5619e4eb98df4eb661af7febe5c23cc8b31c5 | 9e7cb3b2f1e34ec0bec40cd476c337eec3675af4d359a53d0bb1c72ab4eb2ab4 |
| `inherited-loop-transport.tex` | 8ee9f3df1f703de6212ba99629e1ebec89d1477085274ede4e0eb3e3962a6e18 | 13acb30f2b23561329facaf771b44cedd27328e99118d1a714f24da1a44c9281 |
| `quadratic-pole-transport.tex` | d7814c03f1488a4c21bbc9b706cb8fbccb7963d99f4fc4ff6f11dd2cf03f76b2 | 2476144f4516574592dcdfc563196789a0ef492ecdaf98496e5ab1418850ab33 |

The "before" value of `classical-stationary-vertices.tex` was confirmed with `git show HEAD:… | sha256sum`. All nine chapters changed.

## Commands and results

| Command | Result |
| --- | --- |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` in `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c10-build-part-B/` (wrapper: `article` 11pt, `\input` of `manuscript/preamble`, `mathtools`, `mathrsfs`, the theorem environments of `existence.tex`, the nine chapters by absolute path) | exit 0; 44 pages; no LaTeX errors; no undefined control sequences; 0 overfull boxes after one display was reformatted (first build: one overfull hbox of 7pt in the fleet chapter) |
| `grep` of undefined references in `wrap.log`, each checked with `grep -l "label{…}" manuscript/existence/*.tex` | 20 undefined labels, all defined in chapters not included in the wrapper: `eq:ex-actual-gauge-identity`, `sec:ex-selected-stationary-linear-data` (selected-stationary-linear-data); `eq:ex-gauge-det-factorization`, `eq:ex-thermal-determinant`, `sec:ex-thermal-contact-cancellation` (thermal-contact-cancellation); `lem:ex-soft-factorization`, `lem:ex-soft-quadratic-hessian`, `prop:ex-atom-stream-picture`, `prop:ex-greyson`, `sec:ex-soft-curvature-receipts` (soft-curvature-receipts); `lem:path-radial-log`, `subsec:path-stationary-chart` (path-attachment-producer); `prop:ex-row-quadratic-price`; `prop:ex-wilson-stream`; `sec:ex-selected-kinetic-response`; `sec:ex-stationary-determinant-prices`; `sec:ex-weighted-frame-penalty`; `sec:ex-weighted-stationary-inverses`; `sec:multileg-curvature-lift`; `sec:stationary-action-prices`. No undefined reference to a label of the nine chapters |
| uniqueness of the 16 new labels: `grep -rl "label{…}" manuscript` | each defined exactly once |
| `pdftoppm -png -r 70 wrap.pdf pg` and visual inspection of pages 3, 8, 9, 28, 37 | new displays, the channel table, the two input items and the new propositions render correctly |
| `pdftotext` search for the new statements | located on pages 5, 27, 28, 37, 41, 44 |
| `git diff --check` on the nine chapters | clean (exit 0) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `grep`/`sed` reads of the Lean files named in correspondence.md | declarations found at the stated paths |

## Not done

- No Lean build, elaboration or `#print axioms`. All correspondence is from reading the pinned text.
- The full manuscript `existence.tex` was not built; only the nine-chapter wrapper.
- Only five of the 44 rendered pages were inspected visually; the others were checked through the log (no overfull boxes) only.
- The report files could not be written (the harness refused Markdown report writes); their text is in these appendices. `python3 scripts/check_blueprint.py` was therefore run without them.
- Part-A's chapters were being edited concurrently. The labels I cite were present in the working tree at the time of the last build; their final statements were not re-read after that.
- Not re-derived: the trajectory-price paragraph of the fleet chapter step by step; the ticket calculus behind (RY8a); `Tensor.coeff`, `ring_award`, `soda_safe_cube`, the exterior identity lemmas; the transport lemmas of `Joint/Symmetry.lean` beyond their statements.
- No literature search was needed: no external result is invoked in these chapters.
- No independent review; nothing here is an approval.

## Second round (2026-11-13), after the independent checker report `c10check/final_B.md`

| Command | Result |
| --- | --- |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` (same wrapper) | exit 0; 45 pages; no LaTeX errors; 0 overfull boxes; undefined references only to labels of chapters outside the wrapper, each found exactly once in `manuscript/existence/` |
| `grep -c "label{…}" manuscript/existence/*.tex` for the part-A labels cited by part-B (`lem:ex-soft-quadratic-hessian`, `prop:ex-greyson`, `eq:ex-actual-gauge-identity`, `eq:ex-gauge-det-factorization`, `eq:ex-thermal-determinant`, `prop:ex-atom-stream-picture`, `lem:ex-soft-factorization`) | each present exactly once at the time of the build |
| `pdftoppm -png -r 70`, visual inspection of pages 10 and 26 | the film definition, channel table and the mesh-mean display render correctly |
| `git diff --check` on the nine chapters | clean |
| Lean reads: `matinBeige`, `cant`, `cant_at`, `pelt`, `pelt_ticket`, `wineShift`, `wineM`, and the proof scripts of `Fleet.tadControl`, `Fleet.cool0`, `Fleet.brass` | as described in findings.md, second round |

SHA-256 after the second round:

| Chapter | SHA-256 |
| --- | --- |
| `classical-stationary-vertices.tex` | dbcf15dc4bc64168d4c6955b07e73fd65f0c17958e73ba7a57ec3b051cb30ecc |
| `annulus-fleet-face-estimates.tex` | f821aa29c5e403247af1b23802ebc166950beded77dfef8e2061f2f650b9985a |
| `annulus-two-wave-estimates.tex` | 7aa0211039fb33a7144e7f529cb341feda57bf2b828800320a096f1733ec7e0d (unchanged) |
| `annulus-recording-yield.tex` | f27088a05595a1fb09ba7542610db40b8d36ef5fd09997216e2fa05f7e2d091b (unchanged) |
| `annulus-same-data-binding.tex` | e01c4c26d9ed34d4d5dd79e6118b40cc3eb51a3a2ab579dbb726b782b493ee32 |
| `stationary-germ-symmetry.tex` | 8020bd109bfe0468374cd2e5c5857596cb099259c61415d823c2394f033a08f5 (unchanged) |
| `stationary-output-construction.tex` | ae91401bd456d21a2a18f93fcb5b2a7591905bc3f5f560fb5ca254e6d22060b0 |
| `inherited-loop-transport.tex` | 13acb30f2b23561329facaf771b44cedd27328e99118d1a714f24da1a44c9281 (unchanged) |
| `quadratic-pole-transport.tex` | 2476144f4516574592dcdfc563196789a0ef492ecdaf98496e5ab1418850ab33 (unchanged) |

Not done in the second round: no Lean build; the full `existence.tex` was not built; part-A's chapters were still being revised, so the cited part-A statements were not re-read after the label check. Four rows of `ledger.md` were first rewritten with a short script before I switched to the Edit tool; the content is as now on disk.

## Revision 1 (13 November 2026, coordinating session)

After review finding R1 (draft PR #99): `annulus-same-data-binding.tex` edited to name the fixed-film ticket input (T) and to carry it in `prop:ex-annulus-estimate` and the summary after it. New SHA-256: `7e3a0f5fe739ade9222cd2e4b57d3f6845d80621dbf7b53af225010833be764c`. Full `existence.tex` build with `latexmk`: exit 0, 938 pages, no undefined references, no overfull boxes. `git diff --check`: clean.
