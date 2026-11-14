# #406: the dilation current at short separation (author note)

- Session: `stalex444-claude-406-20261114` (Claude, on behalf of @stalex444).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/406#issuecomment-6883528555
- Base: `codex/existence-monograph` @ `edd3c4e7`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. It needs an independent review by an account other than `stalex444`.

## Output

New `rem:trace-dilation-current` ("The dilation current at short separation") in `manuscript/existence/trace-asymptotic.tex`, appended at the end of the file: after the proof of `thm:trace-asymptotic` and after the paragraph beginning "Combining this theorem", which closes the file at `edd3c4e7` (l. 367-371). Insertion only; no existing line is changed. Two `%` source lines above the remark name #406 (parent #56) and #337; issue numbers do not appear in typeset text. Labels added: `rem:trace-dilation-current`. No existing label changed. References used: `sec:trace-spectrum`, `sec:physical-angular-actions`, `prop:phase-ward-inheritance`, `ex-phase-caps`, `rem:ex-selection-ground-only`, `eq:trace-radial`, `eq:trace-positive-laplace`, `thm:trace-asymptotic`, `ex-trace-limit`, `sec:free-maxwell-radial-flux`.

## Mathematical content

- For a vector field V on R^4 with d_aV_b + d_bV_a = 2 phi delta_ab, and j_a(x_0) = sum_b V_b(x_0) S_chi(T_ab, Theta; x_0, x_1), the divergence in x_0 is phi(x_0) S_chi(tau, Theta; x_0, x_1) = phi(x_0) T(|x_0 - x_1|) for x_0 != x_1. Proof in the remark: product rule; the derivative term vanishes by conservation; symmetry of T_ab replaces d_aV_b by its symmetric part phi delta_ab; tau = Theta + c1, the unit assumption and the zero one-point function of Theta give T.
- For V(z) = z (phi = 1) the divergence at a pair at distance r is T(r). The conclusion of `thm:trace-asymptotic`, r^8 log^2(1/r) T(r) -> 3N/pi^4 > 0 as r -> 0+ (the limit that `ex-trace-limit` requires), gives r_0 > 0 with T(r) > 0 for 0 < r < r_0. In fact T(r) > 0 for every r > 0: in `eq:trace-positive-laplace` (theorem hypothesis 1) the measure is positive, and nonzero since the limit is positive.
- Contrast: in `sec:free-maxwell-radial-flux` the polarized stress is traceless and the dilation current is divergence free wherever the two closed two-forms f, g of the polarized stress are Maxwell waves (that section, l. 10-14). The remark says nothing about the flux around an insertion.

## Hypotheses used beyond the theorem

- **Conservation at separated points, in the selected phase.** For x_0 != x_1, x_0 -> S_chi(T_ab, Theta; x_0, x_1) is continuously differentiable and sum_a d_(x_0)_a S_chi(T_ab, Theta; x_0, x_1) = 0 for each b. The stress hypotheses of `sec:trace-spectrum` (trace-spectrum.tex l. 266-270: real labels, T_ab = T_ba, rank-two law) do not include it, and `thm:trace-asymptotic` does not list it. The manuscript's conservation is a label identity (e.g. physical-angular-actions.tex l. 262-270), reaching correlations through the slot identity `ex-raw-slot-identity` (slab-regularity.tex l. 79), carried to characters by `ex-phase-caps` (phase-regularity.tex l. 13), both conditional. For the normalized stress of `sec:physical-angular-actions`, prop:phase-ward-inheritance (phase-ward-inheritance.tex l. 34-51) gives the translation shell identity in every character, the selected one included, and the outline says these identities "hold in every phase" (argument-outline.tex l. 295-296); varying the cutoff away from x_1 and using the smoothness of ex-phase-caps gives conservation at separated points. phase-selection.tex l. 194-198 still lists the stress tensor among obligations for the chosen phase. trace-spectrum.tex does not cite that section and assumes only the three properties above, so the remark states the assumption and says where it is produced.
- **Unit in the selected phase.** `S_chi(1, Theta; x_0, x_1) = <Theta>_chi`. The manuscript uses this without proof in `rem:ex-selection-ground-only` (phase-selection.tex l. 188-189), which the remark cites; limits.tex l. 420 asserts no selected-phase unit law. The remark assumes it.
- Used from the theorem's hypotheses or the text: T_ab = T_ba (trace-spectrum.tex l. 269; theorem hypothesis 1); bilinearity of S_chi (trace-asymptotic.tex l. 189); `<Theta>_chi = 0` (trace-spectrum.tex l. 278-279); the radial form `eq:trace-radial` (theorem hypothesis 2). The "real labels" hypothesis is not used.

## Source and formal check (acknowledgement)

The counterparts of the identity and its short-distance consequence on the Lean release's definitions were checked independently by @stalex444 in the Lean library `stalex444/yang-mills-conformal-current` at commit `dbae2a6`, an add-on to the Lean release at `3456e5e7` that changes no Lean file of the release (its build appends two lines to the release's `lakefile.toml`). On the release's definitions it proves: (i) for a stress conserved in the release's sense (symmetric, real, and divergence free as an identity of labels, with a derivative plan realizing the derivatives of the moments) and a smooth field V on Euclidean R^4 with d_aV_b + d_bV_a = (1/2)(div V) delta_ab, that the divergence in y of `sum_b V_b(y) <T_ab(y) ...>` equals `(1/4)(div V)(y) <T_cc(y) ...>` at every configuration of pairwise distinct points; the release's Killing-field theorem is the case div V = 0; (ii) for V(y) = y, in the selected phase against the centered trace at a second point x (the current there being the library's `currentIn`, the release's formula for the current with the moments read in the phase table), that this divergence equals the release's trace two-point function at |y - x|; (iii) for the witness of the release's construction theorem, through two fields (the short-distance limit and its positivity) of the release's trace-exclusion clause, that r^8 log^2(1/r) times this divergence tends to 3 dim_R g / pi^4 as r -> 0+ and that the divergence is nonzero for 0 < |y - x| < r_0.

Limits of that check:
- Parts (i) and (ii) build from source in a checkout of the release (the library's BUILD.txt, records 1-3). Part (iii) was compiled against the public compiled build `lean-build-3456e5e` of the release, with the release's modules loaded as compiled, neither compiled from source nor re-checked by a kernel replay (records 4-6).
- The library re-proves none of the release's theorems, its trace-exclusion clause included; the from-source build of parts (i) and (ii) compiles the release modules they import, while those behind part (iii), the trace-exclusion clause among them, were loaded as compiled (above). It is a statement about the Lean release, not about this manuscript: that the release's trace two-point function is the manuscript's T(r) is a reading (#353), not formally checked. The dilation is centered at the origin there.
- Its statements (identities, the short-distance limit, the non-vanishing) concern correlation functions at separated points only: nothing at coincident points, no statement about the dilation acting on inserted fields.
- It does not change the conditional status of `thm:trace-asymptotic` here (#337).
- The coordinator (#353): "We have not built or reviewed your library, and the project does not take a position on its build records."
- The library's proofs and README were written by Claude agent sessions @stalex444 directed.

## Uncertainty

- The remark assumes conservation at separated points in the selected phase and the unit law there (above). Neither is among the hypotheses of `thm:trace-asymptotic`.
- It is conditional as `thm:trace-asymptotic` is, with the two further assumptions above: none of these is proved in `sec:trace-asymptotic`, and the C15-to-C16 assembly (#337) is open.
- Placement: appended after the "Combining this theorem" paragraph rather than between `\end{proof}` (l. 366) and that paragraph, so the theorem's status, proof and closing paragraph stay together. Moving it up would also need Theorem~\ref{thm:trace-asymptotic} in place of "this theorem" in that paragraph, a change to an existing line.
- Notation: the stress is always written with indices (T_ab), so it is not confused with the two-point function T; the conformal factor is \varphi because trace-spectrum.tex uses \phi for field operators.

## Checks actually run

- `tectonic -X compile existence.tex` in `manuscript/` (tectonic 0.16.9, a XeTeX-based engine; not the project's `latexmk`/pdfLaTeX build, so page numbers differ from the author notes built that way): exit 0, 1059 pages (1058 before the change), no undefined or multiply defined reference in the log. The remark renders as Remark 236.11 on p. 1034 of that build; that page was inspected.
- `python3 -I scripts/check_blueprint.py` on a clean export of `edd3c4e7` with this change and this note applied: exit 0, "Blueprint structure OK: 4 units. Lean and mathematics were not verified."; `python3 -m unittest discover -s tests`: exit 0, 22 tests OK; `git diff --check` on the edited file: no whitespace errors.
- No Lean elaboration. The remark cites no Lean declaration.

## Not done

- No Lean build or elaboration in this session; the library's build records are its own.
- The CI manuscript job builds `main.tex` only, not `existence.tex`; the local build above is the only build of the remark.
- No change to `unit.json` (the file is already listed under YM-000026; no review is recorded, so no fingerprint goes stale).
- No edit to other C15 records (`results/C15/README.md`, `results/C15/handoff.md`).
