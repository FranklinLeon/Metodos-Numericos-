%Euler Halla una aproximación a la integral de una expresión
%             
%      [xi,yi,x,y] = pmedio(f,x0,y0,x1,h)
%       Salidas:
%       xi,yi = vectores con los datos calculados de euler
%       x,y = vectores con los datos reales calculados
%       Entradas:
%       f = función a usar 
%       xi,yi = Condiciones iniciales
%       h = tamanio de paso
%       n = contador para la formula
%       xf = punto final
function [xi,yi,x,y] = euler(xi,yi,h,n,xf,f)
if nargin('euler')=!6
  msgID = 'Euler:datos de ingreso';   %capturamos el error de no tener un numero 
  msg = 'Datos de ingreso incompletos(xi,yi,h,n,xf,fn)'; % de entradas correcto
  error(msgID,msg);
endif  
  
for i=xi:h:xf
  fxy = f(xi(n-1),yi(n-1));
  yi(n)= yi(n-1)+h*fxy;
  xi(n) = xi(n-1) + h;
  n = n+1;
endfor


%solucion analitica
n=2;
y=yi(1);
x=xi(1);
for i = xi(1):h:xf
  y(n) = -(i^4)/2+4*i^3-10*i^2+8.5*i+1;
  x(n) = i;
  n= n+1;
  
endfor

endfunction