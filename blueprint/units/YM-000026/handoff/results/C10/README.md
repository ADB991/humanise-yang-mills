# C10: higher stationary response, annular terms and inherited loops (author pass)

- Package: C10, issue [#51](https://github.com/hairer/humanise-yang-mills/issues/51); parent #26. Unit YM-000026.
- Session: `schmittj-claude-c10-20261112`, role AUTHOR. Method: four read-only Codex `gpt-6-astra` audit passes over all seventeen chapters; two Claude author agents on disjoint chapter sets, who decided every audit item against the LaTeX and the Lean text and made the repairs (part A: `soft-curvature-receipts`, `multileg-curvature-lift`, `weighted-frame-penalty`, `weighted-stationary-inverses`, `selected-stationary-linear-data`, `selected-kinetic-response`, `stationary-determinant-prices`, `thermal-contact-cancellation`; part B: `classical-stationary-vertices`, `annulus-fleet-face-estimates`, `annulus-two-wave-estimates`, `annulus-recording-yield`, `annulus-same-data-binding`, `stationary-germ-symmetry`, `stationary-output-construction`, `inherited-loop-transport`, `quadratic-pole-transport`); then a second Codex pass over every edited hunk, whose findings and the authors' responses are recorded in each part's `findings.md` under "Second round". Coordinated by a Claude session. None of this is an independent review.
- Status: **author draft, not reviewed.** No approval is recorded. An independent reviewer owns `review/`.
- Base: `codex/existence-monograph` at `80be46a`, rebased onto `81538d6`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text only; nothing was elaborated.

## Where things are

`part-A/` and `part-B/` each contain `findings.md` (errors repaired, gaps repaired, gaps not repaired, the table "Audit items and decisions", second-round responses, notes for other packages), `ledger.md`, `correspondence.md` and `validation.md`. `handoff.md` in this directory is the summary for the reviewer and for G06.

## Summary of the pass

Sixteen of the seventeen chapters changed; `multileg-curvature-lift.tex` was checked against the Lean statements and left as it was. Main repairs:

1. `classical-stationary-vertices.tex`: the contraction formula inverted the raw internal Hessian, which is degenerate under gauge transformations; the source inverts its gauge completion. The text now has \(Hu=-s\) and \(HM^{-1}H=H\) with proof; the final formulas are unchanged. New `prop:ex-classical-stationary-pictures`.
2. `annulus-fleet-face-estimates.tex`: the geometric hypothesis was too weak for the lower bound on the denominator (new hypothesis and proof); the regulator is built from the ghost film, not the Wilson film; the input family is now defined; the three contributions after summing over plaquette types are displayed.
3. `annulus-two-wave-estimates.tex`, `annulus-recording-yield.tex`, `annulus-same-data-binding.tex`: the recording strip is chosen after \(L\), not before; a missing radial integration is supplied; `lem:ex-annulus-common-strip` replaces a one-line justification; `prop:ex-annulus-estimate` states the annulus estimate (the source's `HorizCalc`), conditional on two named inputs.
4. `soft-curvature-receipts.tex`: a wrong restriction removed; the Ward-partition proof rewritten with the period-independent block functions; definitions of the actions, the bed and its attachment and the floor clauses; `lem:ex-soft-quadratic-hessian` and `lem:ex-soft-wilson-pictures`; the recording statements carry the entrywise summability that the source requires.
5. `stationary-determinant-prices.tex`: a bound on the complex strip was false as stated (\(\le5h\), not \(\le h\)). `weighted-stationary-inverses.tex`: a positivity hypothesis added. `selected-stationary-linear-data.tex`: the tangent identity is an explicit named input from C11, not proved here.
6. `stationary-output-construction.tex`, `inherited-loop-transport.tex`, `quadratic-pole-transport.tex`: a missing direct Wilson term; the matching equations are inputs, not consequences of stationarity; a guard that restricts \(L\); new `prop:stationary-output-path`, `prop:inherited-loop-picture`, `prop:ex-pole-coefficient-transport`.

The second Codex pass found one regression, two errors and two gaps in the first-round edits. All were confirmed against the source and corrected; they are listed with the corrections in the findings files. No edit had to be reverted to the original text.

## Edges to C11

- `C10-to-C11-annulus-estimate`: produced as `prop:ex-annulus-estimate`, conditional on the inputs (W), (S) named there.
- `C10-to-C11-one-step`: C10 does not state the assembled one-step theorem. C11's interface in the source uses a refinement that C10 does not state; the four components in part B are now explicit propositions.
- `C10-to-C11-hessian-identity`: only the flat-coordinate Hessian is proved here; the forest chart with penalty and the chart analyticity are produced by no C10 chapter.
- `C11-to-C10-stationary-tangent`: consumed as a named input.

## What is not done

- Inputs stated explicitly and not produced by any located chapter: the conversion from Taylor pictures to marked-layer responses with fees (inputs (W), (S) of the annulus estimate); the recording of the film slots at every torus side (`unassigned-to-C10-film-tickets`); a uniform gap over all periods for the classical and output chapters; same-history path and bed data.
- The all-period extension of one soft-receipt statement is not written; the theorem stays at what the source exports.
- Incoming edges from C01 (rack legs, two-scale matching), C06, C07, C09 and C11 were opened only at the cited passages.
- Declarations not opened are listed in the findings files.
- Three new propositions list only the hypotheses their arguments use, while the Lean lemmas take packaged data with further fields; this is stated in the text and should be confirmed by the reviewer.

## Validation

- Full build after the rebase: `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/`: exit 0, 938 pages, no undefined references, no multiply defined labels, no overfull boxes.
- Scoped wrappers for each part were built and changed pages inspected as images (lists in the part `validation.md` files; not every changed page was viewed).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.` `git diff --check`: clean.
- New labels are listed in the part validation files. No existing label was removed or renamed.

## Content hashes

| Chapter | SHA-256 at start (`80be46a`) | SHA-256 at handoff |
| --- | --- | --- |
| `soft-curvature-receipts.tex` | `6bced1f690fe64fe69662da7b46ac83785f405d464a393e411b251a61081ef07` | `ff7c8854eb698c02100ddc0691820f667b3b2ab4bba627de9ba0a8e9f2c8c010` |
| `multileg-curvature-lift.tex` | `f5adb060a319496491f8c344ffbb1036a4c6e09ad54052aa36c8c1f081740419` | `f5adb060a319496491f8c344ffbb1036a4c6e09ad54052aa36c8c1f081740419` |
| `weighted-frame-penalty.tex` | `6c2d0c44cf05932f947d98731cec92ce755d6559b34f6b255248efbe6e8570d6` | `d48a52846c0a62a147740bf1501e7a3a91311d9a3dfa8b86f6688d303e361f64` |
| `weighted-stationary-inverses.tex` | `6c6f512ad937a7f4e675a2fe000c1dfd1df44113feb6951a3ac17f69eb0c3441` | `46f3a95065dab9f280ca520f2cbbd58aed43a5f904cbed2ee308590fa90a1880` |
| `selected-stationary-linear-data.tex` | `2b609a230363936a82b829102cc840ca620e3efcb12562338c27023e0ce4a3e1` | `d5f20e2f39502b821ca6cd965345eb6fd61cfe8ba9974996ef5f49b3f8151f52` |
| `selected-kinetic-response.tex` | `23ba50242e7e3e812ef7bf67747a3303e80ef9b1bf36d611f675c12ce97e5cb9` | `3ead2deac5a25404b78491a3688d008061558c72335e7abfe86a9d515f6ec212` |
| `stationary-determinant-prices.tex` | `31c642d6a73b7df97253673817cc2600b17f08f5c757c9920eb468344515cdc5` | `c330251aa54264c2908974b961b8b04aaaee5b8e7760119c46818bc72d8fa396` |
| `thermal-contact-cancellation.tex` | `deb0c1c24ad2b83089afaff3ed4cfc076d23651acd3985b87a93c6201ccb6f8b` | `f6d8f997331e6c1ba5bf097d4a3986bef6a421d0c597beafdcbfddbddb751352` |
| `classical-stationary-vertices.tex` | `40a22ff050d43d1df00657a9c7b2d02b2872420eb0ff2465bf2b54c1a45a5f2b` | `dbcf15dc4bc64168d4c6955b07e73fd65f0c17958e73ba7a57ec3b051cb30ecc` |
| `annulus-fleet-face-estimates.tex` | `e07280594b35c5ae41ae70f0a549982b638f0186d3e9fb8a78bb3c24f9bc8727` | `f821aa29c5e403247af1b23802ebc166950beded77dfef8e2061f2f650b9985a` |
| `annulus-two-wave-estimates.tex` | `adc35ff0bd3ae5f33bf22b548a85de49bea218ab7f1c6599f081fcb4d4ba40b8` | `7aa0211039fb33a7144e7f529cb341feda57bf2b828800320a096f1733ec7e0d` |
| `annulus-recording-yield.tex` | `0d096770b3a84aec96f9a59ddcdf49476abd944a01adf58c4137d9037a1ef608` | `f27088a05595a1fb09ba7542610db40b8d36ef5fd09997216e2fa05f7e2d091b` |
| `annulus-same-data-binding.tex` | `095be0354ac9e6f715fb18ded93d62dce4201427195a4685a04d1f2f0ce613ba` | `e01c4c26d9ed34d4d5dd79e6118b40cc3eb51a3a2ab579dbb726b782b493ee32` |
| `stationary-germ-symmetry.tex` | `340d602e93352d876efa4caffbf645e3ecd0f3e9bdf33ebbbf223c4c5f4fb023` | `8020bd109bfe0468374cd2e5c5857596cb099259c61415d823c2394f033a08f5` |
| `stationary-output-construction.tex` | `33913d09974f195d4533d78df8a5619e4eb98df4eb661af7febe5c23cc8b31c5` | `ae91401bd456d21a2a18f93fcb5b2a7591905bc3f5f560fb5ca254e6d22060b0` |
| `inherited-loop-transport.tex` | `8ee9f3df1f703de6212ba99629e1ebec89d1477085274ede4e0eb3e3962a6e18` | `13acb30f2b23561329facaf771b44cedd27328e99118d1a714f24da1a44c9281` |
| `quadratic-pole-transport.tex` | `d7814c03f1488a4c21bbc9b706cb8fbccb7963d99f4fc4ff6f11dd2cf03f76b2` | `2476144f4516574592dcdfc563196789a0ef492ecdaf98496e5ab1418850ab33` |

The canonical evidence files `blueprint/units/YM-000026/*-evidence.md` were not modified and describe the text before this pass.
