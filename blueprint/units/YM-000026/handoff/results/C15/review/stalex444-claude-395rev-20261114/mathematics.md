# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of PR #395 for #394.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): three independent reads of the change (a step-by-step re-derivation of the proof, a clause-by-clause comparison of the statement with (G4), and a read of the diff, its cross-references and the author record), a Lean read reported in lean-correspondence.md, and, for each finding these reads raised, one independent re-derivation and one author's-advocate refutation, consolidated against the source lines. Where the two checks of a finding disagreed, the point was settled at the source lines, and the item says how. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (`trace-firesky-gallery.tex` `761f3638…`, author record `e3449f83…`). `trace-firesky-gallery.tex` is in the `manuscript` list of YM-000026 (at `29f27cdb` and at `e91c0502`); the unit fingerprint at `29f27cdb` was not computed (validation.md, Not run).
- Manuscript files and labels: `manuscript/existence/trace-firesky-gallery.tex` (`lem:ex-lattice-firesky-chamber`, `eq:ex-lattice-firesky-chamber-mesh`, and the proof, l.188–234); the author record `results/C15/author/hairer-claude-394-20261114/README.md`. Interface passages read: the #393 paragraphs of `subsec:ex-lattice-firesky-witness` (gallery l.91–138), `trace-rounded-comparison.tex`, `trace-rounded-receipt.tex`, `centered-construction.tex`, `centered-estimates.tex`, `common-scale-selection.tex`, at the cited lines; `centered-geometry-producer.tex` is hashed as interface, and no line of it is cited.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at commit `29f27cdb` (#395), parent `63820370` (#393).
- Review task and PR: #394; reviewed PR #395 (commit `29f27cdb`); this report is added by its own pull request.
- Outcome: changes requested. M1 (Required): the lemma is stated for every N satisfying the mesh condition, but its proof needs N ≥ k, which that condition does not imply; adding N ≥ k (or N > k) closes it. Every other step of the proof is correct, and the statement with N ≥ k delivers (G4) with w_i = w, given the #393 interface. M2 and M3 are minor.

The reviewed files are those of commit `29f27cdb`; they entered the base branch unchanged with the merge `394f7ea4`, after this review's claim. Line numbers are those of `trace-firesky-gallery.tex` ("gallery") at `29f27cdb` unless another file is named; other manuscript files are cited at the same commit. The lemma is stated at l.188–207 and proved at l.208–234. The definitions of the middle level ℓ, the root depth w and the witness fields (gallery l.91–138) come from #393; they are read as the lemma's interface and are not reviewed. "Comparison" is `trace-rounded-comparison.tex`, "receipt" is `trace-rounded-receipt.tex`, "record" is the author record. The arithmetic check is `evidence/chamber_check.py` with its output.

## What the lemma states and what it is for

For a chart at level k with base arc b, middle level ℓ and root depth w, and a configuration x that is fit for the chart, the lemma asserts that every stencil link of a grade-d insertion at either grid site z_c = a_k⌈mx⌉_c lies strictly inside the home chamber of the depth-w centered tiling whenever a_N(Z_d+2) < 3a_w/8, for every period and every grade-d label. It is the producer of input (G4) of `subsec:trace-rounded-comparison` (comparison l.70–74) at the root depth w_i = w, the item listed as open item 3 of the receipt (receipt l.287–289).

## The #393 interface

The lemma relies on #393 at three points, none reviewed here: w ≤ ℓ ≤ k ("Thus $w\le\ell\le k$", l.98), used at l.214–215 and for the clause w_i ≤ k_i of (G4); the middle cell having spacing a_ℓ (l.98–99), which makes the lemma's fitness (l.191–193) the fitness of (G4); and the statement that the root tests and the chamber condition are taken on the centered tiling at depth w (l.99–101), on which the identification w_i = w rests. The receipt defines w by that role (receipt l.38–41) and requires the identification (receipt l.145–147). The #374 endpoint record (`results/C15/endpoints/hairer-claude-374-20261114/README.md` §2) already records that w_i = w is the source's own identification, and review #384 elaborated it (`results/C15/review/stalex444-claude-384rev-20261114/lean-correspondence.md`, L16, `probe_chamber_depth`).

## The proof, step by step

- **C1. Fitness (l.191–193).** z = a_k⌈mx⌉ coordinatewise separated with |z_{c,α}| ≤ a_ℓ/8 is the receipt's fitness for the chart (receipt l.41–44), which the receipt identifies with fitness at level i for (k,b) = (k_i,b_i) (receipt l.44–46), and is comparison l.76–79 with the middle-cell spacing a_ℓ (#393 interface). The index α = 1,…,4 against a ∈ {0,…,3} is notation. Separation is not used in the proof. Correct.
- **C2. Odd side q = a_w/a_N (l.209–211).** a_m = e^{-s_m} with e^{s_m} the integer product of the first m block lengths, which are odd and at least 3 (common-scale-selection.tex l.41, l.45, l.51–52); so for N ≥ w, q is an odd integer, as `centered-construction.tex` l.196 states. The mesh condition forces N > w: if N ≤ w then a_N ≥ a_w and a_N(Z_d+2) ≥ 2a_w > 3a_w/8. The label `ex-centered-construction` is the section at `centered-construction.tex` l.1. Correct.
- **C3. Home cell (l.211–213).** With link seams the strict chamber is 0 ≤ r_i < q in relative coordinates (the cell side, written ℓ there) (`centered-estimates.tex` l.32–35): q sites per axis, which centred on a site (q odd) are the offsets |u_α| ≤ (q−1)/2. Correct. The base of the tiling is M2.
- **Integrality (l.213–214).** "Since $a_k/a_N$ is an integer" holds only for N ≥ k (C2 with the levels k < m ≤ N). The statement does not assume N ≥ k. Defect: M1.
- **C4. Site bound (l.214–218).** For N ≥ k, |u_α| = |z_{c,α}|/a_N ≤ a_ℓ/(8a_N) by fitness, and a_ℓ ≤ a_w because w ≤ ℓ (#393 interface) and a_m decreases; so |u_α| ≤ q/8. Correct.
- **C5. Link endpoints (l.219–221).** Endpoints u+s and u+s+e with s ∈ S_d, |s_α| ≤ Z_d and e a unit vector give |coordinate| ≤ q/8 + Z_d + 1. The +1 is the one in the cited bound (`centered-construction.tex` l.194). Correct.
- **C6. The chain (l.221–227).** Dividing the mesh condition by a_N gives Z_d + 2 < 3q/8, which is equivalent to q/8 + Z_d + 1 < q/2 − 1, and q/2 − 1 < (q−1)/2. So integer endpoint coordinates are at most (q−3)/2 in absolute value: inside the strict chamber under the link-seam convention, and also under the site-seam convention 0 < r_i < q (`centered-estimates.tex` l.36), so the conclusion does not depend on the seam convention. The condition is sufficient, not sharp: for Z_d = 0 it first holds at q = 7, while the conclusion (endpoint offsets ≤ (q−1)/2, the link-seam home cell) already holds at q = 3; for Z_d = 1, at q = 9 against 5. `evidence/chamber_check.py` (exact rational arithmetic, odd q ≤ 399, Z ≤ 29) finds no case where the condition holds and the conclusion fails; it is a sanity check, the chain itself covers every q. Correct.
- **C7. Chamber-admissibility (l.227–229).** Chamber-admissible means gauge invariant, measurable, uniformly bounded, and depending only on link variables whose two endpoints lie in the chamber (`centered-estimates.tex` l.12). The first three are as in the cited argument (`centered-construction.tex` l.196); the fourth is C6. Both sites lie in the same home chamber, so the product of the two insertions used by the consumer (comparison l.236–238) stays in the domain. Correct.
- **C8. Threshold (l.202–204, l.230–233).** a_N → 0 with a_w > 0 and Z_d fixed, so the mesh condition holds for all large N, with a threshold depending only on w and d, and not on p, the label or the fit point. True of the condition; with M1 the lemma applies from the larger of k and that threshold, still uniform in p, the label and the fit point.
- **C9. The change.** `git diff 63820370 29f27cdb`: two files, insertions only (gallery +48, one hunk; record +30). Both new labels are unique at `29f27cdb`; the three `\eqref` uses (l.203, l.222, l.231) and the two `\ref`s (l.205, `subsec:trace-rounded-comparison` at comparison l.4–5; l.211) resolve. The record's statements of the output and of the two bounds (record l.11–15) match l.195–206 and l.214–225. Correct. The record's base line: M3; its build claims: N4.

## The statement against (G4)

(G4) (comparison l.70–74), clause by clause:

- **A root depth w_i ≤ k_i.** w ≤ k from #393 l.98 (interface); the lemma does not prove it.
- **x fit at level i.** C1.
- **For all sufficiently large meshes N.** Delivered for N at least the larger of k and the mesh threshold; the statement's range is wider than its proof (M1). The consumer already restricts to the set "with $N>k_i$ and $N$ beyond the threshold of (G4)" (comparison l.235), so the downstream argument is unaffected.
- **Every period p.** Yes, with a threshold independent of p.
- **Every grade-d insertion at a_{k_i}⌈m_ix⌉_c.** z = a_k⌈mx⌉ with m = μ_k^b (#393 l.92) and m_i = μ_{k_i}^{b_i} (comparison (G1)); both sites c = 0, 1 and every grade-d label, uniformly in the label, which changes with (N,p) in the consumer (comparison l.231–233).
- **In the chamber-local domain of the centered tiling at depth w_i.** Both sites in the home chamber of one tiling at depth w (C6, C7), which is what the consumer's product step needs.
- **w_i = w.** The depth of that tiling is the root depth of the chart by #393 l.99–101 (interface); see the interface section.

The lemma's uniformity in the fit point is more than (G4) asks; (G4) fixes x before N. Nothing (G4) asks for is missing apart from the range of N, and the lemma assumes nothing that (G4) and the #393 interface do not grant.

## Findings

### M1. The lemma's range of N omits N ≥ k, which the proof uses (Required)

Class: statement (a missing hypothesis; the argument is correct for every N ≥ k).
Where: l.195–198 (quantifier and condition), l.202–204; proof l.213.

The statement quantifies "for every $N$ with" (l.195) the mesh condition (l.197), and nothing else. The proof's step "Since $a_k/a_N$ is an integer" (l.213) holds only for N ≥ k: a_k/a_N is the product of the block lengths of levels k+1, …, N when N ≥ k, and the reciprocal of such a product when N < k. The mesh condition does not imply N ≥ k. Block lengths are at least 3 (common-scale-selection.tex l.41), so q = a_w/a_N ≥ 3^{N−w}, and the condition holds at N = w + r as soon as 3^r > 8(Z_d+2)/3; for Z_d = 0, at N = w + 2 (q ≥ 9 and 2 < 27/8). For such N with N < k, which occurs whenever k > w + r, the grid site z_c = a_k⌈mx⌉_c is in general not a site of the level-N lattice, the integer offset u of l.214 does not exist, and no insertion is supplied there: the witness fields take "$N>k$ and $p$ are" arbitrary (l.105), a convention scoped to the field list, which the lemma's own quantifier does not carry. So the conclusion is not established for w < N < k. The Lean counterpart carries the hypothesis (`∃ hN : k≤N` in `FitSky.stencils`; lean-correspondence.md L5).

(G4) is unaffected: it asks only for "all sufficiently large meshes $N$" (comparison l.72), (G3) is stated for "all $N>k_i$" (comparison l.100), and the consumer restricts to N > k_i (comparison l.235).

Suggested repair: at l.195, "for every $N\ge k$ with" (or "$N>k$", as at l.105 and in (G3)). The sentence at l.202–204 then stays true of the condition itself, and the lemma applies from the larger of k and that threshold, still independent of p, the label and the fit point; alternatively, say there that the threshold depends on k, w and d.

Affects: the statement of the lemma only.

### M2. The base of the depth-w tiling is not named (Minor, optional)

Class: clarity (the mathematics is correct under the reading the proof uses).
Where: l.201; proof l.211–214; #393 l.99–101; (G4) at comparison l.74.

The statement says "the centered tiling at depth $w$" (l.201) without naming its base. The manuscript uses centered tilings based at a chosen site ("first chamber centered at the chosen site", `centered-estimates.tex` l.12; "based at $x$", l.15). The proof measures the offset "from the centre" as "offset $u=z_c/a_N$" (l.212–214) and bounds it by fitness, which is meaningful only if the home cell is centred at the origin of the coordinates in which fitness is stated; that is also the reading the consumer needs, with both sites in one chamber (comparison l.236–238). The two checks disagreed on whether this is implicit. Settled at the source: the base can be recovered, from the proof's l.212–214 and from #393 l.100–101 (cells indexed by the sites of the level-w torus) with "the chamber based at cell zero" (`centered-estimates.tex` l.476), but neither the lemma, (G4) nor #393 states it. The #374 endpoint record §2 already records that the source tiling is `center … 0`.

Suggested repair (optional): "the centered tiling at depth $w$ based at the origin" at l.201, or once at #393 l.100 (interface).

### M3. The record's base line is stale (Minor; author record)

Where: record l.5.

The record gives the base as "`claude/issue-392-hairer` @ `67de733`". The parent of `29f27cdb` is `63820370`, whose parent is `67de7339`. `63820370` changes only `lem:ex-lattice-firesky-solves` (+9/−9, no shift of later lines) and the #392 record, neither of which the new lemma uses, so the lemma's interface is unaffected.

Suggested repair: change the hash to `6382037`, or add a revised base line.

## Notes without severity

- **#393 interface.** The lemma's (G4) conclusion depends on the three #393 points listed above (w ≤ ℓ ≤ k, the middle-cell spacing a_ℓ, the depth of the root tests). They stand or fall with the review of #393.
- **For the final combination (#372).** At `29f27cdb` nothing in the manuscript points to `lem:ex-lattice-firesky-chamber`: (G4) (comparison l.70–74) does not cite it, and receipt open item 3 (receipt l.287–289) still lists (G4) at the root depth as open. The author's claim on #394 excluded edits to those two files, so this is not a change requested of #395. With #393 and #395 merged, item 3 can cite the lemma; closing it also rests on #393's w being the depth at which (B) is proved.

## Required changes and remaining uncertainty

Required: M1 (add N ≥ k, or N > k, to the lemma's quantifier at l.195).
Minor: M2 (optional: name the base of the tiling), M3 (author record: base hash).

Not checked:

- N1. The #393 definitions of ℓ, w and the witness fields, w ≤ ℓ ≤ k (l.98), and the statement that the root tests and the chamber condition are taken at depth w (l.99–101). Read as the lemma's interface only.
- N2. The cited interiority argument (`centered-construction.tex` l.192–196) beyond the three points the proof takes from it (the odd count of mesh steps, the +1 in the stencil bound, chamber-admissibility from gauge invariance and continuity).
- N3. Where the per-grade stencil S_d is constructed; it is taken as the fixed finite stencil of `centered-construction.tex` l.192. Whether the insertion there is literally the f_c^{N,p} of (G3).
- N4. The record's build claims (`latexmk` exit 0, 1042 pages, 0 undefined references, p. 888 inspected; `check_blueprint.py` "see the PR"). No LaTeX build was run.
- N5. That the side of the level-N period-p torus is compatible with the depth-w centered tiling; an upstream property of the tiling that the lemma does not touch.

N6–N8 concern the Lean correspondence and are listed in lean-correspondence.md.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
