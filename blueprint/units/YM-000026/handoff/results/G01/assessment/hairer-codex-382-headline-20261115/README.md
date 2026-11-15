# Proposed construction-bound headline for #382

Author session: `hairer-codex-382-headline-20261115`, 15 November 2026.
Claim: https://github.com/hairer/humanise-yang-mills/issues/382#issuecomment-6892846837.
Base: `90e6883a89182324a97f6cee20db146a6fe7c006`.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
One Codex author; no subagents or independent review. Status: **proposal/draft**.

## Editorial decision proposed

Use `thm:ex-construction-headline`, included from `statement.tex`, as the
headline. Keep the literal public target and its inadequacy examples in the
following subsection. The headline is a selection of consequences of the
stronger construction, not an equivalence with all of `YangMills.constructed`
and not a new claim to have finished the monograph's existence proof.

The primary change is substantive: normalize the local lattice sections by
classical curvature jets, retain the exact inserted-density transport on the
same Wilson history, and obtain the phase space from the mixed limit's
compressed observable algebra. Require multilinearity and reconstruction at
every character, and identify the tested grade-four field with the centered
trace of the normalized physical stress tensor.

The headline uses ordinary mathematical notation; source names belong here.
It intentionally does not add contact extensions, nested OPE, the independent
scalar OS interface, effective coupling, the Maxwell scaling limit, or the
additional Wick/Maxwell exclusion clauses. No precise monograph statement for
these has been supplied by this change. In particular it is not a translation
of every clause of the review group's `CombinedAcceptance`.

## Inspected correspondence

All local Lean references below are at the pin above. Inspection was restricted
to the endpoint, its meaning-determining records and relevant definitions.

| Manuscript assertion | Inspected source | Meaning / limitation |
| --- | --- | --- |
| Group and choice order | `YangMills.constructed`, `Lean/Construction.lean`; `YM.Nonperturbative.existence`, `Lean/YM/Nonperturbative/Headlines.lean` | `forall g hg b hb, exists C, ... forall p, exists q S F L Q M X, ...`. One family precedes each requested extraction order. No common hierarchy across different requests. |
| Classical normalization | `YM.Source.Projects`, `YM.Source.SectionData.Sound`, `Lean/YM/Source/Local.lean` | Equality of all derivatives in the scaling parameter through degree d against actual holonomy test links. The section is linear, polynomial in link entries/conjugates, invariant and unit-preserving. This is more than WilsonRegularity. |
| Actual insertions | `YM.Source.initial`, `YM.Source.TransferData.cylinder`, `YM.Source.TransferData.Based`, `Lean/YM/Source/Insertion.lean`; `YM.Family.O`, `.Makes`, `.normalized`, `Lean/YM/Source/Construction.lean`; `YM.Labels.Frame.scaled`, `Lean/YM/Labels/Reference.lean` | Formula (headline-insertion) is exactly initial applied to terminal.symm: a^(-d), then factor-count scaling, then the fixed local section. `Based.encode`, `.unnormalized`, `.reads` tie the coefficient to the inserted Wilson density. This is not a conditional-expectation normalization. |
| Shared Wilson history | `YM.RG.History.Selected`, `Lean/YM/RG/History.lean`; `YM.Spec.Calibrated`, `Lean/YM/Spec/Closed.lean` | Exact bare start, transfer, reference coupling and selected running history; calibration retained by F. The headline refers to this construction, not arbitrary invertible matrices. |
| Full mesh then extracted periods | `YangMills.constructed`; `YM.Spec.Seed` / `.Final`, `Lean/YM/Spec/Closed.lean` | Full-mesh Ordered and PositionsUV are distinct from the refined order in Final. Existing interface `blueprint/interfaces/continuum-reconstruction.md` explains the distinction. |
| Field quotient | `YM.Table.criterion`, `.vanishes`, `.equivalent`, `.Field`, `Lean/YM/Euclid/Null.lean` | All spectator degrees and all separated configurations; not merely the two-point null space. |
| Local structure and stress | `YM.Spec.Locals`, `.Materializes`, `.Final`, `Lean/YM/Spec/Closed.lean` | Inclusions, derivatives, rotation laws, conservation, tensoriality, stress charges, selection certificate. Manuscript suppliers remain conditional. |
| Every-character reconstruction and boundary barycenter | `YM.Nonperturbative.Headline.WightmanAxioms`, `.Reconstruction`, `Lean/YM/Nonperturbative/HeadlineSpec.lean`; existence assembly in `Headlines.lean` | `.characters` is genuinely for every character, with vacuum uniqueness; `.average` uses joint Schwartz tests. This is stronger than the selected-only public reconstruction. No assertion of one-dimensional mixed vacuum space. |
| Common OPE | `Headline.SeparatedOPE`, same path | One reader on the same F; all characters and mixed state. Existing coefficient/remainder formulas retained. Nested/profile-integrated clauses are not fully restated. |
| Physical centered trace | `Headline.TraceExclusions.identified`, `.centered`, `.shortDistance`, same path | Identified at the operator level with the trace of F.sector.energy minus its selected Euclidean VEV times the identity. Only the existing time-axis trace limit and finite mass-shell exclusion enter the headline. |

The phase-algebra identification and equality of null spaces reuse the
canonical prose in `phases.tex`, `phase-selection.tex`, `phase-regularity.tex`
and `phase-fields.tex` and their existing correspondence records. This session
read their relevant statements/proofs; it did not re-audit their entire Lean
producer chains. In particular independent correspondence review must still
check the assembled phase claims against the retained certificate.

### What prevents the constant-insertion counterexample?

`rem:headline-nonconstant-sections` is a new elementary prose argument: the
weighted polynomial v(h.J) has degree at most d, so its Taylor data determine
it. A constant section implies a constant polynomial; zero implies zero.
Invertibility of factor-count scaling and terminal renormalization preserves
the dimension of the section image. Nonwrapping permits all stencil link
assignments on a sufficiently large torus. Thus all insertions cannot be
constant when the label space contains a nonconstant polynomial. This is a
narrow obstruction to the G01 counterexample, not a proof that no other
inadequate witness can satisfy an abbreviated specification, and not a proof
that the continuum is non-Gaussian. The elementary argument was not added
to Lean and needs mathematical review along with the statement.

### Review group's primary files

Read through the GitHub plugin on 15 November:
- `yang-mills-group/YM/submissions/openai-20261028/checks/AcceptanceSpec.lean`,
  blob `c8ba61da441bd8052877d789d2f67de78a4cccd6`;
- same directory `CombinedAcceptance.lean`, blob
  `2b22d1c94ca5b21fdfaae89e97e6c05ad7096af9`.

`combined_acceptance` calls `YangMills.constructed` once and its adapters keep
that F. `LatticeAndScale.insertion_readout`, `OperatorContent`,
`TranslationWard` and `LeadingTrace` make the intended connections explicit.
Their imported proofs were not independently rebuilt. The existing reading
report in `../relevance-report.md` and the discussion of #382 guided triage;
the PDF could not be fetched by the web tool in this session. No reconstructed
formula from that report was used as a mathematical premise. The existing
YMG26 bibliographic reference is retained for context, not as a supplier of
missing proofs.

## Exact remaining obligations

1. The local-section and finite marked chapters explain the ingredients of
   `Makes`/`Based`, but do not yet supply one closed, standalone producer of
   all the reference-normalized transfers and estimates. The headline's
   description is deliberately semi-formal at this point. A C12/C16 assembly
   must retain exact unnormalized transport, bare encoding, invertibility,
   unit/reality/signed symmetries, and reference readout on one selected family.
2. Carry the family and its all-spectator quotients through the full-mesh
   limit and phase algebra. Keep the full-mesh Wilson convergence separate
   from refined-mesh auxiliary comparisons.
3. Assemble the every-character Wightman statement and joint-test barycenter
   from the existing analytic machinery. The existing selected-phase
   statements and `ex-joint-input` alone do not assert it.
4. Match the stress charge normalization, the selected centering, and the
   trace asymptotic on this very hierarchy. Do not choose another stress or
   another subsequential limit for the trace comparison.
5. Independently review the new mathematical statement and correspondence.
   Existing package reviews are not refreshed by this edit.

These are retained construction obligations, not new hypotheses on G and not
an attempted replacement of a missing proof by an assumption.

## Issue #382 disposition

Items 1 and the directly related scope limitations in 3 have a concrete draft.
Items 2/7 already have the #403/#410 work; 5 needs no change; 6 was withdrawn
as a correction in the issue. Item 4 (numerical running slope) and item 8
(complete glossary/ledger cross-check) remain open. No closure of #382 is
proposed. No change to the shared contract or other package outputs is made.

## Validation actually performed

- `python3 scripts/check_blueprint.py`: passed, four units. The new nested
  manuscript input is registered in YM-000026/unit.json; status stays draft.
- `git diff --check`: passed.
- From manuscript: `latexmk -pdf -interaction=nonstopmode -halt-on-error
  -outdir=build existence.tex`: passed, final PDF 1073 pages, no undefined
  reference/citation warnings. The headline occupies pages 22--25.
- Rendered pages with macOS PDFKit/AppKit using Swift and visually inspected
  pages 22--25. No clipping or overflow in the changed material. The existing
  monograph has layout warnings elsewhere (including four-digit TOC page
  numbers); those were not repaired in this bounded change.
- Initial worktree/fetch attempts failed because the original .git is
  read-only and shell DNS could not reach GitHub. Work was isolated in a local
  clone at /tmp/ym-382-headline; GitHub reads/writes use the requested plugin.
- An initial authoring command used the wrong working directory and made no
  changes; the corrected command wrote the files and they were rebuilt.
- Poppler and PyMuPDF were unavailable. Swift rendering needed an explicit
  writable module cache. A rendering attempt during a simultaneous rebuild
  failed to open the PDF; rendering the completed PDF succeeded.
- No Lean build, replay, axiom audit, or new formal theorem was run. No claim
  of independent mathematical or Lean-correspondence approval is made.
