# Mathematical validity — renewed bounded review

Identity, reviewed commit, claim and scope are in `README.md`; exact file fingerprints are in `hashes.json`. Responsible contributor: @mgubi; assistance: independent Astra session `mgubi-astra-c10-annulus-renew-20261113`. Human acceptance is pending and is not supplied by this report.

## R1 continuation (P2): finish propagating the open ticket premise

**Changes requested**, confined to the remaining contradictory summaries.

The repaired `prop:ex-annulus-estimate` explicitly assumes (W), (S) and (T). Its concluding dependency summary does likewise. The C10 README, handoff and outgoing `C10-to-C11-annulus-estimate` row now correctly transmit (T), and the incoming `unassigned-to-C10-film-tickets` row remains open. These parts of revision 1 pass. Naming (T) does not discharge it, and the text explicitly says it is not established here.

Two current summaries still state a stronger closure than that proposition:

1. `manuscript/existence/annulus-recording-yield.tex`, Scope, lines 342–355, especially 351–353: the resulting statement is said to have **only** the baseline and response service remaining as inputs. This is exactly the stale assertion identified in #99; its hash is unchanged.
2. `results/C10/part-B/ledger.md`, Outputs, row `prop:ex-annulus-estimate` (line 20): incoming premises list (W), (S), the quadratic-Hessian and radial inputs, and status says “stated and proved here from (W), (S)”. The row `lem:ex-annulus-same-data` (line 18) likewise omits the ticket premise from the recording conclusion's inputs. This conflicts with the repaired outgoing edge in the same ledger.

The missing premise is not absorbed into the baseline or response service. In recording-yield lines 229–249 these provide a Wilson family and a correction family recording target minus Wilson, then **separately** require exact finite-layer realization of the interacting/reference determinant matrices. In same-data, addition supplies the action tickets of F=Q+W; the extra gauge-fixing/regulator films still need their own finite-matrix tickets. In the pinned source, `gemF` uses `grantM` and `grot`, which use `pelt_ticket` and product/rear/inverse rules. A strip bound and a denominator identity identify zero layers and analytic domains, but not first and second background variations.

**Smallest repair:** in the recording Scope state that the finite-layer realization is obtained conditional on fixed-film input (T), and replace the “only baseline and response service” phrase by a list including (T). Make the affected ledger Outputs premise/status cells agree with the current proposition and outgoing C11 row; include (T) for the same-data recording conclusions. Keep the ticket edge open. A wording repair with new hashes and renewed bounded review is sufficient; no new proof of the film calculus is demanded by this finding. No author text was changed here.

The same-data subsection's phrase “two inputs” introduces the two immediately following items (W)/(S); the proposition itself separately names (T). To avoid another misleading summary, the author could say “two further inputs, in addition to (T)”. This is an editorial suggestion, not a separate blocking mathematical finding.

## Revision 2: normalization verified

The new inner product is on the fixed unitary matrix representation:
`<u,v> = -(1/r_G) Re tr(uv)`. The real Lie algebra consists of skew-Hermitian matrices, so this is positive definite and invariant. Its orthonormal color frame is the one used to form the adjoint trace. The averaged trace formula for C_G and the displayed bilinear identity agree: substituting each unit basis vector gives `-Tr(ad e_b)^2=C_G`, and summing divides by the nonzero real dimension. Simplicity here includes nonabelianness. Scaling the inner product by r_G scales the Casimir scalar by 1/r_G, so the stated alternative trace-form normalization is correct.

An independent calculation verifies the example for SU(N) in the defining representation, N>=2. On the complex vector space of N-by-N matrices put L_u(A)=uA and R_u(A)=Au. In the matrix-unit basis, the coefficient of E_ij in L_u R_v(E_ij) is u_ii v_jj, hence `Tr(L_u R_v)=tr(u)tr(v)`. Left multiplication by w has trace N tr(w), as does right multiplication. Expanding `(L_u-R_u)(L_v-R_v)` therefore gives

`Tr(ad u ad v) = 2N tr(uv) - 2 tr(u)tr(v)`.

For traceless u,v the last term vanishes. Scalars form an invariant one-dimensional summand on which both adjoint maps vanish, so the trace on all matrices equals the trace on sl_N(C). Every traceless complex matrix A is uniquely X+iY with traceless skew-Hermitian X=(A-A*)/2 and Y=(A+A*)/(2i), so sl_N(C) is the complexification of su(N). A real basis of su(N) becomes a complex basis; complexification preserves the numerical trace of a real endomorphism (there is no factor two). Finally tr(uv) is real for skew-Hermitian u,v, since its conjugate equals tr(vu). Thus on su(N),

`-Tr_R(ad u ad v) = -2N Re tr(uv) = 2N^2 <u,v>`.

This proves the orientation value **C_G=2N²**, with exactly the manuscript's normalization, rather than importing a physics coefficient from a different trace convention. N=1 is excluded by the standing simplicity assumption; no correction is required on that account. The example is a mathematical specialization, not a claim that a generic SU(N) constructor or this formula was elaborated in Lean.

A focused original-source search located Kac/Nandakumar, MIT 18.745, Lecture 10 (12 October 2010), Definition 10.2 and Exercise 10.2, p. 2: its matrix-unit calculation gives the gl_N trace formula used above. [Lecture notes](https://math.mit.edu/classes/18.745/Notes/Lecture_10_Notes.pdf). The text layer's final sl_N sentence writes a product of traces, inconsistent with its preceding calculation; the calculation above supplies the restriction directly and does not rely on that sentence. A separate Kirillov PDF fetch failed; it was not used as evidence. No new manuscript citation or literature supplier is asserted.

The canonical running-coefficient section `manuscript/pilots/running-coupling.tex` defines C_g by the same averaged real adjoint trace and the same normalized matrix inner product, and defines `b_0=11 C_g/(48 pi²)`. Consequently the two-wave coefficient is exactly `lambda_G=11 C_G/(24 pi²)=2b_0(G)`. In particular the pole integral has coefficient `-lambda_G log(mu^-1)`. This is a constant identity for the same represented group, not an identification of trajectories or histories.

## Verdict and outstanding inputs

**Mathematical verdict: changes requested for the remaining R1 summaries.** Revision 2 has no identified normalization error; the repaired final annulus proposition and outgoing handoff correctly retain (T).

Still external: (W)/(S) conversion from coefficient pictures to fee-bounded marked responses; fixed-film ticket calculus (T); the quadratic-path-Hessian interface; the floors, path bounds and same-data hypotheses explicitly assumed. This review does not prove them or close the C10-to-C11 edge. The separate shooting-slope/history integration #136 was not reviewed; equality of color constants does not establish that an independently named shooting slope or a selected running history is the same object. Unchanged fleet, halo, radial, common-strip and Fourier arguments are not given a new full-proof certificate by this revision pass.
