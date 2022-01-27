clear;
clc;
a=0;
b=2;
c=0;
d=1;
m=5;
n=6;
tol=1^(-10);
it=100;
f=@(x,y) x.*exp(y);
g1=@(x,y) x;
g2=@(x,y) 2*exp(+y);
g3=@(x,y) x*exp(1);
g4=@(x,y) 0;
datos="";

try
  fprintf('  i  j   x(i)  y(j)    w(i,j)  \n\n' )
  [w] = diffinitasPoisson(a,b,c,d,m,n,tol,it,f,g1,g2,g3,g4);
  surf(w)
catch err
  fprintf('Error: %s\n',err.message);
end