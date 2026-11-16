# C10: response to the source-leakage rows of the #159 audit

- Issue [#189](https://github.com/hairer/humanise-yang-mills/issues/189); audit #159 (report PR #164, `../source-leakage/`, base `97128ab`); package C10 (#51, closed); parent #26. Unit YM-000026.
- Session `ADB991-claude-20261113-76ef`, role AUTHOR of this bounded revision. Claim: https://github.com/hairer/humanise-yang-mills/issues/189#issuecomment-6860006626 (until 2026-11-14 17:00 UTC). Prepared autonomously by Claude (Anthropic) for @ADB991; not reviewed by ADB991 before submission. The account ADB991 authored no C10 chapter; it wrote the independent reviews #148, #149 and #161 of C10.
- Base: `codex/existence-monograph` at `2017d6f`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text; nothing was elaborated.
- Status: **author draft, not reviewed.** Every row below edits a sentence in or next to mathematical text, and row 120 is a J resolution, so all of them need independent review by an account other than ADB991.

## Response table

Rows are located by text; at `2017d6f` all nine sat at the audited line numbers.

| n | file (line at base) | audit class | decision | response |
| --- | --- | --- | --- | --- |
| 120 | `soft-curvature-receipts.tex` (415) | J | **J, resolved by a definition** | The sentence deferred the *definition* of the periodization sums $E_m$ and of $\widehat H(0)$ for arbitrary arrays to the source; no proof step was deferred. The text now states the convention: a countable real family is summed unconditionally if summable (equivalently absolutely summable, for real families) and is given the value $0$ otherwise. This is exactly what the source does, see "Moved content" (a). The sentence that follows ("In this section the symbol of $H$ is used only under a strip bound on $H$, where all these series converge absolutely") is unchanged. No new input. |
| 121 | `annulus-fleet-face-estimates.tex` (229) | B | B | Parenthesis "(an Orion datum in the terminology of the source)" deleted. The name was already in `part-B/correspondence.md` (row "local record, centered record": `Orion`, `Hstar`, `HouseWord`). |
| 122 | `annulus-two-wave-estimates.tex` (301) | B | B | "arise in the source through two separate applications of the finite-family construction" now reads "are thus two separate applications of the finite-volume receipts to the common family of local records". That is what the subsection "The two applications of the finite-volume receipts" just above proves (scale $T_1=|x|+\mu$ for every record, scale $T_2=|x|$ on the subfamily $\mu\le|x|$). The rest of the paragraph is unchanged. Content moved: (b). |
| 123 | `annulus-same-data-binding.tex` (282) | B | B (caveat kept in the text) | "In the source, (W) is obtained from … and (S) from …" now reads "The natural route to (W) is through … and to (S) through …"; "one converts" becomes "this requires converting". The paragraph still ends with the caveat that this conversion for coefficient pictures with fees is not stated in the text, so (W) and (S) stay explicit inputs. The statement that the source takes this route moved to (c). |
| 124 | `annulus-same-data-binding.tex` (396) | B | B | "In source terms, this is the composition of …" now reads "In summary, the proof of Proposition `prop:ex-annulus-estimate` composes the Wilson baseline $W$, the path correction $Q$, the addition $F=Q+W$ of their tickets, the finite determinant recording of Lemma `lem:ex-pole-recording`, and the uniform radial evaluation of Theorem `thm:ex-all-period-recording`." Each item is a step of the proof printed just above it. The pointer sentence "The declaration-level correspondence and the exact shared-object audit are in the companion evidence record" is deleted; content moved: (d). |
| 125 | `inherited-loop-transport.tex` (139) | ? | **B** | "With the source normalization of these amplitudes" now reads "With this normalization of the amplitudes". The normalization is defined in the preceding sentence (a coarse unit wave pulls back into fine waves of amplitudes $N_l(p)$), and the factor $L^4$ in `eq:inherited-alias` is the ratio of fine to coarse site counts derived in the next paragraph. So the text is self-contained and the word "source" only named the convention. Content moved: (e). |
| 126 | `inherited-loop-transport.tex` (300) | B | B | "In the source the hypotheses of this proposition are stated for the standing data of the one-step construction" now reads "In the one-step construction the hypotheses of this proposition are part of the standing data of the step". "One-step construction" is the manuscript's own term (same chapter, l.167, Section `subsec:path-stationary-chart`). The list of four unused data is unchanged. |
| 127 | `inherited-loop-transport.tex` (312) | B | B (caveat moved) | "The proposition is therefore stated here under weaker hypotheses than in the source. Its proof uses only the hypotheses listed in it." now reads "The proposition does not assume them, and so applies to the standing data of the step whether or not these further data are present." The comparison with the formal statement moved to (f). |
| 128 | `quadratic-pole-transport.tex` (47) | B | B | "although in the source they belong to the same packaged data of the step" now reads "although a stationary step also carries both of them". The packaging moved to (g). |

## Moved content (correspondence and caveats)

(a) **Row 120.** `YM.Bloch.Row.acts` (`Lean/YM/CellFourier/Circulant.lean` l.33–34) defines the entry of the periodized matrix at $(i,j)$ as `∑' x, if j.1 = i.1 + wrap n x then R i.2 j.2 x else 0`, and `YM.Laurent.read` (`Lean/YM/Laurent/Eval.lean` l.123) defines the symbol as `∑' i, mode p i • f i`. Both are Mathlib `tsum`s, which return the unconditional sum of a summable family and `0` otherwise. For real families, and for complex families of real numbers, summability is equivalent to absolute summability. `YM.Precision.Floor` (`Lean/YM/PREC/Stacks.lean` l.61–68) takes these values for arbitrary beds (`starts : M.metric.read 0 = 1`; the other clauses use `acts`). Not done: the `tsum` definition in the pinned Mathlib was not opened (Mathlib sources are unreachable from this sandbox); the description is the standard Mathlib definition.

(b) **Row 122.** The source obtains both radial bounds from one finite family of local records (`Orion`) through two separate applications of its finite-family receipt construction: frame estimate on all centred records, shell estimate after restriction to $\mu\le|x|$, with the same response coefficient and common constants. The part-B correspondence rows for (AT1)–(AT10) and `prop:ex-annulus-estimate` (`HorizCalc` and the declarations listed there) are unchanged.

(c) **Row 123.** In the source, (W) is obtained from the exact Wilson coefficient pictures (`prop:ex-wilson-stream`) and (S) from the Wilson-subtracted pictures (`prop:ex-greyson`; source `greyson`, `S/Shape/Scaled.lean` l.363, see `part-A/correspondence.md`), through the conversion of exactly recorded Taylor coefficient pictures into responses with fees. That conversion remains unstated in the manuscript; inputs (W) and (S) remain open as recorded in `part-B/ledger.md`. Unchanged.

(d) **Row 124.** The proof of `prop:ex-annulus-estimate` corresponds to the source composition `HorizCalc` (Wilson baseline, path correction, ticket addition, finite determinant recording, uniform radial evaluation). The declaration-level correspondence and the shared-object audit are the part-B correspondence row `thm:ex-all-period-recording`, `prop:ex-annulus-estimate` and the same-data rows of `part-B/findings.md`.

(e) **Row 125.** The amplitude normalization of $N_l(p)$ is the one used by the source alias machinery (`carry_plan`, `carryRow`, `HessianMatch.lean`). The part-B correspondence row "alias formula, nonprincipal aliases" records this match as **partial** (statements read). Unchanged.

(f) **Row 127 (caveat).** `prop:inherited-loop-picture` is stated under weaker hypotheses than its Lean counterpart: the Lean lemma takes the packaged step data (`PostCard`, `TicketPost`, `Scud`; `part-B/correspondence.md` row "packaged data …"), whose fields include the Hessian gap (`health`), the response data and their two recording conditions (`tilts`, `meets`), the identification of the response map with the one built from $W_i$ (`spun`) and the vanishing of its frame component (`bare`). The English proof uses none of them (C10 revision 3, response to #149 R2, `revision-3.md`). This was printed in the manuscript; it now lives here. A reviewer should confirm that the manuscript statement with the weaker hypotheses is still what its consumers need. They apply it to the full step data, so a weaker hypothesis only helps.

(g) **Row 128.** In the source, the stationary branch and its Hessian gap are fields of the packaged step data `YM.Stationary.Scud` (`Lean/YM/Next/STATIONARY/Level/Transition.lean` l.26–37: `critical i : Critical (F i) p R (z i)` and `wind i : PriceGap (F i) p R η`), which also carries the bed, floor, sworn, attachment and path-bound data used in the standing data of `quadratic-pole-transport.tex` (`hill1`, `hill2`, `attached`, `funded`). The packaged data consumed by the pole-transport lemma are listed in the `part-B/correspondence.md` row "packaged data …" (`PostCard`, `TicketPost`, `Scud`). The pole-transport argument does not use `critical` or `wind`.

## Content hashes (SHA-256)

| Chapter | Base `2017d6f` | After this revision |
| --- | --- | --- |
| `soft-curvature-receipts.tex` | `ff7c8854eb698c02100ddc0691820f667b3b2ab4bba627de9ba0a8e9f2c8c010` | `1d8dc5a6bdd46d2cc6acf316369d9b6770944c4517729b4e0d76148c1ee0844f` |
| `annulus-fleet-face-estimates.tex` | `f821aa29c5e403247af1b23802ebc166950beded77dfef8e2061f2f650b9985a` | `29118c5c4a746526322e1eb7adcc57d20f2e72e8b40e8ffc85b319bff97a9dd8` |
| `annulus-two-wave-estimates.tex` | `1d7c80972d3ac8d5d967b046a0c0e9f74e89e5d13ce82f6e2dabeefbbe0e6ea0` | `d1a9e3f89fce23e4b846a3bdb6fd40f1cad2b9df4fa547315814770ab338bd88` |
| `annulus-same-data-binding.tex` | `7e3a0f5fe739ade9222cd2e4b57d3f6845d80621dbf7b53af225010833be764c` | `9c8b3a4c355a6e5184458f5bd3e050c0e8660b88b57ceb92dc5222bfe3307bed` |
| `inherited-loop-transport.tex` | `75659dff65785cd0a8b131222cc622249665286cb87a39f5c761c144356e0dab` | `7a7cbcf53598cbcde34dc93398150522c4fd3d667b1bb7ab5337d45ea08eb510` |
| `quadratic-pole-transport.tex` | `3508978162486562429f61bb999af7d61328a757e3abbedd46783afa5d363a0a` | `ec55ceb781656da206209781b5a4106ec39b624eec39b3d353d5f83055895cd0` |

No statement, estimate, constant or hypothesis changed. No label was added, removed or renamed. No new named input; the C10 ledgers are unchanged. The review fingerprints of these six chapters are stale: renewed independent review of the changed hunks is needed, by an account other than ADB991.

## Checks actually run

- `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/`: exit 0, 978 pages; `grep -c "undefined\|multiply defined"` on the log: 0.
- Changed pages rendered at 80 dpi and inspected: 465 (row 120), 525–526 (rows 123, 124), 540 (rows 126–128). Pages 505 (row 121), 516 (row 122) and 537 (row 125) were located by `pdftotext` only, not viewed as images.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean.
- Not run: any Lean elaboration (Mathlib sources are blocked here); the Lean definitions cited above were read as text.

## Noticed, outside the rows of #189

The audit's patterns miss Lean names printed without "source", a dot or `\texttt` (its README says so). One in a C10 chapter: `annulus-same-data-binding.tex` l.267–268 ("in the form consumed by the one-step construction of Section …, where it is denoted HorizCalc$(G,\sigma,\epsilon,C,Z,\tau,A)$"). It is left unchanged here (not in this issue's rows); a later vocabulary pass should pick it up.
