# C12 part-B author findings

Scope: `marked-portfolio-calibration.tex`, `terminal-marked-construction.tex`, `marked-field-local-estimates.tex`, `actual-marked-portfolio-calibration.tex`, `actual-phase-grid-approximants.tex`. Session `schmittj-claude-c12-20261112` (Claude, author agent; not reviewed). Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. "Verified" means the declaration's type and the named definitions were read as text; nothing was elaborated. Author-side evidence, not a review.

## A. Errors repaired

**A1. Fixed section identified with the family's local section (`actual-marked-portfolio-calibration.tex`, "From the campaign to the fixed portfolio").** The text said "at degree d the section is the family section, and its portfolio certificate is retained on the same family". In `YM.PhysicalNext.Repeat.Legato.hearthstone` (`Lean/YM/FullVolume/Hearth.lean`) the family is `Family.mk (Issue.trail Y) (hol G) (Labels.frames G) (localSection G) t Xf`, while the portfolio sections `T d` with `Push.Mark.Portfolio (hol G) (T d) (R d)` come from `Push.Mark.commissioned` (called in `Lean/YM/R2I/Campaign/Fares.lean`). `YM.MergeProof.solaris` compares the two. The old sentence matches `Push.Mark.Memento.wrote` (`Assembly.lean`), which is not on that route. Changed: the paragraph now says the portfolio sections are carried alongside the family and compared with its local sections by `prop:ex-marked-solaris`.

**A2. Wrong reserve constant (`marked-portfolio-calibration.tex`, "Application").** `Z_N` was defined with "the fixed derivative price of a local section" and "the number of active sites in the selected insertion region", with slowness "from the tab schedule". Source: `storms (BasisCost.price V) (BasisCost.price T) C N d = (price V + 2 price T)·Opening.seats C d N` (`Lean/YM/MergeProof/Matter.lean`); `BasisCost.price` is a sup-norm constant (`Lean/YM/Extra/MULTISOURCE_BOUNDS/Columns.lean`); `Opening.seats = Σ_j θ_N^{-s_j}` (`Lean/YM/Push/RELAY_DIFFERENCE/Opening.lean`), slow by `seats_slow` via `threshold_price` (simple group). Changed: definition and slow-growth argument rewritten; the tab schedule is used only for `exp(81α_N)` (`roof_of_tabs`).

**A3. Misattributed schedule identity (`marked-portfolio-calibration.tex`, caller paragraph).** The bound `b_N ≤ \hat β_N` was derived "using the schedule identity". In `hearthstone` it is the credit clause of `dusk` at stage `J(N+1)`, profile `J(N)`, `x=\hat β_N` (`step_paid`, `Paid.pays`). The identity (`Extra.Iteration.block_beta`) serves the other clause, which becomes `Scrim.jump`. Changed: paragraph rewritten; tail clause displayed as `eq:ex-marked-height-jump` with `φ_i=\hat β_{i+1}^{-1}`, `ζ_{d,i}=\hat β_i^{-w_d}`. The silently used condition `hF : d' ≤ M.p.floorL` is now an explicit condition of the caller.

**A4. Wrong intermediate bound (`actual-marked-portfolio-calibration.tex`, proof of `prop:actual-marked-figment`).** The exponential entry was bounded by `‖x_k‖+2C_kφ_k` with `φ_k` called the "remainder allowance". The quantity is the bill `c_k`, and the source bound (`YM.MergeProof.hull`, `Lean/YM/MergeProof/Maid.lean`) is `(1+C_k)‖x_k‖+c_k`. Conclusion (price at most 2) unchanged. Changed.

**A5. Unstated sign hypothesis (`marked-portfolio-calibration.tex`, delay arithmetic).** The proof used `0 ≤ b_L`; `c_G` is positive only for a simple group (`Lean/YM/Gauge/Colors.lean`, `Casimir.lean`) and `shower`/`cash` (`Apres.lean`) do not assume it. Changed to follow the source (`y ≥ max(L^{d+1}2^{w_d},1)`, `b_L ≤ x`); tail comparison now displayed.

**A6. Dangling symbol in `lem:ex-marked-sanded`.** `v = log log x` after `x,y` were fixed as prices; now `log log β_N`.

**A7. `Section~\ref{ex-centered-sail}`** (two chapters): an equation label printed as a section number. Now `\eqref{ex-centered-sail}` of `Section~\ref{ex-centered-construction}`.

**A8. Symbol clashes that changed meaning.** In `lem:actual-marked-antilles`, `D_i` was both door and translated state (now `\mathcal Z_i`); `v` both displacement and `‖x_{i+1}‖` (now `u_+`); vector `b` versus bill `b_i` (now `h`). In `marked-portfolio-calibration.tex`, stage support exponent `s_i` versus grades `s_j` (now `α_i`); undefined `δ_d` inside the inverse lemma's proof; "the stencil's orbit cost" is the frame's orbit cost (`Motion.orbitCost`), now defined. `$keyedness$` fixed.

## B. Gaps repaired

**B1. No statement for the field calibration.** New Proposition `prop:ex-marked-solaris` (inputs: budget triple = `Braze`; paid record = `Scrim`; Keeper, `u_N>0`, slow reserves = `Fridge`; simple group and opening schedule = `Stock.Tabs`; conclusions = `Hearth.stamped`, `Hearth.coined`), proof following `solaris`: `inviting`, `figment`, flight inequality divided by `puffs`, `cheaper`, slow bookkeeping. "Slow" is now defined (`RelayDifference.Slow`).

**B2. Lemma `lem:actual-marked-antilles` did not export what its consumers use.** New fourth item: `32(1+C_i)^2‖x_i‖ ≤ c_i`, `s_i‖x_{i+1}‖ ≤ c_{i+1}`, `c_m ≤ 2(1+C_m)w` (`Work.G09.cone_cost`, `cost_finest` in `Lean/YM/Work/G09.lean`; `Work.G09.pastures` in `Lean/YM/MergeProof/Puffs.lean`). One added proof line. Hypotheses unchanged.

**B3. `prop:actual-marked-figment`: inputs unstated, extra hypothesis.** The statement required a "finite-census certificate" and quantified over "every root o"; `YM.MergeProof.figment` has neither (`filling` in `Strudel.lean` derives the geometry from `Stock.Tabs.opens 1 m k` via `Work.I03.answer`). `cider`, `flight`, `escrow`, `stakes`, `gain`, `alto`, `γ`, `vowel`, `barunit`, `W`, root test were undefined. Changed: all defined; record stated as (R1)–(R7) from `Scrim`, `Geyser`, `Freightage`, `Fiesta`, `Cherry`, `Banks`, `Brine`, `roomCost`, `Bank`; Cream listed field by field; certificate replaced by `lem:ex-centered-opened-copy`; first proof step rewritten in the lemma's notation.

**B4. Uncited slot estimate** in the proof of `thm:ex-marked-portfolio-section` (`Work.G07.paid_slot`): now cites `sec:local-sections`, where it is proved.

**B5. Theorem omitted three source fields.** `Portfolio.inter`, `truly`, `rank` added as item (6) with one proof sentence. "Grade at least (r,s)" was ambiguous; now defined by stamps, with the equivalence to `Campaign.each`.

**B6. No statement in `terminal-marked-construction.tex`.** New `prop:terminal-marked-voice` collecting inputs and five conclusions (`launched`, `onTop`, `Guard.summon`, `MergeProof.onRise`); proofs are references to the existing text. Dilation exponent identified as factor grade `s_j`; `R(U)`, `a_N`, `initial` defined.

**B7. `prop:ex-marked-invitation`.** Statement made a sentence; exact bill (`quicksilver`) stated and the `e^{81α}` envelope derived via monotonicity (`rem_mono`); Keeper defined; pointwise decomposition corrected (`Opening.presses`, `hq`); `|b_0| ≤ s_N` derived; garnishing identified with the terminal attachment applied to `(D,b_0)`.

**B8. `actual-phase-grid-approximants.tex`.** Instance of the lemma made explicit (top `k`, bottom `r_d`, `w=1`, as in `Accent.embrace`); census geometry cites `lem:ex-centered-opened-copy`; `CellHyp` named as input (Theorem `ex-centered-main-bound`); input tied to (R1)–(R7); one overfull paragraph reflowed.

## C. Gaps not repaired

**C1. Record (R1)–(R7).** Producer: part-A `selected-centered-service.tex` (with C02 `centered-freight-producer`, `centered-geyser-scale-estimates`; C09 `heading-history-handoff`). Not verified that every item is proved for the literal family. Inner definitions of (R4), (R6), (R7) not opened.

**C2. Reserved addresses** (`Nest.born`, `HasSlots`, `Eagles.winnow`, `DirectedRecipe.never_spent`): the sketch was checked against `sleepK`, `sleeping_out`, `tile_exact`, `tile_test`; the startup and return constructions were not.

**C3. Schedule conditions:** fee delay (`Doors.entrances`) among the purchases; `paper` thresholds ≤ floor lengths. Stated; discharge belongs to part-A and C16.

**C4. Finite-census estimate:** passage from the Yeast record and (R2)–(R5) to the served representation (`baker`, `sentry`, `embracing`, `window`, `chapter`) is described, not proved here.

**C5. `CellHyp`** (centered one-field estimate, reflection structure): input from C02/C03.

## D. Noted, not changed

D1. Source identifiers used as words (Cream, Music, Yeast, Coupon, Carol, Tale, Keeper); glossed where they carry hypotheses; renaming is G05's. D2. In the phase-grid chapter `i` indexes depths and cells, `L` a label and a block ratio; locally unambiguous. D3. `K_{s(b)}=0` is true but unused by the attachment (`Shelf.blank` is not referenced in `Clusters`, `Till`, `Stock`, `Purchase`, `Birth`). D4. `lem:ex-public-radial-choice` is applied with `γ=1/8` and the same `w_k`; formulas agree.

## E. For part-A and other packages

**For part-A.** (1) `original-history-portfolio-attachment.tex` l.136–138 says `sec:terminal-marked-construction` "supplies the reserved addresses"; that section takes them as a hypothesis. Say where `Nest.born` is proved. (2) `selected-centered-service.tex` should state that it delivers (R1)–(R7); its prices agree with `eq:ex-marked-height-jump`. (3) `common-observable-purchases.tex` does not mention the terminal fee delay or the floor condition. (4) Check any statement that the portfolio section is the family's local section against A1.

**For C14.** `actual-equation-kernel-relay.tex` l.80 "insertion-site count" should be the seat price (A2); it can cite `prop:ex-marked-solaris`. `actual-insertion-derivative-relay.tex`'s "cone part" is now item (4) of the lemma.

**For C02.** `lem:ex-centered-opened-copy` is now cited as producer of the census geometry; its radius hypothesis should be acknowledged on the selected run.

**For G06.** `C16-to-C12-selected-run` should include: portfolio sections and regradings are those of `commissioned`, chosen before the schedule; `paper` thresholds ≤ floor lengths; `dusk` for the run's delay; fee delay paid.

## Second round: checker findings and responses

An independent Codex (gpt-6-astra) check of every hunk is at `scratchpad/c12check/final_B.md`. Each finding was rechecked against the current text and the Lean source. The corrections below supersede sections A–C where they differ: in particular A4 is restated (the old bound was true but misattributed), B3 and B1 are conditional repairs, and three "produced/supplied" sentences were weakened.

| # | Checker finding | Response | Reason and location |
| --- | --- | --- | --- |
| 1 | ERROR: Music quantifiers contradict the source and (R6) | Adopted | `Geyser.aim d N p : C.ref d ≤ N → Freightage … d N p` and `Freightage.lyrics : ∃ Z : Music (C.labels.level d) C.path N p, …` (`MergeProof/Badlands.lean`); `Music` is indexed by frame, history, N, p (`Song.lean`). The Music is chosen per (d,N,p). My sentence "choosing a different Music … for each period or terminal volume is insufficient" was wrong; the same sentence was already in the original "Boundary" paragraph. Both replaced (`actual-marked-portfolio-calibration.tex`, end of the record paragraph and "Boundary of this producer"); (R6) now ends "The Music may depend on (d,N,p)". |
| 2 | GAP: (R4) not exact; residual served representation unproved | Adopted | Opened `Moonlit` (`Wicket.lean`), `Volant`, `Canopy` (`Copse.lean`), `Duty` (`Temper.lean`), `siteFactor` (`Extra/MULTISOURCE_BOUNDS/Root.lean`). (R4) now states every numerical clause of `Duty` and `Moonlit.endow` exactly (note the argument order: `Duty A r k (δ k) y w`, so `copper` bounds the offer allowance y and `stakes` uses the flagged budget w), and marks `Volant` as "named from the source field; content not expanded here". The residual-to-served step (`baker`, `sentry`) is now declared not proved, in the proof and in the statement of `prop:actual-marked-figment`, with its two numerical prices displayed; the same qualification was added to `lem:actual-grid-basis` (phase grid) and to item (2) of `prop:ex-marked-solaris`. Not expanded further: `Canopy`, `Offer`, `Towed`, `Tunes`, `Arsenal`. |
| 3 | GAP: public-run inputs declared produced | Adopted | `hearthstone` has hypotheses `hc : dusk`, `hN : paper`, `hF : d' ≤ floorL` and a fixed `Nest`; `Doors.entrances` needs `k (J (m+1)) ≤ hatBeta m`. Three sentences weakened to conditional/open: budget-triple input and closing paragraph (`marked-portfolio-calibration.tex`); the record paragraph (`actual-marked-portfolio-calibration.tex`, "assumed … upstream obligation"); the paragraph after `prop:terminal-marked-voice` (reserved addresses and fee delay are inputs). |
| 4 | INACCURACY: a_i and u_i reused | Adopted | Real collision that my new notation paragraph made formal. In `actual-marked-portfolio-calibration.tex` the Music index is now ι_i and the state primaries ϖ_i throughout; a_i is only the mesh and u_i only the allowance. |
| 5 | INACCURACY: A4 overstates the old defect | Adopted (findings only) | With the old "remainder allowance" read as the bill c_k and the cone ‖x_k‖ ≤ c_k, one has (1+C_k)‖x_k‖+c_k ≤ ‖x_k‖+2C_kc_k, so the old inequality was valid; it was attributed to the hull estimate, which gives the other bound, and used the symbol φ_k. A4 should read: "replaced an ambiguously named bill and a cone-dependent weaker bound by the direct bound of `YM.MergeProof.Accent.hull`". The declaration's namespace is `YM.MergeProof.Accent` (my earlier `YM.MergeProof.hull` was wrong). Text unchanged. |
| 6 | INACCURACY: two retained sentences misidentify the residual | Adopted | `Yeast.ticks` has no zero-lead clause; `toast` concludes `Yeast … (b + initial T H N p (-(Q l).a) 0) …`. Both sentences replaced (same chapter, paragraph before the census estimate). |
| 7 | INACCURACY: public tail exponent not identified | Adopted | `winter G d = degree (frame d) + 4` (`Tender.lean`), `degree` = maximal second grade (`Birth.lean`). Now stated; the delay argument is said to work for any positive integer exponent. |
| 8 | INACCURACY: C14 consumer still says "insertion-site count" | Rejected as an edit, kept as a finding | `actual-equation-kernel-relay.tex` belongs to C14; see section E. |
| 9 | NIT: Keeper is only part of hypothesis (2) | Adopted | `Guard.Keeper` has no zero-activity field. Sentence replaced (`marked-field-local-estimates.tex`, input 3). |
| 10 | NIT: `\eqref{eq:ex-marked-cover}` targets an unnumbered display | Adopted | The label sat inside `\[…\]`; the display is now an `equation`. My first-round build could not detect this. (`eq:terminal-supplement` in `terminal-marked-construction.tex` has the same defect but is referenced nowhere; left.) |
| 11 | NIT: "The last item is the currency" | Adopted | Now "Item (5)". |
| 12 | NIT: "both of coefficient size at most one" ambiguous | Adopted | Now says the undilated vectors have size ≤ 1 and their dilations ≤ Seat (`Opening.sits`). |

Verdict table. A1, A2, A3, A5–A8, B2, B4–B8 confirmed by the checker; no change. A4 "WRONG as a diagnosis": accepted, see row 5; the replacement text stands. B1 "UNDECIDED as a completed proof": the statement matches `solaris`; its item (2) is now explicitly conditional on the open step; not reverted. B3 "WRONG as a complete repair": the Music sentence and (R4) are corrected (rows 1, 2). On the removed certificate hypothesis: the old conditional statement was not false; it was weaker than `figment` in one respect (extra hypothesis) and referred to an undefined "root o". The replacement keeps the source's quantifiers and now carries the open served-representation step explicitly, so the proposition is a conditional result, not a complete repair. No edit was reverted to the original text.

Garnishing sentence (coordinator's item 3). Opened `YM.MergeProof.garnish` (`MergeProof/Platter.lean`) and its call in `platter` (`Fondue.lean`). Its hypotheses are: lawful representation, Berths from the Keeper, origin in each region, `Attaches` (local on the region, gauge invariant, measurable, zero on healthy configurations), bounds, and a `SumBudget` of `mergePrice`; its conclusions are the force format, force cost, profile = hook of the clipped sum, and the gas-mark sum identity. So the statement has the form I described. Its proof, however, is the slot packing of `Push.LOCAL_SPLITTING` (`Slots.pack`, `forceCost`, `recover`) on the predicate-erased dictionary, not `Attach.line`. The sentence "mathematically this is the attachment construction of Section …" claimed more than I had read; it is weakened to: same hypotheses and form as the terminal attachment, proved in the source by the slot packing of the local splitting (`sec:local-splitting`), not rederived here. The claim that the vanishing of the activities "is not used in that argument" was removed.

Still uncertain after the second round: `Canopy`, `Offer`, `Towed`, `Tale`/`Odyssey`, `Gig` (inside `Coupon`), `Tunes`, `Arsenal` are named, not expanded; the served-representation step is open in three statements; the three schedule/history inputs (floor and `dusk`, reserved addresses, fee delay) have no identified manuscript producer.
