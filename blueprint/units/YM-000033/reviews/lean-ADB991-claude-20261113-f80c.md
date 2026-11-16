# Review of a proof unit

- Unit: YM-000033, `blueprint/units/YM-000033/`
- Role: Lean correspondence (renewed review of revision 1)
- Human reviewer: `ADB991` (account under which this report is submitted; ADB991 had not reviewed it before submission, and no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `ADB991-claude-20261113-f80c`, running as a scheduled agent. This account authored no part of YM-000033 and did not write review #126/#127.
- Content SHA-256: `ad3b82466a1b69b610548e1af518251def5ac1cd4a6bc5757a91b3cc46cba4aa` (`python3 scripts/check_blueprint.py --fingerprint YM-000033` at `codex/existence-monograph` `b0bfc78`)
- Manuscript files and labels: `manuscript/existence/trace-prosper-sensor.tex` (the list (S1)–(S7), `prop:trace-prosper-sensor`, `eq:trace-sensor-weight`, `eq:trace-sensor-tested-price`, `eq:trace-sensor-raw-step`); `blueprint/units/YM-000033/correspondence.md`, sections "Formal hypothesis crosswalk", "Quantifier checkpoints" and "Revision response to independent review #126, corrected by #127"
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`; no Lean file changed by PR #134)
- Review task and PR: issue [#33](https://github.com/hairer/humanise-yang-mills/issues/33), claim https://github.com/hairer/humanise-yang-mills/issues/33#issuecomment-6856591729; revision PR #134; this report's PR: report-only draft against `codex/existence-monograph`.
- Outcome: **accepted locally for the items checked below; no discrepancy found and no required change.** One optional record item (L1). **No Lean was elaborated**: no pinned toolchain or Mathlib cache is reachable from this environment. Evidence is source text only.

## Findings and evidence

This report checks the source claims that the revision added or changed. The broader crosswalk was checked in #126 and is not repeated.

- **Target statement.** `YM.Trace.Terrace.Prosper` (`Lean/YM/TraceExtension/Terrace/Lease.lean` 27–31): `alpha : Tendsto s atTop (𝓝 Vbase)`, and `vote`: there are `μ i` and `c ≥ 0` with `∀ᶠ i, ∀ y, ‖μ i y‖ ≤ c‖y‖`, and for each `e > 0`, `∀ᶠ i, ∀ y, ‖hueK A (Stern V i) * (μ i (s i y) − Lease U# h y)‖ ≤ e‖y‖`. This is the conclusion of `prop:trace-prosper-sensor` as revised: one eventual bound uniform in \(h\), and one tail per \(\varepsilon\) uniform in \(y\). Matches.
- **Marked inputs (S7) ↔ `springs` arguments** (`Lease.lean` 34–35): `hv : v → Stem5 U#` (\(v_i\to x\)), `hk : hueK • s i (v i) → 0`, `hw : hueK * Lease (v i) → 0`. Matches `eq:trace-sensor-marked`. The section hypotheses `hZ, H, hb, hr, hq, K, θ, hG, hp` are the source of (S1)–(S6) as recorded in the crosswalk.
- **Weight and postselected level (S1) ↔ `hueK`, `AgeK`, `Stern`, `summit`.** `hueK Y i = AgeK Y (1/5) i` (`Lease.lean` 24); `AgeK A a i = Wave a (A.clock.hatBeta i)` (`Terrace/Look.lean` 10); `Wave a x = exp (a * (log (log x))^2)` (`Zn/Have.lean` 8–10). `Stern V i = summit A (V i).k` (`Gondola.lean` 32), and `summit A j = Nat.find (goal A j)`, the least \(i>j\) with `(log hatBeta j)^48 ≤ scale i − scale j` (`Terrace/Base.lean` 17–22). So \(\mathfrak a_i=\exp\{\tfrac15(\log\log\widehat\beta_{n_i})^2\}\) with \(n_i=q(k_i)\), as in `eq:trace-sensor-weight` and (S1). Matches.
- **R3 ↔ `YM.Next.Rank.Price.Tested`** (`Lean/YM/Next/RANK/Matrices.lean` 67–72). `read : C.label d →ₗ[ℂ] C.label d` is an endomorphism with `unit : read (C.refUnit d) = e0` and `score : coeffSize (awake v − read v) ≤ coeffSize (awake v)/2`. `awake D k N p v = (a_k^D)⁻¹ • columns … v` (line 30) is the manuscript's \(\mathsf A=d_{k_i}^{-5}\operatorname{Col}_{k_i}\) at \(D=5\). Matches the first bound of `eq:trace-sensor-tested-price` and the R3 row of the correspondence.
- **R4 ↔ `hb : (𝓛 : Filter (ℕ×ℕ)) ≤ F.fuse`** (`Lease.lean` 15). `Order.fuse f = map (fun i => (f.mesh i.2, f.per i.1)) (atTop.curry atTop)` (`Lean/YM/Extraction/Inherited.lean` 27). By `Order.fused`, an event is in `fuse` iff `f.late`, i.e. `∀ᶠ k, ∀ᶠ j, A (f.mesh j) (f.per k)` (`Extraction/Orders.lean` 47). `mesh` and `per` are `Sequence`s, strictly increasing (`Orders.lean` 14–16, `Sequence.cofinal`). So `fuse`, and hence `𝓛`, contains both tails \(\{N\ge n\}\) and \(\{\nu\ge\nu_0\}\), and the set "eventually in the period, for all \(N>j\)" for each \(j\). The manuscript's first coordinate is the mesh index and the second the period, as in `fuse`. Matches.
- **(S5) ↔ `YM.Trace.Terrace.Sceptre.step`** (`Terrace/Knell.lean` 63–65): `∀ d m, d ≤ 5 → C.ref d ≤ m → ∀ᶠ p, ∀ N, m < N → ∀ v`, `b/a ≤ 2` and the residual bound with `scaled (a/b)` and `vowel` (block), with `a, b` the budget thresholds at `m, m+1`. The quantifier order (fixed level, eventually in the period, uniform in \(N>m\) and the label) is the one in (S5). The thresholds are deterministic (`C.path.levels`), so the ratio bound does not depend on \(\omega\); the manuscript's "on the same set" is harmless. Matches.

## Optional record item

- **L1.** (S4) assumes that \(\mathsf A\) is injective. In the source this is not a separate field. `Tested.bijective` (`Matrices.lean` 78–86) derives bijectivity of `read` from `Tested.cost` and `reference_size` (line 58), the lower bound `coeffSize v ≤ outward C d k * (C.S.a k)^d * coeffSize (awake C d k N p v)`, which holds under `C.Makes` with `C.ref d ≤ k ≤ N`. The R3 row of `correspondence.md` cites `Tested` but not this supplier. Adding `reference_size`/`Tested.bijective` to the crosswalk would show where the injectivity input comes from. This is not a discrepancy.

## Required changes and remaining uncertainty

None required. Not done: Lean elaboration, `#check` and `#print axioms` for `springs` and `Prosper`, and kernel replay. The production of the section hypotheses (`Gondola`, `steep`, `Scrim`, `Sceptre`, `PostT`, `Spun`, `C.Makes`) was not traced beyond the lines cited.

## Acceptance

No acceptance is recorded by this report. A responsible human may record local Lean-correspondence acceptance at fingerprint `ad3b8246…46cba4aa` for the items above.
