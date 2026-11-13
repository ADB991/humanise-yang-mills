# C14 revision 1, part C: response to finding 7 and part-2 items I3–I5

- Session `hairer-claude-c14-rev1c-20261113` (Claude, under the `hairer` account), role AUTHOR.
  Claim posted on issue #55 on 13 Nov 2026, until 2026-11-14 12:45 UTC.
- Review answered: `review/schmittj-claude-20261113/` (PR #117). Items: part 1 F3, F4, F5;
  part 2 I3, I4, I5; part 4 F3, F4, F5, F6, F7, F8, F9. Parts A (`revision-1.md`, merged to
  `main` as PR #130) and B (`revision-1b.md`, merged to `codex/existence-monograph` as PR #129)
  cover the other findings.
- Base: `codex/existence-monograph` at `ce1b3a4592b7ace11d7a9cbd7352063f39aa2dd6` (includes part
  B, not part A). A test merge with `main` at `0557cc0` was conflict-free and builds (see below).
  Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (read, not elaborated).
- **Author draft. The changed chapters need renewed independent mathematics and
  Lean-correspondence review by a different account.** No approval, fingerprint or `unit.json`
  status was changed.

## Response table

| Item | Request | Change | File |
| --- | --- | --- | --- |
| P1 F3 | Name the reference-packaging facts or mark them as inputs | New stated inputs (R1) faithfulness, (R2) identification of invariant Wick jet polynomials with the reference table preserving moments, derivative plan and rotation variation, (R3) `J^0` is the image of `eq:maxwell-wick-stress`; every later use cites them (descent of `eq:maxwell-polynomial-ward`, uniqueness argument, native construction). The divergence-probe detection is noted to use (R2). | `free-maxwell-ward-flux.tex` |
| P1 F4 | Specify the drive; rename colour index | `eq:maxwell-polynomial-ward` is stated for `v=e_b` or `v(y)=A(y-x_0)`, `A` real skew (hence every affine Killing field). The probe colour index is now `γ` (`e_γ`). | `free-maxwell-ward-flux.tex` |
| P1 F5 | State the orientation of the separation | `Leg_x(P,Q)` is the covariance of `P` at `y_0` with `Q` at `y_0-x`; the sign `(-1)^k` is explained by the parity of the pulse; the Wick subsection uses the tower Gram form at `z=x-y`. | `all-grade-free-detectors.tex` |
| P2 I3 | Fixed windows vs the petal; "limits" too weak | The fixed-window paragraph is labelled motivation and says the estimate is for the origin-centred petal. "Local packet limits" replaced by eventual coincidence with `y_a`, `-y_b` on a neighbourhood of each insertion, with the reason (normalized coordinates `e^{w_i n}y_i → 0` locally uniformly). | `physical-ward-propagation.tex` |
| P2 I4 | Sign hypotheses; derivations of packet tail and shear bounds | New paragraph checks the line-price hypotheses for `B` (pattern of `J_ab`, `a≠b`) and the point-price hypotheses for `A=J_db` (`d≠b`). Derivation of `eq:ward-packet-tail` from the exterior computation of the packet chapter (temporal factor; transverse factors `≤ ||f_j||_∞ e^n h_{j,n}` on the cove). Derivation of the shear bound from `(1+τ)^2 e^{-2τ} ≤ 1` and `e^{-3000n} ≤ e^{w_d n}`. | `physical-ward-propagation.tex` |
| P2 I5 | "Collinear" means on an axis | Definition now says one coordinate axis `R e_a` through the origin, with the reason (orbital term not translation invariant). | `physical-ward-propagation.tex` |
| P4 F3 | Derive the factor 2 in `q ≤ 2e_m` | Principal coefficient and remainder bound are both purchased at parameter `p'_m` (sum `≤ 2p'_m`, the census quantity); the coefficient-to-label transfer takes census budget `e` to quota `≤ 2e`. Note: this differs from the review's phrasing (remainder `≤ e_m`): in the source (`Ribbons.mutation` → `bequeathed`, hypotheses `coeffSize + t ≤ c`, `4(1+cols)c ≤ E`, conclusion `quota ≤ 2E`) the factor 2 comes from the transfer step. | `actual-stress-shell-nodes.tex` |
| P4 F4 | Define `fly`; state growth bound; cite scale note | `υ_i = β̂_i^{-ν_D}` (source `Bandage.fly = fog G D (hatBeta)`, `winter = degree + 4`), `υ_i ≤ 1`; the one-step growth bound of the march is a named same-history input; `rate(r_m) = -1` and `rate(a_{m+1}^D) = -D` cite the scale-note paragraph added in part B. | `actual-stress-shell-nodes.tex` |
| P4 F5 | "cofinal" vs "eventually" | `b_i > 0` and invertibility of `U_{i,5}` hold at every scale; the kernel comparison is stated for every `i`. | `trace-calibration-producer.tex` |
| P4 F6 | Mixed-space identity | Identity is now `X_i + c_i^0 O_i u_i^0 + c_i^1 O_i u_i^1 = 0` in `V_0`; `ℓ_i` is a functional on `V_0`, `ℓ_i(u_i^a)` means `ℓ_i(O_i u_i^a)` (also in `eq:ex-lattice-trace-flux-input`); noted that the first bound gives `eq:...weighted-coefficients` with `C_3 = C_0C_1`. | `trace-calibration-producer.tex` |
| P4 F7 | Notation drift; one comparison curve | (i) Receiver paragraph: its symbols are declared as those of `lem:ex-lattice-trace-weighted-price`, with that lemma's `E` written `𝓔`. (ii) Calibrated sequence: `𝒫_i = Y_i`, `𝒴_i = B_i^{-1} Y_i`, normalized `T̃_i = B_i^{-1}T_i`; `eq:ex-lattice-trace-trial-stress` is for `T̃_i`. (iii) The tensor shell-flux test is now `φ_i` (also in the theorem's hypothesis). (iv) The curve is named once: `r_i = s_{n_i}`, `U_{i,d} = C_{i,d}`, the curve of `sec:actual-stress-normalization`. | `trace-calibration-producer.tex` |
| P4 F8 | Uniform test estimate in the theorem's conclusion | `thm:ex-lattice-selected-trace-gallery` now concludes `eq:ex-lattice-trace-uniform-tests` (sup over tests with support in `Q`, sup-norm `≤ M`), with a proof from the finite-slot expansion at `k`-independent labels and `eq:ex-lattice-trace-test-error`. The normalization chapter cites it instead of its moving-label justification. | `trace-calibration-producer.tex`, `actual-stress-normalization.tex` |
| P4 F9 | Label-dependent budget in the receipt definition | Definition `def:ex-lattice-shell-receipt` now asks for a finite bound `A_m` (may depend on `m`, opening, labels, extraction order; not on anchor or `(N,q)`); the text says `e_m` depends on the labels through `V_m` and that the producer gives `A_m = 2Q_m^quota e_m`. | `actual-stress-annulus.tex` |

## Source declarations inspected (at `3456e5e`)

`YM.Pert.common_stress`, `YM.Pert.same_translation`, `YM.Pert.kappa_eq` (`Pert/Lifted.lean`);
`YM.Maxwell.Free.herald`, `YM.Maxwell.Free.shines` (`Next/MAXWELL/Lit.lean`);
`YM.Outer.chart`, `YM.Outer.mixesLine` (`Next/ROTATIONS/Vanishing.lean`); `spar`, `spar_both`,
`mix_if_both` (`Next/ROTATIONS/Pier.lean`); `Mixed` (`Next/ROTATIONS/Walk.lean`); `petal`,
`petal_mid`, `petal_home` (`Next/ROTATIONS/Patch.lean`); `YM.Ward.Collinear`
(`Ward/Sum.lean`, by name and use only); `YM.MergeProof.Ribbons.mutation`
(`MergeProof/North/Brick.lean`), `Ribbons.sales` (`North/Siroco.lean`),
`YM.MergeProof.bequeathed` (`MergeProof/South/Merman.lean`); `YM.MergeProof.fog`, `winter`
(`MergeProof/Tender.lean`). For P1 F5, P4 F5–F8 the review's source citations
(`YM.Extra.FD.replyTest`, `YM.Trace.Shelves.aprilA`, `YM.Next.UVStress.Approaches`/`Fades`,
`YM.Trace.Over.year_spec`) were not re-opened; the edits follow the review's verified reading
and the manuscript's own definitions.

## Open items and uncertainties

1. **One curve in the source (P4 F7(iv)).** The manuscript now names one curve. Whether the
   public route passes the same `Scaling` to `YM.Trace.Over.year_spec` and to
   `YM.Next.UVStress.produce_current` (via `readyA`) was not traced, as in the review.
2. The petal (`physical-ward-propagation.tex`) is used with the property
   `petal(a,b,l,n)(y) = y_a` when every normalized coordinate has modulus `< 1` (source
   `petal_mid`); the chapter does not define the petal profile explicitly (pre-existing).
3. The one-step growth bound of the march (P4 F4) and the transfer step's factor 2 (P4 F3) are
   named inputs; their proofs are in the same-history service chapters, not re-checked here.
4. (R1)–(R3) in the Maxwell chapter are stated inputs; no manuscript section proves them as
   stated.
5. Not addressed: the review's nits other than those listed, `trace-free-rank.tex` (part 1 F1,
   F2, F9; proposed patch in `revision-1.md`), and the evidence-file name corrections.

## Proposed patches for other owners (not applied)

- Evidence files: none new beyond those in `revision-1.md` and `revision-1b.md`.
- `ledger.md`: the C14-to-C16 stress-normalization edge can cite
  `eq:ex-lattice-trace-uniform-tests` as the producer of `eq:stress-uniform-tests`.
- Integrator: `codex/existence-monograph` does not contain part A (on `main`); merging `main`
  into it is conflict-free with parts B and C.

## Hashes (SHA-256)

| File | Start (`ce1b3a4`) | Final |
| --- | --- | --- |
| `manuscript/existence/free-maxwell-ward-flux.tex` | `66d6a6671deec2afa2f09e52f2164f6f3475090fc5a01147dea4db1bcb10e27a` | `83be666e58cfb43b1f54fe75d2e51e62d6e1eb26df5353c8577960558850d60e` |
| `manuscript/existence/all-grade-free-detectors.tex` | `cd74f687b56f188c37705268bd0bf96bfe0f82360e2aac1515b8bf226194c274` | `c788ecc1d138fef4bba71ad07f18184caa958f587ba73407f196a35058517a13` |
| `manuscript/existence/physical-ward-propagation.tex` | `27def8159cd5540d11254c16f8a3729e89140531a2344cefd7a1fd6c3f949831` | `89956e3fdb977acbce453c190bf0a9b42dc22516e5a8577cd198232b3be39f9d` |
| `manuscript/existence/actual-stress-shell-nodes.tex` | `19a89a5902abc016db6c074bf1813f742f6bd4bfe4d81ff12f5864e3e0ae6d87` | `fef7f53c3c74b7b2e15ba070589b767baf9dd39ea36f5fbefc711c935d7f192d` |
| `manuscript/existence/actual-stress-annulus.tex` | `541a9970e00e5443e95e1e807f8d50521714416e3a4bec974166ac80ffc09347` | `953b8bc789daf7685a10bda2f07b26e524688c54860d399ce25b89017d9db21b` |
| `manuscript/existence/trace-calibration-producer.tex` | `01a231111332191758b6640c16e7b3aebbe5c7d815e3b4ee07ef8fcc6ade5c01` | `404f5e4cf240f155da5ca3c65719910299a6a0aafd84fcc7568bdb3da06b1035` |
| `manuscript/existence/actual-stress-normalization.tex` | `f4c1cebb58e543351f2b59c37a9aedbc70ce4362fb85827e2cffedc428ba1be9` | `80e8969b4b39bb242ce4bf14ac5807b283421c2ba56332e90403c78c47a04bfd` |

## Commands run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in
  `manuscript/` on this branch: exit 0, 968 pages, no undefined references, no multiply defined
  labels, no overfull `\hbox` (two found during editing, both fixed).
- Same build on a test merge of this branch with `main` (`0557cc0`): merge conflict-free,
  exit 0, 968 pages, no undefined references, no overfull `\hbox`.
- Rendered and inspected pages 782 (R1–R3), 786 (one-leg kernel orientation), 827 (trace
  theorem with the uniform estimate), 836 (shell prices, `υ_i`), 865 (sign hypotheses and
  packet-tail derivation).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- Not run: Lean elaboration, `#print axioms`.
