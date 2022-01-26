%METODO DE HAUN: Halla la solución numérica de uns sistema de ecuaciones diferenciales
%             
%      [datos] = pmedio(f,x0,y0,x1,h)
%       Salidas:
%       datos = Matriz con los datos intermedios
%       Entradas:
%       f = función a integrar 
%       x0 = limite inferior
%       x1 = limite superior
%       y0 = evaluacion de x0 en y1 y y2
%       ne = número de ecuaciones 
%       h = tamaño de paso

function [datos] = haun(x0,x1,y0,ne,f,h)
  if nargin('pmedio')=!5
  msgID = 'Trapecio:datos de ingreso';   %capturamos el error de no tener el numero 
  msg = 'Datos de ingreso incompletos(f,b,a,n)'; % de entradas correcto
  error(msgID,msg);
  endif
  N=round((x1-x0)/h);
  x=linspace(x0,x1,N+1);  %se generan N puntos, el espacio entre los puntos es (x1-x0)/N
  y=zeros(ne,N+1);    %se crea la matiz donde van a ir los resultados para y1 y y2
  y(:,1)=y0;
  
  for k=1:N
    k1=f(x(k),y(:,k));
    k2=f(x(k)+h,y(:,k)+k1*h);
    y(:,k+1)=y(:,k)+h/2*(k1+k2);
  endfor
  datos=[x',y'];
  
