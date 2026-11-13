# Textual Lean correspondence: PR #282 @ 5f664eb

Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, as imported under `Lean/` at base `69b2631`. The PR does not change `Lean/` or `source/`. All checks are textual: no elaboration, build or axiom audit was run. I checked every declaration in the author's `correspondence.md` that carries the lemma's logic.

| Manuscript step | Declaration (path) | What I read | Status |
| --- | --- | --- | --- |
| Profile cost `C_j = (2^{w(j)})^{q(j)}` | `YM.PhysicalNext.Repeat.Legato.step_cost` (`Lean/YM/MergeProof/Apres.lean` l. 35) | `def step_cost (a:Stage) := ((2:ℝ)^a.power)^a.order` | ✔ matches (power `w`, order `q`) |
| Clause `j ≤ i ≤ j+1, E_i ≤ x ⇒ C_j ≤ x` | `Legato.dusk` (Apres.lean l. 36); `YM.Push.PriceCompiler.StepStages` (`Lean/YM/Push/PRICE_COMPILER/Basic.lean` l. 27) | `dusk Y j := ∀ i k, StepStages i k → ∀ x, Y.betaEntry i ≤ x → step_cost (P.profile k) ≤ x ∧ …`; `StepStages j i := i ≤ j ∧ j ≤ i+1` | ✔ first conjunct; entrance `i`, profile `k` with `k ≤ i ≤ k+1` |
| Finite threshold, stable under enlargement | `Legato.shower` (Apres.lean l. 47–52) | per pair `eventually_ge_atTop (step_cost (P.profile k))` among finitely many conditions; `collect_upper`; conclusion `∀ U, DelayLe V U → dusk U j` | ✔ matches the lemma's description and calibration l. 223–253 |
| Adjacent pair `(J(N+1), J(N))` | `YM.Push.PriceCompiler.step_paid` (Basic.lean l. 155) | `StepStages (a.clock.J (m+1)) (a.clock.J m)` | ✔ |
| Payment at every level | field `pays` of `YM.Price…Paid` (`Lean/YM/Price/Intent.lean` l. 154) | `pays m : W.betaEntry (a.clock.J (m+1)) ≤ a.clock.hatBeta m`, for all `m` | ✔ includes `m = 0` |
| Budget = profile `J(N)` | `YM.Push.PriceCompiler.params_eq` (Basic.lean l. 166); `Levels.budget` (`Lean/YM/RG/History.lean` l. 141–145) | `a.params m = p.profile (a.clock.J m)`; `budget m` has `order := (params m).order`, `power := (params m).power` | ✔ |
| Caller performs the substitution | `Legato.chaletrail` (`Lean/YM/MergeProof/Inns.lean` l. 33–53) | `hw i := hc _ _ (step_paid _ i) _ (A.B.valid.pays i)`; final goal `change step_cost (A.B.a.params i) ≤ S.clock.hatBeta i; rw [params_eq A.B.valid]; exact (hw i).1` | ✔ same argument as the lemma, all `i` |
| Shift factor | `YM.Push.RelayDifference.jump` (`Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean` l. 53) | `jump P := ((2:ℝ)^P.power)^P.order`, so `jump (budget i)` unfolds to `step_cost (params i)` | ✔ `J_N` |
| Consumer | `YM.MergeProof.Fridge` field `shifts`, `YM.MergeProof.freezes` (`Lean/YM/MergeProof/Portions.lean` l. 16–32) | `freezes` assumes `∀ i, jump (budget i) ≤ hatBeta i` and proves `shifts` via `(beta_slow hG).below`, with `0 ≤ jump` by `positivity` | ✔ domination as in the lemma's last paragraph |
| Prices `(J_N+1)c`, `2b` | `RawProtected.heighten`, `shiftCosts` (RawTop.lean l. 220–235) | prices `(ht.mul hc).add hc` and `hb.add hb` | ✔ |
| Subpower | `YM.Push.RelayDifference.Slow`, `flight`, `beta_slow` (`Lean/YM/Push/RELAY_DIFFERENCE/Rates.lean` l. 40, 58, 169) | `Slow w := ∀ ε>0, ∀ᶠ j in f.fuse, ‖w j‖ ≤ exp(ε · scale j)`; `beta_slow` needs `G.Simple` | ✔ agrees with the ordered-cutoff "subpower" of the manuscript; simplicity is a standing hypothesis of the section (relay l. 7) |

## Remarks

- L1. The source proves the coupling's slow growth (`beta_slow`) through a receipt (`Work.I04.hat_receipt`) that needs `G.Simple`. The manuscript can use the elementary route `β̂_N = β_* + s_G s_N` (M2 in `README.md`). Both are consistent. Simplicity remains a section hypothesis either way.
- L2. The name `chaletrail` and its other premises (`Makes`, marked portfolio, `paper`) are outside this lemma. The author correctly leaves them as section hypotheses.

No mismatch found between the lemma and the source.
