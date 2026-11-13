# C08 independent review by a second contributor (agent review, no human acceptance)

- Unit: YM-000026, package C08 (`blueprint/units/YM-000026/handoff/C08.md`), issue #49.
- Role: Lean correspondence and mathematical validity, reported separately per chapter group.
- Human reviewer: `schmittj` (account under which the agent review is submitted; no human acceptance is recorded).
- Agent assistance: two Claude Opus reviewer agents, one per chapter group, each instructed to re-derive the computations and to re-check every finding before reporting it; coordinated by a Claude session. The author and the interim checker passes recorded on the issue used Codex agents; this is the first review by a different contributor and model family.
- Reviewed content: the thirteen C08 chapters and the records in `results/C08/`, as merged from PR #93 (author commit `48553af`), at `codex/existence-monograph` `81538d6`. Per-file SHA-256 values are in the two `partN-validation.md` files; the author's `fingerprints.md` line references and hashes were checked and agree.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #49, author PR #93 (merged).
- Outcome: **changes requested; no error found.** No false statement and no invalid proof step was found in the thirteen chapters. The edits made by PR #93 (six in total) are correct and agree with the source, including the new paragraph separating precision, covariance and Hessian in `gaussian-reassembly.tex`. The requests concern inputs that are used without a named producer and one unstated hypothesis.

Files: `part1-*` (`gaussian-reassembly`, `forest-average-log`, `forced-exclusion`, `soft-log-fusion`, `marked-block-integral`, `marked-activity-jets`, `leaf-expansion`), `part2-*` (`projection-payment-producer`, `principal-gaussian-comparison`, `principal-comparison-jets`, `principal-reference-attenuation`, `nonlinear-singleton-inheritance`, `high-degree-cluster-prices`, and the author's records). Each part has `-mathematics.md`, `-lean.md` and `-validation.md`. Finding numbers below refer to those files. All findings in the chapters predate PR #93 unless marked.

## Findings that need action

1. **An identity used without proof or producer (gap; part 1, F1).** `marked-block-integral.tex` 200–210 and `leaf-expansion.tex` 161–171 use \(e^{E_{\rm coarse}+R_0+S_0}=\mathcal O\cdot a(0)\). In the source this is a theorem with hypotheses (`Mallow.cone`, through `Mallow.prom` and `Song.creditRing`), not a definition. It should be stated as a named input with its producer.
2. **An unstated exponent condition (gap; part 2).** `high-degree-cluster-prices.tex` 28 and 249–270 need the root price to have exponent below \(-3/8\); the chapter only fixes \(-1/2<t<0\). The source obtains it from `Target.Expense.reach` together with the hypothesis of `Height.cruising`. State \(t<\varphi<-3/8\).
3. **A requirement made explicit but not closed (gap; part 2; the sentence is from PR #93).** `nonlinear-singleton-inheritance.tex` 121–125: nothing names where the degree-four moment cancellation and the order-six regularity of the inherited activity are proved (source: `Heir.Seed.*`, not opened by the reviewer).
4. **Inputs without a cited producer (part 1, F2, F3, F5).** The product moment bound in `gaussian-reassembly.tex` 219–224; a bound for distinct connected label sets used by `forced-exclusion.tex` and `marked-activity-jets.tex`, which follows from the forest bound of the cluster-expansion section but is not stated there; two scale inputs in `marked-activity-jets.tex`.
5. **Objects not defined (part 1, F4).** `gaussian-reassembly.tex` does not define the flat reference \(A_0\) or the mean \(\mu\); the handoff says the draft distinguishes the mean operator, which this chapter does not.
6. **Two unjustified steps (part 2).** `principal-comparison-jets.tex` 208–250 uses the chart value bound \(\lVert u(0)\rVert\le v\) without justification; `principal-reference-attenuation.tex` 114–124 needs a lower bound on \(\theta_c/\theta_f\) that is not stated.
7. **Records.** `edges.md` omits outgoing edges to C03, C09, C12, C13 and C15 and the C07 inputs of two chapters. `ledger.md` 123–125 attributes to the source an exponent computation that the source does not make in that form (harmless). There was no `results/C08/review/` directory at `81538d6`; the earlier evidence consists of bounded passes by agents of the author's model family and an interim review of two chapters.

Notation: several symbols are overloaded or undefined across the part 1 chapters (list in part 1, F6).

## Not reviewed

No Lean elaboration and no LaTeX build. About twenty source declarations named by the records were not opened (lists in the `-lean.md` files). Inputs quoted from other packages were not audited. The theorem numbers in the author's `literature.md` were not checked against the source texts; the reviewed chapters themselves cite no literature.

## Acceptance

None recorded. This is an agent review submitted under the account `schmittj`. After the author's changes the affected files need renewed review.
