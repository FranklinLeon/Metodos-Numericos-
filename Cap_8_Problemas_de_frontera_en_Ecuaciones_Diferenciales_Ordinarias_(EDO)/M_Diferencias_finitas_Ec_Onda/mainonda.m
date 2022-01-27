clc; clear all; close all; 

a = -3; b = 3;
alpha=6; beta=2;
t=a:0.1:b;
r = @(t) sin(t+2)+2.*t.^5 -5;
N = 30;

x=-4:0.2:4;
y=x;
[X,Y] = meshgrid(x);
surf(X,Y,X.*exp(-X.^2 - Y.^2)); hold on;
try
  [soln,t] = onda(a,b,alpha,beta,r,N);
  figure(1)
  plot(t,soln,'-'); hold on;

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;
