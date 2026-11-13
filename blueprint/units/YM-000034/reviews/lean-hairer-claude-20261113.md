# Review of a proof unit

- Unit: YM-000034, `blueprint/units/YM-000034/`
- Role: Lean correspondence
- Human reviewer: `hairer` (account under which this report is submitted; no human acceptance is recorded by this report)
- Agent assistance: the whole review was done by a Claude (Anthropic) agent session, `hairer-claude-issue34-review-20261113`. The unit was drafted with GPT-6.1 Terra (Codex).
- Content SHA-256: `59b66debcf4ebb92ff4ff13f8c71ab481350e623ed61dc37fd91ddabd60f1ba7` (`python3 scripts/check_blueprint.py --fingerprint YM-000034` at `69c254b`)
- Manuscript files and labels: `manuscript/existence/trace-branch-moments.tex`, `prop:ex-branch-moments`, `prop:ex-branch-washout`; `blueprint/units/YM-000034/correspondence.md`
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Review task and PR: issue [#34](https://github.com/hairer/humanise-yang-mills/issues/34); author PR #70; this report's PR: draft against `codex/existence-monograph`.
- Outcome: **accepted locally for the items checked below; the input correspondence is only partly covered.** No discrepancy found and no required change. **No Lean was elaborated:** the toolchain is unreachable from the review environment, so `#print axioms` for `nearing_h` and `muteP` was not run.

## Findings and evidence

All by reading the pinned source (`Lean/YM/TraceExtension/Shelves/Pear.lean` and the definitions below).

- **Branches.** `Bend := Option Bool` (`Slate/Pave.lean` 23): `none` is the principal branch (`Zn.Meld`), and `some c` are the corrections `Plint G n c` built from `Toca c` (`Margin/Mallet.lean` 15–16). `Toca true` is \(\tfrac14\sum\) of the diagonal pair labels on the diagonal; `Toca false` is the off-diagonal pair sum. These are the manuscript's \(J^+\) and \(J^-\). The manuscript's \(\{0,-,+\}\) is `{none, some false, some true}`.
- **Coefficients.** `BornZ i = i.elim (-tribe) azure`, with `tribe = ![1,-1/4,1]` (`Slate/April.lean` 26–27) and `azure M = if M then ![0,1/4,0] else ![0,0,1]` (`Margin/Mallet.lean` 14). This gives \(w^0=(-1,\tfrac14,-1)\), \(w^+=(0,\tfrac14,0)\), \(w^-=(0,0,1)\).
- **Material tensor.** `materialB C t = material (Cells.standard C) (Fin.cons 0 (BornZ t))` (`Pear.lean` 50). `material S w a b = fromPol S (stress G w a b)`, with `fromPol = S.project ∘ coords` (`Push/STRESS_FLUX/Lift.lean` 24, 147). `stress` is, on the diagonal, `t 0 • unit + t 1 • Σ_i pair a i a i + t 2 • ΣΣ pair i j i j`, and off the diagonal `t 3 • Σ_i pair a i b i` (`Polynomial.lean` 177–179). With `t 0 = 0` this is \(\pi_0\mathcal S(w)=M(w)\). `pair_value` reads \(\langle F_{ab},F_{cd}\rangle\) with no extra factor, matching the manuscript's \(P_{ij,kl}\).
- **First proposition.** `chartB` says `Phase4 J V Z j (baron S X k) = inter (Moment4 … (Shine4 Z X k)) ·` for `k = Stern V j`, with `inter f a b = ½(f a b + f b a)` (`Shelves/Tonic.lean` 49). This is the chart-array identity, with \(\mathsf M_i\) = `Moment4`, the transported averaged coefficients = `Shine4` (`swale` of `OrbitT`), and \(\operatorname{sym}\) = `inter`. `nearing_h` concludes `Tendsto (fun k => Phase4 J V Z k (baron S P' (Stern V k))) atTop (𝓝 (materialB C B))`. Its hypotheses `hZ : Tendsto (Moment4 Z J V) atTop (𝓝 (Hill4 C))` and `tiara` (`Shine4 → BillC (BornZ B)`) are the moment input `eq:ex-branch-moment-input` and the coefficient input `eq:ex-branch-coefficient-input`. `Courtis` (`Hill4 C (BillC Fᵣ w) = material … (Fin.cons 0 w)`) is the step \(\mathfrak c_0\pi_0\mathcal S(w)=M(w)\), proved there from the vanishing expectation of the pair labels. The summit indexing `Stern V k` is the manuscript's \(k_i\).
- **Washout.** `muteP p (hl : B ≠ some true)` concludes `Tendsto (fun i => H!(Stern V i)^p • Σ_a Phase4 J V Z i (baron S P' (Stern V i)) a a) atTop (𝓝 0)` for every natural `p`. This is `eq:ex-branch-washout` for \(b\in\{0,-\}\) and each fixed \(p\in\mathbb N\), with the clock evaluated at the summit level. The proof route (`Thin` gives `Fast` of the raw diagonal sums `Zees`; `centering` fixes them via `stitch_k`; `Vigor` with `hZ`) mirrors `prop:ex-branch-raw-fast` followed by `prop:ex-branch-washout`.

## Required changes and remaining uncertainty

No required change for this role.

Not checked:

- Elaboration, and the axiom prints of `nearing_h`, `muteP` and `chartB`.
- The bodies and hypotheses of `tiara`, `Thin`, `Vigor`, `heroicB`, `strikes`, `Dash.arcing`, `stitch_k`, `OrbitT`, `swale`, `Moment4`, `Shine4` and `baron`, beyond their roles above.
- The structured hypotheses `Grant`, `Rod`, `Gondola`, `StarPath`, `CellHyp`, `Sceptre`, `PostT`, `Stock.Tabs` and `supportQ`. The correspondence record lists them as inputs, and I found nothing inconsistent in what I read.

A reviewer with a working Lean setup should run the axiom prints and confirm the elaborated statements of `nearing_h` and `muteP`.

## Acceptance

No acceptance is recorded. A responsible human reviewer may record Lean-correspondence acceptance for the checked scope, preferably after the axiom prints have been run.
