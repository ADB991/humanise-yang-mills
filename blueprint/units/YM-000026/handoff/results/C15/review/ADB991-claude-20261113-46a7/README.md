# Independent review: C15 `trace-small-means`, `trace-crown-buffer`, `trace-price-recurrence`

- Session: `ADB991-claude-20261113-46a7`. Role: independent reviewer (mathematics and textual Lean correspondence). Prepared by Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 had not read it before submission.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/56#issuecomment-6867384549 (until 2026-11-14 23:30 UTC).
- Target: the three chapters as they stand on `codex/existence-monograph` at `13f52dd643b0dacd70dff6c01f33b3b3be492bc4`. That is schmittj's author pass #105 (`f8022ce0`) plus the #194 source-leakage wording of commit `a4a73dc9`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. SHA-256 values are in `inspected-sha256.txt`.
- Scope: three of the fourteen #105 chapters that reviews #107 and #112 did not cover. The other eleven stay unreviewed.
- Independence: ADB991 did not write #105, the part-A author records, or any earlier version of these chapters. ADB991 did write commit `a4a73dc9` (#194 / PR #207), which changed these files: small-means +37/−32, crown-buffer +4/−4, price-recurrence +2/−2, all wording that removed Lean names. mgubi's review `review/mgubi-astra-c15-leakage-review-20261113/` already covers those hunks, and this report does not certify them. Every other line of the three chapters was checked independently.

## Verdict

Under their stated inputs, all three chapters prove what they state. Every displayed inequality and every exponent was recomputed. The main statements match their source declarations in hypotheses, constants and quantifier order. Author repairs E1–E3, E11 and G1–G3 (part-A `findings.md`) are confirmed.

**One required (minor) change, M1, in `trace-crown-buffer.tex`.** Two steps are neither proved nor cited:

- the "translated form" of the tiled-product inequality used in `lem:ex-trace-crown-good`;
- the claim that the seam condition holds for every β ≥ 0.

The manuscript already proves the needed chessboard bound (`prop:ex-centered-planted`). What is missing is the step that turns a translate into a prescribed copy, together with the citations.

**One should-fix item, S1, in `trace-price-recurrence.tex`.** The polarization estimate that defines `M_d` is stated without proof or citation. It is used only in the supporting derivation of the one-step estimate. `prop:ex-lattice-trace-sharp-read` takes that estimate as a hypothesis, so the proposition itself is not affected.

The other findings (N1–N7, O1–O4) are wording, notation or optional.

| ID | File | Kind | Summary |
|---|---|---|---|
| M1 | crown-buffer l.186–196, l.50–52 | required (minor) | The translated tiled-product step and "seam holds for every β ≥ 0" are uncited and unproved; the producers are `prop:ex-centered-planted` and `prop:ex-lattice-finite-reflection`, plus a translate-to-copy step |
| S1 | price-recurrence l.96–98 | should | The polarization estimate (constant `M_d`) is asserted, not proved or cited |
| N1 | small-means l.10–12 | wording | Linearity of the charts `U_i^{(d)}` is used (l.170, l.231–232) but not stated |
| N2 | small-means l.62 | known | The core-to-strip map `E_k` is still undefined (already #194 row 296, mgubi review) |
| N3 | crown-buffer l.90 | wording | "Healthy for P at threshold b" is used before it is defined; only l.134–137 imply its meaning |
| N4 | crown-buffer l.132–133, l.205–210 | wording | The one-site estimate's applicability conditions (2b ≤ ϑ_k, room for the radius-8 indicator) are absent from the hypotheses of `lem:ex-trace-crown-exception` |
| N5 | price-recurrence l.27–28, 238–264, 194 | notation | Letters reused: K (worth profile), K_j (worth coefficient), K_j (vacuum activities); a (term index), a (regular mass), a_j (activity bound); b, b_j, index set b; P.x, Q.x undefined beside P_j |
| N6 | price-recurrence l.98, 181–183 | wording | The polarization estimate needs g and G_D of class C^d near the identity; say that g is the finite local presentation, so this holds by construction |
| N7 | price-recurrence l.7–10 | wording | The intro says the one-step estimate "is derived below", but the insertion paragraph (author's N3) and S1 are not complete proofs; say "explained below" or list the inputs |
| O1 | small-means l.191–206 | optional | The two zero-rate tickets are proved in the source (`stickK` from `bond` and `PostT`; `titles`), so calling them outstanding inputs is conservative but correct |
| O2 | crown-buffer l.223 | optional | "Translation preserves the number of support sites": the bound "at most" (`Finset.card_image_le`) is enough |
| O3 | crown-buffer l.166 | optional | "the second and fourth inequalities imply": only the second is used in that display |
| O4 | price-recurrence l.164–167 | optional | Termwise differentiation could cite a textbook (for example Rudin, *Principles of Mathematical Analysis*, 3rd ed., Thm 7.17, with the M-test, applied to real and imaginary parts). This locator is from memory and was not checked against a copy |

Details: `mathematics.md` (proof checks) and `lean-correspondence.md` (source checks). `validation.md` lists the commands run.

## Not done

- No Lean elaboration and no `#print axioms`. Source was read as text, and the hashes match `Lean/SOURCES.sha256`.
- No LaTeX build. The deliverable is report-only and changes no typeset content.
- The inputs each chapter names as outstanding were not checked: Crown witness, transfer identity, one-site receipt, paid-direction conditions, insertion estimate, detector separation and pairing convergence, mission price bound.
- The hunks from `a4a73dc9` (see above).

No approval or `reviewed` status is recorded. Human acceptance is not ADB991's or this agent's to give.
