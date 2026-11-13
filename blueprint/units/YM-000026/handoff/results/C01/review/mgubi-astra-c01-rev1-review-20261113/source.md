# C01 revision 1: independent source correspondence review

Target, comparison base and exact input blobs are in `inputs.json`. Upstream pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is manual correspondence inspection, not Lean elaboration, kernel replay or an axiom audit. Human acceptance is unset.

**Verdict:** the revised mathematical interfaces inspected match the immediate source definitions, with one required minor source-locator correction. The actual literal-path chain is sound; its printed fully qualified names need repair.

## S1 — path-derived namespaces are not declaration namespaces

At frozen `blueprint/units/YM-000026/handoff/results/C01/RESULTS.md:43`, replace all six inaccurate names in the literal-path bullet:

| Printed name | Actual fully qualified declaration | Source path |
| --- | --- | --- |
| `YM.Shoot.Competes.prices` | `YM.RG.Shoot.Competes.prices` | `Lean/YM/Shoot/Reach.lean` |
| `YM.Shoot.Lives.path` | `YM.RG.Shoot.Lives.path` | `Lean/YM/Shoot/Criteria.lean` |
| `YM.PCalc.Directed.bases` | `YM.Input.Directed.bases` | `Lean/YM/PCalc/Band.lean` |
| `YM.PCalc.Kin.Planned.links` | `YM.Precision.Kin.Planned.links` | `Lean/YM/PCalc/Loop.lean` |
| `YM.PCalc.Kin.Planned.cap` | `YM.Precision.Kin.Planned.cap` | `Lean/YM/PCalc/Loop.lean` |
| `YM.PCalc.Directed.actually` | `YM.Input.Directed.actually` | `Lean/YM/PCalc/Band.lean` |

`YM.Org.Bolt.sticks` is correct. Directory names do not supply namespaces. The inaccurate forms occur together in this new RESULTS bullet; `revision-1.md` refers to the chain without repeating these names. Its Records response should accompany the correction. Historical PR83 reports also used some inaccurate names; this review does not edit or refresh them.

## Inspected correspondence

- `YM.Next.Free.Flight.pilot_cost`, `ahead_cost`, `gains_cost`, `sluice_cost` in `Docked.lean` match the regular-expression proof and alias weights. Definitions `pilot`, `ahead`, `gains`, `sluice` and their matching lemmas are in `Pilot.lean`. `Flight.abide` in `Portions.lean` and `abide_firm`/`abide_budget` in `Buffer.lean` account for the uniformly invertible regular denominator. `grade`/`decay` in `AliasWeights.lean` distinguish the additional signal factor from decay. Bare singular denominators are not assigned these bounds.
- `YM.Next.Free.Flight.script_shift` in `Ends.lean` proves both A and T two-variable periodicity; `knots_shift` transfers it to the aliases by matching away from zero on genuine overlaps. `knots_reflect` treats zero separately. `YM.Next.Free.secure_both` in `Strands.lean` uses pilot_cost and wire_budget for the two families, with the same overlap/reality obligations. The new order-one prose uses precisely the pilot member of this pair.
- `YM.Next.Free.Flight.adjust_adj`, `scaled_tri` and `tangent` in `Primal.lean` exhibit the same scale factors as the new primal calculation. The installed interface is `YM.Precision.Inputs.primal` in `PREC/TreeMatch.lean`. `Dispatch.lean`'s assembly and finite-reading identities were inspected at the immediate coefficient-to-finite-torus interface; no claim is made to have reread the entire matrix-export library.
- `YM.Next.Free.Train.D_signed` in `Feed.lean` supplies the signed response identity; its proof uses the periodic/feedback identity consistent with the revised prose.
- For the literal path, `FullVolume/Cross.lean` defines the family's path using `Issue.trail`; `Extra/SOURCE_HISTORIES/Issue.lean` defines that trail from the bolt history. The declarations corrected in S1 relate that history to the planned path. `Directed.bases` identifies the paths; `Planned.links` supplies attachment and `Planned.cap` supplies Bounds. `Directed.actually` transports the supplied receipts. They remain distinct and refer to the same data. This does not create omitted C12/C16 consumer acknowledgments or global closure.

The eight changed chapters, three author records and selected immediate source/context files are frozen individually. Old PR83 source reports were used as historical evidence and checked where the new changes depend on them; they are not a substitute for a whole-tree audit. The source tree and pin remain unchanged across the target revision. No author hash is treated as reviewer approval, and no existing reviewer record was modified.
