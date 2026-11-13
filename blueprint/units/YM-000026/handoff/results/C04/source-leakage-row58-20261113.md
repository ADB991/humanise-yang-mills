# C04 source-leakage response: row 58

- Issue #184; audit #159, report PR #164, inventory row 58 (class B).
- Session `TrishenGunaratnam-codex-c04-coordinates-20261113`; claim https://github.com/hairer/humanise-yang-mills/issues/184#issuecomment-6859980095, valid until 2026-11-14 12:00 UTC.
- Base `2017d6f3ee648beb054322e9b994eb3c757cbcf6`; source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; `Lean/` tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.

| Audit row | Disposition | Correspondence and qualification |
| --- | --- | --- |
| 58, `complex-heat.tex` | B confirmed. Remove only “as does the formal source”; retain the two manuscript conventions and coordinate-permutation discussion. | `YM.Axis = Fin 4`, `YM.SpaceAxis = Fin 3`, and `YM.timeAxis = Fin.last 3` in `Lean/YM/Space/Index.lean`; `YM.Mink.divide` maps a four-vector to `(spatial x,time x)` in `Lean/YM/Mink/Geometry.lean`. Thus the formal coordinate representation and `statement.tex` use time last. The passage in `complex-heat.tex` presents time first with index 0 and the permutation `(t,x) ↔ (x,t)`. |

**Existing mathematical caveat, not resolved by this editorial row.** `results/C04/review/rereview-revision1.md`, issue 1, identifies that the adjacent wording “to themselves” and “verbatim” conflates passive coordinate identification with preservation of fixed coordinate objects. For the permutation matrix C, the correct conversion is `eta_last = C eta_first C^T` and `L_last = C L_first C^(-1)`; the corresponding cones are identified under this conversion. That review also notes that the Euclidean insertion points in `analytic-boundary.tex`, `heat-vectors.tex`, and `lorentz-covariance.tex` retain time-last notation. The present narrowly authorized change preserves the surrounding mathematical wording and does not resolve that review finding. `YM.Mink.m`, `YM.Mink.cone` (`Lean/YM/Mink/Geometry.lean`) and `YM.Mink.Proper` (`Lean/YM/Mink/Lorentz.lean`) use the distinguished time coordinate in the definitions inspected. The correspondence statement does not assert that the permutation preserves the same fixed matrix or cone.

**Review requirement.** This edit removes a source-comparison clause from a sentence containing a mathematical convention. Issue #184 requires independent review by a different GitHub account for edits to sentences with mathematical content; that review remains outstanding. Existing review fingerprints are not refreshed. No Lean elaboration or axiom replay is claimed. No upstream mathematical input is discharged by this editorial change.

## Validation performed

- Base chapter SHA-256 `f22685be41a0255a1441ad4d98ddef46666e32f293ed4979ffebf7ee98b46ad0`; edited chapter SHA-256 `6244fe9aeec28cc871a96662141af784845d663a62b853d48de0af3a9128abd1`. The sole manuscript change deletes the source-comparison clause; no coordinate or metric words were changed.
- `python3 scripts/check_blueprint.py`: passed (`Blueprint structure OK: 4 units. Lean and mathematics were not verified.`).
- `git diff --check`: passed; repeat staged check before commit.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/ym-c04-coordinates-build existence.tex`: exit 0, 978-page PDF. The log has no undefined-reference, undefined-citation, or multiply-defined-label warning. It has an `amsmath` `\atopwithdelims` notice and an overfull 1.82599pt box in unrelated `public-run-binding.tex` lines 39–47.
- `pdftoppm -f 173 -l 176 -r 100 -png` rendered the chapter and neighboring pages. Visual inspection found the changed coordinate paragraph on PDF page 175 legible and unclipped.
- The checkout was cloned locally from a repository containing the exact checkpoint because `git ls-remote upstream` failed with DNS resolution; its `origin` was set to the contributing user's fork and `upstream` to the canonical repository. An initial post-clone setup command was mistakenly run from `/private/tmp` and failed without changes to the clone; it was rerun from the clone. `pdftotext` and the Python `fitz` module were unavailable; page location was established from the LaTeX log and the rendered pages. A search including nonexistent `Lean/YM/Relativity` reported that missing directory; relevant existing `Space/` and `Mink/` definitions were inspected separately.
- No tests of the checker were run (it was not changed), no fresh Lean build or axiom audit was run, and no external article was consulted for this editorial change.
