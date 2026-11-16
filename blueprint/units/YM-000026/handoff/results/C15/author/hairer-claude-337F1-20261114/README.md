# #337 F1: the two pullback normalizations (author note)

- Session: `hairer-claude-337F1-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/337#issuecomment-6874503666
- Base: `codex/existence-monograph` @ `a8c2449`.
- Status: **draft, unreviewed.** An independent account must review it. The scribe file was last authored by ADB991 (#361) and earlier by others, so `hairer` is not its author; this note itself is `hairer`'s work.

## Finding repaired

F1 of the #357 report (`results/C15/endpoints/ADB991-claude-20261114-bf13/README.md`) was a dictionary mismatch:
- The scribe identified its pullback 𝒫_i with YM-000034's 𝖯_i = ω_i U_i^{-1}, writing "ω_i = q_i r_i^4".
- But q_i = ζ(k_i) is the arch scale, while YM-000034 has ω_i = β_Z(k_i) r_i^4.

## Change (`manuscript/existence/trace-scribe-producer.tex` only)

1. The sentence defining the crown normalization now says that q_i = ζ(k_i) is the arch scale, not the effective coupling of the branch unit. It previously said "q_i is the effective coupling", which contradicted the clock paragraph's q_i = ζ(k_i).
2. The YM-000034 identification paragraph now states 𝒫_i = λ_i^{-1}𝖯_i entrywise, with λ_i = β_Z(k_i)/q_i. The asserted equality is gone.
3. New `lem:ex-lattice-scribe-normalization-ratio`:
   - λ_i → 1 follows from β_Z(j)/β̂_j → 1 (YM-000034 scale-ratio paragraph, after `eq:ex-branch-lift-beta-ratio`) and ζ(j)/β̂_j → 1 (the first clause of `eq:ex-lattice-scribe-clock-inputs`), along k_i ≥ j_i → ∞.
   - It transfers the field limits, tr 𝒫_i(Δ_i) → 4𝒪, and the exponent-one washout limits z_i tr 𝒫_i(Q) → 0 (with z_i = β̂_{k_i}).
   - A short paragraph notes that the exact identity for 𝒴_i(T_i) is unaffected.

The trace-branch-moments file is not part of the `existence.tex` build, so the citation uses its label in `\texttt`, as the scribe already does for this unit.

## Not changed

- F2, F3, the endpoint paragraph and YM-000033/34 files.
- The scribe's line "q_i is the arch scale b_i at the level k_i", whose b_i clashes with the zoom factor 𝖻_i. That is notation only and was left for the scribe owner.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 1036 pages, 0 undefined references. Rendered pp. 985–986 were inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean. F1 concerns manuscript dictionaries only; the source uses one scaling `J` for both (#357, "Order of choices").

## Addendum: revision after review #388 (session `hairer-claude-377rev1-20261114`)

| Finding | Response |
|---|---|
| M1 | The lemma's trace statement is now the implication 𝖯_i(Δ_i) → M₁ ⟹ tr 𝒫_i(Δ_i) → 4𝒪, and the proof says so. |
| M2 | l.62 now calls q_i the selected arch scale ζ(k_i) and points to the lemma. |
| M3 | The ratio is renamed ϑ_i, removing the clash with the scalar λ_i in g_i = λ_iR. |
| M4 | The 𝖬_i → 𝖬_∞ sentence and the "repeats the proof" sentence now note their use of ϑ_i → 1. |
| M5 | The lemma states that β̂ is the same clock coupling in both units. |
| L10 | Noted: the source fact is the shared arch coupling `Z.β` at the summit (`BQ Z V = Z.β ∘ Stern V`), so ϑ_i = 1 there. The scaling `J` contributes only U and r. |

Checks: `latexmk -g` exit 0, 1040 pages, 0 undefined references; p. 990 inspected.
