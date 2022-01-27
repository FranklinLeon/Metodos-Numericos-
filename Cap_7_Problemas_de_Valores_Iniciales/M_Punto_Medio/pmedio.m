%PUNTO MEDIO Halla una aproximación a la integral de una expresión
%             
%      [datos] = pmedio(f,x0,y0,x1,h)
%       Salidas:
%       datos = Matriz con los datos intermedios
%       Entradas:
%       f = función a integrar 
%       x0 = limite inferior
%       x1 = limite superior
%       y0 = evaluacion de x0
%       h = tamaño de paso


function [datos] = pmedio(f,x0,y0,x1,h)

n=((x1-x0)/h)+1;
if nargin('pmedio')=!5
  msgID = 'Trapecio:datos de ingreso';   %capturamos el error de no tener el numero 
  msg = 'Datos de ingreso incompletos(f,b,a,n)'; % de entradas correcto
  error(msgID,msg);
endif

for i=1:n
    y1=y0+h*f(x0+h/2);
     
    datos(i,1)=x0; %almaceno los datos 
    datos(i,2)=y0;
    y0=y1;
    x0=x0+h;
end