% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 03/12/2021 
% Cuadratura de Gauss o Gauss Legendre
% con esta funcion se aproximara a encontrar la integral de una funcion
%
% Entradas:
% f=Funcion a analizar
% a=punto de inicio
% b=punto final
% n=numero de puntos 2-3
%
% Salidas:
% integral=valor de la integral obtenida
% erroraprox=error del metdodo
%

function [integral]=cuad_gauss(f,a,b,n)
  
  % Cambiamos los limites de Integracion
  F = @(t) f(((b-a)*t+(b+a))/2);
  
  if nargin~=4   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Cuadratura de GaussSe debe ingresar un vector absi: Numero de Argumentos no validos';
    msg = 'Error: El numero de datos no es correto';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    
  elseif n<2 || n>3
    msgid = 'Cuadratura de Gauss: el numero de puntos no exites';
    msg = 'Error: los valores que se pueden esoger son 2 o 3';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif  
  if n==2
    w1=1; w2=1;
    x1=1/sqrt(3); x2=-1/sqrt(3);
    integral=((b-a)/2)*(w1*F(x1)+w2*F(x2));
  elseif n==3
    w1=5/9; w2=8/9; w3=5/9;
    x1=sqrt(3/5); x2=0; x3=-sqrt(3/5);
    integral=((b-a)/2)*(w1*F(x1)+w2*F(x2)+w3*F(x3)); 
  endif
endfunction