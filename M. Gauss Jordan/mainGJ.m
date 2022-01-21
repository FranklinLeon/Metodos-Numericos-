% Ejercicio 1
% Resolver el siguiente sistema por las leyes de kircchoff por nodos
%
%          ._____+R1-______.______+R2-_____.
%          |      2       a|       4       |
%          |               | -             |+
%          |             v2=6v           V3=4V 
%          |               | +             |-
%          | -             |               |
%        V1=10V            |               |
%          | +             |               |
%          |              -|              +|
%          |              R4              R5
%          |              +| 3            -|2
%          |               |               |
%          .______-R3+_____._______________.
%                  4       b 
%
% iR1 ingresa a 'a'
% iR2 sale de 'b'
% ifv2 sale de 'a'
%
% Sistema de Ecuaciones
%   i1 -  i2 -   i3 = 0
%  6i1 + 3i2        = -4   
%      + 3i2 + 6i3  = -10
% 

%ejecicio 2

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

    
clear all; clc;


% Ejecicio 1
A = [1 -1 -1;0 3 6;6 3 0]
b = [0;-4;-10]

% Ejecicio 2
%A = [4 -3 -1;-3 14 -5;-1 -5 9]
%b = [5;0;5]

try
  
[Solucion]=GJordan(A,b)

catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end