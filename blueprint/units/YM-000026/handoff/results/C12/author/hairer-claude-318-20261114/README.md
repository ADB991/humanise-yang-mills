# #318 author note: the stored terminal voice and its Music

- **Session:** `hairer-claude-318-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5).
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/318#issuecomment-6868145372>
- **Base:** `codex/existence-monograph` `051facb`.
- **Source pin:** `3456e5e`, read textually; nothing was elaborated.

This is draft author work. It needs independent mathematics and Lean-correspondence
review by another account.

## What changed

Only `manuscript/existence/selected-centered-service.tex` changed:

- A new subsection `sec:selected-terminal-voice`, placed before
  `sec:selected-zero-coordinate-coupon`. It contains:
  - definitions of a voice, of *heard*, of profile covariance, of a Music and of a Carol;
  - `prop:selected-terminal-voice`, proved relative to the cited results;
  - the named one-step input (RS);
  - `prop:selected-music`, conditional on (RS).
- A pointer of two sentences after the (R6) sentence in "Relation to the paid
  selected-history record".

No other file was edited: not the #340 subsection, the C02 chapters, the ledgers or `Lean/`.

## Source correspondence

| Manuscript | Source (pin 3456e5e) |
| --- | --- |
| Stored top representation, the startup member with reserved slots | `Graces/Eagles.lean`: `Nest.born : HasSlots …` is imposed by the selection's `first` predicate in `winnow`; `hops` supplies `HasSlots` for the startup family from `ingredients.spare_room`. `HasSlots` (`Progress/DIRECTED_RECIPE/Pellets.lean` l.216) has zero regular and forced coefficients on the reserved rows. |
| Keeper from the reserved labels | `Guard.Keeper` (`Planned/ATOM_GUARDED_LAYOUT/Guards.lean` l.63–68): `code`, `support`, `inventory`, and `pass`, where flags = inventory ⇒ extraTest. It is obtained as `Keeper.sufficient (h.born N p)`, with zero activity `Keeper.blank`. |
| The marked voice on the stored top | `Guard.summit` / `Guard.summon` (`Guards.lean` l.283–328). `summon` needs `H.Selected`, `B.Sound`, `1 ≤ C`, the camera bound and the fee `≤ √forcedAllowance N`. It gives `OnTop`: `heard`, `out` (lead v), `germ` (regular = 0), `cost` (charge ≤ ‖core v‖) and `earns` (T5). |
| Hypotheses (3) and (4) on the selected run | `Bandage.squad` (`MergeProof/Marco.lean` l.38–49): `sound G d`, `Doors.cameras_ge`, `Doors.cameras_holds`, and `(b.clock.sequences N d he').receipts p 0`, with `he' : d ≤ J(N)`. |
| Singleton hook | `Bandage.nectar` (`MergeProof/Gist.lean` l.37–38): `onRise … (rem_dominated (hM.head.heard.earns v).2)` (`MergeProof/Alpaca.lean` l.43). `MergeProof.voice` (`Inception.lean` l.35) gives `Chorus` at the top. |
| Heard / Responds / Sung | `Extra/SOURCE_HISTORIES/Replay.lean` l.32–55 and `Song.lean` l.40–98. |
| Carol | `MergeProof/Largo.lean` l.13–14. A finite wing Y, and for each v a `Tale Y 0 0 (L_m^d) (entry) (upper profile) (lower profile) (index 0) ((orbitCost·‖Z‖)(t+2·columns_{m+1})) (lower charge) D`. |
| One Music, by downward induction | `MergeProof.compose` (`Largo.lean` l.22–63). The step is `repriseQ` (`Renaissance.lean` l.39) from `Tune`. That is (RS). |
| The per-door ticket (`Tune`) | `Bandage.chorus` (`MergeProof/Escarp.lean` l.27). It uses the interval witness of `Nest.held` and the Keeper `h.samples`. |
| Stored entries = Music plays | `Bandage.Freight` (`Marco.lean` l.25): `Z.tone N = summit …`, `Xf.entries = (Z.draft H).inits`, `Sung`, `Carol ∧ Chorus`. |

## Mathematical points to check

- **Hypothesis (1).** The startup family's forced cost (rooted support sum
  with the support exponent, ≤ δ_K) is identified with (T3) at w = δ_K = w^f_N.
  This rests on the packet-majorant computation in `wilson-startup-construction.tex`
  (l.240–255) and on the formula δ_K = e^{−M^{1/5}} (l.261).
- **"Proposition `prop:wilson-startup-family` applies at level N under the purchased
  schedule".** This relies on the start of this section: the terminal family is the
  exact Wilson family, and the retained parameter's member is the stored top.
  Its hypotheses (1)–(4) are schedule inequalities. A reviewer should confirm
  they are among the purchases.
- **Reserved labels and the nesting receipt.** The reserved-address hypothesis is
  derived here from the reserved labels of the startup dictionary.
  `original-history-portfolio-attachment.tex` l.139–144 still says that no result
  in that group of sections proves it. That sentence now has a producer, and its
  owner may want to update it.

## Remaining input

(RS), the one-step reprise on each stored door, is not proved. Its regular and
forced estimates are the (K) input of `prop:selected-zero-coordinate-coupon`
(#319). Its nonterminal slot realization is the open attachment of
`prop:selected-centered-retention` (#317). Its heading, room and bank are as in
`sec:three-port-history`.

## Checks run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`
  in `manuscript/`: exit 0, 1022 pages, no undefined references.
- The new pages (698–701) were rendered and inspected.
- No new overfull boxes in the new subsection. The overfull boxes in this file come
  from the #340 subsection and the table of contents.
- `python3 scripts/check_blueprint.py`: see the PR.
