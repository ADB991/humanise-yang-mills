# C06 response to source audit rows 63 and 64

Issue [#186](https://github.com/hairer/humanise-yang-mills/issues/186), following
the inventory in [PR #164](https://github.com/hairer/humanise-yang-mills/pull/164).
Contributor Trishen Gunaratnam (@TrishenGunaratnam), with Codex assistance.
Base `2017d6f3ee648beb054322e9b994eb3c757cbcf6` on
`codex/existence-monograph`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`,
Lean tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`.

| Row | Manuscript response | Correspondence at the source pin |
| --- | --- | --- |
| 63 (B) | The local reading-error bound $\delta\tau$ and guide bounds $A\tau/L^2$ and $A\tau$ are retained as inputs on the radius-$B$ event outside the enlarged seed region. The mean, controlled fluctuation and nonlinear errors still each contribute at most $\delta\tau/3$. | `YM.ConnectedActivityE6.Coat.ready`, `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Peak.lean:92–175`, makes this estimate in the proof at `htick` for a fine or predictor row whose focus is the coarse site under consideration. Its parameter `τ` corresponds to the manuscript allowance $\delta$, and `X.t` to the manuscript scale $\tau$ (`Coat.lean:61–62`). The bound combines the estimate from `strokes`, the affine change controlled by `hips` on `Coat.watch`, and the mean estimate `YM.ConnectedActivityE6.Coat.pressure_mean` (`Mean.lean:100–103`). `YM.ConnectedActivityE6.tiny_flame` (`Peak.lean:21–31`) gives the eventual one-third bounds for the mean and nonlinear errors. The same proof uses the guide conditions in `Maximum.phi` and `YM.ConnectedActivityE6.SliceRows.paysGuide` (`Remainder.lean:92–98`). The conclusion of `ready` supplies the local likelihood and chord plateaus for the funded and stamped data in its hypotheses. |
| 64 (B) | The concrete radii move here. The lemma retains the geometric margin $R_c\ge R_p+B$ and the transfer from a radius-$2B$ event at the warning site to radius-$B$ events at nearby sites. | The plateau starts outside $R_p=30B$ in `YM.ConnectedActivityE6.Coat.ready` and `YM.ConnectedActivityE6.Coat.blowing` (`Guards.lean:35–41`). The mask, likelihood and contraction warnings use the compulsory region determined by $R_c=300B$. `YM.ConnectedActivityE6.Coat.mandatory` (`Alert.lean:64–74`) tests intersection of a warning's district with the radius-$300B$ seed neighborhood, defined by `YM.Pressure.Stores.dome` (`Lean/YM/Pressure/Seeds.lean:42–44`). `Coat.mandatory_far` and `Coat.watch_turn` (`Guards.lean:24–28`) give the distance and watch transfers used by `blowing`. The separate bond-cutoff warning `Coat.aura` uses its own support test outside `X.plaza (X.seeds.dome (304*X.B))` (`Alert.lean:76–79`). `YM.ConnectedActivityE6.Target.issue` handles that branch by the pointwise bond bound (`Issue.lean:172–185`). |

The X2 and X3 entries in `ledger.md` retain their recorded scope. The local
plateau, mean and physical covariance bounds remain explicit inputs to the
warning argument. Section `sec:warning-safety` describes the deterministic
plateau estimate on the funded data. This response makes no new claim about
matching the required covariance or budgets to the selected family.

## Checks

- Inspected the listed source declarations and the definition of `Shell.Inside`.
  The nine inspected Lean files match `Lean/SOURCES.sha256` using
  `shasum -a 256 -c` on their manifest entries.
- `python3 scripts/check_blueprint.py` passed for four units. The diff
  passed `git diff --check`.
- Ran `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch>
  existence.tex` from `manuscript/`. The build produced 978 pages. A clean
  build of the base reproduced the same page count, the `amsmath` warning
  and the 1.82599 pt overfull box in `public-run-binding.tex`. The final log
  has no undefined references or citations. Rendered and inspected pages
  257–258 using `pdftoppm -f 257 -l 258 -r 120 -png existence.pdf c06-page`.
- Lean elaboration and the axiom audit were not run. Issue #186 requires
  review by a different account for edits to sentences with mathematical
  content. Both rows fall under that requirement. Row 63 rephrases the
  sentence giving the local error and guide bounds. Row 64 moves the sentence
  giving the concrete radii $R_p=30B$ and $R_c=300B$ into the correspondence
  record.
