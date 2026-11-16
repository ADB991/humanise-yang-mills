# Checks actually run (revision 1, session ADB991-claude-20261113-53b3)

All on branch `claude/issue-48-53b3`, cut from `codex/existence-monograph` `69b2631`.

- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.
- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` from `manuscript/` (TeX Live from Ubuntu apt): exit 0, 985 pages. No `!` errors, and no undefined or multiply-defined references or citations in the log.
- Rendered and inspected: pp. 304 (new clearance paragraph, `actual-global-row-prices`), 321 (`compensated-variation` logarithm paragraph), 332 (`itinerary-prices` dictionary), 337 (`inherited-activity-prices` coarse tail), 342 (`eq:packet-jet-price` and the re-basing sentence), 344–345 (`lem:gaussian-base-density` and proof). The other changed passages were located by text search in the PDF: p. 284 (standing period hypothesis), p. 315 (Haar measure $m_G$), p. 347 (radial truncation).
- SHA-256 of the ten changed chapters recomputed into `../chapter-hashes.json` (pre-revision hashes kept under `revision_1.pre_revision_sha256`) and `../review-index.md`.
- Lean source inspected by reading only (no elaboration; no Lean toolchain installed in this run): `YM.RG.Patch.frameMass`, `eligible`, `usesMin` (`Lean/YM/RG/Patch.lean`); `Works.fits` (`…/CONNECTED_ACTIVITY_JETS_E6/Room.lean` l.25–28); `Clutch.chimney` statement and case split (`Flue.lean` l.37–75); `Clutch.dinner` statement (`TowerPower.lean` l.47–58); `Clutch.atV` (`Eskim.lean` l.88); `YM.Next.SectorChange.span`, `shots`, `small_span`, `guarded` (`…/GAUSSIAN_SECTOR_CHANGE/Stencils.lean` l.28–33, 173–206); `remote` (`Shell.lean` l.45–46).
- Not run: Lean elaboration or axiom audit; an independent mathematical check of the new lemma or the clearance argument (needs another account).
