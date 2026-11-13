# Independent review of PR #340: zero-coordinate Coupon on the stored doors (#319)

- **Session:** `hairer-claude-319rev-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5), with no child agents.
  The account hairer did not author #340 or `selected-centered-service.tex`.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/319#issuecomment-6867848764>
- **Reviewed:** PR #340 head `0214b1f` (merged `72a811d`). That is the new
  `sec:selected-zero-coordinate-coupon` with `prop:selected-zero-coordinate-coupon`, and
  the rewritten (R7) sentence. `selected-centered-service.tex` is unchanged from `72a811d`
  to the review commit; SHA-256 values are in `hashes.json`.
- **Source pin:** `3456e5e`. All five Lean files match `Lean/SOURCES.sha256`.

The Lean was read textually; nothing was elaborated. Human acceptance is unset.

## Verdict

**No required change.** The proposition is correct as a conditional statement,
and its proof is complete given (K), (S), (M) and the lawful-representation
facts in S1. The exported conclusion matches `YM.MergeProof.Relay.Tones`
field by field. One "should" item (S1) and one minor wording item (N1)
remain.

## Mathematics

- **Tuning.** rate/barunit = L^{−2/5+3/8} = L^{−1/40}. So
  (1+2c)L^{−2/5} ≤ L^{−3/8} ⟺ L ≥ (1+2c)^{40}. This matches the threshold v_j of
  `marked-portfolio-calibration.tex` l.208–219, where n_i is the maximum over j ≤ i. That
  threshold is included among the stage block floors
  (`common-observable-purchases.tex` l.268–273). Since J(i) ≤ J(i+1) and L_i is chosen at
  stage J(i+1), we get L_i ≥ n_{J(i+1)} ≥ v_{J(i)}. Correct.
- **Signs.** ϱ_i > 0. Also ψ_i ≥ 0, from τ_{i+1} ≥ 0. Correct.
- **Repacking (i)–(v).**
  - (iii): the transposition argument is valid. Admissibility depends only on
    tags, and two addresses with the same nonempty support cannot lie in one
    admissible set. So b ↦ σ(b) is a bijection, with σ(b)∖{a′} = b∖{a}, and
    Dr_a = Dr_{a′}. Grouping by tags needs absolute convergence; see S1.
  - (iv): eligibility transfers to the Keeper address via its defining
    property. Locality, gauge invariance and measurability are preserved
    under absolutely convergent countable sums. Correct.
  - (v): mass is linear in e for a fixed support, so masses over a common tag
    add. The step mass(S, e) ≥ e also needs α_{i+1} ≥ 0 (N1).
- **Decomposition and summation.** The per-term prices are (ϱm, ϱm, 2m) and
  (ϱm′/κ, ϱm′/κ, 2m′), the latter raised to 2m′/κ using κ ≤ 1. Zero terms get
  any prices by (M). The sums are ≤ ϱ(a_r + a_f) ≤ ϱq and ≤ 2(a_r + a_f) ≤ 2q,
  because Σ m′ ≤ κ a_f. Monotonicity gives (ϱq, ϱq, 2q). Leads and unit
  values are 0. Correct.
- **Wing.** W_i is fixed before Q and is finite. Correct.

## Lean correspondence

- `Relay.Tones` (`MergeProof/Accord.lean` l.22–24):
  - `tuned`: (1+2·columns_i)η ≤ barunit(block i), SoundDoor, 0 ≤ t and 0 ≤ η;
  - `priced`: ∃ finite X, ∀ Q with Q.x = 0, `Format 0` and `remBound … (√forcedAllowance(i+1)) q`,
    a Coupon with lead 0 and prices (ηq, ηq, 2q).

  This is exactly the proposition's conclusion, with κ = √w^f_{i+1} and t = ψ_i.
  The manuscript's ϱ_i > 0 is slightly stronger than the source's 0 ≤ η.
- `Bid.barunit L = (L^{1/8})^{−3} = L^{−3/8}` (`Bid/Loan.lean` l.34–35), and
  `Doors.rate L = L^{−2/5}` (`Reserve.lean` l.30). The source's tuning clause is the last
  conjunct of `paper` (`MergeProof/Apres.lean` l.20): ∀ j ≤ i, (1+2·columns_j)·rate L ≤ barunit L
  for L ≥ l i. This matches v_j and its prefix maximum.
- `ravine` (`MergeProof/Ravine.lean` l.24–34) takes the tuning inequality as a hypothesis
  `hP`. It obtains soundness via `sound_duet`, which is (S). Its wing is the set of
  `logKey`s of supports containing the origin, together with the `gasKey`s of the Keeper
  `Guard.Keeper.sufficient (h.samples …)`, as in the manuscript. The single-insertion
  estimates come from `clocksHere`, which is (K), and `waybill = 2·exp(supportExponent)·title`
  is ψ_i. The author's (K)/(S)/(M) split follows the source.

## Findings

- **S1 (should).** Step (iii) and the domination claim in the decomposition use
  three properties of a lawful representation, none of which has a manuscript
  reference:
  - admissibility depends only on supports and inventories;
  - distinct members of an admissible set have disjoint supports;
  - the dressed sums are absolutely bounded.

  The author notes this as Q1 (read from Lean). Either cite the manuscript
  definition of the activity expansion and lawful representation that states
  these properties, or list them as a fourth explicit input next to (K), (S)
  and (M).
- **N1.** In (v), "mass(S_a, e′_a) ≥ e′_a (the cover number is nonnegative)"
  also needs α_{i+1} ≥ 0. State it.
- The author's Q2 (the nonterminal Keeper comes from the slot realization of
  #317's open item) is correctly reflected in the closing paragraph. It is
  not a defect of this proposition.

## Checks

Recorded in the PR. The commands run were `check_blueprint.py` and
`git diff --check`. No LaTeX build was run, because no manuscript file was
changed by this review.
