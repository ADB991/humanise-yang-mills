# G01 revision 1: renewed independent review (agent review, no human acceptance)

- Package: G01, issue [#58](https://github.com/hairer/humanise-yang-mills/issues/58); parent #26.
- Role: renewed reviewer of G01 revision 1 (PR #132, commit `135bb96`, session
  `schmittj-claude-g01-rev1-20261113`, author schmittj). This session's account wrote the review
  that the revision answers (`../hairer-claude-20261113/`, PR #124) and authored no G01 file.
- Session: `hairer-claude-g01-rev1-review-20261113`. Claim: comment on #58 by `hairer`,
  13 November 2026, until 2026-11-14 13:15 UTC.
- Account and agent: submitted under `hairer`; the work was done by a Claude (Anthropic) agent
  session. **Independence caveat:** the author session also used Claude (Fable 5.2); this review is
  by a different account and session, not a different model family.
- Reviewed content: `codex/existence-monograph` at `edbc111bb0eb260b9497c427e1fa6fb591f3ea62`,
  with the hashes below. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- **Outcome: accepted. Q1–Q3 and next step 2 of the earlier review are answered correctly; no
  required change.** The formalisation of M3 states what the records claim, and its one added
  hypothesis (homogeneity of the trace two-point function) is a correct repair of a gap in my
  earlier sketch. Two optional suggestions below.

## Items of the earlier review

| Item | Request | Verdict |
| --- | --- | --- |
| Q1 / M3 | Record group independence or decline it | **Answered, and better than requested.** Recorded in `README.md` and in the `adequacy.md` (d) addendum, and formalised (below). The addendum's wording matches the Lean statements: the scalar `sqrt(dim g / dim g₀)`, re-homing to a Haar family over `g`, application of (c), constant insertions, and the reading "about what the public statement certifies, nothing against `YangMills.constructed`". |
| Q2 | Reword (d)(3), point to M4 | Done. The new item 3 says the construction reuses the selected theory of `T₀`, that an explicit theory without Yang–Mills input is open, and cites M4. It no longer claims anything about difficulty. |
| Q3 | Per-patch status; line-number basis | Done. The status table agrees with my verdict table (P1, P3, P4 applied; P2, P7, P8, P9 not applied; P5 first part applied, the remaining sentence withdrawn, as I recommended; P6 three sentences remaining). The heading states that line numbers refer to the audited hash `43ca…5378` and that the status is taken from the review, not re-checked by the author. Acceptable. |
| Next step 2 (`lean.md` L4) | Re-run the formal build | Done by the author locally and on the server; the correction about `compile.sh` skipping an up-to-date `Adequacy.olean` is recorded. Independently reproduced for the public part (below). |
| M4 | Generalised free field | Not addressed, as agreed; still open. |

## The formalisation of M3

**Correction of my sketch (confirmed).** My M3 argument rescaled the grade-four field "by
multilinearity". Multilinearity is not a public clause: `Hierarchy.traceTwo r` is the value of the
bare function `correlation (some selected)` at two copies of `⟨4, centeredTrace⟩`
(`rehome_traceTwo` holds by `rfl`), and no public clause makes `correlation` homogeneous in the
field components. So `shortDistance` and `excludes` for the rescaled field need
`traceTwo(λΘ) = λ² traceTwo(Θ)` as a hypothesis, exactly as the author found. `centered` needs
no hypothesis because it is stated through the linear maps `toLabel 4` and `field`
(`rescale_centered`). I agree with this analysis; my earlier sketch was incomplete at this point.

**Statements read against the public specification.**

- `rehome` copies every field of `Hierarchy` except `project` and `centeredTrace`;
  `rehome_reconstructed` transfers all fifteen fields of `Reconstructed`, with
  `represents := hproj` (surjectivity of the new `project`); `rehome_ope` transfers both fields.
  These are the only places the family enters, as the author states.
- `rehome_traceTest`: `amplitudePositive` for `g` from `dim g > 0`; `shortDistance` from the
  rescaled limit `λ² · 3 dim g₀ / π⁴ = 3 dim g / π⁴`; `excludes` by dividing Wick coefficients by
  `λ²` (`wickProfile_scale`; coefficients are arbitrary complex numbers).
- `haarFamily` has `beta = 0` and zero insertions, so it is **not** itself regular; this is harmless
  because `constant_insertion_witness` returns `Adequacy.family C₀ T₀`, which reads only `haar`,
  `probability`, `invariantHaar` and the token type of its input and sets
  `beta N _ = log (N + 2)` (`Adequacy.lean` 100–110). The docstring of `haarFamily` says this.
- `finrank_pos_of_traceTest` derives `dim g₀ > 0` from `amplitudePositive`;
  `finrank_pos_of_isSimple` derives positivity from the public `IsSimple`.
- Full project (`GroupIndependenceFull.lean`): the two extra hypotheses are discharged from
  `YangMills.constructed g₀` by `MultilinearMap.map_coord_zero` and `map_smul_univ`. I checked by
  reading that `(hierarchy F Q).correlation s v x = S.useAt (spectator F s) x v`
  (`Lean/HierarchyBridge.lean` 37) and `useAt x v = S.classMoment T (fun i => (v i).1) x (fun i => (v i).2)`
  (`Lean/YM/Euclid/Lift.lean` 69), so the selected correlation is a `classMoment` multilinear map
  in the field components, as the proof uses.
- The author's remark on how to read the full-project corollaries is right: only
  `group_transfer_witness` makes group independence visible in its statement; at simple `g` the
  corollary is already implied by `jointExistence_with_constant_insertions`, and what is new at
  statement level is groups of positive dimension that are not simple.
- Scan: no `sorry`, `admit`, `axiom` declaration, `native_decide`, `unsafe`, `implemented_by` or
  `extern` in either file (`grep`).

**Independent elaboration (public part).** `ReviewerCheck.lean` in this directory restates, in the
reviewer's words and using only the public specification, (i) `JointExistence ↔ ∀ simple g, body`,
(ii) M3 over the public specification with the hypothesis written as
`HomogeneousTrace T₀ (scale g₀ g)`, (iii) that degree-two homogeneity implies that hypothesis,
(iv) the value of the scalar, and proves each from the author's theorems. A statement in the
author's file that said something different would make an `example` fail. Run by the account
holder on a local machine and relayed to this session (the review workspace has no Lean toolchain
and cannot reach the Mathlib cache), in a fresh directory with `lean-toolchain`,
`lake-manifest.json` and the three public files from `Lean/`, and `lakefile.toml`,
`Adequacy.lean`, `GroupIndependence.lean` from `formal/`:

- `lake exe cache get`, then `lake build`: `Build completed successfully (8662 jobs)` (the same
  job count as the author's).
- `lake env lean ReviewerCheck.lean`: no errors; output
  ```
  'YangMills.group_transfer_witness' depends on axioms: [propext, Classical.choice, Quot.sound]
  'YangMills.group_transfer_jointExistence_body' depends on axioms: [propext, Classical.choice, Quot.sound]
  'YangMills.GroupIndependence.homogeneousTrace_of_homogeneous' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```

## Optional suggestions

- **S1.** In `group_transfer_witness` and `group_transfer_jointExistence_body`, the hypothesis
  `hom` is written out in full; stating it as `HomogeneousTrace T₀ (scale g₀ g)` would be shorter
  and makes the role of the scalar visible. They are definitionally equal (`ReviewerCheck.lean`
  uses that form and elaborates).
- **S2.** Whether `root`, `analytic` and `boundary` imply the homogeneity (the author leaves this
  unexamined) could be added to the M4 task, since both ask how much of the selected theory the
  public clauses actually constrain.

## Not checked

- Elaboration of `GroupIndependenceFull.lean`: it needs the compiled full project (about 12,000
  modules, the #37 rebuild); checked by reading only, relying on the author's server build.
- No independent kernel replay (`lean4checker`, Comparator) of the new objects.
- Mathlib's definitions (`Measure.haarMeasure`, `Matrix.unitaryGroup`) taken as read.
- M4, and whether and how the manuscript should state group independence (coordinator and C16).

## Hashes (SHA-256) of the reviewed files

| File (under `results/G01/`) | SHA-256 |
| --- | --- |
| `README.md` | `fcdedec3f06a7d0b9179b5176d5fa0b4791b4c20d28ebf913af92f873d14b885` |
| `adequacy.md` | `fe5619785d3db48a414788137eb2f282521cc8803b3c779a6d06f05f816d57fa` |
| `proposed-patches.md` | `73b15e9fe25ed85001acacfad02a5471b225e6c1d607a9cc146e9e2e1d3bdf2b` |
| `formal/README.md` | `0b95330db47c41db33d88092b2be967e6c3d5a55d62820f417bd6b7ec41b705c` |
| `formal/GroupIndependence.lean` | `71441f89e6ebe5a4dc3c291dc98c8d00151b3b4dabdbf7574fb9b39d02ebeebc` (as recorded by the author) |
| `formal/GroupIndependenceFull.lean` | `16026a3e3839d7409532245059a0acbbf653caf5145dc00c04c05a2b831064ec` (as recorded) |
| `formal/lakefile.toml` | `3d68fb2f3493e1be64938bb87ffef4eed6c7d85125e36b12137d265680060914` (as recorded) |
| `review/revision-1-hairer-claude-20261113/ReviewerCheck.lean` | `54916987be83a293036cc47ae4aaeac5bd0286c3069644dfa0a6dd76ea830679` |

## Next steps

1. With this review, the G01 records and formalisation carry a positive agent review. #58 can be
   closed once the coordinator has decided where the remaining items go: M4 (a bounded task),
   the manuscript wording of findings 1 and M3 (C16, #57), and P2, the rest of P6, P7, P8 to
   their owners.
2. Optional: an independent kernel replay of `GroupIndependence.olean`.

This review records no human acceptance and changes no machine-readable review status.
