# Renewed independent review of C10 revision 3 (PR #156)

- Task: [#158](https://github.com/hairer/humanise-yang-mills/issues/158). Claim: https://github.com/hairer/humanise-yang-mills/issues/158#issuecomment-6858339718.
- Session `ADB991-claude-20261113-088d`, role REVIEWER (mathematics and Lean correspondence). Agent: Claude (Anthropic), scheduled run for @ADB991; ADB991 had not reviewed it before submission.
- Independence: this account wrote the reviews in #148 (part A) and #149 (part B) whose items revision 3 answers. It authored no C10 chapter and no part of revision 3 (author `hairer`, session `hairer-claude-c10-rev3-20261113`). #150's R1 (by mgubi) is checked on the same footing.
- Inspected: `codex/existence-monograph` @ `97128ab` (merge of PR #156); revision diff `c560828..bf3d347`; nothing changed in `manuscript/` or `blueprint/` between `bf3d347` and `97128ab`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read as text only.

## Verdict

**No change required.** Each of the five required items is resolved. Two optional wording suggestions (O1, O2) are below. This is an agent review; it approves nothing. A human must take responsibility for acceptance.

## Content fingerprints (SHA-256, recomputed; equal to `results/C10/revision-3.md`)

| Chapter | SHA-256 |
| --- | --- |
| `weighted-frame-penalty.tex` | `a8d5841c7f409ecd9401ebe0836683c61f3b74c152bd2465d64fe4506998e140` |
| `stationary-germ-symmetry.tex` | `9d292bc7a661ec519f4de0a579c7b7afdaf342409a7f6717713e9d10a3b3c31f` |
| `inherited-loop-transport.tex` | `75659dff65785cd0a8b131222cc622249665286cb87a39f5c761c144356e0dab` |
| `quadratic-pole-transport.tex` | `3508978162486562429f61bb999af7d61328a757e3abbedd46783afa5d363a0a` |
| `annulus-recording-yield.tex` | `63d65eaeb201f21b0cd8150070526a529965820ee510cb74344baac431da54d6` |

## Item by item

`S/` = `Lean/YM/Next/STATIONARY/`.

**#148 R1 (the `4μ` bound, `weighted-frame-penalty.tex` l.216–228): resolved.**
- Recomputed: `q_a(k)=e^{ik_a}-1` (l.206) and `x` real give `q_a(x+w)-q_a(x)=e^{ix_a}(e^{iw_a}-1)`, with `|e^{ix_a}|=1`.
- On the strip `|Im p_a|≤1`, so `|w_a|=|Im p_a|/L≤μ=L^{-1}≤1`. Then `|e^z-1|≤Σ_{n≥1}|z|^n/n!≤(e-1)|z|` for `|z|≤1`.
- This gives `2μ` per coordinate and `(4·(2μ)^2)^{1/2}=4μ` in Euclidean norm. With `h_l≥μ` (l.204) and `|q(Re k_l)|≤h_l`, the factor 5 follows.
- Source: `q_drift` (`S/Spectral/Slabs.lean` l.323) is exactly `‖q r i − q p i‖≤2‖r−p‖` for real `p` and `‖r−p‖≤1` (sup norm), via `norm_exp_sub_one_le`. `qCost` (l.329) sums squares over the four axes to get `4‖r−p‖`. The text matches.

**#148 R2 (summand law, support of `ω`, l.96–112): resolved.**
- The summands are uniform on `{|z|_∞≤(L−1)/2}`, and `L` is odd: `common-scale-selection.tex` l.41 says "odd block lengths". So this box is a complete residue system mod `L`, and fixing all summands but the first makes the reduction of the sum uniform. Hence `ω(x)≤L^{-4}`.
- The support radius is `J(L−1)/2<(J+3)L`, the radius of `𝓑` (l.78), so `ω≤H_J ν` with `ν=|𝓑|^{-1}`.
- Source: `roulette : P.Small ≃ Site P.L` (`S/FrameEst/Center.lean` l.18) is built from `Ratio.half_box … P.odd_side` (`YM/Lattice/Crossing.lean` l.19: lifts of residues lie in the box of radius `L/2`). `roll_card` (l.23) gives `|Small|=L^4`. The text matches.

**#149 R1 (side conditions of the determinant identities, `stationary-germ-symmetry.tex` l.38–62, 96–100, 123–128): resolved.**
- `bounty_carry` (`S/Joint/Symmetry.lean` l.93) needs: `R.Bounds` (a standing hypothesis, l.15); `Explosives S t 1 U` and `Explosives S t 1 (wages S k u U)`; `0<μ`; and `ContDiffAt ℝ ω (canon … (gauge u V) (wages S k u U)) 0`.
  - `Explosives` (`S/Joint/Regulator.lean` l.501) is analyticity of `z ↦ shield S t (atire K U z)` at 0. This is the text's condition (a).
  - `canon S t p R V U b = muster S t p R V (extend b * U)` (`S/Joint/Gauge.lean` l.160). Analyticity of `canon` is condition (b).
  - The text's requirement for eq:stationary-germ-gauge-det, "(V,U) and (V',U') satisfy (a) and (V',U') satisfies (b)", is exactly this list.
- `twistWorth` (l.280) needs: `0<μ`; `Explosives` for `withinChoice s 0 t` (the text's `r`) at `U`; `Explosives` for `t` at `twistUniform s U`; and `Shell` (`S/Joint/Gauge.lean` l.163: analytic and zero derivative at 0) for `t` at the twisted point. The text's requirement for eq:stationary-germ-signed-det, "(V,U) satisfies (a) for r and (s*V,s*U) satisfies (a)–(c) for t", is exactly this list.
- The claim that (a)–(c) hold where the identities are used matches the consumers:
  - `tribute_probe` and `tribute_wager` (l.329, 346) get `Explosives` from `explosive` (`Regulator.lean` l.504), which holds near any parameter where an analytic joint family equals 1.
  - They get (b) at the transformed point from `Shell.wage` (`Gauge.lean` l.177).
  - `turn_tribute` (l.381) gets `Shell` at the twisted point from `camp_station` for `r`, transported by `sail` (l.262).
- The text does not claim the signed identity without (c), as requested.

**#149 R2 (dropped packaged hypotheses): resolved.**
- `inherited-loop-transport.tex` l.300–312 now lists four items. They match the fields of `TicketPost`/`PostCard` (`S/Films/LeadingRay.lean` l.771–779; `S/Films/TraceDifference.lean` l.470–478) that `bequest` (`S/Loops/Curvature.lean` l.66) carries and the English proof does not use:
  - the gap = `health` (`PriceGap`);
  - the response data with their two recording conditions = `L`, `tilts`, `meets`;
  - the identification with `W_i` = `spun : Q.L i = cardHand (mat i)`;
  - the vanishing frame component = `bare : ∀ x, (L i x).2 = 0`.
- `quadratic-pole-transport.tex` l.41–45 now fixes the block representatives and says they enter only the recording by `Π_c`. In the source, `questPole` (`S/Films/RankColor.lean` l.151) uses the representative `t` only in the ticket lemmas `shipGren S t` and `rank_up_ticket S t`. `PoleTest ∘ uniformM W` does not involve it, and `pole_reduced` (`S/Loops/HessianMatch.lean` l.737) passes `Q.tags i` there only.

**#150 R1, remainder (ticket input (T)): resolved.**
- The Scope of `annulus-recording-yield.tex` (l.345–358) now makes `lem:ex-annulus-same-data`/`-common-strip` conditional on (T), and lists (W), (S), (T) as the remaining inputs of `prop:ex-annulus-estimate`.
- (T) is stated at `annulus-same-data-binding.tex` l.156–162, before the proposition (l.301). The proposition itself names (T) at l.304 and l.373.
- The `part-B/ledger.md` rows for `lem:ex-annulus-same-data` and `prop:ex-annulus-estimate` carry (T), with the open edge `unassigned-to-C10-film-tickets`.

**Author records.** I read the `part-A/correspondence.md`, `part-B/correspondence.md`, `part-B/ledger.md`, `README.md`, `handoff.md` and `revision-3.md` changes. They describe the edits accurately. `bounty_carry` is now in the part-B correspondence.

## Optional suggestions (not required)

- **O1 (`stationary-germ-symmetry.tex` l.59–60).** "The transformations considered below fix the trivial field" is true for signed lattice transformations and constant colour conjugation. It is not literally true for the small variable coarse/fine gauge transformations of §"The identities used…" or for the tree gauge map applied to a moved field: `gauge(k)·1` is a nontrivial pure-gauge field. What the argument uses, and what the source uses (`tribute_wager` needs only that the transformed family equals 1 at parameter 0), is that they map a small neighbourhood of the trivial field into the neighbourhood where (a)–(b) hold. Suggested wording: "…fix the trivial field (signed transformations, constant conjugations) or, for small gauge transformations, keep the field in that neighbourhood…".
- **O2 (l.58–59, condition (c)).** The standing hypothesis (l.16–18) is stationarity of the *tested* action in the tree-chart variables. Condition (c) is stationarity in *all* joint increments `X`. The upgrade uses gauge invariance: near the branch, `S_t(V,exp(X)U)` equals the tested action at the tree-gauge representative of `exp(X)U`, which is analytic in `X`; the chain rule then gives zero derivative. This is the source's `camp_station` (`S/Joint/Gauge.lean` l.237–262, via `clerk`/`root_wages`). The text's next subsection runs this argument in the other direction (l.132–142). One sentence would make "(c) is the stationarity of the branch" self-contained. Similarly, the source obtains (b) at branch points from `Thaw.earn` in `camp_station` and transports it by `Shell.wage`/`sail`. The text's "finite composition of analytic maps near the identity" is a valid alternative justification.

Neither suggestion affects any statement, estimate or consumer.

See [validation.md](validation.md) for the commands.
