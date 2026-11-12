# Final binding audit: free classifiers to the selected finite-grade Ward route

- Issue/unit: #26 / `YM-000026`
- Status: draft source audit; no theorem added
- Scope: compare the reviewed free collinear classifier and internal-map erasure with the actual finite-grade application in `YM.RG17.Joint` and `YM.Bid.station`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (`source/upstream.json`).
- Owned output: this audit file only.

## Finding

I found no type, grade, or same-object mismatch in the public finite-grade
binding. The public route supplies the data consumed by `YM.Bid.station` from
one selected `Run`; `station` binds A01--A08 to the same hierarchy, response,
Maxwell reference, and interaction. At each grade it chooses one scaling
sequence after taking a finite maximum of the requests. The scale sequence
may depend on the grade and finite test family. The resulting proportionality
constant does not: `YM.Climb.extends_form` compares the gradewise constants by
injective grade inclusion, first above and then below its reference grade.
The later stress normalization is a separate, explicit identification of the
spin response with the same positional scalar and of the reference stress
with the canonical free stress. It is not a consequence of the free
classifier alone.

The finite-test construction does not assert one uniform cutoff over all
grades or all possible tests. At each fixed grade, the tests are finite; the
source first takes the maximum of their finitely many scale thresholds. Grade
uniformity needed for the scalar identity comes from the structural
`extends_form` argument, not from a diagonal choice of one scale working for
all grades. The global configuration statement is then obtained at each
fixed finite word/configuration by the analytic propagation theorem.

## Exact source chain

1. `YM.PhysicalNext.Repeat.Legato.Run.extractible17` in
   `Lean/YM/RG17/Joint.lean` starts from the purchased `Run R`, calls
   `R.bought`, and constructs the single table `S`, final field package, and
   scaling supplier `X`. The local response data are packaged as one
   `Pert.Supplier` `p` with fields `I.p`, `I.Y`, and the same selected `M`.
   This is the actual public caller, rather than a separately selected
   `Bourse` or comparison family.
2. `YM.Bid.station` in `Lean/YM/Bid/Town.lean` receives that same `M,E,I,H`
   and `p.uv`. Its `witnessing` step combines A01, A02, A03, and
   `YM.Outer.miles`; the resulting `Shapes`, `ShellCom`, `Hyper`, and
   transverse conditions refer to `I.p` and `I.Y` on the selected table.
3. In `YM.Bid.pressured`, each grade `d` uses the selector
   `W.lit.cuts` for `M.T.W` and its reference spin structure. For that grade,
   A04, A05, and A06 provide `Watches`. `buysBoth` takes the maximum of the
   finite request bounds in these three records, and `selects` uses
   `ActLaw.connects` to choose one scaling object `X` satisfying their
   conjunction. It is the same `X` for the fitted derivative row, both
   A05 observer limits, and all rows in this grade's A06 selector.
4. `YM.Work.A06.test_aisle` gives the exact identity
   `X.test k s (X.aisle k d q) = X.r k ^ s.m * scaledScene.lens q`;
   `moves_limit` obtains convergence of the finite row map on fixed free
   vectors. `transverse_zero` says the moved rows annihilate the actual
   derivative and `I.p` exactly at every index. This is a common-kernel
   transfer, not an injectivity claim for the free scene family.
5. `YM.Climb.extends_form` in `Lean/YM/Climb/Peaks.lean` combines each
   gradewise `concentrated` statement with nonvanishing of the derivative
   and response. `fixed_kernel` gives a scalar at that grade. For any two
   grades above the reference threshold, `over_peak` compares their scalars
   after raising the lower grade; injectivity of the inclusion and
   nonvanishing force equality. A grade below the threshold is compared by
   raising it to the fixed reference grade. Thus one nonzero real `c`
   satisfies `leaves I.p d = c • leaves V.deriv d` for every grade. The
   scale witnesses themselves need not be common across grades.
6. `YM.Bid.formed` turns that identity into `Crystal`: it normalizes the
   same `I.Y` by `c^{-1}` and obtains the commutation and collinearity
   hypotheses. `YM.Climb.descends` calls `YM.Ward.global` on precisely this
   normalized spin row. Its hypotheses are `DiffPlan.Derivatives`,
   `Crystal.ready.1` (commutation), and `Crystal.ready.2` (collinearity);
   the conclusion is `Still` at every finite arity and every separated
   configuration.
7. A07 is applied to this same `(V,M.T,J,H.spin,M.hT.spin)`. Its free input
   is the sibling Maxwell-data field `M.frames : erases M.hT.spin M.T.W`, supplied by the free
   internal-map theorem. Its separate transfer input is the actual
   `ActLaw` `H.weak` (in the public caller, `p.uv.weak`), aligned to this
   same `M.T` and actual table. `YM.Work.A07.transfer` works at each fixed
   grade on the finite
   dimensional real subspace `Winds`, selects finitely many separating
   rows, and uses fixed-vector row convergence to get eventual injectivity.
   The threshold may depend on the grade. A08 only needs such a threshold:
   `YM.Work.A08.answer` kills the Lie defect above it and uses injective
   grade inclusion to descend the bracket to every grade.
8. `YM.Bid.station` then packages the bracket result into `Commission`;
   `YM.PhysicalNext.Repeat.Legato.Run.extractible17` obtains the station result and passes it
   into `YM.Pert.withFinal`. Its private `attached` proof identifies the
   *same* reference stress: from `hM`, `hK`, and `hJ` it proves
   `(M.T.κ)^{-1} • M.T.J = freeStress`. The final `YM.RG17.supplies`
   application therefore retains the one selected run and the same table
   for both the finite-grade station and the perturbative extension.

## Interfaces checked against the prose units

| Mathematical statement / canonical label | Exact source interface | Binding result |
|---|---|---|
| `thm:free-collinear-scenes` | `YM.Maxwell.Free.scanner` in `Lean/YM/Next/MAXWELL/Scenes.lean`; it returns a finite `Select` and `Ens` for each grade `d ≥ max(N,4)` | Matches `Lighthouse.Goes.cuts : ∃ n, ∀ d ≥ n, ∃ e, Ens e ...`; selectors and row counts may vary with `d`. |
| `thm:free-quiet-classification` | `YM.Maxwell.Free.charges_quiet`, reached via `YM.Maxwell.Free.exposed` and `YM.Maxwell.Free.scanner` | Its filtration is the full condition `A_a(𝒫_k) ⊆ 𝒫_{k+1}` for every `k ≤ d`, with signed/reality/vector conditions and unit annihilation. It concludes one scalar for all axes at each sufficiently large tested grade. The source quiet notion is all separated words of external-label capacity `d`. |
| `YM.Climb.extends_form` | `Lean/YM/Climb/Peaks.lean` | Converts gradewise finite comparisons to a grade-independent scalar using inclusion and nonzero derivative at a reference grade; no common scale witness is assumed. |
| `thm:free-internal-erasure` / `sec:free-internal-ward-erasure` | `YM.Maxwell.Free.erasing` (`Next/MAXWELL/AwayTeam.lean`), supplied to `YM.Work.A07.answer` | The stated alternating two-generator internal-map class matches `Winds`; all rising/inclusion conditions are checked through the cutoff. A07 transports this class through the aligned grade isomorphism. |
| `thm:ward-global-propagation` | `YM.Ward.global` in `Lean/YM/Ward/Axis.lean` | `Still` holds for all finite word lengths, but only at separated configurations, which is exactly A08's domain. |
| `lem:ward-brackets` | `YM.Work.A08.answer` | Produces the bracket for every grade; high-grade erasure plus inclusion-injectivity handles lower grades. |
| `eq:angular-scalar-ratio` and `sec:actual-stress-normalization` | `YM.Bid.pressured`, `YM.Bid.services`, `YM.Bid.formed`; `YM.Climb.Lighthouse.Goes` | The actual scalar `c` is the response/derivative ratio; `κ` is the reference stress coefficient. A05's limits give `c / X.xi → κ` on the selected finite requests. They are not silently identified as equal constants. The same `M.T.J` is later normalized against the canonical free stress in `Joint.attached`. |

The station's actual argument list contains A01--A11 and A13--A17; A12 is
not passed to `YM.Bid.station`. Nothing in this audit treats A12 as a hidden
premise. A14/A15/A17 and the later Lorentz/rotation construction are downstream
of the finite-grade Ward binding and do not supply the free classifier.

## Remaining qualification / risk

This audit validates the object and quantifier joins, not the entirety of the
large theorem. Its conclusion is conditional on the selected `Run` and
`MaxwellData` producer hypotheses already discharged in their own units,
including the Maxwell-data field `M.frames`, finite-window jets, the A04--A06 observer receipts,
the free classifier and free erasure. The prose must preserve their finite
request quantifiers: for any fixed finite list of grades, arities, rows, and
windows, take the maximum requested scale threshold before selecting the
scale. It must not claim a threshold uniform over all grades or all
configurations. The scalar's grade-uniformity is instead the exact
`extends_form` consequence described above.

No mismatch was found between `A01--A08`, `YM.Bid.station`, and the
`Run.extractible17` caller. The remaining proof status is whatever the
independent review records for those supplier units and the public `Run`
construction; this audit does not upgrade their status or assert that the
full Yang--Mills proof has been independently accepted.

## Evidence and checks

- Inspected only the immediate selected route and interfaces:
  `Lean/YM/RG17/Joint.lean`, `Lean/YM/Bid/{Angular,Town}.lean`,
  `Lean/YM/Work/A01.lean`--`A08.lean`, `Lean/YM/Climb/{Beams,Peaks,Tests}.lean`,
  `Lean/YM/Ward/{Axis,Sum,Walk}.lean`, and
  `Lean/YM/Next/MAXWELL/Scenes.lean` plus the declarations named in the
  canonical free-classifier and internal-erasure evidence records.
- Inspected the corresponding prose in `physical-ward-propagation.tex` and
  `physical-ward-free-classification.tex`; parent-owned angular-action and
  stress-normalization labels are treated only at their stated interface.
- No Lean or LaTeX build was run. The only edit is this blueprint audit.
- `git diff --no-index --check /dev/null <this-file>` emitted no whitespace
  diagnostics and returned status 1 because the file is new and untracked.
- `python3 scripts/check_blueprint.py` was run; it stopped because the shared
  `blueprint/units/YM-000026/unit.json` is absent in this draft clone.
- No Lean or LaTeX build was run.
