# #317 author note: reserved slots on every selected entry

- **Session:** `hairer-claude-317slots-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5).
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6868210654>
- **Base:** `codex/existence-monograph` `310a5b5`.
- **Source pin:** `3456e5e`, read textually; nothing was elaborated.

This is draft author work. It needs independent review by another account.

## What changed

Only `manuscript/existence/selected-centered-service.tex` changed:

- The new lemma `lem:selected-reserved-slots`, placed after the discussion following
  `prop:selected-centered-retention`. On every stored entry R_{N,p,m}, m ≤ N, the
  coefficients vanish on all reserved regular and forced labels of the fixed terminal
  dictionary, and the reserved forced labels carry the flag predicate. Consequently:
  - the slot-preservation hypothesis of `prop:selected-centered-retention` holds;
  - every stored entry has a Keeper.
- The "remaining analytic attachment" sentence now names only the arrival and
  raised-response receipts.

## Source correspondence

| Manuscript | Source |
| --- | --- |
| Lemma, case m = N | `Graces.Nest.born` (`Graces/Eagles.lean` l.30). It is imposed by the selection's `first` predicate in `winnow`, and supplied for the startup family by `hops` via `ingredients.spare_room`. |
| Lemma, case m < N | `Graces.Nest.samples` (`Eagles.lean` l.54–60). It rewrites the entry as the return result (`Mallow.Spring.owns`, `Mallow/Pediment.lean` l.60: the result is the recipe `finish` of the renewed shelves/branch), then applies `(… .renew …).spare_room`. |
| Slots | `Progress.DirectedRecipe.HasSlots` (`Pellets.lean` l.216): fixed regular and forced address lists, `A.E (blankRow …) = 0`, and `A.K (sleepK …) = 0`. |
| Keeper | `Guard.Keeper.sufficient`, used in `Bandage.chorus` as `Keeper.sufficient (h.samples …)` and in `MergeProof.ravine`. |

## Points for the reviewer

- The case m < N uses the manuscript sentence in `terminal-marked-construction.tex` (l.23–31)
  that the same packing and grouping is used "in startup and every return". It also uses
  the argument in the proof of `prop:wilson-startup-family` (l.394–402) that reserved-label
  vanishing is a property of the packing and grouping alone. Please check that the
  return chapter (`common-funded-history.tex`, the exact return in one dictionary)
  matches this.
- Consumers that can now cite the lemma:
  - the nonterminal Keeper in #340/#319 (author's Q2);
  - the slot realization part of (RS) in #318 (PR #349).

## Not addressed

The arrival and raised-response receipts on the selected replay (`MergeProof.ripe`,
`MergeProof.paneer`, and the producers of the paid terms in `sec:ex-lattice-rg-multisource`).
These stay open in #317.

## Checks run

- `latexmk … existence.tex`: exit 0, 1019 pages, no undefined references.
- The lemma's pages (696–697) were rendered and inspected.
- No overfull boxes in the new text; the overfull boxes in this file come from the #340 section.
- `python3 scripts/check_blueprint.py`: see the PR.
