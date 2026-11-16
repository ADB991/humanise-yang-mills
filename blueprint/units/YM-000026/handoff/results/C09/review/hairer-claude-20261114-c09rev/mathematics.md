# Mathematics review

Session `hairer-claude-20261114-c09rev`. The target and scope are given in `README.md`.

## M1 (minor, required): the hypotheses of the interpolation proposition

**Where.** `heading-history-handoff.tex`, the last paragraph of
"One finite set of insertion types for every grade". This is the text #104 added after
"combine all columns into one linear coefficient family".

**Issue.** The sentence says that the purchase inequalities, together with the bank and room bounds, "allow `prop:ex-selected-interpolation` to combine all columns … provided" the following hold:
- the readout intertwines motion and conjugation and preserves the unit;
- the coefficient, regular and forced fields are complex-linear on common supports;
- the coupon merger is summable.

The sentence then calls these "inputs to that finite assembly". This was accurate for the C03 snapshot that review #77 (M3) examined.

At the current base, the proposition in `phase-quantitative-producer.tex` assumes more:
- the heard identities (H1)–(H6);
- the profile hypotheses stated before `eq:ex-interpolation-buy`: the coefficient law is sound under local reorientation, the forced profiles are covariant, and the local evaluation is nonzero;
- the exact density and profile identities of the basis coupons;
- a common gauge door;
- wings that are motion images of the common funded wing.

C09's list covers (H4)–(H6) and the merger, but not:
- (H1)–(H3): the played coefficient's x-coordinate, linearity and covariance of the density, and the subadditive charge bound;
- the profile hypotheses.

Some of these may be supplied earlier in this same section: the door, the coupon identities, and the density transfer of the three-port history. The sentence as written does not say which.

**Requested change.** Replace the paraphrase by a reference to the proposition's full hypothesis set. For each hypothesis, say whether this section supplies it (for example the common door, or the coupon identities through the three estimates) or whether it remains an input. Record any new open input in the C09 ledger. The change is wording only. It does not affect the estimates proved in this chapter.

## Checked and passing

### `small-field-budget-selection.tex`

**Strengthened cluster remainder.** C08's `sec:high-degree-cluster-prices` defines the following, and C09 uses each with the same meaning:
- `H_eta = ell^{pj} e^eta (pj)! eta^{-pj}`, with `ell = 4(2B+1)`. This is C09's `P_eta`, whose factor `C_j(x)` is common to all reserves and has upper exponent zero.
- `sigma = (1+2^j B_1) omega`. This is C09's `S`.
- The two smallness conditions `eq:degree-first-smallness` and `eq:degree-second-smallness`, with `b_B = (2B+1)^4`.
- The purchases `D^3 <= e^M` and `D^3 <= e^{epsilon T}`.
- The large-class bound `D^{-3} H_eta D sigma (1-1/2)^{-1}`.

The remainder estimate also checks:
- `P_y <= e^y P_i` for `0 < i <= y`, because `y^{-pj} <= i^{-pj}` and `e^i >= 1`. The common factor `C_j(x)` cancels.
- The remainder is at most `e^y D^{-2} z^q = e^y z^{q-3/4}`, and `q - 3/4 <= -19/16 < -23/20`.
- C08 requires only `varphi < -3/8`; C09's `q <= -7/16` is a stricter specialization, as the ledger says.

The two smallness conditions are retained as hypotheses, not proved here. They are in fact eventually satisfied, as C08's last subsection shows, because `C_j >= (pj)! > 0`.

**Forced absorption.** Every step of the displayed argument checks:
- `kappa = -log(vp) >= 0` needs `vp <= 1`. That holds eventually, because `P_F^2 / log z -> infinity` (the opening growth fact).
- `I <= (8p)^{-1} + 2b`, so `(2B+1)^4 I <= 1` and hence `I <= 1`.
- `e^I - 1 <= 2I` on `[0,1]`.
- `e^{-kappa}(e^I-1) <= v(1/4 + 4pb) <= 3v/4`, using `pb <= 1/8`.

The new monitor justification is also correct. With `v = C exp(-r beta tau^2)`, `tau = z^{-1/2} P_F` and `beta >= z/4`, one gets `beta tau^2 >= P_F^2/4`, so `v <= C exp(-(r/4) P_F^2)`. The edit also correctly separates this strong local price from the schedule's forced allowance.

### `uniform-stationary-chart.tex`

**Larger-step conditions.** C11's `subsec:path-stationary-chart` (in `path-attachment-producer.tex`) requires:
- `100 R_macro <= f` and `1 < c`;
- branch compatibility;
- `R_macro = (j+3)l + 4l`, which equals `(j+7)l`.

The C09 text states these. C09 also states `l >= 3` and `j_ph >= 4`. C11's prose does not mention them, but they are structure invariants of the patch (see `source.md`), so C09 is correct and slightly more explicit.

**Order `n >= j+2`.** The derivative estimate in `truncated-stationary-log.tex` through order `k` uses orders `k+2` for `phi` and `rho`, and order `k` for `psi` and the log-determinant. The chart at `N = n+3` supplies:
- `rho` through order `n+2`;
- `f` through order `n+3`;
- the log-determinant through order `n+1`;
- the loop and Haar terms through order `n+4`.

These support derivative estimates in `L` through order `k = n`. The even-gain estimate needs `y`-jets through order `j` plus two derivatives in `b`, so `k = j+2` suffices. The requirement `n >= j+2` is therefore exactly right.

### `regular-principal-producer.tex`

The added anchor, radius and room hypotheses (`B_f <= 2B_c`, `100(1+B_c) <= c`) are exactly what is needed to turn shortness (`q^3 < L`) into nonwrapping. `eq:polynomial-moment-null` is the correct reference for "moments through degree d".

The surrounding short/long split agrees with C08's `eq:reference-integrated-attenuation`. That includes the `[(1+q)^3/L]^{d+1} >= 1` insertion for long supports and the large-coarse-support case. In that case `sup_t (1+t)^k e^{-t/2}` is attained at `t = max(0, 2k-1)`, as stated. "All admissible periods" is the right qualification, because nonwrapping now depends on the room condition.

### `fixed-rung-convergence.tex`

- **The `0 < theta <= 1` hypothesis is needed.** The Haar small-ball lower bound is written with the ambient real dimension `d_G` in the exponent. `(theta/16)^{d_G} <= (theta/16)^{dim G}` holds only because `theta/16 < 1`.
- The bound `Z_N^0 >= a_m` is consistent: it gives `|E| d_G log(16/theta)` per bond set.
- **Background norm.** "Rooted ordinary derivative prices and forced value prices" is the norm that the subsequent uniform-evaluation bounds (`Vb||A||`, `Vk||A||`) actually use. The order-zero part of the derivative prices controls values.
- The path-sum identities `sum_x e^{-delta|x|_1} = ((1+e^{-delta})/(1-e^{-delta}))^4` and their atom analogues are correct.

### `local-source-stability.tex`

- With `delta = gamma / (2(1+MB))`, the extra rooted price is at most `gamma/2`, and `degreePrice(3gamma/2) <= 3/4`.
- The one-marked-factor expansion inequality and `(r+1)^j <= 2^{jr}` both hold.
- **The edit is a real correction.** Absorbing `2^j` into each elementary price multiplies the marked total bound `B` by `2^j`. So `B`, and then `delta`, must be chosen after the order `j`.

### `heading-history-handoff.tex` (apart from M1)

The added sentence says each grade has its own heading, while the transition and the marked derivative map are common to all grades. This is consistent with the quantifier order used in the proof: one door, then for each `d` with `d+3` at most the kernel level, a heading for that grade's frame. See `source.md`.

### `marked-kernel-convergence.tex`

The new qualifications are hypotheses, not claims:
- the assumptions hold for the actual pair of admissible background histories;
- support and eligibility hold for each background;
- the background entry is zero when a regular address is used as a separate marked slot.

They are the per-background conditions of the inserted leaf (see `source.md`). The common-variable argument that follows checks: the envelope (‡) follows from `||w-mu||^2 >= ||w||^2/2 - B^2` and `det r_N <= v^D`.

## Not established here

This review does not establish any of the following:
- that the actual selected history, funded transition or C08 component majorants supply the hypotheses retained above;
- the C07 nonflat Gram match;
- the C10/C11 Hessian identity;
- the C11/C13 weighted tails;
- the C03/C12 reconciliations.

No unchanged argument is certified.
