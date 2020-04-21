function S=CompositeSimpson(f,a,b,N)
n = N - 1;
h = (b-a)/n;
X = a:h:b;
Y = f(X);
S = 0;
for i=1:N
    if i==1 || i == N
        S = S + Y(i);
    elseif mod(i,2) == 1
        S = S + 2*Y(i);
    else
        S = S + 4*Y(i);
    end
end
S = h*S/3;
