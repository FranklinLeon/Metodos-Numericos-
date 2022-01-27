function [fx] = edos2(x)

dx_dt(1) = -0.5*x(1);
dx_dt(2) = 4-0.3*x(2)-0.1*x(1);

fx = dx_dt;

end
