# C07 review, part 3: Lean correspondence and records

- Scope: Lean correspondence for `packet-estimates.tex`, `activity-jet-assembly.tex` (both changed by PR #96), `packet-annulus.tex`, `itinerary-prices.tex`, `inherited-activity-prices.tex`; and accuracy of the author records `results/C07/{HANDOFF,ledger,findings,actual-gap-correspondence,prior-review-scope,review-index,validation}.md`, `manifest.json`, `chapter-hashes.json` (this reviewer is responsible for the records). Session `schmittj-claude-c07-review-20261113`, reviewer 3 of 3. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; worktree at `e058a61`. Textual inspection only; no Lean build, elaboration or axiom query was run.
- Outcome: the PR #96 packet-eligibility repair matches the source (`Coat.existSeeds`, `Coat.Pack`, `Polar.stock`, `Polar.sectorPass`). Correspondence findings L1-L3 (manuscript) and R1-R6 (records), all INACCURACY or NIT. Every Lean declaration cited by the records for these chapters exists at the stated path.

## Findings, by severity

### L1. `packet-estimates.tex` lines 275-296: the Lean jet theorem is about `Polar.stock`, at the base point, under health. INACCURACY (manuscript; incomplete after PR #96). Same issue as M1/M2 of `part3-mathematics.md`.

`YM.ConnectedActivityE6.Blaze.Silica.Clutch.chimney` (`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Flue.lean`) concludes `Brush j (Packets.income 1 (C*Delay.bill G L x^5) (A.beta*(μ*X.t^2)) Z.shares) 1 (fun v => Polar.stock (vary X (U v)) a A W Ñ (u v) (X.input (worldZ X A.beta w)) k Z) y` under `Works`, `ShellAccess`, `PointCharge`, `Port`, `Mode U y j (p x)`, `Intake`, `Clutch X w a A.beta (q x) y j U u z` (whose field `atV : U y = X.V` fixes the base point), $500\le l$, `1 ≤ Z.shares` and `Healthy (temp X.x) (Z.dome (l*X.B)) X.V`. So: (i) the differentiated function is the stock extension, matching manuscript lines 209-212 but not the symbol $\mathcal P_A$ in \eqref{eq:packet-jet-price}; (ii) the amplitude $\exp\{(Cd^5-\beta\mu\tau^2)n\}$ with scale one matches (`Delay.bill` $=1+B+(\log\beta_F)^2=d$, `X.t = fiery = temp(betaF)` $=\tau$, `Packets.income C s g m = C·exp((s-g)m)`); (iii) the health of the $l B$ dome with $l\ge500$ is a hypothesis of the jet bound itself, used in `Clutch.dinner` (`TowerPower.lean`) through `Polar.sectorPass … .2.1` (exponent identity) and for the absence of flags on the $300B$ dome (`mistB`), not only for identifying the extension with `Coat.Pack`; (iv) the statement is at the base point, so manuscript line 295-296 ("applies separately at every point of the allowed variation") corresponds to re-basing the theorem at points where its hypotheses hold. Requested change as in M1/M2.

### L2. `inherited-activity-prices.tex` lines 218-229: the source differentiates the unmasked `Polar.nest`, identified with `Raw.expo` by `Polar.albedo` only under `Room` and health. INACCURACY (manuscript; pre-existing). Same as M3.

`Polar.albedo` (`Polar.lean`, `include p` with `p : Room P S T X.x`) proves `nest T X.x X.V U R i = expo T X.x R U X.V i` from `Healthy (temp X.x) (space T l X.B R i) X.V`; its proof shows that `expo`'s coarse branch (`pairTail`) carries a `PathData.kept` conjunct on the coarse field, which `twin` (in `nest`/`icicle`) omits. The manuscript's "There is no moving coarse kept-row indicator in this term" is true of `nest`, not of the actual occurrence. The ledger (line 101) states this correctly; the manuscript does not.

### L3. `packet-estimates.tex` lines 111-119: tag-law branches swapped relative to `YM.RG.Patch.frameMass`. INACCURACY (manuscript; pre-existing). Same as M4.

`frameMass C U t = if P.usesMin C U then (card FrameTag)⁻¹ else if t ∈ P.eligible C U then (card (P.eligible C U))⁻¹ else 0` (`Lean/YM/RG/Patch.lean`); `siteMass = card FrameTag · frameMass` (`Sector.lean`). The minimizing branch is uniform on all tags (likelihood exactly one, as `packet-annulus.tex` needs), the fallback branch uniform on the eligible tags.

### R1. `ledger.md` line 59: premise list and role of `Clutch.dinner`. INACCURACY (records).

Quoted: "`Clutch.chimney` (`Flue.lean`) requires `Works`, `Port`, `Mode`, `Clutch`, and health of the enlarged `l*B` seed dome with `l>=500`, plus positive shell parameters, nonempty seed count and the same representation and tags. `Clutch.dinner` (`TowerPower.lean`) handles a zero-germ alternative before deriving closed-mask inequalities." The list omits `PointCharge T x W μ` (the independent core charge, the substantive input), `Intake`, `ShellAccess`, `LocalRatio Ñ`, `Torch η r Q` and the branching patch `D.Branches P.bind G`. The zero-germ case split is performed in `chimney` (`by_cases hh : … =ᶠ[𝓝 y] 0 ∨ Y' = 0 ∨ …`); `dinner` assumes the three non-vanishing conditions as hypotheses and derives the closed inequalities and the value bound from them. Requested: complete the list; say that `dinner` takes the non-zero-germ alternative as hypothesis.

### R2. `findings.md` C07-A7, `HANDOFF.md` lines 12-14, `ledger.md` line 11: health is described as the condition for passing from the stock extension to the physical packet; the source also needs it for the stock jet bound itself, at the base point. INACCURACY (records; consistent with ledger line 59 but not with the framing of A7).

See L1 (iii)-(iv). Requested: add that the stock jet theorem (`chimney`/`dinner`) assumes the same $l B$ health at the base coarse field (`Clutch.atV`), and that manuscript line 295-296 needs the hypotheses at each re-based point.

### R3. Records do not list the M3/L2 manuscript gap. INACCURACY by omission (records).

`ledger.md` line 101 says "This local equality must be supplied before passing the smooth extension back to the original occurrence", but no record says that `inherited-activity-prices.tex` fails to supply it in its text, and `prior-review-scope.md` line 20 / the prior review at `reviews/draft-review.md` line 1048 ("Coarse tail derivatives retain the fixed long selector without differentiating a moving kept-row indicator") did not flag it. Requested: add it as an open finding.

### R4. `validation.md` lines 3-5 and `manifest.json` `author_snapshot`: the author snapshot `35173bd5c8e33a8eaed6e35531739d85ac061aae` is not present in the review worktree's object store (`git cat-file -t` fails), so the statement "The eight revised chapters match author snapshot …" could not be checked here. NIT (records; unverifiable, not shown false). The release `9d11cca…` and base `81538d6…` exist; `81538d6` is the parent of author commit `9f8fa0b`, as stated.

### R5. `ledger.md` line 9: "the lower bound is used for the packet gain and the upper bound for derivative costs". NIT (records). The upper bound $\beta\le2\beta_F$ is also used in the scalar normalization bound and in $\beta E\to0$ (`packet-estimates.tex` lines 97, 162; `dinner` uses `hr.window.2`).

### R6. Paths `reviews/draft-review.md` in `ledger.md`, `prior-review-scope.md`, `review-index.md` are relative to `blueprint/units/YM-000026/`. NIT (records); the file is `blueprint/units/YM-000026/reviews/draft-review.md`. The coordinator's brief also refers to an `outputs.md` in the C07 record directory; no such file exists (not a record error).

## Record claims verified as accurate

`manifest.json` and `chapter-hashes.json`: for all 18 chapters, `current_sha256` equals the file at `e058a61`, `released_sha256` equals the file at `9d11cca4644bad07126bfa372cc85fb120dee7ba`, `changed` is true exactly when they differ (eight chapters, the eight listed in the brief), and the manifest hashes equal the current ones; the five hashes of my chapters equal the coordinator's list. `lean_tree` `328ad19b…` equals `git rev-parse HEAD:Lean` and `9f8fa0b:Lean`. `review-index.md`: matching lines 868 (`packet-annulus`), 1050 (`itinerary-prices`, an editorial entry; the mathematical pass is at line 1038 for an earlier hash, as `prior-review-scope.md` says), 1048 (`inherited-activity-prices`), none for `packet-estimates` and `activity-jet-assembly`; the activity review at `599c7bfc…` is line 1060. `findings.md` C07-A7: `Coat.existSeeds` (`Steam.lean`), `Coat.Pack` (`Revenue.lean`), `Polar.stock` and `Polar.sectorPass` (`Polar.lean`) are exactly as described. Ledger: line 21 (`Cash.supportP = Mixed.foot`, packet branch `A.dome (l*B)`, `Target.buys : 500 ≤ halo`); line 23 (`Utopia.worthy` bounds $\sum$ scales by twice the support charge using cover number at least one); line 17 (`he : 8*o.a*fiery G s L ≤ A/2` is a section hypothesis of `Flux.coterie`, supplied by `Flux.launch`); line 55 (`Coat.annulus` hypotheses and rate $-3/2$; `fosters`, `light_costs`, `Controlled`, `SliceRows.splitF/splitI` exist); line 57 (`Coat.earns` hypotheses, loss `Y·ballCost(200B+1)·spots L`); line 59 first sentence (`steam_prices` hypotheses); line 99 (`Raw.inherit_bills` quantifiers: $4\varepsilon<$ support exponent, $8\varepsilon<$ both widths, threshold on $L$, then $r>-1/2$, $r'$, eventual in $x$, uniform over `Intake`); line 101 (`Polar.albedo` under `Room` and health); line 103 (`YM.RG.Slot.length = walk.length + 4`); line 9 (`Intake.window`, `Intake.sizes`, `betaF`, `fiery`, `radiusB` definitions).

## Lean declarations opened

| Fully qualified name | Path (under `Lean/`) | Matched |
| --- | --- | --- |
| `YM.ConnectedActivityE6.Coat.existSeeds` | `YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Steam.lean` | yes (manuscript l.133-135, records) |
| `YM.ConnectedActivityE6.Coat.Pack` | `…/Revenue.lean` | yes |
| `YM.ConnectedActivityE6.Coat.steam_prices` | `…/Revenue.lean` | yes (value price; no health premise) |
| `YM.ConnectedActivityE6.Coat.ticket_cost` | `…/Revenue.lean` | yes ($Qd^4$ ticket fee) |
| `YM.ConnectedActivityE6.Blaze.Polar.{stock,plumeLog,chalky,crispy,nest,twin,icicle,ember}` | `…/Polar.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Polar.sectorPass` | `…/Polar.lean` | yes (Room, manifest, $l\ge500$, health) |
| `YM.ConnectedActivityE6.Blaze.Polar.{albedo,whereBorn,afterborn}` | `…/Polar.lean` | yes; albedo not reflected in manuscript (L2) |
| `YM.ConnectedActivityE6.Blaze.Silica.Clutch.chimney` | `…/Flue.lean` | partly: object is `stock`, base point, health premise (L1) |
| `YM.ConnectedActivityE6.Blaze.Silica.Clutch.dinner` | `…/TowerPower.lean` | yes; ledger description inaccurate (R1) |
| `YM.ConnectedActivityE6.Blaze.Silica.Clutch` (structure, field `atV`) | `…/Eskim.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Mode` (structure) | `…/Tint.lean` | yes |
| `YM.ConnectedActivityE6.Coat.{measure_g,steamLog,pens,far_bills}` | `…/Steam.lean` | yes (manuscript eq. packet-log-density, $m_\beta$, $N_A$) |
| `YM.ConnectedActivityE6.Mask.{noise,profiles,tickets}` | `…/Mask.lean` | yes |
| `YM.ConnectedActivityE6.Tags.{siteMass,pinMass}` | `…/Sector.lean` | yes |
| `YM.RG.Patch.{frameMass,usesMin,eligible}` | `YM/RG/Patch.lean` | manuscript description swapped (L3) |
| `YM.RG.flags`, `YM.RG.Healthy` | `YM/RG/Masks.lean` | yes (strict chord inequality; health closed) |
| `YM.Pressure.Stores.{place,dome}`, `radiusB`, `betaF`, `temp`, `fiery` | `YM/Pressure/Seeds.lean` | yes |
| `YM.Push.AbsoluteSums.Delay.bill` | `YM/Push/ABSOLUTE_SUMS/Delay.lean` | yes ($=d$) |
| `YM.Push.AbsoluteSums.Packets.income` (`Charge.lean`) | `YM/Push/ABSOLUTE_SUMS/Charge.lean` | yes |
| `YM.ConnectedActivityE6.Coat.t` | `…/Coat.lean` | yes ($=\tau$) |
| `YM.ConnectedActivityE6.Works`, `.Room` | `…/Room.lean` | yes; `fits`/`buys` is a hypothesis (M5) |
| `YM.ConnectedActivityE6.Coat.{Controlled,fosters,light_costs,annulus}` | `…/Annulus.lean` | yes |
| `YM.ConnectedActivityE6.SliceRows.{splitF,splitI}` | `…/Remainder.lean` | exist (statements not read in detail) |
| `YM.ConnectedActivityE6.Coat.earns` | `…/AssignedPrice.lean` | yes ($E=r\,b_{200B+1}s_L$) |
| `YM.ConnectedActivityE6.Intake` (fields `window`, `sizes`) | `…/Intake.lean` | yes |
| `YM.ConnectedActivityE6.Raw.inherit_bills` | `…/Receiving.lean` | yes |
| `YM.ConnectedActivityE6.Cash.supportP`, `YM.Push.AbsoluteSums.Mixed.foot`, `YM.ConnectedActivityE6.Target.buys` | `…/SalesRoot.lean`, `YM/Push/ABSOLUTE_SUMS/Mixed.lean`, `…/OptionCost.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Silica.Utopia.worthy` | `…/Lambent.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Flux.coterie` (and section variables) | `…/Mercury.lean` | yes (health of `H.unionP p`, base point) |
| `YM.ConnectedActivityE6.Blaze.Flux.{FlareW,launch}` | `…/March.lean` | yes (`tents` is a base-point statement) |
| `YM.RG.Slot.length` | `YM/RG/PathActions.lean` | yes |
| existence only: `Foramen.{padjets,wavesP,treasure,debris}` (`Gust.lean`), `Blaze.{canon,plurality}` (`Pedi.lean`), `Pulse.Itinerary.scalar` (`Tax.lean`), `Pulse.Itinerary.{out,quoted}` (`Export.lean`), `Raw.{tail_bills,tail_sale}` (`PathPrices.lean`), `Paths.{duplex,duplex_price}` (`Push/ABSOLUTE_SUMS/Path.lean`), `Raw.{long,pairFoot}` (`Paths.lean`), `Utopia.{stream,ship}` (`Das.lean`), `Meristem.{points,legs,slopes}` (`Orin.lean`), `Utopia.{lengthP,acreage}` (`Lambent.lean`) | E6 directory unless stated | exist at the stated files; statements not compared |

## Not checked

Statements of the itinerary-price declarations (`Pedi`, `Gust`, `Tax`, `Export`) and of the Gaussian-differentiation and warning-moment declarations (`Meristem`, `Utopia.stream/ship`) were not compared with the manuscript beyond existence. `actual-gap-correspondence.md` concerns the actual-row Gram chapter (reviewers 1/2) and was read but not checked against the source. `integration-proposal.json` was not read. Validation claims about builds, checksum manifests and the Jaffard citation were not rerun.
