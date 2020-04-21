A = [5 10 3 12 5 50 6];
m = zeros(6,6);
ps = zeros(6,6);
for len = 1:6
    for i = 1:6-len
        j = i + len;
        min = m(i, i) + m(i+1, j) + A(i)*A(i+1)*A(j+1);
        p = i;
        for k = (i+1):j-1
            tmp = m(i, k) + m(k+1,j)+A(i)*A(k+1)*A(j+1);
            if(min > tmp)
                min = tmp;
                p = k;
            end
        end
        m(i,j) = min;
        ps(i,j) = p;
    end
end
