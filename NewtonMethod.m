function [x,i]=NewtonMethod(f,df,x0,e)
i=0;
while 1
    i = i + 1;
    x = x0 - f(x0)/df(x0);
    if abs(x-x0) < e
        break;
    end
    x0 = x;
end
end