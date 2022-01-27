clc; clear all;
%
%ejecicio 2
fprintf('Ejercicio 1\n')
% Elsiguiente diagrama presenta un modelo sencillo de una red eléctrica 
% constituida por baterías, cablesy resistencias.

%   |________|________|
%   |        |        |     
%   |        |        |
%   | +    3[ ]  i2 6[ ]
%  10V       |        |      
%   | -      |___--___|
%   |       +|   --   |
%   |  i1   5V        |
%   |       -|        |
%   |      1[ ]  i3  [ ]3
%   |        |        |
%   |________|________|

% A partir de las leyes de Kirchhoff que señalan que la suma de voltajes en una
% malla es igual a la sumade los productos IR (intensidad x resistencia), 
% se llega al sistema de ecuaciones lineales simultáneas:

%  4i1 - 3i2  - 1i3 = 5
% -3i1 + 14i2 - 5i3 = 0
% -1i1 - 5i2  + 9i3 = 5

A = [4 -3 -1;-3 14 -5;-1 -5 9];
b = [5;0;5];
xi = [2;0;1]
tol = 0.001
Miter = 100

try
[x,numiter,err] = Jacobi(A,b,xi,tol,Miter);
i=1;
fprintf('Solución: \n')
while i <= length(x)
  fprintf('EC_%d = %.4f \n', i, x(i,1))
  i++;
endwhile
fprintf('Número de iteraciones: %d \n', numiter) 
fprintf('Solucion con un error menor a: %d \n', tol)
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
%
fprintf(newline)
fprintf('**********************************************************************')
fprintf(newline)

%ejecicio 2
fprintf('Ejercicio 2\n')
% Elsiguiente diagrama presenta un modelo sencillo de una red eléctrica 
% constituida por baterías, cablesy resistencias.

%   |________|________|
%   |        |        |     
%   |        |        |
%   | +    3[ ]  i2 6[ ]
%  10V       |        |      
%   | -      |___--___|
%   |       +|   --   |
%   |  i1   5V        |
%   |       -|        |
%   |      1[ ]  i3  [ ]3
%   |        |        |
%   |________|________|

% A partir de las leyes de Kirchhoff que señalan que la suma de voltajes en una
% malla es igual a la sumade los productos IR (intensidad x resistencia), 
% se llega al sistema de ecuaciones lineales simultáneas:

%  4i1 - 3i2  - 1i3 = 5
% -3i1 + 14i2 - 5i3 = 0
% -1i1 - 5i2  + 9i3 = 5

A = [4 -3 -1;-3 14 -5;-1 -5 9];
b = [5;0;5];
xi = [0;0;0]
tol = 0.000001
Miter = 100

try
[x,numiter,err] = Jacobi(A,b,xi,tol,Miter);
i=1;
fprintf('Solución: \n')
while i <= length(x)
  fprintf('EC_%d = %.4f \n', i, x(i,1))
  i++;
endwhile
fprintf('Número de iteraciones: %d \n', numiter) 
fprintf('Solucion con un error menor a: %d \n', tol)
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end