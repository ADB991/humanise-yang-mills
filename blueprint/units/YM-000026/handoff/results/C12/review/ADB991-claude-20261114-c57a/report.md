# Review of PR #350: reserved slots on every selected entry (C12, refs #317)

- Reviewer session: `ADB991-claude-20261114-c57a` (ADB991, assisted by Claude, Anthropic; prepared autonomously, not reviewed by ADB991 before submission).
- Roles: mathematics and textual Lean correspondence. Report only; no manuscript, author-record or `Lean/` edit.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6869401692
- Reviewed: PR #350 head `a995f3fd65be4fd63a74caf0da7e6b05cba42fc1` (base `codex/existence-monograph` @ `310a5b55`). Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. SHA-256 of every inspected file at the reviewed head: `hashes.json`.
- Scope: `lem:selected-reserved-slots` (`selected-centered-service.tex` l.236-303) and the amended sentence after `prop:selected-centered-retention` (l.236-241).
- Independence: ADB991 did not author #350, this lemma or `prop:selected-centered-retention`. ADB991 authored other, disjoint hunks of the same file: `prop:selected-zero-coordinate-coupon` (#319, PRs #340 and #351). Its input (K) is one consumer of the Keeper discussed in S1 below.

## Verdict

The lemma is true and its proof is essentially right. Both cases trace to the source:
- top entry: `Graces.Nest.born` through `Graces.hops`;
- lower entries: `Graces.Nest.samples` → `Mallow.Spring.owns` → `Ingredients.spare_room` → `DirectedRecipe.never_spent`.

One required correction (M1): the statement places every entry in the level-N terminal dictionary, which is wrong for m < N. One should-fix (S1): the Keeper is stated in a weaker form than its consumers and the source use. The rest are minor.

## What was checked

1. **Top case, m = N.** The stored top entry is a member F_β of the startup family. `prop:wilson-startup-family` (wilson-startup-construction.tex l.343-400) gives zero coefficients on all reserved regular and forced labels.
   - Source: `Graces.Nest.born` gives `HasSlots` for `history N p N`. `Graces.winnow` puts `HasSlots` into the `first` predicate of the recipe it races. `Graces.hops` gets it from `(hX.law β hp).ingredients.spare_room`, the same `finish` used by every return. Correct.
2. **Lower entries, m < N.** Three steps, all as the proof says.
   - `Nest.held` gives `Protected R N m p (history m) (history (m+1))`: a `Spring` H, a point x of its interval, `history (m+1) = Q x` and `history m = H.result x`.
   - `Mallow.Spring.owns` (Pediment.lean l.60-62) identifies `H.result x` with `DirectedRecipe.finish W c p (shelves …) (branch …) β v`, with `p = A.B.a.budget m`.
   - `finish` is the startup's operation ("Same operation at every scale, both in startup and in return", Batch.lean l.40): `fused (folio G n) P (widen X d)`.
   - The manuscript counterpart of `owns` is coupling-reset-selection.tex l.193-195: "The represented output is then obtained from this batch by the fixed packing and absorption". See N1.
3. **Why the reserved coefficients vanish.** I checked this against `lift_fused` and `never_spent` (Pellets.lean l.119-218).
   - Regular: entries off the image of `upE` are blank (`Readdress` field `blank`), and `distinct` shows `blankRow` is off that image.
   - Forced: an index off `range (nameUp F)` is zero because some atom of its pellet lies off the image of `up X` (`outside`, `zero_atom`). `sleeping_out` shows that `sleepK (x,j)` is such an index; its pellet is the singleton `{inl (spare hardKeys (x,j))}`.
   - This is exactly the manuscript argument: the packing injection lands in unreserved labels, and a reserved forced label is the group of one reserved hard label.
   - The return groups regular, hard **and logarithmic** labels (soft-log-fusion.tex l.37-48), while the startup has all logarithms zero. This does not affect the argument: the singleton label's activity is a product whose only factor is the zero packed hard coefficient. See N2.
4. **Predicate.** `tile_test` (Pellets.lean l.205-209): the extra test of `addr (folio G n) P (sleepK (x,j))` holds iff `x.support ∩ flags P.threshold U = x.inventory`. This matches item (2) of the lemma, with `flags` at the entry's own budget point (see M1).
5. **Preservation property and Keeper.** The source Keeper is `Planned.ATOM_GUARDED_LAYOUT.Keeper.sufficient` (Guards.lean l.63-87). It is built from `HasSlots` by `sleepK`, on `Dummy n`, which is pairs ∅≠I⊆X **times ℕ**. The lemma's Keeper uses serial number 0 only (S1).
6. **Rendering.** Lemma 165.2 and the amended paragraph on pp. 696-697 render cleanly.

## Findings

### M1 (required): the dictionary of a lower entry is not the level-N terminal dictionary

l.244-246: "the stored representation R_{N,p,m} is written in the fixed terminal dictionary of Proposition [wilson-startup-family]". Also l.274-275 ("in the same fixed terminal dictionary as the startup") and l.291-292 ("They are therefore the same as for the startup family").

- `prop:wilson-startup-family` concerns representations at level N, in one dictionary fixed at that level.
- For m < N the entry R_{N,p,m} lives on the level-m torus: `Protected` types it as `Rep G (A.B.a.S.side m n)`. Its forced address list is `addr (folio G n) P` with `P = A.B.a.budget m` (`HasSlots.forced`, via `Spring.owns`).
- `drawer G n` is "chosen even on all small tori. Never depends on the parameter, level, history or any estimate" (Shelves.lean l.129-130). It does depend on the torus side n, though. The additional predicate of a reserved forced label also depends on the budget point, through `flags P.threshold` (`tile_test`).
- So the lower entry's reserved labels, and their predicates, are those of the **same construction applied on the level-m torus at the level-m threshold**. They are not literally the labels of the startup family. The conclusions (1)-(2) stay true under that reading, and the proof's mechanism is unchanged.

Suggested fix: replace "the fixed terminal dictionary of Proposition …" by "the dictionary given by the fixed construction of Proposition … on the level-m torus, at the level-m budget point". In (2), say that flags(U) are taken at the threshold of level m. In the proof, l.290-292, replace "the same as for the startup family" by "given by the same construction".

### S1 (should): state the Keeper for triples (X, I, n)

The lemma's Keeper is "an injective eligible assignment of a reserved forced address to every pair ∅≠I⊆X", with serial number zero (l.259-262, l.300-302). Two consumers need more:
- marked-field-local-estimates.tex l.131-136 defines the terminal Keeper on **triples** (X, I, n), n ∈ ℕ;
- the source `Keeper` is indexed by `Dummy n = {(X,I) : I ≠ ∅, I ⊆ X} × ℕ`, and `Keeper.sufficient` builds it from `HasSlots` with all serial numbers.

Item (2) of the lemma already gives zero coefficients and the flag predicate for **every** serial number, and (X, I, n) ↦ reserved label is injective. So the triple form costs one sentence. It would discharge the reserved-address part of marked-field-local-estimates hypothesis (2) at every entry, and it implies the pair form used by #319's input (K).

As written, "Every stored representation, terminal or not, has a Keeper" uses a weaker Keeper than the one the terminal consumers name.

### N1 (minor): manuscript locator for the m < N identification

The proof cites the first subsection of `sec:terminal-marked-construction` (l.23-31 there). That subsection is a remark, not the return's construction. The author asked for this check, and it holds. The direct manuscript statement is coupling-reset-selection.tex l.193-195: the return's output is obtained from its batch by the fixed packing and absorption. Citing it, and `sec:physical-reset-reorganization` for the batch, would make the m < N step checkable without the remark.

### N2 (minor): logarithmic labels in the return

The proof copies the startup sentence "Every grouped label of the packed family consists of packed labels". In the return, grouped labels also contain logarithmic labels (soft-log-fusion.tex l.37-48), which the startup does not have. The conclusion is unaffected; see check 3. One clause would close this for the reader: the reserved forced label is the singleton of a reserved hard label, so its activity is that hard coefficient (times indicators), which is zero.

### N3 (minor): wording of the preservation step

l.295-296: "take any nonempty support. Its reserved regular label is a regular address". A regular address is a site together with a support containing it (`RegularAddress`: `site`, `support`, `anchor`). Say "for every regular address (site in a nonempty support), its reserved regular label …".

### O1 (optional): source route of the vanishing

In the source, `HasSlots` for a lower entry is obtained through `Local.renew` and `Ingredients.spare_room` (Eagles.lean l.58-60). That route uses the return's certificate inputs (`Return.enough_room`, `fees`, `R.machine.passes`). `never_spent` takes a `Digests` hypothesis, but only its eligibility branch uses it. The `blank`/`outside`/`zero_atom` vanishing does not. So the manuscript's "holds for every dictionary and every coefficient family" is a correct, slightly stronger reading of the source. It belongs in the correspondence record rather than the manuscript.

## Checks run

- `pdflatex` via `latexmk -pdf` of `manuscript/existence.tex`, from a `git archive` export of `a995f3fd`: exit 0, 1019 pages, no undefined references. Pages 696-697 inspected as images.
- `python3 scripts/check_blueprint.py` and `python3 -m unittest discover -s tests` on this report branch: see the PR body.
- Lean: textual inspection only, at the pin (files and hashes in `hashes.json`). No elaboration: Mathlib sources are blocked in this environment.
- Not checked: the internals of `Local.renew`, `Return.enough_room` and `Ingredients.pays` beyond their use above. Nothing about the arrival and raised-response receipts, which remain open in #317.
