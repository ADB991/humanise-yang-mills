# C03 input/output ledger

Author: session `ADB991-claude-20261112-c853` (claim
https://github.com/hairer/humanise-yang-mills/issues/44#issuecomment-6827609183).
Base: `codex/existence-monograph` at `01ef22c`. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

Status words: **proved here** means a detailed proof in the C03 chapter, conditional only on the listed premises.
**input** means a stated premise produced elsewhere. **cited** means external literature.
Producer packages come from `coverage-inventory.json`. A producer entry assigns responsibility. It does
not claim delivery or a two-sided match. Every edge stays open until the producer acknowledges it and the
independent reviewer agrees.

## Outputs (theorem level)

| Output (label, chapter) | Statement in brief | Premises (edge IDs below) |
| --- | --- | --- |
| `thm:ex-fullmesh-fixedbounds-producer` (fullmesh-fixedbounds-producer) | For each finite field list, difference list and r>0: there are B and N_0 such that for all N≥N_0 and **all** periods p, \|K_{N,p;v,l}(x)\|≤B whenever a_N·sep_{N,p}(x_u,x_u')≥r for u≠u' (**periodic ℓ∞ metric, made explicit in this pass**) | `lem:ex-fullmesh-cap`, `prop:ex-fullmesh-cap-source` (proved here); I-C02-centered (paid root tests, planted inequality); I-C12-primary (primary receipt, sweep) |
| `sec:fullmesh-correlation-cauchy` (fullmesh-correlation-cauchy) | Same-history finite-volume correlations are Cauchy along the **full** cutoff sequence at every ancestral configuration of distinct points (fixed period); then locally uniform on NoHit_p | I-C13-fixed-level (fixed-level comparison, `sec:selected-history-limits`); I-C02-service (`sec:finite-menu-history-handoff`, `ex-centered-public-service`, `ex-centered-construction`); scale facts B_{m+1}^2≤2B_m^2 eventually, L_m≥3 (Lean `YM.FullVolume.Eves.price`, needs G simple) |
| `ex-smooth-grid-limit`, `ex-other-stencils` (smooth-limits) | Grid derivative bounds + dense Cauchy ⇒ smooth f with all difference quotients converging locally uniformly along the full sequence; no subsequence | none (self-contained real analysis) |
| `prop:ex-limits-extraction` (limits) | Common ordered extraction (mesh subsequence t, volume subsequence u) from local moduli and compact bounds | Definition `def:ex-limits-estimates` hypotheses (inputs) |
| **`rem:ex-limits-fullmesh` (limits, new)** | With the full-mesh inputs, stage 1 needs no extraction: t = id, J_{p,v} the full-mesh limit on NoHit_p for every eligible p; only the volume subsequence u is selected | `thm:ex-fullmesh-fixedbounds-producer`, `sec:fullmesh-correlation-cauchy`, `ex-smooth-grid-limit` |
| `prop:ex-limits-euclidean` (limits) | Permutation/translation/signed-coordinate/conjugation identities and smeared RP pass to S | lattice identities (C01 lattice chapters: input); `ex-rp-bumps` |
| `ex-rp-bumps`, `ex-cap-proof`, `ex-gns`, `ex-contraction`, `ex-euclidean-semigroup` (reflection) | Smeared ⇒ point RP; separated-power bound ⇒ cap; GNS space H_E, unit Ω_E; contraction semigroup E_s self-adjoint, strongly continuous; unitary spatial translations commuting with E_s, fixing Ω_E | hypotheses (ex-rp), (ex-cap), normalization, translation, reflection relation |
| `ex-ground-projection`, `ex-train-bound`, `ex-ground-spatial`, `ex-cluster-train`, `ex-ground-commutative` (phases) | E_t→P_0 strongly; bounded slab insertions A_d(w) from the all-copy estimate; H_0 is translation invariant; separated-cluster limit; commutative compression algebra with cyclic separating Ω | (ex-train-input) supplied by `actual-slab-copy-bounds`; O(4) covariance of the unselected table: I-C05-O4 |
| `eq:slab-allcopy-produced` (actual-slab-copy-bounds) | ‖A_d(w)‖ ≤ C_0^{\|w\|}(\|w\|/r)^{K\|w\|}, K=4(D+1), uniform in copies, width, buffer | I-C12-selected-service (`sec:selected-centered-service`), I-C02-estimates (`ex-centered-estimates`), smooth point limits of the same family |
| `ex-operator-remainder`, `ex-smooth-slabs`, `ex-norm-separable` (slab-regularity) | Norm-smooth slab operators with slot-derivative formula; norm separability of the compression algebra | (ex-all-copy-bound) from actual-slab-copy-bounds; (ex-raw-slot-identity): I-C01-slot (field-derivative identity, input) |
| `ex-character-measure`, `ex-phase-horizon`, `ex-pure-ground` (phase-selection) | Full-support representing probability on characters; barycenter identity; common countable dense words; **μ-a.e.** χ has H_{χ,0}=CΩ_χ | L1 (Gelfand), L2 (Riesz), L3 (spectral permanence/CFC) |
| `ex-phase-caps`, `ex-phase-original-null`, `ex-phase-dynamics`, `ex-phase-smeared-rp`, `ex-phase-slab-bounds` (phase-regularity) | **Every** character: smoothness, slot identity, caps, N_d⊆N_{χ,d}, Hilbert dynamics, slab bound ‖A_{χ,d}(w)‖≤‖A_d(w)‖ | preceding C03 outputs |
| `ex-replicated-positivity`, `ex-ordinary-reflection`, `ex-individual-rotations` (reflection-transport) | Ordinary reflection fixes M; O(4) invariance of M; hence O(4) covariance, ordinary conjugation and RP about every axis in **every** character | I-C12-grid (bounded real approximations: `thm:ex-public-grill` + C12 pair receipts); label convention J = R_ρ∘conj with conj commuting with signed actions (made explicit in this pass; Lean `YM.Register.adj`, `YM.Register.star_mirror`) |
| `ex-character-moments`, `ex-no-new-null` (phase-fields) | Moment bounds hold at every character; finite detectors give N_χ=N in every grade and **every** character | I-C14-span (`sec:actual-rank-purchases`, `sec:finite-rank-kernel-transport`); I-C14-moments (`sec:actual-phase-detector-moments`); I-C14-free (`thm:ex-lattice-all-grade-free-detector`) |
| `lem:ex-public-frame-recovery`, `lem:ex-public-origin-sum`, `prop:ex-public-origin`, `lem:ex-public-replace-word`, `lem:ex-public-radial-choice`, `thm:ex-public-grill` (phase-quantitative-producer §1) | Conditional finite assembly of the real comparison grid | upstream selected-history receipts (listed in `rem:ex-public-layout-receipt` and the "Selected-route boundary" remark): I-C12-grid |
| `lem:ex-selected-cone-step`, `prop:ex-selected-interpolation` (§2) | One-scale linear interpolation of purchased columns | purchase clauses: forced clause from C08 `sec:projection-payment-producer`; regular and primary clauses **open** (as the chapter states) |
| `lem:ex-holomorphic-insertion`, `lem:ex-uniform-confluence-vault` (§3) | Same-run Cauchy implication | as for `sec:fullmesh-correlation-cauchy` (duplicate treatment, see findings F4) |

## Incoming edges

| Edge ID | Producer → C03 consumer | Exact statement needed | Common objects | Status |
| --- | --- | --- | --- | --- |
| I-C02-centered | C02 (`centered-construction.tex`, `centered-estimates.tex`, `centered-public-service.tex`, `finite-menu-history-handoff.tex`) → fullmesh-correlation-cauchy, fullmesh-fixedbounds-producer, actual-slab-copy-bounds, phase-quantitative-producer | cover estimate B_j\|I\|≤64 cov; normalized density estimate (`eq:fullmesh-root-bound`); planted product inequality; one-field coarse root bounds | same selected history, same terminal Wilson law and Z_{N,p} | input |
| I-C12-selected-service | C12 (`selected-centered-service.tex`) → actual-slab-copy-bounds | price J a_k^{-P} for all labels of grade ≤D, norm ≤R, with all signed transforms/adjoints, chamber interiority and stencil fit (`eq:slab-one-price`) | expanding order: mesh then period; same hierarchy | input |
| I-C12-primary | C12 → fullmesh-fixedbounds-producer | primary paid trial, detector rank bound Z, sweep for projected-zero rows | same family; uniform over periods | input |
| I-C12-grid | C12 (`actual-phase-grid-approximants.tex`) → reflection-transport via `thm:ex-public-grill` | the four separated pair receipts and local real approximants with errors δ(k)→0 independent of the number/offsets of copies | same fused late filter, same history | input |
| I-C13-fixed-level | C13 (`selected-history-limits.tex`) → fullmesh-correlation-cauchy | uniform Cauchy convergence in U of Φ_{N,m,i}, ω_{N,m,i}(Q,·) and vacuum/activity data at fixed level m | same history; same masks for large N | input |
| I-C06-local-transfer | C06 (`local-transfer.tex`) → phase-quantitative-producer §2 | referenced only to say it does **not** supply the primary/regular purchase clauses | — | no premise taken |
| I-C08-forced | C08 (`projection-payment-producer.tex`) → phase-quantitative-producer §2 | forced clause of the one-column purchase once the forced allowance is ≤1 | same marked coefficient | input |
| I-C14-span, I-C14-moments, I-C14-free | C14 → phase-fields | eventual spanning of corrected labels in the unselected quotient; moment bounds of D_a, D_b, D_{ab}; injective free comparison tests | same corrected lifts, same separated correlations, same quotient N_d | input |
| I-C05-O4 | owner to be identified (G06) → phases (`ex-ground-spatial`, `ex-ground-commutative`) | full O(4) covariance of the **unselected** table with a label action on quotient classes | same quotient, same R | input; producer not located in this pass |
| I-C01-slot | owner to be identified (C01 lattice/field chapters or C14) → slab-regularity | exact slot identity (ex-raw-slot-identity) for the smooth table with arbitrary exterior insertions | same raw representatives δ_j v | input; producer not located in this pass |
| L1 | Williams, *Lecture notes on C\*-algebras*, Thm 2.13 | commutative Gelfand theorem | — | cited; numbering vs C04's use of Thm 2.19 for CFC is a G03 item (not re-inspected) |
| L2 | Sawyer, Ch. 6, Thm 32 | Riesz representation on compact metrizable space | — | cited (not re-inspected) |
| L3 | Williams, Thms 2.17, 2.19 | spectral permanence; continuous functional calculus | — | cited (not re-inspected) |

## Outgoing edges (C03 as producer)

Acknowledgement of the edges named in `results/C04/ledger.md`:

| Edge ID | C03 output | Acknowledgement |
| --- | --- | --- |
| E1 C03-to-C04-euclidean-semigroup | `ex-euclidean-semigroup` applied to the selected S_χ via `ex-phase-dynamics` | **matches**: strongly continuous semigroup of self-adjoint contractions, E_0=I, E_sΩ=Ω, on the phase GNS space built from positive words |
| E2 C03-to-C04-spatial-translations | same theorem | **matches**: strongly continuous unitary U(y), commuting with E_s, fixing Ω |
| E3 C03-to-C04-slab | `eq:slab-allcopy-produced` and `ex-phase-slab-bounds`; laws `ex-slab-laws` | **matches** with a_v=K=4(D+1) for a single insertion: ‖A_p(v)‖≤C_0 p^{-K} for buffer p≤1. The identities A_{d+r}(w)=A_d(w)E_r and A_{r+d}(τ_r w)=E_rA_d(w) give the padding law. The constants depend on the grade and norm bound of the label, not uniform over labels, as C04 states |
| E4 C03-to-C04-levels | **not produced in C03.** No C03 chapter defines finite field levels E_d, inclusions or the direct limit. C03 works at one fixed grade at a time (`ex-phase-original-null`, `ex-no-new-null`). The levels and inclusions appear in C04's own `input:calibrated-actions` (label-descent.tex), supplied by C14 | **misattributed**; C04 ledger should re-point E4 to C14 (`physical-angular-actions.tex`) or to the field-construction chapters. Recorded for G06 |
| E5 C03-to-C04-euclidean-axioms | `ex-phase-caps` (multilinear, permutation symmetric, smooth), `ex-individual-rotations` (O(4) in every character), `ex-phase-dynamics` (reflection relation, translation) | **matches**, conditional on I-C12-grid (O(4)) and I-C05-O4 |
| C03-to-C04-reflection-J | `reflection.tex` θ; reflected conjugate J v = R_ρ v̄ (now explicit in reflection-transport) | **matches** the C04 description J = θκ (Lean `YM.Register.adj d a = mirror(a) ∘ bar`) |
| C03-to-C04-unique-heat | `ex-pure-ground` | holds for **μ-almost every** character, not every one. The selected phase must be chosen in that full-measure set. Choice order: the measure μ and the full-measure set depend only on the unselected table and the countable word family of `ex-phase-horizon` |
| C03-C04-to-C05-phases | `ex-cluster-train` → C05 `ope-phase-prices.tex` | open (C05 to acknowledge) |
| C03-to-C14-* | `ex-character-moments`, `ex-no-new-null`, `ex-phases`, `ex-cluster-train` → C14 detector moments; `ex-pure-ground`, `ex-phase-*` → C14 `phase-ward-inheritance.tex` | open (C14 to acknowledge) |
| C03-to-C12-* | `ex-smooth-limits`, `sec:ex-fullmesh-fixedbounds`, `sec:fullmesh-correlation-cauchy` → C12 `selected-centered-service.tex`; `thm:ex-public-grill` and lemmas → C12 `actual-phase-grid-approximants.tex` | open; note the cycle check: C12 consumes C03's assembly lemmas and C03's reflection-transport consumes C12's receipts. These are opposite edges at different theorem levels, not a premise cycle, provided C12's pair receipts do not use `ex-individual-rotations` (not checked here; G06) |
| C03-to-C09-* | `prop:ex-selected-interpolation`, `eq:ex-interpolation-buy` → C09 `heading-history-handoff.tex`; `ex-public-same-run-cauchy` → C09 `fixed-rung-convergence.tex` | open |
| C03-to-C16 | `ex-reflection` → C16 `assembly.tex` | open |
