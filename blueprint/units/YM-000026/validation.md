# Validation log (ongoing)

Parent integration clone: `/private/tmp/ym-existence-20261111`.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

* `python3 scripts/check_blueprint.py` passed after the locality integration:
  two units, structure OK; this does not verify Lean or mathematics.
* `/Library/TeX/texbin/latexmk -cd -pdf -interaction=nonstopmode -halt-on-error
  -outdir=build manuscript/existence.tex` built the 75-page checkpoint with no
  remaining LaTeX warnings. Log: `/private/tmp/ym-existence-latex-build.log`
  (overwritten on later builds). Earlier missing corollary/mathscr definitions
  were corrected; earlier overfull boxes were removed before this checkpoint.
* All 75 pages were rendered with `pdftoppm -scale-to 800 -png` to
  `/private/tmp/ym-existence-preview/page-*.png`. All nine 3-by-3 contact sheets
  were visually inspected: no clipping, overlap, or missing glyphs visible.
  This is overview QA of the 75-page checkpoint, not final high-resolution QA
  of later additions.
* Independent gpt-6-astra reviews are copied under `reviews/`. They include
  specific mathematical corrections and source checks with chapter hashes.
  Material later changes require renewed review. Machine review fields remain null.
* No Lean source edit, fresh Lean build, axiom replay, or clean-source build was
  performed. Inherited source/build.md evidence has its stated prebuilt-artifact
  limitation. These English proofs are not certified by the blueprint checker.
* No commit, PR submission, merge or publication has yet been made for these files.


## 109-page checkpoint

The integrated 109-page checkpoint built successfully with the same latexmk
command and no LaTeX warnings or overfull boxes. `pdftoppm -scale-to 800 -png`
rendered all 109 pages to `/private/tmp/ym-existence-preview-109/`; all thirteen
3-by-3 contact sheets were visually inspected. No clipping, overlaps or missing
glyphs were seen at overview resolution. The later phase-price chapter is not
part of this checkpoint. Files and the PDF were copied to the workspace.
The centered lane/density alternative is being separated from the main public
route after caller tracing found that Wcmain is supplied by Gardens.gardena.

### 120-page checkpoint
The direct latexmk command completed successfully, producing 120 pages / 997659 bytes before singleton insertion. Rendered pages 81–103 with bundled pdftoppm and visually inspected all 23 pages in four contact sheets under `/private/tmp/ym-existence-preview-120/`. No clipping, collision or layout defect identified. Earlier checkpoint QA covered the other material. A subsequent singleton insertion is currently rebuilding and needs its own local layout check.

### 19:45 UTC producer expansion checkpoint

- `python3 scripts/check_blueprint.py`: passed after leaf-expansion and cluster
  additions (structure only); rerun pending latest mixed/fusion additions.
- Integrated latexmk build: 173 pages, no overfull boxes, known unresolved
  `ex-centered-sail` until centered-construction integration. Later soft-log-fusion
  chapter not included in that build.
- Visual QA: rendered pp.118--145 and viewed all four contact sheets under
  `/private/tmp/ym-existence-preview-175/`; no visible layout defect. Includes
  repaired local-splitting literal-backslash issue and new section constructions.
- No Lean source edits, fresh build or axiom replay.

### 19:55 UTC checkpoint

- Integrated 192-page article built successfully. One 1.06pt line overflow and
  `over` TeX warning in newly drafted price chapters were fixed; rebuild clean
  for those chapters. All references resolved.
- Rendered and visually inspected all pages 39--48 (centered construction) and
  144--155 (Gaussian warning, packet estimate, soft-log fusion) in four contact
  sheets `/private/tmp/ym-{centered,prices}-qa-contact-{0,1}.jpg`. No clipping,
  overlap or missing glyph identified at overview resolution.
- `python3 scripts/check_blueprint.py` passed after Gaussian and packet additions:
  two units, structure OK only. Seed-energy is a later addition, now rebuilding.
- Independent conditional local passes: Gaussian d0dfa7f19b8739045bd6070bfe04da6201889fda36b70a0e0fbc0d51c866a953;
  packet1e220b3bb0955c27bb797f54ed760fec042ebc0d0f8e0bdc35768d7ec5da6f77.
  These do not discharge their retained analytic inputs or imply completion.

### 20:35 UTC checkpoint

- Integrated latexmk build completed: 253 pages / 1626989 bytes. No overfull
  boxes, unresolved references or LaTeX warnings found in the log.
- `python3 scripts/check_blueprint.py` passed after local-covariance integration:
  two units, structure OK only.
- Rendered and visually inspected all pages 174--210 (seed geometry, guides,
  comparison, energy, annulus, Gram and covariance), 35--47 (RG producers), and
  63--74 (centered producers). Nine contact sheets under
  `/private/tmp/ym-{seed,rg,freight}-qa-contact-*.jpg` show no clipping, overlap
  or missing glyphs at overview resolution.
- Independent review report copied through the local-covariance pass. These
  local checks retain the displayed incoming inputs; whole-proof closure
  remains outstanding. No fresh Lean build, axiom replay or Lean edit.


2026-11-11 21:00 UTC approximate checkpoint: actual latexmk build completed 281 pages, 1753945 bytes; log scan found no Overfull or LaTeX warnings. Blueprint checker passes 2 units (structural only). Rendered pp209–229 of preceding274-page build with pdftoppm, inspected four contact sheets `/private/tmp/ym-new-analytic-contact-{0,1,2,3}.jpg`: mean, Haar, normalization, compensated variation and mean/action layouts readable with no clipping/overlap. Newly inserted horizon and Gaussian differentiation/moment pages still need visual inspection. Exact packet delta and moment small wording update require next rebuild. No Lean build or axiom replay.

### 21:20 UTC checkpoint

- Latest integrated latexmk build: 300 pages / 1835047 bytes, including the
  corrected healthy-support hypothesis and output exponent in activity assembly.
  Log scan found no overfull boxes or LaTeX warnings. Structural checker passes
  two units; it does not verify Lean or mathematics.
- The preceding 300-page build was rendered for pp.37--41, 80--85, and 237--260.
  All six contact sheets `/private/tmp/ym-horizon-contact-0.jpg`,
  `/private/tmp/ym-service-contact-0.jpg`, and
  `/private/tmp/ym-activity-contact-{0,1,2,3}.jpg` were visually inspected.
  No clipping or collision identified. The final assembly wording needs its
  next local visual check; the underlying layout otherwise remains unchanged.
- Independent local conditional passes confirmed for remote action, inherited
  prices, itinerary prices, likelihood ticket estimate, Gaussian moments,
  activity assembly, centered service and Geyser estimates. Editorial itinerary
  fingerprint 28fc529e... and service 72d4df9a... retain those passes. Report copied.
- Full-mesh producer is still with author/reviewer and is not integrated.
  Whole-proof closure remains outstanding. No fresh Lean build or axiom replay.

### 21:35 UTC checkpoint

- Integrated build before latest forest/exclusion insertions: 312 pages, 1892631 bytes. Log scan clean for overfull boxes and LaTeX warnings.
- Rendered and inspected contact sheets `/private/tmp/ym-312-{safety,reassembly,fullmesh,tariff}.jpg`, covering pp.229–233, 268–273, 94–98, 55–57 respectively. No visible clipping, overlap or missing glyphs at overview resolution.
- Forest-average/log and forced-exclusion passed independent conditional local review after healthy-order and canonical-majorant repairs, fingerprints recorded in review report. Tariff reflow56532f8e retains earlier pass.
- Phase producer remains unintegrated pending real-valued approximation correction. Trace candidate remains unintegrated pending substantive producer proofs. No Lean source edits, fresh build or axiom replay.


### 21:55 UTC approximate checkpoint

- Actual latexmk build completed at 336 pages / 1995461 bytes. Corrected
  a missing display terminator and two line overflows; final log clean for
  overfull boxes and LaTeX warnings. Projection-payment is a later insertion.
- Rendered and visually inspected all pp.277–283, 286–293, 329–334 and98–103
  in `/private/tmp/ym336-{forest,marked,payment,phase}-contact.jpg`.
  No clipping, overlap or missing glyphs identified at overview resolution.
- Marked jets, phase conditional assembly, numerical arrival, scale schedule,
  and actual projection payments passed bounded independent review. Editorial
  reflow hashes sent for acknowledgment. This is not whole-proof closure.
- No fresh Lean build, axiom replay, source edits, commit or push.

### 2026-11-11, 347-page kernel/horizon checkpoint

Commands actually run in `/private/tmp/ym-existence-20261111`:
- `python3 scripts/check_blueprint.py`: passed, 2 units; structural only.
- `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex`:
  completed, 347 pages (2,049,396 bytes). Final log has no overfull boxes,
  undefined-reference warnings, or LaTeX errors. Earlier 349-page build
  exposed three-digit TOC-number width and an inline formula overflow;
  both were fixed and rebuilt. The amsmath foreign-command diagnostic is
  inherited mathematical typesetting, not a failed build.
- Rendered pp.38–50 and 304–308 with pdftoppm; inspected contact sheets
  `/private/tmp/ym347-kernel-contact.jpg` and
  `/private/tmp/ym347-curvature-contact.jpg`. Layout is clean at this scale.
- Synced only the owned manuscript/blueprint files and the built PDF to
  `/Users/hairer/humanise-yang-mills`. Copied the independent reviewer report.

Positive-row, exact-kernel-transport, and curvature-horizon local proofs have
independent bounded mathematical/source review. The draft as a whole remains
incomplete. No Lean source changes, Lean build, axiom replay, commit, push,
merge or publication were performed at this checkpoint.


### 2026-11-11, 414-page local-convergence checkpoint

- Ran the structural checker successfully (2 units).
- Ran latexmk with the documented flags. Final build: 414 pages,
  2,346,221 bytes before the final display reflow; after reflow the page
  count remains 414. Final log has no overfull boxes, undefined references,
  multiply-defined labels or fatal errors. Two mathematical tag commands
  needed explicit math mode; one long geometric majorant was displayed.
- Rendered pp.110–114, 343–364, 384–389, 404–408 with pdftoppm and
  inspected all five `/private/tmp/ym414-contact-{0,1,2,3,4}.jpg` sheets.
  No clipping, overlap or missing glyphs identified at overview resolution.
  This supplements the earlier 384/394-page rendered checks; final whole-book
  ordering and detailed typography remain to be done after proof closure.
- Integrated the independently checked fixed-scale graph, background path,
  countable source stability and common-variable marked-integral chapters.
  Local-source final tag repair fingerprint:
  cec21b47aad71ba01a6caa0cc8f99dcfcd2c5501bcf206f6faed02d9125ab5cf.
  Fixed-rung final display repair fingerprint:
  e0033dda0b3d25b37da5c3f8e8c91a6777445e1e0d4d11c7d4736cc0225e2ba5.
- Coupled-background and finite-real-test chapters are separate review
  candidates and are not yet included in this PDF. The nonlinear FullPaths
  and trace analytic suppliers remain incomplete. Section 2 overview,
  symbolic index and final notation/order pass are still pending.
- No Lean source edits, Lean build, axiom replay, commit, push or publication.


## 444-page integration checkpoint, 2026-11-11 23:31 UTC

- Ran latexmk with the existing PDF/interaction/halt-on-error settings; successful
  output: 444 pages, 2,472,757 bytes. Reflowed three long displays and replaced
  the undefined path annulus macro by explicit mathematical notation. The final
  log has no overfull boxes or undefined references.
- Rendered pages 361–385 and 411–417 with pdftoppm; inspected all four
  `/private/tmp/ym444-contact-{0,1,2,3}.jpg` sheets. No clipping, overlap or missing
  glyphs identified at overview resolution.
- Integrated the independently checked path attachment, trace calibration,
  coupled history convergence, finite-test sharpening and real-ray contraction.
  These remain conditional local proofs. The stronger reviewer checked the
  layout-only revisions to the path and finite-test chapters.
- New real-coupling interpolation draft is under independent review, outside
  this compiled checkpoint. Remaining analytic suppliers, whole-proof closure,
  Section 2 outline, symbolic index and final ordering/notation pass remain open.
- No fresh Lean build, axiom replay, source edits, commit or push.


2026-11-11 23:50 UTC checkpoint: structural checker passes (2 units; no mathematics/Lean verification). latexmk built 467 pages, 2,597,107 bytes; no overfull boxes or undefined references in final log. Rendered pages 338–342,379–403,433–442 using pdftoppm at scale1100 and visually inspected all five contact sheets /private/tmp/ym467-contact-{0..4}.jpg. No clipping or overlap observed in this sample. Parent owned manuscript and unit files synchronized to workspace, including unintegrated high-degree candidate. No Lean commands or source edits, no commit/push. Full-proof closure remains outstanding.


2026-11-12 04:09 UTC checkpoint: latexmk successfully built 487 pages, 2,682,333 bytes, with no overfull boxes or undefined references in the final log. Rendered 23 pages (343–356, 379–382, 455–459) at scale1000 and visually inspected all three /private/tmp/ym487-contact-{0..2}.jpg sheets; no clipping/overlap observed at overview resolution. Structural checker passed (2 units, not Lean or mathematics verification). Supplier chapter integrated after this build; next build pending. No Lean command, source edit, commit or push.


2026-11-12 04:41 UTC checkpoint: latexmk successfully built 514 pages (2,800,524 bytes before the final display-only reflow). The final log contains no overfull boxes or undefined references. Rendered pages 359–379 and 480–484 with pdftoppm at scale1100 and visually inspected all three /private/tmp/ym514-contact-{0,1,2}.jpg sheets: no clipping or overlap identified at overview resolution. This covers the stationary action/radius/log/exterior/small-field/boundary additions and Crown buffer. No Lean build, axiom replay or source edit; no commit or push. Whole-proof closure and final editorial work remain open. Live issue26 rechecked on resume; no overlapping claim. Usage at 04:37 UTC: 94% remaining, credit balance unchanged, zero resets available.

2026-11-12 05:11 UTC: structural checker passes 2 units. LaTeX checkpoint builds 547 pages; one pending crossreference to trace-price-recurrence not integrated yet. Earlier 533-page additions visually inspected at overview scale on rendered pp408–422,458–461,499–503; no visible layout defects. Latest additions await visual QA. Current account limit check at05:06:91% weekly remaining, credits unchanged, no reset available. No new Lean build or axiom replay.

### 2026-11-12 05:36 UTC

Live issue26 comments rechecked05:21; no conflict found, claim expires16:40UTC. Blueprint PR30 rechecked05:35 at unchanged ba33d36fe767e5068d9d02d4dd13ff80ce47a3be. Usage86% remaining, credits50413.0750500000 unchanged, no reset available; nextcheck05:51UTC.

Actual latexmk builds:565 pages then573 (one overfull inverse display) then575 pages with no overfull/undefined diagnostics. Display reflowed; determinant editorial carry reviewed. Visual overview QA on565 pp417–438 via three contact sheets found no clipping/overlap/missing glyphs. New575 pp430–449 rendered, inspection pending. pypdf extraction succeeded; fitz extraction attempt failed because module absent, then used pypdf. Structural checker passes2 units; no Lean or mathematical conclusion follows from it. No fresh Lean build or axiom replay.

2026-11-12 05:44 UTC: latexmk completed successfully at 577 pages; no overfull boxes or undefined references. Visually inspected 575-page pages 430–449 and 577-page pages 454–456, 537–545 via rendered contact sheets; no layout defect identified. This validates rendering, not mathematical closure. Regular-atom addition follows this PDF checkpoint.

2026-11-12: `python3 scripts/check_blueprint.py` passed (2 units; no mathematical or Lean verification). `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex` succeeded, 596 pages, no remaining overfull boxes or undefined references. Rendered and visually inspected pages 447–450, 500–510 and 555–562 via pdftoppm/PIL contact sheets in /private/tmp/ym-qa596; no layout defects observed. New content includes stationary germ symmetry, interval return, scalar reset, shooting, regular trace atom and Fourier/jet estimates. Physical-reset-reorganization remains an unimported review candidate. No fresh Lean build or axiom replay. Draft remains incomplete; no commit/push/PR.

## 2026-11-12 06:37 UTC checkpoint

latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex completed successfully (624 pages). Final pass has no undefined references or overfull boxes; initial-pass rerun warnings resolved. Overview rendering inspected on pages 105,107,108,452,454,523,524,526,528,529,530,533,579,580; contact sheets /private/tmp/ym-qa624/contact-{0,1,2}.png. New formulas fit margins. This is layout QA, not mathematical validation. Common-observable-purchases is not yet included and is under independent review. No Lean build or axiom replay.

## 2026-11-12 06:52 UTC — 636-page checkpoint
`python3 scripts/check_blueprint.py`: passes, 2 units. `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex`: passes, 636 pages, final log has no undefined-reference or overfull-box warnings. Rendered and visually inspected pages 450–451, 542–545 and 594–595 at /private/tmp/ym-qa636; equations fit and added prose is readable. These checks precede the terminal-marked/service integration, whose build follows. No new Lean check.

2026-11-12 07:00 UTC: python3 scripts/check_blueprint.py passed (2 units). latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex passed, 649 pages. No overfull boxes or undefined references; pre-existing amsmath foreign-command warning only. Rendered and visually inspected pages 465–466, 548–553, 603–604, 647–648 at /private/tmp/ym-qa650/contact-0.png through contact-2.png; margins and displays good. Initial synchronization script failed before edits because system python lacks pypdf; rerun with bundled Python succeeded. No Lean build or axiom replay run.

2026-11-12 07:33 UTC: structural checker passes2 units; latexmk succeeded671 pages, no overfull/undefined warnings. Rendered and inspected664 pp548–569 and671 pp560–578 via contact sheets; no margin/clipping defects observed. Added restarted history, physical-dimension normalization, three-panel weak comparison, conditional portfolio, planted compiler algebra and cumulant bounds. Latest marked-propagation draft is unintegrated pending review. Live issue26 and PR30 rechecked07:30UTC; no change/conflict. Usage72% remaining at07:29, credits unchanged, zero resets. No Lean build or axiom replay.


2026-11-12 08:14 UTC collaborative checkpoint: latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex succeeded, 711 pages, 3,677,991 bytes. Final log has no overfull boxes, missing glyphs or undefined references. Rendered and visually inspected pages 549–555, 576–585, 629, 631, 633, 635–636 and 706–708 on five contact sheets in /private/tmp/ym-qa711; no clipping or display overflow observed at overview scale. Latest independent agent review logs copied, preserving parent finite-rank review. No fresh Lean build or axiom replay. Whole-proof closure and final editorial pass remain outstanding.

Checkpoint staging: initial git diff --cached --check found only trailing whitespace / blank EOF in five chapters (free-kernel-components, primary-calibration-producer, rg-construction, trace-medal-prices, trace-weighted-estimates). Removed whitespace only; prior review fingerprints preserved, not refreshed by author. Subsequent whitespace check passes. These edits do not change the mathematical text; review carry is requested independently.

Post-whitespace rebuild succeeded: 711 pages, 3,677,991 bytes, no overfull/undefined/missing-glyph diagnostics. PDF refreshed and its SHA-256 recorded in checkpoint-manifest.json. Source and manuscript text remain an incomplete draft.


## 2026-11-12 09:00 UTC — 734-page working checkpoint

`python3 scripts/check_blueprint.py` passed (2 units; structural only).
`latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=build manuscript/existence.tex` succeeded: 734 pages, 3,778,568 bytes. The first portfolio layout attempt failed because a split display had extra alignment tabs; replacing it by aligned still overflowed, so the final identities use gathered with one identity per line. The final log has no overfull boxes, undefined references or missing-glyph warnings.

Rendered and visually inspected 29 pages (568–574, 582–587, 599–607, 699–704, 734) at scale 1100 in five contact sheets under `/private/tmp/ym-qa734`. No clipping or overlap identified at overview scale. This samples the mixed compiler, joint reader model, healthy launch, trace scribe and portfolio changes; it is rendering QA, not proof closure. The independently checked portfolio layout carry is recorded in the reviewer log. The healthy-launch wording edit was reported harmless but the reviewer lacked the exact old baseline to certify a bytewise editorial-only diff.

No Lean build, fresh axiom replay or source changes. New original-history attachment and tree-covariance candidates are outside this build and remain under review. The 711-page committed checkpoint manifest and PDF still describe the earlier pushed snapshot until the next refresh.


## 2026-11-12 09:44 UTC — 747-page checkpoint

Actual latexmk builds succeeded at 737, 744 and 747 pages. The 744-page build
had one overfull prose line caused by an unbreakable slash-separated phrase;
wording-only reflow was independently checked. Final 747-page PDF is 3,839,085
bytes, with no overfull boxes, undefined references or missing-glyph diagnostics.
Rendered 18 pages (546–548, 586–595, 598–602) with pdftoppm at scale1300 and
visually inspected all three contact sheets under /private/tmp/ym-qa747.
No clipping, overlap or oversized displays observed at overview resolution.
This covers the original-history attachment, harvested owner-energy, corrected
body and tree covariance additions. Previous new sections were checked at734.

The structural checker passed after the body/attachment imports; the final
owner-energy metadata addition is checked again before commit. No Lean build,
fresh axiom replay or Lean edits. Mathematical reviews are bounded conditional
agent reviews; human acceptance and full dependency closure remain outstanding.
Live main compared to fa705098efc07df2e54746b22893b5d26b515988 at09:41: identical.
Issue26 was reread on resume; no overlapping new claim found.
