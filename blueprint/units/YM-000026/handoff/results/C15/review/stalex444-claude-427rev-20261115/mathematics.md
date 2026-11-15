# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded renewed review of the #427 revision of `subsec:ex-lattice-firesky-witness`, for #392.
- Role: mathematical validity
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): three reads of the revision (M1–M3 against the findings of #426, with a re-derivation of the revised chamber and solves lemmas; every other changed line of the gallery and the receipt; the author note, the erratum, the PR body and the handoff against the diff), one check script, and, for each point these reads and the Lean read raised, one independent re-derivation and one author's-advocate refutation, consolidated against the source lines. Agreement between agents is not offered as evidence; each item states what was checked.
- Content SHA-256: per-file SHA-256 in `hashes.json` (gallery `d2054838…`, receipt `4eeb6180…`, author note `229e3fbb…`, #397 record `ff09187a…`, all at `dae5af1f`). The gallery is in the YM-000026 manuscript list; no unit fingerprint was computed at `dae5af1f` (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-firesky-gallery.tex`, `subsec:ex-lattice-firesky-witness` (l.78–365 at `dae5af1f`; the next subsection begins at l.366); `manuscript/existence/trace-rounded-receipt.tex` (l.22–24, l.254–296); the author note `results/C15/author/hairer-claude-426resp-20261115/README.md`; the erratum of `results/C15/author/hairer-claude-392clock-20261114/README.md` (l.31–33). Interface passages read: rank chapter (l.75–200, l.316–326, l.400–437), rank-root (l.255–405), `common-scale-selection.tex` (l.1–120), `trace-rounded-comparison.tex` (l.45–90, l.228–240, l.332–352), allarity (l.755–766), `existence.tex` (`\input` lines); rank-root and allarity at `08222954`, then the head of draft #411, at the lines cited.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; manuscript at commit `dae5af1f` (PR #427, on `codex/existence-monograph` @ `1e511906`).
- Review task and PR: #392; reviewed PR #427 (commit `dae5af1f`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies; no required change. M1, M2 and M3 of #426 are resolved. M4–M6 and L15 are resolved, and the other changed lines are correct. Two Minor wording points on the revision (R1, R2) and one remark (R3).

Line numbers are those of the files at `dae5af1f` unless marked "(1e511906)". The reviewed files are those of commit `dae5af1f`; its parent `1e511906` holds the text #426 reviewed. Labels M1–M6 and N1–N5 are those of #426 (`results/C15/review/stalex444-claude-392rev-20261114/mathematics.md`); new items are R1–R3 and N9, N10. "Gallery", "receipt", "rank-root", "rank chapter", "allarity", "comparison" and "common-scale" are as in #426; "the note" is the author note.

## 1. Response to #426, finding by finding

The note's table has rows M1–M6, "Stale sentences", L15 and L7–L9. Each row was compared with the diff `1e511906..dae5af1f` and with the revised text; every hunk of the diff belongs to a row.

| Finding | Asked in #426 | Where addressed | Status | How checked |
|---|---|---|---|---|
| M1 (Required) | "for every $N\ge k$ with" (or N > k) at l.204 (1e511906) | l.225; proof l.239–240, l.244 | Resolved | l.225 reads "Then, for every $N\ge k$ with", the repair #426 suggested. The proof now reads "since $N\ge k$, $a_k/a_N$ is an integer" (l.239–240), and the old "Since" sentence is now "Hence the site $z_c$ has integer" (l.244). Re-derived in §2. |
| M2 (Should) | Add ref(d′) ≤ k for every d′ ≤ d to (F5) (or as a further field), and say in the proof that the estimate applies because ref(d′) ≤ k < N | (F5) l.142–148; proof l.192 | Resolved | l.142–143: "$\operatorname{ref}(d')\le k$ for every grade $d'\le d$". Both reasons check (§2). The proof opens "Since $\operatorname{ref}(d')\le k<N$ by (F5)" (l.192), with the inequality #426 suggested. The half k < N is not in (F5)'s own text; it comes from l.111–112 ("$N>k$ and $p$ are arbitrary"), which scopes every field. Accurate read with l.111; no change required. |
| M3 (Should) | Status and opening to say (F1), (F2), (F4) are supplied and (F3), (F5) remain inputs; count the three lemmas; optionally "for all sufficiently large $k$" in the remark | l.83–88, l.202–216, l.359–364 | Resolved, with one Minor wording point (R1) | l.83: "We then prove three lemmas", listed in the order of l.183, l.218, l.267. l.87–88, l.216 and l.362 all name (F3) and (F5) as the remaining inputs. The Status paragraph scopes to the clock and "all sufficiently large $k$" (l.203–204); the remark to "all sufficiently large $k$ and base arcs up to $\bar b$" (l.360–361), the scope of the clock-fields lemma (l.273–274). "Proved" for (F4) is accurate (§2); "below" is inexact for the Proposition itself (R1). |
| M4 (Minor) | Define the stamp duty; give "clock factors" meaning where used | l.119–120; l.157–161 | Resolved | The wheel reads $\min(L_{J(k)},L_{J(k)-1})\ge2$ with "the clock factor of a stage is its block length" (l.119–120); with L_j ≥ 3 (remark l.359–360) it holds once J(k) − 1 is a selected stage, within "all sufficiently large $k$". The stamp duty has a one-sentence gloss and "it is not established in this book" (l.160), as the rank chapter says (l.436–437). Remark R3 on the gloss. |
| M5 (Minor, optional) | Notation in (F5) and the corrected labels | l.92–95, l.153–155, l.167–177 | Resolved | l.154: $\lvert a(v)-T_{d'}v\rvert_1\le\frac12\lvert a(v)\rvert_1$ with $a=A_{k,N,p}$, the rank chapter's "primary-coordinate map" (l.110) and its eq:rank-common-tested (l.116). W_ρ on the position degree and S_σ on the factor degree, on V_{d′} (l.170–173), as in the rank chapter l.199–201. β_{N,p,k} (l.168), θ_k = θ_clock(k) (l.169), μ_k = 𝓜_k (l.93), β̂_j (l.94–95) and c_k = ⌈(log β̂_k)²⌉ (l.92) have pointers or formulas consistent with rank-root l.301, l.395 and the clock-fields lemma l.272–273. "By Lemma~\ref{lem:ex-lattice-firesky-solves} below, $T_{d'}$ is invertible" (l.173–174) is not circular: the lemma's proof (l.192–197) obtains bijectivity without X. |
| M6 (Minor, optional) | "once $J(m+1)\ge1$"; overloaded letters | l.287–290 | Resolved; renaming not done | "so $s_{m+1}\le2s_m$ at each such step." (l.289), then the first plateau is finite (l.290). Re-derived in §2. The note says "The letter renaming is not done (optional)"; #426 marked it optional. |
| Root-depth repair (`f1fbe95d`) | — (certified) | l.310–315 | Unchanged | Text identical to l.288–293 (1e511906); the certification of #426 stands. |
| Records notes (receipt) | Receipt l.266–267 and l.287–289 (1e511906) stale | receipt l.264–268, l.286–290 | Resolved (R2) | Item (A) "is the dilation of the witness field (F1)" and holds for the clock at large k by the clock-fields lemma; the root-depth item is the chamber lemma "for $N\ge k$ beyond a" threshold depending only on w and d (l.289–290), exactly the lemma's range. The unchanged lead-in is R2. |
| Records notes (rank-root, allarity) | rank-root l.381–383, allarity l.763–764 stale | — | Unchanged here (no severity) | The note: "already replaced in draft #411 (S2)". At `08222954`, rank-root l.382–384 cite `lem:ex-lattice-firesky-clock-fields`, and `git grep -n 'not located'` on allarity finds no match (at `dae5af1f`: l.502 and l.763), its l.1081–1084 citing `lem:ex-lattice-firesky-clock-fields` for the plateau and the bracket; at `dae5af1f` both sentences stand (rank-root l.381–383, allarity l.763–764). |
| Already in the records: c_k | l.89 (1e511906) named c_k only | l.92 | Resolved | The formula is now given. |

## 2. Re-derivation of what changed

### The chamber lemma (l.218–265)

Since e^{s_m} is an integer product of odd block lengths (common-scale l.41, l.51–52), N ≥ k makes a_k/a_N an integer and, with N ≥ k ≥ ℓ ≥ w, q = a_w/a_N an odd integer; z = a_k⌈mx⌉ then gives an integer offset z_c/a_N. "Hence" at l.244 rests on l.239–240. From the mesh condition, Z_d + 2 < 3q/8, which gives q/8 + Z_d + 1 < q/2 − 1 < (q − 1)/2 (l.256). The proof needs a_k/a_N ∈ ℤ and N ≥ w only, so N ≥ k suffices, and N = k is valid (a_k/a_N = 1). The sentence "holds for all large $N$, with a threshold depending only on $w$ and $d$" (l.233–234) quantifies the mesh condition alone, so the lemma's range is N ≥ k beyond that threshold. (G4) asks for "all sufficiently large meshes $N$" (comparison l.72), and its consumer takes N > k_i beyond the threshold of (G4) (comparison l.234–236), inside that range; the root depth w ≤ k is the (G4) condition w_i ≤ k_i. The receipt's root-depth item states the same range (l.289–290).

`evidence/chamber_revised_check.py` (exact rationals, `python3 -I`, exit 0): 400 random clock instances, 3959 cases (k, N ≥ k) satisfying the mesh condition, no failure of integrality, oddness, interiority or the displayed chain; 326 instances have a mesh-satisfying N < k with a_k/a_N not an integer (the range the revision excludes). The example of #426 (L = 3, k = 20) gives ℓ = 15, w = 8, and excludes N = 10, …, 19. An example, not the argument. Output: `evidence/chamber_revised_check.out`.

### (F5) and the solves lemma (l.142–148, l.191–200)

The reference inverse estimate is obtained at "comparison levels $k\ge\operatorname{ref}(d)$" (rank chapter l.90) and for D_k "independent of $N\ge k$ and $p$" (l.176–177). (F5) now states the first; N > k comes from l.111. The first reason, the one-step output "covers all reference grades through $d$" (l.146–147, and gallery l.40–42), is at the output chart's level, which the subsection calls k, at the same grade d. The second, "for all large $k$, since only finitely many grades occur" (l.147–148), holds because max_{d′≤d} ref(d′) is a fixed level. The pointer "reference level of Section~\ref{sec:actual-rank-purchases}" leads to l.90, where the restriction is imposed. Correct.

### The Status paragraph and (F4) (l.202–216)

The requests are F_{M,i} of `eq:rank-root-ticket-requests` (rank-root l.311–312). Item 1 of `prop:rank-root-output-ticket` is (F4) once μ_k = 𝓜_k (l.93) and w(k) = w, its proof uses w(k) ≤ k and k beyond a threshold depending on M, and w(k) → ∞ is l.163–164. So "proved" in the Status paragraph and "replaced by" in the closing remark (l.363) describe the same fact; only "below" is inexact for the Proposition itself (R1). The deleted sentence on (F2) and (F3) being needed at every level of [w,k] (l.194–195 (1e511906)) carried no content another section relies on: the quantifier is in (F2) (l.123–124) and (F3) (l.125–126) themselves, the consumer states its requirement (allarity l.755–764), and `git grep` at `dae5af1f` finds no reference to it.

### The clock-fields growth step (l.287–290)

At a step with J(m+1) > j_* the stage index is at least 1, and the entry requirement (common-scale l.68, l.89–91) gives log L_{J(m+1)} ≤ s_m/J(m+1) ≤ s_m, so s_{m+1} ≤ 2s_m. The steps with J(m+1) = j_* are the finitely many of the first plateau (common-scale l.91), and every later step has J(m+1) > j_* by monotonicity, which gives C_0. Correct.

### Changes beyond the findings

Changes on #426 points beyond the wording #426 proposed: the explicit c_k formula (l.92; #426 noted that l.89 (1e511906) named c_k only), the β̂ pointer (l.94–95; #426 M5) and the reasons for ref(d′) ≤ k (l.145–148; #426 M2 pointed to gallery l.40–42 and to enlarging the level threshold); the note files them under M5 and M2. Each is consistent with its source. μ_k is identified twice in one paragraph (l.89–90, l.93), consistently (rank-root l.301, receipt l.22–24). Every added `\ref` and `\eqref` resolves with the right kind word (`git grep` at `dae5af1f`). Unchanged by the diff: l.111, the display l.177 and the (G2) sentence l.179–181 (L9, not changed, as the note says).

## 3. New points

Labels: Required / Should / Minor. No Required or Should point.

### R1. "proved below" for a Proposition placed earlier (Minor; wording)

Where: l.205–207. The Status paragraph says (F1), (F2) and (F4) "are proved below", by the clock-fields lemma, the remark after it and `prop:rank-root-output-ticket`. The lemma (l.267) and the remark (l.359) are below; the Proposition is in rank-root (label l.308), which `existence.tex` inputs at l.213, before the gallery at l.236. The closing remark only says "(F4) is replaced by" it (l.363). The Proposition is named, so the reader is not misled. Its hypothesis w(k) → ∞ (l.163–164) rests on the bracket, which the lemma below proves; only the Proposition itself is earlier.

Possible repair (optional): "(F1) and (F2) are proved below, by Lemma~\ref{lem:ex-lattice-firesky-clock-fields} and the remark after it, and (F4) by Proposition~\ref{prop:rank-root-output-ticket}", or drop "below".

### R2. The receipt's lead-in still calls supplied items open (Minor; wording)

Where: receipt l.261–262, with l.264–268 and l.286–290. The lead-in "The following inputs remain open." is unchanged from l.261–262 (1e511906); `git grep -n 'remain open'` finds only l.262 in the receipt. Under it, item (A) now says "for the clock it holds for all large $k$ by" the clock-fields lemma (l.267–268), and the root-depth item ends "This is Lemma~\ref{lem:ex-lattice-firesky-chamber}" (l.288–289). The chamber lemma holds for any chart, and its large-N threshold is what (G4) allows (comparison l.72), so nothing in that item remains open; only (B) does, with the implication at l.292–296. The gallery's Status paragraph lists "the allowance and the root-depth identification" among the inputs supplied (l.210). #426's records note named the two items but not this lead-in.

Possible repair: "Of the following inputs, only (B) remains open; (A), for the clock, and the root depth are supplied as stated in their items." Or move the two items out of the list.

### R3. The low-grade reading in the stamp-duty gloss (remark; no change required)

Where: l.157–159. The gloss says the insertions' "low-grade reading is $T_{d'}$". In the source the insertions are tested against the shrunk `scaled (Price.shrink C k N p) (T v)` (`Heating.test`, `Next/RANK/ParticleGate.lean:35–36`), which is S_σ(T_{d′}v) in the gallery's notation, as in the reading equation (l.188); the reading itself is `StampDuty.T`, that is T_{d′}. The terms "halo of the readers" and "price" were checked against `StampDuty` and no point is raised on them (lean-correspondence.md). The clause is recorded, not used.

### Already in the note (no severity)

The note's statement that the rank-root and allarity sentences are replaced in #411 is accurate at `08222954`, then the head of draft #411 (§1, Records notes).

## Required changes and remaining uncertainty

Required: none. Should: none. Minor: R1, R2. Remark: R3.

Not checked:

- N1–N3 (unchanged). The cited interiority argument; the derivation of `eq:rank-reference-inverse` (only its hypotheses were checked again); the "row bound of the stage" in (F3).
- N5 (unchanged). Whether the clock of common-scale satisfies the source's `Supply.Paid`.
- N9. The manuscript build. The note's "Checks actually run" (l.21–22) were not reproduced: its `latexmk` line reports rc 0 and no undefined references, and its `check_blueprint.py` line names the command with no result. No LaTeX build was run.
- N10. #411 beyond the lines cited (rank-root l.380–386, allarity l.1076–1087 and the allarity grep at `08222954`).
- Whether the marker allowance M is fixed independently of k; the threshold of `prop:rank-root-output-ticket` depends on M, so "all sufficiently large $k$" for (F4) is per M.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
