# Evidence for YM-000022

Date: 11 November 2026. Parent session: `hairer-codex-cp03-20261111`.
[Claim grant](https://github.com/hairer/humanise-yang-mills/issues/22#issuecomment-6800662148),
with scope and expiry recorded in the issue: 12 November 2026, 15:00 UTC.

The author checkout `/private/tmp/ym-22-author-20261111` was branched from
repository commit `7af0e96c06651ded585d2c5571802a637f51d77d` on
`codex/issue-22-running-asymptotic`. This repository commit is distinct from
the imported Lean revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` recorded
in `source/upstream.json`. No upstream source was edited.

## Source inspection and integrity

The parent read `RawAxis.lean` and checked the immediate interfaces using
bounded `sed`, `nl` and `rg` inspections. Representative actual commands were:

```sh
cat Lean/YM/Pert/Asymptotics/RawAxis.lean
sed -n '1,65p' Lean/YM/Source/Construction.lean
sed -n '190,250p' Lean/YM/RG/History.lean
sed -n '50,82p' Lean/YM/RG/History.lean
sed -n '95,125p' Lean/YM/Lattice/Scale.lean
sed -n '20,85p' Lean/YM/Gauge/Colors.lean
sed -n '172,188p' Lean/YM/Gauge/Colors.lean
sed -n '130,149p' Lean/YM/Gauge/Colors.lean
sed -n '168,187p' Lean/YM/Gauge/Lie.lean
sed -n '150,182p' Lean/YM/Gauge/Casimir.lean
```

GPT-6 Luna, session `hairer-codex-cp03-20261111/lean-reader`, inspected these
same seven files in the separate clone
`/private/tmp/ym-22-lean-reader-20261111`, using bounded `nl`, `sed` and `rg`.
Its output was a report to the parent, with no tracked edits or build. It also
spot-checked the draft statement. This is disclosed authoring assistance,
not independent review. Parent inspection corrected two namespace suggestions
from that report: `YM.Family` and `YM.Schedule` are not nested under the
names suggested by their source directory paths.

The following commands passed for all seven inspected files, comparing SHA-256
hashes with the distribution's `Lean/SOURCES.sha256`:

```sh
python3 blueprint/units/YM-000022/evidence/check_sources.py
python3 blueprint/units/YM-000022/evidence/check_sources.py /Users/hairer/humanise-yang-mills
```

The first result is retained in [source-checksums.txt](source-checksums.txt).
The second checked the original checkout used for the Lean inspection below;
it produced the identical hashes. This establishes agreement with the local
pinned manifest, not independent authentication of that manifest.

## Fresh Lean inspection

[Inspect.lean](Inspect.lean) contains only imports and inspection commands.
It was run against the original checkout's existing build artifacts, as the
isolated author checkout has no build cache. No agent ran a concurrent build.
The exact command, from `/Users/hairer/humanise-yang-mills/Lean`, was:

```sh
env PATH=/Users/hairer/.elan/toolchains/leanprover--lean4---v4.32.0/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin lake env lean -j1 /private/tmp/ym-22-author-20261111/blueprint/units/YM-000022/evidence/Inspect.lean > /private/tmp/ym-22-author-20261111/blueprint/units/YM-000022/evidence/lean-inspection.txt
```

Final result: exit 0. The complete concise output is
[lean-inspection.txt](lean-inspection.txt). It records elaborated types of the
owned statements, meaning-determining definitions and input projections, and
transitive axiom reports for `b0_normalizes`, `zeroUp_bound` and `comparison`.
All three report exactly `propext`, `Classical.choice` and `Quot.sound`.

An initial inspection printed full proof terms and passed; it was replaced by
concise signatures for reviewability. The first expanded-interface attempt
failed with four unknown-identifier errors because it used
`YM.Lattice.Schedule` instead of `YM.Schedule`. Correcting the scratch
inspection's names and rerunning gave the final successful output. No source
statement or proof was changed to resolve those errors. Earlier raw printouts
were replaced by the final log; the failure is recorded here.

This is a fresh environment/type inspection and axiom query, not a fresh
recompilation of the imported theorem or kernel replay of its proof. The
existing artifact provenance and earlier replay evidence remain those in
`source/build.md`, `source/audit.md` and `source/evidence/axioms-3456e5e.md`.
No clean build or new independent kernel validation was attempted in this task.

## Literature and mathematical checks

Before drafting, the shared background directory was inspected. Its existing
SU(2) literature note does not supply this numerical extraction. The web search
`site.jirka.org ra real analysis sequence limits continuous functions square root`
located the author's *Basic Analysis* text. The author-maintained HTML §2.2 was
opened and the actual statements of Propositions 2.2.5(iv) and 2.2.6 were read.
The proof checks nonnegative terms, strictly positive denominator limit, and
nonzero denominator terms on a tail before applying them. The citation identifies
the HTML version inspected on 11 November 2026; numbering is not asserted for
an unchecked print edition. The remainder is an explicit triangle-inequality
and epsilon argument in `proof.md`.

The parent checked the threshold's independence of N,p, the diagonal substitution,
the additive constant, eventual positivity, the square-root identity, and the
finite-prefix argument. The exposition does not assume a rate for the running
error, a restriction on k, or an identification with a physical coupling.

## Structural checks and limits

`python3 scripts/check_blueprint.py` passed with
`Blueprint structure OK: 1 units. Lean and mathematics were not verified.`
The staged `git diff --cached --check` and `git diff --check` passed without
output. Only this unit's files are included in the change.

Independent mathematical and Lean-correspondence reviews remain unperformed.
Both review records are null and the unit remains `draft`. The imported running
estimate, schedule properties and positivity interface are not proved by this
unit. No manuscript integration or global verification claim is made.
