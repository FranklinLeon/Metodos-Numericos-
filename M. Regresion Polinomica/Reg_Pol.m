% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 11/11/2021 
% Funcion de Regresion Polinomial
% Ajuste con ecuaciones cuadráticas y polinomios de orden superior
%
% Entradas:
% m=grado del polinomio
% x=vector absisas
% y=vector columnas
%
% Salidas:
% polinomio=aproximacion polinomial del conjunto de datos
% erroraprox=error de aproximacion al conjunto de datos 
%

function [polinomio,erroraprox]=Reg_Pol(m,x,y)
  
  if nargin~=3   % verificamos que el numeros de argumentos de la funcion se correcto
    msgID = 'Regresion Polinomial: Numero de Argumentos no validos';
    msgbox = 'Error: Se debe ingresar un vector absisas, vector columnas  y el grado del polinomio';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msgbox)
  elseif length(x)~=length(y)
    msgID = 'Regresion Polinomial: Vetores de distintos tamaños';
    msgbox = 'Error: los vectores no dan el par ordenado (x,y) ya que sus tamaños son distintos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msgbox)
  elseif length(x)<m+1
    msgID = 'Regresion Polinomial: datos insuficientes';
    msgbox = 'Error: La cantidad de datos es menor al grado del polinomio la regresión no es posible';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msgbox)
    return
  endif
  
  n=[x y];            
  A=zeros(m+1,m+1);    %matriz de terminos independientes segun seal el grado que elijamos
  b=zeros(m+1,1);      %terminos independientes de la matriz A
% Iniciamos el metodo
% Generamos el sistema [A|b] de terminos independientes {a0,a1,a2,a3} que a su ves indican el grado del polinomio 
  for i=1:m+1
    for j=1:m+1
      for k=1:length(n)
        A(i,j)=A(i,j)+ x(k).^(i+j-2);
      endfor
    endfor
  endfor

  for i=1:m+1
    for k=1:length(n)
      b(i)=b(i)+(x(k).^(i-1))*y(k);
    endfor
  endfor  
%Determinamos la solucion del sistema de terminos independientes
 polinomio=inv(A)*b;
 polinomio=fliplr(polinomio'); %ordenamos los coeficientes de mayor a menor

%determinamos el error promedio
 eval=polyval(polinomio,x);
 suma_error=0;
 for k=1:length(n)
   aprox_err(k)=(y(k)-eval(k)).^2;
   suma_error=suma_error+aprox_err(k);
 endfor
 erroraprox=sqrt(suma_error)/length(n);
endfunction