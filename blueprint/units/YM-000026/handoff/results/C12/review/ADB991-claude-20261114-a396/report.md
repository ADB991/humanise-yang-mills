# Independent review of PR #344 (`sec:ex-stored-service-budget`)

- Unit: YM-000026, C12 `manuscript/existence/original-history-portfolio-attachment.tex`. The review covers the new subsection "Budget and domain of the stored service" (`prop:ex-stored-service-budget` and the three paragraphs after it) and the author evidence `results/C12/author/hairer-codex-321-2351/README.md`.
- Role: mathematical validity and textual Lean correspondence. Independent, from a different account.
- Human reviewer: none. Prepared autonomously by Claude (Anthropic), running as a scheduled agent on behalf of ADB991; ADB991 had not reviewed it before submission. ADB991 did not author #321, PR #344 or any hunk of this chapter (`git log` on the file shows hairer, TrishenGunaratnam, Johannes Schmitt, Martin).
- Agent assistance: Claude, sole reviewer, no subagents.
- Session and claim: `ADB991-claude-20261114-a396`, https://github.com/hairer/humanise-yang-mills/issues/321#issuecomment-6868537481
- Reviewed: PR #344 head `961df9407c4715bcd0911e48ae79594c7c643a12` (merged as `3afa7db9`). The chapter is unchanged between the PR head and `codex/existence-monograph` @ `97f806c7`. Chapter blob `56cd32a4e8783d20a32c1e982e69edeb0f23f640`; evidence blob `f81b53bbd8a4603a5b137faafce7b264e2859a37`. SHA-256 values of every inspected file are in `hashes.json`.
- Source revision: upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. `Lean/` is identical at the PR head and at `97f806c7`.
- Outcome: **no mathematical error and no required change.** The proposition holds and its proof is complete; the domain and price dictionary match the source.
  - One *should* item, S1: the evidence (and one sentence of the proof) describes the price-compiler purchase route, not the route that actually produces the selected run's clock. The mathematics is the same on both routes, so this concerns locators and wording only.
  - Minor wording items N1–N4 and optional item O1.

This review addresses #328 M2 ("R1 room and bank has no manuscript producer"). With this subsection, M2 is **resolved**: `prop:ex-stored-service-budget` is a manuscript export of R1.

## What was checked

### 1. The two inequalities are the source's `roomCost` and `Bank`

- Room. `YM.Bid.roomCost A P := ∀ i, 64*(P.K (J i + 1))^2 ≤ (A.params i).columns` (`Lean/YM/Bid/Loan.lean:36-39`), with `Calendar.params m := stage (J m)` (`Lean/YM/RG/History.lean:77`). So the inequality is $64W(J(i)+1)^2\le c_{J(i)}=C_i$. Checked.
- Bank. `YM.Bid.Bank W A := ∀ i, 100000*(W.K (J(i+1)+1))^6*(1+(A.params (i+1)).columns)^2 ≤ puffs (A.S.block i)`, where `puffs L = L^(1/8)` (`Loan.lean:34, 43-46`). In the proof of `Bid.buffer` (`Loan.lean:48-58`), `L.S.block i = D.L (J (i+1))` follows from `fits.sameFactor` and `clock.factor = D.L`. So the right side is $\ell_{J(i+1)}^{1/8}=L_i^{1/8}$, and $(A.params(i+1)).columns=c_{J(i+1)}=C_{i+1}$. This is the manuscript's second inequality, and the level-$i$ block is indeed chosen at the entrance stage $J(i+1)$. Checked.
- Both predicates quantify over every `i : ℕ`, so $i=0$ is included. Checked.
- $C_i$ is the $\Gamma_i$ of `thm:ex-selected-run-service` ("writing $\Gamma_i$ for the columns"), and it has nothing to do with the running-coupling increment. Checked.

### 2. Proof of the proposition

- With columns fixed first and $A_j=100000W(j+1)^6(1+c_j)^2\ge100000>0$, every $\ell_j\ge n_j=\max\{1,\lceil A_j^8\rceil\}$ satisfies $\ell_j^{1/8}\ge A_j$, because $t\mapsto t^{1/8}$ is increasing on $[0,\infty)$. This explicit floor replaces the non-explicit `Tendsto … eventually_ge_atTop` choice in `Bid.buffer`; the replacement is valid. Checked.
- The floor enters through `Large.need : floorL j ≤ L` (`Lean/YM/Price/Intent.lean:42`). `Rolls` requires the *lengths* to be monotone (`grow`), not the floors. The proof's remark "if nondecreasing floors are required, take the running maximum" is therefore harmless but not needed for this source. Checked.
- Room does not depend on lengths. Bank depends on the columns only through $c_{J(i+1)}$, which is fixed before the floors are chosen. Hence the conclusion holds for *every* clock $J$, that is, for every choice of entrance delays, as `Bid.buffer` states (its conclusion is over all `M : Levels G` with `M.clock.factor = D.L` and `M.clock.stage = P.profile`). This justifies the closing sentence of the proof. Checked.
- Substituting $j=J(i)$ and $j=J(i+1)$ gives the two displayed inequalities. Checked.

### 3. Which purchase the selected run uses (see S1)

`Bid.buffer` has three callers in the tree:

1. `YM.Push.PriceCompiler.Before.enoughFloors` (`Push/PRICE_COMPILER/Pre.lean:126-140`, with columns `columnFee`, a prefix maximum, `Authors.lean:87-100`);
2. `YM.Next.Scheduling.Prepaid.floors` (`Next/SCHEDULE/Pre.lean:103-115`, columns `worth (desired q)`, `Melt.lean:112-136`);
3. `YM.Extra.Histories.Doors.afford` (`Extra/SOURCE_HISTORIES/Reserve.lean:76-104`), which uses `Plans.columns`.

The selected run is `Run.b : Bandage kit y w` (`FullVolume/Cross.lean:30-45`). Its clock is `Bandage.clock : Doors.Budget A.B.a C B` (`…/Stage/Iris.lean:32`). The Ponds producer for the selected run uses exactly `R.b.clock.room` and `R.b.clock.bank` (`FullVolume/Shroud/Pool.lean:48`), and so does the direct route (`Geyser.cost/back` inside `Ties.scrim`). Within the files inspected, `Doors.Budget` is concluded only by `Doors.afford`. That theorem is reached through `MergeProof.sailsV` (`MergeProof/Seaside.lean:96-115`; `Doors.afford` at line 115, `PaidView` gives `Doors.Budget a C p` at line 77). On that route:

- the worth is the explicit `W.K k = 1 + Σ_{j≤k} Σ_{d≤j} (C j+1)·orbitCost(level d)`, built in `Doors.alone` (`Reserve.lean:108-131`) before the columns;
- the columns are the **pointwise** maximum `max (old columns) (max (price (max order power)) (64 W(j+1)^2))` (`Reserve.lean:122-125`);
- the factorial request is bought separately, earlier, by `Extra.Multi.buyFactorial` in `ThroughLaunch.developer` (`PhysicalNext/UNMASKED_THROUGH_LAUNCH/Dome.lean:105-120`).

I did not trace the full chain from `Run.ramp`/`dagger` down to `sailsV` declaration by declaration. The statement "the selected run's clock comes from `Doors.afford`" therefore rests on the type `Doors.Budget` and on its only producer found in the files inspected.

The mathematical content is identical on all three routes. Each takes the room request into the column count before any length is chosen, then lets `Bid.buffer` choose the length floor. So the proposition and its "in particular" sentence are correct.

### 4. Domain of the common interface

- Direct route. `Run.again` gives `Ties`, and `Ties.scrim : Scrim R.family R.w far waybill near renal fly mutt R.doors` (`Cross.lean:68, 73`). Then `Scrim.costs : Geyser …` (`MergeProof/Biscuit.lean:29-30`), and `Geyser.pond` gives `Ponds … p k N` for **every** $k$, including $k=0$ (`FullVolume/Fields/Pond.lean:29-32`; no hypothesis $1\le k$). Checked.
- Restriction to $k$. `allRetain` gives `Retain … N p k`: `days` for $k\le i<N$ and `endow N` (`Fields/Tarry.lean:16-20`). This is meaningful at $k=N$ with no door. Checked.
- The stock clause needs `C.ref j ≤ k` and `k ≤ N` (`Pond.lean:28`). The music clause `Freightage` comes from `Geyser.aim` with `ref ≤ N`, and its doors are `C.ref d ≤ m < N` (`Badlands.lean:38-41`). Checked.
- The centered birth estimate uses $k<N$, as stated in `thm:ex-selected-run-service`. Checked.
- Campaign route. `Campaign.doorT` is the recorded gate for $1\le m$ and `⟨0⟩` otherwise (`Shroud/Pool.lean:34`). `Campaign.ponds` assumes `1 ≤ i` (`Pool.lean:37`). `Campaign.billbook : Album.family … (visible …) (stamped …) = R.family := rfl` (`Shroud/Clan.lean:57-65`). So the families agree definitionally and the door fields are separate data. This matches the text, which makes no door identification. Checked.

### 5. Price dictionary

The argument order is `Scrim/Geyser/Ponds C W u ψ φ δ ζ r D` (`Biscuit.lean:29`, `Badlands.lean:42-44`, `Pond.lean:22`), instantiated as `R.w, far, waybill, near, renal, fly, mutt, R.doors`. With $x_m=\widehat\beta_m$:

| Ponds slot | source | value | manuscript |
| --- | --- | --- | --- |
| $u$ (terminal-bank reserve) | `far p m = stub (hatBeta m)`, `stub x = Hat x/4`, `Hat s = (√s)⁻¹` (`Stove.lean:39`, `Tender.lean:14`, `Vac/Treasury.lean:71`) | $x_m^{-1/2}/4$ | $u_i=x_i^{-1/2}/4$ ✓ |
| $\psi$ (waybill) | `waybill a m = 2*(exp (budget (m+1)).supportExponent * Cub.title G (params (m+1)))` (`Escarp.lean:26`) | twice level-$(m{+}1)$ title × exp of its support exponent | ✓ |
| $\varphi$ (marched multiplier) | `near p m = sap (hatBeta (m+1))`, `sap x = x⁻¹` (`Stove.lean:38`, `Tender.lean:13`) | $x_{m+1}^{-1}$ | ✓ |
| $\delta$ (probe price) | `renal p m = probe (hatBeta (m+1))`, `probe x = x^(-2)` (`Stove.lean:36`, `Revenue.lean:31`) | $x_{m+1}^{-2}$ | ✓ |
| $\zeta$ (grade height) | `fly p d m = fog G d (hatBeta m)`, `fog G d x = (x^winter G d)⁻¹`, `winter G d = degree (level d) + 4` (`Stove.lean:37`, `Tender.lean:11-12`) | $x_m^{-(\deg F_d+4)}$ | ✓ |
| $r$ (occupancy) | `mutt p Q m = Q (J (m+1))` (`Stove.lean:40`) | $N_{J(m+1)}$ | ✓ |

The terminal endowment sentence agrees with `prop:selected-centered-retention` (same $C^{\rm end}_N$, same bounds $3$ and $1$, paid at $J(N+1)$ with no door beyond $N$). That proposition was reviewed in #330.

## Findings

### Mathematics

None. The proposition and its proof are correct; the domain and dictionary paragraphs are accurate.

### Should

**S1. Purchase route: evidence locators and one proof sentence.**
- The evidence README attributes the room request to `YM.Push.PriceCompiler.columnFee` / `Before.room_cols` / `Before.enoughFloors` ("Pre.lean" there means `Push/PRICE_COMPILER/Pre.lean`, not `Next/SCHEDULE/Pre.lean`).
- The proof says the column count is chosen "as a running maximum of the room request $64W(j+1)^2$, the factorial of the stage derivative order and the other pre-length column requests". That is `columnFee`.
- The selected run's clock is a `Doors.Budget`, produced by `Doors.afford` from `Doors.Plans`. On that route the columns are a pointwise maximum (`Doors.alone`), the factorial is bought earlier by `Extra.Multi.buyFactorial`, and the worth $W$ is the explicit sum in `Doors.alone` (§3 above).

Suggested fix:
- In the manuscript, say only what the proof uses: "choose each stage column count at least the room request $64W(j+1)^2$ (together with the other pre-length column requests), before any length is chosen". A running maximum is permitted but not needed.
- In the evidence, cite `YM.Extra.Histories.Doors.alone`, `Doors.afford` and `Doors.Budget.room/bank` (`Reserve.lean:65-131`) and `MergeProof.sailsV` (`Seaside.lean:96-115`) as the selected run's producer. Mention the price-compiler route as a parallel caller of the same `Bid.buffer`.

### Minor

- **N1.** "every allowed schedule" is not defined in the subsection. The source quantifier (`Bid.buffer`) is: every length-floor sequence at least the purchased floors, every admissible family of block sides `Rolls` for it, and every clock $J$ whose stage profile is the purchased one and whose factors are those sides. One clause saying this would make the "independently of grade, cutoff and period" sentence self-contained.
- **N2.** "Any subsequent increase preserves the two purchases": this is true for increases of floors or lengths. It is false for an increase of a column count after the floors are fixed, because the bank's left side grows with $(1+C_{i+1})^2$. The author evidence makes this point, but the proof does not. Suggest "any later increase of the floors or block sides".
- **N3.** The same number $x_{i+1}^{-1}$ is called $y_i$ in `prop:selected-centered-retention` (site-rooted input price) and $\varphi_i$ here (marched multiplier). Both readings are correct: in the source it is `near`, used both as the `Ponds` slot $\varphi$ and as the `Volant` input price. A parenthetical "($=y_i$ of Proposition~\ref{prop:selected-centered-retention})" would prevent a reader from thinking these are different prices.
- **N4.** "An integer count can be used by taking ceilings": `Stage.columns` is real-valued (`RG/History.lean:53`). The remark is harmless, since increasing a column before lengths are chosen preserves both purchases, but it is not needed.

### Optional

- **O1.** `thm:ex-selected-run-service` states "The lower restriction $k\ge1$ is retained from the public service constructor". The new paragraph shows that the direct route (`Geyser.pond`) has no such restriction, and that $k\ge1$ comes from the campaign route (`Campaign.ponds`, `1 ≤ i`). A cross-reference from the theorem to `sec:ex-stored-service-budget` would record that the restriction belongs to the campaign constructor and not to the common interface.

## Checks run

- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- LaTeX: not built. This report changes no LaTeX, and the reviewed chapter is unchanged since the author's build.
- Lean: no build or replay. The correspondence is textual and covers the declarations cited above.
