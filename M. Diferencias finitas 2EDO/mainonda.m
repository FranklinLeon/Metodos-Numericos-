clc; clear all; close all; 

a = -3; b = 3;
alpha=6; beta=2;

r = @(t) sin(t+2)+2.*t.^5 -5;
N = 30;

try
  [soln,t] = onda(a,b,alpha,beta,r,N);
  figure(1)
  plot(t,soln,'-'); hold on;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;
