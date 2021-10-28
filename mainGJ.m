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
      
clear all; clc;

A = [1 -1 -1;6 3 0;0 3 6]
b = [0;-4;-10]

try
  
[Solucion]=GJordan(A,b)

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end