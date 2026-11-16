# Forward math-lane checks for trace-rounded-receipt.tex (FETCH_HEAD 0f00ae72)
import sympy as sp
mu,n,eps,R,a_l,a_k,b,I,y=sp.symbols('mu n epsilon R a_l a_k b I y',positive=True)
# (1) cost lemma: mu >= eps^(-16n)  =>  mu^(-1/(16n)) <= eps   (equality at threshold)
print('cost threshold:', sp.simplify((eps**(-16*n))**(-1/(16*n)) - eps))
# (2) supply: I_k = log mu/(16n), a = e^{2 I_k} = mu^{1/(8n)}, e^{I_k}/a = mu^{-1/(16n)}
Ik=sp.log(mu)/(16*n); a=sp.exp(2*Ik)
print('a == mu^(1/(8n)):', sp.simplify(a - mu**(1/(8*n)))==0)
print('e^I/a == mu^(-1/(16n)):', sp.simplify(sp.exp(Ik)/a - mu**(-1/(16*n)))==0)
# (3) width: r = a_k mu^b, (A): r mu^2 <= a_l ; |coord| <= r R ; mu^2>=8R => r R <= a_l/8
# worst case r = a_l/mu^2, mu^2 = 8R: r R = a_l/8
print('width worst case:', sp.simplify((a_l/(8*R))*R - a_l/8)==0, ' 8*100 =', 8*100)
# (4) Phi_{01} identity from parent recursion
f0,f1,j0,j1,S=sp.symbols('f0 f1 j0 j1 S')
Phi0,Phi1=f0-j0,f1-j1; Phi01=f0*f1-j0*Phi1-j1*Phi0-S
kappa=S-j0*j1
print('Phi01 identity:', sp.expand(Phi01-((f0-j0)*(f1-j1)-kappa))==0)
# (5) proposition: eps_i=(i+1)^{-1}, n=i+2 => eps_i^{-16n}=(i+1)^{16(i+2)}
i=sp.symbols('i',integer=True,nonnegative=True)
print('threshold i:', sp.simplify((1/(i+1))**(-16*(i+2)) - (i+1)**(16*(i+2)))==0)
# (6) rank-root ticket: r bound and beta b(g) with beta g^2 = 1
A,Na,cdir,beta,th,bh,Lam,delta=sp.symbols('A N_A c_dir beta theta betahat Lambda delta',positive=True)
g=beta**sp.Rational(-1,2)
print('beta b(g):', sp.simplify(beta*Na*(cdir*g**2/2+(A*g)**2/2) - Na/2*(cdir+A**2))==0)
