f = @(x) ( 1 + sin(x));
a=0;
b=pi;
N=5;

[integralpm]=pto_med_comp(f,a,b,N)