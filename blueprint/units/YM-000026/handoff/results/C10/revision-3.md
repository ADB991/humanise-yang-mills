# C10 revision 3: response to the independent reviews #148–#151

- Issue [#155](https://github.com/hairer/humanise-yang-mills/issues/155); parent C10 (#51), umbrella #26. Unit YM-000026.
- Session `hairer-claude-c10-rev3-20261113`, role AUTHOR. Claim: https://github.com/hairer/humanise-yang-mills/issues/155#issuecomment-6857945705 (until 2026-11-14 12:00 UTC). The account `hairer` authored no earlier C10 chapter or review. Prepared by Claude (Anthropic) for @hairer.
- Base: `codex/existence-monograph` at `c560828`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text; nothing was elaborated.
- Reviews answered:
  - `review/ADB991-claude-20261113-59b4/` (PR #148, part A);
  - `review/ADB991-claude-20261113-e4d9/` (PR #149, part B);
  - `review/mgubi-astra-c10-annulus-renew-20261113/` (PR #150, remaining part of R1).
  - `review/mgubi-astra-c10-curvature-20261113/` (PR #151) requested no change.

  The base hashes of all five changed chapters equal the hashes these reviews recorded.

## Responses

| Item | Response | Where |
| --- | --- | --- |
| #148 R1 (`4μ` bound) | **Adopted.** The bound now uses the source's argument (`YM.Stationary.q_drift`, `qCost`, `S/Spectral/Slabs.lean` l.323, 329). With $x=\operatorname{Re}k_l(p)$ and $w=k_l(p)-x=i\operatorname{Im}p/L$, the strip and $\mu=L^{-1}$ give $|w_a|\le\mu\le1$. Then $q_a(k_l)-q_a(x)=e^{ix_a}(e^{iw_a}-1)$, and $|e^z-1|\le(e-1)|z|\le2|z|$ for $|z|\le1$ (power series). This gives $2\mu$ per coordinate and $4\mu\le4h_l$ in Euclidean norm on $\mathbb C^4$, so the constant 5 is now supported. | `weighted-frame-penalty.tex`, "Verification for the Fourier legs" |
| #148 R2 (summand law, support of $\omega$) | **Adopted.** The summands are uniform on the centred box $\{|z|_\infty\le(L-1)/2\}$ of side $L$. Since $L$ is odd (`sec:common-scale-selection`), this is a complete residue system mod $L$ (source `roulette`, `roll_card`, `S/FrameEst/Center.lean` l.18, 23). Every residue class has $\omega$-probability $L^{-4}$. $\omega$ is supported in the box of radius $J(L-1)/2<(J+3)L$, hence in $\mathcal B$, where $\nu=|\mathcal B|^{-1}$, which gives $\omega\le H_J\nu$. | same chapter, "Eliminating the center of the frame" |
| #149 R1 (side conditions of the determinant identities) | **Adopted, option (a).** New conditions (a) frame regularity, (b) analyticity of the action at the increment origin and (c) stationarity are stated before the identities, and each identity states which it needs, matching the source exactly. `eq:stationary-germ-gauge-det` needs (a) at both points and (b) at the transformed point (`bounty_carry`, with `R.Bounds` among the standing hypotheses). `eq:stationary-germ-signed-det` needs (a) for the transported choice at $(V,U)$ and (a)–(c) for $t$ at the transformed point (`twistWorth`: `Explosives` twice, `Shell`). $\mu>0$ throughout. The text explains why the conditions hold along the selected branch near the trivial field, where the identities are used, and says explicitly that the signed identity is not claimed without (c). The uses in the rest of the chapter and in `stationary-output-construction.tex` evaluate along the branch and are unchanged. `bounty_carry` was added to the correspondence. | `stationary-germ-symmetry.tex`, start of "Transport of the completed determinant" and the two displays; `part-B/correspondence.md` |
| #149 R2 (dropped hypotheses) | **Adopted.** The closing paragraph of `inherited-loop-transport.tex` now lists all packaged data that the English proof does not use: the Hessian gap (`health`), the response data with their two recording conditions (`tilts`, `meets`), the identification of the response map with the one built from $W_i$ (`spun`), and the vanishing of its frame component (`bare`). It says that the proposition is stated under weaker hypotheses than the source. The pole chapter's standing data now fix the block representatives of the step and say where they enter: only in the recording of the pulled-back functions (in the source, `questPole` passes `Q.tags` to `shipGren` and `rank_up_ticket`; the recorded function `PoleTest ∘ uniformM W` does not involve them). | `inherited-loop-transport.tex` (closing paragraph); `quadratic-pole-transport.tex` (standing data); `part-B/correspondence.md` |
| #150 R1, remainder (ticket input (T)) | **Adopted.** The Scope of `annulus-recording-yield.tex` now says that the finite-layer realization is obtained conditionally on (T). It lists the remaining inputs of `prop:ex-annulus-estimate` as (W), (S) and (T), with (T) not established in this text, and no longer says "only the baseline and the response service". The `part-B/ledger.md` Outputs rows `lem:ex-annulus-same-data` and `prop:ex-annulus-estimate` now carry (T) and the open edge `unassigned-to-C10-film-tickets`. The edge stays open. | `annulus-recording-yield.tex`, Scope; `part-B/ledger.md` rows 18, 20 |
| #148 S1–S5, #149 suggestions | **Not taken in this revision**: they are optional and outside the issue's scope. | — |

No statement was strengthened. Two statements now carry explicit side conditions that their proofs already used. No label was added, removed or renamed. No estimate or constant changed.

## Content hashes (SHA-256)

| Chapter | Reviewed (base `c560828`) | After revision 3 |
| --- | --- | --- |
| `weighted-frame-penalty.tex` | `d48a52846c0a62a147740bf1501e7a3a91311d9a3dfa8b86f6688d303e361f64` | `a8d5841c7f409ecd9401ebe0836683c61f3b74c152bd2465d64fe4506998e140` |
| `stationary-germ-symmetry.tex` | `8020bd109bfe0468374cd2e5c5857596cb099259c61415d823c2394f033a08f5` | `9d292bc7a661ec519f4de0a579c7b7afdaf342409a7f6717713e9d10a3b3c31f` |
| `inherited-loop-transport.tex` | `13acb30f2b23561329facaf771b44cedd27328e99118d1a714f24da1a44c9281` | `75659dff65785cd0a8b131222cc622249665286cb87a39f5c761c144356e0dab` |
| `quadratic-pole-transport.tex` | `2476144f4516574592dcdfc563196789a0ef492ecdaf98496e5ab1418850ab33` | `3508978162486562429f61bb999af7d61328a757e3abbedd46783afa5d363a0a` |
| `annulus-recording-yield.tex` | `f27088a05595a1fb09ba7542610db40b8d36ef5fd09997216e2fa05f7e2d091b` | `63d65eaeb201f21b0cd8150070526a529965820ee510cb74344baac431da54d6` |

The review fingerprints of these five chapters are now stale. Renewed independent review of the changed hunks is needed, by an account other than `hairer`.

## Checks actually run

- `latexmk -g -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c10build existence.tex` from `manuscript/`: exit 0, 970 pages. The log has 0 lines with "undefined" and no LaTeX warnings. The `Overfull` count is 0. A page-by-page `pdftotext` scan finds no `??`.
- Rendered at 70 dpi and inspected: pp. 473 (frame centre), 475 (Fourier legs), 516 (recording Scope), 522 (side conditions), 534–535 (inherited-loop closing paragraph and pole standing data).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` `python3 -m unittest discover -s tests`: OK. `git diff --cached --check`: clean.
- Source read at the pin: `Slabs.lean` l.315–335 (`q_seat`, `q_drift`, `qCost`) and l.189–192 (`inch`); `FrameEst/Center.lean` l.1–60; `Joint/Symmetry.lean` l.85–100 and 272–290; `Joint/Gauge.lean` l.163; `Joint/Regulator.lean` l.501–510; `Films/TraceDifference.lean` l.470–478; `Films/LeadingRay.lean` l.771–780; `Loops/HessianMatch.lean` l.719–743; `Films/RankColor.lean` l.120–160.
