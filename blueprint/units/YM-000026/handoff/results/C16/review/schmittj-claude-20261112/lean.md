# Review of work package C16: Lean correspondence

- Unit: work package C16 of unit YM-000026 (`blueprint/units/YM-000026/`), author reports in `blueprint/units/YM-000026/handoff/results/C16/`.
- Role: Lean correspondence.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: one Claude Opus reviewer agent, coordinated by a Claude session. Review session `schmittj-claude-c16-review-20261112`.
- Content SHA-256: per file in `README.md`.
- Manuscript files and labels: the seven C16 chapters; the claims compared with Lean are in `statement.tex` and `assembly.tex`, and the source anchors in the author's `correspondence.md` and `findings.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (pinned upstream source under `Lean/`). Textual inspection only: no Lean command was run.
- Review task and PR: issue #57; author PR #86 (commit `3c2ed3b`, merged), reviewed at `81538d6`.
- Outcome: the public statement in `statement.tex` and `assembly.tex` 10–63 is faithful to `YangMills.JointExistence`, and the description of the projection in `ex-conditional-existence` is faithful to `YangMills.jointExistence`. Changes requested only where the mathematics review asks for them (L1 = M1: hypotheses of `ManyCopies.Unites` missing from the chapter) and for minor record corrections (L3, L4). The manuscript itself names no Lean declaration; correspondence lives in the records, as the project requires.

## Findings, ordered by severity

### L1 (GAP, manuscript, pre-existing). `ope-history-service.tex` 131–152 is weaker in its hypotheses than its source

`YM.MergeProof.Ribbons.ManyCopies.Unites` (`Lean/YM/OPE/Replicas/Price.lean` 18–19) is quantified over finite `V`, `slotsZ`, `ι`, positions `o : V × slotsZ → Site f`, weights `r`, insertions `q : ι → Hat (Names V slotsZ) R`, and concludes only under `(∀ i, 0 < r i) → Occupancy (S.ratio.parent ∘ o) N → Offer o q r R.p.B d c' → ∃ F K, ...`. `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN` (`Lean/YM/OPE/Replicas/Sponsor.lean` 44–48) instantiates `N := Q ((P!).J (m+1))`. The chapter's "the compiler ... already permits every finite marker set" omits the occupancy and offer hypotheses on the full product marker set; \(N\) is introduced at 134 without definition. Same finding as M1 in `mathematics.md`; this confirms note (b) on #57.

### L2 (INACCURACY, manuscript, pre-existing). `assembly.tex` 96–117: the Input refers to Definition `ex-reconstructed` only

The public `Reconstructed` also contains `injective`, `covers`, `represents`, `normalized`, `fullSupport`, which `statement.tex` states in 63–73, outside the definition. Same as M4. The proposition's projection is otherwise faithful (below).

### L3 (NIT, records, new). `correspondence.md`, F7 follow-up, cites the pair version of `Unites`

It cites "the singleton `fire j` clause of `YM.MergeProof.Ribbons.Unites` in `Lean/YM/MergeProof/North/Price.lean`". That declaration exists (line 21) but has marker type `Ribbon.Name V` and insertions `Hat (Aged V) R`; the cell-by-slot claim of the chapter corresponds to `YM.MergeProof.Ribbons.ManyCopies.Unites` in `Lean/YM/OPE/Replicas/Price.lean` 18. Both contain the same `fire j` clause and the same occupancy and offer hypotheses, so the F7 conclusion stands. Requested change: cite the many-slot declaration.

### L4 (INACCURACY, records, new). `ledger.md` H3 omits the occupancy and offer hypotheses

As L1, in the ledger row "H3 / ope-history-service ... Arbitrary finite slot sets on cell x slot".

## Public statement: clause-by-clause check of the changed text

| English (file, lines) | Lean | Verdict |
| --- | --- | --- |
| "regular": continuous in \(U\) (`statement.tex` 35–36) | `WilsonRegularity.continuous (N p v x) : Continuous (C.insertion N p v x)` (`ChallengeSpec.lean` 15) | exact |
| invariant under every lattice gauge transformation (36) | `invariant`: for `t : Site → g.image`, `U e ↦ t e.1 * U e * (t (e.1 + Pi.single e.2 1))⁻¹` leaves the insertion unchanged (16–18) | exact (formula not written out) |
| finite stencil \(\Sigma_v\subset\mathbb Z^4\) independent of \(N,p,x\); configurations agreeing on all links with both endpoints in \(x+\Sigma_v\) mod \(P_pD_N\) give the same value (37–40) | `localSupport (v)`: `∃ stencil : Finset (Axis → ℤ), ∀ N p x`, `sites := stencil.image (cast mod (period p * denominator N)) + x`, `∀ U V, (∀ e, e.1 ∈ sites → e.1 + Pi.single e.2 1 ∈ sites → U e = V e) → insertion U = insertion V` (19–22) | exact |
| running condition, uniform in \(p\), "fourth" condition (41–47) | `running : ∃ slope, 0 < slope ∧ ∀ ε > 0, ∀ᶠ N in atTop, ∀ p, |beta N p / log (mesh N)⁻¹ - slope| < ε` (13–14) | exact |
| only the selected point carries a reconstructed theory; others: correlation properties and common OPE estimates; multilinearity not required (81–85) | `root`, `boundary` use `some T.selected` only; `permutation`, `smooth`, `characterContinuity`, `mixture` and `OperatorProductExpansion.remainder` (`∀ s : Option Character`) are the only conditions on other points; `correlation` is a bare function `Option Character → (Fin n → Tag) → Points n → ℂ` (41, 117–143, 70–80) | exact |
| boundary display with \(t_j+i\epsilon h_j\), \(h\) strictly increasing, product of \(f_j(\mathbf x_j,t_j)\), limit \(\epsilon\downarrow0\), \(\langle\Omega,\Phi(A_1,f_1)\cdots\Phi(A_n,f_n)\Omega\rangle\) (115–126) | `boundary (v) (height) (h : StrictMono height) (tests)`: `Tendsto (fun r => ∫ x : Points n, continuation v (complexShift r height x) (spatialPoints x) * tensorTest tests x) (𝓝[>] 0) (𝓝 (vacuumExpectation (toLabel ∘ v) tests))` (139–143); `complexShift r h x i = time (x i) + (r * h i) * I` (99–102); `tensorTest = ∏ i, tests i (x i)` (113–115); `vacuumExpectation = inner vacuum (vector (List.ofFn (labels i, tests i)))`, `vector (l :: w) = field l (vector w)` (`PublicTheory.lean` 113–124), so index 1 is outermost | exact: shift sign, order, product test and limit all agree |
| integral is zero when the integrand is not Lebesgue integrable; no integrability required (127–129) | Bochner integral `∫` (value 0 for non-integrable integrands, `MeasureTheory.integral_undef`); `Reconstructed` has no integrability field; `analytic` gives holomorphy in `z` for each fixed `space` only, so even measurability in `x` is not required | exact |
| target does not specify a lattice formula beyond regularity and convergence, nor a stress-tensor identification (158–161) | `Token`, `insertion` are fields of the existential `WilsonFamily`; `centeredTrace : Field 4` is constrained only by `TraceTest` | exact. "retained by the detailed construction" is consistent with `Headline.TraceExclusions.identified` (`YM/Nonperturbative/HeadlineSpec.lean` 87–91), a conjunct of `constructed`; I did not check what `stressTrace` means |

Unchanged clauses also re-checked: group (`GaugeGroup`, `IsSimple`: nonabelian, every real subspace of \(\mathfrak g\) stable under brackets with \(\mathfrak g\) is \(0\) or \(\mathfrak g\); no connectedness); time-last coordinates and the closed forward cone (`timeAxis = Fin.last 3`, `forwardCone`); lattice data, centred cell (`valMinAbs`), suitability (`tsupport` inside the open cube), smearing (`smear`), `Converges` (one row function, full mesh at every suitable \(p\), then limit along the volume order, eventual suitability); graded fields (`injective`, `covers`, `represents`); phase data (compact metric Borel `Character`, `normalized`, `fullSupport`); `Reconstructed.axioms` (W0–W3), `faithful`, `acts`; `analytic`, `root` (\(z_i=it_i\) at strictly increasing times). All agree with `statement.tex`.

## `assembly.tex`: OPE and trace requirements

| English (lines) | Lean | Verdict |
| --- | --- | --- |
| coefficient bound \(|c|\le r^{\ell-w-\epsilon}\) at small \(r\), uniformly for \(|x_i-o|\le Mr\), \(|x_i-x_{i'}|\ge\eta r\), \(M\ge0,\eta>0\); coefficients independent of the phase (10–27) | `OperatorProductExpansion.coefficients`, `Within` (65–66, 71–73); `coefficient` has no phase argument | exact |
| remainder bound for fixed \(D\), spectators at clearance \(c\), uniform over \(s\) (any character or mixed) and positions; threshold may depend on fields, \(D,M,\eta,c,\epsilon\) (28–40) | `remainder ... ∀ D, ∀ᶠ r in 𝓝[>] 0, ∀ x o y, Within → Clear → ∀ s, ‖grouped s a x b y − Σ_{j≤D} Σ_i coefficient · grouped s ⟨j, actor j i⟩ o b y‖ ≤ r^(D+1−weight−ε)` (74–80); `Clear` (67–68) | exact |
| \(T(r)=S^{\chi_*}_{\Theta,\Theta}((\mathbf0,-r/2),(\mathbf0,r/2))\); vacuum one-point functional vanishes; limit \(3\dim_{\mathbb R}\mathfrak g/\pi^4>0\) (47–57) | `timePair`, `traceTwo` (146–149: time-axis points via `Fin.snoc`, selected character); `TraceTest.centered`, `amplitudePositive`, `shortDistance` with `r^8 * (log r⁻¹)^2` (168–174) | exact |
| exclusion of finite complex combinations of mass-shell tracks, including empty products (58–61) | `excludes (terms) : ¬ traceTwo =ᶠ[𝓝[>] 0] wickProfile terms` (175), `Mode`, `Track`, `wickProfile` (152–166) | exact at the level of the statement; the profile class is C15's |

## `assembly.tex` 119–140: the projection from `constructed`

`YangMills.jointExistence` (`Lean/Solution.lean` 4–10): `obtain ⟨C,_,_,reg,orders⟩ := constructed g hg 1 zero_lt_one`; the public family is `wilsonFamily C` with regularity `reg`; for `p` strictly increasing it forms `a := ⟨.full, ⟨p,hp⟩⟩`, takes `⟨q,S,F,L,Q,M,X,core,_⟩ := orders a`, and returns `q.per` with `hierarchy F Q` and `core : (hierarchy F Q).Properties (a.refine q).per`. `YangMills.constructed` (`Lean/Construction.lean` 15–40) has the penalty fixed before the family (`C.path.levels.clock.kernel.penalty = b`), then `∀ p : Extraction.Order, ∃ q S F L Q M X`, with `Properties` on `(p.refine q).per` as first conjunct, built from `wilsonLimit F Q ordered` where `ordered : (Extraction.Order.mk Extraction.Sequence.full (p.refine q).per).Ordered C S` is the full-mesh conjunct (`HierarchyBridge.lean` 44–56, `WilsonBridge.lean` `fromWilson`).

| `assembly.tex` | Lean | Verdict |
| --- | --- | --- |
| "Fix \(G\) and choose \(b=1\). Select the family ... once" (125–127) | `constructed g hg 1 zero_lt_one`, before `p` is introduced | faithful |
| "Apply the input to the extraction order \((\mathrm{id},p)\)" (128–129) | `a := ⟨.full, ⟨p,hp⟩⟩` | faithful (full mesh as the identity) |
| "It yields \((v,q)\) ... Take \(q\) as the public volume subsequence" (130–131) | returns `q.per`; the mesh component of `q` is discarded | faithful |
| "Its ordered Wilson convergence uses the full mesh sequence by item 1" (132–134) | `wilsonLimit` consumes the full-mesh `Ordered` conjunct, not `F`'s refined order | faithful |
| projected-away conjuncts | `Contacts`, `Ordered`, `PositionsUV`, `Calibrated`, `Independent.Core`, `Headline.Reconstruction`, the actor axioms, `SeparatedOPE`, `NestedOPE`, `TraceExclusions`, contact and perturbative clauses, the penalty equation and `Makes` | not enumerated in `assembly.tex`; not needed there, since the assembly proves the public target from its own Input. The Input is not claimed to be a Lean declaration |

`ex-joint-input` is a manuscript assumption modelled on this structure; it is not claimed to be proved, in Lean or in the monograph.

## Author's source anchors (records)

Existence checked with `grep` for `def|lemma|theorem|structure|abbrev <name>` in the named files; statements read only where stated.

| Anchor (author's `correspondence.md`) | Found | Read |
| --- | --- | --- |
| `YangMills.WilsonRegularity`, `Hierarchy.Reconstructed`, `OperatorProductExpansion`, `TraceTest`, `Properties`, `JointExistence` (`ChallengeSpec.lean`) | yes | in full |
| `YangMills.constructed`, `YangMills.jointExistence` | yes | in full |
| `YM.RG.Supply.Program.exhaust`, `scaled_lower`, `scaled_upper`, `Wait.ready`, `Wait.lead` (`YM/Price/Waits.lean`); `Bar.exists_above`, `Bar.allocated`, `Bar.enters` (`YM/Price/Length.lean`) | yes | `Length.lean` in full; `Waits.lean` 100–240. F2 confirmed: `Bar.exists_above` takes the bar value \(\ge\max(2,P,b,\texttt{W.betaEntry p.first})\) with the delays `W` fixed first; `Wait.ready` pays the first plateau by `Y.ready.trans (hge m)` and the scale entry only when `p.first < A.J (m+1)`; `Bar.bill` equals \(V_j\) of `common-scale-selection.tex` 74–76; periods `4*(M+i+1)` with `M = minLength + sup` of first-plateau bills |
| `YM.Integration.NativeDiagonalClockRequest.envelope`, `PaidRequests`, `eventuallyPaid` | yes | `eventuallyPaid` enlarges `betaEntry` by `exp (exp (envelope F j))` (line 56), as in `common-scale-selection.tex` 145 |
| `YM.Integration.NativePostLengthPayment.StagePaid`, `eventuallyPaid` | yes | in full: `betaEntry := max (V.betaEntry j) (F j)`, payment at every `m` via `hA.pays m` |
| `YM.OPE.haloUnits`, `HaloGate`, `halo_feasible`, `halo_delay` (`YM/OPE/Rough/Gate.lean`) | yes | not read |
| `YM.PhysicalNext.Repeat.Mallow.mingle` (`Mallow/Stove.lean`) and the other N1–N3 anchors | `mingle` yes; others not searched | not read |
| `YM.Integration.NativeComponentRecipe.openBook_of_stagePaid`; `ActualRunNativeComponentRecipe.on_run`, `of_preselection`; `...RG05Joint.allFactorWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction`; `YM.Independent.constructionRun`, `fundedRun`; `Funded.gallery`; `YM.R2IGoals.fromFunded`; `Mallow.Many.warm` | yes (by name in the stated files) | not read |
| `YM.MergeProof.Ribbons.Fibers.{contents,plena,reap,harvest,recomp}` (`YM/OPE/Grouping/Fibers.lean`) | yes | 1–60; F7 confirmed |
| `YM.MergeProof.Ribbons.Unites` (`YM/MergeProof/North/Price.lean`) | yes | 21–24 (pair version; see L3) |

## Lean declarations opened by this reviewer

| Declaration | Path (under `Lean/`) | Extent |
| --- | --- | --- |
| `YangMills.WilsonRegularity`, `Hierarchy` and all its definitions, `Reconstructed`, `OperatorProductExpansion`, `TraceTest`, `Properties`, `JointExistence` | `ChallengeSpec.lean` | full file |
| `Points`, `Site`, `wilsonLaw`, `WilsonFamily`, `mesh`, `place`, `finiteMoment`, `separated`, `suitable`, `smear`, `Converges` | `PublicWilson.lean` | full file |
| `GaugeGroup`, `IsSimple`, `time`, `spatial`, `forwardCone`, `FieldSystem`, `vector`, `vacuumExpectation`, `DomainAxioms`, `AdjointAxiom`, `Faithful`, `WightmanTheory`, `W0`–`W3`, `Axioms`, `PoincareAction` | `PublicTheory.lean` | full file |
| `YangMills.jointExistence` | `Solution.lean` | full file |
| `YangMills.constructed` | `Construction.lean` | full file |
| `wilsonFamily`, `GaugeGroup.coreSimple`, `energy_eq`, `law_eq`, `moment_eq`, `smear_eq`, `fromWilson` | `WilsonBridge.lean` | full file |
| `regular`, `hierarchy`, `wilsonLimit`, `publicOPE`, `publicReconstruction` | `HierarchyBridge.lean` | full file |
| `publicTrace`, `award_eq`, `profile_eq` | `TraceBridge.lean` | full file |
| `Headline.TraceExclusions` | `YM/Nonperturbative/HeadlineSpec.lean` | 84–106 |
| `YM.RG.Supply.Bar.exists_above`, `Bar.bill`, `Bar.allocated`, `Bar.enters`, `Wait.lead` | `YM/Price/Length.lean` | full file |
| `YM.RG.Supply.Program.extent`, `scaled_lower`, `scaled_upper`, `Wait.ready` | `YM/Price/Waits.lean` | 100–240 |
| `YM.Integration.NativeDiagonalClockRequest.envelope`, `eventuallyPaid` | `YM/Integration/NativeDiagonalClockRequest.lean` | `grep` of declaration heads, line 56 |
| `YM.Integration.NativePostLengthPayment.StagePaid`, `eventuallyPaid` | `YM/Integration/NativePostLengthPayment.lean` | declaration heads, `eventuallyPaid` in full |
| `YM.MergeProof.Ribbons.ManyCopies.Unites` | `YM/OPE/Replicas/Price.lean` | 1–40 |
| `YM.PhysicalNext.Repeat.Legato.Bandage.sewedN` | `YM/OPE/Replicas/Sponsor.lean` | 40–57 and namespace heads |
| `YM.MergeProof.Ribbons.Fibers` (`span`, `contents`, `plena`, `reap`, `harvest`) | `YM/OPE/Grouping/Fibers.lean` | 1–60 |
| `YM.MergeProof.Ribbons.Unites` (pair version) | `YM/MergeProof/North/Price.lean` | 21–24 |

## Not checked

No Lean elaboration, build, `#print axioms` or kernel replay. The measure `volume` on `Points n` (a `PiLp 2` of Euclidean spaces) was taken to be Lebesgue measure on \((\mathbb R^4)^n\) without elaborating the instance. The declarations listed above as "not read". Whether the files under `Lean/` match the upstream release beyond the author's manifest comparison (I did not repeat it). The meaning of `stressTrace`, `paper` and `dusk`.
