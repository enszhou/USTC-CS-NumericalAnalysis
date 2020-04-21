exact_value = cos(1)-cos(5);
T = zeros(13);
S = zeros(13);
error_T = zeros(13);
error_S = zeros(13);
for l = 1:13
    N = 2^l+1;
    T(l) = CompositeTrapezoidal(@sin,1,5,N);
    S(l) = CompositeSimpson(@sin,1,5,N);
    error_T(l) = abs(exact_value - T(l));
    error_S(l) = abs(exact_value - S(l));
end

fprintf("Composite Trapezoidal Rule:\n");
for l=1:12
    order_T = log(error_T(l)/error_T(l+1))/log(2);
    fprintf("l = %-2d, T = %.15e, error_T = %.15e, order_T = %.15e\n", l, T(l), error_T(l), order_T);
end

fprintf("\nComposite Simpson Rule:\n");
for l = 1:12    
    order_S = log(error_S(l)/error_S(l+1))/log(2);
    fprintf("l = %-2d, S = %.15e, error_S = %.15e, order_S = %.15e\n", l, S(l), error_S(l),order_S);
end

