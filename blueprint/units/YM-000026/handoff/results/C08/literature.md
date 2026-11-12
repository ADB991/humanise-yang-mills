# C08 focused literature check — working record

The released `blueprint/background/README.md` was read and its directory
searched for Gaussian, forest, cluster and nonlinear entries. The pinned #12
and #13 interface notes are working-audit leads, not accepted literature
matches. A focused primary-source search located:

- R. Kotecký and D. Preiss, “Cluster Expansion for Abstract Polymer Models”,
  *Communications in Mathematical Physics* 103 (1986), 491–498,
  <https://doi.org/10.1007/BF01211762>,
  Theorem, pp. 492–493. The statement gives nonvanishing, logarithmic cluster
  expansion and a rooted estimate under an abstract incompatibility criterion.
  The indexed occurrence multiplicities, graded costs, derivatives, flag
  coverage and exact two-stage numerical reserves in C08 have not been matched
  to that theorem. It is not invoked as a replacement for those steps.
  Its formulation uses finite sets of distinct polymers, so the repeated
  occurrence tuples and exponential multiplicities in C08 need a separate
  translation. The previously used UCLA PDF URL returned 404 on a fresh
  direct fetch; a cached copy remained readable for this check. The DOI
  resolves to the publisher's bibliographic record.
- S. Demko, W. F. Moss and P. W. Smith, “Decay Rates for Inverses of Band
  Matrices”, *Mathematics of Computation* 43 (1984), 491–499,
  <https://doi.org/10.1090/S0025-5718-1984-0758197-9>,
  Theorem 2.4, pp. 493–494. Its first result assumes a positive definite
  `m`-banded operator with bounded inverse on the stated one-dimensional
  index set. It does not directly establish the uniform
  torus-metric, exponentially decaying, variable-window and derivative
  estimates used here. The prior #12 audit reached the same limited conclusion.
  A fresh direct fetch of the AMS PDF returned 403; a cached PDF and the
  publisher's DOI record were available for the bounded check.
- S. Jaffard, “Propriétés des matrices « bien localisées » près de leur
  diagonale et quelques applications”, *Annales de l'Institut Henri Poincaré,
  Analyse non linéaire* 7 (1990), 461–476,
  <https://www.numdam.org/item/AIHPC_1990__7_5_461_0/>, Proposition 2,
  pp. 463–464. On a discrete metric space satisfying the stated uniform
  exponential summability condition, an exponentially localized matrix
  invertible on ℓ² has an exponentially localized inverse, possibly at a
  smaller rate. This is closer in geometry to the window analysis than the
  one-dimensional band theorem. Its application to a family of finite tori
  still needs period-uniform constants, the actual row/column and spectral
  hypotheses, and the variable-window and derivative arguments checked; no
  such application is claimed here.
  The summability hypothesis has a plausible finite-torus match when at most
  `m` coordinates share an anchor: a radius-`r` ball contains at most
  `m(2r+1)^4` coordinates, so its exponentially weighted sum is bounded
  independently of the period. A candidate genuine metric is the sum of
  anchor distance and the discrete metric on distinct coordinates; it differs
  from anchor distance by at most one, so the counting and exponential-decay
  hypotheses transfer with a fixed multiplicative constant. This checks
  only those geometric ingredients, not uniformity of Jaffard's conclusion
  for the selected matrix family.
  The same paper's first “window lemma”, pp. 469–470, compares inverses of
  two invertible localized matrices when their difference decays in the
  sum of the distances of both indices to a specified perturbation set. The
  paper later discusses identity completion when index sets differ. This is
  relevant background for, but not yet a verified substitute for, the
  column-dependent principal windows here: their exact perturbation set,
  rates, uniform constants and derivative variants still need matching.
  A candidate specialization takes a fixed window `W`, the perturbation set
  `Ω=Wᶜ` when nonempty, and compares `A` with `A_W ⊕ I` on the common index set
  (the full-window case is the identity). The
  matrices agree on `W×W`; for a cross-boundary entry, exponential decay in
  the index distance controls the distance of the inside index to `Ω`, while
  both distances to `Ω` vanish outside. If `A≥rI`, the completed principal
  matrix has lower bound `min(r,1)`. These observations indicate how to test
  the lemma's hypotheses for one window; uniform constants across all
  windows and the source's particular read/range and
  derivative conventions still require verification.

The result statements were located and inspected; the first PDF's extracted
formula is garbled, so no precise criterion match is asserted. Neither result
is used to replace a proof here. Matching either theorem's full hypotheses,
conventions and any additional variant remains open. No novelty claim follows.
