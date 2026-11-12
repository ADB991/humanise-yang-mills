# C12 part-A validation (commands actually run, 2026-11-12)

Worktree `/home/jo314/ym-wt/c12`, branch `claude/c12-author`, based on `codex/existence-monograph` at `18d0327`. Author agent for part A of session `schmittj-claude-c12-20261112`. Nothing was committed, pushed or posted. No file outside the six part-A chapters and this directory was written.

## Content hashes (SHA-256)

| Chapter | Before (from `c12-start-hashes.txt`) | After |
| --- | --- | --- |
| `manuscript/existence/common-funded-history.tex` | fb0c5d7126595ba7d49520766021c4d6ec73e439c93839c195c186100d63348b | 815fc239c1483a174de756051f5611a6559642d8bd4caa38a91928e000e9aec0 |
| `manuscript/existence/original-history-portfolio-attachment.tex` | ec9e030a3604be99a5892b437a84618eaae99cbd460a8669d115d8ac23de6fef | d198c952beeba3161a3a2a3c39fb5e3ad702cefcdf74c6c71e42ab495f9916ab |
| `manuscript/existence/selected-course-binding.tex` | 4e653d2415ae0f160a865ec3af41aedb92358940dde19319308fead739f2d102 | 4178833b495dfc0d94b2d988c6ad7d6888046f2bbdc5fc8d181867467630c0cc |
| `manuscript/existence/common-observable-purchases.tex` | d0150c0f0ab3c24e8e3de691c45b9b368a4901003719c6d829623e90294e188e | e0fdc925b668bd3545bbc33bcf61522b0b8b0db0beb78f4f80c38a5793216928 |
| `manuscript/existence/marked-campaign-producer.tex` | 17e48ef653b6b753ac7d278bc4d0cf50699c9b5b229f906da18e8d5d1404e880 | 76ec7b73294e48b7e7aef1e5e888880ae681b7ce5407d9af984ce5d01245100e |
| `manuscript/existence/selected-centered-service.tex` | ea1ccdec549ae7fbd2335afa6295654f3619c24c4f6872afdffc9fec775b440e | e36c21410e7e26211b673a6dcf92be0b8a462a550eec15f65fbc3889170788ad |

All six chapters changed. The "after" values are from `sha256sum` run after the last edit.

## Commands and results

| Command | Result |
| --- | --- |
| For every `\ref`/`\eqref` in the six chapters: `grep -l "\\label{<label>}" manuscript/existence/*.tex` (shell loop) | every cited label exists, before and after the edits: 46 distinct labels at the start hash, 50 after (re-run after the last edit). One reference used the wrong kind word (findings A8). One new label was created (`rem:marked-campaign-mixed`) |
| `grep` for citations of the part-A labels in all other chapters and in `existence.tex` | consumers listed in `ledger.md` section 3; no chapter cites `prop:ex-lattice-selected-course-binding` or `lem:ex-lattice-paid-weakening` |
| Targeted `cat`/`sed -n`/`grep -n` reads of the Lean files listed in `correspondence.md` at the pinned revision | text reads only; see the verdict column there |
| Wrapper build: in `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c12-build-part-A/`, `wrap.tex` = first 15 lines of `manuscript/existence.tex` (document class, `\input{preamble}`, theorem environments) + `\input` of the six chapters by absolute path; `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` | exit 0; 22 pages; no LaTeX error (`grep -c "^!" wrap.log` = 0); no undefined control sequence; no overfull or underfull box; 41 distinct undefined references, each checked by script to be a label defined in a chapter outside the wrapper and none defined inside the six chapters |
| `pdftoppm -png -r 70` and visual inspection with the image reader | pages 7 (binding definition and proposition), 12 (new definitions in the marked-campaign opening), 15 and 16 (factor lemma proof) inspected: displays and inline mathematics render correctly, no broken layout. Page 15 was re-inspected after the last edit. The pages carrying the small edits in `common-funded-history`, `common-observable-purchases`, `selected-centered-service`, the remark of the attachment chapter, and pages 17–20 of the marked-campaign chapter were **not** inspected visually; they were covered only by the error/overfull check |
| `git diff --check -- manuscript/existence/` | clean (exit 0) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (re-run after the report files were written) |
| `python3` one-off over `coverage-inventory.json` | chapter → package map used in `ledger.md` |

## Not run, not checked

- No Lean build, elaboration, `#print axioms` or type query. Every statement about the source rests on reading the text of the pinned files; implicit arguments, instances, coercions and definitional unfoldings were not machine-checked.
- The full manuscript `existence.tex` was not built; numbering in the wrapper differs from the monograph.
- The parts of the chapters listed in `findings.md` section C (C1–C5, C7) were not compared with the source.
- Producer passages in other packages were opened only where `ledger.md` says "opened"; for the others only the existence of the label was checked.
- No literature was consulted; the six chapters cite none.
- PR63's review of the rank/determinant/stress interface (mentioned in `upstream-evidence.md`) was not read; it concerns `castle`/reception consumers and should be read before the edge C12-to-C13-local-course is closed.
- No independent review. This directory is author-side only.

## Second round (2026-11-12, after the independent checker's report)

Final content hashes (SHA-256), superseding the "After" column above:

| Chapter | After round 2 |
| --- | --- |
| `manuscript/existence/common-funded-history.tex` | 815fc239c1483a174de756051f5611a6559642d8bd4caa38a91928e000e9aec0 (unchanged in round 2) |
| `manuscript/existence/original-history-portfolio-attachment.tex` | fef46786874e9ba76d56c2c6f8e836d8a113240d9f0911896bfa7010a47e09b6 |
| `manuscript/existence/selected-course-binding.tex` | 1ef92935bb856be1b25db8bc1e913e5b7a4bc9d7898f01c3f5fef98be80b4f05 |
| `manuscript/existence/common-observable-purchases.tex` | 256ff60ad0b31cfb1116686f4e98629ab268da40f39f2b6d4633899c647d541c |
| `manuscript/existence/marked-campaign-producer.tex` | 8ceea32710397e82c48d7b185aacbd497189fc579cbda72bcb11d108a72496e3 |
| `manuscript/existence/selected-centered-service.tex` | a0f67509924084789df705de7eb8c7b40e63ad945c94ba30134d55a3842341e1 |

| Command | Result |
| --- | --- |
| Read `scratchpad/c12check/final_A.md` in full | the file name given in the coordinator's message (`out_A.final.md`) does not exist; `final_A.md` (29,159 bytes) is the report |
| Targeted reads of the additional Lean files listed under "Second-round additions" in `correspondence.md` | text reads only |
| Same wrapper, `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` | exit 0; 24 pages; no LaTeX error; no overfull or underfull box; 47 distinct undefined references, script-checked: none is defined in the six chapters and each is defined in another chapter of `manuscript/existence/` (the new ones are part-B and C01/C09 labels: `prop:terminal-marked-voice`, `prop:ex-marked-solaris`, `sec:ex-marked-portfolio-calibration`, `sec:actual-marked-portfolio-calibration`, `eq:ex-marked-height-jump`, `eq:history-common-waybill`) |
| `pdftoppm -png -r 60` and visual inspection | pages 12 (new subsection of the observable purchases), 17 (potential computation and periodization argument) and 24 (record paragraph) inspected, render correctly. Pages 6–7 (attachment proof, binding definition), 20–22 (symmetry formulas, centered-service edits) were **not** inspected visually in round 2 |
| `git diff --check` on the six chapters | clean |
| `sha256sum` of the six chapters | table above |

`python3 scripts/check_blueprint.py` re-run after the report updates: `Blueprint structure OK: 4 units.` Not run in round 2: no Lean build; the producer passages cited by the checker's edge table were not re-opened by me.
