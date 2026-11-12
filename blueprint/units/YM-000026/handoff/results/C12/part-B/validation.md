# C12 part-B validation (2026-11-12)

Worktree `/home/jo314/ym-wt/c12`, branch `claude/c12-author`, base `18d0327`.

| Command | Result |
| --- | --- |
| `git show HEAD:manuscript/existence/<chapter>.tex \| sha256sum` for the five chapters | all five equal the hashes in `c12-start-hashes.txt` |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper.tex` in `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c12-build-part-B/` (wrapper: `\documentclass[11pt]{article}`, `\input` of `manuscript/preamble`, `mathtools`, `mathrsfs`, the theorem declarations of `existence.tex`, the five chapters by absolute path; pdfTeX 1.40.25, TeX Live 2023, latexmk 4.83) | second round: exit 0; 31 pages; 0 LaTeX errors; 0 undefined control sequences; 0 overfull boxes; 0 multiply defined labels |
| undefined references in `wrapper.log` | 16 distinct labels (second round adds `sec:local-splitting`, which exists once in `local-splitting.tex`), all in chapters not included: `ex-centered-construction`, `ex-centered-estimates`, `ex-centered-main-bound`, `ex-centered-sail`, `ex-centered-site-geometry`, `lem:ex-centered-opened-copy`, `lem:ex-public-frame-recovery`, `lem:ex-public-radial-choice`, `lem:ex-public-replace-word`, `sec:common-observable-purchases`, `sec:local-sections`, `sec:marked-campaign-producer`, `sec:selected-centered-service`, `sec:three-port-history`, `thm:ex-public-grill` |
| `grep -l "label{<l>}" manuscript/existence/*.tex \| wc -l` for each of the 15 | 1 each |
| `pdftoppm -png -r 70 wrapper.pdf pg`, pages 1–2, 6–7, 19–20, 21–22 viewed | new propositions, the (R1)–(R7) list, the edited lemma and proofs render correctly; no broken math |
| `git diff --check` on the five chapters | clean |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `grep` for references to part-B labels in other chapters | consumers: `actual-equation-kernel-relay.tex`, `actual-insertion-derivative-relay.tex` (C14), `original-history-portfolio-attachment.tex`, `selected-centered-service.tex` (part-A); no label was renamed or removed |

SHA-256 before → after:

| Chapter | Before | After |
| --- | --- | --- |
| `marked-portfolio-calibration.tex` | cd4417f4e6fa22970682e31ec85460532782422c351128223980237e74e347b3 | 97869cb5f5b5b402281362734be9159e8ab6d4c5f6f9e8b9d7958979042dfc9b |
| `terminal-marked-construction.tex` | 8ee1de534ce04b5d0c0dd8fd354e13e5367ecc05e4433e25cbfaf646df8fc0d7 | c3c0f04355c216308c879c8ab8571516773a2fcf885f24efe937321e164d728d |
| `marked-field-local-estimates.tex` | 50812262fd16bc4dc603a8513140d5161e26810f6023faecaec54731a0e2e7ba | 6f5478f083654e9cfc6738d2ecee39bb68ec9913c433a50d48ceb5a552516a30 |
| `actual-marked-portfolio-calibration.tex` | 94a92748ef87edf19c4810cc6bb8c90c2cec2ef7b498eceb6132120a0dcf457f | a705ca6b8d2c6d52f1dcf9ee175648c00bda28af96ff2c52cc86358af1192073 |
| `actual-phase-grid-approximants.tex` | 5f2b6050ae320e61cb0fdeada14bd07080d4ae31d162b7e2bb3fd3233ab4f685 | 243e556604d48e55bb7eb6b94d33af0392d8ca0c5d38b342768d0bebb4811993 |

New labels: `prop:ex-marked-solaris`, `eq:ex-marked-height-jump` (marked-portfolio-calibration); `prop:terminal-marked-voice` (terminal-marked-construction). No label removed.

Not checked: no Lean build, elaboration or axiom replay; correspondence is from text reads. The full `existence.tex` was not built (shared file, and part-A was editing concurrently), so page numbers and cross-chapter references were not rendered. Not opened: `Volant`, `Duty`, `Carol`, `Coupon`, `Tale`, `Heard` beyond its fields, `Fondue.garnish`, `Platter.platter` beyond its call, `South/Swing`, `Window`, `Wakes`, `Loft`, `Push/GRID_APPROXIMATION/Many`, `Joint`, `Work.I03`, `Work.D01`. Part-A's chapters were read only where cited; its concurrent edits after my reads were not re-read. No independent review; `review/` is not mine. The evidence files `*-evidence.md` were not modified; they still describe the pre-edit text.

Second round (2026-11-12, after the Codex check `scratchpad/c12check/final_B.md`): the after-hashes above are the second-round hashes (first-round after-hashes were bbc70102…, c714a361…, 5b46fd59…, 2d203954…, 49e8aad8…). Rebuilt the same wrapper: `latexmk` exit 0, 31 pages, 0 errors, 0 overfull boxes, 0 multiply defined labels. `eq:ex-marked-cover` is now a numbered equation (the first-round build could not detect that it was a label in an unnumbered display). Pages 21–22 and 24–25 (record (R1)–(R7), proposition, served-representation paragraph) viewed after `pdftoppm -png -r 70`; `pdftotext` used to locate the other changed passages (pages 3, 4, 6). `git diff --check` on the five chapters clean. `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` New lines longer than 90 characters introduced by my replacements were re-wrapped by a script that leaves lines of the base revision untouched. Still not checked: no Lean elaboration; full `existence.tex` not built; `Canopy`, `Offer`, `Towed`, `Odyssey`, `Gig`, `Tunes`, `Arsenal`, `Swing`, `Window`, `Wakes`, `Loft` not opened.
