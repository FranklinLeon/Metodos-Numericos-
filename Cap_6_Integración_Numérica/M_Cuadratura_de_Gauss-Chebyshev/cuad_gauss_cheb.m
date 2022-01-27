% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 03/12/2021 
% Cuadratura de Gauss-Chebyshev
% con esta funcion se aproximara la integral de una funcion
%
% Entradas:
% f=Funcion a analizar
% a=punto de inicio
% b=punto final
% n=numero de puntos 
%
% Salidas:
% I=valor de la integral obtenida
% 
%

function [I]=cuad_gauss_cheb(f,a,b,n)
 
  
  if nargin~=4   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Cuadratura de GaussSe debe ingresar un vector absi: Numero de Argumentos no validos';
    msg = 'Error: El numero de datos no es correto';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif  
  
  Wi= pi/(n+1);
  I=0;
  
  for i= 0:n
    xi = cos((2*i + 1)*pi/(2*n+2));
    I = I + Wi * f(xi);
  endfor
  
endfunction