# G04 claim-to-producer ledger

Each outline statement points to an existing label. Columns:

- **Evidence:** D = the parent read the statement text directly; S = based on a read-only
  subagent summary of the chapter, label and environment checked by the parent with grep.
- **Status:** the producing package's current status (from `results/Cnn/`); the outline
  repeats it only in Section 2.7.

| Outline item | Producer label(s) | Package | Evidence | Status of producer |
| --- | --- | --- | --- | --- |
| Target conditional on joint input | `ex-conditional-existence`, `ex-joint-input`, `ex-full-mesh` | C16 | D | conditional; review M3/M4 open |
| Trace test is not a mass gap | `thm:profile-exclusion`, `ex-trace-limit` | C15/C16 | D (statement), S (proof is unconditional) | author draft + bounded review |
| Order of limits | `ex-row-target`, `ex-volume-target`, `ex-running-input` | C16 | D | draft |
| Step 1: gauge invariance, RP | `prop:ex-lattice-gauge`, `prop:ex-lattice-finite-reflection` | C01 | S | reviewed, changes requested (no error) |
| Step 1: kernel decay | `thm:ex-lattice-wire-tower-strip`, `prop:ex-lattice-wire-entrywise-bound` | C01 | S | same |
| Step 1: one-step contraction, rate | `prop:ex-lattice-flat-step`, `prop:ex-lattice-flat-rate`, `thm:ex-lattice-rg-construction` | C01/C02 | S | same; C02 review items open |
| Step 2: nearest-point projection | `lem:branch-nearest-projection` | C06 | S (+ G03 ledger L9/L10) | rev. 2, renewed review needed |
| Step 2: covariance, reassembly, projection | sections `sec:local-covariance`, `sec:gaussian-reassembly`, `sec:projection-payment-producer` | C07/C08 | S | C07 author pass; C08 review findings open |
| Step 2: cluster expansion, warnings | `sec:cluster-expansion`, `prop:warning-crowding` | C06 | S | as above |
| Step 2: transfer, splitting | `sec:local-transfer`, `sec:local-splitting` | C06 | S | as above |
| Step 3: stationary chart, log, remainder | `sec:uniform-stationary-chart`, `sec:truncated-stationary-log`, `sec:pure-action-small-field` | C09 | S | author draft; partial review |
| Step 3: vertices, determinant | `prop:ex-classical-stationary-pictures`, `sec:ex-thermal-contact-cancellation` | C10 | S | author draft |
| Step 3: one-loop coefficient | `prop:ex-annulus-estimate`; constant λ_G at `annulus-two-wave-estimates.tex:103–105` | C10 | D (constant), S (proposition) | conditional on (W),(S),(T) |
| Step 3: relation to b_0 | pilot `running-coupling.tex` lines 1–45 (b_0, slope 2b_0 in `eq:running`) | #22 | D | canonical unit, separate review |
| Step 4: path convergence, interpolation, coupled histories | `sec:background-path-convergence`, `sec:real-coupling-interpolation`, `sec:coupled-background-convergence` | C11 | S | bounded review: no correction |
| Step 4: shooting, slope s_G | `sec:surviving-interval-shooting`; `common-scale-selection.tex:60–61` | C11/C16 | D (s_G display), S | C11-to-G02-running open |
| Step 4: Wilson startup | `prop:wilson-startup-family` | C11 | S | draft |
| Step 4: schedule, funded history | `sec:common-scale-selection`, `sec:common-funded-history` | C16/C12 | S | C16-to-C12-selected-run open |
| Step 5: integration by parts | `sec:marked-campaign-producer` | C12 | S | no independent review |
| Step 5: centered bounds | `ex-centered-producers`, `ex-centered-main-bound` | C02 | S | review M1 (treasury cutoff) open |
| Step 5: full mesh, smoothness, extraction | `sec:fullmesh-correlation-cauchy`, `sec:fixed-rung-convergence`, `ex-smooth-limits`, `thm:ex-fullmesh-fixedbounds-producer`, `prop:ex-limits-extraction`, `prop:ex-limits-euclidean` | C03/C09 | S | C03 review M1 (limits.tex 303–305) open |
| Step 6: semigroup, slab bounds | `ex-euclidean-semigroup`, `sec:actual-slab-copy-bounds` | C03 | S | as above |
| Step 6: characters, mixture, pure ground | `ex-character-measure`, `ex-pure-ground`, `ex-phase-original-null`, `ex-individual-rotations`, `ex-no-new-null` | C03 | S | O(4) of the unselected table: producer not located |
| Step 7: continuation, boundary values | `prop:complex-heat`, `thm:joint-boundary`, `prop:half-support` | C04 | S | rev. 1 re-reviewed; wording points |
| Step 7: Lorentz | `input:calibrated-actions`, `prop:lorentz-label-descent`, `thm:lorentz-covariance`, `prop:full-tube-holomorphic` | C04/C14 | D (input), S | E4 field levels: no producer |
| Step 7: fields, spectrum, locality | `prop:word-motion`, `prop:boundary-detection`, `thm:field-spectrum`, `thm:spacelike-exchange` | C04 | S | as above |
| Step 8: prescription, phase transfer, matching | `prop:ope-prescription`, `sec:ope-phase-prices`, `sec:reference-match`, `prop:ope-match-assembly` | C05 | S | three review requests open |
| Step 8: quantitative OPE | `thm:ope-quantitative`, `input:ope-match`, `input:ope-raw-estimates` | C05 | D (inputs), S | conditional |
| Step 9: free detector, kernel transport | `thm:ex-lattice-all-grade-free-detector`, `sec:finite-rank-kernel-transport` | C14 | S | no independent C14 review dir |
| Step 9: reader comparisons | sections `sec:restarted-rank-history` … `sec:selected-history-limits` | C13 | S | review: changes requested |
| Step 9: stress, Ward, phases, angular | `sec:actual-stress-normalization`, `thm:ward-global-propagation`, `prop:phase-ward-inheritance`, `sec:physical-angular-actions` | C14 | S | C14-to-C16-Ward-stress open |
| Step 9: trace | `sec:trace-spectrum`, `thm:trace-asymptotic`, `input:trace-scales`, `thm:profile-exclusion` | C15 | D (input), S | input:trace-scales has no located producer |
| Open interfaces list | `known-open-edges.md` (sha256 `7707b1fc…`) and the C ledgers | all | D/S | — |

The section map in Section 2.6 was generated from the include order in
`manuscript/existence.tex` (sha256 `08e6d49a…`) and the package chapter lists.
