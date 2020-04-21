function [V, D] = eigenvalue_jacobi(A, M, e)
n = size(A, 1);
V = eye(n);
%%delta = e * sqrt(sum(A.^2));
for k=1:M
    max = 0;
    p = 1;
    q = 2;
    for i=1:n
        for j=1:n
            if i~=j && abs(A(i,j)) > max
                max = abs(A(i,j));
                p = i;
                q = j;
            end
        end
    end
    if A(p, q) ~=0
        s = (A(q,q)-A(p,p))/(2*A(p,q));
        if s >= 0
            t = (-s + sqrt(1+s^2));
        else
            t = (-s - sqrt(1+s^2));
        end 
        c = 1/sqrt(1+t^2);
        d = t *c;
    else
        c = 1;
        d = 0;
    end
    Q = eye(n);
    Q(p,p)=c;
    Q(q,q)=c;
    Q(p,q)=d;
    Q(q,p)=-d;
    A = Q'*A*Q;
    V = V*Q;    
    off = sqrt(sum((A - diag(diag(A))).^2));
    if off < e
        break;
    end
end     
D = A;
end