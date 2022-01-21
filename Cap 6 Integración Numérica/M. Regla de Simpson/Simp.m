% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 09/12/2021 

% Método Regla de Simpson 1/3 y 3/8.
%
% DATOS DE ENTRADA:
%
% f = función
% linf = Límite inferior.
% lsup = Límite superior.
% N = Número de intervalos.
%
% VARIABLES DE SALIDA:
%
% I = Integral de simpson
%
% La funcion determina automaticamente que regla de simpson usar 
% Si N es par se elige la regla de Simpson de 1/3
% si N es divisible por 3, se elige la regla de Simpson de 3/8 
% Si N es impar y no es divisible por 3 se combinan los 2 metodos
 
function [ I ] = Simp(f,linf,lsup,N)

if nargin~=4  % verificamos que el numeros de argumentos de la funcion se correcto
msgid = 'Regla de Simpson Se debe ingresar una funcion los limites superior e inferior y el numero de intervalos';
msg = 'Error: El numero de datos no es correto';
#baseException = MException(msgID,msg);
#throw(baseException);
error(msg, msgid)

elseif N<0
msgid = 'Regla de Simpson: el numero de puntos no exite';
msg = 'Error: los valores no son validos';
#baseException = MException(msgID,msg);
#throw(baseException);
error(msg, msgid)
endif

% Generamos el dominio para evaluarlo
X=linspace(linf,lsup,N+1);
% Evaluación de la función en cada N
F=f(X);
% para N par
if mod(N,2)==0
% aplicamos la regla de Simpson 1/3 
    I=((lsup-linf)/(3*N))*(F(1)+F(end)+4* sum(F(2:2:end-1)) + 2*sum (F(3:2:end-1)));
% para N divisible para 3
elseif mod(N,3)==0
    if N==3
% aplicamos la regla simple de Simpson 3/8    
        I=(lsup-linf)/8*(f(X(1))+3*f(X(2))+3*f(X(3))+f(X(4))); 
    % aplicamos la regla multiple de Simpson 3/8   
    else
        L=sort([0:N,3:3:N-1]);
        B=reshape(L,4,[])+1;
        B=B';
        I=3*(lsup-linf)/(8*N)*sum(f(X(B(:,1)))+3*f(X(B(:,2)))+3*f(X(B(:,3)))+f(X(B(:,4))));
    endif
    
% si no es posible aplicar la regla de simpson de 1/3 y 3/8 aplicamos una regla de simp compuesta por los 2 metodos    
else 
    I1=((X(end-3)-X(1))/(3*(N-3)))*(F(1)+F(end-3)+4* sum(F(2:2:end-4)) + 2*sum (F(3:2:end-4)));
    I2=(X(end)-X(end-3))/8*(f(X(end-3))+3*f(X(end-2))+3*f(X(end-1))+f(X(end)));    
    I=I1+I2;    
endif 
endfunction
