# OPE construction correspondence (draft)

Source revision: 3456e5e75cf8d4cd558955a5c7638fba2d68f464.
Parent author: hairer-codex-existence-20261111.

## One prescription

`ope-prescription.tex` follows full reads of
`Lean/YM/OPE/Splitting/{Basis,Needle,Legacy,Detector}.lean`. Principal
declarations are `YM.OPE.reachReads`, `YM.OPE.Prescription.startRows`,
`nextRows`, `chosen`, `highVan`, `reading`, `ope`, `insertOne`.
The proof preserves finite dual spanning by actual correlation tests, the
corrected quotient lift S-RBS, old/new biorthogonality, freezing both needles
and test combinations, and the relative-origin separated raw evaluation.
Independent review passed b332b2c3cd21bc6224659e9f1452b8c37a81a451e907f94728ab5ecdbdd4bd78.

## Covariant homogeneous coefficients

`ope-homogeneous.tex` follows full reads of
`Lean/YM/OPE/Orbits/{Port,Spin,Average,Real,Cuts,Fresh,Stars,System}.lean`.
Principal declarations: `compact_dock`, `smooth_orbit_row`, `averageV`,
`average_fixes`, `average_rotation`, `checkReal`, `checkReal_fixed`,
`Reader.liftOne_affinity`, `knife_apply`, `reconstruct`, `kills_lower`,
`knife_mem`, `fresh`, `rotate_knife`, `real_knife`, `basis_exists_c`,
`Reader.assemble`, `filtered_packet`, `packet_read`.
It proves orbit-open/smooth Haar averaging with input/output rotations,
conjugation averaging, fixed singleton and inclusion maps, recursive exact
homogeneous projections, invariant complement spaces, real channel bases,
and packet/truncation identities. It does not yet prove quantitative errors.
Independent local review passed SHA256 621f8e99c7f2dce813333c8fbe022cfabef7f47a457ada36e707f08aab62b7e7.

All machine review fields remain null. No complete OPE or construction
assertion is inferred from these finite-dimensional arguments.


## Quantitative transfer to homogeneous coefficients

`ope-estimates.tex` follows the fixed-exterior specialization a=1, b=c=0
of `Exchange/{Arrangement,Regime}.lean` and
`Orbits/{Quotes,Clearance,Rent,Receipts,Fee,Gain,Separated}.lean`, with the
rate definition in `Rate.lean`. It proves the rotated finite-test error
identity, bounded-label finite-basis extension, uniformity over rotations,
conjugated comparison with J H_D, projected-shadow bridge, higher-degree
coefficient estimate and exact raw-plus-correction remainder. A violating
sequence proves uniformity over geometry and phases. The raw coefficient,
full discrepancy and separated spectator estimates remain explicit inputs.
Independent local review passed SHA256
6ffbdcd702e5b097338182750dbf8af81fef644628e72f899bd98acffcfe0760.

Next producer reads: `Schemes/{Travel,Rearrange,Corridor}.lean` and
`Interpolate/Education.lean`; the source first proves estimates on a fine
grid (`Schemes/Ladder.lean`), extends them by derivative-controlled
interpolation, then lets the intermediate logarithmic scales approach the
cluster scale. This producer is not yet proved by the preceding chapter.


## Grid matching and grading interpolation

`ope-grid.tex` is an author draft of the fixed-clearance exterior specialization
of `Schemes/{Read,Ladder,Corridor,Travel,Rearrange}.lean`,
`Interpolate/{Chart,Leap,Corridor,Education}.lean`,
`Eye/{Cloud,Extract,Remit}.lean`, and `Height.lean` (full reads).
It proves selection of logarithmic mesh levels under Gentle, coordinate-generic
rounding via residues (empty forbidden set), stability of the scale corridor,
channel estimates from a lower-filtration approximation, finite high-horizon
remainder decomposition, descending induction through derivative grades, and
removal of intermediate-scale losses. It preserves the source's grid-to-all-point
route, rather than assuming an arbitrary-point matching estimate.
Principal declarations: `YM.OPE.found`, `YM.OPE.Cloud.screened`,
`YM.OPE.cloud_jump`, `YM.OPE.at_grade`, `YM.OPE.det_cost`,
`YM.OPE.grid_coeff`, `YM.OPE.grid_remainder`, `YM.OPE.leap_cost`,
`YM.OPE.interpolated`, `YM.OPE.common_rate`, `YM.OPE.early_rate`.
Actual cutoff matching, filtration-distance and rough correlation production
remain explicit inputs. Independent local review passed current SHA256 7aa64011922fc4318f6f13a542187a0865afeb2ebed19792b4069f4b5857b98b.

Further full producer reads: `Columns/{SectorCost,Limit}.lean`,
`Prices/{Circuit,Space}.lean`, and `Sweep/Camp.lean`.
`for_plot` selects a SAME-match sublimit from `PriceAt`; `at_grade` relies on
`Columns.limit_cap`, not a bare-vector low-subspace assertion.
`funding` calls `ManyCopies.joins`, which uses `Ballet`, `Created.bridge` and
`bequeathed`. These substantive estimates are not discharged by rate arithmetic.
Guessed files Prices/{Data,Bound,Budget}.lean do not exist and were not read.

## Centered prices and physical filtration, 11 November continuation

`ope-phase-prices.tex` supplies two-scale mixed planted estimates, simultaneous coarse/fine origins (explicit finite residue counts and 10/6 room constants), integer even replicas, moving-label finite-cutoff limits, ground-algebra even moments and full-support phase bounds, generic spectator approximation, engineering rates with 0≤a≤b, and transfer of the entire matched discrepancy. Fully read sources at the unit pin: `YM/OPE/Cards/{Literal,Scale,Mix,Pressure}.lean`, `YM/OPE/Eye/{Fleeting,Admire,Civic,Fast}.lean`, `YM/Work/B17.lean`, and `YM/Work/B15.lean` for address/span conventions. Independent stronger-agent local pass at SHA256 `09ad65853eda7485300a4d2d5a4ed60f0cd907bb4b7bfb89c8674a17a3b3d17b`. Requires actual centered bound and finite-cutoff matched label/price; it does not produce them.

`ope-filtration.tex` is a new draft, pending independent review. It proves the low-coordinate cone and transverse bound, repeated plane cancellation, reference-distance estimate with exponent d−e−1, compact normalized-test identification, and resulting physical-filtration distance/rate. Fully read: `YM/OPE/Columns/{Accounts,Cone,Plane,SectorCost,Reannounce,ExtensionCost,Limit}.lean`, `YM/Dash/Limits.lean`, `YM/Bid/Drops.lean`, `YM/Push/RELAY_DIFFERENCE/RawTop.lean`, and `YM/MergeProof/Portions.lean`. Qualified central declarations: `YM.OPE.Columns.step_expand`, `step_transverse`, `quotient_issue`, `limit_cap`, `whole_origin`, `fare_rate`, `reannounce`, `limit_lower`; `YM.OPE.Columns.ExtensionCost.matched`; `YM.Dash.brace`. Source read via `cat`/`rg`; no Lean compilation or axiom replay. An exploratory glob `Lean/YM/Push/RelayDifference*` failed (actual directory is uppercase `RELAY_DIFFERENCE`); subsequent exact files above were read.

Remaining physical-identification inputs are explicit: calibrated triangular columns; column/coupling subpower costs; local protected-trial comparison `YM.MergeProof.onions` through `persists`/`served_dollar`; relay projections and null-test comparison; the actual finite match. The article does not identify bare low coordinates with the physical filtration by definition, nor assume convergence of the transport matrices. Shared literature notes supply no precise replacement for this source-specific transport; finite-dimensional linear algebra and compactness are proved directly.

Filtration local review passed after adding explicit divergent level/time hypotheses, nonnegative logarithmic scales, and cutoff-dependent purchased derivative orders/powers/thresholds. Frozen SHA256: `de3eb826e348a10fddb6b7be08e73f63389296209fb670f4987a9df91ae77255`. The added D01/D02 arguments were checked against the fully read `YM/Work/D01.lean` and `YM/Work/D02.lean`; they discharge bounded-reference bare subpower cost and the separated-bound-to-smeared-discrepancy step. Actual calibration and local comparison/projection production remain.

New `ope-cutoff.tex` draft follows `YM.MergeProof.Ribbons.ManyCopies.net_select`, `inductionLive`, `Ballet`, `joins`, `YM.OPE.funding`, `YM.OPE.height_room`, and `YM.OPE.price_plot`. Fully read `YM/OPE/Sweep/{Net,Join,Induct,Step,Winter,Ballet,Camp}.lean`, `YM/OPE/Prices/{Stock,Hall,Circuit,Space}.lean`, `YM/OPE/Eye/Remit.lean`, and `YM/MergeProof/South/{Merman,Commune,Mode,Celery}.lean`. A guessed `Prices/Cost.lean` read failed; no evidence is attributed to it. Geometry, compensated weight induction, uniform subpower allowance, exact terminal exponents, opened scale, and same-filter label extraction are proved. Analytic local representation/merger/projector and reference-comparison estimates remain explicit inputs. Review requested.

Next bounded producer reads (fully read so far): `YM/OPE/Grouping/{Replicate,Birth,Charge,Wiring,Care,Papyrus,Shift,Stator}.lean`, and `YM/MergeProof/North/Palate.lean`. Grouping requires a fiber-size penalty in nonquiet reweighted activities; quiet activities pay no such halo. Planned proof must preserve exact reaped polynomial and symmetry on every focused mode, not just singleton outputs.

## Continued local grouping and singleton proofs, 11 November

At source pin 3456e5e75cf8d4cd558955a5c7638fba2d68f464, read the complete finite regrouping sources `Grouping/{Fibers,Dew,Gush,Sugary,Stained,Ebb,River}`, `Further/SHELL_BIRTH_49/Fusing/Coal`, `North/Dew` and the defining `Accent` interfaces. The resulting `ope-grouping-algebra.tex` proves the coefficient bijection, vacuum retention and covariance; this is separate from analytic projection. Independent local conditional passes: grouping hash 9c04100186186b48f2610b9ac9c7fc940b09a6ad25e0f1fba655d4bb84048211; grouping algebra 118058d63807ff051928347e71b539f1e9313852c1f7801807a8b63cda284390; cutoff 68eee7274a5ac6780fb898b87752fe80c60ba0ce8088205c88f8e9002a7c325f. The cutoff review required the explicit cross-cell separation proof now included.

`ope-singletons.tex` (sec:ope-singletons) follows `YM.MergeProof.Ribbons.plume`, `YM.MergeProof.Ribbons.pinch`, `sprouts`, `socket` in `North/{Arbor,Frost}.lean`; the meaning of local representation is `YM.MergeProof.Float.Blade` in `North/Blade.lean`, and its real/imaginary construction is `petals`/`pillars` in `North/Loon.lean`. Read all of these files, plus `Dock.lean` (Arsenal), `Hens.lean` (coin, play, beach, plank), `Accent.lean` (restore, Served), `Grant.lean` (stage0 and stageR), `Stretch.lean` (coefficient truncation and repricing), `North/{Verve,Anise}.lean`, and `OPE/Replicas/Arbor.lean`. The last confirms arbitrary finite slots, not just two per cell. Elementary finite polynomial algebra and weighted sums are proved directly; no literature substitution is asserted. Shared background README was searched first.

This discharges singleton extraction after regrouping conditional on the precise unused-slot inventory, background validity, and already obtained support prices. It does not discharge the analytic local projection or the actual transition supplier. Those remain substantive work. No Lean source edits/build or renewed axiom replay.

## Shared local transfer and coefficient-field consumer

Singleton local conditional pass frozen at SHA256 38f846d42a399c17f1b39394ed9ae0aa93d6d3a0e09d4cde656dd8ccdeab1f9e.

`local-transfer.tex` follows `YM.MergeProof.Accent.Duty.pre` (Temper) and `YM.MergeProof.Menu.stroke` (Copse). Read these complete files, then `Plaza`, `Cargo`, `Decaf`, `Castle`, `Dock`, `Fruit`, `Heap`, `Close`, `Garnish`, `Sigil`, `Vale`, `SpreadR`, `Click`, `Gallery`, `Tongue`, `Memo`, `Ballad`, plus `Extra/MULTISOURCE_BOUNDS/Root` (root_hit). The chapter proves the occupancy-to-site conversion, finite same-slot compression, T+exp(T)T inventory bound, response-closure identity and connected-support bound, reweighting and the actual Duty specialization. The stronger reviewer requested explicit unweighted-fare definition, integrability hypotheses before commuting linear maps with integrals, and component flag completeness; all applied. Analytic `Volant.reserves` and quote operator properties remain displayed inputs.

`ope-local-projection.tex` follows `YM.MergeProof.tossing` (North/Shasta), finite specialization of `coupons`/`Gig.all_in` (Sonata; summable remainder construction in Montage), `YM.MergeProof.Ribbons.fuseNext` (North/Lamplit), `crescent` (North/Elders), and `YM.MergeProof.Ribbons.ManyCopies.Live.winter`/`ripe` (OPE/Sweep/Winter). All read in full. It proves finite extension of elementary projection, copy covariance, singleton identification, terminal weight z/(16x) and physical price a_next^d*4x/z. Elementary `Throws` projection estimate remains a substantive input, not supplied by this consumer proof.

Supplier navigation inspected `North/Freckles`, `OPE/Loom/ExtraDelays`, `North/Morsel` and Graces/Aspire. `Bandage.wise` gets Arsenal from actual HasSlots; `sewed` gets Unites from Many.vast; `thaw` gets Runs and Throws from Many.warm and Graces.respects; ExtraDelays.further improves the allowance to hatBeta(m+1) via Subsidize. These are inspected supplier links, not yet complete prose proofs of their analytic content. Parent/centered author share sec:local-transfer; lattice author notified of supplier seams.

Local transfer conditional pass hash 42ccf5ebb31aa2d9b9d189fb8db8257277906c2af5ae88b5807f854921970d97; local projection conditional pass hash 55db2f7c2fe260fc22b23d80ac72bd566343b0cf73d6e579d918995fa36c7e53. These passes establish consumer arguments only.

`reference-cone.tex` proves the actual numerical matched-error cone and gain from `YM.Work.G09.answer`, its local size/cone lemmas, and the definitions `YM.Bid.direction`, `Bank`, `roomCost`, `Duet.Woke`, `gainChart` in Bid/Loan. Read Work/G09 and Bid/Loan in full; read Brioche in full for `YM.MergeProof.diet`. Independent reviewer requested removal of the unneeded claim that the mark weights decrease; applied. Also inspected Antilles (actual signed difference construction consumer), South/{Commune,Mode,Celery,Merman,Wakes,Lens} for the next matched-reference stage. No inference of direction from separate unsigned costs.

## Signed reference completion and local projection continuation

Parent inspected `Work/G09`, `Bid/Loan`, `Brioche.diet`; `Accord.acclaim`,
`Antilles.eaves/antilles`, `Extra/SOURCE_HISTORIES` and Counterpair.originate;
full `South/{Commune,Mode,Celery,Merman,Sand,Wakes,Lens,Rapt,Hearth,Block,Loft,Bus,Sight,Lush}`,
`Push/GRID_APPROXIMATION/Joint`, Caprese.toasted and Maid.hull/tendrils.
These support `reference-cone.tex`, `reference-difference.tex`, `reference-match.tex`.
The actual +5 Vault(2,1) reference price is separate from centered +6.
The scale interval is ref(d)≤m≤k<N and all paths use the same N/history;
conjugating copies conjugate portfolio coefficients. The full mixed join and
room-dependent product identity are preserved; transfer multiplicativity is
not inferred. Independent local passes are recorded in reviews/draft-review.md:
cone e240a87f8acc898d50ac364ed7a884b91629cbf083d16049bd4dacf0c405af6a;
difference cd94054fa77810c56b5f6838986b93a9b4fcf93a4182fe044b807cdce4ad854a;
match f95a52249ed63a5d93479ee1484781fb88bedf42a7389cef1dd49bcc705eaf94.
Further local projection/source-section details are in local-projection-evidence.md.
