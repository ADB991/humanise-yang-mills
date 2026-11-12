# C05 author report: OPE prescription and grouping

Package: [C05](../../C05.md), issue [#46](https://github.com/hairer/humanise-yang-mills/issues/46).
Author session: `ADB991-claude-20261112-0c65` (Claude, running as a scheduled
agent on behalf of @ADB991; ADB991 had not reviewed this before submission).
Claim: https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6828067693.
Start: `codex/existence-monograph` at `01ef22c` (mathematical snapshot `9b879ee`).
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This is an **author** pass. Independent mathematics and Lean-correspondence
review of the final hashes below is still required. Nothing here is a closure claim.

| File | Content |
| --- | --- |
| [ledger.md](ledger.md) | Input/output ledger: stable edge IDs, exact statements, common data, status |
| [findings.md](findings.md) | Audit findings, repairs made, and open items |
| [correspondence.md](correspondence.md) | Lean declarations inspected for this pass and what they confirm |
| [validation.md](validation.md) | Commands actually run, results, final hashes |
| [handoff.md](handoff.md) | What is established, what is not, next steps |

## Summary

All 14 chapters were read in full and their arguments checked line by line
(constants, quantifier order, rate arithmetic). No mathematical error was
found in the proved steps. The repairs are interface repairs. They make the
same-data handoffs explicit and fix one notational slip:

1. `ope-cutoff.tex`: the finite-cutoff comparison producing
   `eq:ope-cutoff-discrepancy` is now identified as the construction of
   `sec:reference-match`. The two sections use opposite scale letters, so an
   explicit index/quantity dictionary is added, checked against Lean `YM.OPE.funding`
   and `YM.OPE.terminalAfford`. The transported allowance 𝓜 is now defined.
   The connecting-cover letter clash with `sec:ope-grouping` is resolved, and the
   C16 supplier (O1) of the cover-rate condition is identified.
2. `ope-cutoff.tex`: new `prop:ope-match-assembly` derives
   `input:ope-match` from the cutoff construction, the phase transfer and the
   filtration estimates. It uses one label `Q_n`, conditional on explicitly listed
   analytic inputs. This is refresh item 1 and item 6 in `ope-closure-refresh.md`.
3. `ope-grid.tex`, `ope-local-projection.tex`, `ope-filtration.tex`: replace
   "remains an input" sentences by precise pointers to the producing sections
   (`prop:ope-match-assembly`; C06 `sec:leaf-transfer` with `x=Q_e`; C14
   `sec:finite-rank-kernel-transport` with `p_c=A_c`, `p=T`). They keep the
   conditional status and state the remaining inputs.
4. `ope-phase-prices.tex`: the spectator group's degree/size is now `(w_1, I_0)`,
   not `(w_2, J_0)`, in the final transfer paragraph and the tie-removal
   paragraph, and `w_1, w_2` are defined.

The most important open cross-package items are in `findings.md`.
F1: C14 must state the subpower-family form of `eq:finite-rank-silent`.
F2: producers of the signed reference transitions, the triangular columns and
the local trials were not located. F5: C05 consumes, and does not produce, the
O(4) action that C03's ledger lists as I-C05-O4.
