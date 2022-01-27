clear all;
clc;

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

      
A = [4 -3 -1;-3 14 -5;-1 -5 9]
b = [5;0;5]

try
  
[M,s]=gauss(A,b)
[Solucion]=sustreg(A,b)
print(M,s);
print(Solucion);

catch err
  warning(err.identifier, err.message);
end