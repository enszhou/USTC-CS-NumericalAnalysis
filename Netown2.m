w = [0.8; 0.6];
while 1
    fprintf("%f %f\n",w(1), w(2));
    A = [2*w(1) 2*w(2); 3*w(1)^2 -1];
    B = [-f1(w(1), w(2)); -f2(w(1), w(2))];
    delta_w = A\B;
    w = w + delta_w;
    if sqrt(delta_w(1)^2 + delta_w(2)^2) < 0.001
        fprintf("%f %f\n",w(1), w(2));
        break;
    end
end
    