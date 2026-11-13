# C14 revision 1, part B: response to findings 1 and 2 of the independent review

- Session `hairer-claude-c14-rev1b-20261113` (Claude, under the `hairer` account), role AUTHOR.
  Claim posted on issue #55 on 13 Nov 2026, until 2026-11-14 12:00 UTC. This session did not
  author or review any C14 chapter before this revision.
- Review answered: `review/schmittj-claude-20261113/` (PR #117). Part B covers README findings
  1 and 2: part 4 F1, F2, F10 and part 2 G1, G2, I6. Part A (session
  `hairer-claude-c14-rev1a-20261113`, `revision-1.md`) covers findings 3–6 and 8. Finding 7
  and part 2 items I3–I5 are untouched and remain open.
- Base: `codex/existence-monograph` at `84a6a9371caddd2f9967b9d6924e156ec097610e`.
  Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (read in the repository's `Lean/`;
  not elaborated).
- **Author draft. The changed chapters need renewed independent mathematics and
  Lean-correspondence review by a different account.** No approval, fingerprint or `unit.json`
  status was changed.

## Response table

| Item | Request | Change | Where |
| --- | --- | --- | --- |
| G1(a) | Prove the raw commutation relation and the unit, mirror (and related) rules for `(p,Y)` | New paragraph "The stress-law package" states (S1)–(S3) precisely (windows, symmetric/real/conserved stress, signed covariance of the stress, the two raw flux identities `eq:ward-raw-translation-flux`, `eq:ward-raw-rotation-flux`). New `lem:ward-local-response-laws` with full proof of (i) commutation (both identities), (ii) inclusion, (iii) unit (integration by parts on the word with the unit deleted, Killing weight, symmetry, conservation), (iv) reality, (v) signed covariance (change of variables `y'=ky`, orthogonality). Replaces the six-line sketch. | `physical-ward-propagation.tex` |
| G1(b) | Prove the two readout limits with the scaling computation | New `prop:ward-readout-limits` (`eq:ward-translation-readout`, `eq:ward-rotation-readout`) with hypotheses (a)–(d) named, and a three-step proof: finite separating observer reads; rescaling of the flux (`r·r^{-1}·r^4` resp. `r^{-1}·r·r^4`, absorbed into `\widetilde J_k`); limit via norm convergence of the stress-slot functionals and `eq:stress-fixed-normalization`. The "Second" bridge paragraph now cites it. `physical-angular-actions.tex` cites the two displays instead of "supplied by the physical Ward comparison". | `physical-ward-propagation.tex`, `physical-angular-actions.tex` (citations only) |
| G2 | Justify `c ≠ 0` | "Since `p≠0`" replaced by the argument from `eq:ward-translation-readout`: `c=0` forces `p_d=0`, hence `κ∂^0_d=0`, contradicting `κ≠0` and `∂^0_d≠0` above the detector threshold. | `physical-ward-propagation.tex` |
| I6 | Say why the transported vectors lie in `V_d` | `V_d` is now defined explicitly (unit, conjugation, signed covariance, inclusion conditions); one paragraph shows `p` (via the lemma (ii)–(v)) and `∂` satisfy them and that the aligned comparison maps carry them into `V_d`. The corollary's proof states how the lemma is consumed after division by `c`. | `physical-ward-propagation.tex` |
| F1 | Per-family opening; per-family hypotheses in the proposition | New `lem:ex-lattice-opening-exists` (every reference level is opened at arbitrarily late levels, proved from the tab-schedule bounds `L_j≥3`, `B_{j+1}^2≤2B_j^2`; persistence cites `lem:ex-centered-opened-copy`). The annihilation lemma now chooses `p_0` = maximal watch depth and `k≥ref(D)` opened for that family. `prop:ex-lattice-annular-field` assumes the lemma's hypotheses for every finite family (opening, receipt, separated-point constants `C_a`, `c_a`, `q_*`), and its proof says the union family gets its own opening. | `actual-stress-annulus.tex` |
| F2 | Shell-node proposition in the form of `def:ex-lattice-shell-receipt` | `prop:ex-lattice-actual-shell-node` restated: `t,j_m` chosen first; then for every opened `(p_0,k)` with `k≥ref(D)`, all labels and every extraction order, `m_0`, per-anchor sequence with `p_0≤N`, chamber membership and the two bounds on an `𝔣`-late set. The former plain hypotheses (`p_0≤k≤m`, `m+1<j_m<N`, reference thresholds, lightness, room) are now derived as eventual conditions in the proof. Chamber membership of the three readouts is kept as a named eventual receipt (see open items). New paragraph "The scale note" derives `log r_m/λ_m → -1` from gentleness `log L_m/λ_m→0` and `log B_m/λ_m→0`. Annulus text updated to say what the proposition supplies. | `actual-stress-shell-nodes.tex`, `actual-stress-annulus.tex` |
| F10 | Cite the faithful-hierarchy hypothesis | Faithfulness at grade `D` is now a hypothesis of `prop:ex-lattice-annular-field` and is cited where the finite faithful family is chosen; the closing remark lists it, the tab schedule and the scale-note properties. | `actual-stress-annulus.tex` |

## Source correspondence (inspected at `3456e5e`)

| Manuscript | Source declarations | Files |
| --- | --- | --- |
| (S1)–(S3) | `YM.Climb.Pre` (`tensor : Table.Conserved`, `symmetric : Table.RawTensor`, `raw : Table.StressLaws`); `Table.Window`, `Table.shellGrad`, `Table.shellSpin` | `Climb/Beams.lean`, `Euclid/Stress.lean` |
| `lem:ward-local-response-laws` (i) | `YM.Bid.ShellCom` (`moves`, `delta`); proof `YM.Work.A02.answer` via `deriv_shellGrad`, `deriv_shellSpin`, `deriv_center`, `deriv_integral`, `stable`, `deriv_head` | `Bid/Angular.lean`, `Work/A02.lean` |
| (ii)–(v) | `YM.Bid.A01`, `YM.Work.A01.translation_color`, `YM.Work.A01.angular_hyper` (`Bid.Hyper`, `Climb.ColorLaw`, `Climb.Colors`); `flux_unit`, `cutoff_zero`, `killing_const`, `killing_orbital`, `flux_real`, `flux_mirror`, `move_rotation`, `Org.orients`, `ext_against_real`, `ext_against_mirror` | `Work/A01.lean`, `Work/A01/{Conserve,Mirror,Support}.lean` |
| `prop:ward-readout-limits` | `YM.Bid.A05`; `YM.Work.A05.answer`, `Observer.gets_translation`, `Observer.gets_rotation`, `Observer.exists_reads`, `Observer.reads_converge`, `recover_on`; `reaches_grad`, `reaches_spin`, `reaches_stress`, `integrate_sheet_scale`, `arm_scaled`; `Climb.Lighthouse.delta` (reference flux identities with `κ•deriv`, `κ•K.lie`); `Scaling.meter` | `Work/A05.lean`, `Work/A05/{Weak,Read,Window}.lean`, `Climb/Beams.lean` |
| `c ≠ 0` | `YM.Bid.Town.pressured` (via `awake` on the A05 translation limit), `Climb.extends_form` | `Bid/Town.lean`, `Climb/Peaks.lean` |
| `V_d`, I6 | `Climb.Colors`, `Climb.fixed_kernel`, `Scaling.toColor` | `Climb/Cells.lean`, `Climb/Peaks.lean` |
| `lem:ex-lattice-opening-exists` | `YM.Stock.Tabs` (`grows`), `Tabs.opens`, `Tabs.mayOpen`, `Tabs.open_later`; `Lattice.Scale.block_large`; radius `budget.B := clock.coverSize` | `Overlay/Prior.lean`, `Lattice/Scale.lean`, `RG/History.lean` |
| per-family opening in the lemma | `YM.MergeProof.Acme.zone` (`Q := sup (X i).t`, `mayOpen`, `k := max k₀ (C.ref D)`), `Acme.Aroma.opens` | `MergeProof/West/Ozone.lean` |
| faithfulness, union family | `YM.MergeProof.Acme.annular_fieldA` (`Work.A04.finite_faithful _ (observes H D)`, `insert I T`) | `MergeProof/West/Bravo.lean` |
| shell-node statement | `YM.MergeProof.Ribbons.Economics.fees`, `ShellNode` (`corners`), `laurelE`, `bricks` | `MergeProof/North/{Economist,Brim}.lean` |
| scale note | `Ribbons.fugacious`, `Ribbons.fuchsia`, `Ribbons.briar`, `Schedule.Gentle` | `MergeProof/North/{Economist,Wicker}.lean`, `Lattice/Scale.lean` |

Correspondence is by reading the source; nothing was elaborated.

## Open items and uncertainties

1. **Chamber receipt.** In the source, chamber membership of the readouts and the placement
   are derived inside `bricks` on a late set (`near_center`, `faraway`). The manuscript now
   states this as a named eventual receipt in `prop:ex-lattice-actual-shell-node`; I did not
   write that derivation.
2. **Scale-note inputs.** `log B_m/λ_m → 0` (source `briar`, via `whack`) and gentleness are
   cited as schedule properties of the selected history; their producers were not re-proved.
3. **Hypothesis (d) of `prop:ward-readout-limits`** is order zero of the compact convergence in
   `sec:actual-stress-normalization`, which was reviewed only conditionally (part 4).
4. `lem:ward-brackets` asks for "Euclidean covariance"; the source (`Bid.Hyper.hex`) and the new
   lemma give signed covariance only. This matches the source. The wording of `lem:ward-brackets`
   is outside part B and may deserve a check.
5. Not addressed: finding 7, part 2 items I3–I5, and all part-A items.

## Proposed patches for other owners (not applied)

- `physical-ward-propagation-evidence.md` (read-only evidence; G1 overstatement): replace
  "The manuscript proves ... the finite-level A01--A08 bridges" by "The manuscript proves the
  A01, A02 and A05 bridges (`lem:ward-local-response-laws`, `prop:ward-readout-limits`); A03,
  A04, A06–A08 are summarized."
- `ledger.md`, `findings.md`, `handoff.md` (part A owns the wording, finding 8 / R1–R2): add
  to the annulus inputs the tab schedule (`lem:ex-lattice-opening-exists`), the scale-note
  schedule properties, faithfulness at grade `D` and `C.Makes`; status of the
  C14-internal-shell-annulus edge: "coefficient-bound mismatch repaired (PR #98); per-family
  opening and statement alignment answered in revision 1 part B; chamber receipt remains an
  eventual input".
- `hashes.json`: final hashes below.

## Hashes (SHA-256)

| File | Start (`84a6a93`, = review) | Final |
| --- | --- | --- |
| `manuscript/existence/physical-ward-propagation.tex` | `8d221691d726121ff612090714fe44e54dd736ef1e8af8f6d2b783663696e634` | `27def8159cd5540d11254c16f8a3729e89140531a2344cefd7a1fd6c3f949831` |
| `manuscript/existence/physical-angular-actions.tex` | `c244c72a1430cb535c2d18683faa9e020974e628b9133feba82f048753c0c09f` | `0dbdf4bcc4290be59c6e7d782252065a2c753224158b86b92f25b57d0a78756e` |
| `manuscript/existence/actual-stress-annulus.tex` | `ba9210b96c59f1363250c0531f9ab0bb3f6c8a9785f494d5d73cc5b56108a1f3` | `541a9970e00e5443e95e1e807f8d50521714416e3a4bec974166ac80ffc09347` |
| `manuscript/existence/actual-stress-shell-nodes.tex` | `076e430a43dae3b4f90edd483908f70bf463e44ce1a1aaf47d3ba863f0f593b6` | `19a89a5902abc016db6c074bf1813f742f6bd4bfe4d81ff12f5864e3e0ae6d87` |

## Commands run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in
  `manuscript/`: exit 0, 966 pages, no undefined references, no multiply defined labels, no
  overfull `\hbox` in the changed chapters (two found in the first build, both fixed).
- Rendered and inspected pages 839–840 (shell-node proposition, scale note), 843 and 845
  (opening lemma, annulus lemma and proposition), 866–870 (stress-law package, local response
  laws, readout limits).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- Not run: Lean elaboration, `#print axioms`.
