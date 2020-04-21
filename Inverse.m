A = [1 2 0 1;-1 0 2 3;2 3 1 5;0 1 7 3;];
n = size(A,1);
A_inv = zeros(n,n);
I = eye(n);
for j=1:n
    [steps, X] = GaussSeidel(A, I(:,j), 10^(-3));
    A_inv(:,j) = X;
end
A_inv


function [steps, X] =  GaussSeidel(A,b,e)
A([1,2],:) = A([2,1],:);
b([1,2]) = b([2,1]);
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
        