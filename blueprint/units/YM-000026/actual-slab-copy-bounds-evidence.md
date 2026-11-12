# Actual uniform slab-copy producer

Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Author: parent `hairer-codex-existence-20261111`, within #26 confirmed claim.
Authoritative text: `manuscript/existence/actual-slab-copy-bounds.tex`.
Status: draft; independent source/mathematical review pending.

## Scope and same-data interfaces

Supplies the actual Bench/AllCopy application from the same Seed.CellHyp,
Makes, Hierarchy, PointLimits and gentle mesh. Does not choose another
hierarchy or assume the requested slab-copy estimate. Does not supply
rotation actions, phase grid approximants or corrected detector moments.
Canonical centered service, coarse one-field bracketing/copied-orbit argument,
finite planted inequality and generic smooth point limits are retained inputs.
The same expanding mesh-then-period order is used throughout. Each-period
CenteredBook is unnecessary here. Local inputs remain subject to whole-proof
closure and human acceptance; this local draft does not certify them.

## Inspected source crosswalk

All paths below are under `Lean/YM/` at the pinned revision.

| Prose step | Fully qualified declarations / source |
| --- | --- |
| Uniform bounded multiplet prices, including finite signed orbit | `YM.Next.Phase.rates`, immediate private mirror_ball/one_grade; `Next/PHASE/Seats.lean` |
| Exact centered input with additive tolerance and common late order | `YM.Cells.CellHyp.centered`, `Cells/Packing.lean`; `YM.Extraction.centeredBudget`, `Wcmain.projects`, `CenterPort.book`, `Extraction/Center.lean` |
| Coarse root of an exterior group and mixed planted bound | `YM.Next.Phase.exterior_group`, `cutoff_bound`, `Single`, `Single.moves`, `Next/PHASE/Roots.lean`; aligned margin/reflection helpers in `Aligned.lean`; reused Lease.alive one-field argument already in centered-estimates |
| Finitely many residue patterns, perturbations and ordered continuum limit | `YM.Next.Phase.Pattern`, `Gapped`, `point_bound`, immediate margins/numeric_bound/round_same/round_near, `Next/PHASE/Passage.lean` |
| Counts 4qn and 2 exterior copies, q-independent exterior price | `YM.Next.Phase.travel_price`, immediate train_buffer/train_length/ride_train/train_suit/words_bound, `Next/PHASE/Trains.lean` |
| Fourth-power mesh lower bound and uniform n/r price | `YM.Next.Phase.replicas`, immediate room_for/ext_room, `Next/PHASE/Seats.lean`; `YM.OS.thickness`, `turn`, `At`, `OS/Halves.lean` |
| Positive integral sub-width chosen before exterior | `YM.OS.narrow`, `Covered`, `OS/Halves.lean`; `YM.Next.Phase.seats`, `Seats.lean`; exact `YM.Bid.Bench`, `Seats`, `Bid/Phase.lean` |
| Repetition bound and bounded operator | `YM.OS.QRead`, `producer`, `OS/Train.lean`; canonical manuscript Lemma ex-train-bound |
| Padding by remaining heat time, unique common Spread | `YM.Work.B01.answer`, immediate with_cost, `Work/B01.lean`; `YM.OS.Spread.radius`, `AllCopy`, `OS/Slabs.lean` |

The manuscript groups the geometric helpers by their actual mathematical
purpose. It explains the mixed coarse/fine root argument, including multiple
exterior fields in a single coarse cell, rather than assuming products of
coarse one-field norms. It explicitly keeps independent perturbations of
replica slots before generic point-limit passage; convergence is not assumed
on a congruent-pattern submanifold or projection ties.

## Literature and checks

Searched shared background catalog and available notes (README and
su2-simplicity); no applicable source-specific two-scale same-family result.
The needed planted/centered and bounded-operator arguments already have
canonical manuscript proofs and are reused. No new external theorem is
asserted, and no broad literature search was undertaken for this bounded
source-specialization task.

Commands actually run: focused cat/sed/rg reads of the files listed above and
canonical centered-estimates, selected-centered-service, phases and phase
regularity/producers; sha256sum on the new prose. No Lean changes, fresh Lean
build or axiom replay. TeX integration/build/visual QA and independent review
are pending at this snapshot. The exact displayed exponent is K=4(D+1), with
constants selected before word length, slab width, buffer, exterior or copies.
