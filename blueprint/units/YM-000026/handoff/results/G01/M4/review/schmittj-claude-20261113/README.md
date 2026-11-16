# Second independent review of G01 M4 (clause-by-clause determination)

- Unit: YM-000026, result G01, record M4 (`blueprint/units/YM-000026/handoff/results/G01/M4/README.md`, `trace_constant.py`). Task: issue #162; parent #26.
- Role: REVIEWER (mathematics and Lean correspondence). Session `schmittj-claude-g01-m4-review-20261113`.
- Human reviewer: `schmittj`. Agent assistance: one Claude reviewer agent, coordinated by a Claude session. This account did not author M4. Human acceptance is **unset**.
- Reviewed content: worktree HEAD `525ce60c03b75b3a73cb61077138b3fb1cdba963`; the record as last changed in `c55c16531bbe1eb33dd3c22c289e45d86c8b5d00`; `M4/README.md` SHA-256 `c6597d49…ba3d6f`, `trace_constant.py` `6599d7b5…cfb1af`; public statement `Lean/PublicTheory.lean` `94111ad2…ecfff8`, `Lean/PublicWilson.lean` `c1542c81…7e3233`, `Lean/ChallengeSpec.lean` `e48b0be2…243749`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Full hashes: [validation](validation.md).
- First review: `../mgubi-astra-g01-m4-review-20261113/`. This review does not repeat it; it decides the points that review left conditional.
- Outcome: **changes requested on the record; no obstruction found (outcome (ii)).** No Lean was elaborated. No manuscript file, and no file outside this directory, was changed.

## Summary

Every field of `WightmanTheory`, `Axioms`, `Hierarchy`, `Reconstructed`, `OperatorProductExpansion`, `TraceTest` and the vanishing hypothesis of `constant_insertion_witness` was checked against the candidate. No clause fails and none is left undetermined. The record's candidate needs five local repairs: (R1) a factor $(2\pi)^{-3}$ in the mass-shell measure, or equivalently $c=\dim\mathfrak g/(128\pi^5)$ for the measure as displayed ($c=\dim\mathfrak g/(16\pi^2)$ is right only for the standard Källén–Lehmann normalisation); (R2) a complex-linear field; (R3) the label $\xi_\alpha$ must act as $i^{\alpha_t}\partial^\alpha\phi$, otherwise `root` is false; (R4) the unit acts as $(\int f)\,\mathrm{id}$; (R5) the domain argument must use rapidly decreasing bounded wavefunctions on products of the forward cone, not Schwartz functions.

With these, O1, O2 and O3 are routine. [mathematics.md](mathematics.md) contains proof sketches: invariance of the domain and temperedness (Lemma A), locality, the spectral clauses in the Euclidean-pairing form, the operator product expansion with one coefficient family for all truncation orders, and `boundary` including integrability of the Bochner integrand. The first review's two technical points are confirmed and are repairable. The trace constant was recomputed and checked numerically ([validation](validation.md)).

Consequence, if the sketches are written out and checked: `YangMills.JointExistence` is satisfied by a generalized free field for every simple group; no public clause carries content beyond free-type fields.

Limits: sketches, not monograph-standard proofs; citations from memory; `adequacy.md` and `formal/README.md` were read in excerpts only. See [lean.md](lean.md) for the readings of the definitions.

## Check by the coordinating session

The normalisation finding (R1) was re-derived by hand, independently of the reviewer agent. `W0.spectralRepresentation` (`Lean/PublicTheory.lean` 271–273) equates `charFun` of the spectral measure with the translation matrix element, with no factor of \(2\pi\), so the two-point kernel is \(\int e^{ip\cdot x}\,d\mu(p)\) for the spectral measure \(\mu\) itself, and the Euclidean value at time separation \(r\) is \(\int e^{-rp_0}\,d\mu(p)\). For \(d\mu=\rho(s)\,ds\,\theta(p_0)\delta(p^2-s)\,d^4p\) one has \(\int e^{-rp_0}\theta(p_0)\delta(p^2-s)\,d^4p=2\pi\int_0^\infty k^2e^{-r\omega}\omega^{-1}dk=2\pi\sqrt s\,K_1(r\sqrt s)/r\), which is \((2\pi)^3\) times the standard Euclidean propagator. With \(\rho(s)=c\,s^2/\log^2s\) and \(s=u^2/r^2\) this gives \(r^8\log^2(1/r)\,S(r)\to\pi c\int_0^\infty u^6K_1(u)\,du=384\pi c\). Setting this equal to \(3\dim\mathfrak g/\pi^4\) gives \(c=\dim\mathfrak g/(128\pi^5)\); the record's \(c=\dim\mathfrak g/(16\pi^2)\) gives \(24\dim\mathfrak g/\pi\). This agrees with R1. The other repairs and the proof sketches in `mathematics.md` are the reviewer agent's and were not re-derived by the coordinating session.
