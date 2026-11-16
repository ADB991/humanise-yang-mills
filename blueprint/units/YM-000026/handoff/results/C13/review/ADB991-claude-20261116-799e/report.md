# Independent review of PR #462 (all-level auxiliary family for trace charts)

- Reviewer session: ADB991-claude-20261116-799e (Claude, scheduled agent on behalf of @ADB991; not reviewed by ADB991 before submission).
- Task: #398. Claim: https://github.com/hairer/humanise-yang-mills/issues/398#issuecomment-6905332469
- Reviewed: hairer's draft PR #462, head `e02673e37fdf76b15c2de19100ff90bce137aaeb`, merge base `72eabe5453958edb70efd8e3548834b1a5657f50`.
  The two changed manuscript files are byte-identical at `72eabe5` and at the current base `codex/existence-monograph` @ `47bba25b`, so the PR has no drift on them.
- Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Independence: different account from the author. The same-account `REVIEW.md` in the PR is not independent of the author; this review did not rely on it. Its findings were compared only after the checks below.
- Fingerprints: see `hashes.json`.

Reviewed content:

- `subsec:restart-chart-family` and `prop:restart-chart-family` (new; `restarted-rank-history.tex` l. 742-831);
- the amended remark after `prop:rank-trace-output-lawful`, `lem:rank-trace-path-part`, new `cor:rank-trace-all-levels` and the new Status paragraph (`actual-rank-purchases.tex` l. 1394-1504).

## Verdict

**Mathematics: accepted locally, conditional on the funded hypotheses of `prop:restart-actual-closure`. No required change.** Four suggestions (S1-S4) and two notes (N1-N2) below.

**Lean correspondence (textual, no elaboration): accepted locally. No required change.** The removal of the "tests compatible with the threshold" premise is justified by the definition of `YM.Next.Rank.Station.Meets`.

## Mathematics: what was checked

### Budget radii (`subsec:restart-chart-family`, l. 746-771)

With `b(x) = ⌈(log x)^2⌉` and `x ≤ r(x) ≤ x^2` (`sec:actual-reader-dawn-selection`, l. 165-170 of that file):

- `log r ≤ 2 log x` gives `(log r)^2 ≤ 4 (log x)^2`, so `b(r(x)) ≤ ⌈4(log x)^2⌉ ≤ 4 b(x)`;
- hence `25 b(r) + 30 ≤ 100 b + 30 ≤ b^2` once `b ≥ 101`;
- `r ≥ x` gives `b ≤ b(r)`, so `b^2 ≤ b(r)^2`.

These are exactly the conditions `25B+30 ≤ B_c ≤ B^2` of `sec:actual-corrected-body-compiler` (l. 30-35 of that file), with `B = b(r(x_j))` and `B_c = b_j^2`. Correct.

`B_f ≤ 2 B_c` (fine `j+1`, coarse `j`): correct direction. The stated reason (`x_{j+1} = x_j + c_G log L_j` on a fixed stage pair) matches `marked-portfolio-calibration.tex` l. 277 and `selected-centered-service.tex` l. 193. The plateau (F2) gives a second, uniform proof: `x_j, x_{j+1} ∈ [s/2, s]`, so `b_{j+1}/b_j ≤ b(s)/b(s/2) → 1` uniformly on the window.

Threshold. The text says the retiming is chosen so that its recording threshold equals `τ_j`. This is what `actual-reader-dawn-selection.tex` l. 169 and l. 177-178 assert ("its flag threshold equals the healthy threshold at x"; "This threshold equals τ_x"). It is a cited property, not something derived here. It agrees with the coarse threshold `τ_x = x^{-1/2} hot(x)` in `restarted-rank-history.tex` l. 538 and the fine threshold `z^{-1/2} hot(z)` in `actual-corrected-body-compiler.tex` l. 44. Correct as a citation.

### Construction and density identity (`prop:restart-chart-family`)

- Endpoint. `prop:restart-endpoint` needs `s/2 ≤ β ≤ 2s` with `s = x_k = β̂_k`. `lem:rank-trace-endpoint` gives `|β_{N,p,k} − s| ≤ s/8`. Its budget `(M^2, τ)`, with `M = ⌈(log s)^2⌉` and `τ = s^{-1/2} h_s`, is `(B_k, τ_k)`. Its additive cost is `q_0`. Correct.
- Descending induction. Each step applies `prop:restart-actual-closure` to the already-installed `P_{i+1}`, installs only `P_i`, and gives cost `q_{k−i}` and `eval(P_i) = K_{i,β} eval(P_{i+1})`. This is a finite descending induction, and the recursion `D_j = K_{j,β} D_{j+1}` gives the first identity of `eq:restart-chart-density`. Correct. No injectivity of `eval` is used, and none is needed.
- Nonnegativity: a nonnegative endpoint pushed by a nonnegative kernel stays nonnegative. Correct.
- `∫ D_j dμ_j = Z_{N,p}`: Fubini plus kernel mass one in the coarse variable for each fine configuration (stated, for example, in `centered-freight-producer.tex` l. 15). The kernels act at the frozen coupling `β`, not at the selected couplings `β_{N,p,j}`. For the argument to apply there, mass one must hold at every coupling. The Lean source confirms that it does (see the Lean section: `Course.flow_sum` uses `transition_mass` at an arbitrary `changeβ`). The manuscript sentence does not say this; see S2.
- Integral at `k` equals `Z_{N,p}`: the selected transition identities (`centered-birth-receipt.tex` l. 129, `∫A_i^{ev} dμ_i = Z_{N,p}` for `i ≤ N`). Correct.

### Every-level tests (`cor:rank-trace-all-levels`)

With `β = β_{N,p,k}` and `g = β^{-1/2}`:

- `7/8 β̂_k ≤ β ≤ 9/8 β̂_k` and `β̂_k/2 ≤ β̂_j ≤ β̂_k` give `β ≤ 9/4 β̂_j ≤ 4 β̂_j` (field `cap`).
- `g ≤ (7/8 β̂_k)^{-1/2} ≤ √(8/7) β̂_j^{-1/2}`, using `β̂_j ≤ β̂_k`.
- `τ_j / (β̂_j^{-1/2}) = exp((log log β̂_j)^{3/2}) ≥ √(8/7)` once `log log β̂_j ≥ (log √(8/7))^{2/3} ≈ 0.28`, so `g ≤ τ_j` (field `entrance`).
- `βg^2 = 1` and `g > 0` hold by definition (fields `assigned`, `positive`).
- `τ_j ≤ θ_clock(j) = β̂_j^{-1/2} M_j` with `M_j = exp((log log β̂_j)^2)` (`rank-root-normalization.tex` l. 391-397), because `u^{3/2} ≤ u^2` for `u ≥ 1` (field `max_threshold`). `θ_clock ≤ 1` follows from `lem:rank-root-late-scale` (`β̂ θ^3 ≤ 1` and `β̂ ≥ 1`); see S3.
- Clip: retained stage clip, by `lem:rank-trace-path-part`, now applied at every `j` (field `same`).
- Additive cap `q_{k−j} ≤ s^{-1/400} ≤ 1`. This uses `k − w ≤ y^4`, which is proved in `prop:rank-trace-chart-window` (window-length paragraph), together with `eq:restart-decay` (field `cap_E`). See S1.
- Loop cap `≤ loopCap_j = Λ_clock(j)`: selected path bounds and `lem:common-loop-capacity` (field `loopCap`).

Every supposition of `prop:rank-root-output-ticket`(2) at level `j` is therefore met. The uniformity claim also holds. The thresholds depend only on the stage pair `(J(k), J(k)−1)` (bracket of (F1)), on `b̄` and on the finite menu, and the all-stage payment covers them. Nothing depends on `N`, `p` or the chart.

The previous text claimed that at `j = k` "the representation is the actual one … which is not restarted, and it has to be checked separately". The new text correctly replaces this with the re-expressed endpoint. That re-expression has budget `(B_k, τ_k)` and is covered by `prop:restart-endpoint`.

### Suggestions (non-blocking)

- **S1 (dependency citation).** `cor:rank-trace-all-levels` and `prop:restart-chart-family` use two facts from `prop:rank-trace-chart-window` without citing it. The first is the coupling band `|β_{N,p,k} − β̂_k| ≤ β̂_k/8` (`lem:rank-trace-endpoint`). The second is the window-length bound `k − w ≤ y^4`, which makes `q_{k−j} ≤ s^{-1/400}` valid (`eq:restart-decay` is uniform only for `n ≤ y^4`). One sentence citing both would close the chain for a reader.
- **S2 (frozen-coupling kernel mass).** At `restarted-rank-history.tex` l. 821, "Each selected kernel has mass one in its coarse variable" should say "at every coupling, in particular at the frozen coupling `β`". The selected history's kernels act at `β_{N,p,j}`, and the identity is used at `β_{N,p,k}`. The Lean source (`Course.flow_sum`) confirms that the property holds.
- **S3 (θ_clock ≤ 1).** The sentence "τ_j ≤ θ_clock(j) ≤ 1 on the purchased tail" could cite `lem:rank-root-late-scale` for the second inequality.
- **S4 (stale "(V)" wording).** `prop:rank-trace-chart-window` still says "Assume (V)" (l. 1250), its proof calls (V) an input (l. 1297), and the remark after `lem:rank-trace-path-part` mentions "the input (V)" (l. 1433). The new Status paragraph says that `prop:restart-actual-closure` now supplies (V). Aligning these, or adding a forward pointer, would avoid a reader thinking (V) is still open.

### Notes

- **N1.** The corollary says `N > k`, as (F3) does. `prop:restart-chart-family` and the chart-window proposition say `N ≥ k`. This is consistent: the corollary is the weaker statement.
- **N2.** I agree with the PR's scope statement. These results do not discharge joint chart selection, stress calibration or the funded (F5) stamp; (F5) still rests on `prop:rank-selected-tested-readout` and its funded hypotheses.

## Lean correspondence (textual)

I inspected these files. Each one's SHA-256 matches `Lean/SOURCES.sha256`:

- `Lean/YM/Next/RANK/StationMeter.lean`. `YM.Next.Rank.Station.Meets A m p P g Λ δ` has exactly eight fields: `same` (clip equality), `cap` (`P.beta ≤ 4·hatBeta m`), `assigned` (`P.beta·g^2 = 1`), `positive`, `entrance` (`g ≤ threshold`), `max_threshold` (`threshold ≤ clock.threshold m`), `cap_E` (`δ ≤ 1`), `loopCap` (`Λ ≤ clock.loopCap m`). No field relates the clip's tests to the threshold. The docstring says density equality and β-on-course are required separately, as `Course.Uses`. This confirms that the old "compatibility of the tests with the threshold" premise was vacuous, and that the corollary's list of tests is complete.
- `Lean/YM/Next/RANK/Course.lean`. `Course.flow` pushes with `(clock.op i p).push (X.changeβ (i+1))` at an arbitrary coupling. `flow_sum` preserves the integral via `transition_mass` at that coupling, and `vacuum_total` identifies the integral with `Wilson.partition G (C.side N p) (C.beta N p)`. `vacuum_lower` gives nonnegativity, `vacuum_at` gives agreement with the selected representation at levels `≥ k`, and `Uses` = density equality + coupling equality. This matches `eq:restart-chart-density` and supports S2.
- `Lean/YM/TraceExtension/Prom/Port/Soft/Grows.lean`. `leafSky` builds the endpoint by `parser` and `update (C.path.rep N p) k P`, under hypothesis `|β_{N,p,k} − clim k| ≤ clim k / 8`. `thicketSky` builds the levels by `Nat.decreasingInduction`, installing only `W := update V i Q`, so higher entries are unchanged (`hu`). Each new entry satisfies `Uses` through `hQ.pushes` and `hQ.still`. This matches the manuscript's "choose the endpoint presentation and then the backward steps once; no higher entry is changed".

Not inspected by me: `Leashes.lean` (`groomSky`), `Coupons.lean` (`NylonSky.use_`, `embroideredSky`) and `Spear.lean`. The manuscript's claims about them are covered only by the author-side review.

## Commands actually run

- `python3 scripts/check_blueprint.py` at PR head: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` from `manuscript/` at PR head: exit 0, 1127 pages, no undefined or multiply defined references in the log. Pages 756 (`subsec:restart-chart-family`) and 942 (`lem:rank-trace-path-part`, `cor:rank-trace-all-levels`) were rendered and inspected; they are legible.
- `sha256sum` of the inspected manuscript and Lean files (see `hashes.json`); the three Lean files match `Lean/SOURCES.sha256`.

Not run: Lean elaboration. Mathlib hosts are blocked in this environment.
