# Independent C15 review: Eve response package and row-jet comparison (#331)

- **Session:** `hairer-claude-331rev-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5), with no child agents.
  The account hairer did not author #105 or any hunk of these chapters.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/331#issuecomment-6867939175>
- **Reviewed:** both chapters in full, at `codex/existence-monograph` `4587a98`.

| Target | SHA-256 |
| --- | --- |
| `manuscript/existence/trace-eve-producer.tex` | `2b4f47c811da111ff8c3b092553dba106dfdd65b22d7e8390cdab4d01c43398b` |
| `manuscript/existence/trace-row-jet-estimates.tex` | `dbd6bbffed6605f24a55e20ece34e794e1028477bd3a828afb3629ffe6b899ba` |

- **Source pin:** `3456e5e`. All six Lean files read match `Lean/SOURCES.sha256`
  (`hashes.json`). The source was read textually; nothing was elaborated.

Human acceptance is unset. This report is not an approval.

## Verdict

**No blocking defect in either chapter**, conditional on the explicitly
stated receipts. Every displayed inequality was recomputed. Both chapters
match their source declarations in hypotheses, constants and quantifier
order. There are two "should" items (S1, S2) and three minor editorial
items (N1–N3).

## Mathematics: `trace-row-jet-estimates.tex`

- **(1).** With s = σ/(n+1), (1+(n+1)/σ)(1+sr) = 1 + sr + (n+1)/σ + r ≥ 1+r.
  Raising to the n-th power uses ns ≤ σ. W_n is submultiplicative. Correct.
- **Lemma `lem:ex-lattice-row-convolution`.** Each term is at most
  M W_n(x) C_n(σ) e^{σ|z|}|q(z)|, and summing gives (3). Applying this to
  four entries per output row gives the factor 4 in (4). Correct.
- **Lemma `lem:ex-lattice-row-tail`.** Only |z|_1 ≥ b contributes, and
  W_n(z) ≤ C_n(σ/2)e^{σ|z|/2} ≤ C_n(σ/2)e^{−σb/2}e^{σ|z|}. This gives (5).
  Correct.
- **Lemma `lem:ex-lattice-jet-comparison`.**
  - The 2^a − 1 nonempty-subset terms each have |S| factors of norm ≤ ε and
    a−|S| factors of norm ≤ K. Since ε ≤ K, each term is ≤ εK^{a−1}Φw.
  - Also K ≥ 1, so each term is ≤ εK^aΦw.

  Correct.
- **Proposition `prop:ex-lattice-strip-to-probe`.**
  - (9): 2K from (5) per entry and four input components give 8K. Then
    W_{dk}(u) ≤ (1+4m)^{dk}.
  - Direction bound: 4K C_{dk}(σ) M W_{dk}(u).
  - (11): the Faà di Bruno sum runs over ordered finpartitions. The
    all-reference term vanishes by (10a), since block sizes are ≥ 1 and sum
    to ℓ ≤ d. Lemma (8) with K = C_1 and ε = ε_d ≤ C_1 then bounds each term
    by 2^{|π|}ε_d C_1^{|π|}Φw ≤ 2^ℓ ε_d C_1^ℓ Φw.
  - The case ℓ = 0 follows from F(id) = 0.

  Correct.
- **Application paragraph.** The five listed hypotheses are correctly
  identified as unproved inputs.
  - The reference/actual distinction is right: only P(θy_k) is in 𝒱_k.
  - The agreement on the b-ball is between the input arrays, not between
    the directions.

## Mathematics: `trace-eve-producer.tex`

- **Choice of Q.** The g_p are continuous with g_p(0) = 0, F is finite and
  κ > 0. So one b works for all p, and Q = b/2. Correct.
- **Theorem `thm:ex-lattice-eve-producer`.**
  - χu ∈ 𝓡_{−1/2}, so χ|u| → 0. This gives |u| ≤ Q/χ and |u| ≤ ζ/χ
    eventually (clause 2).
  - Clauses 1, 3 and 4 are the receipts (2), (3) and the probe receipt.
  - Clause 5: the charge is at most g_p(Q)/χ ≤ κ/χ = C_x.
  - Clause 6: c[ZC_x + T L^d 2𝓜] ≤ cZκ + cTSh ≤ ν/2 + ν/2, using χ ≥ 1 and
    m_0 ≤ h.
  - C_x ≤ ζ/χ because κ ≤ ζ.

  Correct.
- **Matching subsection.** This is correctly conditional. The insertion
  estimate with price 2|f| is stated as an outstanding input (the R2 repair
  of #207/#212 is in place). u = 2|f| preserves 𝓡_{−1/2}. The rate
  bookkeeping for B_* (rates −1/2, −1, every negative rate, and 0) gives
  𝓡_{−1/2}.

## Lean correspondence

- **`Cub.Eve`** (`Cub/Chant.lean` l.31–47):
  - `small`, `scaleP` (Blend 2), `sail`, `cap` and `paths` are δ_x, clause 1,
    s_x, (3) and the probe receipt. `paths` uses the `ocean` routing,
    `testLinks` with amplitude y, `runProbe` and `Z.leads`, i.e. the
    probe-to-run difference.
  - `current` with `law` is C_x with clause 5. Here w_p = `partPrice`
    and Λ = `gaugeMeter d`.
  - `berries` (c ≤ credibility, mass = c) is clause 6, with
    c = orbitCost·errorPrice·corn·title(P_0).
- **`Quince.bairn`** (`Quince/Bairn.lean` l.22–34):
  - κ = min((ν/2)/(cZ), ζ) and the same g_p.
  - `V.eventually_all` over the finite test list gives b, and Q = b/2.
  - The conclusion is `current ≤ sprite ζ ∧ sail ≤ sprite ζ`, the manuscript's
    C_x ≤ ζ/χ and s_x ≤ ζ/χ.
  - The receipts are `Mercury.tuned`, `highstar` at tolerance Q,
    `scales_m` at price Q/e, `Blush.fruition` with coefficient L^d and
    budget S, and `Rebuild.geometry`. This matches the evidence file.
- **Row-jet.**
  - `Quince.clarity` (`Scale.lean` l.62–90) bounds the error by
    4(e^{−σb/2}(K+K)(1+4m)^{dk}C_{dk}(σ/2)M). That is (9). Its tail base is
    the coarse parent lift, with size ≤ 4m.
  - `Quince.reachbound` (`Quart.lean` l.28–35) bounds directions with
    `horn₀`, which uses (1+4·depthW L m)^{dk} = (1+4L(m+2))^{dk} at the
    fine lift. That is (10).
  - `Quince.zert` (`Quart.lean` l.37–) is (11) via `Cases.compReads` over
    `OrderedFinpartition`, with `he' : C0 ≤ C1`, `hy : d ≤ p` and
    `hr : 4 ≤ u`. This matches application item 5.

## Findings

- **S1 (eve-producer, cap receipt matching).** The last paragraph derives
  (3) from `eq:ex-lattice-budget-output` "at price Q/e with the paint term
  omitted". That proposition's hypotheses (14) need four facts:
  - B.B ≤ 2b(x), whereas Eve's budget has radius b(β(x));
  - P.threshold ≤ 2B.threshold;
  - coverNumber ≤ P_*(x);
  - B.threshold = fiery(x).

  The second follows from (2), the third from coverNumber ≤ 1 ≤ P_*, and the
  fourth holds by definition. The radius comparison b(β(x)) ≤ 2b(x)
  (eventually, since log β(x) ∼ log x) is not stated. In the source it comes
  from `Rebuild.geometry`, the same receipt as (2). One sentence would close
  this. Dropping the paint term is fine because it is ≥ 0, and clocks and
  meter are ≥ 0.
- **S2 (eve-producer, normalization).** The text calls Z, T ≥ 1 and c > 0 for
  the selected frame "an outstanding input, not proved in this monograph".
  In the source these are elementary lemmas used by `bairn`:
  - `Local.probe_budget` (testPrice ≥ 1);
  - `Push.Local.readPrice_pos` (≥ 1);
  - `Motion.orbitCost_one_le`, `Local.errorPrice_pos`, `cornBig` and
    `title_one`.

  Either prove or cite them (they are frame normalizations), or keep the
  status but note that the source has them. This is not an error; the
  chapter is conservative.
- **N1 (row-jet, statement versus proof).** The proposition assumes
  |u|_1 ≤ 4m for every kernel base. Under that assumption the direction
  bound already holds with (1+4m)^{dk}. The proof's "lifted base index of
  size at most 4L(m+2)" refers to the fine lift at which the source
  evaluates the growth bound (`reachbound`), and the statement never
  introduces that object. The stated C_1 is valid but looser than the
  hypothesis gives. Either say that C_1 keeps the source normalization, or
  introduce the fine evaluation point.
- **N2 (eve-producer, notation).** Several symbols are reused for different
  objects:
  - Q is a price, and also an argument of P_n(N,Q,S).
  - S is the cloud budget and also an argument of P_n.
  - h is credibility and also the masked insertion h(z) in (5).
  - e is title(P_1) and also Euler's number in e^{−v+M/2}.
  - b is the radius function and also the ball radius b > 0.
  - B_* here is the response envelope, while `trace-local-rate-selection`
    uses B_* for the bulk polynomial.
  - Z is testPrice, and Z_0 is a cloud.
- **N3 (eve-producer).** Clause 1 and the cap and probe clauses restate the
  receipts. Say so in the theorem, so that a reader does not look for a
  proof.

## Checks

Recorded in the PR: `check_blueprint.py` and `git diff --cached --check`.
No LaTeX or Lean was run, and no `.tex` file was changed.
