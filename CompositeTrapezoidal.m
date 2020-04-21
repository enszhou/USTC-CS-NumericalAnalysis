function T=CompositeTrapezoidal(f,a,b,N)
n = N - 1;
h = (b-a)/n;
X = a:h:b;
Y = f(X);
T = h*(sum(Y)-0.5*Y(1)-0.5*Y(N));
