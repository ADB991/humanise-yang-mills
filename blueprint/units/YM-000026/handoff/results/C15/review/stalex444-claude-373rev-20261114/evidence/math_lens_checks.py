# Independent arithmetic checks for trace-rounded-receipt.tex (issue #372), math lens.
import sympy as sp, mpmath as mp
mu,n,eps,R,am,al,ak,m=sp.symbols('mu n epsilon R a_m a_l a_k m',positive=True)
# Lemma width: r*mu^2<=a_l and mu^2>=8R  =>  r*R<=a_l/8 ; check extremal case r=a_l/mu^2, mu^2=8R
r=al/mu**2
print('width extremal r*R =', sp.simplify((r*R).subs(mu,sp.sqrt(8*R))))
# Lemma cost: mu=eps^(-16n) gives mu^(-1/(16n)) = eps
print('cost equality case:', sp.simplify(sp.powsimp((eps**(-16*n))**(-1/(16*n)),force=True)))
# Supply: I=log(mu)/(16n), a=e^{2I}
I=sp.log(mu)/(16*n); a=sp.exp(2*I)
print('a =',sp.simplify(a), '; e^I/a =',sp.simplify(sp.exp(I)/a), '; mu^(-1/(16n)) =',sp.simplify(mu**(-1/(16*n))))
# Corrected-polynomial identity (parent): Phi01 from the cumulant recursion
f0,f1,j0,j1,S2=sp.symbols('f0 f1 j0 j1 S2')
P0=f0-j0; P1=f1-j1
Phi01=sp.solve(sp.Eq(f0*f1, sp.Symbol('X')+j0*P1+j1*P0+S2),sp.Symbol('X'))[0]
kappa=S2-j0*j1
print('Phi01 - [(f0-j0)(f1-j1)-kappa] =',sp.expand(Phi01-(P0*P1-kappa)))
# Concrete thresholds K: mu >= (i+1)^{16(i+2)} and mu^2>=800, with mu = exp((loglog beta)^2)
mp.mp.dps=30
for i in range(0,5):
    need=max(mp.mpf(i+1)**(16*(i+2)), mp.sqrt(800))
    u=mp.sqrt(mp.log(need));
    print(i,'mu needed >=',mp.nstr(need,6),' loglog(beta_hat) >=',mp.nstr(u,6),' log beta_hat >=',mp.nstr(mp.e**u,6))
# i=0 sanity: eps=1, n=2: cost condition is mu>=1 (automatic); width still needs mu^2>=800
