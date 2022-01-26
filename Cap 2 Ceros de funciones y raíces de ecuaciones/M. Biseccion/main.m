% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
%
% Fecha: 10/09/2021
% Descripcion: Se presentan dos ejemplos de la implementación del script que simula el método
% de Bisección, el cual tiene como objetivo, aproximar la raíz de una funcion cualquiera.
% El programa será capaz de mostrar las iteraciones con sus respectivos valores, además de un
% gráfico que muestra los puntos de cada iteración así como el trazado de la función. 


% Problema 1:
%   
% La primera función a probar será: 2*x^3-2*x
% A la cual le daremos unos limites inferior y superior de 0.5 y 2 respectivamente.
% Además de 14 iteraciones como máximo. 
  
funcion='2*x.^3-2*x'
ai=0.5
bi=2
it=14
figure(1);
try 
  bis(funcion,ai,bi,it)
end 

% Problema 2:
%   
% La seguna función a probar será: sin(x)+2x-1, a la cual no se puede despejar la x facilmente.
% Le daremos unos limites inferior y superior de 0 y 1 respectivamente.
% Además de 18 iteraciones como máximo. 

funcion='sin(x)+2*x-1'
ai=0
bi=1
it=18
figure(2);
try 
  bis(funcion,ai,bi,it)
end 