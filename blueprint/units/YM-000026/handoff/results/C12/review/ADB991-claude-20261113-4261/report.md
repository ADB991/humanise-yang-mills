# Independent review of PR #326 (`prop:selected-centered-retention`)

- Unit: YM-000026, C12 `manuscript/existence/selected-centered-service.tex`, new subsection "Paid retention on the stored doors" and the three consumer paragraphs changed in PR #326.
- Role: mathematical validity and textual Lean correspondence (independent; different account).
- Human reviewer: none. Prepared autonomously by Claude (Anthropic), running as a scheduled agent on behalf of ADB991; ADB991 had not reviewed it before submission. ADB991 did not author #317, PR #326 or `selected-centered-service.tex`.
- Agent assistance: Claude, sole reviewer, no subagents.
- Session and claim: `ADB991-claude-20261113-4261`, https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6867318257
- Reviewed head: PR #326 @ `5a774d4e47aaa74ea40979e00faa985e786e67ab` (base `codex/existence-monograph` @ `9c921842`). Changed chapter blob `0ec0df9b6dec03b4c30817d334a5e97e19586f6b`; SHA-256 values of every inspected file are in `hashes.json`.
- Source revision: upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`Lean/` unchanged between `9c921842`, the PR head and `codex/existence-monograph` @ `13f52dd6`).
- Outcome: **no required change.** The new proposition is correct as a conditional statement, its proof is complete given the cited results and its stated hypotheses, and it matches `YM.PhysicalNext.Repeat.Legato.Bandage.escape` / `Moonlit`. Four minor wording items (N1–N4) are optional. The scope statement (what remains open) is accurate.

## What was checked

### 1. Terminal endowment (last display of the proposition)

Claim: for every $N\ge0$, $u_N\ge0$, $\alpha_N\ge3$, $(2B_N+1)^4C^{\rm end}_N\le3$, $e^{C^{\rm end}_N}-1\le1$ with $C^{\rm end}_N=w^{\rm f}_N+r_N\mathsf s(B_N)u_N$.

- $w^{\rm f}_N=\operatorname{stain}(x_N)$: `YM.RG.Calendar.forcedAllowance m = exp(-(monitor m)^(1/5))` and `monitor m = exp((log log hatBeta m)^2)` (`Lean/YM/RG/History.lean`), so $w^{\rm f}_N=\exp(-\exp(\tfrac15(\log\log x_N)^2))$, which is `stain` of `centered-geyser-scale-estimates.tex`. Checked.
- $u_N=\tfrac14x_N^{-1/2}=s(x_N)$: `stub x = Hat x/4` (`Tender.lean`), `far p m = stub (hatBeta m)` (`Stove.lean`), and $s=h/4$, $h(x)=x^{-1/2}$ in the manuscript. Checked.
- $r_N=N_{J(N+1)}$ is the occupancy at the *next* stage, `mutt p Q m = Q (J (m+1))`; this is the $p_j$, $j=J(N+1)$, of `lem:ex-geyser-radial`. $\mathsf s=\operatorname{siteFactor}$. Checked.
- The two inequalities are the second and third lines of the display in `lem:ex-geyser-radial` at $x=x_N$, $j=J(N+1)$, $i=J(N)$; `thm:ex-selected-geyser-steam` makes them hold whenever $u_{J(N+1)}\le x_N$, which is the purchased entrance inequality of the global schedule (a property of the schedule, not of the finite history at cutoff $N$). In Lean this is `Bandage.stamina m`, stated for every `m : ℕ` from `Steam Q A.delay`, with no reference to a cutoff. So the argument is valid at every $N\ge0$, including $N=0$, and is independent of any terminal label, as the text says. Checked.
- $u_N\ge0$ since $x_N\ge1>0$; $\alpha_N\ge3$ from $\alpha_N\ge100$ (see N1). Lean: `escape`, field `endow`, uses `div_nonneg`, `ht k` (`100 ≤ supportExponent`) and `(stamina h k).2.2.1`. Checked.
- The Lean statement `Moonlit.endow` (`Wicket.lean`) is exactly the displayed four-part conjunction with `(B+B+1)^4`. Checked.

### 2. Adjacent paid response ($0\le i<N$)

- The quantifier structure matches `Moonlit.days`: for every $N,p$ and $k<N$ there are $y,w$ with `Volant (op k p) (D N p k hk) (r k) (α_{k+1}-4) y (α_k+1/2) (α_k+1) 1 w ∧ Duty A r k (δ k) y w`. The manuscript exhibits the specific witnesses supplied by `Bandage.paneer` (`Wax.lean`): $y_i=$ `station (hatBeta (m+1))` $=x_{i+1}^{-1}$ (`Revenue.lean`), $w_i=$ `straw μ L G (hatBeta m)`, $\delta_i=$ `probe (hatBeta (m+1))` $=x_{i+1}^{-2}$. Exponents $\alpha_{i+1}-4$, $\alpha_i+\tfrac12$, $\alpha_i+1$ and ordinary bound $1$ match. Checked.
- `Accent.Duty` (`Temper.lean`): `hats` $0<\delta\le1$; `exp` $\alpha_i,\alpha_{i+1}\ge100$; `copper` $T+e^TT\le t$ with $T=r\,\mathsf s(B_{i+1})\delta+4\delta$; `stakes` $(2B_i+1)^4(y+r\mathsf s(B_i)\delta)\le\tfrac12$ and $e^{\cdots}-1\le1$. With Lean's `t`$\mapsto y_i$ and Lean's `y`$\mapsto w_i$, this is exactly the manuscript display with $T_i$, $c_i$. Checked.
- Derivation from `prop:ex-lattice-eventual-tariff` (`rg-price-receipts.tex`) at $x=x_i$: $b(x_i)=x_{i+1}$ by the selected clock, $f=x_{i+1}^{-1}=y_i$, $y(x)=x_{i+1}^{-2}=\delta_i$, $R(x_i)=B_i$, $R(b(x_i))=B_{i+1}$, $N=r_i$; then $k(x)=T_i$ and \eqref{eq:ex-lattice-price-buy} is $T_i+e^{T_i}T_i\le y_i$; $z(x)=c_i$ with $w_i$ the Gaussian term (`Mallow.straw μ L G x = 2 * lauge L (μ/4) x (1/4) G` and `lauge L v x C G = exp(-v*C*(fineMonitor G L x)^2)`, so $w_i=2\exp(-\mu M^2/16)$ with $M$ the fine monitor), and \eqref{eq:ex-lattice-price-lodging} gives the two $c_i$ inequalities; \eqref{eq:ex-lattice-price-basic} gives $0<\delta_i\le1$. The "fine-coupling substitution" is therefore literally correct. Checked.
- The door is the stored one (`Climbs` with the endpoint identities substituted, `paneer` destructures `hi` and rewrites), and the response is produced for every priced offer without choosing a new door. The proof says this. Checked textually.
- The assumed preservation property for nonterminal returns, and the arrival / raised-response data, are hypotheses of the proposition. In Lean they enter `escape` through `hN : Nest X Y` and `he : ∀ N p m hm, Climbs …`; the manuscript does not claim to derive them. The top-level addresses come from `prop:wilson-startup-family` (reserved regular and forced labels for every address and every nonempty-inventory support, all with zero coefficient). Checked; the notion of "eligible" forced address was compared only with the wording of `sec:finite-menu-history-handoff`, not traced to its Lean definition.

### 3. Level-zero remark and consumer edits

- `Campaign.doorT` (`Lean/YM/FullVolume/Shroud/Pool.lean`) is `if 1 ≤ m then … .gate else ⟨0⟩`, and `Campaign.ponds` assumes `1 ≤ i`. So the paragraph after the proof ("retention restricted to $1\le k\le i<N$; no response at the default zero-level door is required") is correct. Checked.
- The three consumer paragraphs now say "under its stated hypotheses" instead of asserting unconditional retention. This removes an overclaim present in the base (the old text asserted retention "all the way to the terminal level" from the menu estimates alone). Checked.

## Optional items (no change required)

- **N1 (source of $\alpha\ge100$).** The display asserts $\alpha_i,\alpha_{i+1}\ge100$ and the terminal proof uses $\alpha_N\ge100$, but the proof does not say where this comes from. It is the section's opening choice (constant support exponent $b_j=100$ at every stage, so $\alpha_i=b_{J(i)}=100$); one sentence citing it, and identifying $\alpha_i$ with $b_{J(i)}$, would close this. At $N=0$ there is no adjacent step from which to read $\alpha_N\ge100$, so the citation matters there. (Lean: hypothesis `ht` of `escape`; `ponds` proves it as `hE`.)
- **N2 (notation).** $r_i=N_{J(i+1)}$ overloads $N$ (cutoff vs occupancy schedule). The chapter already uses $N_{J(m+1)}$ for the occupancy bound in the next subsection, but `centered-geyser-scale-estimates.tex` writes $p_j=Q(j)$, which is the form the terminal proof invokes. Also "$x_{i+1}=x_i+c_G\log L_i$" uses $L_i$ for the block side of stage $J(i+1)$ ($b_{J(m+1)}$ in `prop:ex-geyser-service-fields`). Aligning these with the geyser section would help the reader.
- **N3 (equation reference).** The terminal proof cites `\eqref{eq:ex-geyser-second}`, which labels only the $e^{(\cdot)}-1\le1$ line; the $(2B+1)^4(\cdot)\le3$ line is `\notag`. Cite `lem:ex-geyser-radial` (or label that line) so that both "resulting two inequalities" are referenced.
- **N4 (where $w_i$ is defined).** $w_i$ is introduced as "the distinct flagged response price of the tariff". Saying explicitly that it is the Gaussian summand $2\exp(-\mu M^2/16)$ of $z(x)$ in `prop:ex-lattice-eventual-tariff` (the site budget of `centered-construction.tex`) would make the substitution in the last paragraph of the proof checkable at a glance.

## Commands run

- `python3 scripts/check_blueprint.py` at the PR head: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (exit 0); the same at this report's branch.
- `python3 -m unittest discover -s tests` at the PR head: 22 tests, OK.
- `git archive pr326 manuscript | tar -x` into a scratch directory, then `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 1013 pages, no undefined references in the log. `prop:selected-centered-retention` is Proposition 165.1 on p. 693; pp. 693–694 rendered with `pdftoppm -r 80` and inspected (statement, both displays, proof, level-zero remark, and the changed consumer paragraph of §165.3). Layout correct.
- `git diff --stat 9c921842 13f52dd6 -- manuscript Lean`: empty, so the inspected non-PR files are identical on the current `codex/existence-monograph`.

## Not checked

- No Lean elaboration or `#print axioms`; correspondence read textually only.
- The definitions of `Volant`, `Climbs`, `Nest.samples` and the internal proof of `Bandage.paneer` were not traced beyond their statements; the remaining analytic premises are hypotheses of the proposition and outside this review.

## Acceptance

No human acceptance is recorded here. A material edit to the proposition requires renewed review.
