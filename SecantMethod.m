function [x,i]=SecantMethod(f,x0,x1,e)
i = 0;
while 1
    i = i + 1;
    x = x1- f(x1)*(x1-x0)/(f(x1)-f(x0));
    if abs(f(x)) < e || abs(x - x1) < e
        break;
    end
    x0 = x1;
    x1 = x;
end
end