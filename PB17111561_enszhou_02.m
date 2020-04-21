function PB17111561_enszhou_02()

    for n = [5 10 20 40]
        I = 0:n;
        X1 = -5 + 10 * I / n;
        X2 = -5 * cos((2 * I + 1) * pi / (2 * n + 2));
        Y1 = 1 ./ (1 + X1.^2);
        Y2 = 1 ./ (1 + X2.^2);
        A1 = [X1; Y1];%The first set of interpolation points
        A2 = [X2; Y2];%The second set of interpolation points
        J = 0:500;
        X = -5 + 10 * J / 500;%test point
        F = 1 ./ (1 + X.^2);  %the exact value
        L1 = zeros(1, 501);   %approximation from set A1 
        L2 = zeros(1, 501);   %approximation from set A2 

        for k = 1:501
            l = Lagrange(X(k), A1);
            L1(k) = l;
            l = Lagrange(X(k), A2);
            L2(k) = l;
        end

        Error1 = F - L1;
        Norm_Error1 = abs(Error1);
        MAX_Norm_Error1 = max(Norm_Error1);
        
        Error2 = F - L2;
        Norm_Error2 = abs(Error2);
        MAX_Norm_Error2 = max(Norm_Error2);
        fprintf("n=%-2d, MAX_Norm_Error1=%.15e, MAX_Norm_Error2=%.15e\n", n, MAX_Norm_Error1, MAX_Norm_Error2);
    end

end

function l = Lagrange(x, A) 
%x: a scalar to be calculated
%A: [X;Y], an interpolation points set
    X = A(1, :);
    Y = A(2, :);
    len = length(X);
    l = 0;  %li(x)

    for i = 1:len
        s = 1;

        for j = 1:len

            if j == i
                continue;
            end

            s = s * (x - X(j)) / (X(i) - X(j)); 
        end

        s = s * Y(i);
        l = l + s;
    end

end
