# Independent review of PR #420: the running estimate (R) on the trace chart window

- Unit: YM-000026 (C13 trace chart window), `manuscript/existence/actual-rank-purchases.tex`,
  `subsec:rank-trace-chart-window`: new `lem:rank-trace-running`, revised
  `lem:rank-trace-endpoint`, `prop:rank-trace-chart-window` and its Status paragraph; author note
  `blueprint/units/YM-000026/handoff/results/C13/author/hairer-claude-R-20261114/README.md`.
- Role: mathematical validity and Lean correspondence, reported separately below.
- Reviewer: ADB991 (account). Agent assistance: Claude (Anthropic), running as a scheduled agent
  for @ADB991, session `ADB991-claude-20261115-e5ac`. ADB991 had not read this report before
  submission. It is not a human acceptance.
- Independence: this account wrote none of the reviewed text. The "independent agent review"
  posted on #420 came from the author's own account, so it does not count as an independent review
  under `docs/proof-standard.md`.
- Reviewed: PR #420 head `ab094b8d` (branch `claude/issue-R-hairer`), stacked on #411 head
  `e8284b43`. SHA-256 values of every inspected file are in `hashes.json`. The diff from the base
  touches only `actual-rank-purchases.tex` (+52/−14) and adds the author note. The cited sections
  are byte-identical at base and head.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task: #419, claim https://github.com/hairer/humanise-yang-mills/issues/419#issuecomment-6887725705.
- **Outcome:** mathematics is accepted locally, conditional on the inputs named in §3. The Lean
  correspondence is faithful. No change is required. One should-fix (S1) and four optional notes
  (N1–N4) follow.

## 1. Mathematical validity

### 1.1 The statement

For every η > 0 there is m₀(η) such that

  |β_{N,p,m} − β̂_m| ≤ c_R + η s_m   for all m ≥ m₀(η), N ≥ m and all p,

where β̂_m = β_* + s_G s_m is the clock and c_R = |b − β̄| + |β̄ − β_*|. Here b is the prescribed
level-zero coupling and β̄ is the shooting intercept.

### 1.2 The proof, step by step

1. **Index match.** `sec:surviving-interval-shooting` uses the recursion S_{i+1} = S_i + log L_i,
   where L_i is the block side of level i and ε_{i+1} is the allowance of the stage assigned to
   level i+1. `sec:common-scale-selection` uses s_{m+1} = s_m + log L_{J(m+1)} and records the
   dictionary L_i = L_{J(i+1)}, ε_{i+1} = ε_{J(i+1)}, at lines 213–225 of
   `common-scale-selection.tex`. Since S_0 = s_0 = 0, the recursions agree and S_i = s_i.
   **Checked.**
2. **Change of line.** The shooting line is β̄ + s S_i with s = s_G. The text sets s = s_G
   explicitly at line 9 of `surviving-interval-shooting.tex`, so the shooting line equals
   β̂_i + (β̄ − β_*). **Checked.**
3. **Applying eq:shoot-running-error.** That estimate is |β_i − (β̄ + sS_i)| ≤ E_i + |b − β̄|,
   uniformly over selected cutoffs N ≥ i and periods. The triangle inequality then gives
   |β_{N,p,i} − β̂_i| ≤ E_i + c_R. E_i = Σ_{j<i} ε_{j+1} is a sum of stage constants fixed before
   the block lengths, so it is independent of N and p. **Checked.**
4. **E_i = o(s_i).** Lines 213–225 of `common-scale-selection.tex` give
   ε_{J(m+1)} / log L_{J(m+1)} ≤ J(m+1)^{-2}. Together with J(m) → ∞ this is
   eq:shoot-drift-ratio. Since J is nondecreasing, choose j with J(l+1)^{-2} ≤ η/2 for all l ≥ j.
   Then
   E_i − E_j = Σ_{j≤l<i} ε_{l+1} ≤ (η/2) Σ_{j≤l<i} log L_{J(l+1)} = (η/2)(s_i − s_j).
   Since s_i ≥ i log 3 → ∞ (eq:common-scale-brackets), E_j ≤ (η/2) s_i eventually. Hence
   E_i ≤ η s_i for i beyond a threshold that depends only on η and the schedule. **Checked.**
   This is the argument at lines 139–150 of `surviving-interval-shooting.tex`, repeated with the
   offset c_R kept outside the o(s_i) term.
5. **Endpoint lemma.** Take η = s_G/16. Because c_R is a fixed constant, eventually
   c_R ≤ s_G s_k / 16, so the right side is at most s_G s_k / 8. Since β_* > 1 (the choice of β_*
   in `common-scale-selection.tex` l.56), s_G s_k ≤ β̂_k, and the bound is at most β̂_k / 8.
   **Checked.**
6. **Removal of (R).** `prop:rank-trace-chart-window` and the Status paragraph no longer assume
   (R). A `git grep` at `ab094b8` over `manuscript/` and `blueprint/` finds no remaining use of
   the input "(R)" of this subsection. The only hit is the superseded #398 author note
   (`results/C13/author/hairer-claude-398-20261114/README.md` l.21, l.27), which is a historical
   record. **Checked.**
7. **Agreement with the old (R).** The old (R) bounded the error by |β̄ − β_*| + η s_m, which
   absorbs |b − β̄| into η s_m. The new statement keeps it in c_R. Both forms are correct, and the
   endpoint lemma absorbs either one.

### 1.3 Findings

**S1 (should fix).** Section `actual-rank-purchases.tex` never states that β_{N,p,m} is the coupling
at level m of the history selected at cutoff N and period p in `sec:common-funded-history`, that is,
β_i of `sec:surviving-interval-shooting` for that history. The author note lists this
identification as uncertain.

I checked it. `restarted-rank-history.tex` l.213–216 ("Above k, retain the original history. At k,
use its actual representation … set the coupling identically β_{N,p,k}") shows that the chart's
coupling is that of the original selected history. In the source, `follows_prices` bounds `(C.path.rep N p k).beta`, and `bush_start` (`Leashes.lean`)
identifies the chart's starting coupling with it (`hb : P.beta = V.beta`, V = `C.path.rep N p k`). That is the same `History` whose
`Selected.running` is used (see §2). So the identification is correct.

Requested change: one sentence in `subsec:rank-trace-chart-window`, before the lemma, citing
`sec:common-funded-history`.

**N1 (notation).** The letter b is used for two things in the same subsection. At l.331 it is the
chart's base arc ("base arc b ≤ b̄"); at l.338 it is the level-zero coupling. The author's own note
on #420 says the same. A rename such as b_0 or β_{sel,0} for the coupling would remove the clash.

**N2.** "so that |b − β̄| ≤ β̄/2" is true, but the shooting construction actually imposes the
stronger |b − β̄| ≤ h = min{β̄/2, s log L_0 / 4} (`surviving-interval-shooting.tex` l.99–106). The
proof only uses the finiteness of c_R, so either bound will do. "for instance" or "in particular"
would avoid reading the weaker bound as the defining condition.

**N3.** The proof writes J_{i+1}^{-2} with the indexing of `sec:surviving-interval-shooting`, where
J_i is the stage of level i. That is J(i) of `sec:common-scale-selection`, which the subsection
otherwise follows. A parenthetical "(the stage J(i+1) of Section …)" would help. Separately, and
outside this diff: the drift floor eq:common-drift-floor uses min{s_G/4, 1/j²} for j ≥ j_*. That
expression is undefined if j_* = 0, and the manuscript does not state j_* ≥ 1. Only the eventual
behaviour matters here, so this has no effect on #420.

**N4 (optional).** Step 4 of the proof re-derives l.139–150 of `surviving-interval-shooting.tex`.
Citing that estimate and adding |β̄ − β_*| would be shorter. The present form has the advantage of
keeping the constant explicit. This is the author's choice.

## 2. Lean correspondence

I inspected the source as text at the pin. I did not elaborate it (see §4).

- `YM.RG.Calendar.hatBeta` (`Lean/YM/RG/History.lean:79`) is `S.bar + G.slopeConstant * S.schedule.scale m`.
  So the clock is affine in the scale with slope `G.slopeConstant`, matching β̂_m = β_* + s_G s_m,
  with β_* ↔ `clock.bar` and s_G ↔ `G.slopeConstant`.
- `YM.RG.History.Transfer` (l.223–227) holds
  |β_{m+1} − β_m − slopeConstant · log(block m)| ≤ (params (m+1)).drift. This matches the first
  inequality of eq:shoot-adjacent-drift, with the allowance indexed by level m+1 as in the
  manuscript.
- `YM.RG.History.Running` (l.229–230) states: ∀ε>0, eventually in m, ∀ N p, m ≤ N →
  |β N p m − hatBeta m| ≤ ε · scale m. `Selected.running` (l.240) makes it a field of the selected
  history, and `Selected.reaches` (l.239) fixes β N p 0 = `clock.bar`. In the source, therefore,
  b = β_* and the running estimate has no additive constant. The manuscript's c_R is a harmless
  generalisation, consistent with schmittj's earlier note in
  `results/C13/review/schmittj-claude-g3-20261114/lean.md` l.117. The manuscript derives the
  estimate from the drift schedule. The source takes it as a field of `Selected`, supplied by the
  producer of `M.wilson`. This is a reorganisation of the argument, not a mismatch.
- `YM.PhysicalNext.InteractingRank.follows_prices` (`Leashes.lean:48`) gives, eventually in k,
  ∀ N p, k ≤ N → |β_{N,p,k} − clim k| ≤ clim k / 8. Here `clim` is `Atlas.clim A k :=
  A.clock.hatBeta k` (`Lean/YM/Next/RANK/ParticleGate.lean:26`). The proof uses
  `M.wilson.running (slopeConstant/8)` and `bar_pos`. That is the manuscript's endpoint lemma
  (with η = s_G/8 and no c_R); the manuscript uses η = s_G/16 in order to absorb c_R. The statement
  is the same. **Faithful.**

## 3. Dependencies and remaining uncertainty

- The lemma is conditional on eq:shoot-adjacent-drift for the actual selected histories.
  `surviving-interval-shooting.tex` l.20–32 states it as a combination of the stage bound on the
  scalar shift α_{N,i} and the purchased reset width. This PR does not change that status, and I
  did not re-review those producers.
- It is also conditional on the drift floor eq:common-drift-floor being included in the stage
  floors. It is, by item 2 of the floor list (`common-scale-selection.tex` l.193–206).
- The identification s_G = 2b₀(G) is correctly kept out of scope. Only `public-run-binding.tex`
  needs it.
- Not checked: the base #411 itself (under separate review), and the rest of
  `prop:rank-trace-chart-window`'s proof beyond its use of the endpoint lemma.

## 4. Commands actually run

- `git diff e8284b4 ab094b8 -- manuscript/` (read in full).
- `git show ab094b8:<file>` for `surviving-interval-shooting.tex` (whole),
  `common-scale-selection.tex` l.1–280, `common-funded-history.tex` l.255–287,
  `restarted-rank-history.tex` l.205–225, `actual-rank-purchases.tex` l.300–480,
  `Lean/YM/RG/History.lean` l.60–82 and l.200–255, and `Leashes.lean` l.1–80.
- `git grep` for remaining uses of "(R)", for `bar\beta`, for `beta_{N,p,` and for the `hatBeta`
  and `clim` definitions at `ab094b8`.
- `sha256sum` of every inspected file at head and base (`hashes.json`).
- Full build of the reviewed head: `git archive ab094b8 manuscript`, then `latexmk -pdf -interaction=nonstopmode
  -halt-on-error existence.tex`. Exit code 0, 1056 pages, no undefined references in the log. I inspected
  p. 872 (Lemmas 203.1 and 203.2, start of Proposition 203.3); it renders correctly.
- `python3 scripts/check_blueprint.py` (OK) and `python3 -m unittest discover -s tests` (22 tests, OK) on this
  report branch.
- Lean was not elaborated: the Mathlib hosts are blocked in this environment, so the Lean checks are textual only.
