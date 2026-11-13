# C10 part-A: validation

Session `schmittj-claude-c10-20261112`, 2026-11-12. Worktree `/home/jo314/ym-wt/c10`, branch `claude/c10-author` on `80be46a`. Nothing committed, pushed or posted. No Lean command was run; Lean files were only read.

## Hashes (SHA-256)

| Chapter | Before (`c10-start-hashes.txt`) | After |
| --- | --- | --- |
| `soft-curvature-receipts.tex` | `6bced1f690fe64fe69662da7b46ac83785f405d464a393e411b251a61081ef07` | `7427f82cbe4b9c92a1cb8bd658a60b9720435e8eaa51716d0c11c2ab266c38b0` |
| `multileg-curvature-lift.tex` | `f5adb060a319496491f8c344ffbb1036a4c6e09ad54052aa36c8c1f081740419` | unchanged |
| `weighted-frame-penalty.tex` | `6c2d0c44cf05932f947d98731cec92ce755d6559b34f6b255248efbe6e8570d6` | `349286d886015b85e9e04ddf57dee00ec10a1913d0e069d40bc3cc56ad2beb53` |
| `weighted-stationary-inverses.tex` | `6c6f512ad937a7f4e675a2fe000c1dfd1df44113feb6951a3ac17f69eb0c3441` | `46f3a95065dab9f280ca520f2cbbd58aed43a5f904cbed2ee308590fa90a1880` |
| `selected-stationary-linear-data.tex` | `2b609a230363936a82b829102cc840ca620e3efcb12562338c27023e0ce4a3e1` | `d5f20e2f39502b821ca6cd965345eb6fd61cfe8ba9974996ef5f49b3f8151f52` |
| `selected-kinetic-response.tex` | `23ba50242e7e3e812ef7bf67747a3303e80ef9b1bf36d611f675c12ce97e5cb9` | `3ead2deac5a25404b78491a3688d008061558c72335e7abfe86a9d515f6ec212` |
| `stationary-determinant-prices.tex` | `31c642d6a73b7df97253673817cc2600b17f08f5c757c9920eb468344515cdc5` | `c330251aa54264c2908974b961b8b04aaaee5b8e7760119c46818bc72d8fa396` |
| `thermal-contact-cancellation.tex` | `deb0c1c24ad2b83089afaff3ed4cfc076d23651acd3985b87a93c6201ccb6f8b` | `344f692f1a4937938bb66af96711baca9689fc287a4ef2c7398e18b2404404ca` |

`git diff --numstat` (added/removed lines): soft-curvature 481/136; frame-penalty 17/5; inverses 21/6; linear-data 42/3; kinetic-response 12/9; determinant-prices 6/1; thermal 35/10; multileg 0/0.

## Commands run and results

- `sha256sum manuscript/existence/<chapter>.tex` for the eight chapters: values above.
- `git diff --check -- manuscript/existence/<chapter>.tex` for each of the eight chapters: no output.
- LaTeX wrapper outside the repository: `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c10-build-part-A/wrap.tex` (document class and theorem environments as in `manuscript/existence.tex`, a copy of `manuscript/preamble.tex`, and `\input` of the eight chapters by absolute path). `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex`: exit 0, 37 pages. In `wrap.log`: 0 lines starting with `!`, 0 "Undefined control sequence", 0 "Overfull" (three overfull boxes in new text in an earlier run were removed by displaying two formulas and adding a lead-in sentence to the new lemma). 16 distinct undefined references, all to labels in chapters not included in the wrapper: `cor:ex-row-controlled-action`, `prop:ex-row-quadratic-price`, `prop:ex-wilson-stream`, `sec:curvature-horizon-producer`, `sec:ex-classical-stationary-vertices`, `eq:ex-vertex-cruise`, `eq:ex-vertex-penalty-price`, `sec:inherited-loop-transport`, `sec:path-attachment-producer`, `subsec:path-stationary-chart`, `sec:predictor-branch`, `sec:stationary-action-prices`, `subsec:ex-lattice-horizon-path`, `thm:ex-lattice-wire-tower-strip`, `sec:haar-chart`, `eq:haar-chart-measure`. Each was found by `grep "label{…}" manuscript/existence/*.tex` in exactly one file. No undefined reference to a label of the eight chapters.
- `pdftoppm -png -r 70` (and `-r 60`) on pages 3, 5, 6, 7, 8, 13, 18, 23, 26, 37 of `wrap.pdf`, inspected: new Ward proof, new definitions and bullet list, both new lemmas, the pictures `S[E]`, the restated theorem page, the admissible-direction paragraph, the `ε>0` paragraph, the tangent-input quote, the final thermal paragraph. No broken math or layout problem seen. Pages 29–30 (kinetic-response and determinant-prices edits) were located by text search but not inspected as images.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified." (run while the report directory was empty; the report files themselves could not be written by this agent).
- Lean inspection: `grep`/`sed` on the files listed in `correspondence.md`.

## Not checked

- No Lean build, no elaboration, no `#print axioms`.
- The full manuscript (`manuscript/existence.tex`) was not built; only the wrapper.
- Proofs of the cited producers in other packages were not re-checked beyond opening the cited passages (C09 corollary and Wilson proposition, C01 path-to-root subsection, C01 `eq:curvature-tangent`, C11 stationary-chart subsection, C07 Haar chart). C06 `predictor-branch.tex` and C09 `stationary-action-prices.tex` were not re-opened.
- Declarations marked "audit only" in `correspondence.md` (frame induction, kinetic translation costs, determinant calculus, most of the contact calculation) were not re-opened; for those chapters I read the manuscript argument line by line for internal consistency but rely on the audit for the Lean match.
- The proof of `stain_knit` (gauge invariance of the quadratic path action) was not read; the added sentence in the proof of `prop:ex-greyson` is my own justification.
- The numerical identification of the C09 constants (`S_G`, `CTax`) with the Lean constants in `column_price` was not checked; only the form of the price.
- Whether the weaker hypotheses of `weighted-stationary-inverses.tex` (kinetic floor on curls, bounded symbol) suffice at every step of the source proofs was not checked step by step.
- GitHub (issue #51, claims, PRs) was not consulted, as instructed.
- The report files were not written to disk: the harness refused the Write call; their text is in the appendices of the final message.

## Second round (2026-11-13)

Changes after the independent checker's report: `soft-curvature-receipts.tex` (summability hypotheses for symbols and for the recording statement; conditional absolute convergence of the row field; entrywise bound), `weighted-frame-penalty.tex` (definition of `μ`), `thermal-contact-cancellation.tex` (citation of `prop:inherited-loop-picture`). No label renamed or removed.

SHA-256 after the second round:

| Chapter | After second round |
| --- | --- |
| `soft-curvature-receipts.tex` | `ff7c8854eb698c02100ddc0691820f667b3b2ab4bba627de9ba0a8e9f2c8c010` |
| `multileg-curvature-lift.tex` | `f5adb060a319496491f8c344ffbb1036a4c6e09ad54052aa36c8c1f081740419` (unchanged from start) |
| `weighted-frame-penalty.tex` | `d48a52846c0a62a147740bf1501e7a3a91311d9a3dfa8b86f6688d303e361f64` |
| `weighted-stationary-inverses.tex` | `46f3a95065dab9f280ca520f2cbbd58aed43a5f904cbed2ee308590fa90a1880` (unchanged in this round) |
| `selected-stationary-linear-data.tex` | `d5f20e2f39502b821ca6cd965345eb6fd61cfe8ba9974996ef5f49b3f8151f52` (unchanged in this round) |
| `selected-kinetic-response.tex` | `3ead2deac5a25404b78491a3688d008061558c72335e7abfe86a9d515f6ec212` (unchanged in this round) |
| `stationary-determinant-prices.tex` | `c330251aa54264c2908974b961b8b04aaaee5b8e7760119c46818bc72d8fa396` (unchanged in this round) |
| `thermal-contact-cancellation.tex` | `f6d8f997331e6c1ba5bf097d4a3986bef6a421d0c597beafdcbfddbddb751352` |

Commands and results:

- `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` in the same wrapper directory: exit 0, 37 pages; 0 errors, 0 undefined control sequences, 0 overfull boxes; 17 distinct undefined references, all external (the 16 of the first round and `prop:inherited-loop-picture`, found once in `inherited-loop-transport.tex`).
- `pdftoppm -png -r 65` on page 6 (new bed paragraph), inspected: no layout problem. Page 19 (frame chapter change) and page 37 (thermal citation) located by text search, not inspected as images.
- `git diff --check` on the eight chapters: no output.
- `grep` for the part-B labels cited from part-A (`sec:ex-classical-stationary-vertices`, `eq:ex-vertex-cruise`, `eq:ex-vertex-penalty-price`, `sec:inherited-loop-transport`, `prop:inherited-loop-picture`): each present once; the current statements of `eq:ex-vertex-cruise` (`D μ^{1+j}`, `0≤j≤2`), `eq:ex-vertex-penalty-price` (`N_n=2^n·4B_n`) and `prop:inherited-loop-picture` (order four, hypotheses listed) were read and agree with their use. Part-B's citations of `lem:ex-soft-quadratic-hessian` and `prop:ex-greyson` were read; they use the lemma as a finite-dimensional Hessian identity, which the second-round change does not affect.
- Lean opened in this round: `according`, `Row.safe`, `Row.rights`, `stain_knit`, `Work.F05.quadratic_gauge`, `pull_gauge_zero`. Superseded "not checked" items of the first round: the proof of `stain_knit`, the step-by-step check of the inverse chapter's hypotheses, and the C06/C09 passages have now been read (see findings, second round).

Not checked in this round: no Lean build; the full manuscript was not built; `ledger.md` and `correspondence.md` were not changed (the one new fact for the correspondence table is that `according` requires `Row.safe`, recorded in the findings).
