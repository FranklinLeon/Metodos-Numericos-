% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 25/10/2021
% Descripcion: Se presentan dos ejemplos de la implementación del script que simula el método
% de descomposicion La factorizaci´on LU de una matriz es una factorizaci´on que resume el proceso de eliminacion gaussiana
% aplicado a la matriz y que es conveniente en terminos del numero total de operaciones de punto flotante cuando
% se desea calcular la inversa de una matriz o cuando se resolvera una serie de sistemas de ecuaciones con una
% misma matriz de coeficientes. 

% Problema 1:
% Elsiguiente diagrama presenta un modelo sencillo de una red eléctrica 
% constituida por baterías, cables y resistencias.

%    ________ ________
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
%    ________ ________
% A partir de las leyes de Kirchhoff que señalan que la suma de voltajes en una
% malla es igual a la sumade los productos IR (intensidad x resistencia), 
% se llega al sistema de ecuaciones lineales simultáneas:

%  4i1 - 3i2  - 1i3 = 5
% -3i1 + 14i2 - 5i3 = 0
% -1i1 - 5i2  + 9i3 = 5
A = [4 -3 -1;-3 14 -5;-1 -5 9]
b = [5;0;5]
%n=size(A);
tipo=1;
try
  fprintf('EJercicio 1\n');
  [l,u] = descomposicionLU(tipo,A,b)
  print(l);
  print(u);
  catch err
  warning(err.identifier, err.message);
end
% Problema 2:
% Elsiguiente diagrama presenta un modelo de un circuito electrico que se requiere
% encontrar las corrientes I1, I2 e I3.
%    ________ ________
%   |        | |Io    |  
%   |        | v      |     
%   |        |        |
%   | +   10[ ]  i2  [ ]24
%  24V       |        |      
%   | -      |___--___|
%   |       +|   --   |
%   |  i1   5V    4   |
%   |       -|        /\
%   |     12[ ]  i3   4Io
%   |        |        \/
%   |________|________|

% Se plantean 3 mallas para obtener el sistema de ecuaciones que se muestra a continuacion.

%  22i1 -10i2  -12i3 = 24
% -10i1 +38i2  - 4i3 =  0
%  -8i1 - 8i2  +16i3 =  0
A = [22 -10 -12;-10 38 -4;-8 -8 16]
b = [24;0;0]
%n=size(A);
tipo=1;
try
  fprintf('EJercicio 2\n');
  [l,u] = descomposicionLU(tipo,A,b)
  print(l);
  print(u);
  catch err
  warning(err.identifier, err.message);
end