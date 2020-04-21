x0=1;
x1=3;

while abs(f(x1)) > 0.001
    fprintf("%f\n",x1);
    tmp = x1;
    x1=x1- f(x1)*(x1-x0)/(f(x1)-f(x0));
    x0 = tmp;
end