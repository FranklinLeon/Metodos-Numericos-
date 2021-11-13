fprintf('Ejercicio 1 \n')
%Luego de hacer el análisis de un circuito por el método de mallas se obtiene el
%siguiente sistema de ecuaciones,
%
%  28I1 - 9I2 + 9I3  = 15
% -9I1 + 18I2 + 3I3  = 10
%  9I1 +  3I2 + 20I3 = 15
%
%En donde I1, I2 E I3 representan las corrientes en cada malla.
A = [28,-9,9;-9,18,3;9,3,20]
b = [15;10;15]
tol=10^(-3);
itmax=300;
try
[x,error,it]=gauss_seidel(A,b,tol,itmax);
i=1;
fprintf('Solución: \n')
while i <= length(x)
  fprintf('I%d = %.4f \n', i, x(i,1))
  i++;
  endwhile
fprintf('Error: %.5f \n', error)
fprintf('Número de iteraciones: %d \n', it)
catch err
fprintf('Error: %s\n',err.message);
end


fprintf('Ejercicio 2\n')
%Luego de hacer el análisis de un circuito por el método de mallas se obtiene el
%siguiente sistema de ecuaciones,
%
%  4i1 - 3i2  - 1i3 = 5
% -3i1 + 14i2 - 5i3 = 0
% -1i1 - 5i2  + 9i3 = 5
%
%En donde I1, I2 E I3 representan las corrientes en cada malla.
A = [4 -3 -1;-3 14 -5;-1 -5 9]
b = [5;0;5]
tol=10^(-3);
itmax=300;
try
[x,error,it]=gauss_seidel(A,b,tol,itmax);
i=1;
fprintf('Solución: \n')
while i <= length(x)
  fprintf('I%d = %.4f \n', i, x(i,1))
  i++;
  endwhile
fprintf('Error: %.5f \n', error)
fprintf('Número de iteraciones: %d \n', it)
catch err
fprintf('Error: %s\n',err.message);
end


clear; clc; close all;


data = csvread('Admision.csv',1,0);

x = data(:,2);
y = data(:,9);


try
[a0,a1] = minimos_cuadrados(x,y);
end