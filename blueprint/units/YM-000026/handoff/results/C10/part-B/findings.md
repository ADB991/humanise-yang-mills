# C10 part-B author findings

Scope: `classical-stationary-vertices`, `annulus-fleet-face-estimates`, `annulus-two-wave-estimates`, `annulus-recording-yield`, `annulus-same-data-binding`, `stationary-germ-symmetry`, `stationary-output-construction`, `inherited-loop-transport`, `quadratic-pole-transport` (all in `manuscript/existence/`). Session `schmittj-claude-c10-20261112`, issue #51. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean statements were read as text; nothing was elaborated. "Verified" below means: the statement and, where stated, the proof script were read and compared with the manuscript. `S/` abbreviates `Lean/YM/Next/STATIONARY/`.

All nine chapters were read in full. Every item of the prepared audit (`final_C.md`, `final_D.md`) was checked against the LaTeX and the Lean source; the decisions are in the table at the end.

## A. Errors repaired

**A1. The stationary contraction inverted a degenerate matrix (classical-stationary-vertices, subsection "The stationary contraction formula").** The chapter assumed `M=D_y^2 A(0,0)` positive definite and wrote `D^2y(0)[h,k]=-M^{-1}s(h,k)`. The internal variable contains the gauge coordinates and the block action is gauge invariant, so this Hessian has the gauge directions in its kernel; the source inverts the gauge completion. Evidence: `S/Joint/FourPoint.lean`, `commonM`, `postmark`, `postroom`, `leaflet` (`commonM = postmark + postroomᵀ postroom`), `public_venue` (`postmark*P=0`, symmetric, `postroom*P` invertible), `radiant` (`H M⁻¹ H = H`), `triumph4` (the covector is `-(postmark *ᵥ ·)` and the contraction uses `commonM⁻¹`). Changed: `H` is now the raw Hessian, `M=H+FᵀF` its completion; new displays `eq:ex-stationary-completion`, `eq:ex-stationary-second` (`H u = -s`), `eq:ex-completion-projection` (`H M⁻¹ H = H`, with the proof of `radiant`), `eq:ex-stationary-pairing`; the ray check uses `uᵀHu`. The final formulas `eq:ex-stationary-third`, `eq:ex-stationary-fourth` are unchanged and were already correct with `M` read as the completion. The properties of the completion are cited from part-A chapters (`eq:ex-actual-gauge-identity`, `eq:ex-gauge-det-factorization`), which I opened; `H R=0` is proved inline.

**A2. The lower bound of the denominators did not follow from the stated geometry (annulus-fleet-face-estimates, (F4)).** `T² ≤ 64 peb(x,μ)` was claimed from `‖x‖≤T`, `μ≤T`; a counterexample is `x=0`, `T=1`, `μ` small. Evidence: `S/OneLoop/Propagators.lean`, `ColdR` (fields `flow : T ≤ flay lens + μ`, `slim`, `stage`), `cold_safe`. Changed: new display (F4′) with the three missing conditions, a definition of `peb`, and the derivation of the bound; both scale choices are checked against (F4′).

**A3. The regulator film was built from the wrong film (same chapter, trajectory prices).** The text started from "the free Wilson film plus μ²". Evidence: `S/OneLoop/Lattice.lean`, `quarry`, `cinder`, `chert`, `chisel`, `stony`, `graniteF`, `massif`, `coring`: the regulator of both channels is built from the ghost film `matina.rear.pay matina`. Changed: the construction is displayed (`C_μ`, `H_μ`, `R_gh,μ`, `R_vec,μ`); the budget argument is unchanged.

**A4. "All-grade floor" (fleet chapter, four places; recording-yield, two places).** The quantified parameter of `Floor` is the torus side (`Lean/YM/PREC/Stacks.lean`, `Floor (M) (p) (n : Side)`; `HouseWord.lower : ∀ m, Floor B k m ε D`). Changed to "floor at every torus side"; the "grade-one normalization" is now the zero-momentum normalization `M(0)=I` (field `starts`).

**A5. The fixed gauge-fixing film is not a polynomial (fleet chapter, last subsection).** Evidence: `S/OneLoop/Leading.lean`, `recordingA`. Changed to "entire and periodic; finite sums of products of lattice exponentials".

**A6. Two citations for the halo identity pointed at a proposition that assumes it (fleet chapter).** `prop:ex-two-wave` assumes (AT5a). The citations now point at the identity itself, new label `eq:ex-two-wave-identities` on (AT5a), whose halo part is proved independently in the two-wave chapter. This also removes an apparent circularity.

**A7. Order of choices of the recording strip reversed (annulus-two-wave-estimates, last paragraph).** The text said the strip is chosen before the blocking side. In `S/FullPlanned.lean`, `pouring`, the strip `z` comes from `HouseWord.done ha'` with `ha'` depending on `y = inch L`. Changed; the stale "source boundary" paragraph (which called the fleet chapter "the next unit" although it precedes) is replaced by a scope paragraph with the correct order and references.

**A8. "Equality with the finite sampled coefficient" (two-wave chapter, two places).** `profit` gives `Recorded … (cents m * royalty σ A * exp(-(σ/4)m))`, an estimate. Wording corrected.

**A9. The Casimir (two-wave chapter).** "Quadratic Casimir in the chosen representation" replaced by the adjoint Casimir with the simplicity hypothesis (`Lean/YM/Gauge/Colors.lean` `casimir`, `Gauge/Casimir.lean` `trace_adjoint`, `haloRate (h : G.Simple)`).

**A10. The primal matching equation was said to follow from differentiating the stationary equation (inherited-loop-transport).** In the source both matching equations are hypotheses (`Lean/YM/PREC/TreeMatch.lean` `Inputs`, supplied through `Towers.Diagonal.trial` in `Scud.trial`, consumed by `actor_duo`). Changed: new display `eq:inherited-matching`, stated as an input of the one-step construction.

**A11. The quadratic path action `J_k` omitted the direct Wilson term (stationary-output-construction).** `Lean/YM/PCalc/Chart.lean`, `quadratic` contains `p.direct*G.price(faceValue U b)`. Changed: `J_k` is defined with both terms; the two Hessian equalities are attributed (lemma for `J_k`, heat identity input for `E_k`); the pictures of `J_k` are attributed to the row estimate and to the Wilson pictures.

## B. Gaps repaired

**B1. Common strip of the regulated kernel (annulus-same-data-binding).** The sentence "the uniform strip bound is shared by all sides because the same F is used" does not prove a strip bound for a kernel containing inverses. New Lemma `lem:ex-annulus-common-strip` with a four-step proof following `massifTabs`, `dais_floor`, `throne_floor`, `gardenGate`, `Play.estate`, `calm_into`, `luncheon`, `HouseWord.done`.

**B2. The annulus estimate was nowhere stated in the form consumed downstream.** New Proposition `prop:ex-annulus-estimate` = `YM.Stationary.HorizCalc` as produced by `pouring`, with two named inputs (W), (S). See O1.

**B3. Input family of the face estimates undefined (fleet chapter).** "Orion", "Hstar", "grey", "fee", "soft" were used without definition. New definitions of response, fees, greyness, local record, centered record, the two channels and their films, the response formula `eq:ex-fleet-response`, the slot formulas for `S,B^±,J`, and a paragraph for the ghost channel (tab `ω I`, linear leg `w_b`), which the chapter used in (F12) but never described. Uniformity of the constants is stated.

**B4. The three plaquette contributions (fleet chapter).** Now displayed; I rederived them from `cornet`/`commaQ`/`coronet` and checked the sum and the final `v_b` against `vectorC`. The grid-to-real-momentum step is stated.

**B5. Coefficient functional (two-wave chapter).** `α` was said to act on the response kernel. It is defined on pictures (`alphaPay`), the picture being half the internal zero mode (`profitable`). Rewritten with both objects and the hypothesis of (AT1); (AT1) itself is unchanged.

**B6. The six traces (two-wave chapter)** are now defined through the faces of the two channels; domain restrictions (`0<μ≤1` for the pole integral, `r>0` for halo identities) added.

**B7. Normalized recording convention (recording-yield).** (RY4′) added: the source's `Recorded` is for `D²/2!`; the lemma's unnormalized estimate gives it with a factor ½ to spare.

**B8. Radial integration (recording-yield, proof of the theorem).** "The radial calculation in the preceding section" does not exist there. Now cites `lem:path-radial-log` (C11) and gives the three-region computation.

**B9. Explicit statements with order of choices** for the results consumed by the one-step construction: `prop:ex-classical-stationary-pictures`, `prop:stationary-output-path`, `prop:inherited-loop-picture`, `prop:ex-pole-coefficient-transport`. In each case the proof is the existing text of the chapter; the proposition fixes hypotheses and quantifiers.

**B10. Weighted norm (classical chapter)** is recalled with a reference; the family of tori, paths and beds to which the vertex identity applies is stated with its hypotheses (those of `setWest`).

**B11. Standing hypotheses (germ-symmetry, quadratic-pole).** Made explicit; the final application in the pole chapter now separates the three coefficients (determinant, rank, fine pole) and names the comparison constant as an input.

**B12. Bridge versus tree-chart tangent, and the guard `μσ≤w` (inherited-loop).** The bridge is the Fourier representation of the installed matrix, the tangent of the gauged-back representative. The strip width is not shrunk; the blocking side is restricted (`bequest`: `inch P.L*σ ≤ w`, output width `surfHeight 1 σ = σ/4`).

**B13. Degree range (output chapter).** "Suppose n≥3" restricted to `n∈{3,4}`, the range of the cited `prop:ex-atom-stream-picture`.

## C. Gaps not repaired, and open inputs

**O1. Inputs (W) and (S) of the annulus estimate.** `vintageWilson` and `saunter` are obtained from `Wilson_stream`/`greyson` through `YM.Stationary.jig` (`S/OneLoop/Lattice.lean`), which converts exactly recorded Taylor pictures into marked-layer responses with fees. I found no statement of this conversion for pictures in the manuscript; `soft-curvature-receipts.tex` states the analogous conversion for response arrays (`prop:ex-three-level-conversion`, `thm:ex-soft-response-mockups`, Lean `tideMark`). Not repaired: it belongs to part-A's chapter or needs a new unit.

**O2. Tickets of the fixed films and the determinant ticket identity.** `gemF`/`ring_award`/`Ticket.receipt` are described in recording-yield (RY8), (RY8a) at the level of the existing text; I did not expand the ticket calculus (products, rears, inverses of films recorded at finite volume).

**O3. Derivation of the face prices (F6).** I read the Lean statements (`weeks`, `Week.invW`, `chertWeek`, `cannonWeek`, `stoneWeek`, `glaze`, `granaryTall`, `grainTall`, `bubbleHV`, `tadControl`, `bubbleControl`, `brass`, `haloControl`) and they agree with the chapter's powers of `T` and `μ`. I did not re-derive every step of the trajectory-price paragraph.

**O4. The one-step theorem itself is not stated in C10.** See ledger, edge `C10-to-C11-one-step`.

**O5. Forest independence (`Bid.F05`) and the Hessian forms (`Bid.F02`, `F03`)** are not produced in part-B chapters. See ledger.

**O6. The real-momentum floor of the bed** (`rug_test`: the floor at all sides gives `Re⟨v,M(k)v⟩ ≥ ε|v|²` at real momenta) is used in `lem:ex-annulus-common-strip` with a one-line density argument. The Fourier diagonalization of the finite metric matrix behind it is not written out.

**O7. Values and first derivatives of `E_k` at zero (output chapter)** are asserted as in the original text; in the source they come from `Work.F03.answer`. Not expanded.

## D. Statements whose hypotheses differ in packaging from the source (for the reviewer)

- `prop:inherited-loop-picture` and `prop:ex-pole-coefficient-transport` list the hypotheses used by the argument. The Lean lemmas `bequest`, `pole_reduced` take a packaged `TicketPost`/`PostCard`, which contains further data (Hessian gap, response tickets) not used in their proof scripts as far as I can read them. The text says so explicitly. Please confirm.
- `prop:ex-classical-stationary-pictures`, hypothesis (3), assumes the Fourier symbol of the completed inverse and its bound; `exchangeYield` derives the symbol identity (`shaftPorts`) from the response tickets of the `PostCard` and takes the bound as `GrantF.medals`. The proposition corresponds to `pure_beat`, `press_beat`, `pennies`.
- `prop:ex-annulus-estimate` takes `L_min=1`, as `pouring` does.
- In the local-record definition I require `C,D,A ≥ 0`; `astronomy` has no sign condition on `D,A`. This is a harmless restriction.

## E. For part-A

1. `weighted-frame-penalty.tex` refers to `classical-stationary-vertices` as "the preceding section" (twice, near "Verification for the Fourier legs"), but it is included before it in `existence.tex`.
2. `weighted-stationary-inverses.tex`, subsection "Adding the gauge-fixing square": the identities `eq:ex-gauge-fixing-receipt` "remain inputs to this subsection". `classical-stationary-vertices` therefore cites that section only as "the subject of", not as a proof, for the inverse bound `eq:ex-exchange-inverse`.
3. `classical-stationary-vertices`, `annulus-same-data-binding`, `stationary-output-construction`, `quadratic-pole-transport` now cite `lem:ex-soft-quadratic-hessian`, `prop:ex-greyson`, `eq:ex-actual-gauge-identity`, `eq:ex-gauge-det-factorization`, `eq:ex-thermal-determinant`. These labels must survive part-A's revision. The lemma is used in the form: under path bounds, attachment, floor and sworn condition at one side, the Hessian at zero of the quadratic part of the path action is the kinetic form of the bed (Lean `flare_matches`, `low_columns`).
4. A statement of `jig` for coefficient pictures (see O1) would close inputs (W), (S).
5. The comparison constant `C_cmp` (`quoting`, last conjunct: `|α(det) − α(rank)| ≤ biteCost(η/2, reserveCost …)`) and the recording of the determinant picture with error `cents·royalty·exp` are cited from part-A sections as inputs in `quadratic-pole-transport` and `stationary-output-construction`.

## F. Audit items and decisions

| Item | Decision | Reason / action |
| --- | --- | --- |
| C/classical A1 (raw vs completed Hessian) | confirmed | A1; proposed wording adapted to part-A's notation `F`, `R` |
| C/classical B1 (weighted norm) | confirmed | recalled with reference (B10) |
| C/classical B2 (family hypotheses) | confirmed | hypotheses of `setWest` stated; proposition added |
| C/fleet A1 (all-grade) | confirmed | A4 |
| C/fleet A2 (ghost film) | confirmed | A3 |
| C/fleet A3 (not polynomial) | confirmed | A5 |
| C/fleet B1 (cold geometry) | confirmed | A2 |
| C/fleet B2 (selected-family input, two strips) | confirmed | B3; `s_μ` displayed |
| C/fleet B3 (slots and channels) | confirmed | B3; formulas checked against `storm`, `boomY`, `boltA`, `boltB`, `oozeY`, `Rally` |
| C/fleet B4 (Wilson coefficient) | confirmed | B4 |
| C/fleet D (wrong citation target) | confirmed | A6 |
| C/two-wave A1 (factor of two, type) | refined | (AT1) was numerically right; the object on which `α` acts was misdescribed (B5) |
| C/two-wave A2 (Casimir) | confirmed | A9 |
| C/two-wave A3 (domains) | confirmed | B6 |
| C/two-wave A4 (strip after L) | confirmed | A7 |
| C/two-wave A5 (error, not equality) | confirmed | A8 |
| C/two-wave B1 (six traces) | confirmed | B6 |
| C/two-wave B2 (stale boundary) | confirmed | A7; Lean names removed from the text |
| D/recording RY-B1 (normalized convention) | confirmed | B7 |
| D/recording D ("preceding section") | confirmed and extended | B8: the cited calculation was missing, not only mislabelled |
| D/same-data SD-B1 (common strip) | confirmed | B1 |
| D/same-data (grey at every side) | confirmed | definition corrected |
| D/germ-symmetry B (standing hypotheses) | confirmed | B11; no error found |
| D/output OUT-B1 (J_k, Hessian matching) | confirmed | A11 |
| D/output OUT-B2 (degree range) | confirmed | B13, first of the two proposed repairs |
| D/inherited INH-B1 (bridge, matching hypothesis) | confirmed | A10, B12 |
| D/inherited INH-B2 (σ ambiguity) | confirmed | B12 |
| D/pole POLE-B1 (dual equation objects) | confirmed | B11 |
| D/pole POLE-B2 (thermal drift) | refined | the scalar of the one-step is the determinant coefficient `alphaPay i (profitable (medalCue …))`; the inherited loop enters through the output construction. The proposed Cauchy bound `8B/v²` was not adopted: the source bound is `biteCost`, cited as an input |

No audit item was rejected outright. One auditor description was corrected in passing: "grey" is not "exact Taylor tickets of the Wilson action" in the plain sense; `Jar.bindV`/`DrinkIt`/`liquid`/`dough` record derivatives of `W(exp y · exp z)`, order two in `y` and orders 0, 1, 2 in the marked variable `z`.

## Second round: checker findings and responses

Source: `c10check/final_B.md` (independent Codex check of every hunk). Each finding was rechecked against the current text and the pinned Lean source.

| Checker finding | Decision | Reason and change |
| --- | --- | --- |
| 1 ERROR, same-data l.60–62: finite mesh sum identified with the integral | partly adopted | The sentence predates my edits and was meant as the convention for the "finite-volume realization" of a picture (the quantity `Err` compares with), but as written it reads as an exact formula for the finite test, which is false (`Ticket.receipt` gives the mesh sum; `profit` an error). `lem:ex-annulus-same-data`, item 2, now displays the mesh picture `𝒴_{n,ij}`, says explicitly that the exact finite derivative is `2n⁴𝒴_{n,ij}` and not `2n⁴𝒴_{ij}`, and that the difference is what the recorded estimate controls. The conclusion of the lemma and `prop:ex-annulus-estimate` are unaffected (they used the estimate). |
| 2 ERROR, fleet: sum over plaquette types called "one plaquette" | adopted | Confirmed with `cornet` (`∑ a : PlaqAxes`) and `breathOne`. Wording changed to "after summing over all positively oriented plaquette types"; the three contributions, their sum and `v_b` are unchanged. This was an error in my own first-round text (B4). |
| 3 GAP with sign inaccuracy, fleet and same-data: fixed film's slots unspecified; tab sign | adopted, with the remaining part made an explicit input | Confirmed: `matinBeige : (matina G).tab = -(pageD G 0)`; `pelt x = mail (input G m x)`, `mail` the matrix of `cant`, `cant_at` the covariant difference; `pelt_ticket`. The fleet chapter now defines `B` as the film of `D_U h(x,a)=h(x)−Ad_{U(x,a)}h(x+e_a)` (tab, first and second background derivative), states the tab as `−T(P_0)` and that the sign cancels in `BBʳ`, `BʳB`. The response-to-film routing is displayed (`wineShift`, `wineM`, `vintage`). The claim that these slots, and products, rears and inverses of films, are recorded at every torus side is no longer asserted as a fact "which holds at every side": it is stated as an input in both chapters (new ledger edge `unassigned-to-C10-film-tickets`; this was O2). |
| 4 GAP, classical and output: chart producer gives no period-uniform gap and names the wrong bed | adopted | Confirmed in the C10 copy of `path-attachment-producer.tex` (l.252–254, 270–272); C11's revised text has the uniformity paragraph and the fine bed. Both chapters now say that one gap for all periods is part of the input, that a fixed-period construction does not give it, and that the incoming path is attached to the fine bed. No statement of mine derived the uniform gap; the propositions were and remain conditional. Ledger row `C11-to-C10-chart-receipts` amended. |
| 5 INACCURACY, same-data: missing colour extensions | adopted | `P̂_j=T(P_j)` introduced and used in the tab formula, the exterior identity and the coercivity display of `lem:ex-annulus-common-strip`; the bound is unchanged. |
| Table, B13: stated rationale inaccurate | noted | In part-A's revised text `prop:ex-atom-stream-picture` covers all degrees. The chapter text only says "the two cases used below"; the restriction is harmless. Ledger row `C10A-to-C10B-lift` amended. |
| Table, B3 "WRONG in the fixed-film tab" | adopted | same as finding 3 |
| Ledger: `C10A-to-C10B-determinant-picture` partial | adopted | row amended: the finite-volume recording of the determinant picture remains an input |
| Ledger: `C01-C11-to-C10-two-scale` producer citation | recorded, not verified | the two labels named by the checker are recorded in the ledger as the checker's identification; I did not open them |
| POLE-B2 remark (Cauchy bound not shown false) | agreed | I did not claim it false; it was not adopted because the source uses `biteCost` |

Reverted edits: none.

Coordinator's points.

- Packaged hypotheses. I went through the three proofs step by step. `prop:inherited-loop-picture`: the fine picture uses the loop budget, moment identities and invariance of the path (1); division and pullback use the bridge bound and the side guard (2); the linear recording uses that the bridge represents `W_i` (2); the nonlinear recording uses the branch, its installed tangent, gauge invariance, branch compatibility and the path bounds (3, 1); the alias formula uses both recordings and `m_i→∞`; the real-momentum primal equation uses the first matching equation and the two strip bounds (3, 4); the nonprincipal estimate uses the floor at every side with `ε>0` (4) and the Ward identities. The dual equation and the Hessian gap are not used. `prop:ex-pole-coefficient-transport`: block identity and recording of the rank picture (response data formed with `W_i`, path bounds, attachment, floor and sworn at `n_i`, strip bound of the rank kernel), invariances and order two of the fine picture (simple group, recording with `e_i→0`), alias expansion (bridge), nonprincipal aliases (primal equation, floor at every side, strips), principal amplitude (dual equation at zero). The stationary branch and the gap are not used. `prop:ex-classical-stationary-pictures`: uses (1)–(3), path bounds, branch compatibility and the vertex identity. Each chapter now says that the hypotheses are extracted from the standing data of the one-step construction (Lean `PostCard`, `TicketPost`, `Scud`; named in correspondence.md, not in the manuscript). The checker independently read `bequest`, `pole_reduced`, `questPole` and agrees that the omitted fields are unused.
- Face prices (F6). In this round I read the proof scripts of `Fleet.tadControl`, `Fleet.cool0` and `Fleet.brass`, in addition to `Week.pair`, `Week.invW`, `chertWeek`, `cannonWeek`, `cinderWeek`, `glaze`, `bloomJ`, `sepJ`, `stepsJ`, `rainP`, `weeks`, `bubbleHV`, `cinderTall`, `grainTall`, `granaryTall` read in the first round. They follow the chapter's derivation: reference upper face from the regulator arch budget `μ²/T²` and the inverse at scale `T`; interacting upper face at unit scale; inverse differences from `S⁻¹−R⁻¹` with `S−R` of budget `T³+μ²=δT²`; leg differences from `T²≤δT` and `μ²/T≤δT`. Not opened: `sipPatrol`, `sipLight` (Taylor remainder to path budget), `Fiesta.inv`, `Fiesta.invDiff`, `Fiesta.pairDif`, `stoneWeek` beyond its first line. (F6) is therefore checked against the source at the level of these proof scripts, not re-derived line by line; O3 stands in that weaker form.

Remaining uncertainties: the ticket calculus of the fixed films (now an input); inputs (W), (S); the determinant picture's recording; the exact statements of the part-A results cited by label, which part-A was revising at the same time.

## Revision 1: response to the review in draft PR #99

| Review finding | Response |
| --- | --- |
| R1: the fixed-film ticket calculus is an open input but is omitted from the final annulus dependency summary and the outgoing C11 handoff | Adopted. The input is named (T) where it is introduced in `annulus-same-data-binding.tex`, is now a hypothesis of `prop:ex-annulus-estimate`, is listed in the summary paragraph after the proposition, and is carried by the edge `C10-to-C11-annulus-estimate` in `ledger.md`, by `../README.md` and by `../handoff.md`. It is not discharged. |
