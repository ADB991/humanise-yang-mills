# Review of work package C04: Lean correspondence

- Unit: work package C04 "Analytic continuation and relativistic reconstruction" of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C04/`.
- Role: Lean correspondence.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: four Codex `gpt-6-astra` read-only review passes by chapter group (A: complex-heat, analytic-boundary, heat-vectors; B: fourier-support, spectral-measure, boundary-detection; C: label-descent, lorentz-covariance, full-tube; D: reconstruction, locality, cross-chapter consistency and ledger), verified and synthesised by a Claude agent. Session `schmittj-codex-c04-review-20261112`.
- Content SHA-256: a package has no single unit fingerprint; the eleven chapters and six author reports reviewed are listed with their SHA-256 in `mathematics.md` (same files, same hashes; recomputed unchanged at the end of the review, see `validation.md`). The correspondence table for the unchanged chapters, `blueprint/units/YM-000026/reconstruction-evidence.md`, was read at SHA-256 `432b7c0b84c8a2f6a7469b6ae395942515b2caaa5020b3b614a29ef81d02a496`.
- Manuscript files and labels: the eleven chapters `complex-heat.tex`, `analytic-boundary.tex`, `fourier-support.tex`, `label-descent.tex`, `lorentz-covariance.tex`, `full-tube.tex`, `heat-vectors.tex`, `reconstruction.tex`, `boundary-detection.tex`, `spectral-measure.tex`, `locality.tex` in `manuscript/existence/`; labels as listed in `mathematics.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All Lean text quoted below was read from `Lean/` in the worktree; the eight files opened for the confirmed findings match `Lean/SOURCES.sha256` (see `validation.md`).
- Review task and PR: issue #45; author PR #66 (merged); reviewed at branch commit `18d0327` (`18d0327ae5b19d869000209b7490e59fda09c3c2`).
- Outcome: changes requested for the author's `correspondence.md` and `ledger.md` and for `reconstruction-evidence.md` (reference and description errors in the audit record). For the eleven chapters no mismatch between a manuscript statement and the pinned source was confirmed; the chapters are "accepted locally, conditional on stated dependencies" only in the sense of this agent review, which is a textual reading without elaboration. No human acceptance is recorded.

## Findings and evidence

Status vocabulary as in `mathematics.md`: CONFIRMED, REFINED, UNDECIDED, and "carried over" for reviewer findings not re-verified. Qualified names are read off the `namespace` blocks of the source files; nothing was elaborated, so implicit arguments, instances and universe levels were not inspected by Lean.

### L1. Wrong defining file and incomplete description of `YM.Bid.C08` in the author's correspondence (C-II-1 labelled ERROR; B-II-2 and D-II-1 labelled INACCURACY). Status: facts CONFIRMED; severity REFINED to a reference error in the audit record.

Location: `results/C04/correspondence.md` line 18: "Hypothesis C08 = Schwartz continuity of the pullback | `YM.Bid.C08` (consumed as `H.1`) | `Lean/YM/Bid/Grow.lean` | statement name only".

Lean text. `Lean/YM/Bid/Corners.lean` lines 99–101 (namespace `YM.Bid`):

```lean
def C08 : Prop := (∀ n (f : Joint n), Continuous (fun p : Poincare => Joint.gpush n p f)) ∧ ∀ n (f : Joint n) a,
    Tendsto (fun i : ℝ => i⁻¹ • (Joint.gpush n (Poincare.motion ((Ray.fromAxis a).boost i)) f - f))
      (𝓝[≠] 0) (𝓝 (-inclined a 0 f)) -- strong Schwartz topology
```

`Lean/YM/Bid/Grow.lean` does not define `C08`; its line 50 takes it as the first premise of `C28` (`def C28 : Prop := C08 → ∀ ...`). The only use in `Lean/YM/Work/C28.lean` is line 43, `exact (Probe.along E.symm).continuous.comp (H.1 _ _)`, the continuity conjunct.

Assessment. All three reviewers are right on the facts: the path is wrong and `C08` is a conjunction (continuity of the simultaneous pullback, and the strong Schwartz derivative along coordinate boosts), which is exactly the two assertions of `lem:schwartz-motion`. The row's last column honestly says "statement name only", and its "consumed as `H.1`" is correct, so no mathematical correspondence is wrong; the manuscript lemma proves both conjuncts. The label ERROR (report C) is too strong.

Requested change: path `Lean/YM/Bid/Corners.lean` l.99–101; description "first conjunct of `YM.Bid.C08` (continuity of \(g\mapsto P_gf\) in the joint Schwartz space), consumed as `H.1`; the second conjunct is the boost derivative of `lem:schwartz-motion` and is not used by C28".

### L2. `Urs W K` is the conclusion of `thm:lorentz-covariance`, not its hypotheses (C-II-2 labelled ERROR). Status: REFINED.

Location: `results/C04/correspondence.md` lines 27–30: "Hidden instances/coercions in `Urs` and `Descends` were not opened; the reviewer should check that `Urs W K` corresponds to the hypotheses of `thm:lorentz-covariance` and `Descends`/`ties`/`commutes` to `prop:lorentz-label-descent`."

Lean text. `Lean/YM/Shift/Closing.lean` lines 83–85 (namespace `YM.Boundary`):

```lean
structure Urs (W : Surface S) (K : Spins S) : Prop where
  translation (n : ℕ) (v : Fin n → S.Union) (x : Joint n) (a : E4) : W.W n v (Joint.gpush n (Poincare.translation a) x)=W.W n v x
  rotation (n : ℕ) (v : Fin n → S.Union) (x : Joint n) (r : Lorentz) : W.W n (fun i => K.rail r (v i)) (along (togetherL r _).symm x) = W.W n v x
```

`Lean/YM/Bid/Corners.lean` lines 103–106: `def C09 : Prop := A16 → C08 → ∀ ... , Y.Region T → Y.Breathes → Boosty R Y → Y.NonTangentialFree W → Urs W K`.

Assessment. `YM.Boundary.Urs W K` is translation invariance of the boundary distributions together with covariance under every `r : Lorentz` with the label action `K.rail`; these are the two conclusions of `thm:lorentz-covariance` (`lorentz-covariance.tex` lines 146–155), and `YM.Bid.C09` has `Urs W K` as its conclusion. With `Probe.along E f x = f (E x)` (as used in `C28.lean` lines 39–41), `along (togetherL r _).symm x` is \(P_\Lambda f\), so the `rotation` field reads \(W_n(\rho(\Lambda)v)(P_\Lambda f)=W_n(v)(f)\), the manuscript's formula with the same direction. The reviewer is therefore right that "hypotheses" is the wrong word. Two qualifications: the quoted sentence is a request to the reviewer, not a row of the correspondence table, and the table row at line 16 states the direction correctly ("`expect_po` (uses `Urs.translation`, `Urs.rotation`)"); and the manuscript corollary `cor:word-motion-inputs` legitimately assumes "the hypotheses of Theorem `thm:lorentz-covariance`", which imply `Urs` through that theorem. The manuscript corollary is thus a (valid) composite of C09 and C28 rather than a literal match of C28. No circularity results. The label ERROR is too strong; this is an imprecise sentence in the audit record.

Requested change: in `correspondence.md` write "`Urs W K` = the two conclusions of `thm:lorentz-covariance` (translation invariance; Lorentz covariance with \(P_\Lambda\)); it is produced by `YM.Bid.C09` and consumed by `YM.Bid.C28`. The manuscript corollary assumes the hypotheses of the theorem and uses its conclusions."

The second half of the author's request is answered here: `YM.Boundary.Spins.Descends` (`Lean/YM/Fields/Star.lean` lines 26–35) has fields `ties` (the union action `rail` restricts to `shell d` on each level: compatibility with inclusions), `identity`, `representation`, `spin` (continuity of `fun x => X.shell n x v` for each level `n` and vector `v`), `boosts` (derivative at \(0\) of the coordinate boost equal to `(-I) • R.lie n (Ortho.plane timeAxis i.castSucc) p`), `spatial` (agreement with `R.act` on spatial rotations) and `commutes` (`S.adj h d timeAxis (X.shell d g v)=X.shell d g (S.adj h d timeAxis v)`). These are the conclusions of `prop:lorentz-label-descent` (commutation with inclusions, one action on the union, continuity on each level, spatial action Euclidean, boost generator \(-iL_{d,a}\), commutation with \(J\)), with \(J\) the time-axis adjoint.

### L3. Anchors for the locality chapter name private helpers and compress a namespace (D-II-2 labelled INACCURACY). Status: CONFIRMED.

Location: `blueprint/units/YM-000026/reconstruction-evidence.md` lines 154–159: "Exact main declarations are C17.local_paths/height_path/answer; ... C19.paneAlong/answer; ... `YM.Boundary.NearPair.Panes.reaches`, `forgets`, `actor`; and C27.exchange/answer."

Lean text. `Lean/YM/Work/C17.lean` line 173 `private theorem local_paths`, line 247 `private theorem height_path`, line 277 `theorem answer : YM.Bid.C17`; `Lean/YM/Work/C19.lean` line 161 `private lemma paneAlong`, line 213 `theorem answer : YM.Bid.C19`; `Lean/YM/Work/C27.lean` line 28 `private theorem exchange`, line 87 `theorem answer : YM.Bid.C27`. In `Lean/YM/Shift/Exchange.lean` (namespace `YM.Boundary`, then `NearPair`, lines 12–17) line 43 is `theorem Panes.reaches`, line 68 `theorem Panes.forgets`, and line 92 `theorem actor (X : Aurora W D) ...`, so the names are `YM.Boundary.NearPair.Panes.reaches`, `YM.Boundary.NearPair.Panes.forgets` and `YM.Boundary.NearPair.actor`.

Requested change: mark the four private helpers as file-local (path and line), keep the public `YM.Work.C17.answer`, `YM.Work.C19.answer`, `YM.Work.C27.answer`, and spell out `YM.Boundary.NearPair.actor`. This is a defect of the audit record only.

### L4. Two statements of `complex-heat.tex` are valid strengthenings or reorganisations of the cited declarations and are not marked as such (A-II-2 labelled INACCURACY). Status: CONFIRMED.

Locations: `complex-heat.tex` lines 28–30 ("Every bounded operator commuting with all \(E_t\) commutes with \(E(z)\) and \(V(t)\)") and lines 118–123 (`lem:time-fixed-heat`: "The vectors fixed by every \(V(t)\) are exactly the vectors fixed by every \(E_s\)"); `reconstruction-evidence.md` rows at lines 11 and 14.

Lean text. `Lean/YM/Heat/Rows.lean` line 133 (namespace `YM.OS.Semigroup`):

```lean
lemma stays {z} (_ : z∈ inside) (s : Cross a) : (S.F z).comp (S.U s)=(S.U s).comp (S.F z) := by
```

This is commutation with the supplied spatial translations `S.U s` only. `Lean/YM/Fields/Spectrum.lean` line 64 (namespace `YM.Boundary`):

```lean
lemma offiero (x : H) (h : ∀ t : ℝ, U.unit.translation (t • basis a) x=x) : x∈U.ground := by
```

This is one implication (time-translation-fixed implies heat-fixed). The manuscript proves the general commutant statement by polynomial approximation (lines 95–98) and both implications of the fixed-vector lemma (lines 124–131); I read both arguments and they are correct. The evidence file records the halving proof of injectivity as a variant but not these two differences.

Requested change: in `reconstruction-evidence.md`, note that the arbitrary-commutant clause generalises `YM.OS.Semigroup.stays`, that `YM.Boundary.offiero` is the implication "fixed by \(V\) implies fixed by \(E\)" and that the converse is proved in the manuscript directly from the functional calculus.

### L5. The premise "original null space contained in selected null space" used by the source is not recorded in the ledger (A-II-1 labelled INACCURACY). Status: Lean facts CONFIRMED; the proposed manuscript producer is carried over.

Location: `results/C04/ledger.md` lines 39–44; consumed at `analytic-boundary.tex` lines 15–24 and `heat-vectors.tex` lines 49–64.

Lean text. `Lean/YM/Euclid/Lift.lean` line 20 (namespace `YM.Table`): `def respects (T S : Table L) : Prop := ∀ d, S.null d ≤ T.null d`. `Lean/YM/Bid/Corners.lean` lines 23–30: `structure Pantry ... where head : S.Hierarchy; adopted : T.Hierarchy; present : T.respects S; rises : P.Inclusions S; habits : P.Inclusions T; ...`. `Lean/YM/Work/C01.lean` lines 82–83: `lemma singles_agree (P : DiffPlan S) (A : Spread V) (ht : T.Symmetric) (hr : T.respects S) (HI : P.Inclusions T) ...`, whose proof uses `inner_quotient A ht hr hp`.

Assessment. The source distinguishes the original table `S` (which defines the quotient levels and the union) from the selected table `T` (which defines the chamber), and needs \(N_{S,d}\subseteq N_{T,d}\) for the single-insertion operators on the union to be well defined. The ledger's E4 says only "selected correlations compatible with inclusions" and lists null equality separately for boundary detection. Recording the inclusion explicitly is a justified request. That `phase-regularity.tex`, `ex-phase-original-null` (label at line 69) supplies it was reported by reviewer A and not re-verified.

Requested change: add to E4 (or as its own edge) the premise \(N_{S,d}\subseteq N_{T,d}\) at every level, with its producer, distinct from the stronger null equality.

### L6. `cor:cone-support` speaks of a "finite-dimensional label representation"; the source has level-wise actions (B-II-1 labelled INACCURACY). Status: REFINED to a wording point.

Location: `fourier-support.tex` lines 103–105: "If the boundary distributions are covariant under the continuous finite-dimensional label representation of the proper orthochronous Lorentz group".

Lean text. `Lean/YM/Fields/Star.lean` lines 22–24: `structure Spins (S : Table L) where rail : Lorentz → S.Union ≃ₗ[ℂ] S.Union; shell : (n : ℕ) → Lorentz → S.Field n ≃ₗ[ℂ] S.Field n`; continuity is `Descends.spin`, per level. The support theorem is `YM.Boundary.tents` (`Lean/YM/Shift/Closing.lean` lines 106–107):

```lean
lemma tents (W : Surface S) (K : Spins S) (h : Urs W K) (hv : ∀ (v : Fin n → S.Union), dsupport (Distn.fourier (W.W n v)) ⊆ half n) (p : Fin n → S.Union) :
    dsupport (Distn.fourier (W.W n p)) ⊆ coneM n := by
```

Assessment. `tents` needs only `Urs W K` and half-space support for all label tuples; no continuity or finite-dimensionality of the label action. The manuscript phrase is shorthand for the action \(\rho\) introduced at `lorentz-covariance.tex` lines 26–28 ("a representation \(\rho\) on the field union preserving every finite level, continuous there"). The corollary is not weaker than the source in substance, since its proof also uses only covariance; the adjectives are superfluous and "finite-dimensional" is literally inapplicable to the union. Wording change as in `mathematics.md`, M10.

### L7. Outgoing edge C03-C04-to-C05 cannot be matched (A-II-3 labelled GAP). Status: REFINED; an acknowledged open edge, not a mismatch in C04.

Location: `results/C04/ledger.md` line 54: "heat continuation, field quotient, injection → C05 OPE reader | open (from known-open-edges.md)"; `handoff/known-open-edges.md`, row `C03-C04-to-C05-phases`: "Match each character's same field quotient, heat continuation, compact Ward identity and injection to the chosen OPE reader. Mixed and selected continuations remain distinct."

Assessment. The ledger marks the edge open, which is accurate. Neither the ledger nor the C04 chapters name the consumer declaration or its input type, so no correspondence can be checked. The ledger's description also omits the "compact Ward identity" item present in the known-open-edges row. The reviewer's quoted `YM.Bid.C03` (`Lean/YM/Bid/Corners.lean` lines 56–57: `def C03 : Prop := ∀ ... (B : Small S V), Slice A B → ∃ F : Waves S, Direct A B F`) is existential in `F`, so an independently chosen reader is not bound to this `F` without a further identification. Nothing in C04 is contradicted.

Requested change: none in the chapters; in the ledger, copy the full statement of the open edge including the compact Ward identity and the mixed/selected distinction, and keep it open until the C05 consumer is named.

### L8. Quantifier of the translation hypothesis in `prop:word-motion` against `Cups.time` (D-II-3 labelled NIT). Status: CONFIRMED.

Lean text. `Lean/YM/Fields/Lo.lean` line 17: `abbrev till : Filter ℝ := 𝓝[>] (0:ℝ)`; lines 37–41 (namespace `YM.Boundary`):

```lean
structure Cups (W : Surface S) (J : StarOp S) (K : Spins S) (C : Chamber T timeAxis) where
  hot : Sentence S → ℝ → C.H
  here (v w) : Tendsto (fun p : ℝ×ℝ => inner ℂ (hot v p.1) (hot w p.2)) (till ×ˢ till) (𝓝 (W.kernel J v w))
  omega : Tendsto (hot []) till (𝓝 C.omega)
  time (v b) : hot (K.po (Poincare.translation b) v) =ᶠ[till] (fun s => C.flow.unit.translation b (hot v s))
```

The eventual equality is for each fixed word `v` and translation `b`. The manuscript sentence (`reconstruction.tex` lines 180–185) leaves the word unquantified; see `mathematics.md`, M5. The producer `YM.Bid.Roof.time` (`Lean/YM/Bid/Grow.lean` line 27) gives the identity for every `k` with `0<k`, matching "for every \(t>0\)" in `cor:word-motion-inputs`. `here` is the independent two-parameter limit of `eq:independent-heat-gram`, and `omega` is weaker than the manuscript's \(h_t(1)=\Omega_E\) for all \(t\), which is fine.

### L9. A difference of route in the continuity step that the author's list of differences omits (found in this synthesis). Status: CONFIRMED; minor.

`correspondence.md` lines 21–27 list the differences between `cor:word-motion-inputs` and the source and call them routine. One is missing. The source proves continuity of \(g\mapsto K(b,gc)\) letter by letter: `YM.Work.C28.continuous_push` (single-slot continuity from `H.1` at arity one), then `continuous_reads`, which composes `Joint.jointCont n` (continuity of the product-test map) with `continuous_pi` of the single-slot pushes (`C28.lean` lines 77–78). The manuscript instead pulls back the joint test by the affine map \(\widetilde g\) acting on the last \(m\) positions and appeals to the proof of `lem:schwartz-motion` (`boundary-detection.tex` lines 145–159). Both are valid; the manuscript route is a reorganisation and should be recorded as such (proof-standard item 5), or the text changed to the source's route (`mathematics.md`, M10 last item).

### The repaired gap: does `YM.Work.C28.answer` exist and state what the text claims?

Yes. `Lean/YM/Work/C28.lean` line 134: `theorem answer : YM.Bid.C28 := by`, with `Lean/YM/Bid/Grow.lean` lines 50–52:

```lean
def C28 : Prop := C08 → ∀ {G : Gauge} {L : Register G} (S : Table L) (W : Surface S) (J : StarOp S) (K : Spins S)
    (R : S.Rotation) (P : DiffPlan S) (h : S.RealSpin), S.Symmetric → P.Inclusions S → K.Descends R h → starRead J h →
    Urs W K → W.Strong J K ∧ W.Transforms J K
```

and `Lean/YM/Fields/Motion.lean` lines 23–27 (namespace `YM.Boundary.Surface`):

```lean
def Transforms (W : Surface S) (J : StarOp S) (X : Spins S) :=
    ∀ i j p, W.kernel J (X.po p i) (X.po p j) = W.kernel J i j

def Strong (W : Surface S) (J : StarOp S) (X : Spins S) := ∀ i j,
    Continuous fun p => W.kernel J i (X.po p j)
```

with `kernel b c := W.expect (Sentence.rev J b ++ c)` (`Star.lean` line 97), `Sentence.rev` = reverse of the letterwise `Letter.op J p = (J p.1, Probe.bar p.2)`, and `Spins.po p x := x.map (Letter.read X p)`, `Letter.read V g p = (V.rail g.Λ p.1, Joint.push g p.2)`. So `Transforms` is \(K(gb,gc)=K(b,c)\) and `Strong` is continuity of \(g\mapsto K(b,gc)\), for all words: exactly `eq:word-motion-input`.

Hypothesis matching: `C08` (first conjunct) ↔ continuity part of `lem:schwartz-motion`; `S.Symmetric` and `P.Inclusions S` are used only through `P.joint` and `P.covered` (common finite level; finite-level representative) ↔ ledger edge E4; `K.Descends R h` ↔ conclusions of `prop:lorentz-label-descent`; `starRead J h` (`Star.lean` lines 42–43: `∀ d v, j (S.pin d v) = S.pin d (S.adj h d timeAxis v)`, with `adj` = `(S.mirror H d (Signed.mirror a)).comp (S.conj H d)`, `Lean/YM/Euclid/Null.lean` lines 165–166) ↔ "\(J\) is the reflected conjugate \(\theta\kappa\)", and the fact that `Descends.commutes` is stated for the same `h` ↔ the identification of involutions assumed before the corollary; `Urs W K` ↔ conclusions of `thm:lorentz-covariance` (L2).

Step matching: `rev_po` with `Letter.rewrites` (uses `ht.ties`, `hw`, `ht.commutes`) ↔ \((gb)^*=g(b^*)\); `gpush_split` and `expect_po` (`rw [← Joint.tests, gpush_split, hu.translation, hu.rotation]`) ↔ \(g=(a,I)(0,\Lambda)\), translation invariance then Lorentz covariance; `continuous_pinned` (basis expansion `Module.finBasis ℂ (S.Field d)` against fixed distributions) and `strong` (identity motion on the letters of \(b^*\), \(g\) on those of \(c\)) ↔ the continuity paragraph, with the route difference of L9. The statement that the consumers are `YM.Boundary.Soil.mobilize` (`Motion.lean` lines 72–87: `(hp : W.Transforms J X) (hh : W.Strong J X)` give an `Action Z.H` with `Y.V p (Z.plant i)=Z.plant (X.po p i)`) was checked; the further consumers named in `correspondence.md` line 19 (`YM.Integrated.reconstructionArcs`, `YM.Next.BOUNDARY.Stage.establishing`, `YM.Boundary.harvest`) were not opened in this synthesis.

Conclusion: the declaration exists, its statement gives what the repaired text claims, and the manuscript corollary assumes no less than the source does. The manuscript abstracts the hierarchy packaging (`Table`, `DiffPlan`, `RealSpin`) into the explicit hypotheses named above; I found no hypothesis of C28 without a manuscript counterpart.

### Declarations opened and matched in this synthesis

| Declaration (qualified name as read) | Path and lines | Matched to | Result |
| --- | --- | --- | --- |
| `YM.Work.C28.answer`, `expect_ofFn`, `continuous_push`, `continuous_pinned`, `continuous_reads`, `strong`, `gpush_split`, `expect_po`, `rev_po` | `Lean/YM/Work/C28.lean` l.20–143 (whole file) | `cor:word-motion-inputs` | matches; route difference L9 |
| `YM.Bid.C28`, `YM.Bid.Roof` (field `time`), `YM.Bid.C22`–`C27`, `C29` (statements only) | `Lean/YM/Bid/Grow.lean` l.13–54 | `eq:word-motion-input`; translation clause of `prop:heat-cups` | matches |
| `YM.Bid.C08`, `YM.Bid.C09`, `YM.Bid.C07`, `Pantry`, `C01`–`C06` (statements), `inclined`, `kick`, `Boosty` | `Lean/YM/Bid/Corners.lean` l.23–106 | `lem:schwartz-motion`, `thm:lorentz-covariance`, `prop:boost-ward` (statement shape only) | matches; L1, L2 |
| `YM.Boundary.Urs`, `YM.Boundary.tents` | `Lean/YM/Shift/Closing.lean` l.83–85, 106–107 | conclusions of `thm:lorentz-covariance`; `cor:cone-support` | matches; L2, L6 |
| `YM.Boundary.Spins`, `Spins.Descends`, `StarOp`, `Letter`, `Sentence`, `starRead`, `Letter.op`, `Letter.read`, `Letter.rewrites`, `Sentence.rev`, `Surface.expect`, `Surface.kernel` | `Lean/YM/Fields/Star.lean` l.22–97 | words, star, kernel of `reconstruction.tex`; `prop:lorentz-label-descent` | matches |
| `YM.Boundary.Spins.po`, `Surface.Transforms`, `Surface.Strong`, `Soil.universal_embed`, `Soil.strong_life`, `Soil.mobilize` | `Lean/YM/Fields/Motion.lean` l.15–87 | `prop:word-motion` (unitary representation, strong continuity by isometric approximation, isometric embedding) | matches |
| `YM.Boundary.till`, `norms_kernel`, `Cups` | `Lean/YM/Fields/Lo.lean` l.17–41 | `input:word-boundary`, `lem:cold-vectors` | matches; L8 |
| `YM.Table.adj`, `YM.Table.unit`, `YM.Table.alive` | `Lean/YM/Euclid/Null.lean` l.100–102, 165–166 | reflected conjugate \(J=\theta\kappa\); nonzero unit class (M3) | matches (`theorem alive (d : ℕ) (h : S.Basic) : S.unit d ≠ 0`) |
| `YM.Table.respects` | `Lean/YM/Euclid/Lift.lean` l.20 | L5 | as quoted |
| `YM.Work.C01.singles_agree` (statement and proof body) | `Lean/YM/Work/C01.lean` l.82–89 | single insertions on the union, `analytic-boundary.tex` l.15–24 | uses `T.respects S`; L5 |
| `YM.Boundary.Probe.cap_support`, `finite_cap`, `persistent` | `Lean/YM/Shift/Cut.lean` l.44–45, 83 | cutoff step of `locality.tex` l.199–204 | source states convergence of the products: `theorem persistent (v : Probe X) : Tendsto (fun k => cap k v) atTop (𝓝 v)` and `tsupport (cap k f) ⊆ tsupport f`; M1 |
| `YM.OS.Semigroup.stays` | `Lean/YM/Heat/Rows.lean` l.133 | commutant clause of `prop:complex-heat` | manuscript is stronger; L4 |
| `YM.Boundary.offiero`, `Action.Intervenes`, `Action.spectrum`, `Action.only` | `Lean/YM/Fields/Spectrum.lean` l.64, 103–121 | `lem:time-fixed-heat`, `thm:field-spectrum` (intertwiner with `scale`, `across`, `start`; `only` requires `C.UniqueHeat`) | matches; L4 |
| `YM.Work.C18.entire` | `Lean/YM/Work/C18.lean` l.46–54 | entire extension, `locality.tex` l.86–102 | matches (`∃ U : ℂ → B, AnalyticOnNhd ℂ U univ ∧ ∀ r : ℝ, U r = u r`) |
| `YM.Work.C17.answer`, `C19.answer`, `C27.answer` and private helpers; `YM.Boundary.NearPair.Panes.reaches`, `Panes.forgets`, `NearPair.actor` | `Lean/YM/Work/C17.lean`, `C19.lean`, `C27.lean`; `Lean/YM/Shift/Exchange.lean` l.43, 68, 92 | names and visibility only | L3 |
| `YM.timeAxis` | `Lean/YM/Space/Index.lean` l.20 | coordinate convention (M4) | `abbrev timeAxis : Axis := Fin.last 3`: time last in the source |
| `ChallengeSpec` structure `Reconstructed`, field `acts` | `Lean/ChallengeSpec.lean` l.117–121 | endpoint clause "at least one smeared field is nonzero" (M3) | separate field in the source |
| `YM.Next.BOUNDARY.Stage` `Compatible.vacuum` | `Lean/YM/Next/BOUNDARY/Stage.lean` l.217–221, 254 | author's O3 | `Compatible.vacuum ... (hv : V.UniqueHeat)`, supplied at l.254 by `v.vacuum h.phase.heat` (reviewer B's narrowing of O3 confirmed textually) |

Declarations matched only by the agent reviewers (carried over, not re-opened in synthesis): for complex-heat `at_root`, `holo_root`, `localHeat`, `pairs`, `flip_row`, `quotient`, `roots_heat`, `heat_faithful`, `whole`, `pillar`, `high`, `along`, `either`, `send`, `cont` (report A); for analytic-boundary `YM.Work.C01`–`C04` and the `Waves` predicates (report A); for heat-vectors `YM.Work.C22`–`C24` (report A); for fourier-support `YM.Work.C05`, `C06` and `half`, `coneM`, `turns`, `sees`, `total` (report B); for spectral-measure `YM.Paley.*`, `altitude`, `nonneg`, `placed`, `south` (report B); for boundary-detection `YM.Work.C25`, `C26`, `C29` (report B); for label-descent `YM.Work.A17` and `YM.Spin.*` (report C; in synthesis only the statement `YM.Bid.A17` at `Lean/YM/Bid/Angular.lean` l.118–119 was located); for lorentz-covariance `YM.Work.C07`–`C09`, `A16` (report C); for full-tube `YM.Work.C10`–`C16` (report C); for reconstruction `Soil.compactor`, `starter`, `sharp`, `usable`, `regional`, `sees`, `Fields.Total` (report D); for locality `YM.Work.C17`–`C21`, `C27`, `Pane.agree`, `Pane.propagate` (report D). None of these reports found a mismatch in those rows.

## Required changes and remaining uncertainty

Required in the audit record (no chapter text is affected by the Lean findings):

1. `results/C04/correspondence.md` line 18: correct path and description of `YM.Bid.C08` (L1).
2. `results/C04/correspondence.md` lines 27–30: `Urs` is the conclusion of `thm:lorentz-covariance` (L2); record the route difference in the continuity step (L9).
3. `reconstruction-evidence.md`: private helpers and the name `YM.Boundary.NearPair.actor` (L3); mark the two strengthenings in complex-heat (L4). This file was outside the author's edits in this pass; the change can be made by whoever next owns it.
4. `results/C04/ledger.md`: record \(N_{S,d}\subseteq N_{T,d}\) (L5); complete the statement of the C05 edge (L7).

Remaining uncertainty:

- Textual reading only. No `lake build`, no elaboration, no `#print axioms`. Implicit arguments, instance arguments and coercions were not expanded; in particular `Probe.along_at`, `Joint.gpush_at`, `Joint.push_at` were inferred from their uses in `C28.lean` rather than opened. Private declarations cannot be referred to by qualified name at all.
- The rows of `reconstruction-evidence.md` for the nine chapters outside the repaired corollary were matched by one agent reviewer each and re-opened in synthesis only where listed in the table.
- The upstream consumers `YM.Integrated.reconstructionArcs`, `YM.Next.BOUNDARY.Stage.establishing` and `YM.Boundary.harvest`, and the path from them to the public endpoint, were not audited. Whether the public endpoint goes through the `UniqueHeat` variant (author's O3) was narrowed by reviewer B (confirmed textually for `Stage.lean` l.217–221 and 254) but not followed to `ChallengeSpec`.
- Producers of the hypotheses of C28 in the source (`Pantry`, `A17`, calibration, null equality) were not audited.

## Acceptance

No human acceptance is recorded. This file is an agent review submitted under the account `schmittj`; it does not certify the Lean correspondence of the chapters. Acceptance requires a human reviewer after the required changes are resolved; a changed SHA-256 of a chapter or of the correspondence files requires renewed review.
