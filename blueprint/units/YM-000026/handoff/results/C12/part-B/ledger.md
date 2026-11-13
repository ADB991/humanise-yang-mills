# C12 part-B input/output ledger

Status words: **proved here** (detailed proof in the chapter, conditional on listed premises); **input** (premise produced elsewhere); **open** (not acknowledged by the other endpoint). Producer packages from `coverage-inventory.json`. No edge is closed.

## Outputs

| Output | Statement and quantifiers | Premises | Common objects | Status |
| --- | --- | --- | --- | --- |
| `thm:ex-marked-portfolio-section` (marked-portfolio-calibration) | For each degree d and each imprint (A_d,B_d) on the label space: ∃ centered stencil S_d, section T_d, regrading R_d=A_d with items (1)–(6); for all k,P ∃ C_{d,k,P} (no uniformity in d,k,P) | E-imprint; E-slot | holomorphic action H, frame at degree d, slot filtration `Powered`, stamp order (s,r) | proved here |
| Stage/delay purchases (same chapter, prose) | ∃ table a_{di} ≥ 0, thresholds n_i: for d ≤ i, L ≥ n_i flight, credit, door clauses; ∃ monotone entrance delay dominating a given one with adjacent-stage clauses | `thm:ex-marked-portfolio-section` item (5) | profile sheet, block sides, `puffs=L^{1/8}`, `rate=L^{-2/5}`, `barunit=L^{-3/8}` | proved here |
| Budget triple at the caller (prose, `eq:ex-marked-height-jump`) | For fixed d, eventually in N: credit at profile J(N); 0 ≤ b_N ≤ β̂_N; flight at L_{N−1} | purchases above; E-run | the run's delay, schedule, `J`, block sides | proved here given E-run |
| `lem:ex-marked-calibration-inverse` | Columns within (2𝒪²)^{-1} ⇒ repainting map invertible, inverse norm ≤ 2 | none | frame, motion list, ℓ¹ norm | proved here |
| `prop:ex-marked-solaris` (new) | Eventually in N, ∀p: columns u_j with ‖e_j−u_j‖ ≤ δ_d; root tests ≤ cider·E_N·e^{−γσ_N} ∀k∈[ref d,N), m opened at k, motions; E_N slow | `prop:ex-marked-invitation`, `prop:actual-marked-figment`, `lem:ex-marked-sanded`, budget triple, E-record, E-keeper, E-local-forced-attachment (eventually in N, uniformly in p); E-served for the root-test conclusion (via the figment) | same family C, sections V_d and T_d, same history | proved here |
| `prop:terminal-marked-voice` (new) | Linear v ↦ marked coefficient; format, weighted majorant ≤ √w‖core v‖, density (T5), forced profile = hook of f_v, motion covariance; fee holds at admitted levels for d ≤ J(N) | E-keeper; E-fee; lawful terminal representation | terminal representation R_{N,p,N}, local section, footprint, threshold | proved here |
| `lem:ex-marked-sanded`, `eq:ex-marked-cover` | Eventually in N: √f_N·Storm ≤ 1; \|regional(X,0)\|f_N ≤ 1; cover ≤ 81 | β_N→∞, θ_N^{-1} ≤ β_N, B_N→∞ | forced allowance `stain(β̂_N)` | proved here |
| `prop:ex-marked-invitation` | For each basis vector: coefficient with x=e_j, format, remBound(√w, t_N), charge ≤ Q_N, attainment, hook, density, continuity | inputs 1–5 of the chapter, input 5 being the local forced-family attachment (open edge E-local-forced-attachment); E-keeper. `prop:terminal-marked-voice` gives the terminal-voice data but does not supply the general correction case of input 5 | family C, level N, period p, sections V and T, region D | proved here |
| `lem:actual-marked-antilles` | For r ≤ l ≤ m ≤ N: keyed states with terminal identities, bill bound, cone clause, new item (4) | Music heard/responds; Coupon and Carol at doors l ≤ i < m; room, bank | one history, one Music, one door field | proved here |
| `prop:actual-marked-figment` | ref(d) < N, record (R1)–(R7), Cream ⇒ ∃v: puffs·‖Z.x−X_N^{-1}v‖ ≤ 2(1+C_N)Q and root tests ∀k,m,motion | `lem:actual-marked-antilles`; E-record; E-opened-copy; E-marked-estimate | same C, history, Music, doors; centered tiling at depth m, origin | conditional: proved here given E-record and the open step E-served (second round) |
| `lem:actual-grid-basis` and the origin approximations (actual-phase-grid-approximants) | For N > k: b_s with ‖e_s−I_kb_s‖ ≤ 1/4 and root test ≤ S_{J,m}/w; then bounded real approximants for star-real labels of grade ≤ D at one coarse depth J | `lem:actual-marked-antilles`; E-record; E-opened-copy; E-marked-estimate; E-grid-lemmas | same family, extraction order, law μ_{N,p} | proved here, modulo inputs |
| Whole-word pair receipts (same chapter) | Four pair receipts with error ε_q·const, order: accuracy, pair, separation, late limit | origin approximations; E-centered-bound; E-grid-lemmas | same extraction order and J-grid | proved here, modulo inputs |

## Incoming edges

| Edge ID | Producer → consumer | Exact statement needed | Common objects | Status |
| --- | --- | --- | --- | --- |
| E-imprint = `C12-to-C12-imprint` | part-A `marked-campaign-producer.tex` (`thm:marked-campaign-producer`, `cor:marked-campaign-actual`) → `thm:ex-marked-portfolio-section` | Imprint at each degree: unit, gauge invariance, Forms, Micro on the equation ideal, stamp and `Powered` clauses, both equivariances | same H, same label space and grading | input; label opened, statement not re-audited |
| E-slot = `C06-to-C12-slot-estimate` | C06 `local-sections.tex`, "Threshold prices at every period" → item (5) | On configurations healthy on the translated stencil, each slot and its tested derivatives through order k are ≤ Cθ, uniformly in torus and anchor | same health notion, direction bound θ(1+dist)^P | input; passage opened and matches |
| E-run = `C16-to-C12-selected-run` | C16 `public-run-binding.tex` / part-A → caller paragraph, `prop:ex-marked-solaris` | (a) the run's portfolio sections and regradings are the pre-schedule ones; (b) `paper` thresholds ≤ floor lengths; (c) `dusk` for the run's delay; (d) d+3 ≤ J(t_d) | literal R, T, W of the run; block sides; delay | open; (b) and (c) not found stated in any chapter |
| E-record = `C12-to-C12-paid-record` | part-A `selected-centered-service.tex` (with C02 `centered-freight-producer`, `centered-geyser-scale-estimates`; C09 `heading-history-handoff`) → figment, solaris, phase grid | Items (R1)–(R7) of `actual-marked-portfolio-calibration.tex`, for one family and one door field, all d, N ≥ ref(d), p | same family, history, doors; ζ_{d,i}=β̂_i^{-(deg F_d+4)}, φ_i=β̂_{i+1}^{-1} | open; assumed in the text (second round: no longer described as produced); producer text gives the same prices, item-by-item match not done; the checker notes the adjacent three-identity formula is not the terminal hook identity |
| E-keeper = `C12-to-C12-reserved-addresses` | part-A (history selection) / C11 `wilson-startup-construction.tex` → `prop:terminal-marked-voice` hyp. (2), `prop:ex-marked-invitation` input 3 | Terminal representation at every (N,p) has the reserved addresses | terminal dictionary of the same history | open; stated as an input in the text (second round); no chapter found that states it as a result; `wilson-startup-construction.tex` gives only dictionary packing |
| E-fee = `C12-to-C12-fee-delay` | part-A `common-observable-purchases.tex`, C16 `common-scale-selection.tex` → `prop:terminal-marked-voice` final clause | Entrance delays include the fee thresholds, so that k(J(m+1)) ≤ β̂_m | same schedule | open; stated as an undischarged schedule condition (second round); not mentioned in the producer chapter |
| E-opened-copy = `C02-to-C12-opened-copy` | C02 `centered-geometry-producer.tex`, `lem:ex-centered-opened-copy` → figment, grid basis | Opened-copy assignment: injective, migrating, separation ≥ B_j² for levels ≥ k | same opening schedule, radii B_j | input; statement opened and matches use |
| E-marked-estimate = `C02-to-C12-marked-estimate` | C02 `centered-construction.tex`, `\eqref{ex-centered-sail}` → figment, grid basis | Finite-census marked estimate with prices (x,y,f)=(2,1,1) from a served representation | same law, census, treasury | input; the served representation from the Yeast record is not proved in C12 |
| E-centered-bound = `C02-to-C12-centered-bound` | C02 `centered-construction.tex`, `ex-centered-main-bound`; C03 reflection structure → phase grid A_v | Centered power bound for one field at fine depth, chamber interiority, late in the extraction order | same family and order | input |
| E-grid-lemmas = `C03-to-C12-grid-lemmas` | C03 `phase-quantitative-producer.tex`: `lem:ex-public-frame-recovery`, `lem:ex-public-replace-word`, `lem:ex-public-radial-choice`, `thm:ex-public-grill` → phase grid | As stated there | — | input; statements opened, formulas agree |
| E-local-forced-attachment = `C12-to-C12-local-forced-attachment` (issue #191) | candidate `YM.MergeProof.garnish` (`Lean/YM/MergeProof/Platter.lean`); no manuscript producer identified → `prop:ex-marked-invitation` input 5, `prop:ex-marked-solaris` | For the actual correction b_0 on the terminal representation: a forced family with gauge invariance, measurability, locality, vanishing on health, uniform bound, gas-mark identity, hook and merge price, on the same support | same terminal representation, support, history | open; stated as an input in the text; Keeper/berths, `Attaches`, finite-index and price matching not checked |
| `C09-to-C12-three-card` | C09 `heading-history-handoff.tex`, `sec:three-port-history` → (R7) | Coupon from Heading/Stampede | same history | input (part of E-record) |

## Outgoing edges

| Edge ID | Output → consumer | Status |
| --- | --- | --- |
| `C12-to-C14-calibration` | `prop:ex-marked-solaris`, `lem:ex-marked-calibration-inverse` → `actual-equation-kernel-relay.tex` | open; consumer cites the sections and the lemma, should cite the new proposition |
| `C12-to-C14-antilles` | `lem:actual-marked-antilles` (item 4) → `actual-insertion-derivative-relay.tex` | open; consumer's "cone part" is now a stated item |
| `C12-to-C03-grid-inputs` | origin approximations and pair receipts → `thm:ex-public-grill`, `actual-phase-detector-moments.tex` (C14) | open; conditional on all inputs above |
| E-served = `C12-to-C12-served-residual` (second round) | no producer identified (source: `MergeProof.baker`, `Accent.sentry`, `Accent.embracing`) → `prop:actual-marked-figment`, `lem:actual-grid-basis`, `prop:ex-marked-solaris` item (2) | From the Yeast records and (R2)–(R5): a served representation of the pushed birth polynomial at the opened scale, support exponent α_k, action allowance 1 | same history, doors, census | open; declared unproved in the three statements |
| `C12-to-C12-terminal-voice` | `prop:terminal-marked-voice` → part-A `selected-centered-service.tex`, `original-history-portfolio-attachment.tex` | open |
| `C06-C08-C12-C16-to-C05-matched-field` (known edge) | marked profile part: `prop:terminal-marked-voice` item (4), figment | open; not examined against C05 |
| `C12-to-C13-local-course` (known edge) | not touched by part-B | — |

## Source-leakage revision, issue #191

The one-body proposition now assumes explicitly the local forced-family attachment for its correction and carries this assumption into `prop:ex-marked-solaris`. Call the open edge E-local-forced-attachment: the required family has the stated locality, gas-mark identity, hook and merge-price bound on the same terminal representation and support. `YM.MergeProof.garnish` in `Lean/YM/MergeProof/Platter.lean` is the candidate producer; its Keeper/berths, `Attaches`, finite-index and price-budget matching have not been fully checked in this pass. For the selected budget, `B_N = ⌈(log β_N)^2⌉` and `β_N → ∞` give `B_N → ∞`; an arbitrary budget still needs its own radius divergence. E-record, E-keeper, E-fee and E-served remain open. See `../source-leakage-191.md`; no review status is conferred.

The independent review of candidate `4c14471` identified two necessary corrections: the multi-marker output prices require one configuration-independent coefficientwise majorant per mode, and the terminal estimate in `prop:ex-original-history-attachment` must retain the local forced-family and served-representation conditions on the same family. The subsequent author revision incorporates both; the paid-history and served-residual obligations remain open and no review approval is implied. The selected-budget radius limit is now derived from its explicit radius formula, rather than carried as an extra open condition for that budget.

### Response to review #232 (M1, S1)

Session `hairer-claude-20261113-c12m1s1`.
- **M1.** The invitation row now lists input 5 and the open edge
  E-local-forced-attachment. It no longer attributes the attachment to
  `prop:terminal-marked-voice`. The Solaris row names the same edge
  (eventually in N, uniformly in p) and keeps E-served for its root-test
  conclusion. The edge is added to the incoming-edges table as open.
- **S1.** The (R4) interface in `actual-marked-portfolio-calibration.tex`
  now states that the lower marker positions are
  `b_v = parent(o_v)`, as in `YM.MergeProof.Menu.Volant.reserves`
  (`Canopy S D (S.ratio.parent ∘ o) …`). The occupancy clause already
  refers to parents.
