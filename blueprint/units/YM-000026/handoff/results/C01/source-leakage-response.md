# C01 — response to the source-leakage audit rows (#181)

Issue #181 (follow-up to audit #159, report PR #164); package issue #42;
parent #26. Session `hairer-claude-20261113-c01leak`. Base
`codex/existence-monograph` at `2017d6f`; Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Author response; the edits
marked "math" and every J resolution need independent review by a
different account. No approval is recorded.

Row numbers and line numbers are those of the audit inventory at
`97128ab`; rows were located by their text. Classes: B (remark about the
formalisation), J (step deferred to "the source"), ? (unclear), N
(mathematical use, no action).

## Response table

| n | Location (base `2017d6f`) | Audit class → final | Response |
| --- | --- | --- | --- |
| 7 | `free-kernel-estimates.tex`, section opening | B | The "source proof … cross-referenced in the audit record" clause is replaced by a reference to the proof in the manuscript: `prop:ex-lattice-wire-entrywise-bound` in `sec:ex-lattice-free-kernel-components`. Source anchors moved below (C1). |
| 8 | `free-kernel-estimates.tex`, level response before the pulse/vault formulas | ? → J, resolved by proof (math) | The level-response identity `𝒟_{v,a}=b_{v,a}/d_M` and the recovery identity `ρ_v=d_M²β_v` were cited from the source. A short proof is now given: split the feed of `d_1^{-1}` into the zero residue (`= ℓ_{v,a}/d_M`, since `M²d_1(p/M)=d_M(p)`) and the nonzero residues (`= H_{v,a}`), add the noise `k^{-1}N_{v,a}`, and combine with the bend identity `d_Mβ_v=Σ_a J_a/b_{v,a}` of `lem:ex-lattice-train-component-bounds`. The notation `divisor_M=d_M` is stated. Source anchors in C2. |
| 9 | `free-kernel-estimates.tex`, reciprocal-shift paragraph | ? → B (wording) | "displayed level-source formula" replaced by "displayed formula in terms of ρ_v and the level responses". No mathematical change. |
| 10 | `free-kernel-estimates.tex`, end of reciprocal-shift paragraph | B | Clause "the companion audit records its exact source declarations" removed; the declarations are recorded in C3. |
| 11 | `free-kernel-components.tex`, after the noise definition | B (math wording) | "as in the source definition of the high part of the drain" replaced by the mathematical statement: the high-alias term uses the unit-side divisor `d_1` at the rescaled aliases, multiplied by `M²`, as in the display. Source anchor in C4. |
| 12 | `free-kernel-components.tex`, proof of `lem:ex-lattice-train-component-bounds` | ? → B (wording) | "The source noise list" replaced by "By definition, the noise list"; the definition is the one stated earlier in the same section. |
| 13 | `kernel-transport-identities.tex`, punctured transport formulas | J → N (definition) | Not a deferred step: the display defines `𝒜_l`, `𝒯_l`, and every identity used is proved in the following lines. "The source constructs the following rescaled columns:" replaced by "Define the rescaled columns". |
| 14 | `rg-horizon-geometry.tex`, bed construction | ? → B (wording) | "The source bed proposition fixes…" replaced by a statement of the bed's four precision rows and root row with a reference to `sec:positive-row-producer`, which constructs the bed (ledger edge `C01-positive-bed`). |
| 15 | `rg-horizon-geometry.tex`, tangent identities | ? → B (wording) | "the source towers' `A_0` and `T`" replaced by "the transports `A_0` and `T` of its tower". |
| 16 | `rg-horizon-geometry.tex`, tower strip costs | J → resolved by the proof in the text (math) | The sentence attributed the strip costs to a source theorem, but the following paragraphs already prove them by finite matrix bookkeeping (constants `C_A,…,M_0`, routed and mixed convolution estimates, inheritance of the donated difference bounds). The sentence now states the claim and introduces that verification. The reviewer should confirm that the bookkeeping is complete. |
| 17 | `rg-horizon-geometry.tex`, closing paragraph of the producer subsection | J → resolved by manuscript references (math) | "The source contract's remaining numerical receipts are explicit" replaced by an attribution of each datum: bed widths, costs and floors to the schedule input stated at the start of the subsection; tower costs to the bookkeeping above; crossing and roll identities to `prop:ex-lattice-horizon-roll`. The caveat is kept: the prices and floors are schedule inputs and do not follow from the block identity alone. No new named input; the schedule input is the one already recorded under `C01-positive-bed`, `C01-curvature-to-horizon` and `C01-wire-to-strip`. |
| x1 | `free-kernel-estimates.tex`, `rem:ex-lattice-free-kernel-inputs` | (not in the audit) B | Same leakage as rows 7 and 10: "component inequalities listed in the audit" replaced by references to `prop:ex-lattice-wire-entrywise-bound` and `sec:ex-lattice-free-kernel-components`. |

No new named outstanding input arises from these rows.

## Correspondence moved from the chapters

- **C1 (row 7).** The entrywise weighted wire bound
  (`prop:ex-lattice-wire-entrywise-bound`) corresponds to the source
  wire budget used in `thm:ex-lattice-wire-tower-strip`; the source
  anchors are listed in `../../../free-kernel-components-evidence.md` and
  `../../../free-kernel-estimates-evidence.md` (row "Theorem
  `thm:ex-lattice-wire-tower-strip`": `YM.Next.Free.Secured.bankCost`,
  `.traverse`, `.honored`; `Flight.duo`).
- **C2 (row 8).** Level response and recovery: `YM.Next.Free.levelD` and
  `YM.Next.Free.Train.D_feedback` (`Lean/YM/Next/FREE_KERNELS/Feed.lean`), and
  `Train.recover_rho`, `Train.D_bulb`, as listed against
  `lem:ex-lattice-train-component-bounds` in the PR #83 Lean table
  (`review/schmittj-claude-20261112/part2-lean.md`, row 61; file path not
  recorded there and not re-inspected here). The manuscript proof is
  restricted to nonzero momentum, where `d_M≠0`.
- **C3 (row 10).** Reciprocal shift of the wire: `YM.Next.Free.Secured.relay`,
  instantiated by `secure_both` (`Strands.lean`), built from
  `Flight.knots_shift`, `alias_exchange`, `script_shift`, `wire_match`,
  `copper_match`, `stake_match` (`Ends.lean`, `Aliases.lean`, `Wire.lean`).
  Caveat retained from the evidence file: the prose follows only the
  `scriptT` factors required by the wire, not the separate `scriptA` shift.
- **C4 (row 11).** The high-alias term is the source `high` part of
  `drain` (`Lean/YM/Next/FREE_KERNELS/Feed.lean`), whose divisor is the
  unit-side divisor; the port blow-up `blow` uses the train side.

## Checks

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`
  in `manuscript/`: success; no undefined references. The single overfull
  box (1.8pt, `public-run-binding.tex`) is present at base and is outside C01.
- Changed passages inspected in the rendered PDF (row 8 derivation, rows
  11–17 wording).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK".
- `HANDOFF.md` chapter hashes updated for the four edited chapters.
