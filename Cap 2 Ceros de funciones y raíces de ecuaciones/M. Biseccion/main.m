% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
%
% Fecha: 10/09/2021
% Descripcion: Se presentan dos ejemplos de la implementaci�n del script que simula el m�todo
% de Bisecci�n, el cual tiene como objetivo, aproximar la ra�z de una funcion cualquiera.
% El programa ser� capaz de mostrar las iteraciones con sus respectivos valores, adem�s de un
% gr�fico que muestra los puntos de cada iteraci�n as� como el trazado de la funci�n. 


% Problema 1:
%   
% La primera funci�n a probar ser�: 2*x^3-2*x
% A la cual le daremos unos limites inferior y superior de 0.5 y 2 respectivamente.
% Adem�s de 14 iteraciones como m�ximo. 
  
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
% La seguna funci�n a probar ser�: sin(x)+2x-1, a la cual no se puede despejar la x facilmente.
% Le daremos unos limites inferior y superior de 0 y 1 respectivamente.
% Adem�s de 18 iteraciones como m�ximo. 

funcion='sin(x)+2*x-1'
ai=0
bi=1
it=18
figure(2);
try 
  bis(funcion,ai,bi,it)
end 