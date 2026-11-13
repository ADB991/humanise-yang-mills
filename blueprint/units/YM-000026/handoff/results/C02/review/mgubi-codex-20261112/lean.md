# C02 PR82: bounded textual Lean-correspondence review

- Unit: `YM-000026`, package C02.
- Role: Lean correspondence, by source inspection; no fresh elaboration.
- Contributor account: `mgubi`; responsible human acceptance: **not recorded**.
- Agent assistance: independent Codex review subagent; deliberately duplicated bounded verification, separate from the C02 author and from the reviewer of PR89.
- Author head: `93fd8657d90942fb17ba3298c755a73b0a642592`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; unchanged Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.
- Unit content SHA-256: `d3b1b8c18e25833946f4e760ad55e2156ecedcf5b166939f3d4e1dafbb8b3286`; twelve manuscript hashes are in `hashes.json`.
- Task/target: [issue43](https://github.com/hairer/humanise-yang-mills/issues/43), [PR82](https://github.com/hairer/humanise-yang-mills/pull/82).
- Outcome: **changes requested for cutoff specialization L1/M1**; checked finite-menu/common-history interfaces correspond to the source. No complete package verdict or human acceptance.

Line numbers below refer to the immutable author head and pinned source, not a moving branch.

## L1: the treasury comparison fixes the cutoff

`YM.MergeProof.Accent.sail` (`Lean/YM/MergeProof/Arbol.lean:17–26`) takes any positive cutoff `s` below the representation threshold, plus `Integrable X`, and concludes a bound with `Bands.finalBill ... s ...`. It does not directly conclude a fixed treasury bound.

`YM.Vac.treasury` (`Lean/YM/Vac/Treasury.lean:29–37`) uses `u := A.clock.hatCoupling m` in both `baseBudget` and `log(16/u)`. `YM.Vac.suffices_bill` (same file39–44) bounds `Bands.finalBill` specifically at that cutoff. `YM.RG.Calendar.hatCoupling` is defined in `Lean/YM/RG/History.lean:80` as the inverse square root of `hatBeta`.

The actual application `YM.MergeProof.Accent.vista` (`Arbol.lean:45,52–55`) proves that this selected cutoff is positive and below the threshold and supplies it to `sail` before applying `suffices_bill`. `YM.FullVolume.Sever.charges` (`Lean/YM/FullVolume/Fields/Flight.lean:32–36`) does the same. `YM.MergeProof.Accent.occursT` (`Lean/YM/FullVolume/Dusk/Placed.lean:19–34`) reaches the result through `vista`.

Therefore `centered-public-service.tex:22,35–38` must select `s=beta_hat_k^(-1/2)` before the treasury comparison; likewise specialize the generic `rho` before `centered-construction.tex:105`. See M1 in `mathematics.md` for the mathematical reason and provenance. This independent confirmation followed the corresponding finding in [PR89](https://github.com/hairer/humanise-yang-mills/pull/89).

## Source correspondence checked

| Interface | Exact inspected source and conclusion |
| --- | --- |
| Generic finite menu | `YM.MergeProof.Menu.Volant`, `Lean/YM/MergeProof/Copse.lean:20–24`, quantifies over finite marker and menu index types and an arbitrary census. It requires positive weights, `Occupancy (S.ratio.parent composed with o) N`, and `Offer`; it returns `Canopy` together with `SoundDoor`, `Tunes`, and `Arsenal`. |
| Retained output identities | `YM.MergeProof.Menu.Canopy`, `Copse.lean:15–18`, gives ordinary and flagged `Towed` bounds, support/shell predicates, the full push identity, quiet profile, and singleton sum using the supplied door. It does not assert linearity of the complete nonlinear response. |
| Offer and conversion | `YM.MergeProof.Menu.Offer` and its grouping inputs in `Lean/YM/MergeProof/Fruit.lean` retain fine crest membership and the weighted budget at the stated radius/exponent/allowance. The inspected conversion and grouping match `rg-construction.tex:244–311`; the analytic majorants remain inputs, as the manuscript now says. |
| Actual adjacent history | `YM.PhysicalNext.Repeat.Legato.Bandage.paneer`, `Lean/YM/MergeProof/Wax.lean:44–65`, takes `Nest`, `Climbs` for the given door, `Pungent`, the tariff and endpoint exponent bounds100. It returns input exponent `b_f-4`, ordinary output `b_c+1/2` with allowance1, flagged output `b_c+1` with allowance `straw`, and the duty estimate. Lines50–58 destructure the same `Climbs` witness and transport its endpoint equalities; no alternate history is selected. |
| Fine coupling and tariffs | `YM.PhysicalNext.Repeat.Mallow.station`, `probe`, `Tariff`, `Lean/YM/MergeProof/Revenue.lean:30–43`, fix powers-1/-2 at `betaF`; shipping/buy use the appropriate fine data, lodging/credits use the coarse radius. `paneer:53,59–65` performs the exact coupling substitution used in `finite-menu-history-handoff.tex:89–125`. `thaws:49–74` is eventual for fixed target, block, occupancy and positive shape parameter, not a uniform free tariff over unbounded occupancy. |
| Many slots | `YM.MergeProof.Ribbons.ManyCopies.Unites`, `Lean/YM/OPE/Replicas/Price.lean:18–19`, quantifies over arbitrary finite `V`, `slotsZ`, menu indices, origins and positive weights. Crucially, parent occupancy is on the entire product `V x slotsZ`. Its motion conclusion additionally requires `Kin` and equal slot weights under the comparison. `YM.PhysicalNext.Repeat.Mallow.Many.vastN:70–95` supplies this extension. |
| Many slots on the same door | `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN`, `Lean/YM/OPE/Replicas/Sponsor.lean:44–55`, uses the same `Nest`, `Climbs`, tariff and endpoint bounds as `paneer`. Its `duetPN` transport rewrites endpoints of the supplied door. |
| Public C16-facing wrapper | `YM.PhysicalNext.Repeat.Legato.exodusN`, `Lean/YM/OPE/Replicas/Pass.lean:40–52`, builds `VelourArity` for the literal family on `Issue.trail Y`. It combines `paneer` and `sewedN` on the same `D` with the purchased `AccordV`, support floor, `Chateau` and exponent hypotheses. Its `SwornClusterCuts` output also retains the scale/cost and transport obligations; it is not supplied by a bare funded path. |
| Exact fixed100 specialization | `YM.RG.Levels.budget`, `Lean/YM/RG/History.lean:141–149`, sets `supportExponent := (s.params m).supportExponent` definitionally. The inspected `Rain.jersey`/`params_eq` identities transfer the selected stage profile. Thus a profile fixed at100 gives exact budgets100, and the menu exponents specialize to96,100.5,101. Merely knowing a lower bound100 would not by itself justify equality with these numbers. |
| Stock index guard | `YM.MergeProof.Ponds.stocks`, `Lean/YM/FullVolume/Fields/Pond.lean:28`, requires both the grade-reference bound and `k<=N`. `Geyser.pond:29–31` and `Ponds.past:32–65` preserve that guard and let the height depend on the displayed indices. This matches `centered-public-service.tex:6,18`. |
| Column-weighted price | `YM.Next.Rank.Spindle.moneys`, `Lean/YM/Next/RANK/Insiders.lean:50`, is columns times `paid`; `receipts` in the same file constructs budgets `3L` and the support-cutoff multiple of `L`. `Accent.occursT`, `Placed.lean:19–34`, requires `k<N` and the column-weighted initial bound, derives the weaker payment for `Ponds.past`, and uses `k<N` to identify `topPitch`. These are the repaired qualifications in the service paragraph. |

## Cross-package condition to retain

C16 may use arbitrary finite slot sets without changing the retained transition, but only for offers satisfying the occupancy bound on **all cell-slot markers**. Fixed per-cell occupancy is not a substitute. This is a condition of `Unites` itself, before its existential output, and remains a condition after `sewedN`/`exodusN`. The clarification was relayed to the C16 contributor; no C16 or author file is owned or changed here.

## Evidence limits and acceptance

This is source inspection at the pin, not a new kernel-check or axiom audit. The versioned build/axiom evidence referenced by issue37 and the author validation is inherited; no full Lean rebuild or new axiom output is claimed. Definitions and the immediate joins listed above were inspected, but the entire source dependency graph and public `rampant` producer were not re-audited. Screened changes elsewhere in C02 do not imply full chapter acceptance. Validation commands and exact hashes are in `validation.md`/`hashes.json`.

No approval or `reviewed` metadata is added. Responsible human acceptance and renewed review after correction remain pending.
