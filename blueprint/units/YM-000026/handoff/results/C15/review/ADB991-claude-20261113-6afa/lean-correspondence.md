# Textual Lean-correspondence review

Session `ADB991-claude-20261113-6afa`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All paths are under `Lean/YM/`. Every inspected source file's SHA-256 appears in `Lean/SOURCES.sha256`. This is a textual reading: nothing was elaborated.

## `trace-bill-prices.tex`

| Manuscript | Source | Check |
|---|---|---|
| `n_{d,i}` (`eq:ex-trace-native-price`) | `YM.Trace.Terrace.nativeC C d i j k`, `TraceExtension/Terrace/Casa.lean` l.20, called as `nativeC C d i (basin K i) (summit i)` (l.41) | `x = hatBeta k`, `w = x⁻¹·((fly d j/2)/(‖alto j d‖·(x³/gainChart k j)))`, `stakes i j / w`. Matches, with `j=J_i`, `k=K_i`, `t_i = β̂_{K_i}` |
| `A_J^{-d}` = norm of inverse dilation | `YM.MergeProof.alto` / `alto_norm`, `MergeProof/Cashew.lean` l.54–55 | `alto = ((a_k)^d)⁻¹ : ℂ`, a scalar; its norm is `(a_k^d)⁻¹`. Matches |
| `s_i`, `γ_i` | `YM.MergeProof.stakes` (`MergeProof/Strudel.lean` l.21), `YM.Bid.gainChart` (`Bid/Loan.lean` l.130) | `exp((a_m/a_k)^4·treasury k + 5)`, `exp((S_k−S_i)/8)`. Matches |
| tickets, `G_i`, `τ_i(q)` | `Terrace.Ticket` (`Fund.lean` l.12), `Gate = (log ·)^48` (`Base.lean` l.18), `Tau P i x = watch P (x/10^4) i` (`Arms.lean` l.10–11) | Matches. Rate-`a` ticket = ∀ b>a, eventually `0 ≤ v ≤ exp(b·Gate(β̂_i))` |
| four rate-zero tickets | `stakeK` (`Fund.lean` l.41), `hullK … pows d` (l.40), `stickK … pows 4` (l.33), `grantK` with `open_budget` (`Arms.lean` l.20; `Stanza.lean` l.29) | Matches. `grantK` needs `basin ≤ summit` eventually, supplied by `open_budget` (`basin < summit`), which the text records as `J_i ≤ K_i` |
| gain estimate | `gainsK` (`Arms.lean` l.26) | `Tau i 500 ≤ gainChart(summit i, basin i)` eventually. Matches |
| `eq:ex-trace-native-rate` | `tends_price` (`Casa.lean` l.41–48) | `a_i^d · nativeC … ≤ Tau i (−430)` eventually, via `toll_small (x:=70)` and `Tau_add`. Matches |
| `lem:ex-trace-bill-column-size` | `Bill.norms`, `Bill.bias` (`Casa.lean` l.22–23), `majesty` (`Annual.lean` l.43–45) | `Bill C N p d k g v x`: `coeffSize v ≤ 1`, `coeffSize(v − columns x) ≤ threshold² · AgeK(−1/4)`. `majesty` proves `coeffSize(columns x) ≤ 2` (labels in that order), using `threshold ≤ 1` and `AgeK(−1/4) ≤ 1`, which the source proves (`threshold_le`, `wane`) and the lemma takes as hypotheses. Matches |
| root receipt in `prop:ex-trace-bill-root-price` | `Bill.root` (`Casa.lean` l.24–25), `opens` (`Overlay/Prior.lean` l.23, `s=1`) | All conditions match: `opens 1 i j` (= `i≤j ∧ σ_j² ≤ a_i/a_j`), `ref d ≤ j`, `j < k`, `room i k l`, `i ≤ k ≤ N`, `Interior (window 0 l) g`, and the bound `rootTest(backTo(alto k d • g) − O x 0) ≤ nativeC d i j k`. The proposition specialises `j=J_i`, `k=K_i` |
| homogeneity step | `Glade.fade` (`root_smul`), `Glade.weighing`, `Glade.linC`, `Glade.toss` (`Grid.lean` l.15–23) | `(a_i/a_k)^d • f = a_i^d • (alto k d • f)`; `rootTest(c•V)=‖c‖ rootTest V`. Matches |
| raw label norm (issue #334 "coefficient price versus raw label norm") | `Terrace.annual` (`Annual.lean` l.46–47) | The source separately derives `‖y‖ ≤ 2·outward C d k` (raw label norm) from the column bound via `at_current`. None of the three chapters uses or states this. Its consumer is `CabinBook.lean` l.40, outside this scope. The chapters correctly use only the transported column bound (probe-assembly l.71–73 says so explicitly). No finding |
| "label-producing receipt is an outstanding input" | `Terrace.purchasing` (`Casa.lean` l.26–39), via `MergeProof.Accent.riches` | Matches the evidence file. Not reviewed further (out of scope) |

## `trace-probe-assembly.tex`

| Manuscript | Source | Check |
|---|---|---|
| setup `t, a, q, β, τ_j` | `Glade.tide` (`Grid.lean` l.39–41) | `k=summit i`, `q=(a_i/a_k)^5`, `a=a_i^5` (the text writes `a=a_j` and uses `a^5`, consistently), `t=β̂_k`, `β=C.path.β N p k`. Root functional at `C.beta N p`. Matches |
| scale bounds `eq:ex-trace-probe-scales` | `tide` l.43–47, 82 | `β ≤ 2t` from `H.wilson.represents … band`; `β>0` from `Overlay.beta_positive`; `1 ≤ t` from `fits.delayed`; `1+2t ≤ Tau 230` from `(sapTree 1).sum((sapTree 2).push stickK)` + `toll_small`; `6c ≤ t` from `hrate ∘ Sstar`. Statement matches. See S1: the last two are proved in the source from tickets the monograph already uses |
| `𝔄`, `ρ_μ`, `ε`, `prev`, `𝒮_5`, `𝒮_0`, `c` | `Prism`, `Reed`, `present`, `orbitCost`, `blade`, `blade_cost`, `frames_night` (cited by the evidence file at `Turf.lean`) | Checked textually through their uses in `tide` l.78–82 (`reedEq`, `blade_cost`, `frames_night`, `Bowl.smul_mem`). The definitions in `Turf.lean` were not reopened in this review. The evidence file's description is consistent with those uses |
| covariance `eq:ex-trace-probe-covariance` | `readY` (l.55), `readUp` (l.57, needs window interiority `hY`), `prelude` (l.24–26) | Matches. N1: `stroll`/`backTo_add` need `Envelope`, obtained via `cylinder_env` from window interiority |
| paid errors `eq:ex-trace-probe-paid-errors` | `tide` l.64–66 (`hy`): `Bill.root i (basin i) l (tracks …) hw hh hL hk hl hp`, then `tends_price` | Matches: `E = Tau i (−430)`, the bill-prices proposition at grade 5 with `J=basin i`, `K=summit i` |
| coefficient conclusion (1) | `Probe.cost` (`Meteor.lean` l.23); `tide` l.79–86 | `coeffSize(columns(a•Z d)) ≤ a_j^5 · β̂_k^4` with `m=4`; the proof is `a·(c(2+2β)) ≤ a·t^4`. Matches the manuscript. N9: the evidence file's "`β̂^2 ≤ a^5 β̂^4`" is a misstatement |
| oddness | `Probe.hue = night … y` with `y = a • Z d`; `tide` l.78 | Matches (N4: the scaled statement) |
| root error (2) | `Probe.toll` first two clauses; `tide` l.58–73 (`hV` per component, then `teamW`) | Matches. The source bounds each component by `τ(−200)` and then averages; the manuscript averages first. Same bound |
| separated-site bound (3) | `Probe.toll` third clause (`Meteor.lean` l.27–28); `stageCrown` (`Crown.lean` l.20–21); `pew` (`HomePort.lean` l.16) | **M1.** The source test class is `‖g‖_∞ ≤ Tau j 150000`, `Interior (window 0 (lensScope C 4)) g`, `room j k (lensScope C 4)`, with `lensScope d = stencilRadius d + 4` (`MergeProof/South/Lens.lean` l.21). This is independent of `l`. The manuscript says "the same locality window". `pew` is the Wilson expectation of the product of the two observables translated to the anchors of the distinct scale-`j` sites. The manuscript's `𝔼[(·)(x)(·)(z)]` matches |
| Crown witness for `(𝒮_0J)_d` | `tide` hypothesis `Crown C i N p h.le (Reed (present _) (q • (x−β•y)) d)` | Matches l.205–210 |

## `trace-mission-price.tex`

| Manuscript | Source | Check |
|---|---|---|
| mission | `Terrace.Mission` (`PriceLimit.lean` l.29–31) | `terms`: eventually `t i → x i` along `𝓛`. `finances`: `∃ m`, eventually in `i`, `𝓛`-eventually `p`, `∃ h: Stern V i < p.1`, `Probe C m j p.2 p.1 h (a_j^5 • t i p)` with `j = (V i).k`. Matches, up to N6 (`a_i` means `a_{j_i}`) and N8 |
| probe content | `Probe` (`Meteor.lean` l.22–28) | Cost, oddness and root error match. The separated-site clause is stated with the fixed `lensScope C 4` window: correct. N7: the extra hypothesis "pullback chamber-interior" is not in `Probe.toll` |
| `eq:ex-trace-mission-finite-price` | `mileage` (`Meteor.lean` l.30–31), `told` (`PriceLimit.lean` l.23–26) | `‖pew … (O y) (O (ladd C b i N p 4 T0 v))‖ ≤ Tau i (−100)`, for `Tested T0`, `1 ≤ b ≤ tilt_cap i`, labels interior, `Probe`, `x ≠ z`. `told` identifies `C.numeric` with `pew`. Matches; the manuscript assumes it, as stated |
| `H_{i,p}(w)` | `heightV V i 4 · w = ladd C (b_zoom V i) j N s 4 ((V i).R N s ⟨4,_⟩) (ladder C 4 w)` (`ear_price` l.37, 49) | Matches the description: reference lift, selected grade-four transfer, zoom, frame level |
| `H_{i,p}(w) → y_i(w)`, `π_4 y_i(w) = U^{(4)}_i w` | `Gondola.terminal 4`, `Dash.arcing` (`ear_price` l.38–40, 43) | Matches |
| `eq:ex-trace-mission-table-limit` | `proxi` (`SkyEar.lean` l.61–62) | Finite-volume numeric two-point value → `S.useAt S (tag (a_k) l) ![⟨5, π_5 y⟩, ⟨d, π_d z⟩]` at the fixed point `tag(a_k, l)`. Matches |
| geometry | `nearPoint` (`SkyEar.lean` l.14), `beaconV` (l.53), `kamago` (l.55–58) | `nearPoint b = (⌈b⌉,1,1,1)`, `beaconV = tag(b⁻¹)(nearPoint b, 0)`, `X.r i • beaconV = tag(a_{(V i).k})(nearPoint b, 0)` from `X.r i = a_{(V i).k}·b`. Matches |
| conclusion | `ear_price` (`PriceLimit.lean` l.34–51) | `‖S.useAt S (X.r i • beaconV) ![⟨5, a_j^5 • π_5(x i)⟩, ⟨4, X.U i 4 w⟩]‖ ≤ Tau j (−100)` eventually, via `le_of_tendsto` on the norm. Matches |
| C14 edge | `spots` (`Ears.lean` l.68–69) | Not used by any of the three chapters (T1) |

## Not checked
- The definitions in `Terrace/Turf.lean` (`Prism`, `Reed`, `orbitCost`, `blade_cost`) were not reopened. Only their uses in `tide` were read.
- Producers outside scope: `purchasing`/`riches`, `Crown`/`stageCrown` internals, `concert`, `outside`, `Mission` producer `Slate.hullage`/`crestship`.
- No Lean elaboration, no `#print axioms`.
