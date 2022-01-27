%   Metodo Simpson 3/8.
%       [simp] = simpson(x,f)
%       simp = resultado obtenido del metodo
%       x = vector dominio en que se desea evaluar
%       f = funcion a integrar
function [simp38] = simpson38(x,f)
  a = x(1);                        % primer elemento del vector x, extremo inferior
  b = x(end);                      % ultimo elemento dle vector x, extremo superior
  if a == b
    msgID = 'DSIMPSON:tamaño';
    msg = 'Dominio no valido';
    error(msgID,msg);
  endif
  h=(b-a)/3;
  f0 = f(a);
  f1 = f(a+h);
  f2 = f(a+2*h);
  f3 = f(b);
  
  simp38= 3*h*(f0+3*f1+3*f2+f3)/8;  %Genera el resultado
endfunction