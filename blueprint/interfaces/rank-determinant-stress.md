# Rank, determinant and stress handoffs — working audit, issue #14

**Status: author draft for independent correspondence review.** This is a
bounded interface audit of source cluster III.11, not an exposition and not
an ownership grant. Imported source revision:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`; paths are under `Lean/`.
Scott Armstrong's
[III.11 outline](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-11.md)
at `8f3c7ccaeabb17b0f928bc1a2e75328691de3032` was used for navigation only
(proposition numbers III.11.1–III.11.7 below are that outline's); no claim
here rests on it. Do not commission explanation tasks from this note before
it has been reviewed.

Evidence levels: **[E]** statement elaborated by Lean (`#check`/`#print`);
**[S]** source text read; **[G]** computed from a compiled declaration graph
that is a local, unaudited artifact (see Evidence). Anything unmarked is
interpretation.

## Summary of findings

1. **The determinant budget is a stable, separate result that precedes the
   rank comparison.** `YM.Next.Rank.determinant` and
   `YM.Next.Rank.Station.affordable` reference none of the other candidate
   theorems of this cluster, nor the nonlinear step or the Gaussian sector
   [G]; the rank comparison reaches both of them [G]. PU-12 can be written
   first and cited by PU-11.
2. **Two different "determinants" occur, with different consumers.** The
   budget of item 1 is a ratio of Haar integrals on a torus. The relative
   matrix determinant of #12's third package
   (`Dyed.cardinal_spin`, `Port.book_price`, `RelativeLogdet.Priced.chains`)
   is *not* referenced by `Rank.determinant`, by `Station.affordable` or by
   the rank theorem `MergeProof.Accent.rated` [G]. It enters only upstream of
   one hypothesis of the rank theorem, through
   `InteractingRank.Soft.accepts_stock → Soft.soluble → Soft.shapers` [G].
   #12's open question "is there a proof edge from `cardinal_spin` or
   `book_price` to `Rank.determinant`" has the answer **no** in either
   direction [G].
3. **The rank comparison is one theorem with three carried hypotheses**
   [E]: `MergeProof.Accent.rated`. Its conclusion is an extraction record, a
   `Spec.Seed` and `Maxwell.Ranks`. It does not reference the nonlinear step
   (`Rain.glazing`, `Roost.Factor.worksNow`) or
   `Next.SectorChange.committed` [G]; the RG history enters through the
   hypotheses.
4. **The stress theorems do not reference the rank theorem** [G]. The
   handoff from rank to stress is a *statement*, not a proof dependency:
   `Acme.emanate` takes a `Spec.Seed` and uses only its field
   `corrected : Cells.RankWidths`, through
   `Next.UVStress.cap_given : RankWidths → DimAbove`, plus the seed's
   extraction fields [S]. `Maxwell.Ranks` itself is **not** consumed by the
   stress construction.
5. **`Maxwell.Ranks` is produced twice.** Once by the rank theorem, and again
   from the stress output by `YM.Climb.comparison : ActLaw → Maxwell.Ranks`
   [E]. Which of the two the later chapters use is not settled here; it
   decides whether PU-11 must prove the equivariant isomorphism at all or
   only the dimension count.
6. **The handoff to VI.1 is the record `YM.Org.UV`** [E]: a seed, the
   orientation law, the Ward record `Climb.Pre`, the action law
   `Climb.ActLaw` and the grid condition `Org.Grill`. Its direct VI.1
   consumer is `Org.Commission.picks` [E]. No consumer of the stress
   statements in V.3 was found; see obstruction 4.
7. **III.11 as delimited by the external outline is not three packages but
   at least five.** Besides the three in the issue title there are the free
   covariance estimates (III.11.2, III.11.3) and the production of trial
   systems from frequent good scales (III.11.4), each with its own statement.
   A split is proposed below.

## Contract A — determinant budget (candidate PU-12)

**Statements** [E].

- `YM.Next.Rank.determinant`, `YM/Next/RANK/Determinant.lean:240`. For a
  representation `R : RG.Rep G n` with `R.Lawful σ A Λ δ w`, a Haar budget
  `O`, `0 ≤ R.eval` pointwise, `1 < n`, `0 < g ≤ R.p.threshold`,
  `R.beta * g^2 = 1`, a `Wilson.prior`-integrable `F : Config G n → ℂ`,
  `0 ≤ z`, and the pointwise bound
  `z * ‖F U‖ ≤ exp (R.exponent U + card(Site n) * X)`:

  ```text
  z * ‖∫ F d(prior)‖ / ∫ R.eval d(prior)
      ≤ exp (card(Site n) * protection O R A Λ δ X g - 4 * G.lieDim * log g)
  ```

- `YM.Next.Rank.protection` (`Determinant.lean:225`) [E]:
  `2 * R.exCost A Λ δ + card PlaqAxes + R.beta * RG.baseBudget R.clip A g + X
  + 3 * ent O R.clip - 4 * log O.small`, with
  `ent O p = log O.big - G.lieDim * log (min 1 p.linear)`.
- `YM.Next.Rank.HaarBudget` (`Determinant.lean:26`) [E]: reals
  `0 < small ≤ 1 ≤ big` with
  `small * r^lieDim ≤ probHaar (shell (r/4))` for `0 < r ≤ 1` and
  `∫ exp(-(chord u / t)) d(probHaar) ≤ big * t^lieDim` for `t > 0`.
  `YM.Next.Rank.exists_budget : Nonempty (HaarBudget G)` for every `G`.
- `YM.Next.Rank.Station.affordable`, `YM/Next/RANK/StationMeter.lean:119`.
  For a Haar budget `O`, levels `A : RG.Levels G` and simple `G`:
  eventually in the level `m`, for every period index `p`, every
  representation `P` on `A.S.side m p`, all `g Λ δ X` and `k : ℕ` with
  `Station.Meets A m p P g Λ δ` and `X ≤ 1 + k`,

  ```text
  protection O P (A.params m).paths Λ δ X g
      - 4 * G.lieDim * log g / card(Site (A.S.side m p))
    ≤ Station.ticket O (A.params m) k
  ```

  `Station.Meets` is eight scalar conditions (same clip as the stage,
  `P.beta ≤ 4 * hatBeta m`, `P.beta * g^2 = 1`, `0 < g ≤ P.p.threshold ≤
  threshold m`, `δ ≤ 1`, `Λ ≤ loopCap m`); `Station.ticket` is an explicit
  expression in the stage data, `O` and `k` [E].

**Order of quantifiers.** In `determinant` nothing is chosen: it is a bound
for each fixed torus, representation and `g`. In `affordable` the level
threshold depends on `O` and `A` only and is uniform in `p`, `P`, `g`, `Λ`,
`δ`, `X`, `k`.

**Inputs** [G]. The reference closure of `determinant` contains 273 theorems,
in `YM/Next/RANK` (41: `Axial.lean`, `Haar.lean`, `Determinant.lean`) and in
the lattice, gauge-group and RG-definition directories. It reaches none of:
`SectorChange.committed`, `SectorAffine.assembly`, `Rain.glazing`,
`Roost.Factor.worksNow`, `Fluctuations.grants`, `Target.issue`,
`Dyed.cardinal_spin`. `affordable` (87 theorems) likewise.

**Consumers** [G]. `determinant` has one: `InteractingRank.Soft.denture`
(the same inequality under a `Soft.Tissue` hypothesis [E]), which is reached
by the rank theorem along
`Accent.rated → Soft.wheeled → Soft.v_obtain_purchases → Soft.coupon →
Soft.s_postage → Soft.denture`. `affordable` has one: `Rank.Ship.banking`,
used by `v_obtain_purchases`.

**Recommendation: separate unit, before PU-11.** One coherent argument (tree
gauge, a triangular choice of plaquettes for the numerator, Haar shells for
the vacuum, cancellation of powers of `g`), a short statement and a single
consumer. The mathematical description of the proof is taken from the
external outline and was not checked against the proof bodies.

## Contract B — rank comparison (candidate PU-11)

**Main statement** [E]. `YM.MergeProof.Accent.rated`,
`YM/MergeProof/Powder.lean:48`. For a Wilson family `C` with `C.Makes`,
simple `G`, `Extraction.Wcmain C`, and

- (i) `MergeProof.Scotia C V Y Xf` (`YM/MergeProof/Eureka.lean:16`): a
  presentation `Xf` with `Extract.Affordable` and `Extract.RelayCosts` along
  every extraction order, such that for each degree, eventually in `N` and
  for all `p`, the corrected label map is real and equivariant under the
  signed axis permutations and the step of `Xf` is the chosen projector of
  the catalogue [E];
- (ii) `MergeProof.Scrim C W u ψ φ δ (Bandage.fly …) r D` along gauge-door
  maps `D` between successive levels (not unfolded);
- (iii) panels `Q`, a chart ratio `J` and a binding `B` such that for every
  degree `i` there are **frequently** (`∃ᶠ j in atTop`) levels `j` with
  `RankCovariance.Tender v j ∧ Tapes.Metering v O j (-3) ∧ ∃ l r,
  ShowHours J B (v.current j) j (-3) l r ∧ Soft.Vents B (v.current j) J l r j`,
  where `v = Panel.patronize C (Q i) …`;

for every extraction order `f` there exist a refinement `g` and
`A L R Z T E` with `Extract.Projected Xf (f.refine g) R Z`,
`Extract.Base C (f.refine g) A L R T E`, a seed
`s : Spec.Seed C (f.refine g) T`, and `Maxwell.Ranks T s.kernel…`.

- `YM.Spec.Seed` (`YM/Spec/Closed.lean:20`) [E]: `C.Makes`, `f.Ordered C S`,
  `f.PointLimits C S`, `S.Hierarchy`, `Cells.CellHyp C f`, and
  `Cells.RankWidths C f S := ∀ d, ∃ X Y, Columns.Trials.Valid f Y`.
- `YM.Maxwell.Ranks` (`YM/Euclid/Comparator.lean:135`) [E]: a real structure
  `h` on `Maxwell.freeTable L.grid` and, for every degree `d`, a map `f` from
  `S.Field d` to the free field space intertwining the conjugations and the
  mirror actions of `YM.Signed`. That `f` is a linear isomorphism is as
  reported by the external outline; the binder type was not printed.

**Internal statements** [E], in the order in which the proof uses them [G]:

| Step | Anchor | Statement |
| --- | --- | --- |
| Free pair terms (III.11.2) | `YM.Next.Rank.Prayer.fence`, `YM/Next/RANK/StrideCost.lean:70` | For stencils `L, S` there is `C ≥ 0` such that for every configuration of distinct points, `i ≠ j`, a bound `D` on the real parts of the current covariance, and `r ≥ 1`: `r * ‖(rescaled pairing) - Prayer.light L S x_i x_j‖ ≤ C * D`. |
| Free covariance windows (III.11.3) | `YM.PhysicalNext.RankCovariance.window_prices`, `YM/PhysicalNext/RANK_COVARIANCE_ATLAS/Window.lean:118` | For `α, η > 0`, `Ω`, `n` there is `C ≥ 0` such that for every regulator `f : FreeCovariance.KP.Firm α Ω η`, every `G` and stencils `a, b`: `Radian.Window (coloredChart f a b) 2 C n (chartHeat a b)`. Uniform in the regulator and the group. |
| Frequent scales to provisions | `YM.PhysicalNext.InteractingRank.Soft.cast_off`, `…/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/Star.lean:64` | From the four price conditions and `LanternMarks M F X k` holding frequently in `k`: `Soft.s_provisions F O X M`. |
| Provisions to trial systems (III.11.4) | `Soft.wheeled`, `…/Soft/Star.lean:68`; `Soft.v_obtain_purchases`, `…/Soft/Supra.lean:177` | `∃ Z, Soft.Travels_ O p F.fixed Z ∧ Market.Purchases Z`. `Market.Purchases` (`YM/Next/RANK/Bought.lean:68`) records the depths, strictly decreasing scales `a · monitor^b`, real bounded coefficient vectors with first entry the reference unit, convergence of the test configurations, and — eventually in `N`, for every `p` — the bound `rootTest (β_{N,p}) (connected part) ≤ Z.gap k` for every nonempty set of modes. |

`Accent.rated` reaches `Prayer.fence` through `Soft.wheeled →
Soft.v_paid_factory → Wall.on_demand → Prayer.penalty`, and `window_prices`
through the definition `RankCovariance.Tender → RankCovariance.prepared` [G].

**Where the hypotheses are discharged** [E statements, G reachability].

- (i): `YM.MergeProof.reception` (`Eureka.lean:22`) produces `∃ P b,
  Scotia C R P b` from `Makes`, `Stock.Tabs`, `Scrim`, `Fridge`, portfolio
  data and simplicity. It is used by
  `YM.PhysicalNext.Repeat.Legato.chaletrail` (`YM/MergeProof/Inns.lean:33`),
  which **does** reach the nonlinear step's reset
  (`… → Use.Machine.run → Return.reset → Return.earnings →
  SectorChange.committed`).
- (iii): `YM.PhysicalNext.Repeat.Legato.franchise`
  (`YM/MergeProof/Snow.lean:55`). From `InteractingRank.PreStand`,
  `Soft.Shops K s k P μ`, a size condition and an eventual-membership
  condition, it enlarges a waiting window `J` to `U` and gives the four
  price conditions frequently, for every family paid at `U` and every
  binding with the given prices. `Soft.Shops` is produced by `Soft.shapers`
  (`∃ M, Shops B X k p M`), whose closure contains
  `Soft.accepts_stock`, `Dyed.cardinal_spin` and 288 theorems of
  `RELATIVE_LOGDET_TRACE` [G]. This is the only place where #12's third
  package meets this cluster.
- The binding: `Legato.castle` (`Snow.lean:28`), from a
  `Roost.Factor` of the nonlinear step and a `RankCovariance.ShapePort`.
- All three, and the stress hypotheses below, are closed by
  `Legato.uv_log` (`YM/SharpGram/Assembly/Flowers.lean:75`):
  `G.Simple → 0 < b → ∃ C, …` with conclusion containing `Makes`,
  `Wcmain`, `Acme.Aroma C`, `Org.Grill`, `East.CompleteWeak` and, for every
  `f`, the conclusion of `rated` [E]. `uv_log` belongs to III.13.

**Recommendation: split in three.** The closure of `rated` has 7896 theorems
[G]; one unit cannot own it.

- *PU-11a, free covariance estimates*: `Prayer.fence`, `window_prices`.
  Statements about the free Maxwell kernel and regulators only; candidates
  for literature (symbol estimates) with project-specific uniformity.
- *PU-11b, trial systems*: `cast_off`, `wheeled`, `v_obtain_purchases`,
  `Market.Purchases`. Consumes PU-12 (`denture`, `banking`) and PU-11a.
  This is the chessboard/root-test argument.
- *PU-11c, rank identification*: `Accent.rated` from `Purchases`, `Scotia`
  and `Scrim`: the two dimension bounds, the projector conjugation, the seed.

The producers `franchise`, `castle`, `reception`/`chaletrail` are
applications of the nonlinear step and of #12's third package to the
hypotheses of PU-11c. They should not be owned by PU-11; whether they go to
PU-13 (with `uv_log`) is a question for the owner of III.13.

## Contract C — stress tensor and Ward identities (candidate PU-20, III.11 part)

**Statements** [E].

- `YM.MergeProof.Acme.readyA`, `YM/MergeProof/Emanate.lean:15`
  (III.11.6(a)). Hypotheses: `C.Makes`, `F.Ordered C S`, `F.PointLimits C S`,
  `H : S.Hierarchy`, `Cells.CellHyp C F`, `W.Inclusions S`,
  `W.Derivatives S`, **`Next.UVStress.DimAbove S`**
  (`∀ d, finrank (S.Field d) ≤ finrank ((Climb.Bel L).Field d)`), a free
  model `T : Climb.Lighthouse C.book` with hierarchy `a`, its inclusion,
  derivative and orientation laws and `FreeDiv T a p`,
  `Next.UVStress.Stations C F a.spin`, and the shell estimate `Acme.Aroma C`.
  Conclusion: `W.Orientation H.spin` and `∃ I X` with `I.J ≠ 0`,
  `I.J ∈ KernelSpace H.spin`, `Approaches (path X) (isoPanel X)`,
  `Stable … W T.W X`, `X.meter I.J T.J`, `Climb.Pre H W I.J I.p I.Y` and
  `Climb.ActLaw W T I.J H.spin a.spin`.
- `YM.Climb.Pre` [E]: `Table.Conserved V … J` (symmetric, real,
  divergence-free with respect to the plan's derivative), `Table.RawTensor`,
  and `Table.StressLaws S J p Y` (translation and rotation Ward identities:
  the shell gradient and shell spin of `J` against a window equal the
  insertion of `Y d b B`, respectively `A d g B`).
- `YM.MergeProof.Acme.annular_fieldA`, `YM/MergeProof/West/Bravo.lean:55`
  (III.11.7). For a conserved stress `J`, `v : S.Field d`, a smooth Killing
  field `U` homogeneous of degree `p`, `D + (3 + p) = d + 4` and `Aroma C`:
  `∃ B`, for all `n`, tags `q`, distinct points `x` and windows `χ`,
  `Work.A01.flux J χ (U(· - x₀)) x q v = Ward.disc (Fin.cons ⟨D, B⟩ q) x`.
  It rests on `Acme.tenet` (`West/Blanca.lean:49`: combinations of fluxes
  annihilated by all degree-`D` testers vanish) and feeds `Acme.shells_law`
  (`West/Orange.lean:33`: `∃ p Y, Table.StressLaws S J p Y`), which `readyA`
  calls [S].
- `YM.MergeProof.Acme.Aroma` (`West/Ozone.lean:16`) [E]:
  `Ribbons.Economics C`, `Stock.Tabs C.path.levels` and a `Ribbons.Note`.
  `Economics` is produced by `Ribbons.laurelE` and the note by
  `Ribbons.fugacious` (`YM/MergeProof/North/Economist.lean:23, 34`), from
  `Scrim`, `Legato.Velour`, `Tabs`, `Ribbons.Created` and `Makes`.
- `YM.MergeProof.Acme.emanate`, `Emanate.lean:31` (III.11.6(b)):
  `Aroma C → G.Simple → Org.Grill C F → East.CompleteWeak C F →
  Spec.Seed C F S → W.Inclusions S → W.Derivatives S →
  ∃ M I, I.J ≠ 0 ∧ Org.UV C F S W M I`.

**How rank feeds stress** [S, proof of `emanate`]. The free model is taken
from `Maxwell.Free.maxwell_supplies` and `UVNext.FreeStress.fire` (VI.2);
`Stations` is built by `realizes_stations` from the seed's `cutoff`,
`generic`, `ordered`, `kernel` and from `CompleteWeak`; and `DimAbove` is
`cap_given s.corrected`. Then `readyA` is applied. So the stress
construction consumes from the rank comparison exactly the inequality
`dim F_d(S) ≤ dim F_d^free` (as `RankWidths`) and the extraction fields of
the seed. Neither `readyA` nor `emanate` reaches `Accent.rated` or
`Rank.determinant` [G].

**Output to VI.1** [E]. `YM.Org.UV C F S W T₀ I`
(`YM/Org/Input.lean:177`): `basis : Spec.Seed C F S`,
`aligned : W.Orientation …`, `planet : Climb.Pre … W I.J I.p I.Y`,
`weak : Climb.ActLaw W T₀.T I.J … …`, `tables : Org.Grill C F`. Its consumer
`YM.Org.Commission.picks` has the statement
`Spec.Calibrated C → V.Inclusions S → V.Derivatives S → Org.UV C f S V W I →
Nonempty (Spec.Final C f S)` [E]. `YM.Climb.comparison`
(`YM/Climb/Beams.lean:53`): `Climb.ActLaw P T J h a → Maxwell.Ranks S h` [E];
it is reached from `SharpGram.coordination` through `Acme.glistens →
Org.Commission.picks` [G].

**Recommendation: two units inside PU-20's III.11 share.**

- *PU-20a, Ward flux*: `tenet`, `annular_fieldA`, `shells_law`, with
  `Aroma` as a stated hypothesis. Self-contained given the shell estimate.
- *PU-20b, stress from the free comparison*: `readyA` and `emanate`, citing
  PU-20a, VI.2 for the free model, and PU-11 only for `RankWidths`.

The shell estimate (`laurelE`, `fugacious`; closure 2411 theorems, mostly
`MergeProof/North` [G]) is a third, separate argument. It is not a stress
statement and should not be absorbed into PU-20 without its own audit.

## Handoff table

| Candidate | Owns | Needs (statement) | Hands on (statement) | Consumer |
| --- | --- | --- | --- | --- |
| PU-12 | `Rank.determinant`, `protection`, `HaarBudget`, `exists_budget`, `Station.affordable`, `Station.Meets`, `Station.ticket` | `RG.Rep.Lawful`; stage data of `RG.Levels` | the two inequalities of Contract A | PU-11b via `Soft.denture`, `Ship.banking` |
| PU-11a | `Prayer.fence`, `RankCovariance.window_prices` | free covariance and regulator family (III.3) | pair-term and window bounds | PU-11b; `RankCovariance.Tender` |
| PU-11b | `Soft.cast_off`, `Soft.wheeled`, `Soft.v_obtain_purchases`, `Market.Purchases` | PU-12, PU-11a, the four price conditions frequently | `Market.Purchases Z` | PU-11c |
| PU-11c | `Accent.rated`, `Maxwell.Ranks`, `Spec.Seed` (as output) | `Scotia`, `Scrim`, price conditions, PU-11b, extraction (IV.1) | `Spec.Seed`, `Maxwell.Ranks` | PU-20b (`RankWidths` only); VIII.1 |
| PU-20a | `Acme.tenet`, `Acme.annular_fieldA`, `Acme.shells_law` | `Acme.Aroma`; conserved `J`; VI.1 windows and flux | `Table.StressLaws` | PU-20b |
| PU-20b | `Acme.readyA`, `Acme.emanate` | `DimAbove` (from `RankWidths`), `Stations`, free model (VI.2), PU-20a | `Org.UV` | VI.1 (`Org.Commission.picks`) |
| *unowned* | `franchise`, `castle`, `reception`, `chaletrail`; `laurelE`, `fugacious`; `Soft.shapers`, `Soft.soluble`, `Soft.accepts_stock` | nonlinear step (#13), #12 package 3 | hypotheses (i)–(iii) of PU-11c and `Aroma` | `Legato.uv_log` (III.13) |

**Formal versus conceptual order.** No reference cycle was found among the
anchors of the table [G]: PU-12 and PU-11a reach nothing else in it; PU-11b
reaches PU-12 and PU-11a; PU-11c reaches PU-11b; PU-20a reaches nothing in
PU-11 or PU-12; PU-20b reaches PU-20a and VI.2 only. The conceptual order
PU-12 → PU-11a → PU-11b → PU-11c → PU-20b, with PU-20a parallel, coincides
with the reference order. The apparent cycle "stress needs ranks, VI.1
derives ranks from the action law" (finding 5) is not a formal cycle,
because the stress construction needs only the upper bound on dimensions.

## Obstructions and requested follow-up

1. **Hypothesis bundles are not unfolded.** `Scrim`, `Tapes.Cohesion`,
   `RankCovariance.Tender`, `Tapes.Metering`, `Soft.Timing`, `Ceremony`,
   `LanternMarks`, `Soft.s_supplies`, `Soft.Travels_`,
   `Cells.Columns.Trials.Valid`, `Stations.Admissible`, `Climb.Track`,
   `Ribbons.ShellNode`, `Soft.Tissue`, `Extract.Base`, `Extract.Projected`,
   `Extraction.Wcmain`, `Soft.Available`, `Soft.Kraft` were seen as names in
   elaborated statements only. Every sentence above that describes their
   content is taken from the external outline and is unverified.
2. **Which `Maxwell.Ranks` is used downstream** (finding 5). `Ranks` occurs
   in the value of at least twenty-five declarations, among them
   `SharpGram.coordination`, `Trace.agora` and
   `RemainderComparison.Chron.commissioned` [G]. Their source was not read.
3. **The role of #12's third package is located but not stated.**
   `Soft.accepts_stock` (`∀ᶠ s, Soft.Kraft J i P D W d s` under
   `Pump.Granite` and `Wax.Peaking` eventually [E]) and `Soft.soluble`
   (`∃ n, ∀ L ≥ n, Soft.Available P L i` [E]) are the consumers of
   `Vale.land`/`Pump.foreshadows`. What `Available` asserts, and therefore
   what determinant statement PU-11 actually needs from #12, is open. This
   is the border that #12 proposed at `Port.book_price`; it should be agreed
   with #12's author once `Available` is unfolded.
4. **V.3.** The issue asks for the data consumed by the stress tensor in
   V.3/VI.1. The external V.3 outline does not cite III.11, `readyA`,
   `emanate` or `Org.UV`; it lists `Spec.Seed` as an input from IV.1. No
   Lean consumer in V.3 was searched for. The VI.1 handoff is `Org.UV`.
5. **Notation**, referred to #10: `F_d(S)` (`S.Field d`) versus the label
   space `C.label d` and its coordinate space; `Maxwell.freeTable` versus
   `Climb.Bel`; "rank widths", "trial system", "seed"; the two determinants
   of finding 2; `protection` (per-site price) versus `Station.ticket`; the
   stress `J : Axis → Axis → S.Field 4`, the Ward rows `p`, `Y`, and the
   sign convention of `Work.A01.flux`.

## Literature leads (unverified)

None was opened in this session; all are taken from the external outline's
list and must be checked before use.

- Contract A: axial (tree) gauge on a torus and invariance of Haar measure
  (Seiler, *Gauge Theories as a Problem of Constructive Quantum Field Theory
  and Statistical Mechanics*, LNP 159, 1982); volume of small balls in a
  compact Lie group. The specific budget with `g^{-4 dim G}` is
  project-specific.
- Contract B: the chessboard estimate (Fröhlich–Israel–Lieb–Simon, Comm.
  Math. Phys. 62, 1978) and reflection positivity of the Wilson action
  (Osterwalder–Seiler, Ann. Phys. 110, 1978) for PU-11b; symbol estimates
  for PU-11a. The frequent-scale diagonal argument and the projector
  conjugation appear to be project-specific.
- Contract C: Ward identities for a conserved symmetric stress tensor and
  Killing fields are standard in form; the flux-on-shrinking-annuli argument
  with finite faithfulness of testers appears to be project-specific.

## Evidence

Inspection used a sibling checkout of the upstream project at commit
`1dba6965d734bac06951579601b90e985033ee45`, which adds only a CI workflow and
`.gitignore` to `3456e5e`; `diff -rq <checkout>/YM Lean/YM` printed nothing
(run earlier the same day). It contains a completed build with toolchain
`leanprover/lean4:v4.32.0`. The build was not rerun.

- **[E]** `lake env lean b1.lean` (about 50 s, no errors): `#check @` of
  `Rank.determinant`, `exists_budget`, `Station.affordable`, `Soft.denture`,
  `Ship.banking`, `Prayer.fence`, `window_prices`, `Soft.cast_off`,
  `Soft.wheeled`, `Soft.v_obtain_purchases`, `Accent.rated`, `franchise`,
  `castle`, `reception`, `chaletrail`, `Acme.readyA`, `Acme.emanate`,
  `Acme.annular_fieldA`, `Acme.tenet`, `Acme.shells_law`, `laurelE`,
  `fugacious`, `Climb.comparison`, `jointOffers`, `uv_log`, `Pump.issued`;
  `#print` of `protection`, `HaarBudget`, `ent`, `strength`,
  `Maxwell.Ranks`, `Spec.Seed`, `Scotia`, `Aroma`, `DimAbove`, `Stations`,
  `Economics`, `Org.UV`, `Org.Grill`, `Chateau`, `Tender`, `Metering`,
  `CompleteWeak`. `#print axioms` gives
  `[propext, Classical.choice, Quot.sound]` for `Rank.determinant`,
  `Station.affordable`, `Accent.rated`, `Acme.readyA`, `Acme.emanate`,
  `Acme.annular_fieldA`, `Legato.uv_log`, `Soft.wheeled`.
- **[E]** `lake env lean b2.lean` (no errors): `#check @` of `East.posters`,
  `Soft.y_poster`, `Soft.shapers`, `Soft.soluble`, `Soft.accepts_stock`,
  `UVStress.cap_given`, `Org.Commission.picks`, `Acme.glistens`,
  `UVStress.produce_current`, `Maxwell.Free.maxwell_supplies`; `#print` of
  `Soft.Vents`, `ShowHours`, `Soft.Shops`, `Soft.s_provisions`,
  `Market.Purchases`, `Cells.RankWidths`, `Climb.Pre`, `Climb.ActLaw`,
  `Table.StressLaws`, `Org.IR`, `Org.MaxwellData`, `Org.Commission`,
  `Table.Conserved`, `Table.Stress`. `Station.Meets` and `Station.ticket`
  were printed in the review for issue #29.
- **[S]** `sed -n '10,50p' YM/MergeProof/Emanate.lean` (statements and full
  proofs of `readyA` and `emanate`). No other proof body was read.
- **[G]** `graph-compiled/{nodes,refs}.tsv` in the same checkout: an
  untracked local artifact whose generation was not audited. Three Python
  scripts computed forward reference closures, shortest reference paths and
  per-directory theorem counts of closures. **Private declarations must be
  followed**: a first run that kept only destinations whose name starts with
  `YM.` missed every path through a `_private.YM…` declaration and wrongly
  reported `window_prices` as unreached from `uv_log`; all [G] claims above
  are from the corrected run. Every "does not reach" claim should be
  reproduced by the reviewer.
- Names were resolved from the external outline's links to file and line and
  then to fully qualified names through `nodes.tsv`; each name cited with
  [E] was subsequently elaborated.
- Overlap search: open issues and PRs at 2026-11-11 22:52 UTC;
  `blueprint/interfaces/gaussian-sector.md` (#12) and the draft
  `nonlinear-rg-step.md` (PR #30, #13) were read for their handoffs.

**Not done:** no proof body other than `readyA`/`emanate`; none of the
bundles in obstruction 1; no V.3 or VI.1 source beyond the statements named;
the internal lemmas of `Determinant.lean` and `Axial.lean`
(`vacuum_bound`, `numerator`, `elimination`, …) were located but not
elaborated; no literature source was opened; the Lean project was not
rebuilt.

Agent assistance: Claude Code, directed by `mgubi`. Navigation leads are due
to Scott Armstrong's Yang–Mills informalization project.
