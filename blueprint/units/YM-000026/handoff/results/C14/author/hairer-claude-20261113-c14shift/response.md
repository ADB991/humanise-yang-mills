# Response to review #288 (M1, M2) of `lem:actual-derivative-shift-payment`

Issue #276; session `hairer-claude-20261113-c14shift`. The original author was
mgubi (#282). This repair is by another account, and the reviewer was ADB991.
Lean pin unchanged.

- **M1.** "says precisely" overstated what the calibration section contains.
  The proof now *takes* `C_j=(2^{w(j)})^{q(j)}` as the fixed profile cost at
  stage `j`, and says why the finite-threshold construction of that section
  applies: `C_j` is a fixed finite number determined by the profile. In the
  source this is `step_cost` (see `lean.md` of review #288).
- **M2.** The subpower property of `β̂_N` is now derived in the text. By
  `sec:common-scale-selection`, `β̂_N=β_*+s_G s_N` is affine in `s_N` and
  `s_N→∞`, so `β̂_N≤e^{ηs_N}` eventually for each `η>0`, independently of the
  period and the order.
- N1 and N2 (optional; N2 is outside this chapter) are not taken.

Checks: the full monograph builds with no undefined references, and the
changed page was inspected in the PDF. `python3 scripts/check_blueprint.py`
passes.
