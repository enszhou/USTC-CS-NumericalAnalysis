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
    for i=n:1
        for j=(i+1):n
            b(i) = b(i) - A(i,j)*b(j);
        end
        b(i) = b(i)/A(i,i);
    end
    X = b;
end