# Renewed review of the N1 response: construction-to-reconstruction note (#160, PR #244)

- Reviewed file: `blueprint/interfaces/continuum-reconstruction.md` at draft PR #244, head `dcb24ba3e0c5b2b7e211365481ca14d131e88a32`.
- Content SHA-256: `5213d9dd0a1f1cfdc64da5319b8bc55a9c027386317eadb52e409d59e192e822`. This matches the hash in the author handoff (<https://github.com/hairer/humanise-yang-mills/issues/160#issuecomment-6863764244>).
- Delta reviewed: `6097bd5..dcb24ba`, one commit ("docs: classify reconstruction quotient facts accurately"), 2 lines changed, both in the fifteen-clause table (rows `injective` and `represents`). At `6097bd5` the note had SHA-256 `3df158a0…a238c9`, the version reviewed in #246.
- Base: `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Against the base, PR #244 still changes only this one file.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`Lean/`). `git diff --quiet 69b2631 dcb24ba -- Lean` reports no change.
- Role: Lean correspondence, renewed, limited to the delta.
- Human reviewer: ADB991. No acceptance is recorded.
- Agent assistance: Claude Code (Anthropic), running as a scheduled agent on behalf of ADB991 (session `ADB991-claude-20261113-cf2e`), did the inspection and wrote this report. ADB991 had not read it before it was submitted. No subagents were used.
- Review task: [issue #160](https://github.com/hairer/humanise-yang-mills/issues/160), claim <https://github.com/hairer/humanise-yang-mills/issues/160#issuecomment-6864323021>.
- Independence: ADB991 wrote reviews #228 and #246, which requested these changes. It did not write the note (#18, #170) or the author responses (#244).
- Outcome: **N1 resolved. No change required.** The rest of the note is unchanged since #246, so that review's findings on R1–R5 still apply to this version.

## Method and limits

Evidence level: source text read at the pin, including binders and `variable` scopes. **Nothing was elaborated.** Mathlib is unreachable from this sandbox, so `lake` cannot build dependencies. Files read: `Lean/YM/Euclid/Null.lean` 1–105 and its section structure (`variable`, `section`, `end` lines); `Lean/YM/Euclid/Union.lean` 1–32.

## Check of each new statement

| Statement in the new cells | Source | Verdict |
| --- | --- | --- |
| For every table, `S.Field d = L.Ref d ⧸ S.null d` | `abbrev Field (d : ℕ) := L.Ref d ⧸ S.null d` (Null.lean 74), in `namespace Table` under `variable (S : Table L)` only (Null.lean 28–29). The first extra hypothesis, `H : S.RealSpin`, enters at line 112, after all the declarations used here. | Accurate. |
| `null` is the kernel of `replies` | `def null (d : ℕ) := LinearMap.ker (S.replies d)` (Null.lean 34); `replies` pairs a label with every separated exterior word (Null.lean 31–32, structure `Exterior` 22–26). | Accurate. |
| The induced response map `S.spectra d` is injective (`S.faithfully`) | `spectra d := (S.null d).liftQ (S.replies d) le_rfl` (93); `faithfully d : Injective (S.spectra d)`, by `ker_liftQ_eq_bot` (97–98). | Accurate. |
| Its codomain restriction `S.pin d` remains injective | `pin d := (S.spectra d).codRestrict S.observations …` (Union.lean 26–27); `pin_inj` from `S.faithfully` (29–30), under `variable (S : Table L)` only (20–21). | Accurate. |
| `S.project d` is the surjective quotient map | `abbrev project (d : ℕ) := (S.null d).mkQ` (75); `onto d : Surjective (S.project d)` (84). | Accurate. |
| `S.representative d` is a chosen linear section, `S.project d (S.representative d v) = v` by `S.rep` | `representative d : S.Field d →ₗ[ℂ] L.Ref d`, the `choose` of `exists_rightInverse_of_surjective` (87–88); `rep` (90–91) is the stated identity. | Accurate. "Chosen" is right: the section is a noncanonical choice, which does not matter for the clause. |
| "a quotient fact, not an additional analytic input" (both rows) | No hypothesis on the table beyond `S : Table L` is used. | Accurate. |

The `acts` row still separately requires the nonzero grade-zero unit (`S.alive`) and the faithful realization, and the `covers` row the derivative plan. The new wording does not blur these, which was the concern behind N1.

## Optional points

N2 and N3 of #246 (optional wording) are not addressed in this delta. They stay optional.

## Checks run

- `git diff --stat 6097bd5 dcb24ba`: one file, 2 insertions, 2 deletions.
- `git diff --name-only 69b2631 dcb24ba`: only `blueprint/interfaces/continuum-reconstruction.md`.
- `git diff --quiet 69b2631 dcb24ba -- Lean`: no change.
- `sha256sum` of the note at `dcb24ba`: `5213d9dd…e192e822`, which matches the handoff.
- `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests` on this report branch (results in the PR body).
- Not run: Lean elaboration and `#print axioms` (Mathlib unreachable); no LaTeX, since the delta is Markdown only.

## Handoff

With N1 resolved, the correspondence review of this note (#228, #246, this report) has no open required change. The note can go to human acceptance. This is an agent-assisted review, not an acceptance.
