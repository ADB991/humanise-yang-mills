# Review of a proof unit

- Unit: YM-000033, `blueprint/units/YM-000033/`
- Role: Lean correspondence
- Human reviewer: `hairer` (account under which this report is submitted; no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `hairer-claude-issue33-review-20261113`. The unit was drafted with GPT-6.1 Terra (Codex).
- Content SHA-256: `f4ab86a58f7df57adc923ef2298df4377c1942c8a6a2cebcf74c641f396d5657` (`python3 scripts/check_blueprint.py --fingerprint YM-000033` at `69c254b`)
- Manuscript files and labels: `manuscript/existence/trace-prosper-sensor.tex`, `prop:trace-prosper-sensor`; `blueprint/units/YM-000033/correspondence.md`
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#33](https://github.com/hairer/humanise-yang-mills/issues/33); author PR #71; this report's PR: draft against `codex/existence-monograph`.
- Outcome: **accepted locally for the items checked below; coverage of the input correspondence is partial.** No discrepancy found, and no required change for this role. **No Lean was elaborated:** the toolchain and Mathlib cache are unreachable from the review environment, so `#print axioms YM.Trace.Terrace.springs` was not run.

## Findings and evidence

All by reading the pinned source.

**Target statement.** `YM.Trace.Terrace.Prosper` and `springs` (`Lean/YM/TraceExtension/Terrace/Lease.lean` 24–48):

- `Prosper.alpha` is `Tendsto s atTop (𝓝 Vbase)`. This is the manuscript's \(s_i\to f\) in operator norm, with \(f\) the componentwise reference projection.
- `Prosper.vote`: real-linear \(\mu_i\), a constant \(c\ge0\) with an eventual bound uniform in \(y\), and, for each \(e>0\), an eventual weighted bound uniform in \(y\). This is exactly the conclusion of the proposition, including the remark that the tail may depend on \(\varepsilon\) but not on \(y\).
- `springs` takes an arbitrary \(v\) with `Tendsto v (𝓝 (Stem5 _))`, `hueK·s_i(v_i) → 0` and `hueK·Lease(v_i) → 0`. These are the three marked hypotheses `eq:trace-sensor-marked`, with \(x=\) `Stem5` and \(\rho=\) `Lease`.

**Weight and Ward functional.**

- `hueK A i = AgeK A (1/5) i`, with `AgeK A a i = Wave a (hatBeta i)` (`Look.lean` 10) and `Wave a x = exp (a·RLog x)` (`Zn/Have.lean` 10). `monitor = exp((log log β̂)²)` (`RG/History.lean` 81). The weight is applied at `Stern V i = summit A ((V i).k)`, and `summit` is `Nat.find` of the first \(n>j\) with `(log β̂_j)^48 ≤ scale n − scale j` (`Base.lean` 18–24). This matches \(\mathfrak a_i\) and \(q(j)\).
- `rho` is \(-4(w_0+4w_1)\) in the `bareVector` coordinates (`Foundation/Dilate.lean` 78–84), and `Lease = rho ∘ plate`. This matches the manuscript's \(\rho\).

**Proof route.** `springs` obtains \(U,t\) from `lensP` and then applies `fitV`, `scout` and `expenses` (`Delta.lean`). I read all four abstract lemmas.

- `scout` is the manuscript's proof of \(s_i\to f\): `plumage` gives the decomposition \(y=Uf(y)+A(y)x\), \(V_i=u_if+A\otimes w_i\to1\), and the inverse.
- `permute`, `spend` and `expenses` give \(\mu_i=\rho\circ u_i\) and the weighted bound, as in `lem:ex-lattice-trace-weighted-price`.
- `lensP` (`Prism.lean` 51–77; `omit hs HS`, so the call in `springs` with `K θ hG hp` is consistent) concludes \(fU=\mathrm{id}\), \(t_i\to U\) pointwise, and \(s_it_i=\mathrm{id}\) eventually. These are exactly the three facts the manuscript derives before the proposition. Its lift is `prize Z X V 5 i (Y 5 i ·)`, and `Spun.starts` gives `(s i v).val d = (X.U i 5).symm (Vault … (crown …) (v.val d))` on one eventual tail (`Prism.lean` 26–27). Both match `eq:trace-sensor-selected-formulas` under the identifications `prize = c⁻¹ swale` and `Vault = P(c t² M⁻¹ ·)` recorded in `correspondence.md`. I did not re-open `prize`, `swale` or `Vault`.

**One-step input.** `Sceptre.step` (`Knell.lean` 62–65) reads: for every \(d\le5\) and \(m\ge\) `C.ref d`, eventually in the period \(p\), for every \(N>m\) and every label \(v\), we have \(b/a\le2\) and `coeffSize(Cturn m − scaled(a/b)(vowel(block m) Cturn (m+1))) ≤ gear m · coeffSize(core Cturn (m+1))`. Here `gear A j = 2(1+columns(j+1))/cameo(j+1)` (`Knell.lean` 59) and `cameo = AgeK (1/2)` (`cameo_age`, `Look.lean` 16). This is exactly `eq:trace-sensor-raw-step`, with \(g_j\) and the stated quantifier order.

## Required changes and remaining uncertainty

No required change for this role. The ultrafilter wording point (R4 in the mathematics report) concerns how the source's `hb : 𝓛 ≤ F.fuse` is described.

Not checked:

- Elaboration and the axiom print of `springs`.
- The source's own production of the inputs: `Gondola.terminal`, `sky_tip`, `steep.terms`/`mintS`, `InvoiceSky`, `Tested.score`, `cruise`, `move_anchor`, `arrive_t`.
- The identification of the manuscript's orthogonal-complement section with `section5`/`ladder_on`.
- `prize`, `swale` and `Vault` as definitions.
- The fields of `Makes`, `Scrim` and `PostT` beyond those named in `correspondence.md`.

The correspondence record states these as inputs, and I found nothing inconsistent in what I read. A reviewer with a working Lean setup should run `#print axioms YM.Trace.Terrace.springs` and confirm the elaborated type of `Prosper`.

## Acceptance

No acceptance is recorded. A responsible human reviewer may record Lean-correspondence acceptance for the checked scope, preferably after the axiom print has been run.
