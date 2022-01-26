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
      

A = [1,1,0,0,0;0,1,-1,1,0;0,0,0,1,1;1,0,0,0,1;0,0,0,0,1];
b = [800,300,500,600,10];
tic

try
  
[Solucion,it]=GJordan(A,b)

catch err
  fprintf('Error: %s\n',err.message);
  fprintf('Iteraciones = %i \n', it')
  %err.identifier
end
toc