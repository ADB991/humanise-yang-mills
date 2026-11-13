# C01 source-leakage response: correspondence

**Verdict: minor required source-name correction S1; otherwise the inspected immediate correspondence supports the bounded changes.** Target `a23cf539b3eaee42f167775a3fcb7472013316b1`; upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual inspection only; no elaboration, axiom audit or whole-C01 certification.

## S1 — levelD namespace

In `blueprint/units/YM-000026/handoff/results/C01/source-leakage-response.md`, C2 line 43, replace `YM.Next.Free.levelD` with `YM.Next.Free.Train.levelD`. The definition is within `namespace Train` in `Lean/YM/Next/FREE_KERNELS/Feed.lean` (137ff). This is a locator correction, not a different mathematical object.

The immediate quotient and recovery declarations can now be located precisely: `YM.Next.Free.Train.D_bulb` and `YM.Next.Free.Train.recover_rho` are in `Lean/YM/Next/FREE_KERNELS/Bend.lean` (72ff and 150ff). Both explicitly require p in `realCube zone` and p!=0; recovery also requires k>0. The author honestly reported not reopening those paths; this review supplies the additional evidence. `Train.pole_split` in `Feed.lean` (192ff) is the direct zero-residue/high-alias split. `Train.D_feedback` describes the recursive response identity and is not a substitute for the regular-domain hypotheses of `D_bulb`.

`Train.levelNoise`, `nozzle`, `high` and `drain` were inspected alongside `feed`/`shuttle`. They match the displayed M^(-2) counting factor, unit-side high divisor and accumulated noise. `Train.bulb_glows`/`D_live`, the bend definition and `recover_rho` confirm the legitimate divisions on the stated real domain. This supports the domain clarification in the mathematical report, without claiming that every nonzero complex momentum is regular.

For row 16, `YM.Work.F08.answer` in `Lean/YM/Work/F08.lean` was inspected through the explicit constants and tower construction. The width is the minimum of fine/coarse bed and curvature-factor widths. Its constants CA, CB, CL, CF, CN, Cproj, Cup, CX, CO and M match the manuscript; CN uses the positive k square-root inverse. It retains the donor's A0/T and their difference bounds while adding the three completion rows. `fineCompose` and `strip_fine` in `Lean/YM/Work/F08/Mixed.lean` confirm that the residue is selected by each routed displacement, with only the intermediate form-cardinality factor. The complete helper proof tree was not read.

For row 17, `YM.Next.Free.retained_support` and `retained_presents` in `Lean/YM/Next/FREE_KERNELS/Rack.lean` (121–145) preserve the actual level family under kernel/stage matching and numerical Credit. The theorem retains the distinction between priced construction and the inputs used to select it. This supports the revised attribution; no public-run payment or path matching is certified here. The manuscript's block-completion proposition was checked directly as the finite algebraic interface.

Other relocations preserve their caveats, including C3's scriptT-only scope. The author handoff retains pending human acceptance and external obligations. Only these frozen changes and listed immediate definitions were inspected; unlisted source anchors and the full earlier one-form bound are not newly certified.
