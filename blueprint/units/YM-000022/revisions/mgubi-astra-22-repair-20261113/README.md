# Author revision responding to PR #32

Date: 13 November 2026. Session: `mgubi-astra-22-repair-20261113`.
Human contributor: mgubi. Agent assistance: GPT-6 Astra through Codex,
working in its own worktree under the parent's claim; no further delegation.
This is authoring assistance, not independent review or acceptance.

- Task: [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22).
- Claim: [bounded revision claim](https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6847117148), expiry 13 November 2026, 10:00 UTC.
- Worktree: `/tmp/ym-astra-22-repair-20261113`.
- Branch: `codex/astra-22-repair-20261113`, based on repository commit `47762e9`.
- Imported source pin, unchanged: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Response to the five required requests

The authoritative proof remains solely in `manuscript/pilots/running-coupling.tex`.

1. The opening paragraph now derives skew-Hermitian generators by differentiating
   the unitary identity and displays the positive Frobenius sum giving the
   normalized matrix inner product.
2. It explicitly notes nonzero Lie algebra dimension and shows orthogonal
   basis invariance of the summed adjoint squares before taking their traces.
3. The crosswalk includes `YM.RG.History.Selected.starts` and `YM.Wilson.bare`.
   Inspection of `YM.RG.Rep.eval`, `YM.Wilson.energy` and `YM.Gauge.price` fixes
   the precise meaning of the initial bare action coefficient. No optional
   SU(N) example or comparison with a conventional physical coupling is added.
4. The crosswalk includes `YM.Schedule.denominator` and
   `YM.Schedule.block_large` for the manuscript's own divergence argument.
5. The correspondence distinguishes the author's summed-commutator positivity
   proof from `YM.Gauge.casimir_pos`, whose `trace_adjoint` step uses full
   simplicity. It records the color-coordinate transport and projection facts
   supporting the interpretation of the Casimir formula.

Both scalar propositions and their proofs are unchanged. The running estimate
remains an explicit outstanding input. The metadata changes only author credit;
status remains `draft`, and both review records remain null.

## Focused source and literature inspection

Read the task and all comments, PRs #23, #25 and #32, both review reports,
`Bots/README.md` (the only Bots file), the original evidence README and source
inspection log, and the contributor/proof/coordination/source instructions.
Bounded `sed`, `rg` and `cat` reads covered the ten sources listed in
[source-checksums.txt](source-checksums.txt); no whole-tree source read occurred.
In particular:

```sh
sed -n '1,90p' Lean/YM/Lattice/Scale.lean
sed -n '95,125p' Lean/YM/Lattice/Scale.lean
sed -n '145,245p' Lean/YM/RG/History.lean
sed -n '1,55p' Lean/YM/Gauge/Lie.lean
sed -n '125,195p' Lean/YM/Gauge/Lie.lean
sed -n '135,178p' Lean/YM/Gauge/Casimir.lean
sed -n '15,100p' Lean/YM/Gauge/MatrixGroup.lean
sed -n '20,90p' Lean/YM/Gauge/Colors.lean
sed -n '92,114p' Lean/YM/Gauge/Colors.lean
sed -n '125,190p' Lean/YM/Gauge/Colors.lean
cat Lean/YM/Wilson/Law.lean | head -80
sed -n '1,65p' Lean/YM/Lattice/Faces.lean
cat Lean/YM/Pert/Asymptotics/RawAxis.lean
sed -n '25,50p' Lean/YM/Source/Construction.lean
```

Searches in `blueprint/background/` for Lie algebra, Hermitian and Casimir
material found the [SU(2) background note](../../../../background/su2-simplicity.md).
Following that note, the original versioned source was opened and read:
Brian C. Hall, *An Elementary Introduction to Groups and Representations*,
[arXiv:math-ph/0005032v1](https://arxiv.org/pdf/math-ph/0005032v1),
31 May 2000, Chapter 3, Definition 3.13 (printed p. 36), §5.4
(printed pp. 37–38), and Theorem 3.16 (printed pp. 40–41).
These identify the all-real-time exponential Lie algebra, skew-Hermitian
unitary generators, and commutator closure. The conventions match the pinned
`Generates` and `lie` definitions. The manuscript supplies the short derivative
and inner-product calculations directly; no additional external result is
silently substituted for the positivity proof. The existing Lebl citations and
scalar proofs were not changed or freshly audited in this revision.

All ten inspected source files were hashed with Python `hashlib.sha256` and
compared with their entries in `Lean/SOURCES.sha256`: all matched. The retained
output establishes agreement with the local pinned manifest, not independent
authentication of that manifest. The existing seven-file check was also rerun:

```sh
python3 blueprint/units/YM-000022/evidence/check_sources.py /tmp/ym-astra-22-repair-20261113
```

It passed for all seven files. This revision performs source-text inspection
only. No new Lean elaboration, axiom query, build or kernel replay was run; earlier
such evidence retains its original scope and date. No Lean file was changed.

## LaTeX and structural verification

From the worktree's `manuscript/` directory:

```sh
mkdir -p /tmp/ym22-repair-build
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym22-repair-build main.tex > /tmp/ym22-repair-build/latexmk.txt 2>&1
```

Result: exit 0, three-page PDF (the third page contains the bibliography).
Final log has no warnings, undefined references or overfull/underfull boxes.
Poppler executables were unavailable and `python3 -c 'import fitz'` failed
because PyMuPDF was not installed. Native macOS PDFKit was used instead, with
[the retained rendering script](render.swift):

```sh
swift -module-cache-path /tmp/ym22-repair-build/swift-cache blueprint/units/YM-000022/revisions/mgubi-astra-22-repair-20261113/render.swift
rg -n 'Warning|Overfull|Underfull|undefined|\?\?' /tmp/ym22-repair-build/main.log /tmp/ym22-repair-build/main.txt
```

The script rendered all three pages and extracted text; the `rg` scan found no
matches (exit 1, as expected). All three PNGs were visually inspected: equations,
indices, text and references are legible, with no clipping or overlaps. Build
artifacts and PNGs remain scratch outputs, not authoritative source files.

From the repository root:

```sh
python3 scripts/check_blueprint.py
python3 scripts/check_blueprint.py --fingerprint YM-000022
git diff --check
```

Results: `Blueprint structure OK: 2 units. Lean and mathematics were not verified.`;
new fingerprint `37a404dea24a3001c320680e4b25334e619d6865178c86e3d85993bb4000168f`;
whitespace check clean. No checker code changed, so its regression suite was not
rerun.

## Review state and handoff

The old review fingerprint is
`367b5982bb56035d3f0cbf81641d1f0564c27a48169707b9aa64a5cf3c0b0aa2`.
The existing reports in `reviews/` are unchanged historical evidence and do not
review the new content. Renewed independent mathematical and Lean-correspondence
reviews are required; this revision does not refresh another reviewer's approval.
The contributor mgubi is now credited as an author of this repair, so subsequent
review must account for that authorship. Parent owns the issue handoff and claim
release. No merge or publication is authorized by this revision.
