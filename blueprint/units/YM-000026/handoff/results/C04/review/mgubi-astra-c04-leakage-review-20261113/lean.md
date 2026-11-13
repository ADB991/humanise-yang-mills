# C04 row 58: textual Lean-correspondence review

Session: `mgubi-astra-c04-leakage-review-20261113`; contributor account mgubi with one GPT-6 Astra subagent and parent inspection. Human acceptance is unset. Target: PR 203 at `9e7326b832793a0a8db6d08d045e024874f1178b`. Pinned source: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Exact inspected-file hashes and blobs are in `inputs.json`.

**Outcome: no required source-correspondence correction to the row-58 relocation.** This verdict is limited to the new record and the one-clause deletion; it does not approve the unchanged coordinate paragraph or the whole C04 package.

## Immediate definitions inspected

| Declaration | Pinned path | Checked meaning |
| --- | --- | --- |
| `YM.Axis`, `YM.SpaceAxis`, `YM.timeAxis` | `Lean/YM/Space/Index.lean:18–20` | Four indices, three spatial indices, and time index `Fin.last 3`. |
| `YM.E4`, `YM.Space3`, `YM.time`, `YM.spatial`, `YM.position` | `Lean/YM/Space/Configurations.lean:24–29` | Time is evaluation at the distinguished last axis; spatial coordinates use `castSucc`; `position` appends time using `Fin.snoc`. |
| `YM.Mink.divide`, `YM.Mink.divide_at` | `Lean/YM/Mink/Geometry.lean:39–48` | A four-vector is represented as `(spatial x, time x)`. |
| `YM.Mink.pairing`, `YM.Mink.volume_divide` | `Lean/YM/Mink/Geometry.lean` | The coordinate split uses the ordinary Euclidean pairing and preserves volume. No altered Fourier sign is introduced by the editorial change. |
| `YM.Mink.m`, `YM.Mink.cone` | `Lean/YM/Mink/Geometry.lean:77–78` | The form is `time x ^ 2 - norm(spatial x)^2`; the forward cone uses `norm(spatial x) ≤ time x`. |
| `YM.Mink.Proper`, `YM.Mink.Lorentz` | `Lean/YM/Mink/Lorentz.lean:32–44` | The subgroup consists of determinant-one invertible maps preserving that fixed form and cone. The coordinate permutation is not asserted to be a member of that subgroup. |

These declarations substantiate the relocated claim that the formal representation is time-last. `statement.tex` independently states the same convention. The new record's conjugation formulas and warning about fixed matrices/cones agree with the definitions; they do not silently identify a time-first Lorentz matrix with a time-last one.

The earlier `rereview-revision1.md` coordinate finding was compared directly with the new author record and the unchanged paragraph. Its “to themselves”/“verbatim” problem and the Euclidean insertion exception remain explicitly recorded. Their repair is outside this one-row change and is not inferred from successful correspondence of the removed clause.

## Evidence limits

Read-only textual inspection only: no Lean elaboration, fresh `#print axioms`, kernel check, Comparator replay or transitive audit. The target's Lean tree equals its parent's `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. The pinned source manifest is included in the frozen evidence. The review does not accept prior C04 proofs, incoming edges or historical review fingerprints, and no acceptance metadata was changed.
