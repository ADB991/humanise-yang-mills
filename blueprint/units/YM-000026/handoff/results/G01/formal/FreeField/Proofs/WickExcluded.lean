import FreeField.Hierarchy
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-!
# Exclusion of a logarithmically suppressed Wick profile

The power-log expansion, primitive estimates, and radial moment arguments below
are adapted from the generic portions of `YM/TraceExtension/Wick/{Expansion,
Gain,Log,Massive,PolynomialField}.lean` in the local upstream development.
No upstream construction or theorem is imported. The polar-coordinate argument
uses the public `Hierarchy.Mode` directly, including its continuous homogeneous
numerator (which need not be a polynomial).
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
namespace WickExcluded
open Set Filter Function Asymptotics
open scoped Topology BigOperators Classical

abbrev past := 𝓝[>] (0:ℝ)
lemma mostly : ∀ᶠ s in past, 0<s ∧ s<1 := by
    filter_upwards [self_mem_nhdsWithin,(gt_mem_nhds (show 0<(1:ℝ) from zero_lt_one)).filter_mono nhdsWithin_le_nhds] with k hk hv using ⟨hk,hv⟩

/-- Ensure global multiplication rule -/
def fill (x : ℝ) := if 0<x then x else 1
lemma fill_away (x : ℝ) : fill x≠ 0 := by unfold fill; split; positivity; norm_num
lemma fill_at {x : ℝ} (h : 0<x) : fill x=x := if_pos h

def tile (a : ℤ) := fun x=> fill x ^ a
def joint (a : ℤ) (k : ℕ) := fun x=> tile a x * Real.log (fill x)^k
def board := Submodule.span ℝ {f:ℝ→ℝ | ∃ a k, f= joint a k}
lemma jointBoard (a k) : joint a k ∈ board := Submodule.subset_span (show ∃ _ _, _ from ⟨a,k,rfl⟩)
lemma tileBoard (a) : tile a ∈ board := by
    convert jointBoard a 0 using 1; ext1 x; simp [joint]
lemma one_board : (1:ℝ→ℝ)∈ board := by convert tileBoard 0 using 1; ext x; simp [tile]
lemma joinTiles (a b : ℤ) : tile (a+b)= tile a*tile b := funext fun x=> zpow_add₀ (fill_away x) a b
lemma board_mul (f g : ℝ→ℝ) (h : f∈board) (k : g∈board) : f*g∈board := by
    unfold board at h k
    induction h using Submodule.span_induction with
    | mem t ht =>
        rcases ht with ⟨a,v,rfl⟩
        induction k using Submodule.span_induction with
        | mem r hr=>
          rcases hr with ⟨b,w,rfl⟩
          rw [show joint a v*joint b w=joint (a+b) (v+w) by ext; simp only [joint, joinTiles,pow_add,Pi.mul_apply]; ring]; exact jointBoard _ _
        | zero=> rw [mul_zero]; exact board.zero_mem
        | add x y _ _ hx hy=> rw [mul_add]; exact board.add_mem hx hy
        | smul t x _ hx=> rw [mul_smul_comm]; exact board.smul_mem _ hx
    | zero=> rw [zero_mul]; exact board.zero_mem
    | add x y _ _ hx hy=> rw [add_mul]; exact board.add_mem hx hy
    | smul t x _ hx=> rw [smul_mul_assoc]; exact board.smul_mem _ hx

/-- expansion at order integer k possibly diverging -/
def AtOrder (f : ℝ→ℝ) (k : ℤ) := ∃ g∈board,(f-g) =O[past] tile k
def Expands (f : ℝ→ℝ) := ∀ i : ℤ, AtOrder f i

lemma tile_cost {a b : ℤ} (h : a≤b) : tile b =O[past] tile a := by
    apply isBigO_iff.mpr; refine ⟨1,?_⟩; filter_upwards [mostly] with x hx
    unfold tile; rw [fill_at hx.1,one_mul,Real.norm_of_nonneg (zpow_nonneg hx.1.le b),Real.norm_of_nonneg (zpow_nonneg hx.1.le a)]; exact zpow_le_zpow_right_of_le_one₀ hx.1 hx.2.le h
lemma cost_mul {a b : ℤ} {f g : ℝ→ℝ} (h : f=O[past] tile a) (k : g=O[past] tile b) : (f*g)=O[past] tile (a+b) := by rw [joinTiles]; exact h.mul k
lemma allows {f : ℝ→ℝ} {a b : ℤ} (h : a≤b) : AtOrder f b → AtOrder f a := by rintro ⟨x,y,hx⟩; exact ⟨x,y,hx.trans (tile_cost h)⟩
lemma board_bound (f) (h : f∈board) : ∃ i : ℤ, f=O[past] tile i := by
    unfold board at h
    induction h using Submodule.span_induction with
    | mem t ht=>
      obtain ⟨a,v,rfl⟩:=ht
      refine ⟨a+ -(v:ℤ), cost_mul (tile_cost (le_refl a)) ?_⟩
      apply isBigO_iff.mpr; refine ⟨1,?_⟩; filter_upwards [mostly] with x hx
      unfold tile; rw [fill_at hx.1, Real.norm_eq_abs,← pow_abs
      ]; have he : |Real.log x| ≤ x⁻¹ := by
        rw [abs_of_nonpos (Real.log_nonpos hx.1.le hx.2.le),← Real.log_inv]; exact Real.log_le_self (inv_pos.mpr hx.1).le
      calc _ ≤ (x⁻¹)^v := pow_le_pow_left₀ (abs_nonneg _) he _
           _ = _ := by rw [one_mul,Real.norm_of_nonneg (zpow_nonneg hx.1.le _),zpow_neg, zpow_natCast, inv_pow]
    | zero=> exact ⟨0,isBigO_of_le _ fun x=> (by change ‖(0:ℝ)‖ ≤ _; simp)⟩
    | add x y _ _ H K=>
        obtain ⟨a,ha⟩:=H; obtain ⟨b,hb⟩:=K; exact ⟨min a b,(ha.trans (tile_cost (min_le_left ..))).add (hb.trans (tile_cost (min_le_right ..)))⟩
    | smul t x _ h=> obtain ⟨a,h⟩:=h; exact ⟨a,h.const_mul_left t⟩

lemma cost_order {f : ℝ→ℝ} {k : ℤ} (h : f=O[past] tile k) : AtOrder f k := ⟨0,board.zero_mem,by rwa [sub_zero]⟩
lemma own {f : ℝ→ℝ} (h : f∈board) : Expands f := fun i=> ⟨f,h,isBigO_of_le _ fun _=> by simp⟩
lemma AtOrder.plus {f g} {k} (h : AtOrder f k) (p : AtOrder g k) : AtOrder (f+g) k := by
    obtain ⟨x,y,hx⟩:=h; obtain ⟨z,w,hz⟩:=p
    exact ⟨x+z,board.add_mem y w, (show f+g-(x+z)=f-x+(g-z) by abel).symm ▸ hx.add hz⟩
lemma AtOrder.scale {f k} (h : AtOrder f k) (t : ℝ) : AtOrder (t • f) k := by
    obtain ⟨x,p,hx⟩:=h; exact ⟨t • x,board.smul_mem t p, by rw [← smul_sub]; exact hx.const_mul_left t⟩
lemma AtOrder.shift {f k} (h : AtOrder f k) (a : ℤ) : AtOrder (tile a*f) (a+k) := by
    obtain ⟨x,p,hx⟩:=h; exact ⟨tile a*x,board_mul _ _ (tileBoard a) p,by rw [← mul_sub]; exact cost_mul (tile_cost le_rfl) hx⟩
lemma AtOrder.upon {f g k} (h : AtOrder f k) (p : f=ᶠ[past] g) : AtOrder g k := by
    obtain ⟨x,y,h⟩:=h; exact ⟨x,y,h.congr' (p.sub (Filter.EventuallyEq.refl _ _)) EventuallyEq.rfl⟩
lemma Expands.plus {f g : ℝ→ℝ} (h : Expands f) (p : Expands g) : Expands (f+g) := fun _=> AtOrder.plus (h _) (p _)
lemma Expands.scale {f : ℝ→ℝ} (h : Expands f) (t : ℝ) : Expands (t • f) := fun _=> AtOrder.scale (h _) t
lemma Expands.bound {f : ℝ→ℝ} (h : Expands f) : ∃ i:ℤ, f=O[past] tile i := by
    obtain ⟨x,y,h⟩:= h 0; obtain ⟨k,hk⟩ := board_bound x y
    refine ⟨min k 0,?_⟩; have he : (f-x+x)=O[past] tile (min k 0) := (h.trans (tile_cost (min_le_right ..))).add (hk.trans (tile_cost (min_le_left ..)))
    rwa [sub_add_cancel] at he
lemma Expands.mult {f g} (h : Expands f) (p : Expands g) : Expands (f*g) := by
    intro i
    obtain ⟨l,hl⟩ := p.bound; obtain ⟨x,hx,hM⟩ := h (i-l)
    obtain ⟨u,U⟩ := board_bound x hx; obtain ⟨y,hy,hN⟩:= p (i-u)
    have hp : f*g-x*y=(f-x)*g+x*(g-y) := by ring
    refine ⟨x*y,board_mul _ _ hx hy,by
      rw [hp]; exact (show ((f-x)*g)=O[past] tile i by simpa only [sub_add_cancel] using cost_mul hM hl).add (show (x*(g-y))=O[past] tile i by simpa only [add_sub_cancel] using cost_mul U hN)⟩

/-! Antiderivatives of power-log monomials. -/
open Metric

lemma tile_d (a : ℤ) (x : ℝ) (hx : 0<x) : HasDerivAt (tile a) (a * x^(a-1)) x := by
    apply (hasDerivAt_zpow a x (Or.inl hx.ne')).congr_of_eventuallyEq
    filter_upwards [lt_mem_nhds hx] with x hx; rw [tile,fill_at hx]
lemma log_tile (k : ℕ) (x : ℝ) (hx : 0<x) : HasDerivAt (joint 0 (k+1)) ((k+1:ℝ)*Real.log x^k*x⁻¹) x := by
    have he := (Real.hasDerivAt_log hx.ne').pow (k+1); simp only [Nat.add_one_sub_one,Nat.cast_add,Nat.cast_one] at he
    apply he.congr_of_eventuallyEq; filter_upwards [lt_mem_nhds hx] with i hi; simp [joint,tile,fill_at hi]

def integrates (f p : ℝ→ℝ) := ∀ x : ℝ, 0<x → HasDerivAt p (f x) x
lemma integrate_joint (a : ℤ) (k : ℕ) : ∃ p∈board, integrates (joint a k) p := by
    rcases eq_or_ne a (-1) with h|h
    · subst a; refine ⟨(↑k+1:ℝ)⁻¹ • joint 0 (k+1),board.smul_mem _ (jointBoard _ _),fun x hx=> ?_⟩
      have he : (↑k+1:ℝ) ≠ 0 := by positivity
      convert! ((log_tile k x hx).const_smul (↑k+1:ℝ)⁻¹) using 1; simp [joint,tile,fill_at hx]; field_simp
    let b := a+1; let c : ℝ := b
    have hc : c≠0 := Int.cast_ne_zero.mpr (show b≠0 by unfold b; omega)
    induction k with
    | zero=>
      refine ⟨c⁻¹ • tile b,board.smul_mem _ (tileBoard _),fun x hx=>?_⟩
      convert! ((tile_d b x hx).const_smul c⁻¹) using 1; simp only [joint,tile, fill_at hx,pow_zero,mul_one, smul_eq_mul,show b-1=a by omega]; rw [← mul_assoc, inv_mul_cancel₀ hc, one_mul]
    | succ k ih=>
      obtain ⟨p,P,t⟩ := ih; let u : ℝ := k+1
      let g := tile b * joint 0 (k+1)
      refine ⟨c⁻¹ • (g-u • p),board.smul_mem _ (board.sub_mem (board_mul _ _ (tileBoard b) (jointBoard _ _)) (board.smul_mem _ P)), fun x hx=>?_⟩
      have ht := ((((tile_d b x hx).mul (log_tile k x hx)).sub ((t x hx).const_smul u)).const_smul c⁻¹)
      convert! ht using 1
      simp only [joint,tile,fill_at hx,smul_eq_mul, zpow_zero, one_mul,show b-1=a by omega]; dsimp only [u]; change _= c⁻¹ * ((c*_*_+_)-_); rw [show x^b=x^a*x from zpow_add_one₀ hx.ne' _]; field_simp; ring
lemma integrate_poly (f) (h : f∈board) : ∃ p∈board, integrates f p := by
    unfold board at h
    induction h using Submodule.span_induction with
    | mem x hx=> obtain ⟨a,b,rfl⟩:=hx; exact integrate_joint ..
    | zero=> exact ⟨0,board.zero_mem,fun x _=>hasDerivAt_const ..⟩
    | add x y _ _ hx hy=> obtain ⟨p,P,h⟩:=hx; obtain ⟨q,Q,t⟩:=hy; exact ⟨p+q,board.add_mem P Q,fun x hx=>(h x hx).add (t x hx)⟩
    | smul a x _ hx => obtain ⟨p,P,h⟩:=hx; exact ⟨a • p,board.smul_mem a P,fun x hx=> (h x hx).const_smul a⟩

private lemma monotone_from (f g : ℝ→ℝ) (b : ℝ) (h : ∀ x∈Ioo 0 b, HasDerivAt f (g x) x ∧ 0≤g x) : MonotoneOn f (Ioo 0 b) := by
    apply monotoneOn_of_deriv_nonneg (convex_Ioo ..)
    · exact fun x hx=> (h _ hx).1.continuousAt.continuousWithinAt
    · rw [isOpen_Ioo.interior_eq]; exact fun x hx=> (h x hx).1.differentiableAt.differentiableWithinAt
    rw [isOpen_Ioo.interior_eq]; intro x hx; rw [(h _ hx).1.deriv]; exact (h _ hx).2

lemma mostly_lt {b : ℝ} (hb : 0 < b) : ∀ᶠ x in past, x∈ Ioo (0:ℝ) b := by
    filter_upwards [mostly,(gt_mem_nhds hb).filter_mono nhdsWithin_le_nhds] with k hk ht using ⟨hk.1,ht⟩

/-! Integrating a power error gains one order, with a constant of integration. -/

private lemma base_and_tail (f g : ℝ → ℝ) {k : ℤ} (hk : k≠-1) (h : integrates g f) (hp : g=O[past] tile k) :
    ∃ b : ℝ, 0<b ∧ ∃ A : ℝ, MonotoneOn (fun x => A*x^(k+1)+f x) (Ioo 0 b) ∧ MonotoneOn (fun x=> A*x^(k+1)-f x) (Ioo 0 b) := by
    obtain ⟨C,hC,hk'⟩ := isBigO_iff'.mp hp
    obtain ⟨b,hb,H⟩:= Metric.nhdsWithin_basis_ball.eventually_iff.mp hk'
    let A := C/((k:ℝ)+1); have ha : (k:ℝ)+1≠0 := by exact_mod_cast (show k+1≠0 by omega)
    have he (x : ℝ) (h : 0<x) : HasDerivAt (fun x:ℝ=> A*x^(k+1)) (C*x^k) x := by
       convert! ((hasDerivAt_zpow (k+1) x (Or.inl h.ne')).const_mul A) using 1; simp [A,← mul_assoc,ha]
    have hv x (hh:x∈ Ioo 0 b) : ‖g x‖≤ C*x^k := by
        have hp : x∈ball (0:ℝ) b ∩ Ioi 0 := ⟨Metric.mem_ball.mpr (by rw [Real.dist_eq,sub_zero,abs_of_pos hh.1]; exact hh.2), hh.1⟩
        have hz := H hp; rwa [tile,fill_at hh.1, Real.norm_of_nonneg (zpow_nonneg hh.1.le _)] at hz
    exact ⟨b,hb,A,monotone_from _ _ b (fun x hx=> ⟨(he x hx.1).add (h x hx.1),by have he := (abs_le.mp (hv _ hx)).1; linarith⟩),monotone_from _ _ b (fun x hx=> ⟨(he x hx.1).sub (h x hx.1),sub_nonneg.mpr (abs_le.mp (hv _ hx)).2⟩)⟩

private lemma valley (u : ℝ→ℝ) (s : ℝ) (hs : 0<s) (hm : MonotoneOn u (Ioo 0 s))
    (hb : BddBelow (u '' Ioo 0 s)) : ∃ t : ℝ,Tendsto u past (𝓝 t) := by
    let t:= sInf (u '' Ioo 0 s); refine ⟨t,tendsto_order.mpr ⟨fun b hh=> ?_,fun b hh=>?_⟩⟩
    · exact (mostly_lt hs).mono fun i hi=> lt_of_lt_of_le hh (csInf_le hb (mem_image_of_mem u hi))
    obtain ⟨a,⟨w,hv,rfl⟩,hA⟩:= exists_lt_of_csInf_lt ((nonempty_Ioo.mpr hs).image u) hh
    exact (mostly_lt hv.1).mono fun i hi=> lt_of_le_of_lt (hm ⟨hi.1,hi.2.trans hv.2⟩ hv hi.2.le) hA

private lemma remainder_o (f g : ℝ→ℝ) {k : ℤ} (hk : k≠-1) (h : integrates g f) (hp : g=O[past] tile k) : AtOrder f (k+1) := by
    obtain ⟨b,hb,A,hB,hA⟩ := base_and_tail _ _ hk h hp
    let a:= b/2; have ha : a∈ Ioo 0 b:= ⟨half_pos hb,half_lt_self hb⟩
    let u (x:ℝ) := A*x^(k+1)+f x; let v (x:ℝ):=A*x^(k+1)-f x
    have he₁ (x) (hx:x∈ Ioo 0 a) : u x ≤ u a := hB ⟨hx.1,hx.2.trans ha.2⟩ ha hx.2.le
    have he₂ (x) (hx:x∈ Ioo 0 a) : v x ≤ v a := hA ⟨hx.1,hx.2.trans ha.2⟩ ha hx.2.le
    let d := k+1; rcases lt_or_gt_of_ne (show d≠0 by unfold d; omega) with hy|hy
    · let C:=|A| + |u a| + |v a|
      apply cost_order; refine isBigO_iff.mpr ⟨C,?_⟩
      filter_upwards [mostly_lt ha.1,mostly] with x hx hv
      rw [tile,fill_at hx.1,Real.norm_of_nonneg (zpow_nonneg hx.1.le d),Real.norm_eq_abs];
      have hp : 1≤x^d := by simpa only [zpow_zero] using zpow_le_zpow_right_of_le_one₀ hx.1 hv.2.le hy.le
      have hz := (abs_le.mp (show |A*x^d|≤ |A| * x^d by rw [abs_mul,abs_of_nonneg (show 0 ≤ x^d by linarith)])).1
      have hs : u a ≤ |u a| *  x^d := (le_abs_self _).trans (le_mul_of_one_le_right (abs_nonneg _) hp)
      have hw : v a ≤ |v a| *  x^d := (le_abs_self _).trans (le_mul_of_one_le_right (abs_nonneg _) hp)
      have hF := (he₁ x hx).trans hs; have hG := (he₂ x hx).trans hw; unfold C; change |f x| ≤ _ * x^d
      have h₁ : A*x^d+f x=u x:=rfl; have h₂ : A*x^d-f x=v x:=rfl; apply abs_le.mpr; constructor <;> linarith [mul_nonneg (abs_nonneg (u a)) (show 0 ≤ x^d by linarith),mul_nonneg (abs_nonneg (v a)) (show 0 ≤ x^d by linarith)]
    have hN : Tendsto (fun x:ℝ=> A*x^d) past (𝓝 0) := by
        have hx : d.toNat≠0 := by omega
        simp_rw [show ∀ x:ℝ, x^d=x^(d.toNat) from fun x=> by rw [← zpow_natCast, Int.toNat_of_nonneg hy.le] ]
        simpa [hx] using ((show Continuous (fun x:ℝ=> A*x^d.toNat) by fun_prop).tendsto 0).mono_left (nhdsWithin_le_nhds (s:=Ioi 0))
    have hc : BddBelow (u '' Ioo 0 a) := by
        refine ⟨-(|A| * a^d)*2-v a,?_⟩
        rintro y ⟨x,hx,rfl⟩
        have h : |A*x^d|≤|A| * a^d := by rw [abs_mul,abs_of_nonneg (zpow_nonneg hx.1.le d)]; apply mul_le_mul_of_nonneg_left (zpow_le_zpow_left₀ hy.le hx.1.le hx.2.le) (abs_nonneg _)
        have he : A*x^d-f x≤v a := he₂ x hx
        change _ ≤ A*x^d+_; linarith [(abs_le.mp h).1]
    obtain ⟨t,hh⟩:= valley u a ha.1 (fun _ hx _ hv hs=> hB ⟨hx.1,hx.2.trans ha.2⟩ ⟨hv.1,hv.2.trans ha.2⟩ hs) hc
    have ht : Tendsto v past (𝓝 (-t)) := by
       have he := (hN.add hN).sub hh; rw [add_zero,zero_sub] at he; refine he.congr fun x=> ?_; change _- (A*x^d+f x)=_; unfold v; ring
    refine ⟨(fun _=>t),?_,isBigO_iff.mpr ⟨A,?_⟩⟩
    · convert board.smul_mem t one_board using 1; ext; simp
    filter_upwards [mostly_lt ha.1] with x hx
    have hu : t≤u x := le_of_tendsto hh ((mostly_lt hx.1).mono fun y hy => hB ⟨hy.1,hy.2.trans (hx.2.trans ha.2)⟩ ⟨hx.1,hx.2.trans ha.2⟩ hy.2.le)
    have hv : -t≤ v x := le_of_tendsto ht ((mostly_lt hx.1).mono fun y hy => hA ⟨hy.1,hy.2.trans (hx.2.trans ha.2)⟩ ⟨hx.1,hx.2.trans ha.2⟩ hy.2.le)
    rw [tile,fill_at hx.1,Real.norm_of_nonneg (zpow_nonneg hx.1.le d),Real.norm_eq_abs]; apply abs_le.mpr; dsimp only [u,v] at *; simp only [Pi.sub_apply]; constructor <;> linarith

lemma primitives (f g : ℝ→ℝ) {k : ℤ} (hk : k≠ -1) (h : integrates g f) (hp : AtOrder g k) : AtOrder f (k+1) := by
    obtain ⟨p,x,hp⟩ := hp; obtain ⟨z, hz, ht⟩ := integrate_poly _ x
    have he : integrates (g-p) (f-z) := fun x hx=> (h x hx).sub (ht x hx)
    have hv : AtOrder (f-z+z) (k+1) := (remainder_o _ _ hk he hp).plus (own hz _);
    rwa [sub_add_cancel] at hv

/-! Along r = 2⁻ⁿ, the largest power-log monomial decides the limit. -/

private abbrev Tag := ℤ × ℕ
private def degree (t : Tag) : Lex (ℝ × ℕ) := toLex (((1/2:ℝ)^(8+t.1)), t.2+2)
private def P (t : Tag) (n : ℕ) : ℝ := (ofLex (degree t)).1^n * (n:ℝ)^(t.2+2)
private def act (t:Tag) := (Real.log (1/2))^(t.2+2)
private lemma increases : Function.Injective degree := by
    rintro ⟨i,v⟩ ⟨s,t⟩ H
    change toLex _=toLex _ at H; apply toLex.injective at H
    simp only [Prod.mk.injEq,add_left_inj] at H; obtain ⟨h,rfl⟩:=H; congr 1
    rcases lt_trichotomy i s with hk|hk|hk
    · exact False.elim ((zpow_lt_zpow_right_of_lt_one₀ (by norm_num : (0:ℝ)<1/2) (by norm_num : (1/2:ℝ)<1) (add_lt_add_right hk 8)).ne h.symm)
    · exact hk
    exact False.elim ((zpow_lt_zpow_right_of_lt_one₀ (by norm_num : (0:ℝ)<1/2) (by norm_num : (1/2:ℝ)<1) (add_lt_add_right hk 8)).ne h)
private lemma negligible (t : Tag) (h : (ofLex (degree t)).1 < 1) : Tendsto (P t) atTop (𝓝 0) := by
    have hp : |(ofLex (degree t)).1| < 1 := by rwa [abs_of_nonneg (by dsimp [degree]; positivity)]
    exact (tendsto_pow_const_mul_const_pow_of_abs_lt_one _ hp).congr fun _=> mul_comm ..
private lemma decisive (t : Tag) (h : 1 ≤ (ofLex (degree t)).1) : Tendsto (P t) atTop atTop :=
    tendsto_atTop_mono (fun n:ℕ => show (n:ℝ)^(t.2+2) ≤ P t n from le_mul_of_one_le_left (by positivity) (one_le_pow₀ h))
        ((tendsto_pow_atTop (n:=t.2+2) (by omega)).comp tendsto_natCast_atTop_atTop)
private lemma supersedes {x y} (h : degree x<degree y) : Tendsto (fun n=> P x n / P y n) atTop (𝓝 0) := by
    let a:= (ofLex (degree x)).1; let b:=(ofLex (degree y)).1
    have ha : 0<a := by unfold a degree; dsimp; positivity
    have hb : 0<b := by unfold b degree; dsimp; positivity
    let i:=x.2+2; let j:=y.2+2
    have he : a<b ∨ a=b ∧ i<j := Prod.lex_def.mp h
    rcases he with hh|⟨hh,hu⟩
    · have hv : Tendsto (fun n:ℕ=> ((n:ℝ)^j)⁻¹) atTop (𝓝 0) := tendsto_inv_atTop_zero.comp
        ((tendsto_pow_atTop (n:=j) (by unfold j; omega)).comp tendsto_natCast_atTop_atTop)
      have hg : |a/b|<1 := by rw [abs_of_nonneg (by positivity)]; exact (div_lt_one hb).mpr hh
      have ht := (tendsto_pow_const_mul_const_pow_of_abs_lt_one i hg).mul hv; rw [zero_mul] at ht; apply ht.congr; intro t; dsimp only [P]; unfold a b i j; rw [div_pow]; ring
    have hv : Tendsto (fun n:ℕ=> ((n:ℝ)^(j-i))⁻¹) atTop (𝓝 0) := tendsto_inv_atTop_zero.comp
      ((tendsto_pow_atTop (n:=j-i) (by omega)).comp tendsto_natCast_atTop_atTop)
    refine hv.congr' ?_; filter_upwards [eventually_gt_atTop 0] with n hn; change _=a^n*(n:ℝ)^i/(b^n*n^j); rw [hh];
    rw [show (n:ℝ)^j=n^(j-i)* (n:ℝ)^i by rw [← pow_add]; congr; omega]; field_simp

private def life (n : ℕ) := (1/2:ℝ)^n
private def share (s : ℝ) := s^8*Real.log (s⁻¹)^2
private lemma singleValue (t : Tag) (n) : share (life n) * joint t.1 t.2 (life n) = act t*P t n := by
    let r : ℝ := 1/2
    have h : 0<r := by unfold r; norm_num
    unfold joint tile; rw [fill_at (show 0<life n from pow_pos h _)]
    simp only [share, Real.log_inv, sq, neg_mul_neg,P,degree, ofLex_toLex,act, life, Real.log_pow,mul_pow]
    -- x^n commutes with zpow
    have he (a:ℤ) : (r^n)^a=(r^a)^n := by rw [← zpow_natCast r n, ← zpow_natCast (r^a) n, ← zpow_mul,← zpow_mul,mul_comm]
    rw [zpow_add₀ (ne_of_gt h),mul_pow,he, show r^(8:ℤ)=r^(8:ℕ) from zpow_natCast .., ← pow_mul, ← pow_mul r, Nat.mul_comm (8:ℕ) n]
    ring
private lemma board_limit {u} (hu : u∈ board) {A : ℝ}
    (hx : Tendsto (fun n=> share (life n)*u (life n)) atTop (𝓝 A)) : A=0 := by
    let t (x : Tag) := joint x.1 x.2
    have he : u ∈ LinearMap.range (Finsupp.linearCombination ℝ t) := by
        rw [Finsupp.range_linearCombination];
        refine Submodule.span_mono (s:={f:ℝ→ℝ|∃ a k,f=joint a k}) ?_ hu
        rintro f ⟨a,k,rfl⟩; exact ⟨⟨a,k⟩,rfl⟩
    obtain ⟨g,hg⟩:=he
    let F (x : Tag) := g x * act x
    have hy n : share (life n)*u (life n)=∑ x∈g.support,F x*P x n:= by
        rw [← hg,Finsupp.linearCombination_apply,Finsupp.sum,Finset.sum_apply, Finset.mul_sum];
        apply Finset.sum_congr rfl; intro x h; change share _ * (g x*joint x.1 x.2 _) = _
        unfold F; rw [mul_left_comm, singleValue x, mul_assoc]
    simp_rw [hy] at hx
    rcases g.support.eq_empty_or_nonempty with h|h
    · exact tendsto_nhds_unique hx (by simp [h])
    obtain ⟨k,hk,hP⟩:= Finset.exists_max_image _ degree h
    by_cases he : (ofLex (degree k)).1 < 1
    · suffices h : Tendsto (fun n=> ∑ x∈g.support, F x * P x n) atTop (𝓝 (∑ x ∈g.support,(0:ℝ))) by
        simp only [Finset.sum_const_zero] at h; exact tendsto_nhds_unique hx h
      apply tendsto_finsetSum _ fun i hi=> ?_
      have hb : (ofLex (degree i)).1 ≤ (ofLex (degree k)).1 := by
        -- lex
        rcases (hP i hi).eq_or_lt with H|H
        · rw [H]
        rcases Prod.lex_def.mp H with hb|⟨hb,hc⟩
        · exact hb.le
        exact hb.le
      simpa only [mul_zero] using (negligible _ (hb.trans_lt he)).const_mul (F i)
    have hp := hx.mul (tendsto_inv_atTop_zero.comp (decisive _ (le_of_not_gt he))); rw [mul_zero] at hp
    have hk' : F k ≠ 0 := mul_ne_zero (Finsupp.mem_support_iff.mp hk) (pow_ne_zero _ ((Real.log_neg (by norm_num : (0:ℝ)<1/2) (by norm_num)).ne))
    let v (i : Tag) := if i=k then F k else 0
    have hr : Tendsto (fun n=>∑ x∈g.support,F x*(P x n/P k n)) atTop (𝓝 (∑ i∈g.support,v i)) := by
        apply tendsto_finsetSum _ fun i hi=> ?_
        by_cases ht:i=k
        · subst i; apply tendsto_const_nhds.congr';
          filter_upwards [eventually_gt_atTop 0] with n hn; rw [div_self (by dsimp [P,degree]; positivity : P k n ≠ 0)]; simp [v]
        have hL := (supersedes (lt_of_le_of_ne (hP i hi) (increases.ne ht))).const_mul (F i); simpa only [v,if_neg ht,mul_zero] using hL
    have hs : ∑ i ∈g.support,v i=F k := by simp [v,hk];
    exact False.elim (hk' (hs ▸ tendsto_nhds_unique_of_eventuallyEq hr hp (Eventually.of_forall (fun n => by simp_rw [Finset.sum_mul,div_eq_mul_inv,mul_assoc]; rfl))))

lemma no_powerlog {f : ℝ→ℝ} {A : ℝ} (hp : AtOrder f 0) (ht : Tendsto (fun s=> (s^8 * (Real.log s⁻¹)^2)*f s) past (𝓝 A)) : A=0 := by
    obtain ⟨u,w,h⟩:=hp
    apply board_limit w
    have he : Tendsto life atTop past := tendsto_nhdsWithin_iff.mpr ⟨tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num) (by norm_num), Eventually.of_forall fun i=> by change 0<life i; unfold life; positivity⟩
    have hh := ht.comp he
    have hy (n) : share (life n)=act ⟨0,0⟩*P ⟨0,0⟩ n := by
       rw [← singleValue]; simp [joint,tile]
    have hv : Tendsto (fun n=> share (life n)) atTop (𝓝 0) := by
        simp_rw [hy]; simpa only [mul_zero] using (negligible ⟨0,0⟩ (by norm_num [degree])).const_mul (act ⟨0,0⟩)
    have hr : Tendsto (fun n=> share (life n)*(f-u) (life n)) atTop (𝓝 0) := by
        apply ((isBigO_of_le atTop (f:=fun n=> share (life n)) (g:=fun n=> share (life n)) (fun _=> le_rfl)).mul (h.comp_tendsto he)).trans_tendsto
        simpa only [tile,zpow_zero, Function.comp_apply,mul_one] using hv
    have hq:= hh.sub hr; rw [sub_zero] at hq; apply hq.congr; intro n; change share _ * f _ - share _ * (f _- u _)=_; ring

/-! Convergent radial mass-shell moments and their derivatives. -/
open MeasureTheory

def freq (m t : ℝ) := Real.sqrt (m^2+t^2)
lemma freq_pos (m : ℝ) {t : ℝ} (hp : 0<t) : 0 < freq m t := by unfold freq; positivity
lemma freq_ge (m : ℝ) (t : ℝ) : t ≤ freq m t := by unfold freq; exact Real.le_sqrt_of_sq_le (by linarith [sq_nonneg m])
lemma freq_eq (m t : ℝ) : freq m t ^2 = m^2+t^2 := Real.sq_sqrt (by positivity)
lemma freq_deriv (m : ℝ) {t : ℝ} (hp : 0<t) : HasDerivAt (freq m) (t/freq m t) t := by
    convert! (((Real.hasDerivAt_sqrt (by positivity : m^2+t^2 ≠ 0))).comp t (((hasDerivAt_id' t).pow 2).const_add (m^2))) using 1
    dsimp [freq]; ring

/-- radius and mass moments -/
def stream (m : ℝ) (j k : ℕ) (s t : ℝ) := t^(j+2) / freq m t * freq m t ^ k * Real.exp (-s*freq m t)
def moment (m : ℝ) (j k : ℕ) (s : ℝ) := ∫ t : ℝ in Ioi 0, stream m j k s t
lemma stream_nonneg (m j k s t) (ht : 0<t) : 0 ≤ stream m j k s t := by
    unfold stream; have := freq_pos m ht; positivity
@[fun_prop] lemma measurable_stream (m j k s) : Measurable (stream m j k s) := by unfold stream freq; fun_prop
lemma stream_base (m j s t) (ht : 0<t) (hs : 0<s) : stream m j 0 s t ≤ t^(j+1)*Real.exp (-s*t) := by
    unfold stream; rw [pow_zero,mul_one,pow_succ t]
    exact mul_le_mul ((div_le_iff₀ (freq_pos _ ht)).2 (mul_le_mul_of_nonneg_left (freq_ge ..) (by positivity)))
       (Real.exp_le_exp.mpr (mul_le_mul_of_nonpos_left (freq_ge ..) (neg_nonpos.mpr hs.le))) (by positivity) (by positivity)
lemma stream_step (m s t) (j k) : stream m j (k+2) s t=m^2 * stream m j k s t+stream m (j+2) k s t := by unfold stream; rw [pow_add (freq m t),freq_eq]; ring
lemma stream_first (m j s t) (ht : 0<t) : stream m j 1 s t = t^(j+2)*Real.exp (-s*freq m t) := by unfold stream; rw [pow_one,div_mul_cancel₀ _ (freq_pos m ht).ne']
lemma mass_exp {s : ℝ} (hs : 0<s) (k : ℕ) : (∫ x : ℝ in Ioi 0, x^k * Real.exp (-s*x)) = s⁻¹ ^ (k+1)*Real.Gamma ((k+1:ℕ):ℝ) := by
    have he := Real.integral_rpow_mul_exp_neg_mul_Ioi (by positivity : (0:ℝ)< ↑(k+1:ℕ)) hs
    simp only [← neg_mul, Real.rpow_natCast, one_div, Nat.cast_add, Nat.cast_one,add_sub_cancel_right] at *
    rw [show s⁻¹ ^(k+1)= s⁻¹ ^ ((k:ℝ)+1) by rw [show (k:ℝ)+1= ↑(k+1:ℕ) by simp, Real.rpow_natCast] ]; simpa only [Real.rpow_natCast] using he
lemma mass_int {s : ℝ} (hs : 0<s) (k : ℕ) : IntegrableOn (fun x:ℝ=>x^k*Real.exp (-s*x)) (Ioi 0) volume := by
    by_contra h; have he := integral_undef h; rw [mass_exp hs] at he; exact (mul_pos (by positivity) (Real.Gamma_pos_of_pos (by positivity))).ne' he
lemma stream_int (m j k s) (h : 0<s) : IntegrableOn (stream m j k s) (Ioi 0) volume := by
    induction k using Nat.strong_induction_on generalizing j with
    | h k ih=>
      match k with
      | 0 =>
        refine (mass_int h (j+1)).mono' (measurable_stream ..|>.aestronglyMeasurable) ?_
        filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx; rw [Real.norm_of_nonneg (stream_nonneg _ _ _ _ _ hx)]; exact stream_base _ _ _ _ hx h
      | 1 =>
        refine (mass_int h (j+2)).mono' (measurable_stream ..|>.aestronglyMeasurable) ?_
        filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx; have ht : 0<x:=hx
        rw [Real.norm_of_nonneg (stream_nonneg _ _ _ _ _ ht),stream_first _ _ _ _ ht]; exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (mul_le_mul_of_nonpos_left (freq_ge ..) (by linarith))) (by positivity)
      | k+2 =>
        apply (((ih k (by omega) j).const_mul (m^2)).add (ih k (by omega) (j+2))).congr; apply Eventually.of_forall fun i=>?_
        exact (stream_step ..).symm
lemma moment_step (m j k s) (ht : 0<s) : moment m j (k+2) s=m^2*moment m j k s+moment m (j+2) k s := by
    unfold moment; simp_rw [stream_step]; rw [integral_add ((stream_int _ _ _ _ ht).const_mul _) (stream_int _ _ _ _ ht), integral_const_mul]
lemma moment_d (m j k s) (hs : 0<s) : HasDerivAt (moment m j k) (-moment m j (k+1) s) s := by
    let f z := stream m j k z; let g z := fun t=> -stream m j (k+1) z t
    have hb x s : HasDerivAt (fun z=> f z x) (g s x) s := by
        convert! ((((hasDerivAt_id' s).neg.mul_const (freq m x)).exp).const_mul (x^(j+2) / freq m x * freq m x ^ k)) using 1
        unfold g stream; rw [Pi.neg_apply]; ring
    have he := hasDerivAt_integral_of_dominated_loc_of_deriv_le (F:=f) (F':=g) (μ:=volume.restrict (Ioi 0))
       (lt_mem_nhds (half_lt_self hs)) (Eventually.of_forall fun i=> (measurable_stream m j k i).aestronglyMeasurable)
       (stream_int _ _ _ _ hs) ((measurable_stream m j (k+1) s).aestronglyMeasurable.neg) (bound:=stream m j (k+1) (s/2))
    have hp : HasDerivAt (moment m j k) (∫ i:ℝ in Ioi 0,g s i) s := by
      refine (he ?_ (stream_int _ _ _ _ (half_pos hs)) (ae_of_all _ fun x t ht=> hb ..)).2
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht u hu; have hx := freq_pos m (show 0<t from ht)
      unfold g; rw [norm_neg,Real.norm_of_nonneg (stream_nonneg _ _ _ _ _ ht)]; unfold stream; apply mul_le_mul_of_nonneg_left
      · apply Real.exp_le_exp.mpr; exact mul_le_mul_of_nonneg_right (neg_le_neg (le_of_lt hu)) hx.le
      have hp : 0<t:=ht; positivity
    simpa [g,moment,integral_neg] using hp


/-! The radial Euler identity bootstraps the expansion to every integer order. -/

lemma euler (m j s) (hs : 0<s) : s*moment m (j+2) 0 s=(j+3:ℝ)* moment m j 1 s := by
    let f (t:ℝ):= t^(j+3)*Real.exp (-s*freq m t)
    let g (t:ℝ):= (j+3:ℝ)*stream m j 1 s t-s*stream m (j+2) 0 s t
    suffices ht : (∫ t in Ioi 0,g t)=0 by
        unfold g at ht; rw [integral_sub ((stream_int _ _ _ _ hs).const_mul _) ((stream_int _ _ _ _ hs).const_mul _),integral_const_mul,integral_const_mul] at ht; exact (sub_eq_zero.mp ht).symm
    have hd t (ht : 0<t) : HasDerivAt f (g t) t := by
       unfold g; rw [stream_first _ _ _ _ ht]
       convert! (((hasDerivAt_id' t).pow (j+3)).mul (((freq_deriv m ht).const_mul (-s)).exp)) using 1
       unfold stream; push_cast; simp only [Pi.pow_apply]; ring
    have he : Tendsto f atTop (𝓝 0) := by
       have ht := (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero (j+3)).comp (Tendsto.const_mul_atTop hs tendsto_id)
       apply squeeze_zero' (g:=fun x => (s^(j+3))⁻¹ *((s*x)^(j+3)*Real.exp (-(s*x))))
       · filter_upwards [eventually_gt_atTop (0:ℝ)] with x hx; unfold f; positivity
       · filter_upwards [eventually_gt_atTop (0:ℝ)] with x hx; unfold f; calc
           _ ≤ x^(j+3)*Real.exp (-(s*x)) := mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (by rw [neg_mul]; gcongr; exact freq_ge ..)) (by positivity)
           _ = _ := by rw [mul_pow]; field_simp
       simpa only [mul_zero,comp_apply,id] using ht.const_mul ((s^(j+3))⁻¹)
    have h := integral_Ioi_of_hasDerivAt_of_tendsto (show ContinuousWithinAt f (Ici 0) 0 from (show Continuous f by unfold f freq; fun_prop).continuousWithinAt) hd
       (((stream_int m j 1 s hs).const_mul (j+3:ℝ)).sub ((stream_int m (j+2) 0 s hs).const_mul s)) he
    simpa [f] using h
lemma differentiated (m j) : integrates (fun s => -(m^2)*s^(j+3)*moment m j 0 s) (fun s => s^(j+3)*moment m j 1 s) := by
    intro s hs
    have he := (((hasDerivAt_id' s).pow (j+3)).mul (moment_d m j 1 s hs))
    convert! he using 1; rw [moment_step m j 0 s hs]; push_cast
    have h := euler m j s hs; simp only [Pi.pow_apply]; linear_combination (s^(j+2))*h
lemma first_order (m j) : AtOrder (moment m j 0) (- ((j+2:ℕ):ℤ)) := by
    apply cost_order; apply isBigO_iff.mpr; let A := Real.Gamma (↑(j+1+1:ℕ)); refine ⟨A,?_⟩; filter_upwards [mostly] with x hx
    unfold moment; rw [Real.norm_of_nonneg (show 0 ≤ ∫ t:ℝ in Ioi 0, stream m j 0 x t from integral_nonneg_of_ae (Eventually.mono (ae_restrict_mem measurableSet_Ioi) fun t ht=> stream_nonneg _ _ _ _ _ ht))]
    apply (integral_mono_ae (stream_int _ _ _ _ hx.1) (mass_int hx.1 (j+1)) (Eventually.mono (ae_restrict_mem measurableSet_Ioi) (fun i hi=> stream_base _ _ _ _ hi hx.1))).trans_eq
    rw [mass_exp hx.1, tile, fill_at hx.1,zpow_neg,zpow_natCast,Real.norm_of_nonneg (by have he:=hx.1; positivity),inv_pow,mul_comm]
lemma derived {m j} {k : ℤ} (hk : -((j+2:ℕ):ℤ) ≤ k) (h : AtOrder (moment m j 0) k) : AtOrder (moment m j 1) (k+1) := by
    let t : ℤ:= ↑(j+3:ℕ)
    have hp : AtOrder (fun s => -(m^2)*s^(j+3)*moment m j 0 s) (t+k) := by
        apply ((h.shift t).scale (-(m^2))).upon; filter_upwards [mostly] with s hs; simp only [Pi.smul_apply,Pi.mul_apply, smul_eq_mul,tile,fill_at hs.1,t,zpow_natCast]; ring
    have hb := primitives _ _ (show t+k ≠ -1 by unfold t; omega) (differentiated m j) hp
    rw [show k+1=-t+(t+k+1) by omega]; apply (hb.shift (-t)).upon
    filter_upwards [mostly] with s hs; have hv:=hs.1; simp only [tile,zpow_neg, fill_at hs.1,t,zpow_natCast, Pi.mul_apply]; field_simp
lemma basic_expands (m j) : Expands (moment m j 0) := by
    let b : ℤ:= -↑(j+2:ℕ)
    have he (i : ℕ) : AtOrder (moment m j 0) (b+i) := by
        induction i with
        | zero=> simpa only [Nat.cast_zero,add_zero,b] using first_order m j
        | succ i ih=>
           let k : ℤ:= b+i+1
           have hp : AtOrder (fun s=> - moment m j 1 s) k := by
              have he:= derived (show b ≤ b+i by omega) ih
              exact (he.scale (-1)).upon (by filter_upwards with s; simp)
           have hv : integrates (fun s=> - moment m j 1 s) (moment m j 0) := moment_d m j 0
           suffices he : AtOrder (moment m j 0) k by convert he using 1; dsimp only [k]; omega
           by_cases h:k=-1
           · rw [h] at hp ⊢; exact primitives _ _ (show (-2:ℤ) ≠ -1 by decide) hv (allows (by omega : (-2:ℤ)≤ -1) hp)
           exact allows (by omega) (primitives _ _ h hv hp)
    intro i; exact allows (show i ≤ b+(i-b).toNat by omega) (he _)
lemma moment_expands (m j k) : Expands (moment m j k) := by
    induction k using Nat.strong_induction_on generalizing j with
    | h k ih=>
      match k with
      | 0=> exact basic_expands m j
      | 1=>
          intro i; let b : ℤ:= max (-↑(j+2:ℕ)) i
          exact allows (show i ≤ b+1 from (le_max_right ..).trans (le_add_of_nonneg_right (by norm_num))) (derived (le_max_left ..) (basic_expands m j b))
      | k+2 =>
          intro i; apply ((((ih k (by omega) j).scale (m^2)).plus (ih k (by omega) (j+2))) i).upon; filter_upwards [mostly] with x hx; exact (moment_step _ _ _ _ hx.1).symm

/-! Polar decomposition of the public mode kernel. -/
namespace ModeExpansion
open MeasureTheory.Measure
open scoped NNReal ENNReal
variable (L : Hierarchy.Mode)

abbrev S2 := sphere (0:Space) 1
def angular := ∫ p:S2, L.numerator p ∂(volume (α:=Space)).toSphere

private def wheel := homeomorphUnitSphereProd Space
private def radial (s x : ℝ) :=
    1 / (2*freq L.mass x) * freq L.mass x ^ L.timeOrder * x^L.spatialOrder * Real.exp (-s*freq L.mass x)

private lemma turning : MeasurePreserving wheel
    ((volume (α:=Space)).comap Subtype.val) ((volume (α:=Space)).toSphere.prod (volumeIoiPow 2)) := by
    convert MeasureTheory.Measure.measurePreserving_homeomorphUnitSphereProd (volume (α:=Space)) using 1
    · rfl
    rw [show Module.finrank ℝ Space=3 from finrank_euclideanSpace_fin]
private lemma revolve (s) (p : S2) (v : Ioi (0:ℝ)) : L.kernel s (wheel.symm (p,v)) = L.numerator p * radial L s v.val := by
    have he : ‖p.val‖=1 := by simp
    change L.kernel s (v.val • p.val) = _
    change 1 / (2 * freq L.mass ‖v.val • p.val‖) *
      freq L.mass ‖v.val • p.val‖ ^ L.timeOrder * L.numerator (v.val • p.val) *
      Real.exp (-s * freq L.mass ‖v.val • p.val‖) = _
    rw [L.homogeneous _ _ v.property, norm_smul,
      Real.norm_of_nonneg (le_of_lt v.property), he, mul_one]
    unfold radial
    ring
private lemma swing (s : ℝ) (p : ({0}ᶜ:Set Space)) :
    L.kernel s p=L.numerator (wheel p).fst * (radial L) s (wheel p).2 := by
    rw [← (revolve L) s _ _,Prod.eta,Homeomorph.symm_apply_apply]
private lemma rays (s : ℝ) (x : Ioi (0:ℝ)) :
    Real.toNNReal ((x:ℝ)^2) • (radial L) s x = (2:ℝ)⁻¹ * stream L.mass L.spatialOrder L.timeOrder s x := by
    have hv : 0<x.val := x.property
    rw [NNReal.smul_def, Real.coe_toNNReal _ (by positivity),smul_eq_mul]; unfold radial stream
    have he := freq_pos L.mass hv; field_simp; ring

private lemma rad_int (s : ℝ) (hp : 0<s) : Integrable ((radial L) s ∘ Subtype.val) (volumeIoiPow 2) := by
    unfold volumeIoiPow ENNReal.ofReal
    apply (integrable_withDensity_iff_integrable_smul (μ:=(volume (α:=ℝ)).comap Subtype.val) (f:=fun x:Ioi (0:ℝ)=>Real.toNNReal (x.val^2)) (by fun_prop)).mpr
    have hv := integrableOn_iff_comap_subtypeVal measurableSet_Ioi |>.1 (((stream_int _ _ _ _ hp) : IntegrableOn (stream L.mass L.spatialOrder L.timeOrder s) _ _).const_mul (2:ℝ)⁻¹)
    exact hv.congr (ae_of_all _ fun x=> (rays L s x).symm)
lemma field_int (s : ℝ) (hp : 0<s) : Integrable (L.kernel s) := by
    have hc : MeasurableSet ({0}ᶜ:Set Space):= (measurableSet_singleton _).compl
    let f : S2→ℝ:= fun p=>L.numerator p.val
    haveI : CompactSpace S2 := isCompact_iff_compactSpace.mp (isCompact_sphere ..)
    have hv : Integrable f (volume (α:=Space)).toSphere := (show Continuous f from L.continuous.comp continuous_subtype_val).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _)
    rw [← restrict_compl_singleton (μ:=volume) (0:Space),← IntegrableOn, integrableOn_iff_comap_subtypeVal hc]
    exact ((turning.integrable_comp_emb wheel.measurableEmbedding).2 (hv.mul_prod (rad_int L s hp))).congr (ae_of_all _ fun u=> (swing L s u).symm)
lemma field_value (s : ℝ) : (∫ p : Space,L.kernel s p)=(angular L)*(2:ℝ)⁻¹ * moment L.mass L.spatialOrder L.timeOrder s := by
    let f : S2→ℝ:= L.numerator ∘ Subtype.val
    calc
       _ = ∫ p : ({0}ᶜ:Set Space), L.kernel s p ∂volume.comap Subtype.val := by rw [integral_subtype_comap]; simp ; measurability
       _ = ∫ p : S2 × Ioi (0:ℝ), f p.1 * (radial L) s p.2 ∂(volume (α:=Space)).toSphere.prod (volumeIoiPow 2) := by
           apply Eq.trans _ (turning.integral_comp wheel.measurableEmbedding _); apply integral_congr_ae; exact ae_of_all _ (swing L s)
       _ = _ := by
           rw [integral_prod_mul f (fun x:Ioi (0:ℝ)=> (radial L) s x)]
           change (angular L) * _ = _; rw [mul_assoc]; congr 1
           unfold volumeIoiPow ENNReal.ofReal
           rw [integral_withDensity_eq_integral_smul]
           · simp_rw [rays]; rw [integral_const_mul, integral_subtype_comap measurableSet_Ioi]; rfl
           exact (measurable_subtype_coe.pow_const _).real_toNNReal

end ModeExpansion

/-- Every public track has an expansion to arbitrary integer order. -/
lemma moments_expand (W : Hierarchy.Track) :
    Expands (fun s => ∏ i, ∫ p : Space, (W.modes i).kernel s p) := by
  let f i := fun s : ℝ => ∫ p : Space, (W.modes i).kernel s p
  have he (i : Fin W.n) : Expands (f i) := by
    let m := W.modes i
    rw [show f i = (ModeExpansion.angular m * (2 : ℝ)⁻¹) •
        moment (m.mass : ℝ) m.spatialOrder m.timeOrder from
      funext (fun s => ModeExpansion.field_value m s)]
    exact Expands.scale (moment_expands _ _ _) _
  have hv (x : Finset (Fin W.n)) : Expands (∏ i ∈ x, f i) := by
    induction x using Finset.induction_on with
    | empty => rw [Finset.prod_empty]; exact own one_board
    | insert i s h ih => rw [Finset.prod_insert h]; exact (he i).mult ih
  convert hv Finset.univ using 1
  ext p
  rw [Finset.prod_apply]

/-- Taking real parts preserves the finite power-log expansion. -/
lemma real_profile (terms : List (ℂ × Hierarchy.Track)) :
    Expands (fun r => (Hierarchy.wickProfile terms r).re) := by
  induction terms with
  | nil =>
    simp only [Hierarchy.wickProfile, List.map_nil, List.sum_nil, Complex.zero_re]
    exact own board.zero_mem
  | cons y terms ih =>
    rcases y with ⟨c, t⟩
    simp only [Hierarchy.wickProfile, List.map_cons, List.sum_cons, Complex.add_re,
      Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]
    exact Expands.plus (Expands.scale (moments_expand t) c.re) ih

end WickExcluded

open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

/-- No finite Wick profile can have a nonzero logarithmically suppressed limit. -/
theorem wickProfile_excluded' (F : ℝ → ℂ) (A : ℝ) (hA : 0 < A)
    (h : Tendsto (fun r : ℝ => (r ^ 8 * (Real.log r⁻¹) ^ 2) • F r) (𝓝[>] 0) (𝓝 (A : ℂ)))
    (terms : List (ℂ × Hierarchy.Track)) :
    ¬ F =ᶠ[𝓝[>] 0] Hierarchy.wickProfile terms := by
  intro hF
  apply hA.ne'
  apply WickExcluded.no_powerlog (WickExcluded.real_profile terms 0)
  have hreal : Tendsto _ _ (𝓝 (A : ℂ).re) :=
    (Complex.continuous_re.tendsto _).comp h
  apply hreal.congr'
  filter_upwards [hF] with r hr
  rw [Function.comp_apply, hr, Complex.real_smul, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im]
  ring

end YangMills.FreeField

#print axioms YangMills.FreeField.wickProfile_excluded'
