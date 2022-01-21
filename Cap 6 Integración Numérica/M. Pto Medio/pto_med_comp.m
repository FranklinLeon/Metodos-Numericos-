% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 09/12/2021 

% Integracion por aproximacion del punto medio.
%
% DATOS DE ENTRADA:
%
% g = función
% a = Límite inferior.
% b = Límite superior.
% N = Número de intervalos.
%
% VARIABLES DE SALIDA:
%
% integralpm = Integral por el metodo del punto medio

function [integralpm] = pto_med_comp(g,a,b,N)
    
    if nargin~=4   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Punto Medio Se debe ingresar una funcion los limites superior e inferior y el numero de intervalos';
    msg = 'Error: El numero de datos no es correto';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    elseif N<0
    msgid = 'Regla de Simpson: el numero de puntos no existe';
    msg = 'Error: los valores no son validos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif
    
    
    %determinamos los puntos medios para la integracion
    h=(b-a)/N;
    I=0;
    %hallamos las integrales parciales de la curva
    for j=0:N-1
      x=a+j*h;
      I=I+(h)*g((2*x+h)./2);
    endfor
    %determinamos el valor total de la integral
    integralpm=I;
endfunction