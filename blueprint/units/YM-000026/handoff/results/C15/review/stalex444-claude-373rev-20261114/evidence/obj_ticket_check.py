# Check: under the source hypotheses, P_R(X) - 4D log g / q <= T_M ; and that without them it can fail.
import math, random
random.seed(1)
def PR(r,NA,beta,bg,X,h,cm): return 2*r+NA+beta*bg+X+3*h-4*math.log(cm)
def TM(A,NA,cdir,M,h,cm): return 2*(1+8*A+1)+NA+NA/2*(cdir+A*A)+(1+M)+3*h-4*math.log(cm)+1
worst=-1e9
for _ in range(200000):
    A=random.uniform(0,5); NA=random.randint(1,12); cdir=random.uniform(0.1,5); M=random.randint(1,6)
    h=random.uniform(0,3); cm=random.uniform(0.01,1); D=random.randint(1,30)
    thc=random.uniform(0.001,1); bhat=random.uniform(1,min(1/thc**3,1/thc**4)); Lc=random.uniform(0,1/thc**2)
    thR=random.uniform(0,thc); Lam=random.uniform(0,Lc); delta=random.uniform(0,1)
    beta=random.uniform(1/thR**2 if thR>0 else 1,4*bhat) if (thR>0 and 1/thR**2<=4*bhat) else None
    if beta is None: continue
    g=beta**-0.5
    if g>thR: continue
    q=random.uniform(8*D*bhat,1e6*max(1,8*D*bhat))  # 8D bhat/q <= 1
    r=delta+beta*(A*thR**3+A*thR**4)+Lam*thR**2
    bg=NA*(cdir*g*g/2+(A*g)**2/2)
    X=random.uniform(0,1+M)
    lhs=PR(r,NA,beta,bg,X,h,cm)-4*D*math.log(g)/q
    worst=max(worst,lhs-TM(A,NA,cdir,M,h,cm))
print("max of LHS - T_M under hypotheses (should be <=0):",worst)
# counterexample with harmonic hypothesis dropped: q small
A,NA,cdir,M,h,cm,D=1,6,1,2,0,1,8; beta=1e6; g=beta**-0.5; q=1
r=0; bg=NA*(cdir*g*g/2+(A*g)**2/2); X=3
print("harmonic dropped: LHS-T_M =",PR(r,NA,beta,bg,X,h,cm)-4*D*math.log(g)/q-TM(A,NA,cdir,M,h,cm))
# counterexample with r hypothesis dropped (delta=5)
q=1e9; r=5
print("delta>1 (r large): LHS-T_M =",PR(r,NA,beta,bg,X,h,cm)-4*D*math.log(g)/q-TM(A,NA,cdir,M,h,cm))
