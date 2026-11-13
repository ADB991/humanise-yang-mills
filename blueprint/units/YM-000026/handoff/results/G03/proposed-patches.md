# G03 proposed patches (not applied; owners in brackets)

All line numbers at basis `d3c7a19`. Shared files are reserved for F01 unless an owner agrees.

## P1 — Williams bibitem (F1) [F01; `existence.tex`]

```diff
 \bibitem{Williams} D. P. Williams,
 \emph{A (Very) Short Course on $C^*$-Algebras},
-lecture notes, 14 February 2024, Theorem 2.13, pp. 29--31.
+lecture notes, dated 14 February 2024.
 \url{https://math.dartmouth.edu/~dana/bookspapers/cstar.pdf}.
```
The three `\cite`s already carry their own theorem numbers. Optionally make the pages explicit at
the cite: `\cite[Theorem 2.13, p.~29]{Williams}` (phase-selection l. 28) and
`\cite[Theorems 2.17 and 2.19, pp.~33--34]{Williams}` (l. 89), owner C03; `\cite[Theorem 2.19, p.~34]{Williams}` (complex-heat l. 12), owner C04.

## P2 — OS75 bibitem (F2) [F01; `existence.tex`]

```diff
 \bibitem{OS75} K. Osterwalder and R. Schrader,
-\emph{Axioms for Euclidean Green's functions II},
+\emph{Axioms for Euclidean Green's functions II}, with an appendix by S. Summers,
 Communications in Mathematical Physics \textbf{42} (1975), 281--305,
-especially \S IV.1, pp. 287--288.
+\S IV.1, p.~287 (the theorem ``E$'$ (or E$''$) $\to$ R$'$'').
```
Source of the corrected locator: `blueprint/background/osterwalder-schrader.md` (#6), visual check of the journal scan.

## P3 — reader prerequisites (F7) [C16 owns `statement.tex`; G04 may prefer to place this in Section 2]

```diff
-We assume familiarity with finite-dimensional Lie groups, probability Haar
-measure on compact groups, Lebesgue integration and dominated convergence,
-and elementary Hilbert-space theory. The specific compactness, quotient and
+We assume familiarity with finite-dimensional Lie groups, probability Haar
+measure on compact groups, measure and integration (including Fubini--Tonelli,
+the $\pi$--$\lambda$ theorem and Bochner integrals of Banach-valued functions),
+Cauchy's theorem and formula, the Hahn--Banach theorem, elementary Hilbert-space
+theory, the Fourier transform on Schwartz space, and the elementary
+inequalities for Gaussian random vectors (Markov, Chernoff, Jensen, Wick's rule).
+The specific compactness, quotient and
```
(C\*-algebra theory, SNAG, Riesz–Markov and the real-analytic inverse function theorem remain cited at their points of use.)

## P4 — Hall locators (F3) [C06; `predictor-branch.tex:42–47`]

Keep the book citation and add the verified free version, so a reader has a checked source:

```diff
 Graduate Texts in Mathematics 222, Springer, 2015, Definition~1.4,
 and $\mathfrak g$ is its Lie algebra in the sense of Definition~3.18
 there. By Theorem~3.42 of the same book there is $\varepsilon_0\in(0,\log2)$
 such that, for every matrix $A=\exp X$ with $\|X\|<\varepsilon_0$,
-one has $A\in G$ if and only if $X\in\mathfrak g$. The matrix
+one has $A\in G$ if and only if $X\in\mathfrak g$. (In the freely available
+version B.~C. Hall, \emph{An elementary introduction to groups and
+representations}, arXiv:math-ph/0005032v1, these are Definition~2.2, p.~9,
+Definition~3.13, p.~36, and Theorem~3.23, p.~44; Theorem~3.23 there
+gives the local homeomorphism $\exp:U\to V$ onto a neighbourhood of $1$ in $G$, and
+Theorem~3.6, p.~32, gives $\log e^X=X$ for $\|X\|<\log2$, which together yield the
+equivalence.) The matrix
```
The book locators (Def. 1.4, Def. 3.18, Thm 3.42) must still be checked against a copy before acceptance.

## P5 — attribution note (F5) [F01; `existence.tex` front matter]

Insert after the Status paragraph:

```latex
\noindent\textbf{Source and attribution.} The argument follows the Lean
formalisation of the four-dimensional Yang--Mills construction at revision
\texttt{3456e5e75cf8d4cd558955a5c7638fba2d68f464} of
\url{https://github.com/yang-mills-group/OpenAI-YM-20261028}; correspondence
records are kept in the project blueprint. The initial source clustering and
declaration maps used to organise this exposition come from Scott Armstrong's
Yang--Mills informalization project,
\url{https://github.com/scottnarmstrong/yang-mills-informalization}.
```
Wilson's lattice action should be credited where it is introduced (`lattice.tex`, C01) once the
reference has been checked (F5(b)).

## P6 — bibliography mechanics (F8) [F01]

Replace the inline `thebibliography` in `existence.tex:272–294` by
`\input{existence/verified-references}` after F01 has (i) accepted or amended the entries,
(ii) converted the footnote at `local-covariance.tex:39–45` (C07) to `\cite[Proposition~2, p.~464]{Jaffard}`,
and (iii) converted the inline references at `predictor-branch.tex:42–47,62–64` (C06) to
`\cite[Definition~1.4, Definition~3.18, Theorem~3.42]{HallBook}`, `\cite{HallArxiv}` and
`\cite[Section~2.5]{KrantzParks}`. Entries marked "not verified" in the file must be checked before
the file is used.
