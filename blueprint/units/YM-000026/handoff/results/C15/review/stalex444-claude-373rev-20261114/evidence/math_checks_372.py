# Arithmetic checks for trace-rounded-receipt.tex (review of #372); no Lean.
import sympy as sp, random, math
mu, n, eps, R = sp.symbols('mu n epsilon R', positive=True)
# Supply paragraph: I_k = log mu/(16n), a = e^{2I} = mu^{1/(8n)}, e^{I}/a = mu^{-1/(16n)}
I = sp.log(mu)/(16*n); a = sp.exp(2*I)
print('a == mu^(1/(8n)):', sp.simplify(a - mu**(1/(8*n))) == 0)
print('e^I/a == mu^(-1/(16n)):', sp.simplify(sp.exp(I)/a - mu**(-1/(16*n))) == 0)
# Cost lemma: mu >= eps^{-16n}  =>  mu^{-1/(16n)} <= eps (random test)
for _ in range(10000):
    nn = random.randint(2,40); e = random.uniform(0.5,1); m = e**(-16*nn)*random.uniform(1,5)
    assert m**(-1/(16*nn)) <= e*(1+1e-12)
print('cost lemma threshold: ok')
# Width lemma: r*mu^2 <= a_l and mu^2 >= 8R => r*R <= a_l/8
for _ in range(10000):
    Rv = random.uniform(1e-3,1e3); mu2 = 8*Rv*random.uniform(1,10); al = random.uniform(1e-6,1)
    r = al/mu2*random.uniform(0,1)
    assert r*Rv <= al/8*(1+1e-12)
print('width lemma: ok; R=100 gives mu^2>=800')
# Exponent at Prop: eps_i=(i+1)^-1, n=i+2: threshold mu >= (i+1)^{16(i+2)}
for i in range(5): print(i, 'log10 threshold on mu:', 16*(i+2)*math.log10(i+1))
# Alternative selection argument: s = a_k*mu_k^b' >= a_k (mu>=1, b'>=0); so s < min_{k<K} a_k forces level >= K
