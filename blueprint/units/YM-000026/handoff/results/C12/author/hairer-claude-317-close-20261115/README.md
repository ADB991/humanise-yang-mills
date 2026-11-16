# C12: paid retention on the public run (#317 closing assembly, draft)

Session: `hairer-claude-317-close-20261115`.
Claim: https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6899288084
Base: `codex/existence-monograph` @ `a3fc4a6` (after merged #452, #455, #456).
Upstream Lean pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (unchanged; no Lean edits).

## Delivered

New subsection `sec:selected-retention-public` in `manuscript/existence/selected-centered-service.tex`, containing `thm:selected-retention-public`. It removes the two door hypotheses of `prop:selected-centered-retention`: slot preservation and the arrival/ordinary/raised-response receipts. The resulting retention theorem holds on every stored door $0\le i<N$ of the public run, including $i=0$.

The receipts are made explicit as (A1)–(A6) and each is matched to an already merged result:

| Receipt | Consumer requirement | Supplier (merged) |
| --- | --- | --- |
| (A1) shipment of admitted offers | `sec:finite-menu-history-handoff`, `thm:ex-lattice-volant-supplier` | `lem:selected-menu-alphabet` (#449), `lem:selected-residual-body` (#451), `lem:selected-warning-inputs` (#452) |
| (A2) vertex input, tree smallness, `eq:menu-total-pledge` | `subsec:ex-lattice-rg-usable`, `eq:ex-lattice-multi-lucent` | `prop:selected-value-prices` (#455), `lem:selected-component-fibers`, `eq:selected-thin-pledges`, `eq:selected-two-tree-smallness` (#456), with $E_0=M=\mu P^2/4$, $E'=P_X$, $P_1=P_Xe^{-M}$, $V_Q=V$ |
| (A3) hard precursor $2V_Qe^{-E_0}$ | `subsec:ex-lattice-rg-crowd` | `eq:selected-precursor-hard` with $m=0$ (#456) |
| (A4) soft precursor prices and final demands $f,f_+$ | `subsec:ex-lattice-rg-crowd` | `sec:selected-precursor-vapor` (#456): $b_0\le h^{-1/8}$, $b_+\le e^{\chi_0}h^{-1/8}$, $f_0,f_+$ |
| (A5) capital/quote payments, both paths | `eq:ex-lattice-multi-capital`, `eq:ex-lattice-multi-rate` | `lem:selected-response-payments` (#449), output $H_2=w_i$ |
| (A6) tuning law (differentiability with summable joint majorants) | `sec:finite-menu-history-handoff` | `sec:selected-inserted-derivative`, scalar-interval paragraph (#456), `eq:leaf-differentiate-sum` |
| slot preservation | `prop:selected-centered-retention` | `lem:selected-reserved-slots` (#350/#364) |

The local premises retained by #452–#456 are listed as (L1)–(L5). Each is identified with an estimate that `sec:common-funded-history` already pays before the scale realization, at the same tube, return and budget points:
- (L1): the sector integrals, Gaussian prefactors and shell bounds;
- (L2), (L3): the marked and unmarked local bounds, with the derivative bank of `sec:common-observable-purchases`;
- (L4): the small-field localization and parameter comparison;
- (L5): the scalar reset.

They are therefore the incoming local interface of the selected history, not new #317 hypotheses. The theorem does not prove them.

Also updated in the same file:
- the two "remaining analytic attachment" sentences (after `prop:selected-centered-retention` and in `sec:selected-response-payments`);
- the retention sentence opening `The service at every reference level`.

## Not changed / out of scope
- C02 files `finite-menu-history-handoff.tex` (its last paragraph still calls the receipts a separate obligation) and `centered-construction.tex` (l.202, "A separate producer argument is required"). Both can now cite `thm:selected-retention-public`. They are left to the C02 holder (#43).
- The stale clause at the end of the (RS) discussion in this file ("the slot realization at nonterminal levels is the open attachment of `prop:selected-centered-retention`") is superseded by `lem:selected-reserved-slots`. It sits in the #318/#319 portion and is left to that owner.
- The auxiliary-history transition hypothesis for the fixed-level limits (first subsection) is unrelated and unchanged.

## Source correspondence
- Retention route: `YM.PhysicalNext.Repeat.Legato.Bandage.glassDoor`, `.escape`, `.stamina`; `YM.MergeProof.Menu.Volant`; `YM.MergeProof.Accent.Duty`. This is unchanged from #326; see `results/C12/author/hairer-codex-317-20261113-2307/`.
- Receipt suppliers: those recorded by the merged author records `hairer-codex-317-receipts-20261115`, `hairer-claude-317-body-20261115`, `hairer-codex-317-local-20261115`, `hairer-codex-317-values-20261115` and `hairer-codex-317-variants-20261115`.
- This note adds no new source claim. The theorem is an assembly of reviewed manuscript results, and its correspondence is the union of theirs.

## Validation
- `python3 scripts/check_blueprint.py`: passed (4 units).
- `git diff --check`: passed.
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`: exit 0, 1118 pages, no undefined or multiply defined references. Pages 721–724 rendered and inspected.
- Not run: Lean elaboration or axiom replay.

## Review targets
Independent review should check:
- that (A1)–(A6) exhaust the arrival/raised-response hypothesis as used in the proof of `prop:selected-centered-retention` and in `sec:finite-menu-history-handoff`;
- the identification $V_Q=V$, $E_0=M$, $P_1=P_Xe^{-M}$;
- the exponent bookkeeping $a_i=\alpha_i+3$, $\alpha_i+1/2\le a+e$, flagged ledger at $\alpha_i+1$;
- that (L1)–(L5) are indeed among the estimates paid in `sec:common-funded-history` at the same data.
