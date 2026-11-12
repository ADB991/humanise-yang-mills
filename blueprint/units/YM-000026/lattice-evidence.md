# Lattice construction evidence (draft)

- Canonical unit: YM-000026, issue #26.
- Status: draft; both Lean-correspondence and mathematical review pending.
- Manuscript: [`manuscript/existence/lattice.tex`](../../../manuscript/existence/lattice.tex), labels `sec:ex-lattice`, `prop:ex-lattice-gauge`, `rem:ex-lattice-open`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` from `source/upstream.json`.
- Contributor: lattice-draft agent session `hairer-codex-existence-lattice-20261111`; parent agent owns integration.

## Scope and notation

The prose uses the shared entries in [`blueprint/glossary.md`](../../glossary.md):
`G ⊂ U(r_G)`, `P_p`, `D_N`, `a_N=D_N^{-1}`, `\ell_{N,p}=P_pD_N`,
`\beta_{N,p}`, and the public Wilson family `\mathcal W`. The local symbols
`\ell`, `\Lambda_\ell`, `E_\ell`, `S_\ell`, `H_G`, `\rho_\ell`, and
`Z_\ell` mean respectively the site count, periodic four-torus, positively
oriented links, plaquette action, probability Haar law, product Haar prior,
and partition integral defined in the manuscript. RG scales `q_j`, RG clock
`\chi(k,i)`, weights `w_i`, level outputs `\Phi_{N,i}`, and limiting kernels
`F_i` are local to the quoted flat-sector interface. In particular `q_j` has
not been identified with public mesh `a_N`.

## Source correspondence

All paths below are relative to the pinned imported source tree `Lean/`.

| Manuscript claim | Fully qualified declaration(s) | Path |
|---|---|---|
| Gauge group and real simplicity input | `YangMills.GaugeGroup`, `YangMills.GaugeGroup.IsSimple` | `Lean/PublicTheory.lean` |
| Public periodic sites, links, plaquette, action, Boltzmann law | `YangMills.Site`, `YangMills.Configuration`, `YangMills.plaquette`, `YangMills.wilsonEnergy`, `YangMills.wilsonLaw` | `Lean/PublicWilson.lean` |
| Public family, mesh, placement, moments, smearing, two-stage convergence | `YangMills.WilsonFamily`, `YangMills.WilsonFamily.mesh`, `.place`, `.finiteMoment`, `.smear`, `.Converges` | `Lean/PublicWilson.lean` |
| Actual internal Wilson action and normalized law | `YM.Wilson.energy`, `YM.Wilson.energy_nonneg`, `YM.Wilson.prior`, `YM.Wilson.bare`, `YM.Wilson.partition`, `YM.Wilson.partition_pos`, `YM.Wilson.law`, `YM.Wilson.moment_formula` | `Lean/YM/Wilson/Law.lean` |
| Face holonomy gauge covariance | `YM.Lattice.faceValue`, `YM.Lattice.face_gauge` | `Lean/YM/Lattice/Faces.lean` |
| Link gauge transform and path holonomy covariance | `YM.Lattice.gauge`, `YM.Lattice.GaugeInvariant`, `YM.Lattice.travel_gauge` | `Lean/YM/Lattice/Path.lean` |
| Gauge-invariance of finite energy and bare weight | `YM.Wilson.energy_gauge`, `YM.Wilson.bare_gauge` | `Lean/YM/Wilson/Law.lean` |
| Probability normalization of the finite internal law | the `IsProbabilityMeasure` instance immediately following `YM.Wilson.law`, using `YM.Wilson.partition_pos` | `Lean/YM/Wilson/Law.lean` |
| Public/internal action, law, moment, smearing and convergence bridge | `YangMills.energy_eq`, `.law_eq`, `.moment_eq`, `.smear_eq`, `.fromWilson` | `Lean/WilsonBridge.lean` |
| Insertions' gauge invariance and local stencil in theorem hypotheses | `YangMills.WilsonRegularity.invariant`, `.localSupport`, `YangMills.WilsonRegularity.running` | `Lean/ChallengeSpec.lean` |
| Internal family construction data and `Makes` obligations | `YM.Family`, `YM.Family.Makes`, `YM.Family.invariant` | `Lean/YM/Source/Construction.lean` |
| Existence of a funded run attached to the native component recipe | `YM.Independent.constructionRun`, `YM.Independent.fundedRun` | `Lean/YM/Independent/ConstructionRun.lean` |
| Run selector and its broader actual outputs | `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric` | `Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean` |
| Three native recipe inputs and length/payment interfaces | `YM.Integration.NativeComponentRecipe.Choice`, `.available`, `.floor`, `.numeric`, `.post`; `YM.Integration.ActualRunNativeComponentRecipe.Attached`, `.on_run`, `.of_preselection` | `Lean/YM/Integration/NativeComponentRecipe.lean`, `Lean/YM/Integration/ActualRunNativeComponentRecipe.lean` |
| First quantitative flat-sector estimate | `YM.RG08.Flat.Quorum`, `YM.RG08.Flat.entrance_gate` | `Lean/YM/RG08/Flat/Entrance.lean` |
| Quadratic and dual recipe inputs | `YM.RG08.Gallery.Sworn` (in `Lean/YM/RG08/Gallery/Call.lean`), `YM.RG08.Aura.licensed`, `YM.RG08.Aura.dual_support` | `Lean/YM/RG08/Gallery/Call.lean`, `Lean/YM/RG08/Aura/Publisher.lean` |
| Detailed public construction theorem, which is beyond the selected-run interface | `YangMills.constructed` | `Lean/Construction.lean` |

The manuscript gauge-invariance proof is newly organized in elementary matrix
language. Its formal counterpart is also explicit in `YM.Lattice.face_gauge`
and `YM.Wilson.energy_gauge`; the bridge `YangMills.energy_eq` identifies the
public and internal action sums. The public definition itself does not prove
that an arbitrary insertion token is gauge invariant: the relevant condition
is separately required by `YangMills.WilsonRegularity.invariant`.

The finite normalization argument is newly organized from compactness,
continuity, positivity, and the integral formula. The internal proof is in
`YM.Wilson.partition_pos` and the probability-measure instance on
`YM.Wilson.law`; `YangMills.law_eq` transports that law to the public
definition. The manuscript does not cite the Lean proof as a mathematical
reference.

The flat-sector displayed bound is a faithful reorganization of
`YM.RG08.Flat.Quorum.approximates`; the frame bound and pointwise limit are its
`frames` and `converges` fields. The actual supplier is produced by
`YM.RG08.Flat.entrance_gate`, after a compatible level, sufficient horizon,
price system, delay and block-length floor are supplied. I inspected the
statement and immediate proof body, but did not trace the theorem's imported
proof infrastructure or independently derive the estimate. No claim is made
here that the RowCost estimate is proved by this prose.

## Literature and editorial decisions

The shared literature directory contains only its README and the unrelated
SU(2) simplicity note; no accepted lattice-construction result is available
there. A targeted web search located Kenneth G. Wilson, “Confinement of
quarks,” *Physical Review D* 10 (1974), 2445–2459,
[DOI 10.1103/PhysRevD.10.2445](https://doi.org/10.1103/PhysRevD.10.2445).
The APS result inspected was the abstract/metadata, not the full paper. It is
therefore used only as historical context, and no theorem, continuum limit, or
RG estimate is attributed to it. The elementary finite gauge-invariance and
normalization arguments are proved directly in the manuscript.

No source-specific nickname is used as a mathematical assertion. The public
Wilson family is kept distinct from internal `YM.Family`; the public mesh
`a_N` is kept distinct from the internal RG scale `q_j`; and the public
coupling `\beta_{N,p}` is kept distinct from the positive blocking penalty
`\lambda_{\rm ker}`.

## Open obligations and limitations

1. Unpack `RowCost`, `clock`, the output map and the scale sequence enough to
   establish the quantitative estimate from its mathematical RG hypotheses.
2. Prove or cite the quadratic supplier `YM.RG08.Gallery.Sworn`, dual supplier
   `Aura.licensed`, and Redo/Yamen length and payment estimates, checking each
   hypothesis on the selected same `Run`.
3. Prove the bridge from the RG trajectory and finite-volume insertions to the
   public smeared Wilson moments, including the correct scale conversion,
   uniformity, and mesh-then-volume order of limits.
4. The selected-run theorem alone does not state the public hierarchy. The
   detailed theorem `YangMills.constructed` and its full dependencies need a
   separate exact proof map and mathematical exposition before they can support
   the advertised existence conclusion.
5. No fresh Lean build, axiom audit, LaTeX build/render, or independent review
   was run in this bounded draft. The finite proof is ordinary mathematics;
   source correspondence is based on inspection only. The required
   `python3 scripts/check_blueprint.py` command was attempted and failed because
   the bounded output does not include the unit metadata file required by the
   checker. The permitted outputs for this session are only this evidence file
   and the LaTeX section. `git diff --check` completed successfully.

## Inspection and command evidence

Commands actually run in the isolated clone included:

```text
pwd && git status --short && sed -n ... CONTRIBUTING.md docs/coordination.md docs/proof-standard.md
cat docs/notation.md && cat blueprint/glossary.md && sed -n ... blueprint/background/README.md
sed -n ... Lean/PublicWilson.lean Lean/WilsonBridge.lean Lean/YM/Independent/ConstructionRun.lean
sed -n ... Lean/PublicTheory.lean Lean/YM/Source/Construction.lean Lean/YM/Extraction/LatticeFamily.lean
sed -n ... Lean/YM/Wilson/Law.lean Lean/YM/Gauge/MatrixGroup.lean Lean/YM/Lattice/Faces.lean
sed -n ... Lean/YM/Integration/ActualRunNativeComponentRecipe.lean Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean
sed -n ... Lean/YM/Integration/NativeComponentRecipe.lean Lean/YM/Integration/RG05Preconstruction/PeriodConstruction.lean
sed -n ... Lean/YM/RG08/Flat/Entrance.lean Lean/YM/RG08/Aura/Publisher.lean Lean/YM/RG/History.lean
rg -n '...' Lean/PublicTheory.lean Lean/YM/... (targeted declaration/path searches)
```

The targeted primary-source search and result were described above. No full Lean
tree was read. No Lean or LaTeX build was run. Commands in this record are
representative descriptions of the actual bounded reads; exact shell history is
available from the contributor session, but output logs were not saved.
