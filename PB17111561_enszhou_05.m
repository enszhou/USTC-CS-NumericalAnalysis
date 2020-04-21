N = [0.1 0.2 0.9 9.0];
S = [-0.1 -0.2 -2.0 0.9;0.1 0.2 0.9 9.0];
error = 10^(-8);
fprintf("Newton Algorithm:\n");
for i=1:4
    [x_Newton,times_Newton] = NewtonMethod(@(x) x.^3/3-x,@(x) x.^2-1,N(i),error);
    fprintf("x0 = %.1f, x = %.15e, times = %d\n", N(i), x_Newton, times_Newton);
end
fprintf("Secant Algorithm:\n");
for i=1:4
    [x_Secant,times_Secant] = SecantMethod(@(x) x.^3/3-x,S(1,i),S(2,i),error);
    fprintf("x0 = %.1f, x1 = %.1f, x = %.15e, times = %d\n", S(1,i), S(2,i), x_Secant, times_Secant);
end