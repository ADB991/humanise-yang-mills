# Hall definition and closure citation follow-up

13 November 2026; session `mgubi-astra-22-hall-20261113`.
Human contributor: mgubi. Agent assistance: one GPT-6 Astra subagent through
Codex, in the existing isolated author worktree; no further delegation.
This is an author revision, not independent acceptance.

- Bounded task: [#114](https://github.com/hairer/humanise-yang-mills/issues/114), linked to unit task #22.
- [Claim](https://github.com/hairer/humanise-yang-mills/issues/114#issuecomment-6847803945), expires 13 November 2026, 11:00 UTC; parent owns release.
- Response to [PR #113](https://github.com/hairer/humanise-yang-mills/pull/113), following [merged PR #111](https://github.com/hairer/humanise-yang-mills/pull/111).
- Starting author commit: `d4be082e0a932f8611eb6be992e0f97fdc7f1643`.
- Publication branch: `codex/astra-22-hall-20261113`, based on current main
  `0a249931b985c9b467c961d4c12ad63d680d5813`.
- PR #111 was merged by the maintainer at 08:17:09 UTC, so publication changed
  from updating that PR to a new focused draft PR. Fetching main and checking
  `git merge-base --is-ancestor d4be082 origin/main` confirmed that main contains
  the prior repair. The manuscript driver, preamble, pilot, bibliography and
  YM-000022 metadata/correspondence were identical between that repair and the
  new base; the Hall-only diff and recorded fingerprints are unchanged.
- Source pin remains `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

The manuscript opening now defines the Lie algebra as the matrices whose
exponentials lie in the group for every real parameter, verifies the closed
matrix-group hypothesis, and cites Hall's definition and real vector-space /
commutator closure theorem. The only bibliography edit is the new `hall2000`
entry. The correspondence records the literature application and the stale
review status. Both scalar propositions, their proofs, the running-estimate
input, metadata, prior evidence and prior reviews are unchanged by this follow-up.
Optional review suggestions were not taken up.

## Source verification and applicability

Read issue #114 and comments, the latest #22 discussion, PR #113's body and both
full report diffs, and the repository instructions. The earlier focused
background search is retained in the preceding revision record; the shared
[SU(2) note](../../../../background/su2-simplicity.md) identifies Hall's version.

Opened and read the original [versioned PDF](https://arxiv.org/pdf/math-ph/0005032v1)
on 13 November 2026: Brian C. Hall, *An Elementary Introduction to Groups and
Representations*, arXiv:math-ph/0005032v1, 31 May 2000.

- Chapter 2, Definition 2.2, printed p. 9: a matrix Lie group is a subgroup
  closed in the general linear group. A closed subgroup of the unitary group
  satisfies this because the unitary group is itself closed in the general
  linear group.
- Chapter 3, Definition 3.13, printed p. 36: the exponential-generator
  definition uses **every real** parameter, matching `YM.Gauge.Generates` and
  the carrier of `YM.Gauge.lie` in `Lean/YM/Gauge/Lie.lean`.
- Chapter 3, Theorem 3.16, printed pp. 40–41: the set is closed under real
  scalar multiplication, sums and matrix commutators. Zero belongs because its
  exponential is the identity; finite dimension follows from the ambient
  matrix space. No connectedness or simplicity assumption is required for
  these facts. The manuscript retains its separate nonabelian simplicity
  assumption.

The actual definition, theorem statement and applicability were inspected, not
only a search snippet. The citation refers to this arXiv version rather than a
later textbook edition. The manuscript uses the ordinary matrix commutator,
not the alternative physics convention mentioned after Hall's theorem.
No new Lean elaboration, axiom query, build or kernel replay was run; the
previous source inspection evidence retains its original scope.

## Bibliography impact and fingerprints

Enumerated every `blueprint/units/*/unit.json` with Python's `json` module and
checked its `manuscript` list for `manuscript/references.bib`.
Only **YM-000022** lists that file. **YM-000026** does not.

| Unit | Before follow-up | After follow-up |
| --- | --- | --- |
| YM-000022 | `37a404dea24a3001c320680e4b25334e619d6865178c86e3d85993bb4000168f` | `24db9174727f1abf8bcb4211cb1c3bc601711dfd4c193983b1fde864a02ce056` |
| YM-000026 | `f472d9b4fad446870628145be73e82cef10f652d8bf5c0bf36a68c3ff0859add` | `f472d9b4fad446870628145be73e82cef10f652d8bf5c0bf36a68c3ff0859add` |

PR #113's reports apply to the **before** fingerprint. Existing review reports
and approval fields are untouched. The unit stays draft with null approvals;
renewed independent review is required for this follow-up.

## Checks actually run

From the worktree root:

```sh
python3 scripts/check_blueprint.py
python3 scripts/check_blueprint.py --fingerprint YM-000022
python3 scripts/check_blueprint.py --fingerprint YM-000026
git diff --check
```

All pass: structural output is `Blueprint structure OK: 2 units. Lean and
mathematics were not verified.` Fingerprints are recorded above. No checker
code changed, so the checker regression suite was not rerun.

From `manuscript/`:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym22-hall-build main.tex > /tmp/ym22-hall-build/latexmk.txt 2>&1
```

Result: exit 0, three pages. Rendered using the preceding revision's native
PDFKit script with only the scratch directory changed:

```sh
sed 's@/tmp/ym22-repair-build@/tmp/ym22-hall-build@g' blueprint/units/YM-000022/revisions/mgubi-astra-22-repair-20261113/render.swift > /tmp/ym22-hall-build/render.swift
swift -module-cache-path /tmp/ym22-repair-build/swift-cache /tmp/ym22-hall-build/render.swift
rg -n 'Warning|Overfull|Underfull|undefined|\?\?' /tmp/ym22-hall-build/main.log /tmp/ym22-hall-build/main.txt
```

Rendering succeeded for all three pages. The log/text scan found no matches
(exit 1 as expected). All three PNGs were visually inspected: the new definition
and Hall citation on page 1, the scalar argument across pages 2–3, and both
bibliography entries on page 3 are legible without clipping or overlap. The
bibliography renumbers the unchanged Lebl citation correctly.

Python assertions check that the manuscript from the lattice-construction
input onward is byte-for-byte unchanged from `d4be082`, that the old bibliography
is an unchanged prefix of the new one with exactly one new entry, and that all
changed Markdown relative links resolve. No existing approval was refreshed.
