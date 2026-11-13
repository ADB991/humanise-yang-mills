# C14 independent review, part 3: validation

Session `schmittj-claude-c14-review-20261113`, reviewer 3 of 4. Worktree `/home/jo314/ym-wt/c14-review`, HEAD `e058a615f318232519f871e6ee4d8054367b5a1a`. Only files in this directory were created. `git status --short` shows the new `review/` directory and nothing else.

## Commands actually run

- `git log --oneline -3` reported HEAD `e058a61` (merge of PR #108).
- `git diff --stat bfe20e7~1 bfe20e7` reported 12 files: the 8 C14 record files, plus changes to `actual-equation-kernel-relay.tex` (+34/−), `actual-insertion-derivative-relay.tex` (5), `actual-stress-annulus.tex` and `actual-stress-shell-nodes.tex`.
- `git diff bfe20e7~1 bfe20e7 -- manuscript/existence/actual-equation-kernel-relay.tex manuscript/existence/actual-insertion-derivative-relay.tex` printed the diff, which I read in full.
- `wc -l` on my chapters gave 344, 230, 284, 202, 197, 316 and 243 lines.
- `grep -rn "label{…}"` and `grep -rln "ref{…}"` were used to locate the consumed C12 labels: `prop:ex-marked-solaris` (marked-portfolio-calibration.tex:419), `prop:actual-marked-figment` (actual-marked-portfolio-calibration.tex:434), `prop:terminal-marked-voice` (terminal-marked-construction.tex:208), `lem:actual-marked-antilles` (actual-marked-portfolio-calibration.tex:112), `lem:ex-marked-calibration-inverse` (marked-portfolio-calibration.tex:311), and `ex-column-subpower` (ope-filtration.tex:135).
- `grep` over `manuscript/` for separation conventions (ope-filtration.tex:184, 207) and for `J_N\le\widehat\beta_N` (only one occurrence).
- `grep` and `sed` reads of the Lean files listed in `part3-lean.md`.
- `sha256sum` on the seven chapters, compared with `c14-hashes.txt` from the coordinator's scratchpad:

| sha256 | file | compared |
| --- | --- | --- |
| `f966d1ee034d43f47215bfe6db561b3e8d88c04c2cf6ed5164996a2a4773156c` | actual-equation-kernel-relay.tex | MATCH |
| `b7b0f559a8365e0703462ea5023de1828585b96f874b0f7b02d9494661e8b16b` | actual-insertion-derivative-relay.tex | MATCH |
| `be816129eedd9c1518206e613dcf1ff843e7d6c601d7332924854310fa1b5625` | physical-ward-stress-cone.tex | MATCH |
| `ba6a04989fe19c2a3c5430dfce09dacc2d060ffc516d1e0ee8968af9cdfee70f` | phase-ward-inheritance.tex | MATCH |
| `5c9df3d780680067ce07de7f9a2eae6c1e30d769cae54199c6f7d93534b7c076` | actual-phase-detector-moments.tex | MATCH |
| `f94b6d838d2b2263746738292d5e62754506dba1a54d983a96510502bf252db9` | actual-rank-purchases.tex | MATCH |
| `6265ab845bd82fe72bcb8fbcdcf9089adb99a43badfae8b0054fa244e4a4f437` | trace-firesky-gallery.tex | MATCH |

## Not run

- LaTeX build and inspection of the rendered pages.
- `python3 scripts/check_blueprint.py`; I made no blueprint change outside this review directory.
- Lean build, elaboration and axiom check: excluded by the brief.
- GitHub posting, commit and push: excluded by the brief.
