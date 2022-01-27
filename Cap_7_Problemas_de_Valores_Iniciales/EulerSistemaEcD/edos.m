function [fx] = edos(x)

CA = x(1);
CB = x(2);

k1 = 5/6;
k2 = 5/3;
k3 = 1/6;
F_V = 4/7;
CAi = 10;

dx_dt(1) = F_V*(CAi-CA)-k1*CA-k3*CA^2;
dx_dt(2) = -F_V*CB+k1*CA-k2*CB;

fx = dx_dt;

end