exact = 3 / (1 + 1.5^3);
err_RK = zeros(1, 5);
o_RK = zeros(1, 4);
err_Adams = zeros(1, 5);
o_Adams = zeros(1, 4);

fprintf("4-order Runge-Kutta\n");

for i = 1:5
    l = i - 1;
    h = 0.1/2^l;
    % 4-order Runge-Kutta
    y_RK = RungeKutta4(@func, h, 0, 3, 1.5);
    err_RK(i) = abs(y_RK - exact);
end

for i = 1:4
    o_RK(i) = log(err_RK(i) / err_RK(i + 1)) / log(2);
    fprintf("h = %f, err = %.15e, ok = %.15e\n", 0.1/2^(i - 1), err_RK(i), o_RK(i));
end

fprintf("4-order Implicit Adams\n");

for i = 1:5
    l = i - 1;
    h = 0.1/2^l;
    % 4-order Adams
    y_Adams = AdamsImplicit4(@func, h, 0, 3, 1.5);
    err_Adams(i) = abs(y_Adams - exact);
end

for i = 1:4
    o_Adams(i) = log(err_Adams(i) / err_Adams(i + 1)) / log(2);
    fprintf("h = %f, err = %.15e, ok = %.15e\n", 0.1/2^(i - 1), err_Adams(i), o_Adams(i));
end



%some function
function z = func(x, y)
    z = -x^2 * y^2;
end




function y = RungeKutta4(odefun, h, x0, y0, xn)
    y = y0;

    for x = x0:h:(xn - h)
        k1 = odefun(x, y);
        k2 = odefun(x + h / 2, y + h * k1 / 2);
        k3 = odefun(x + h / 2, y + h * k2 / 2);
        k4 = odefun(x + h, y + h * k3);
        y = y + h * (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    end

end



function y = AdamsImplicit4(odefun, h, x0, y0, xn)
    X = zeros(1, 4);
    Y = zeros(1, 4);
    X(1) = x0;
    Y(1) = y0;

    for j = 2:4
        X(j) = X(j - 1) + h;
        Y(j) = RungeKutta4(@func, h, 0, 3, X(j));
    end

    while xn - X(4) > h / 2 % solve rounding error, can not use 'xn - X(4) > 0', which would cause one more iteration
        y = Y(4) + h * (55 * odefun(X(4), Y(4)) - 59 * odefun(X(3), Y(3)) + 37 * odefun(X(2), Y(2)) - 9 * odefun(X(1), Y(1))) / 24;
        y = Y(4) + h * (9 * odefun(X(4) + h, y) + 19 * odefun(X(4), Y(4)) - 5 * odefun(X(3), Y(3)) + odefun(X(2), Y(2))) / 24;
        X = [X([2, 3, 4]), X(4) + h];
        Y = [Y([2, 3, 4]), y];
    end

end
