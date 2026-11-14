# Independent review of PR #349: stored terminal voice and one Music on it (#318)

- Session: `ADB991-claude-20261114-65a9` (Claude, scheduled agent on behalf of ADB991).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/318#issuecomment-6868395886
- Role: independent review covering both the mathematics and the textual Lean correspondence.
  - ADB991 did not author PR #349 or any hunk of `sec:selected-terminal-voice`.
  - ADB991 did author the later subsection `sec:selected-zero-coordinate-coupon` of the same file (#340, #351). That
    subsection is outside this review; it is read only for the definitions of the terminal format and of a Tale.
  - This report authors no manuscript hunk.
- Reviewed object: `manuscript/existence/selected-centered-service.tex` at git blob
  `e1d3037dd27c8a1e556d2f03962c2be71fd1f7b4`, identical at the PR head `4258e35` and at the merge commit `97f806c`
  on `codex/existence-monograph`. The new text is the pointer at l.358–362 and the subsection at l.385–631. SHA-256
  values are in `hashes.json`.
- Also read: the author note `results/C12/author/hairer-claude-318-20261114/README.md`;
  - `terminal-marked-construction.tex` (in full, including `prop:terminal-marked-voice`);
  - `wilson-startup-construction.tex` l.225–270 and `prop:wilson-startup-family` (l.335–420);
  - `selected-centered-service.tex` l.20–60 and l.175–190 (history choice and door addresses) and l.702–720 (terminal
    format, Tale);
  - `centered-freight-producer.tex` l.100–200 (`ex-freight-backward` and the normalization);
  - `common-observable-purchases.tex` l.238–283 (fee purchase, camera constant).
- Lean pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean evidence here is textual. Nothing was elaborated.
- Build: the monograph `existence.tex` at `97f806c` builds out of tree with `latexmk -pdf` (exit 0, 1022 pp, no
  undefined references). Pages 698–701 (the new subsection) were rendered and inspected.

## Verdict

**The induction and the top-voice conclusions are correct. One required change (M1), one should-fix (S1), and minor
N1–N4.**

- `prop:selected-terminal-voice` is correct on its stated scope. Each of the four hypotheses of
  `prop:terminal-marked-voice` is discharged by a cited result, apart from the eligibility clause in hypothesis (2)
  (S1).
- The downward induction in `prop:selected-music` is correct and matches `YM.MergeProof.compose` step for step.
- **M1.** The manuscript's definition of a *heard* voice is weaker than the source's `Heard`. It omits four clauses
  that the one-step construction consumes and that the transfer normalization needs. As a result:
  - (RS) as stated is a stronger input than the source step `YM.MergeProof.repriseQ` provides;
  - the final paragraph of `prop:selected-music` ("a valid choice of the finite transfer data, normalized by its
    reference readout") does not follow from the properties the proposition lists.

  The fix is local. Add the four clauses to the definition, and export them for the top voice from
  `prop:terminal-marked-voice`, which already proves them.

## Mathematics

### `prop:selected-terminal-voice` (l.429–520)

**Hypothesis (1), lawfulness at w = w^f_N.** Correct.
- I checked the allowance arithmetic. `wilson-startup-construction.tex` l.258–262 sets s = log β̂,
  M = e^{(log s)^2} and δ_K = e^{−M^{1/5}} = exp{−exp((log log β̂)^2/5)}.
- This is exactly w(β̂) of `terminal-marked-construction.tex` §3.
- The forced-cost bound "≤ δ_K" is part of `prop:wilson-startup-family`. Its second part also lists "the arrays
  satisfy the stage bounds at the allowances δ_E, δ_K" among the retained-history conditions, which is the cleaner
  citation (N2).

**Hypothesis (2), reserved addresses.**
- Support, inventory, the infinite supply (one per natural number) and the zero coefficient: correct. These are the
  final sentences of the first part of `prop:wilson-startup-family`.
- Eligibility: not supported by a cited result. Hypothesis (2) also requires that the additional predicate of a
  reserved address holds whenever X ∩ flags(U) = I. See **S1**.

**Hypothesis (3), sound section and camera bound C_d ≥ 1.** Correct. The camera constant is recorded in
`common-observable-purchases.tex` l.281–283. Soundness of the grade-d local section is asserted without a citation
(N3).

**Hypothesis (4), fee.** Correct.
- d ≤ J(N) follows from d + 3 ≤ J(t_d) ≤ J(N), using monotonicity of J.
- The fee purchase is `common-observable-purchases.tex` l.246–262 ("this is the fee inequality of
  prop:terminal-marked-voice").
- With that purchase, the final sentence of `prop:terminal-marked-voice` is no longer conditional here.

**Conclusions (1)–(3).** Correct. They are the definition of the marked coefficient together with assertions (3) and
(4) of `prop:terminal-marked-voice`.

**Conclusion (4), heard at N.** Correct for the five clauses the manuscript lists.
- Format: the origin lies in Y ⊆ T_b. Eligibility comes from assertion (1) together with hypothesis (2).
- Remainder: take a_r = 0 and a_f = ‖core v‖₁. Then Σ_b mass(T_b, ·) ≤ √w·a_f by assertion (2), with mass(X, e) =
  M(X)e at level N.
- The cone bound uses s_N ≥ 1. Subadditivity is the triangle inequality. Index covariance holds because x = id.

Profile covariance is correct. The argument is the one given in the PR's second sentence: f_{g·v} = g·f_v, and the
attachment on Y is transported together with the footprint. This is also the source route (N1).

### (RS) and `prop:selected-music` (l.522–616)

The induction is correct.
- Stage N uses the zero voice below N.
- Stage k replaces only level k.
- Clauses (2) and (3) at levels above k concern only V_{k+1}, …, V_N and the doors D_{k+1}, …, D_{N−1}, which are not
  modified.
- The base case needs profile covariance at N, which conclusion (4) of the previous proposition supplies.

The Carol data match `YM.MergeProof.Carol` (`Largo.lean` l.13–14):
- one finite wing for all v;
- factor L_m^d;
- the upper exponential entry and profile, and the lower profile;
- coordinate `(V.index v) 0`, that is the e_0 coordinate, called "unit coordinate" in the text (N4);
- input price `orbitCost F * coeffSize (V.index v) * (t + 2·columns_{m+1})`, where `coeffSize` is the ℓ¹ norm
  (`Labels/Reference.lean` l.128) and t = `waybill A.B.a m` = ψ_m (`Marco.lean` l.25–28);
- output price `Q.charge v`.

**M1 (required): "heard" omits four clauses of the source `Heard`; (RS) and the final paragraph depend on them.**

The source structure `YM.Extra.Histories.Heard` (`Extra/SOURCE_HISTORIES/Replay.lean` l.32–42) has nine fields. The
manuscript's "heard" (l.409–421) has five of them: `earns`, `currents`, `cone`, `summed` and `moves`. Together with
"complex-linear family" in the definition of a voice, it also covers part of `book`. It omits the following.

1. **`book : Ledger F _ V.plays`** (`Pencil.lean` l.83–87). The lead, the regular part and the forced part are
   complex-linear in v, and **the supports do not depend on v**: `(P v).support = (P 0).support`. Linearity is implicit
   in "complex-linear family"; the fixed-support clause is absent.
2. **`unit : V.index (unitVec F H N) = unitVec F H m`**, where `unitVec F H m = a_m^d·e_0` (`Source/Insertion.lean`
   l.82). This is the scale normalization of the vacuum coordinate.
3. **`values`**: the density is complex-linear in v.
4. **`travels`**: density covariance. For every motion y, signed or with complex conjugation,
   `dance y (density V(v)) = density V(y·v)`.

In addition, the source `Voice.index` is a linear **equivalence** `F ≃ₗ[ℂ] F`, while the manuscript says "a linear
coefficient index x(v) ∈ F".

Why these clauses matter:

- **(a) The source step needs them as hypotheses on V'.** `repriseQ` (`Renaissance.lean` l.39–) uses:
  - `hq.values` and `hq.travels`, for linearity and motion covariance of the pushed density (`blast_march`, `hM`);
  - `hq.travels`, again inside `chanting` (`Jubilee.lean` l.23), to move the exponential entries of the Tale witnesses;
  - `hq.book`, through `expoLinear`/`inkL`, for the Tale input series;
  - `hq.unit`, for the output's `unit` field.

  The source step does not apply to a V' that satisfies only the manuscript's five clauses. So (RS) as worded is a
  strictly stronger input than what the source proves. A future supplier following the source cannot discharge it
  verbatim.
- **(b) The induction must carry them.** `repriseQ` re-proves all nine fields for its output, and `compose` keeps
  `Heard` at every level (`Sung.earned`). If (RS) only promises the five-clause "heard", the next step cannot be
  applied.
- **(c) The final paragraph of `prop:selected-music` needs them.**
  - `Lemma ex-freight-backward` and the normalization (`centered-freight-producer.tex` l.160–169 (one-step index isomorphism), l.171–180 (the lemma) and l.182–190 (normalization)) use
    that every voice index is an isomorphism ("since ι is an isomorphism"), the reality/motion properties of the
    densities, and the linear transfer system.
  - In the source, `Sung.clocks` (`Song.lean`) builds `Paper.Clocks` from exactly `currents.trans unit` (the vacuum
    coordinate is a_m^d e_0 at every scale), `book` (linearity of x, regular, forced and fixed tags), and `travels`
    and `moves` (reflection and motion).
  - With the five-clause definition, "the plays of this Music are therefore a valid choice of the finite transfer
    data" is not justified.

Suggested fix, local to this subsection:

- Add four bullets to the definition of a heard voice:
  - "x is a linear isomorphism of F";
  - "the lead, regular and forced parts of V(v) are complex-linear in v, and their supports do not depend on v";
  - "x(a_N^d e_0) = a_m^d e_0";
  - "dens V(v) is complex-linear in v, and for every signed motion g, with or without complex conjugation,
    g·dens V(v) = dens V(g·v)".
- In the proof of `prop:selected-terminal-voice` (4), add the corresponding one-line verifications:
  - linearity of the three entries is the first conclusion of `prop:terminal-marked-voice`;
  - the forced support of the address s(b) is T_b for every v;
  - x = id gives the unit clause;
  - density linearity follows from (T5);
  - density covariance is assertion (5).
- (RS) then reads as in the source, and the last paragraph of `prop:selected-music` follows.

**S1 (should fix): the eligibility of reserved forced labels is not a cited result.**

- The proof of hypothesis (2) (l.474–490) takes "the additional predicate of such a label is the flag condition"
  from "the construction of the dictionary recalled in the first subsection" of `sec:terminal-marked-construction`.
- That subsection itself says (after `prop:terminal-marked-voice`) that it "only recalls why the dictionary can carry
  such addresses, and the realization of the property on the selected history must be supplied by the
  history-selection construction".
- `prop:wilson-startup-family` states only support, inventory, the infinite supply and the zero coefficient.
- So the eligibility clause still rests on a recollection. This is consistent with
  `original-history-portfolio-attachment.tex` l.139–144, which the author note flags.

In the source the clause is a lemma about the fixed dictionary:
- `YM.Progress.DirectedRecipe.tile_test` (`Pellets.lean` l.207–211) states that the `extraTest` of the reserved
  address `sleepK (x, j)` is equivalent to x.support ∩ flags = x.inventory;
- `HasSlots.forced : A.forced = addr (folio G n) P` (l.216–220) places the selected top representation on that
  dictionary;
- `Keeper.pass` is then immediate.

Suggested fix: add the eligibility statement, with this one-paragraph proof, to the reserved-label sentence of
`prop:wilson-startup-family`. A reserved forced label is a group consisting of a single reserved hard label, and its
test is the original test for that single shape. Then cite it here. This needs a separate author scope on
`wilson-startup-construction.tex`.

**N1.** Lines 510–515: "Profile covariance at N follows from assertion (5) …" Assertion (5) concerns densities. The
profile covariance follows from assertion (4) together with the covariance of v ↦ f_v and of the attachment on Y. The
PR's next sentence gives this. The source route is the same: `MergeProof.voice` (`Inception.lean` l.35) uses `onRise`
together with `hooked` and `drive`. Suggest dropping "assertion (5)", or citing the covariance paragraph at the end of
§2 of `terminal-marked-construction.tex`.

**N2.** Hypothesis (1): cite the retained-history condition of `prop:wilson-startup-family` (second part: stage bounds
at δ_E, δ_K) rather than the packet majorant in its proof. Also state that the exponent and cover radius in (T3) are
the support exponent E and radius B of level N. I did not trace the definition of "forced cost" back to its stage
convention. Note that the source does not go through the startup family here: it takes lawfulness at
w = forcedAllowance N from `H.Selected` (`represents … .good`, used in `onTop`). The manuscript's route is a
legitimate reorganization.

**N3.** Hypothesis (3): cite where the soundness of the grade-d local section is established. In the source this is
`sound G d`, used in `Bandage.squad`.

**N4.** "The unit coordinate of x'(v)" (l.531) is the e_0 (vacuum) coordinate, `(V.index v) 0`. Saying "e_0
coordinate" would avoid confusion with the unit vector a_m^d e_0 of M1.2.

## Lean correspondence (textual)

| Manuscript | Source at pin | Check |
| --- | --- | --- |
| Voice; heard | `Extra.Histories.Voice`, `Heard` (`Replay.lean` l.26–42) | five of nine clauses (M1) |
| Profile covariance | `MergeProof.Chorus.pages` (`Jubilee.lean` l.18–19) | matches |
| Stored top voice; OnTop exports | `Guard.summit` / `Guard.summon` (`Guards.lean` l.283–328) → `OnTop` (`Song.lean`) | matches: heard, out, germ, cost ≤ ‖core v‖₁, earns (T5) |
| Hypotheses (2)–(4) on the run | `Bandage.squad` (`Marco.lean` l.30–49): `Keeper.sufficient (h.born N p)`, `Keeper.blank`, `sound G d`, `Doors.cameras_ge/holds`, `(b.clock.sequences N d he').receipts p 0` with d ≤ J(N) | matches; eligibility via `tile_test` (S1) |
| Singleton hook | `Bandage.nectar` (`Gist.lean`) → `onRise` (`Alpaca.lean` l.43) | matches |
| Carol | `MergeProof.Carol` (`Largo.lean` l.13–14) | matches (coordinate: N4) |
| One Music by downward induction | `MergeProof.compose` (`Largo.lean` l.22–63) | matches step for step |
| (RS) | `MergeProof.repriseQ` from `Tune` (`Renaissance.lean`) | source hypotheses on V' include the four omitted `Heard` fields (M1) |
| Stored entries = plays | `Bandage.Freight` (`Marco.lean` l.25–28): `Xf.entries = (Z.draft H).inits` | matches; uses `Sung.clocks` (M1 (c)) |

Remark on framing: in the source, (RS) is not an open input. `repriseQ` proves it from the per-door `Tune`, and
`Bandage.chorus` (`Escarp.lean`) supplies `Tune`. The PR states this accurately: "It is not derived in this monograph
on the selected replay". It also correctly maps (RS)'s ingredients to (K) of `prop:selected-zero-coordinate-coupon` and
to the #317 slot attachment.

## Checks run

- `python3 scripts/check_blueprint.py` on this report branch: "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` at `97f806c`: exit 0, 1022
  pp, 0 undefined references. pp. 698–701 inspected as rendered PNGs.
- Lean: textual reading only. No `lake build` was run: the Mathlib hosts are blocked in this sandbox.

## Next

- Author response to M1 (and S1, N1–N4) under a new author scope on #318. S1 touches `wilson-startup-construction.tex`.
- After the M1 fix, a renewed check by an account other than the author.
