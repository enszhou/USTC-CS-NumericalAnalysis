x = 4;
excat = sqrt(11);
while 1
    fprintf("%ld\n",x);
    if abs(x - excat) < 0.0001
        break;
    end
    x = (x + 11/x)/2;
end