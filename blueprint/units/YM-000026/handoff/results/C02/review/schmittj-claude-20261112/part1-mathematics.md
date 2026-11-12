# C02 review, part 1: mathematical validity

- Unit: work package C02 "RG representation, finite menus and centered prices" of YM-000026; this part covers `manuscript/existence/rg-construction.tex`, `rg-multisource.tex`, `rg-menu-jets.tex`, `rg-price-receipts.tex`, `finite-menu-history-handoff.tex`.
- Role: mathematical validity (independent reviewer, different model family from the author and earlier checkers).
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: Claude (Opus 5.5) agent, review session `schmittj-claude-c02-review-20261112`, part 1 of three parallel reviewer agents. No subagents.
- Worktree and target: `/home/jo314/ym-wt/c02-review` at `1749b55c29f19bb5ab0d17b488169c087cb22c15` (branch `codex/existence-monograph`, containing author PR #82, author commit `93fd865`); author changes read as `git diff 18d0327 93fd865 -- manuscript/existence/<chapter>.tex`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Content SHA-256 of the five chapters (equal to the coordinator's `c02-hashes.txt` and to `HANDOFF.md`): `rg-construction.tex` `53fa3432…8ad48`, `rg-multisource.tex` `06b012ce…d2c98`, `rg-menu-jets.tex` `067968a3…373ef`, `rg-price-receipts.tex` `e5d12963…c17`, `finite-menu-history-handoff.tex` `10fdb325…86310` (full values in `part1-validation.md`).
- Outcome: changes requested (no ERROR found; two GAPs and several INACCURACIES, all small to repair). `rg-menu-jets.tex` and `rg-price-receipts.tex`: no required mathematical change. Acceptance in any case only conditional on the explicitly named upstream inputs.

## Summary

I read all five chapters line by line, redid the computations, and read the PR #82 diff for each chapter. I found no false statement and no invalid step. Every PR #82 repair in these chapters that I could test is correct (list at the end). The two GAPs concern exposition of the dependency chain inside the finite-menu step: (G1) the "selected forest estimate" that yields the fragrance ledger is used without statement or reference, and (G2) the shipment conversion proved in Theorem `thm:ex-lattice-volant-supplier` is not part of its stated conclusion, and nothing in these chapters says where it is consumed. Both were present before PR #82.

## Findings, ordered by severity

### G1. GAP (manuscript, pre-existing): the forest/cluster-tail estimate behind the fragrance ledger is neither stated nor referenced

- File and lines: `rg-multisource.tex` 58–79 (eq. `eq:ex-lattice-multi-lucent`) and 93–100.
- Passage: "The selected forest estimate gives a ready cluster bound at exponent $a+e$, with rooted budget $P_0$ and degree ratio $0\leq\rho<1$. … The zero-depth cluster-tail estimate sums all connected clusters containing at least one marked component. … the connected-coefficient cover inequality bounds its Ursell coefficient times the support currency by the fee majorant of its union support."
- Reasoning: the ledger $\sum_{i:z\in R_i}\ell_i e^{r_4 C_B(R_i)}\le P_0/(1-\rho)$ is the only quantitative input of the first response row, and its budget $P_0$ is what `finite-menu-history-handoff.tex` (eq. `eq:menu-total-pledge`) later bounds by $1/8$. The chapter describes three ingredients ("ready cluster bound", "zero-depth cluster-tail estimate", "connected-coefficient cover inequality") in words only, without hypotheses (which activity family, which radius, what the "ready" condition is, why $\rho<1$) and without a label. In the source the bound is `YM.Merge.Palette.lucent` (`Lean/YM/MergeProof/Dreams.lean`), obtained from `Ursell.log_hit_tail` at depth zero applied to the `Ready` output of `YM.Merge.Palette.field` (`Lean/YM/MergeProof/Garden.lean`), which in turn comes from `Mixed.mixed_hit` applied to the menu plot. Matching manuscript producers appear to exist (`sec:cluster-expansion`, `sec:mixed-activity-prices`; e.g. the vertex condition $4h_B\gamma/\delta\le q<1$ in `mixed-activity-prices.tex` 150–168), but `rg-multisource.tex` does not cite them, so a reader cannot check the identification of $P_0$ and $\rho$. Also, $P_0$ is never defined in these chapters: in the source $P_0=\texttt{pledgeA}=(1+2^{j+2}B)(\texttt{overture}+2u_0)$ with $u_0$ a ceiling of the `swing` costs (Garden.lean, `field`), and $\rho=\texttt{sailUp}=\beta_F^{Q.\mathrm{rate}/2}$ (`Daisy/Solvent.lean`).
- Status: open; pre-existing (PR #82 did not touch lines 58–100 except to add $t_{i,\ell}\ge0$).
- Requested change: state the ready cluster bound as a precise input (activity family, radius $B$, exponent $a+e$, budget $P_0$, ratio $\rho$ and the condition that makes $\rho<1$), cite the manuscript section/label that proves the zero-depth tail and the cover inequality, and give the definition (or producer label) of $P_0$ and $\rho$.

### G2. GAP (manuscript, pre-existing): Theorem `thm:ex-lattice-volant-supplier` proves a conversion that is not in its conclusion, and its hypotheses are deferred to the proof

- File and lines: `rg-construction.tex` 244–311.
- Passages: statement: "Assume … that the birth estimate, foam, and radius hypotheses stated in the proof hold. Then the grouped families … have the same rooted budgets … this theorem proves their tariff conversion and assembly." Proof, first half: the derivation of (`eq:ex-lattice-volant-root-lift`) $\sum_{i:z\in\mathrm{birth}_i}f_ie^{Q.\mathrm{rel}\,C_{B_0}(\mathrm{birth}_i)}\le N\,\mathrm{siteFactor}(B_0)c\le\mathrm{ribbon}$.
- Reasoning: I checked the first half step by step and it is correct: $(Q.\mathrm{rel}+1)n^{\rm birth}+2\varepsilon_Qn^{\rm crest}\le(Q.\mathrm{rel}+1)\mathrm{preCost}+\tfrac{13}{4}\varepsilon_Qn^{\rm crest}$ and $\tfrac{13}{4}\varepsilon_Q<\tfrac{13}{16}e_1\le e_1-4$ for $e_1\ge 64/3$, then the rooted projection estimate (source `YM.Extra.Multi.root_hit`) with occupancy $N$ loses exactly one unit of exponent and the factor $N\,\mathrm{siteFactor}(B_0)$; the final inequality is the tariff (`eq:ex-lattice-volant-tariff`). But the theorem's conclusion lists only the grouping statements, which the second half proves from the separately assumed ungrouped ledgers (`eq:ex-lattice-volant-first-ledger`, `eq:ex-lattice-volant-second-ledger`); the root-lift bound is used nowhere in the five chapters. In the source the conversion is the menu plot (`YM.Merge.Palette.deck` → `Plot`), and that plot is consumed by the forest estimate that produces $P_0$ (`Palette.accrued` uses `hR.pays`; the `swing` costs contain `ribbon` in `rootHit` and `optionalHit`). So the chain "offer → shipment conversion → plot → ready cluster bound → $P_0$ → first ledger at budget $2P_0/(1-\rho)\le1$" is the actual route, and the manuscript breaks it at both ends (see G1). Separately, the statement does not list its hypotheses: $Q.\mathrm{rel}\ge4$, $4\varepsilon_Q<e_1$, foam at scale $L$, $B_1\le2B_0$, $e_1\ge100$, the parent-site occupancy $N$, positive marker weights, the offer (site-rooted ledger at exponent $e_1-4$, fine sites in crests) and the tariff.
- Status: open; pre-existing. PR #82 added the definitions of $\mathrm{price}_r$, ribbon, preCost, siteFactor and $\Delta_{G,L}$ and the site-to-marker sentence (all correct, see below), but not these.
- Requested change: put the hypotheses in the statement; add (`eq:ex-lattice-volant-root-lift`) as an explicit conclusion; add one sentence (here or in `rg-multisource.tex`) saying that this bound is the menu input of the forest estimate that produces $P_0$.

### I1. INACCURACY (manuscript, pre-existing): the one-step lemma omits the width hypotheses its conclusion needs and assumes what its proof derives

- File and lines: `rg-construction.tex` 378–399 (`lem:ex-lattice-rg-one-step`), 440–444.
- Passage: "If $B_{i+1}$ is neutral and translation covariant and has folded cost $p\geq0$ at width $u=\sigma_{i+1}$, then the composed packet … has folded cost at width $\sigma_i$ at most $\nu_i(u)p$."
- Reasoning: the folded estimate is Lemma `lem:ex-lattice-flat-step-convolution`, which requires $\tau>0$, $0\le\sigma\le\omega$ and $2\sigma\le L\tau$; without $2\sigma_i\le L_i\sigma_{i+1}$ the centering bound $a e^{\sigma a/L}\le(2/\tau)e^{\tau a}$ fails. The statement mentions none of $\sigma_i\le\omega_i$, $2\sigma_i\le L_i\sigma_{i+1}$, $\sigma_i>0$, $u>0$; only the last sentence of the proof says they are "exactly that lemma's remaining hypotheses". (Lean `to_here` has them as `hg`, `hv`, `hu`, `hσ`.) Conversely the statement assumes the coarser-history response is travelling and satisfies the matching identities, whereas the proof derives these from the horizon bounds and the tower identity of item 1 (Lean: `travels_route` from `hD`); the tower identity itself is not in the statement. In Theorem `thm:ex-lattice-rg-construction` the lemma is only applied under item 2, so the final theorem is unaffected.
- Status: open; pre-existing (PR #82 changed only "obey order-two atlas bounds").
- Requested change: add the width/positivity hypotheses to the statement, and replace the assumed travel/matching by the horizon bounds and the tower identity of item 1 (or keep them as hypotheses and delete their derivation).

### I2. INACCURACY (manuscript, partly from PR #82): the flat theorem is applied to an auxiliary horizon on the public route

- File and lines: `rg-construction.tex` 146–165 (rewritten by PR #82) and Remark `rem:ex-lattice-rg-public-route` 502–516.
- Passage: "Realization applies that supplier to the very same selected schedule and horizon. The flat entrance supplier obtains an admissible spacing schedule and invokes the finite-history supplier whose meshing step uses the world construction proved above."
- Reasoning: in the source (`YM.RG08.Flat.entrance_gate`, `Lean/YM/RG08/Flat/Entrance.lean`) the world theorem is applied to the levels `shadow a γ` (stage profile rearranged, `Shadow.lean`) and to an auxiliary horizon `Y` from `retained_support`; the selected run's horizon receives only equality of the quadratic outputs through `same_shadow` (the content of `lem:ex-lattice-flat-same-output`). So the packets $B_i$ of Theorem `thm:ex-lattice-rg-construction` represent precision differences of the auxiliary horizon, not of the run's own horizon. The PR text "The auxiliary factorization used for the flat estimate preserves the quadratic output; it does not assert equality of all horizon data" says this indirectly; the Remark reads as if the theorem were applied to the run's horizon.
- Status: open; the horizon paragraph is PR #82's, the remark is pre-existing.
- Requested change: say explicitly that the theorem is applied to the auxiliary levels and horizon, and that only the quadratic output is transported to the selected run, by `lem:ex-lattice-flat-same-output`.

### I3. INACCURACY (manuscript): the score-limit map and the truncated exponential share the name "pass"

- Files and lines: `rg-construction.tex` 236–240, 326–331; `rg-multisource.tex` 400–402, 428–431; `finite-menu-history-handoff.tex` 70–72.
- Reasoning: in (`eq:ex-lattice-volant-play`), "pass" is undefined; in the source it is `YM.Marker.Poly.pass`, the truncated exponential $\sum_{k\le|V|}a^k/k!$ (`Lean/YM/Marker/Truncated.lean`), used in `play` (`Hens.lean`). In `rg-multisource.tex` $\mathsf{Pass}$ is the score-limit map and the exponential is written separately, $\exp(\mathsf{Pass}(\mathcal L))$. The two displays agree only if one knows that "pass" in the first means $\exp$ (equal to the truncated exponential because the argument is nilpotent on a finite census). Also "the pass … commutes with the absolutely convergent grouping of $A_i$" (line 326) says no more than $\sum_iA_i=\sum_sF_s$.
- Status: open; pre-existing.
- Requested change: define pass in `rg-construction.tex` as the (truncated) exponential on the finite marker algebra and rename the score-limit map in `rg-multisource.tex`.

### I4. INACCURACY (manuscript, pre-existing): undefined symbol $t_0$ in the cash identity

- File and lines: `rg-multisource.tex` 130–131.
- Passage: "the zero-menu multiplier is $e^{t_0}=\mathsf P_{\rm vac}(U)$."
- Reasoning: $t_0$ is not defined, and $t$ already denotes the switch parameter and $t_{i,\ell}$ the fees. I redid the verification of (`eq:ex-lattice-multi-closed`): LHS $=e^Ee^{L_0+L_1}e^{\sum_is_i(U,t,F)}e^{-\sum_is_i(U,0,\varnothing)}G_0=C\,\mathsf P_{\rm vac}\,M\,e^{-\sum_is_i(U,0,\varnothing)}G_0$, which equals $CMG_0$ exactly when $\mathsf P_{\rm vac}(U)=\exp(\sum_is_i(U,0,\varnothing))$. With that reading the argument is correct.
- Requested change: write $\exp\bigl(\sum_is_i(U,0,\varnothing)\bigr)=\mathsf P_{\rm vac}(U)$.

### I5. INACCURACY (manuscript, partly PR #82): which path supplies the flagged ledger is not said

- File and lines: `rg-multisource.tex` 238–326, 446–457; `finite-menu-history-handoff.tex` 56–63.
- Reasoning: the section describes an ordinary path (soft demand $f=\mathrm{softNeed}$, receipt `cools`) and a raised path (demand $f_+=\mathrm{opens}$ evaluated at the base budget, receipt `Spicy.june`), correctly distinguishing them (I checked $F$, $Q$, $\mathcal P$ against `Spicy.fruit`, `Spicy.summer`, `Footprint.payment`, and $B_+=B$ against `raiser`). It never says which one gives the flagged response at the straw budget that Theorem `thm:ex-lattice-volant-supplier` and the handoff use. In the source (`Many.ripe`, `Lean/YM/MergeProof/Tanger.lean` lines 73–90) `Photo.shade` receives `crowd2`, i.e. the raised path, while the ordinary path (`Signed.crowd`) is the gas payment inside the `Usable` certificate. "A separate raised branch of the construction uses the second path" (line 325) is too vague for this.
- Requested change: one sentence: the flagged ledger at exponent $b+1$ and budget straw is the raised path's output; the ordinary path supplies the gas payment of the first certificate.

### I6. INACCURACY (manuscript, introduced by PR #82): factors of the absolute-sum bound labelled the wrong way round

- File and lines: `rg-construction.tex` 421–425.
- Passage: "the row bound for $U_i$, the uniform folded bound for $B_{i+1}$, and the column bound for $T_i$ give an absolute sum at most $(m\mathcal A_iL_i^2)p(\mathcal A_iL_i^{-2})=m\mathcal A_i^2p$".
- Reasoning: with the atlas conventions of `flat-step.tex` (row: $bL^{-2}$; column: $bL^2$; both per fixed label) the $T_i$ column, summed over its $m$ input labels at fixed $(y,k)$, gives $m\mathcal A_iL_i^2$, and the $U_i$ row at fixed output label gives $\mathcal A_iL_i^{-2}$. The product is right; the order of words pairs "row of $U_i$" with $m\mathcal A_iL^2$. This agrees with the first step of the proof of `lem:ex-lattice-flat-step-convolution`, which gives $m^2qpr$ when the output label is also summed.
- Requested change: reorder to "the column bound for $T_i$ (summed over input labels), the folded bound, and the row bound for $U_i$".

### N1. NIT (manuscript, pre-existing): attribution of $4\varepsilon_Q<e_1$

- `rg-construction.tex` 276–278: "Foam at scale $L$, $B_1\le2B_0$, $Q.\mathrm{relative}\ge4$, and the profile hypotheses give $4\varepsilon_Q<e_1$." In the source this is the target condition `Target.grants.1` ($4\varepsilon<$ top support exponent) transported by `intake.exponent` (Permit.lean, `deck`, `hu`); foam, the radius comparison and $Q.\mathrm{rel}\ge4$ enter the birth estimate. State it as a hypothesis.

### N2. NIT (manuscript, pre-existing): the "delayed-scale inequality"

- `rg-construction.tex` 135–137. The bound $\log\widehat\beta_i\le\log\widehat\beta_{k}+s_G|t_i-t_k|$ follows from $\widehat\beta_i=\bar\beta+s_Gt_i$ (`YM.RG.Calendar.hatBeta`) and $\widehat\beta_k>1$: $\widehat\beta_i/\widehat\beta_k\le1+s_G|t_i-t_k|$, then $\log r\le r-1$. I checked this and the conclusion $\Omega_X(J_i)\le(1+s_G)(2+Z_x+|t_i-t_{k_x}|)$ with $Z_x=3+\log\widehat\beta_{k_x}$. Name the affine definition of $\widehat\beta$ instead of "delayed-scale inequality".

### N3. NIT (manuscript): notation clashes

- $X$ is both the index set (line 16) and a map price (line 94); $N$ is both the cutoff and the occupancy count (lines 195, 305); $a$ is both the lattice length $a_i$ and the shipment allowance; $b$ is both $P.B$ (`rg-multisource.tex` 202) and stems (line 283); $\rho$ is $Q.\mathrm{rate}$ in `rg-construction.tex`, sailUp in `rg-multisource.tex`/handoff and a generic exponent in `rg-price-receipts.tex`. Typo "at at" (`rg-multisource.tex` 83).

### N4. NIT (manuscript): the menu sums are finite

- `rg-multisource.tex` 355–361 and 379–381 justify absolute convergence of sums over menus $i$ and score sets $A$ by door-volume and fee-load ledgers; the menu family is finite (`rg-menu-jets.tex` line 5; finite census in the source), so these sums are finite. Harmless; the countable sums that do need justification are over activity labels and fragrance labels, and those are justified.

### N5. NIT (manuscript, pre-existing): "precisely" omits two tariff fields

- `finite-menu-history-handoff.tex` 105–112: "The tariff … says precisely that $u\ge0$, $0<\delta\le1$, and …" lists purchase, lodging and credit but not the shipment inequality (which is used two sections earlier). Line 33–34 "so $a\ge b_c+3$" is not a consequence of $e>0$; it is a separate selected inequality (source `R.pledging.agenda` in `Many.ripe`).

### Records (not manuscript)

- R1. NIT (canonical evidence files, pre-existing, not PR #82): `rg-multisource-evidence.md` line 35 gives `YM.MergeProof.Accent.towing` in `Lean/YM/MergeProof/Accent.lean`; it is in `Lean/YM/MergeProof/Endow.lean` (namespace `YM.MergeProof.Accent`). `rg-menu-jets-evidence.md` line 20 gives `YM.Merge.Switch.Paid.works` in `Switch.lean`; it is in `SwitchCost.lean`. `rg-construction-evidence.md` inspection list attributes `Many.usable` to `Paprika.lean`; it is `Stage.lean` line 79 (the table is right). `rg-multisource-evidence.md` says the `cools` allowance is at most $\beta_F^{-1/4}$ in one row and $\beta_F^{-1/8}$ in note 3; the $\beta_F^{-1/8}$ bound I verified is that of `Many.fanning` (column-tail ticket). The chapter text itself uses the correct objects.
- R2. The coordinator's note for this review said that `rg-construction.tex` concerns the block-spin kernel, patch frames and predictor (`Lean/YM/RG/Patch.lean`, `Block.lean`, `YM.RG.frame_unique`, `YM.RG.predictor_unique`, `YM.Axial.eligible`, `YM.Axial.viable`). It does not: none of the five chapters or their evidence files mentions these objects. `rg-construction.tex` is the RG08 flat-world finite-interval estimate and the selected nonlinear step's finite-menu supplier. I therefore did not check those declarations.

## PR #82 repairs in these chapters: verified

- `rg-construction.tex` item 1: the identity is of the two-form transport component $T$ of the horizon tower with that of the order-two Wilson flight (`Towers.T : Cross L (TypeFace 2) (TypeFace 2)`; `Provides.data`). Correct; the earlier "tower precision equals flight precision" was wrong.
- Funding quantifiers "for each $x$ and every $i_0(x)\le i<N_x$" and theorem quantifiers "for every $x$ … its cutoff $n_x\ge N_x$; constants independent of $x$": correct (`Funding` fields use `W.bar.Here x i → i < W.fine x`; `overlap` has one $A,d,c$ for all $x$).
- "The three items record …; the terminal polynomial bound is part of the funding data": correct (`Funding.top_cap`).
- Definitions of $\mathrm{price}_r$ (downward-closed census containing $\varnothing$ and singletons), $\beta_F$, preCost $=(2(h+6)+1)^4$, siteFactor $=e(2(16B+9))^4$, ribbon $=\beta_F^{\rho}e^{Q.\mathrm{rel}\,\mathrm{preCost}(Q.\mathrm{halo}+5)}$, $\Delta_{G,L}=\exp((\log\log\beta_F)^2)$, $\rho\in(-1/2,0)$: all match the source.
- Site-to-marker step "the fine site of $v$ belongs to the crest of every such menu, so this sum is bounded by the offer's site-rooted ledger": correct (`Offer.sites`, `Offer.budget`; `Photo.bidding` evaluates the site ledger at `o v`).
- Absolute summability paragraph (lines 415–429): correct, with the labelling remark I6.
- Travel paragraph wording (sum over the second spatial argument independent of the first): consistent with the travel property in `prop:ex-lattice-flat-step`.
- `rg-multisource.tex`: $t_{i,\ell}\ge0$; "limits as $t\downarrow0$ are preserved by this product" (finitely many pairs $A\cup B=C$); the exponential interchange via the majorant $c^n/n!$ (correct: the $n$th power of a family of payment $c$ has payment $\le c^n$ by the convolution estimate, dominated convergence uniform in $t$); $b=B=P.B$; footprint price $\mathcal P(n,W,k,\epsilon,C,\gamma,a,v)$ with $\epsilon>0$ (equal to `Footprint.payment`); "second rate clause of the corresponding ordinary or raised certificate"; real-valued scores regarded as complex; nonempty flags only for the constructed family. All correct.
- `rg-menu-jets.tex`: "real-valued score family": correct.
- `rg-price-receipts.tex` purchase step: $k\le b^{-3/2}\le1$, then on $b^{1/2}\ge1+e$, $k+e^kk\le(1+e)k\le(1+e)b^{-3/2}\le b^{-1}$. Correct; the earlier text did not account for the factor $1+e$.
- `finite-menu-history-handoff.tex`: fine sites in fine crests, occupancy of parent images, parent occupancy bounds fine occupancy (fine fibre contained in parent fibre); conditional finite-list paragraph; conditional final paragraph. Correct and consistent with `Menu.Offer`, `Volant.reserves`, `Photo.bidding`.

## Per-chapter table

| Chapter | What I checked line by line | Verdict | Open inputs from other packages |
| --- | --- | --- | --- |
| `rg-construction.tex` | Data items 1–3 against `World.Provides/Funding`; allotment and $\nu_i$ ($=2m^2\mathcal A_i^2/(uL_i)$, equal to `neutralCoin` with `header`); funded-width producer: $\omega_j$, $b_X$, $E_X$, bridge, folding, quote $=b_X(J_{i+1},J_i)/L_i\le L_i^{-1/2}$, top cap with $A_0=2m(1+s_G)$, $d=1$ (all redone and equal to `Length.lean`); terminal lemma (cost $m(\Omega+\Omega)$, neutrality from equal zero modes); one-step lemma (cost from Lemma `lem:ex-lattice-flat-step-convolution` with $q=p=\mathcal A_i$, $\tau=u$; absolute sums); backward induction ($C_i=T_{x,N}e^{-\theta(t_N-t_i)}$) and the application of `prop:ex-lattice-flat-rate` with $c_0=\theta$, giving $\mu=\theta/2$, $d_1=d$, $R$ absorbed since $R+Z+a\le(R/2)(2+Z+a)$; Volant section: tariff, birth estimate arithmetic ($13/4<13e_1/16\le e_1-4$), rooted projection, fibre grouping and Tonelli | Correct; changes requested for G2, I1, I2, I3, I6, N1–N3 | C01 horizon geometry, atlas, travel and flat-step producers (`sec:ex-lattice-rg-horizon-geometry`, `sec:ex-lattice-flat-step`, `prop:ex-lattice-flat-rate`); retained bed and flight receipts; length floors and delay on the selected run |
| `rg-multisource.tex` | Fee majorant; switching product and its majorant; triangle inequality $2\ell_i$; summability with factor $|\Lambda_c|$; zero quiet coefficient; locality implication; cash identity (redone, see I4); triangular injectivity; nilpotent product and exponential; second row: lauge/straw/stems identities ($\mu/4\cdot1/4=\mu/16$, $\mu/4\cdot1/2=\mu/8$), Rates fields, quote, footprint prices $F,Q$, $f\ne f_+$, $B_+=B$, widening; canopy: $z_i$ normalization ($\mathrm{price}=1$ or both zero), singleton coefficient, barcode grouping (two compatible terms cannot share a barcode) | Correct; changes requested for G1, I3, I4, I5, N3, N4 | Ready cluster bound and zero-depth tail (cluster-expansion/mixed-activity-prices, not cited); C08 `sec:soft-log-fusion` (checked: hypotheses $h_B\Gamma\le1$, output $e^{-\kappa}(e^\Gamma-1)$ match); C16 `sec:nonlinear-payment-selection`; arrival, Pungent and reset receipts |
| `rg-menu-jets.tex` | Interpolation identities, differentiability by the product rule, triangular extraction, $\lim t^{-1}(P_i(r_it)-P_i(0))=r_iD_{i,j}$ including $r_i=0$, $r_i=\phi_i$ | Correct; no required change | Paid score model of the selected gas receipt; hinge definition of the selected door |
| `rg-price-receipts.tex` | Rate calculus (products, sums, constants, negative rate ⇒ $0$); $R(b(x))\le2R(x)$; super-polynomial decay of $2e^{-\mu M^2/16}$ ($\log(M^2/t)=2(\log t)^2-\log t$); rates of $k$, $z$, $(2R+1)^4z$; shipment ($q_0\in(-1,\rho)$, $e^{\lambda C}\ge1$), purchase, lodging, credit; equality of $f,y,k,z,\mathcal R$ with `Tariff` fields | Correct; no required change ($\rho\in(-1,0)$ is weaker than the source's $(-1/2,0)$, harmless) | Arrival, gain and reset receipts (stated as separate) |
| `finite-menu-history-handoff.tex` | Offer and occupancy; (`eq:menu-total-pledge`): $4e^{E_0}P_1+4P_0/(1-\rho)\le4E'+8P_0\le10(E'+P_0)=V_Q$ with $P_1=E'e^{-E_0}$, $\rho\le1/2$ (equal to `Palette.field`); $2P_0/(1-\rho)\le1/4$; exponent lowering $b_c+1/2\le a+e$; flagged allowance; coupling relation $\widehat\beta_{m+1}=\widehat\beta_m+s_G\log L$; $u,\delta$ and the three tariff inequalities against `Bandage.paneer` and `Tariff` | Correct; N5 only | C06 `eq:transfer-nonlinear-input` (list preparation, slice integrability, singleton identities), C16 payment selection, C09 heading handoff; the uniform production of the receipts on the public run |

## Not checked

- The internal proofs of the inputs the chapters treat as upstream: the ready cluster bound and cluster-tail estimate, `crowd`/`crowd2`/`corps2`/`money`/`fanning`, the `cools` and `june` vapor estimates, `valueP` and the exact gas/push identities, `listens`, the `Usable` gas payment, `Arrives`/`Pungent`/`stables`, the atlas estimates (`atlas_here`, `values`), `travels_route`, `toward`/`poised`, and the horizon-geometry chapter beyond the paragraphs quoted.
- The analytic content of `flat-step.tex` beyond the statements used here (I read its atlas definitions, Lemma `lem:ex-lattice-flat-step-convolution` and Proposition `prop:ex-lattice-flat-step`).
- Measurability, integrability and "finite ticket truncation" statements in `rg-multisource.tex` 433–439.
- No LaTeX build (audit-only review) and no Lean command.
