# C01 revision 1 — author response to PR #83

Issue #42; parent #26. Session `hairer-codex-c01-rev1-20261113`.
Base `0a824e128ef401e688b1f067f3c998e235d47712`, Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The chapter hashes in
`HANDOFF.md` identify this author revision; the manifest and old review
retain their historical inputs. No approval is recorded.

| Review finding | Author response |
| --- | --- |
| Part 2 M1 | Proved the weighted one-form estimate in `lem:ex-lattice-primal-entrywise-bound`, including a lower bound for the regular alias denominator on the real cube, quantitative continuation and the two branch weights. The overlap and order-one strip consequence are stated with the order-two theorem. |
| Part 2 M2, M4 | Stated the averaged Fourier convention and fibre calculation, and exhibited the installed primal identity with the same counting-measure adjoint factor as the curl identity. |
| Part 2 M3, M5, M6, M7 | Defined the periodic two-variable expression and auxiliary factors, aligned the level-response notation, gave the divisor-recovery calculation and fixed the inverse identity used in the branch algebra. |
| Part 1 M1–M4 | Expanded the signed-permutation argument and distinguished level response from drive; made Hermitian symmetry and the mixed Schur hypotheses explicit. |
| Part 3 F1–F6 | Stated agreement on exact forms, the curvature width and square-root step, the two fibre moduli and flight hypotheses, and the distinct attachment and planned-path receipts. |
| Records | Linked PR #83 as the independent review record and added the literal path source chain and the order-one receipt to the stable edge register. |

The source correspondence for the new bound is `YM.Next.Free.Flight.pilot_cost`,
with `ahead_cost`, `gains_cost` and `sluice_cost` in
`Lean/YM/Next/FREE_KERNELS/Docked.lean`. The regular expressions are
`pilot`, `ahead`, `gains` and `sluice` in `Pilot.lean`; the
denominator is `Flight.abide` in `Portions.lean`, with
`Flight.abide_firm` in `Buffer.lean`. The alias weights are
`grade` and `decay` in `AliasWeights.lean`. The signed response
identity corresponds to `YM.Next.Free.Train.D_signed` in `Feed.lean`.
The installed primal identity is the `primal` field of
`YM.Precision.Inputs` in `Lean/YM/PREC/TreeMatch.lean`.

The revision retains C02 common-data and funding, C03 ordered-phase
matching, C12/C16 literal path and normalization matching, and G06 global
closure as separate obligations. Independent mathematics and source
correspondence review of the changed text is still required. No fresh
Lean elaboration, axiom audit or kernel replay was run.

## Checks on this revision

- `python3 scripts/check_blueprint.py` passed for all four units.
- `python3 -m unittest discover -s tests` passed all 22 tests.
- `git diff --check` passed.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c01-final-render existence.tex`
  built the 971-page monograph against the base manuscript files.
  No undefined references or overfull boxes appeared in the final log.
  Ghostscript rendered the changed region; pages 46, 52, 53 and 57
  were visually inspected.
