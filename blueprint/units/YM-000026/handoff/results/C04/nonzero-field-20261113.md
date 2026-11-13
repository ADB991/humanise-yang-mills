# C04: nonzero smeared field (issue #251)

Session `ADB991-claude-20261113-2f29` (Claude, scheduled agent for ADB991).
Claim: https://github.com/hairer/humanise-yang-mills/issues/251#issuecomment-6863820811.
Base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## What changed

`manuscript/existence/boundary-detection.tex`, after `prop:boundary-detection`
(existing statements unchanged):

- a short paragraph explaining why `prop:boundary-detection` alone does not give
  a nonzero field (with E = {0} all its hypotheses hold);
- `input:unit-insertion`: unit law and normalization for the **unselected**
  limiting correlations, at one grade d₀;
- a remark that the null-space condition allows zero spectators;
- `cor:nonzero-field`, with a complete proof: the unit class is not null (one-point
  word, unit law with n=0, normalization), its union image is nonzero
  (injectivity, already a standing premise of `prop:boundary-detection`), and the
  contrapositive of `prop:boundary-detection` with the field formula of
  `prop:word-fields` gives Φ(u,f) ≠ 0;
- a closing paragraph that records the input as outstanding.

Records: `ledger.md` (revision note, output row, new input row E6, updated
C04-to-C16-endpoint row) and `correspondence.md` (new section).

## Why

Finding F3 of the C04-to-C16-reconstruction endpoint check (PR #248,
`results/C16/endpoints/ADB991-claude-20261113-a112/mathematics.md`) and C04
review M3 (PR #76): the public clause "at least one smeared field is nonzero"
(`YangMills.Hierarchy.Reconstructed.acts`) had no producer in the manuscript.

## What remains open

- **E6 (`input:unit-insertion`) has no producer.** `prop:ex-limits-euclidean`
  passes permutation, translation, signed symmetry and conjugation identities to
  the limit and lists normalization, but not the unit law. Proposed owner: the
  C03 limits author (`limits.tex`). The natural route is to add the unit law to
  the exact finite-lattice identities of that proposition and pass it to the
  ordered point limits like the permutation identity. This pass did **not**
  check how the finite-lattice unit insertion is defined in the source family,
  so that route is a proposal, not a verified claim. In the source, `S.Basic` is
  part of the premise `Seed.kernel : S.Hierarchy`, so it is not derived there
  from the lattice either.
- E4 (levels, inclusions, union) is unchanged and still has no producer; the
  corollary uses only its injectivity part, which `prop:boundary-detection`
  already assumes.
- The coordinate transport to the public time-last convention is rule (T) of
  PR #248; F1 (wording in `complex-heat.tex`) is not touched here (PR #203).

## Literature

None needed: the argument is three lines of linear algebra on top of results
already proved in C04. No literature search was required beyond checking that
the step is not a standard citation target.

## Checks

See the PR for the commands actually run.

## Review response (session ADB991-claude-20261113-b476)

Independent review PR #259 (mgubi, at `42ca0b6`) found no mathematical
correction and one required record correction, M1. The namespaces were
checked in the pinned source: `structure Reconstructed` sits inside
`namespace YangMills` / `namespace Hierarchy` (`Lean/ChallengeSpec.lean`
l.7, l.53, l.117), and `theorem publicReconstruction` sits directly in
`namespace YangMills` (`Lean/HierarchyBridge.lean` l.9, l.79);
`HierarchyBridge` is the module name only. The "Why" section above, the C04
correspondence table and the ledger endpoint row now use
`YangMills.Hierarchy.Reconstructed` (field `acts`) and
`YangMills.publicReconstruction`. No manuscript change.
