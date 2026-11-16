# Independent review of PR #373: pairwise root-test receipt (G3) (#372)

- **Session:** `stalex444-claude-373rev-20261114`
- **Contributor:** stalex444, assisted by Claude (Fable 5.2 and Opus 5.5). stalex444 did not author #373 or the files it reviews.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/372#issuecomment-6876684722>
- **Reviewed:** `subsec:trace-rounded-receipt` in `manuscript/existence/trace-rounded-receipt.tex` (`lem:trace-receipt-width`, `lem:trace-receipt-cost`, `prop:trace-rounded-receipt`, the paragraphs "Supply of the level budget" and "Status"), the #373 change to `trace-rounded-comparison.tex` (Status paragraph and `\input`), and the author record `results/C15/author/hairer-claude-372-20261114/README.md`, at `codex/existence-monograph` `0f00ae72` (#373, commit `83eecbca`, merged at `a8c24495`; the reviewed files are byte-identical at `a8c24495` and `0f00ae72`).
- **Source pin:** `3456e5e`. The 24 Lean files hashed in hashes.json match `Lean/SOURCES.sha256` and the release checkout at that commit. The author record's correspondence was read textually (its l.18: "no Lean elaborated"). This review elaborated the statements of the paired declarations with Lean 4.32.0 against the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, the checksum in `source/build.md` l.37), and Lean's kernel checked the review's own probe theorems as they were elaborated. The release's proofs were loaded from compiled files and not re-checked by an independent kernel checker; nothing was built from source, and Mathlib was not rebuilt (see [lean-correspondence.md](lean-correspondence.md)).

Human acceptance is unset. This report is not an approval and changes no unit status or review fingerprint.

## Outcome

- **Mathematics: changes requested** ([mathematics.md](mathematics.md)). No false statement was found. Both lemmas are correct, and the first assertion of `prop:trace-rounded-receipt` is correct under (A) and (B), once the depths are identified as in M2. The "Moreover" assertion is true, but its proof as written rests on a property that the cited gallery section does not state (M1). The note proves its bounds at the chart's own root depth w, while (G3) and its consumer use the depth w_i of (G4), and the note never identifies the two (M2). M1 and M2 are required. M3 and M4 concern the completeness of the Status and supply paragraphs and are recommended; M5–M9 are minor.
- **Lean correspondence: no required change** ([lean-correspondence.md](lean-correspondence.md)). No mismatch that breaks a step of the note was found. The note is stronger in form than the source in three places: (B) is chart-uniform where `lava_vSky` is eventual along a panel sequence (L1), and both lemmas give explicit thresholds where the source is eventual (L8, L9). The two explicit lemma forms were proved in the reviewer's probe over the release definitions. Granting the late-point property of M1, the note's argument would also go through with a per-curve form of (B) whose threshold may depend on the selected level curve; as stated, with K(i,(i+1)^{-1}) fixed in advance, the proposition uses the chart-uniform form, and so does the threshold repair of M1. L1 is recommended; L12 is a suggestion tied to M4; L15 concerns the author record only.

The verdicts are conditional on (A) and (B), which the note assumes and this review does not establish.

## Findings

Labels: Required / Should / Minor. Identifiers: M = mathematics, L = Lean correspondence, C = checked and correct, N = not checked. Line numbers are those of `trace-rounded-receipt.tex` at `0f00ae72` unless another file is named.

- **M1 (Required; defect in a proof step).** The proof of the "Moreover" assertion (l.153–165) asks the reader to recall from `sec:ex-lattice-firesky-gallery` that every other requirement of the selection holds at all sufficiently late points of the level curve. The gallery does not state this; its selection lemma (gallery l.82–85) bounds the level only by i ≥ d (in the gallery's notation, i is the level). The assertion is nonetheless provable from stated facts; a repair is given in mathematics.md. Affects the "Moreover" assertion and the Status sentence at l.194–195, not the first assertion.
- **M2 (Required; interface mismatch).** The bounds are proved at the root depth w (l.31–33, l.60); (G3) is stated at the depth w_i of (G4) (parent l.70–74, l.95–98), and the consumer uses both at the same w_i (parent l.233–241). The note does not set w_i := w. The note calls w "its root depth" (l.32) and the parent says "The root depth" (l.233), so the intended identification is clear, but the manuscript defines a chart's root depth only by the note's gloss at l.32–33, which does not tie it to (G4), and (G4) introduces w_i existentially. A one-sentence repair is suggested.
- **M3 (Should).** The open-input list (l.202–214) omits (A), although the Status itself discloses that the gallery does not display it (l.196–199).
- **M4 (Should).** The step from T_n ≤ I_k to the bound (l.177–179) omits its premise P_R(X) − 4D log g/q ≤ T_n and the clock conditions under which `sec:rank-root-normalization` proves it.
- **M5–M9 (Minor).** The allarity route assumes more than the step purchases named (M5); "arity cap" names d+2 here and l = d in the gallery (M6); "beyond which" must be inclusive, and the hypothesis is at one index while (G3) is for every i (M7); q is used for ρ_m(x) and for the cell count (M8); n has three meanings along the `\input` chain (M9, optional).
- **L1 (Should).** (B) as stated is stronger than its source `lava_vSky` (quantifier order). As stated, with its threshold fixed in advance, the proposition uses the chart-uniform form; granting the late-point property of M1, its late-point argument would also go through per curve. The uniform form via a diagonal argument was not checked (N14).
- **L12 (suggestion; see M4).** The arithmetic of the supply paragraph matches `couponSky` step for step; `couponSky` takes more hypotheses than the open list names.
- **L15 (Minor; author record).** The μ_k ≥ 1 filter in `open_readSky` is unused (confirmed three ways at the elaborated level).
- **C1–C11.** Both lemmas, K(d,ε), the first assertion under (A) and (B) (subject to M2), the Φ identities, the supply arithmetic and the absence of circularity were checked and are correct (mathematics.md). C12 is an optional observation, not a defect.

## Not established

This review does not establish (A) or (B), the clock conditions of M4 for the funded witnesses, the bodies of the (B) chain in the source (`earningsSky`, `y_readySky`, `tenderlySky`), that `(invoiceSky …).part s` is the note's Φ_s, the chart-uniform form of (B), or that the extracted compiled files and the dependency `.olean` files used for elaboration are byte-for-byte those of the published archive (N10). The manuscript was not built. The full list is N1–N20, N22 and N23 in mathematics.md and lean-correspondence.md.

## Records

Neither `trace-rounded-receipt.tex` nor `trace-rounded-comparison.tex` is in the `manuscript` list of YM-000026, so the unit fingerprint does not cover this note; the per-file SHA-256 values in [hashes.json](hashes.json) are the operative fingerprint of this review. The parent's file hash changed with #373, so the target hash recorded for it by the review of #356 no longer describes the current file. Validation is recorded in [validation.md](validation.md); the probe outputs and check scripts cited are in [evidence/](evidence/).
