# G05 independent review (agent review, not human acceptance)

- Package: G05 (`blueprint/units/YM-000026/handoff/G05.md`), issue [#61](https://github.com/hairer/humanise-yang-mills/issues/61); parent #26.
- Reviewed: `manuscript/existence/symbolic-index.tex` (SHA-256 `0b69fffa8ef93450cfe36d10acaed603ca1f06c622e2b6f67995e4d3367e79b6`) and `blueprint/units/YM-000026/handoff/results/G05/` as merged by PR #135, at `codex/existence-monograph` `bac6004` (G05 commit `b8cc75b`). Author session `TrishenGunaratnam-terra-g05-20261113`.
- Roles: mathematics/editorial validity (notation and order) and source correspondence of the cited Lean anchors.
- Reviewer session: `ADB991-claude-20261113-eeb9`, under the account `ADB991`. Claim: https://github.com/hairer/humanise-yang-mills/issues/61#issuecomment-6854758107 (until 2026-11-14 09:45 UTC).
- Agent: Claude (Anthropic), running as a scheduled agent. ADB991 did not review this report before submission.
- Independence: this account wrote no G05 file. It did write the G04 pass-1 outline (#119), which G05's `g04-crosswalk.md` discusses, and G02 (#138, a draft that has not been merged), which bears on G05's `s_G` remark. I checked those G05 statements against the chapters and not against my own reports. A reviewer with no G04 connection should recheck `g04-crosswalk.md` if that matters for acceptance.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Outcome

**Changes requested (one required, several minor).** The inventory, hashes, index entries and the C01 drive/response finding are confirmed. One check fails, though. The proposed total order (`proposed-total-order.md`) moves three groups of producer chapters after chapters that use them as premises. Neither `order-exceptions.md` nor `statement-block-insertions.md` records these moves (R1). Taken literally, the proposal therefore does not "preserve the mathematical dependency DAG" required by G05.md. Most of the repair is mechanical: keep these files at their current relative positions.

## What was checked, with evidence

1. **Hashes and coverage (confirmed).** `sha256sum -c chapter-hashes.sha256` passes for all 241 files at `bac6004`. The file list in `chapter-hashes.sha256` matches the `\input` order of `manuscript/existence.tex` line by line. The 241 entries of `proposed-total-order.md` form a permutation of that list, with no duplicates and none missing. The supplemental #33 hash `b30651d8…796f` equals the SHA-256 of `trace-prosper-sensor.tex` at `bac6004`.
2. **Reference scan (reproduced independently).** `forward_scan.py` (in this directory; it has its own regex and does not use the author's `scan.py`) finds 1,874 labels and 3,249 `\ref/\eqref/\cref/\Cref/\autoref/\pageref/\nameref` uses in the 241 files. It finds 0 unresolved references and 0 duplicate labels. The counts differ slightly from G05's 1,873/3,224 because the macro set and the comment handling differ. The conclusions agree.
3. **Exception list against the order (partly confirmed).** Under the proposed order the scan finds 66 cross-file forward references whose target label lies inside a theorem, lemma, proposition, corollary, definition or assumption environment. All 54 such references with statement-prefixed labels are in `order-exceptions.md`. The other 5 exception rows (`ex-column-subpower`) have a target outside a statement environment and are also listed. The 12 statement-environment references that are not listed all point to equation labels inside statements. I read each of the 12: none is a premise use, except `trace-local-rate-selection.tex:41,59`. Those two take their definitions from the same block as the listed exceptions 54–55, so the planned move covers them. The remaining ten are output, comparison or preview links (`heat-vectors.tex:108`, `ope-cutoff.tex:371,425,432`, `ope-filtration.tex:3,373` (two references on line 373), `physical-ward-propagation.tex:521,522`).
4. **Forward references the proposal itself creates (fails: R1).** Compared with the current include order, the proposed order removes 28 cross-file forward references and adds 29 (`new-forward-references.tsv`). Under the proposal there are 332 cross-file forward references in total, against 331 under the current order. Statement-environment targets number 66 under the proposal and 61 now. Before its block moves are applied, the proposal is therefore not closer to dependency order than the present include. Reading each of the 29 added references:
   - covered by G05's own split plan: the four `actual-phase-grid-approximants` uses (exceptions 34–37), `heading-history-handoff.tex:367,369` (exception 16, insertion 3), and the `ex-column-subpower` uses (exceptions 44–47);
   - output, preview or comparison links: `projection-payment-producer.tex:236`, `fixed-rung-convergence.tex:3,67,181`, `public-run-binding.tex:87`, `finite-rank-kernel-transport.tex:202`;
   - **premise uses that are not recorded anywhere in G05:** see R1.
5. **No literal circularity in deferred proofs (confirmed).** Many of the insertions move a statement early and leave its proof at the owner. For each producer or definition exception I extracted that proof (where one follows the statement) and listed every label it cites. None cites a label in its consumer file. This is a literal-reference check only; it does not exclude an unlabelled or same-object dependence.
6. **Symbolic index (confirmed, with one minor correction, M1).** I checked all 22 entries against the defining text: `statement.tex` 16–100 (G, r_G, 𝔤, coordinates, P_p, D_N, a_N, ex-smearing, 𝓕_d, X, ν, χ_*, ex-mixture, ex-reconstructed), `limits.tex` 1–90 (Conf, Gen, Cyc_p, NoHit_p, f_mesh/f_per with period threshold outside the mesh threshold, S), `phase-selection.tex` 10–21 (Ξ, μ), `sector-gram.tex` 1–41 (𝓗, P_𝓗, M, A=M*M+P_{𝓗ᶜ}, λ=q^{-1/2}), `gaussian-reassembly.tex` 14–18 (A, A_0, C, C^{-1}−A retained), `background-path-convergence.tex` 13–16, `marked-healthy-cumulant-launch.tex` 59–130, `annulus-two-wave-estimates.tex` 60–117 with `pilots/running-coupling.tex` 20–45, `actual-stress-annulus.tex` 20–33, `annulus-fleet-face-estimates.tex` 14–24, and `assembly.tex` 30–56. Each entry states the meaning given there. In particular both Casimir constants are the average of −Tr((ad e_b)²) over a basis orthonormal for −r_G^{-1} Re tr(uv). So C_G = C_𝔤, and λ_G = 11C_G/(24π²) = 2b_0(G) holds at this base.
7. **C01 drive/response clash (confirmed in the text and the Lean source).** `kernel-transport-identities.tex:16–19` calls `D_{v,a}` "the propagated one-form covariance from Section~\ref{sec:ex-lattice-free-kernel-components}". There, `free-kernel-components.tex:60` defines `D_{v,a}=S_v·rail_M`, the drive (`YM.Next.Free.Train.drive`, `Lean/YM/Next/FREE_KERNELS/Feed.lean:40`). The covariance used in the identities is the response `𝒟_{v,a}` of `free-kernel-estimates.tex:342` (`Train.levelD`, `Feed.lean:136–137`): `Heart.lean:46,54` write `vault` and `pulse` with `levelD`, not `drive`. G05 contract action 4 is correct.
8. **Other Lean anchors (confirmed).** `Lean/PublicWilson.lean:35–57`: positive integer, strictly increasing period and denominator; site modulus `period p * denominator N`; `mesh = denominator⁻¹`; centred `place` via `ZMod.valMinAbs`; `finiteMoment` is the Wilson-law integral of the product of insertions. `Lean/YM/Extraction/Orders.lean:34–47`: `refine` composes componentwise, and `late` is `∀ᶠ k, ∀ᶠ j` (period outside, mesh inside). These match the contract and the index.
9. **LaTeX (confirmed).** Built a wrapper equal to `existence.tex` with `\input{existence/symbolic-index}` inserted before the bibliography. `latexmk -pdf -interaction=nonstopmode -halt-on-error` exited 0 and gave 969 pages, with no undefined or multiply defined references and no Overfull messages in the log. I rendered pages 968–969 (`pdftoppm -r 70`) and inspected them: they are legible and every cross-reference resolves.

## Commands run (from the repository root at `bac6004` unless noted)

- `sha256sum -c --quiet blueprint/units/YM-000026/handoff/results/G05/chapter-hashes.sha256`: all OK.
- `python3 -I forward_scan.py <repo> proposed-order.txt prop.json` and the same with the current `\input` order: the counts in items 2–4.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> g05-review-wrapper.tex` (from `manuscript/`, wrapper deleted afterwards): exit 0, 969 pages; `pdftoppm -r 70 -f 968 -l 969`.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `git diff --cached --check`: clean.

## Required change

**R1. Three groups of producer files are moved after their consumers without a recorded exception.** Positions below are (proposed / current include).

| Producer (moved) | Premise uses now forward | What is used |
| --- | --- | --- |
| `ope-grouping.tex`, `ope-grouping-algebra.tex`, `ope-singletons.tex` (209–211 / 53–55) | `local-transfer.tex:107,166,252,267,281` (item 13); `cluster-expansion.tex:3` (18, comparison); `soft-log-fusion.tex:157` (49); `projected-parameter-prices.tex:247` (112); `wilson-startup-construction.tex:242` (121) | the connected-set estimate `eq:ope-forest-price` (bound by e^γ−1), the real/imaginary representation and support/eligibility properties of `sec:ope-singletons`, and `eq:ope-single-coin` |
| `rg-price-receipts.tex` (62 / 16) | `marked-activity-jets.tex:258` (51) | the radius estimate (`eq:ex-lattice-pressure-radius`) |
| `fullmesh-correlation-cauchy.tex`, `fullmesh-fixedbounds-producer.tex`, `smooth-limits.tex` (136, 139, 138 / 25, 28, 27) | `selected-centered-service.tex:206,209,211` (134) | removal of the higher marker terms, the finite-difference bounds, and smoothness of the limit |

The first group matters most. Despite the `ope-` prefix, `sec:ope-grouping` proves a general cluster-counting estimate that C06, C08 and the startup construction all apply. Placing it with the C05 OPE block puts it after its first consumer by roughly 200 files. Fix: keep each group before its first consumer, which is its current include position, or add exceptions and statement-block insertions for each listed use. In either case, `order-exceptions.md` should also say that it covers only statement-prefixed labels, and that equation and section references were checked separately (they were not).

## Minor findings

- **M1 (index).** The entry for `D_{v,a}`, `𝒟_{v,a}` cites only Section `sec:ex-lattice-free-kernel-components`. The response `𝒟_{v,a}` is defined in `sec:ex-lattice-free-kernel-estimates` (`free-kernel-estimates.tex:342`). Cite both sections.
- **M2 (counts).** The exception count is given as 58 (`handoff.md`, `validation.md`, `order.md:183`) and as 59 (`order-exceptions.md:3`, which has 59 rows). The statement-block count is given as 28 (`handoff.md`; `statement-block-insertions.md` has 28) and as "30 target blocks" (`validation.md:117`). Make them agree.
- **M3 (same-file forward uses).** Of the 22 same-file forward references (`same-file-forward-references.tsv`), G05 mentions 5. Several of the unmentioned ones are uses before definition or premise-like, and fall within G05's "undefined first uses" remit: `path-attachment-producer.tex:743–744` (assumes `def:path-admissible`, defined at 783), `stationary-output-construction.tex:146` (takes the Hessian gap from `prop:stationary-output-path` at 359 as input), `marked-campaign-producer.tex:76` (actions written out only in the proof at 498), and `physical-ward-propagation.tex:141` (form (S1)–(S3), stated at 525). List them for the chapter owners, or state that same-file order is out of scope.
- **M4 (s_G, information only).** The index and `g04-crosswalk.md` correctly say that the match of s_G with λ_G is a separate input at this base. Draft PR #138 (G02, not merged, written by this reviewer's account) proposes that match, with its derivation. If it is accepted after independent review, the index sentence and the crosswalk row will need refreshing. This is not a defect of G05.

## Not checked

- The 16-group `semantic-register.md` and the C06–C07 renaming proposals (N1–N4) were read, not verified one by one against every occurrence.
- The other equation and section forward references (242 under the proposed order that the current order shares; 270 under the current order) were not classified.
- `lexical-first-occurrences.tsv` and `reference-scan.json` were not re-derived row by row. The independent scan reproduces their aggregate conclusions only.
- No Lean elaboration or axiom audit. Mathlib hosts are unreachable from this environment, and none was needed for the anchors above, which are source-text checks.

## Acceptance

This is an agent review. A human must take responsibility for acceptance, and a new G05 candidate addressing R1 needs renewed review at its new hashes.
