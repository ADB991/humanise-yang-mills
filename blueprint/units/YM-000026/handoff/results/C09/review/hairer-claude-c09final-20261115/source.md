# Textual source correspondence (pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`)

Paths are relative to `Lean/`. All nine files read match `Lean/SOURCES.sha256`
(`reviewed-files.sha256`). Nothing was elaborated. These are spot checks of each chapter's main
statement, quantifier order and explicit constants. Declarations already recorded as read in
`results/C09/ledger.md` were re-opened where listed below.

| Chapter | Declaration(s) re-read | Agreement |
| --- | --- | --- |
| stationary-action-prices | `YM.Bid.Fires`, `YM.Bid.F02`, `YM.Bid.Larger`, `YM.Bid.F03` (`YM/Bid/Station.lean`) | The source states analyticity of the main term under path bounds (`Fires`) and the `Prismatic`/`Comptroller` output under `Larger`, `Floor`, `Attached`, `Sworn`. The explicit width $a=\mu/(4(n+1)(1+L))$ and the read-radius payment are the manuscript's own derivation, checked in `mathematics.md`. The source has no stated constant to compare. |
| truncated-stationary-log | `Lantern.Golf` (`Lantern/Port.lean`); `Lantern.lookingGlass` (`Lantern/Lens.lean`) | `Golf` asks for $\rho,\phi$ through order $j+2$ and $\psi$ and the relative log determinant through $j$. `lookingGlass` uses `Golf` at $j+2$, $D=d\cdot$`fineMonitor`, dimension at most $Q$, and $M^{-1}\le cI$. It concludes $e^{-1}/2\le Y\le e$ and the jet bound $B\,b^2+z^e$ with margin $\|x\|+z^{-m}<w$. All of this matches the manuscript's chain, including the order bookkeeping. |
| stationary-exterior-receipt | `Sienna.reaches` (`Sienna/Canvas.lean`) | It chooses its positive constant before the threshold in $t$ and quantifies over torus, forest, tag and supplied graph. It requires `Quilt`, both path bounds, the graph `Service`, `ClassicalMatch`, `Cash`, a manifest coat, empty flags and the coarse radius. This matches the order of choices and the retained inputs. The explicit constants (`pence`, `wick`) were not re-derived. The `Fare.*` decomposition is as recorded in `ledger.md`. |
| pure-action-small-field | `Token.languid` (`Token/Purple.lean`) | It concludes positivity, jets of the error at most $z^e$, and jets of the stationary log at most $H\beta^{-1}\beta^{-1}+z^{-2}$ on the ball with two `furl` margins. These are exactly the inputs $v$ and $a$ of the final budget. The exponent bookkeeping to $-23/20$ is the manuscript's own and is checked in `mathematics.md`. |
| healthy-boundary-jets | none newly re-read | The ledger's "radial-retreat, termwise-series and final extension" reads are not repeated. The chapter's lemmas are elementary analysis, checked in full in `mathematics.md`. |
| primary-calibration-producer | `PPX.Seal.revealed` (`PRIMARY_INTEGRAL_295/East.lean`); `Ramble.billFor` (`.../Reaches.lean`) | `revealed` gives probe$($leads$)=L^d\cdot\theta_f^{-\text{grade}}\cdot$ (the iterated derivative at the coarse-scaled probe), as in the manuscript's identity. `billFor` chooses $D$ before the torus and bounds probe jets by $D(1+B)e^{-(\sigma/2)\chi}$. The manuscript's tail has a larger polynomial factor, $(1+4R)^{dk}$, but the same decay; this is a weaker but valid bound, not a discrepancy. |
| wilson-vacuum-price | `Stationary.Wilson_stream`, `price_vault` (`Shape/ClassicalMatch.lean`) | $\exists A\ge0$ and one `Picture` with `Firm 1 A`, recorded for every side $m$. The constant is `card PlaqAxes * A * recitalScale t 4 1`, consistent with $A_t$ via the $\exp((t+1)^2\sigma\cdot4d)$ weight noted in the leakage response. |
| row-quadratic-price | `Stationary.all_ages` (`Shape/ClassicalMatch.lean`); `reflect_firm` (`Shape/LocalOracle.lean`) | `all_ages` takes $\eta=\sigma/(2(t+1)^2\cdot4)=\sigma/(8n^2)$ and proves $(t+1)^2\eta\cdot4=\sigma/2$. The manuscript adds $\min(1,\cdot)$ for the Wilson combination, as the ledger records. `reflect_firm` charges $e^{(t+1)\sigma}$ per reflection factor, as in the corollary. |

No discrepancy between statement and source was found. The cross-package hypotheses these
declarations take (`Cash`, `Service`, `ClassicalMatch`, funded data, the selected flight) remain
inputs, as the chapters say.
