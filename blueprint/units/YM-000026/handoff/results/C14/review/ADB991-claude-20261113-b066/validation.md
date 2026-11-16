# Validation: review of PR #227 and PR #234 (session ADB991-claude-20261113-b066)

These are the commands actually run on 2026-11-13, in a clone of hairer/humanise-yang-mills with the PRs fetched as `pr227` (head `84948b6a09300a5d397cb742b2c6e87341bfc7b9`) and `pr234` (head `e845ac344d33772a21d6f8702ee5858d4e1ea651`).

- `git diff 69b2631 pr227 -- manuscript/` and `git diff 69b2631 pr234 -- manuscript/`: read in full. I also read both author records (`response.md`, `correspondence.md`, `validation.md`).
- Read at the heads:
  - `trace-free-rank.tex`, lines 1–130 and 280–420;
  - `physical-ward-propagation.tex`, lines 1–120;
  - `actual-stress-shell-nodes.tex`, lines 395–500;
  - `actual-stress-annulus.tex`, lines 160–180 and 490–520.
- `git grep` at `pr227` for "chamber receipt" and for `prop:ex-lattice-actual-shell-node`: consumers listed in `mathematics.md` B1.
- Author manifests: `sha256sum -c` of each PR's `final-files.sha256` at its head. All 12 entries passed for each PR.
- Fingerprints in `README.md`: `sha256sum` of the five changed chapters at their heads.
- Lean files read textually (paths under `Lean/YM/`):
  - `Labels/Jet.lean` 15–46;
  - `Maxwell/Exterior.lean` 197–225;
  - `Push/STRESS_FLUX/Jets.lean` 52–238;
  - `Euclid/Differential.lean` 1–75;
  - `Further/PHYSICAL_PERIOD_LIMIT_F933/FreeRanks.lean` 60–179;
  - `Climb/Beams.lean` 30–50;
  - `MergeProof/North/Cent.lean` 40–75;
  - `MergeProof/North/Brim.lean` 30–70;
  - `TraceExtension/Centered.lean` 12–20 and 58–68;
  - `TraceExtension/Chart/Time.lean` 40–80;
  - `TraceExtension/Chart/Scalar.lean` 41;
  - `TraceExtension/Chart/Nectar.lean` 64;
  - `Ward/Sum.lean` 20–36;
  - `Euclid/Words.lean` 140–148;
  - `Euclid/Table.lean` 84–88;
  - `Climb/Cells.lean` 24–31.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex`, run from `manuscript/` in a worktree of each head:
  - PR #227: exit 0, 982 pages;
  - PR #234: exit 0, 983 pages.

  `grep -c undefined` on each `existence.log` returned 0.
- `pdftotext` located the changed passages: PR #234 on pp. 787 and 790; PR #227 on pp. 843, 852 and 874. Pages 787, 790, 852 and 874 were rendered with `pdftoppm -r 70` and inspected visually: legible, with no clipping or overlap. Page 843 was rendered but not inspected.
- On this report branch:
  - `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
  - `python3 -m unittest discover -s tests`: 22 tests, OK.
  - `git diff --check`: clean.

Not run: Lean elaboration or `#print axioms`. The Mathlib hosts are blocked here, and neither PR changes Lean. I did not run a combined build of PR #216, #227 and #234.
