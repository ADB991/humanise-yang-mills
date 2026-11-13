# C14 review, part 1 (free reference chapters): Lean correspondence

- Package C14, issue #55, session `schmittj-claude-c14-review-20261113`, reviewer 1 of 4 (Claude agent, submitted under `schmittj`; no human acceptance recorded).
- Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`), read in `/home/jo314/ym-wt/c14-review/Lean/`. No Lean build, no axiom check.
- Scope: the seven chapters `trace-free-rank`, `free-maxwell-ward-flux`, `free-maxwell-radial-flux`, `all-grade-free-detectors`, `free-internal-ward-erasure`, `free-collision-pole-separation`, `finite-rank-kernel-transport`. The chapters contain no Lean names; correspondence claims are in `blueprint/units/YM-000026/<chapter>-evidence.md` and in the C14 records (`ledger.md`, `correspondence.md`, `findings.md`). PR #98 changed none of these chapters, so there are no PR repairs to verify in this part. I did not rely on the earlier same-family reviews.
- Outcome: every declaration I opened exists at the stated path and its type matches the manuscript statement it is attached to, up to the differences listed below. No mismatch rises to ERROR or GAP.

## Findings (ordered by severity)

### L1. `trace-free-rank.tex` lines 292–318 versus `YM.Further.PhysicalPeriodLimitF933.free_closure` / `free_rank` / `tested_div` — INACCURACY (manuscript; pre-existing)

`free_rank (hV : V.Derivatives (Bel L)) (hG : G.Simple) (hw : V.Orientation H.spin) : Surjective (currentDiv V H.spin hw) ∧ Module.finrank ℝ (LinearMap.ker (currentDiv V H.spin hw)) = 1` (`Lean/YM/Further/PHYSICAL_PERIOD_LIMIT_F933/FreeRanks.lean`). The divergence is the derivative plan `V`, and the link between the divergence of a label and the $x$-derivative of the point response is `tested_div`, which needs `hV`. The manuscript's Proposition \ref{prop:ex-trace-free-closure-rank} states the conclusion without this hypothesis and never defines its divergence through a derivative plan (same as mathematics finding F1). The main steps otherwise follow the source: the source proves $\dim\mathcal V_5\ge2$ by injectivity of $w\mapsto(\operatorname{skim},\operatorname{closure}(w),w_3)$, the manuscript by independence of $\phi_1\circ D_0,\phi_2\circ D_0$; both rest on `divergence_tests` and `div_kernel`, and the two routes are equivalent. Requested change: as in F1, state the derivative-compatibility hypothesis on the divergence.

### L2. `free-maxwell-ward-flux.tex` lines 289–298 versus `YM.Pert.same_translation` / `YM.Pert.kappa_eq` — INACCURACY (manuscript; pre-existing)

`same_translation … (hn : leaves D.deriv 4 ≠ 0) (hA : StressLaws S L (d0 • D.deriv) A) (hB : StressLaws S L (d1 • D.deriv) B) : d0 = d1` (`Lean/YM/Pert/Lifted.lean`). The proof uses `S.field_ext h.laws.toSymmetric` (faithfulness) and requires the hierarchy `h`. `kappa_eq` adds `hM : M.T.W = scheme`, `hJ : M.T.J = torch … 1` and supplies `hn` from `M.lit.born`. The manuscript's uniqueness paragraph matches this structure, but says the nonvanishing of the derivative plan in grade four is "detected by the nonzero divergence probes", whereas the source takes it from the record (`born`). Mathematically the manuscript's justification is valid given derivative compatibility (L1). Requested change: state "faithfulness" and the nonvanishing of the grade-four derivative plan as named facts (mathematics F3).

### L3. `free-collision-pole-separation.tex` lines 13–23 versus `YM.Maxwell.Free.Clears` / `Pole` — NIT (correspondence; pre-existing)

`Clears s f := ∃ g, ContDiff ℝ ω g ∧ ∀ x ∈ away, rad s x • f x = g x` and `Pole` require analytic ($C^\omega$) numerators (`Lean/YM/Next/MAXWELL/Pole.lean`). The manuscript uses smooth extensions. The manuscript's descent (Laplacian of a smooth extension is smooth) and limit argument are valid for smooth extensions, so its lemmas are slightly more general than the source's; the covariance kernels to which they are applied have polynomial numerators, so both hypotheses hold. The evidence file already says the prose "only uses smoothness". No change required.

### L4. `all-grade-free-detectors.tex` lines 190–199 versus `YM.Extra.FD.replyTest` — NIT (manuscript; pre-existing)

`replyTest (P : Sol G.Color j) (Q : Sol G.Color l) (hx : x ∈ away) : legKernel (dualSol … P) (dualSol … Q) x = (-1)^l * dotF Q.val (WaveOn.nth (reply P) l x)` (`CurlDetect.lean`). This is exactly the manuscript's formula with sign $(-1)^k$ from the second slot. As explained in mathematics F5, it is correct for the orientation "second probe at first point minus $x$", which the manuscript does not state.

### L5. `free-maxwell-radial-flux.tex` — matched; note on the consumer

`YM.Maxwell.Free.radial_flux` (`Lean/YM/Next/MAXWELL/Affine.lean`): `singleFlux (fromCenter 1 x) χ (pulse p x) f = -((j:ℝ)+2) * sample p f x` under `WaveOn U f`, `tsupport χ ⊆ U`, `χ = 1` near `x`, which is \eqref{eq:maxwell-radial-single-charge}. `radial_motion` (`Taxes.lean`) packages it with `centers_collide` (the $e=1$ two-pulse vanishing) into a `Motion` with engine `metric G = fun j => ((j:ℝ)+2) • id` (`Derives.lean`), i.e. the weighted Euler derivation; `moment_force` then gives \eqref{eq:maxwell-radial-polynomial-ward}. `Killing` (`Current.lean`) requires only conformal-Killing conditions (equal diagonal derivatives, skew off-diagonal), which is why dilation is admitted, as the manuscript explains.

### L6. `blueprint/units/YM-000026/all-grade-free-detectors-evidence.md`, crosswalk row "Maxwell/Bianchi shell quotient" — NIT (records; pre-existing)

The evidence file names `YM.Euclid.Comparator.shellSector` and `.snap`. `Lean/YM/Euclid/Comparator.lean` opens `namespace YM.Maxwell` (line 14, closed at line 141) with no nested namespace, so the fully qualified name is `YM.Maxwell.shellSector` (the path is right). Requested change: correct the qualified names in the evidence (or in the C14 correspondence carry), as required by AGENTS.md ("Cite fully qualified declarations").

## Ledger and cross-package edges in this part

- Ledger line 13 (free detection) and line 14 (free Ward and classification): outputs as stated by the manuscript; "finite detection on each specified space must not be replaced by injectivity of arbitrary row tests" is respected (the scanner and erasure use strict reflection positivity on the same grade).
- Ledger line 16 (`finite-rank-kernel-transport`): the inputs listed (one ordered extraction, same projections and calibrated maps, subpower bounds, centered spectator estimate) are exactly the explicit inputs of the chapter; the chapter supplies `eq:finite-rank-exact-kernel` and `eq:finite-rank-silent` to `ope-filtration.tex` (C05), which consumes the subpower form; the chapter's local equation input is stated for subpower families (lines 84–92), so the consumed form is the produced one.
- `thm:free-circulation-null` is consumed by `physical-ward-free-classification.tex` lines 178–195 with hypotheses $\ell<L$, $L+\ell+4\le D_*$; these are exactly `cluster_clear`'s `hk : l<k`, `hd : k+l+4 ≤ d`. The additional inequality $\ell<s+1$ needed for weight lowering is checked by the consumer, as the collision evidence file requires.
- `thm:free-internal-erasure` is consumed by `physical-ward-propagation.tex` line 616 "at the stated covariance, reality, unit and filtration hypotheses"; these are the fields of `YM.Org.Winds`.
- `prop:maxwell-radial-ward` is consumed by `physical-ward-free-classification.tex` lines 398–410 in the form stated.

## Per-chapter table

| Chapter | Correspondence checked | Verdict |
| --- | --- | --- |
| `trace-free-rank.tex` | `signal_formula`, `vacuum_tests`, `divergence_tests` (exact rows, factor `lieDim·normal²`), `div_kernel` (uses only the two $(ii',ii')$ rows with $w_0=0$), `free_stress_inj`/`free_stress_bij`, `dim_four`, `dim_free_five` (raw bound 3 plus nonzero `eom` killed by the quotient), `free_closure`/`free_rank`, `skim` (one-point real average of the $00$ entry), `weyl = ![0,1,-1/4,1]`, `hbase`/`dhbase` (same delta formulas). | Matched; L1. |
| `free-maxwell-ward-flux.tex` | `cross` (= polarized $T_{ab}$ with $\tfrac12\delta_{ab}$), `Killing`, `Motion` (fields `symm`, `collide`, `flux`), `straight_motion`, `rotational_motion` (rotation about the enclosed point), `moment_force` (= \eqref{eq:maxwell-polynomial-ward}), `polStress` (= $J^0$), `beacon_signal` (common coefficient $-c$ for translation and rotation), `same_translation`, `kappa_eq`, `common_stress`. | Matched; L2. |
| `free-maxwell-radial-flux.tex` | `radial_flux`, `radial_motion`, `metric`, `centers_collide`. | Matched. |
| `all-grade-free-detectors.tex` | `strength` (= $4(j+1)(j+2)(-2)^j\,\mathrm{normal}$), `strength_sign`, `replyTest`, `scan` (reflection `solO (face x)` on the second slot), `towerB`, `newLeg`, `newLeg_below`, `newLeg_diag`, `shiftAll`, `shiftAll_gram`, `towerB_pos`, `reflected_positive` (on `WickPol G`, i.e. polynomials in on-shell coordinates), `faceTest`/`faceTest_eq` (reflection at $x-y$ plus coefficient conjugation), `scanner_inj`, `shellSector` (range of `observable`). | Matched; L4. |
| `free-internal-ward-erasure.tex` | `YM.Org.Two`, `Winds` (det-one signed covariance, reality, unit, alternation, preservation of each lower-grade image), `erases` (all arities, separated configurations, all words, `∃ n, ∀ d ≥ n`), `YM.Maxwell.Free.erasing` (threshold `4`, `G.Simple`), `silence`. | Matched (manuscript threshold $d\ge4$ = source `n = 4`). |
| `free-collision-pole-separation.tex` | `Clears`, `Pole`, `clears_faint` (hypotheses `2 ≤ r`, `Clears (r-2) f`), `Deep.clear`, `ghost` (null at capacity: spectators in `shellSector G d`, any number, separated), `cluster_clear` (`P ∈ shelf G j`, `l<k`, `k+l+4 ≤ d`, `z ≠ 0`; `M = 8+k+l+2j+1`, `R = 4+k+j`). | Matched; L3. |
| `finite-rank-kernel-transport.tex` | `YM.Push.Mark.potage` (uniform bound, symmetry only when `Active`), `YM.Next.Rank.Detect.reconciled` (`‖A-T‖<1` gives equal kernel dimensions), `demanded`, `stocked` (monitor = `ker trueP`, quotient dimension = free dimension, eventual spanning), `YM.Push.Mark.drumroll`, `YM.Push.Mark.thrush` (signatures only). | Matched. |

## Declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.StressFlux.signal`, `signal_formula`, `signal_grad` | `Lean/YM/Push/STRESS_FLUX/FreeTests.lean` | yes |
| `YM.StressFlux.vacuum_tests`, `divergence_tests`, `div_kernel`, `factor_ne` | same | yes |
| `YM.StressFlux.free_stress_inj`, `free_stress_bij`, `labelStress_onto` | same | yes |
| `YM.StressFlux.hbase`, `dhbase`, `bare_eq`, `chains_D` (private) | same | yes |
| `YM.StressFlux.dim_four`, `equation_killed`, `dim_free_five`, `vectorProjection_onto` | `Lean/YM/Push/STRESS_FLUX/Lift.lean` | yes |
| `YM.StressFlux.eom`, `eom_nonzero` (statement), `stress`, `weyl` | `Lean/YM/Push/STRESS_FLUX/Polynomial.lean` | yes |
| `YM.StressFlux.finrank_two`, `finrank_one` (statements) | `Lean/YM/Push/STRESS_FLUX/Counts.lean` | yes (bounds 4 and 3) |
| `YM.StressFlux.Line.skim`, `Line.closureMap` | `Lean/YM/Push/STRESS_FLUX/Line.lean` | yes |
| `YM.Further.PhysicalPeriodLimitF933.free_closure`, `free_rank`, `tested_div`, `skim_formula`, `from_skim` | `Lean/YM/Further/PHYSICAL_PERIOD_LIMIT_F933/FreeRanks.lean` | yes, with L1 |
| `YM.Maxwell.Free.cross`, `Killing` | `Lean/YM/Next/MAXWELL/Current.lean` | yes |
| `YM.Maxwell.Free.Motion`, `straight_motion`, `rotational_motion`, `radial_motion`, `centers_collide` (private), `stressRead`, `moment_force` | `Lean/YM/Next/MAXWELL/Taxes.lean` | yes |
| `YM.Maxwell.Free.bookend` | `Lean/YM/Next/MAXWELL/Double.lean` | yes |
| `YM.Maxwell.Free.polStress` | `Lean/YM/Next/MAXWELL/Stress.lean` | yes |
| `YM.Maxwell.Free.radial_flux` | `Lean/YM/Next/MAXWELL/Affine.lean` | yes |
| `YM.Maxwell.Free.metric` | `Lean/YM/Next/MAXWELL/Derives.lean` | yes |
| `YM.Maxwell.Free.upper_charge`, `beacon_signal` (statement) | `Lean/YM/Next/MAXWELL/Beacon.lean` | yes |
| `YM.Pert.address_flat`, `address_panel`, `common_stress`, `same_translation`, `kappa_eq` | `Lean/YM/Pert/Lifted.lean` | yes, with L2 |
| `YM.Extra.FD.strength`, `strength_sign` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Kelvin.lean` | yes |
| `YM.Extra.FD.replyTest` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/CurlDetect.lean` | yes, with L4 |
| `YM.Extra.FD.scan`, `towerB`, `newLeg`, `newLeg_below`, `newLeg_diag`, `shiftAll`, `shiftAll_gram`, `towerB_pos` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/PositiveLeg.lean` | yes |
| `YM.Extra.FD.reflected_positive` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/WickPositive.lean` | yes |
| `YM.Extra.FD.readsTwo`, `faceTest`, `faceTest_eq`, `scanner_inj` | `Lean/YM/Extra/FREE_DETECTOR_ALGEBRA/Columns.lean` | yes |
| `YM.Maxwell.shellSector` (the evidence file calls it `YM.Euclid.Comparator.shellSector`, see L6) | `Lean/YM/Euclid/Comparator.lean` | yes |
| `YM.Maxwell.observable`, `equationIdeal` | `Lean/YM/Maxwell/Equation.lean` | yes |
| `YM.Org.orients`, `Two`, `Winds`, `erases`, `MaxwellData` (field `frames`) | `Lean/YM/Org/Input.lean` | yes |
| `YM.Maxwell.Free.erasing` (statement and first lines of proof) | `Lean/YM/Next/MAXWELL/AwayTeam.lean` | yes |
| `YM.Maxwell.Free.silence`, `ghost` | `Lean/YM/Next/MAXWELL/Statistic.lean` | yes |
| `YM.Maxwell.Free.Clears`, `Pole` | `Lean/YM/Next/MAXWELL/Pole.lean` | yes, with L3 |
| `YM.Maxwell.Free.clears_faint` | `Lean/YM/Next/MAXWELL/Faint.lean` | yes |
| `YM.Maxwell.Free.Deep.clear` | `Lean/YM/Next/MAXWELL/Silt.lean` | yes |
| `YM.Maxwell.Free.cluster_clear` | `Lean/YM/Next/MAXWELL/Rumbles.lean` | yes |
| `YM.Push.Mark.potage` | `Lean/YM/MergeProof/Potage.lean` | yes |
| `YM.Next.Rank.Detect.reconciled`, `demanded`, `stocked` | `Lean/YM/Next/RANK/Monitors.lean` | yes |
| `YM.Push.Mark.drumroll`, `thrush` (statements) | `Lean/YM/MergeProof/Thrush.lean` | yes |

## Not checked

- Proof bodies were read only where needed (FreeTests, FreeRanks, the `Motion` lemmas, `same_translation`/`kappa_eq`, `potage` head, `reconciled`, `cluster_clear` head). I did not open the proofs of `towerB_pos`'s helper lemmas, `reflected_positive`'s `upright`/`script_pos`, `erasing` beyond its first lines, `Deep`/`sum_peel`, `vertex`, or the Regulator/Contact/Force/Repeat/Double files for the flux chapter; for these the manuscript proofs were checked mathematically instead.
- Not opened: `YM.StressFlux.Orbit.*`, `Color.lean` invariant-form lemmas, `leg0`/`leg1`/`sum_legs*`, `YM.Extra.FD.reply_radial`, `shell_green`, `Shift.*`, `Translation.*`, `Script.*`, `Duplex.*`, `PowerGram.*`, `Rank.lean`, `YM.Maxwell.Free.Corners.*`, `Depth.lean`, `Ends.lean`, `Morsels`/`Frenzy`/`Shelves`/`Recurse`, `YM.Next.Extract.*`, `YM.Bid.RelayBin`, `YM.Work.D04.*`, `YM.Dash.Bin.*`, `Bought.lean`, `Beam.lean`, `Accent.savings/rated`.
- No Lean build or axiom replay.
