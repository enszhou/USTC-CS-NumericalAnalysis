A = [31 -13 0 0 0 -10 0 0 0;
-13 35 -9 0 -11 0 0 0 0;
0 -9 31 -10 0 0 0 0 0;
0 0 -10 79 -30 0 0 0 -9;
0 0 0 -30 57 -7 0 -5 0;
0 0 0 0 -7 47 -30 0 0;
0 0 0 0 0 -30 41 0 0;
0 0 0 0 -5 0 0 27 -2;
0 0 0 -9 0 0 0 -2 29;];
b = [-15 27 -23 0 -20 12 -7 7 10];
b = b';
e = 10^(-7);
M = 100000;

[steps, X] = GaussSeidel(A, b, e);
fprintf("GaussSeidel:\nsteps = %d\n",steps);
n = size(A, 1);
for i=1:n
    fprintf("x%d = %.15e\n",i,X(i));
end

fprintf("\nSOR:\n");
min_steps = M;
for w =(1:99)/50
    fprintf("\ni = %2d, w = %.2f", int32(w*50), w);
    [steps, X] = SOR(A, b, w, M, e);
    if steps == M
        fprintf("\nIteration does not converge\n");
    else
        if(steps < min_steps)
            min_steps = steps;
            best_w = w;
        end
        fprintf(", steps = %d\n",steps);
        for i=1:n
            fprintf("x%d = %.15e\n",i,X(i));
        end
    end
end
fprintf("\nThe best relaxation factor = %.2f, min steps = %d\n", best_w, min_steps);



function [steps, X] =  GaussSeidel(A,b,e)
n = size(A,1);
steps = 0;
X = zeros(n,1);
while 1
    u = X;
    for i=1:n
        X(i) = (b(i)-A(i,:)*X+A(i,i).*X(i))/A(i,i);
    end
    steps = steps + 1;
    if max(abs(u-X)) < e
        break;
    end
end
end

function [steps, X] = SOR(A, b, w, M, e)
n = size(A,1);
X = zeros(n,1);
for steps = 1:M
    u = X;
    for i=1:n
        X(i) = (1-w)*X(i) + w*(b(i)-A(i,:)*X+A(i,i).*X(i))/A(i,i);
    end
    if max(abs(u-X)) < e
        break;
    end
end
end
        