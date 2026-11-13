# G04 findings and proposed patches

## Findings

**G04-F1. One-loop normalization check (C10/C11/#22).**
- C10 records the per-step coefficient
  λ_G = 11C_G/(24π²) (`annulus-two-wave-estimates.tex:103–105`).
- The running-coefficient unit has b_0 = 11C_𝔤/(48π²), with slope 2b_0 in `eq:running`. So λ_G = 2b_0 *if* C_G and C_𝔤 are the same Casimir in the same normalization.
- The C10 chapter calls C_G "the adjoint Casimir", but G04 did not find the normalization of C_G stated next to it.
- The shooting slope s_G (`common-scale-selection.tex:60`, `surviving-interval-shooting.tex:9`) is only said to be positive.
- The outline therefore states the identification as part of the open running interface. It does not assert it.
- Owner: C11-to-G02-running (C10/C11 with #22).

**G04-F2. Presentation order differs from dependency order.** The soft analytic layer (C03–C05 first block, sections 19–58) is presented before the construction estimates (sections 59–244) that supply its inputs. Section 2.6 makes the inversion explicit with a table. G05 may wish to use this in its chapter-order contract. The outline itself does not propose a reordering.

**G04-F3. External chapters.** The trace sensor and branch-moment chapters (#33/#34) are not in the include list. Section 2.7 item 6 states this.

**G04-F4. Section ranges.** `phase-quantitative-producer.tex` contains three `\section`s. A range ending at its first label silently omits two sections. This is noted for G05's index.

No mathematical error in the chapters was found. G04 is not a review, and none was attempted.

## H. Historical and attribution claims (for G03 pass 2)

All metadata below was checked on INSPIRE-HEP (title, authors, journal, volume, year, pages, DOI). Only the metadata was checked; the article texts were not read.

| ID | Outline claim | Reference | Metadata | Content check |
| --- | --- | --- | --- | --- |
| H-G04-1 | The finite-volume measures are Wilson's lattice gauge theory | Wilson, *Confinement of quarks*, PRD 10 (1974) 2445–2459, doi:10.1103/PhysRevD.10.2445 | INSPIRE ✓ | not read (APS blocked) |
| H-G04-2 | Logarithmic growth of bare coefficients is what asymptotic freedom predicts | Gross–Wilczek, PRL 30 (1973) 1343–1346, doi:10.1103/PhysRevLett.30.1343; Politzer, PRL 30 (1973) 1346–1349, doi:10.1103/PhysRevLett.30.1346 | INSPIRE ✓ | not read |
| H-G04-3 | Block-spin RG for lattice gauge fields "developed in Bałaban's programme"; no theorem of it used | Bałaban, CMP 109 (1987) 249–301, doi:10.1007/BF01215223 | read in journal scan by schmittj (`blueprint/background/balaban-gauge-averaging.md`, pp. 251–256) | prior, author-only; that note found no citable theorem match, consistent with the outline's wording |
| H-G04-4 | Reconstruction "has the shape of" OS reconstruction | OS, CMP 31 (1973) 83–112, doi:10.1007/BF01645738; OS75 (existing bibitem) | INSPIRE ✓ (both) | OS75: #6 note (TrishenGunaratnam); OS73 not read |

## Proposed patches (not applied; owners in brackets)

**P1 [F01]: include.** In `manuscript/existence.tex`, after `\input{existence/statement}`, add
`\input{existence/argument-outline}`.

**P2 [F01, after G03 audit]: bibliography.** Add to the existence bibliography
(or to the proposed `verified-references.tex`):
```latex
\bibitem{Wilson74} K. G. Wilson, \emph{Confinement of quarks},
Physical Review D \textbf{10} (1974), 2445--2459.
\bibitem{GrossWilczek73} D. J. Gross and F. Wilczek,
\emph{Ultraviolet behavior of non-abelian gauge theories},
Physical Review Letters \textbf{30} (1973), 1343--1346.
\bibitem{Politzer73} H. D. Politzer,
\emph{Reliable perturbative results for strong interactions?},
Physical Review Letters \textbf{30} (1973), 1346--1349.
\bibitem{OS73} K. Osterwalder and R. Schrader,
\emph{Axioms for Euclidean Green's functions},
Communications in Mathematical Physics \textbf{31} (1973), 83--112.
\bibitem{Balaban87RG1} T. Ba\l{}aban,
\emph{Renormalization group approach to lattice gauge field theories. I.
Generation of effective actions in a small field approximation and a
coupling constant renormalization in four dimensions},
Communications in Mathematical Physics \textbf{109} (1987), 249--301.
```

**P3 [C16 / F01]: prerequisites.** Section 2.2 already gives G03's P3 list. If F01
adopts it, `statement.tex` lines 11–14 can say "see also Section 2.2" instead of
duplicating the list.

## Next steps

1. G05 contract (#61): align notation (e.g. ν vs μ for the character measure;
   time-first vs time-last coordinates) and adopt or replace the section map.
2. G03 pass 2: audit table H.
3. Independent mathematics/source review of the outline at its final hash.
