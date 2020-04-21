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
X = GaussColumn(A,b);
n = size(A, 1);
for i=1:n
    fprintf("x%d = %.15e\n",i,X(i));
end

function X = GaussColumn(A, b)
    n = size(A, 1);
    for i = 1:n
        k = i;
        for j=(i+1):n
            if(abs(A(j,i)) > abs(A(k, i)))
                k = j;
            end
        end
        A([i k],:) = A([k i],:);
        b([i k]) = b([k i]);
        for j=(i+1):n
            coe = A(j,i) / A(i,i);
            A(j,:) = A(j,:) - coe * A(i,:);
            b(j) = b(j) - coe * b(i);
        end         
    end
    for i=n:-1:1
        for j=(i+1):n
            b(i) = b(i) - A(i,j)*b(j);
        end
        b(i) = b(i)/A(i,i);
    end
    X = b;
end
