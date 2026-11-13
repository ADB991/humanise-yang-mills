# Independent review of the C14 local follow-up PR #252

- Unit: YM-000026 (existence monograph), package C14; author response PR #252 (mgubi, session `mgubi-astra-c14-local-followup-20261113`) to the four remaining local comments of the C14 revision-1 re-review in PR #177 (`rereview-revision1.md` at `2e7a9fa7b4b9cbe46e6b38251717a345f5497c36`, lines 20, 22, 23).
- Role: mathematical validity and textual Lean correspondence of the changed hunks only.
- Human reviewer: none. ADB991 has not read this report.
- Agent assistance: Claude (Anthropic), scheduled agent acting for ADB991, session `ADB991-claude-20261113-0425`. ADB991 authored no C14 chapter, not PR #177 and not PR #252.
- Inspected head: `322bbe01215ba0c36ebfa22eb9607ac6087b0113`, base `codex/existence-monograph` at `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.
- Content SHA-256 at the head (each equals the `final` value in the author's `file-hashes.json`):
  - `manuscript/existence/physical-ward-propagation.tex` `ad6c9ea4fdd6fcebba3aaf7536c1c4d6b576359f98d37917a85b905d5a5e3467`
  - `manuscript/existence/actual-stress-shell-nodes.tex` `40925b2e63d69a146204d2c6d6c8bac27d2cd09349a20304237cfdb2f4af5f60`
  - `manuscript/existence/actual-stress-annulus.tex` `14e1f8fbf287364fa80761197f0abb2c5206746468dae0fcdf1bd3185505a0ec`
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (the imported `Lean/` tree).
- Review task: claim https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6863988843.
- Outcome: **no required change.** All four comments are answered correctly. One optional source pointer (O1) and one optional notation point (N1) follow.

## Findings and evidence

### 1. Signed-permutation covariance in `lem:ward-brackets` (re-review line 20)

The lemma now assumes reality, the unit law, compatibility with grade inclusion and, for every grade $d$, every signed permutation matrix $k$, every $u\in\mathfrak{so}(4)$ and every $v\in\mathcal F_d$,
$\mathsf m_k\mathcal Y_d(u)v=\mathcal Y_d(kuk^{\mathsf T})\mathsf m_kv$.

- **Matches the source.** `YM.Bid.A08` (`Lean/YM/Bid/Angular.lean` 76–78) takes `Hyper H.spin V Y`. `YM.Bid.Hyper` (lines 16–20) has exactly four fields: `real` (reality), `inter` (inclusion), `unity` (unit), and `hex d g u v : S.mirror H d g (D d u v) = D d (orients g u) (S.mirror H d g v)` for every `g : Signed`. `YM.Org.orients` (`Lean/YM/Org/Input.lean` 126–130) is `k.ortho.val * u.val * star k.ortho.val`. For a real orthogonal matrix this is $kuk^{\mathsf T}$. `YM.Signed` (`Lean/YM/Space/Index.lean` 23–26) is a permutation of the four axes with independent sign flips, so it ranges over all signed permutation matrices, of both determinants. The new hypothesis is therefore exactly `Hyper`, and no Euclidean covariance beyond it is assumed.
- **Matches the producer.** The formula is word for word Lemma `lem:ward-local-response-laws`(v), second clause (lines 544–546). `cor:selected-ward-package` passes parts (ii)–(v), divided by $c$, to the bracket lemma. Since the formula is linear in $\mathcal Y$, dividing by $c\ne0$ preserves it.
- **Suffices for the proof.** Conjugation by $k$ is a Lie algebra automorphism of $\mathfrak{so}(4)$: $k[u,v]k^{\mathsf T}=[kuk^{\mathsf T},kvk^{\mathsf T}]$. So the defect $D_d(u,v)=[\mathcal Y_d(u),\mathcal Y_d(v)]-\mathcal Y_d([u,v])$ satisfies $\mathsf m_kD_d(u,v)=D_d(kuk^{\mathsf T},kvk^{\mathsf T})\mathsf m_k$. This is the covariance `eq:internal-signed-covariance` of `thm:free-internal-erasure` (`free-internal-ward-erasure.tex` 30–36). That theorem asks for it only at determinant-one $g$, so the lemma's hypothesis is stronger than needed and is available. The other erasure hypotheses (alternating, kills the unit, real, preserves the filtration) follow from the other three clauses, as the proof's last paragraph says. Transfer to the selected table is the finite-row argument just before the lemma, which was not changed.

### 2. Singleton window (re-review line 23, first half)

`physical-ward-propagation.tex` 469–473 now uses the least spectator distance only when $n\ge1$, and any $\rho>0$ when $n=0$. With no spectators a window only has to equal one near $x_0$ and be compactly supported. A bump equal to one on $B(x_0,\rho/4)$ and supported in $B(x_0,\rho/2)$ qualifies. Its gradient vanishes on the open ball $B(x_0,\rho/4)\ni x_0$, so the statement about $U$ and $C_\chi$ that follows holds unchanged. Correct, and it adds no source hypothesis.

### 3. One-step growth input (re-review line 22)

The new display `eq:ex-lattice-shell-growth-input` is
$\phi_iL_i^{D+1}\upsilon_i\le\upsilon_{i+1}$ for every $D$ and every $i\ge\operatorname{ref}(D)$, with $\upsilon_i=\widehat\beta_i^{-\nu_D}$, $\nu_D=g_D+4$ and $L_i=a_i/a_{i+1}$.

- **Source match, checked through the instantiation, not only the structure field.** `YM.MergeProof.Scrim.jump` (`Lean/YM/MergeProof/Biscuit.lean` 33) reads `C.ref d ≤ i → φ i * (C.S.block i)^(d+1) * ζ d i ≤ ζ d (i+1)`. The parameter order is `Scrim C W u ψ φ δ ζ r D`. The caller `YM.PhysicalNext.Repeat.Legato.chaletrail` (`Lean/YM/MergeProof/Inns.lean` 33, 38) and `Almandine.lean` 34 instantiate it as `Scrim … (far a') (waybill a') (near a') (renal a') (fly a') (mutt a' Q) D`. So:
  - $\phi_i$ is `near a' i = sap (hatBeta (i+1))`, which is $\widehat\beta_{i+1}^{-1}$;
  - $\zeta(d,i)$ is `fly a' d i = fog G d (hatBeta i)`, which is $\widehat\beta_i^{-\mathrm{winter}(d)}$. Here `winter G d = degree (frames.level d) + 4` (`Stove.lean` 36–38, `Tender.lean` 11–13), which is the manuscript's $\nu_D=g_D+4$.
  - `YM.Schedule.a m = (denominator m)⁻¹` and `denominator (k+1) = denominator k * block k` (`Lean/YM/Lattice/Scale.lean` 36–38, 99), so `block i` $=a_i/a_{i+1}=L_i$.

  Hence the display is `Scrim.jump` for the selected weights, with the same threshold $\operatorname{ref}(D)$ and no $N,p$ binders. The claim "uniform in the cutoff and period" is correct.
- **Telescoping.** By the line before the march, $0<\phi_s\le1$, and $\upsilon_i>0$. So each one-step inequality can be divided to give $0<\phi_i\le(\upsilon_{i+1}/\upsilon_i)L_i^{-(D+1)}$. Products of inequalities between positive numbers are valid. Since $\prod_{i=k}^{m-1}L_i=a_k/a_m$, this gives $\prod_{i=k}^{m-1}\phi_i\le(\upsilon_m/\upsilon_k)(a_m/a_k)^{D+1}$, as displayed. The next estimate, $\mathsf M_{k,m}(c_m)\le(c_m/\upsilon_k)(a_m/a_k)^{D+1}$, then uses $\upsilon_m\le1$ (from $\widehat\beta_m\ge1$). Correct, and the case $m=k$ (empty product) is included.
- **Status wording.** The text keeps the inequality as an input "retained with the menu and transfer inputs", not proved by `thm:ex-selected-run-service`. This agrees with the re-review's description of that theorem. `prop:ex-lattice-actual-shell-node` assumes "the scale and price gates displayed above", which now includes the new display, so the proposition's hypotheses cover it.

### 4. Empty watch family (re-review line 23, second half)

`lem:ex-lattice-annulus-annihilation` now sets $p_0=0$ when $s=0$, and the proof disposes of $s=0$ first. `lem:ex-lattice-opening-exists` (`actual-stress-annulus.tex` 191–210) opens every reference level at all sufficiently large levels, so some $k\ge\operatorname{ref}(D)$ opens $0$. When $s=0$ the remaining hypotheses (the shell receipt for an empty family, the choice of $q_*$ for $1\le a\le s$) are vacuous, and the conclusion is an empty sum. Correct.

### Optional points

- **O1 (source pointer for the growth input; not a defect).** The source does not leave `Scrim.jump` as an open hypothesis of the run. `chaletrail` (`Inns.lean` 38–39) proves it from the schedule clause `hc : dusk A.delay cost` via `step_paid`/`A.B.valid.pays`. `YM.PhysicalNext.Repeat.Legato.dusk` (`Lean/YM/MergeProof/Apres.lean` 36) contains `sap y * L^(d+1) * fog G d x ≤ fog G d y` for $y=\beta_F(x,L)$ and every $d\le k$. `shower` (same file, 47–52) chooses entry delays so that `dusk` holds, and `cash` (37–46) proves the inequality for all large $x$. In the manuscript's notation the proof is elementary. With $y=x+b$, $b=s_G\log L\ge0$ and $x\ge b$, we have $y\le2x$. If in addition $y\ge2^{\nu}L^{D+1}$, then $y^{-1}L^{D+1}x^{-\nu}\le y^{-\nu}$, because this is equivalent to $L^{D+1}(y/x)^{\nu}\le y$. So the input can be traced to a largeness condition on the selected delays relative to the blocks. That condition is the same kind of schedule choice as the other delay conditions. The author may want to name this producer, or a proposed owner (the schedule/delay chapter), next to `eq:ex-lattice-shell-growth-input`. Whether the manuscript's selected schedule already contains such a clause was **not** checked in this review.
- **N1 (notation).** In `lem:ward-brackets` the hypothesis uses $u\in\mathfrak{so}(4)$ and $v\in\mathcal F_d$, while the conclusion uses $u,v\in\mathfrak{so}(4)$ for the bracket. The meaning is clear from context, but a different letter for the field (for example $w\in\mathcal F_d$) would avoid the clash.

## Required changes and remaining uncertainty

None required. Not covered:

- No Lean elaboration. The source was inspected as text only; Mathlib hosts are blocked from this environment.
- No combined build with PRs #216/#227. The author reports that `git apply --check` passes; that was not repeated here.
- Not reviewed: the separate chart/curve response under claim https://github.com/hairer/humanise-yang-mills/issues/55#issuecomment-6863807502, the record slips listed at re-review line 24, and whole-C14 closure.
- This review does not discharge the growth input, the chamber receipt or any other retained input.

## Evidence (commands actually run)

- `git fetch origin pull/252/head:pr252`, then `git diff origin/codex/existence-monograph...pr252` (7 files, +110/−6). `git merge-tree --write-tree origin/codex/existence-monograph pr252`: merges cleanly.
- `sha256sum` of the three chapters at `pr252`: the values above, equal to the author's recorded final hashes.
- Build of the full monograph at the head, in a separate worktree: from `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex`. Exit 0, 982 pages, no undefined references. The only warnings are the existing amsmath `\atopwithdelims` warning and the existing 1.83pt overfull box at lines 39–47.
- Rendered at 80 dpi with `pdftoppm` and inspected pages 849 (growth display), 857 (annulus lemma and empty case), 880 (window) and 886 (bracket lemma). All legible, with no clipped formulas.
- `python3 scripts/check_blueprint.py` on this report branch: see the PR body.
- Source files read: `Lean/YM/Bid/Angular.lean` 16–24, 70–78; `Lean/YM/Org/Input.lean` 126–130; `Lean/YM/Space/Index.lean` 23–35; `Lean/YM/MergeProof/Biscuit.lean` 29–36; `Lean/YM/MergeProof/Inns.lean` 25–60; `Lean/YM/MergeProof/Stove.lean` 36–40; `Lean/YM/MergeProof/Tender.lean` 11–14; `Lean/YM/MergeProof/Apres.lean` 36–52; `Lean/YM/Lattice/Scale.lean` 23–40, 99.

## Acceptance

Agent review only. A human reviewer must take responsibility for accepting these deltas. Any later edit to the three chapters changes the hashes above and requires renewed review.
