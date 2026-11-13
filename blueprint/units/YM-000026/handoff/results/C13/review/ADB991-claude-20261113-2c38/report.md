# Renewed check of PR #310: review #213 M1 (component family F/K vs aggregated slots of Q)

- Unit: YM-000026 (existence monograph), C13. Changed passages: the interface paragraph after `eq:planted-holes` and the regrouping sentence of the final paragraph in `manuscript/existence/allarity-planted-compiler.tex`; the statement and proof of `prop:corrected-forced-output` in `manuscript/existence/actual-corrected-body-compiler.tex`; the author note `results/C13/author/hairer-claude-20261113-c13m1-213/README.md`.
- Role: mathematical validity and textual Lean correspondence (both), restricted to the M1 delta.
- Human reviewer: none yet. This report was prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991. ADB991 has not read it. Under `docs/proof-standard.md`, a human reviewer must take responsibility before acceptance.
- Agent assistance: Claude Code, session `ADB991-claude-20261113-2c38` (single agent, no subagents).
- Independence: ADB991 did not author PR #310, review #213, review #233, `allarity-planted-compiler.tex` or `actual-corrected-body-compiler.tex`. ADB991's only C13 authorship is `allarity-marked-propagation.tex` (PR #255), which this delta does not touch.
- Reviewed content: PR #310 head `73115b496d3d39c79c67c9e00d65969d0564f376`, merged into `codex/existence-monograph` as `36a84131f93540baf83ab7253c71f2fb5a761b3f`. The two chapters have the same blobs at both commits. The SHA-256 hashes are in `hashes.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (imported `Lean/` tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`).
- Review task: https://github.com/hairer/humanise-yang-mills/issues/54 (claim https://github.com/hairer/humanise-yang-mills/issues/54#issuecomment-6866686279).
- Outcome: **M1 of #213 is resolved; no required change.** Minor note N1 and optional note O1 follow. Both are wording only.

## What M1 required

Review #213 (`results/C13/review/mgubi-astra-c13-completion-review-20261113/mathematics.md`, M1) asked for three things:

- (a) name the unaggregated unmarked corrected forced-component family `F` as the domain of the embedding;
- (b) require its attached family `K` to have the same addresswise sums as `Q`, and reserve "forced activities of `Q`" for the aggregated slots;
- (c) make the promise of `prop:corrected-forced-output` refer to this precise interface.

## Mathematics

1. **(a) is done.** The interface (lines 235–244 of `allarity-planted-compiler.tex` at `36a8413`) defines `F` as "the unaggregated family of unmarked forced components, before any summation over addresses". It requires that `F` embed with identical values, supports and inventories, and that it exhaust the zero-marker forced components. The literal interface no longer asks an aggregated slot to be a member of the component list. The two-component diagnostic of #213 (values `u`, `v` at one address, single slot `u+v`) is now stated in the text.
2. **(b) is done.** `K` is defined as `F` with the same hole and boundary correction factors attached. The requirement reads: at each full support and flag inventory, the sum of the members of `K` equals the archived activity of `Q`. "Forced activities of `Q`" is reserved for these aggregated slots.
3. **(c) is done.** The proposition (lines 416–426 of `actual-corrected-body-compiler.tex`) now promises two things:
   - for every finite marker family, the proof's unaggregated `F` satisfies the embedding and exhaustion requirements;
   - its attached `K` has the addresswise sums of the constructed `Q`.

   The proof already proved exactly this, and I re-checked it:
   - Defining `k_{X,I}` as the sum of the `K_j` at `(X,I)`, storing it in one slot and zero-padding the other slots makes `Q`'s archived activity at `(X,I)` equal to `k_{X,I}`.
   - The marker-family embedding is a bijection on zero-marker components, and it commutes with both attachment steps. So the attached zero-marker family is `K` reindexed, and summing at each address gives the identity.

   The added closing sentence of that paragraph correctly separates the components from the slots `k_{X,I}`. Nothing in the construction, estimates or normalization changed, and none of them depends on the wording.
4. **Downstream use is consistent.**
   - **Exclusion regrouping.** The revised sentence (lines 283–285) obtains the actual coarse archived background "by the transported embedding of `F` and the addresswise identity for `K`". This is the correct pair. The exclusion bijection regroups components, and the embedding of `F` identifies the zero-marker components with `F`. Summing their attached values at an address then gives `Q`'s slot.
   - **Restarted rank history.** The consumer in `restarted-rank-history.tex` (lines 107–111) says to attach hole and boundary factors to the unmarked forced components, sum at each address, and store the sums as archived activities. It agrees with the new interface without change.
   - **No other uses.** I searched `manuscript/existence/` for "forced activit", "addresswise" and "forced-family embedding". I found no other use that treats a slot of `Q` as a component.
5. **Hypotheses.** The new text adds no hypothesis and drops none. In the interface, the domain of the embedding moves from "the unmarked coarse forced family" to `F`, and the identity with `Q` moves to the sums of `K`. This weakens the literal requirement to what the proof supplies, which is what #213 asked for. The marked-alphabet transport paragraph (lines 257–272) and the final regrouping then use only these weaker statements.

### Minor

- **N1 (two identities share the name "addresswise background identity").** Lines 258–261 say: "First coalesce background packets with the same address and marker mode. Their zero-marker values are exactly the archived activities at that address, by the addresswise background identity."
  - The packets coalesced there are the lifted *fine* background packets. Their zero-marker values reproduce the archived activities of `P` (equivalently of `P^0 = white(P)`, whose forced activities are unchanged, line 166). That is the fine identity stated after the definition of `\mathcal K` (lines 104–107) and in `actual-mixed-marked-compiler.tex` (lines 46–48).
  - After #310, the nearest "addresswise identity" in the text is the coarse one, "the sum of the members of `K` … equals the archived activity of `Q`". The proposition's proof also calls that coarse identity the "background identity with `Q`".
  - A reader can therefore attach the wrong identity to line 260.
  - Suggested wording: "by the addresswise identity of the lifted background packets after \eqref{eq:planted-density}". Similarly, lines 249–250 ("These are the all-deleted-support identity and the forced-family embedding …") now summarize three requirements under two names, and could say "… the forced-family embedding of `F` and the addresswise identity for `K`".
  - This sentence lies just outside the hunk #310 changed. It is not part of M1 as #213 stated it.

### Optional

- **O1.** "We reserve *forced activities of `Q`* for these aggregated slots" is exact for the constructed output, which has one nonzero slot per address. For a general coarse `Q`, the interface's right-hand side is the archived activity, i.e. the sum of all of `Q`'s slots carrying that address (`YM.Next.Rank.Value.Archive` is that sum). The text already says "the archived activity of `Q`", so the requirement itself is right. Only the gloss "slot" assumes one slot per address. A half-sentence would make this explicit.

**Literature.** Not applicable. The change is an interface clarification with no external result. No literature claim is introduced.

## Lean correspondence (textual; nothing elaborated)

I read the following at the pinned revision.

- **`YM.Next.Rank.Flux.Vac`** (`Lean/YM/Next/RANK/Flux/Chronicle.lean`, lines 24–37):
  - `f : D → Lifted G ζ Q.p.threshold` is a finite, unaggregated family, and `debt i : (f i).fires = quiet V` makes every member zero-marker. This is the manuscript's `F`.
  - `coat : Background Q (toRain (toRain f (holes …)) (witness pay))` is the identity for the family with the hole and boundary (`pay`) factors attached. This is `K` and its addresswise identity with `Q`.
- **`YM.Next.Rank.Flux.Matric.emboss : Nonempty (Embedded T.f F)`** (same file, lines 43–45). The embedding is of the unaggregated `T.f` into the alphabet's plug family `F`, not of the slots of `Q`.
- **`YM.Next.Rank.Flux.Embedded`** (`Flux/Wraith.lean`, lines 21–24):
  - `wire` is an injection;
  - `found i : F (wire i) = .raid (S i)` gives identical letters, hence identical values, supports and inventories;
  - `film` says every quiet (zero-marker) letter lies in the range, which is the exhaustion.
- **`YM.Next.Rank.Value.column`, `Archive`, `Background`** (`Lean/YM/Next/RANK/Value.lean`, lines 69–80):
  - `column K i U` sums the zero-marker members of `K` whose `(extent, inventory)` is the address `i`;
  - `Archive A i U` sums all of `A`'s forced slots with address `i` (relevant to O1);
  - `Background P K` is `∀ i U, column K i U = Archive P.activities i U`.

  This is exactly the revised manuscript requirement. It is not an embedding of the slots into the component list.
- **`YM.Next.Rank.Flux.sunny_pass`** (`Chronicle.lean`, lines 57–72). Its second conjunct is obtained as `rainy` (transport of `Embedded T.f F` through the attachments, `Flux/Rain.lean`), then `emb_bg` (`Flux/Conform.lean`, line 89: an embedding gives equal zero-marker columns), then `B.coat`. This is the chain "transported embedding of `F` and the addresswise identity for `K`" in the revised regrouping sentence.

The author note's source claim (`Flux.Vac.f`, `Flux.Embedded`, `Value.Background`) is accurate. It agrees with the source-correspondence part of #213.

## Checks actually run

All checks were run on 2026-11-13 in a fresh clone of `hairer/humanise-yang-mills`.

- `git diff 73115b49~1 73115b49`: the delta is three files, as described in the PR.
- `git rev-parse` of both chapters at `73115b4` and `36a8413`: identical blobs (`b23bbf5d…`, `5892677a…`).
- `python3 scripts/check_blueprint.py` at `36a8413`: `Blueprint structure OK: 4 units.`
- `python3 -m unittest discover -s tests` at `36a8413`: 22 tests, OK.
- Full monograph build of `manuscript/existence.tex` from a `git archive` export of `36a8413` with `latexmk -pdf` (out of tree): exit 0, 1011 pages, no undefined references; pp. 706 and 715 inspected (see `build.md`).
- Lean: read only (`Chronicle.lean`, `Wraith.lean`, `Value.lean`, `Conform.lean` at line 89, `Rain.lean` at line 24). No Lean elaboration, `lake build` or axiom replay was run.

Not checked: C13 beyond this delta. The open joins recorded in #213 and #233 (order-zero Station renewal versus derivative comparison; analytic suppliers in the C13 ledger) are unaffected by this delta and remain open. This review does not renew any other #213 finding or accept C13.
