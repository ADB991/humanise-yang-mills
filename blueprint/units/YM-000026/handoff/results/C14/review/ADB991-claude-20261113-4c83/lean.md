# Textual Lean correspondence: PR #256 delta `f3a0a4b..f9ddbdb`

Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, as imported under `Lean/` at the base `69b2631`. The delta does not change `Lean/` or `source/` (`git diff 69b2631 f9ddbdb -- Lean source` is empty). All reads below are textual. I did not elaborate Lean, replay axioms or build anything: Mathlib is unreachable from this sandbox. I checked the declarations the author's new `correspondence.md` cites for this delta.

## L1. Chosen-radii curve: `YM.Next.UVStress.Stations.ranging`, `Stations.build_curve` (`Lean/YM/Next/UV_STRESS/Rates.lean` l. 27–78)

- `ranging` returns a `Zoom` `R` together with stations `X k : Station C k` such that `(X k).r = R.r k` and `(X k).Admissible F a k (sizeHint k) (costHint k)`. Here `sizeHint k = k+1`, `costHint k = (k+1)⁻¹`, `R.r` is strictly antitone and `R.r → 0`.
- The radii are chosen inside the proof. The step-`k+1` station comes from `Stations.arbitrarily` with cap `min (r_k/2) (costHint (k+1))`. The radii are therefore not members of a prescribed sequence. This matches the author's account and the new manuscript remark (l. 446–453). ✔

**Support for P1** (my interpretation, not a source theorem). Take the one-stage property for the sequence `s := R.r`. Given a level `d`, a lower index `N` and `θ>0`, choose `n>max(N,d)` with `R.r n<θ`. The station `X n` is admissible with:

- grade cap `n ≥ d`;
- arity cap `rank = n ≥ d`;
- window `Scaling.window (n+1)`;
- tolerance `(n+1)⁻¹`.

Restricting it to cutoff `d` gives the cutoff-`d` receipts, for these reasons:

- `Station.Admissible` (`Station.lean` l. 92–103) is stated per grade and per arity `n ≤ rank`.
- `Scaling.window R n = {x | spaced R⁻¹ x ∧ ‖x‖ ≤ R}` (`Lean/YM/Climb/Cells.lean` l. 40) increases with `R`.
- `Extraction.Order.upper f A c` (`Lean/YM/Extraction/Orders.lean` l. 56) is monotone in `c`.

So the ranging curve satisfies the manuscript's one-stage property for its own radii, with the chart's level equal to `n`. This assumes the manuscript's "location `j`" may be read as the station's index. I did not check that reading against the `TimberSky`/`Charting` location index. A formal restriction `Station C n → Station C d` is not provided in the source, as far as I searched (`grep` for `restrict` in `UV_STRESS/`). It is a reindexing of the finite family `Fin (D+1)` of lifts.

## L2. Prescribed-sequence route: `YM.MergeProof.East.boatsSky`, `wakesSky`, `TimberSky` (`Lean/YM/TraceExtension/Prom/Zoom/Boats.lean` l. 42–88)

- `boatsSky` takes an arbitrary `s : ℕ → ℝ` with `Tendsto s atTop (𝓝 0)` and `∀ i, 0 < s i`, a lower index `Y` and `θ>0`. It returns `k ≥ Y` with `s k < θ`, an `i ≥ Y`, and data `b c R` with `s k = Station.gap A b i` and `TimberSky F a d i l b c R`.
- The hypotheses include `G.Simple`, `Scrim …`, generator bounds `generator G i ≤ z` and `FiresSky B H O J d z`. Section variables `H P hc he` are included.
- `TimberSky.fares` carries `(wok …).toStation.Admissible F a.spin j (sizeHint j) (costHint j)`.
- `wakesSky` applies `boatsSky` with lower index `max d (N+1)`. It yields `p` `StrictMono`, `s ∘ p` `StrictAnti`, levels `(V d).k → ∞`, `(V d).checked` and `(V d).wheel.r = s (p d)`.

This is the manuscript's one-stage property together with `lem:ex-lattice-trace-strict-subsequence`, under the stronger `FiresSky`-type premises. The author's correspondence row is accurate. The manuscript no longer attributes the every-sequence conclusion to the chosen-radii route. ✔ (N1 of review #260.)

## L3. One curve for trace normalization: `YM.Trace.Over.ChoiceK` (`Lean/YM/TraceExtension/Chart/Masts.lean`)

Review #260 (`lean.md`, L3) recorded that the trace interface is indexed by one `J : Scaling S`. The delta's existential one-curve input matches that. I did not re-read `year_spec` or `july` for this renewed review. They are unchanged at the pin, and the delta's use of them only restates the one-`J` reading checked in review #260. ✔ (R2 of review #260.)

## L4. Completion: `YM.Next.UVStress.Stations.equivalences` (`Lean/YM/Next/UV_STRESS/Invert.lean`)

Unchanged since review #260 (L1 there): the completion is the per-grade finite modification. The new O1 sentence (l. 674–678) uses only that the agreement tail for a finite set of grades does not depend on the test. That is a consequence of the per-grade tails, and it adds no source claim. ✔

## Not checked

- No Lean elaboration, `#print axioms`, or build.
- No check of the hypotheses of `FiresSky`, `Scrim` or `HaarBudget`. The manuscript leaves them as outstanding inputs.
- No check of PR #216's source records.
