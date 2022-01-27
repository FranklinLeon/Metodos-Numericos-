%   Metodo Simpson 1/3.
%       [simp] = simpson(x,f)
%       simp = resultado obtenido del metodo
%       x = vector dominio en que se desea evaluar
%       f = funcion a integrar
function [simp] = simpson(x,f)
  xa = x(1);                        % primer elemento del vector x, extremo inferior
  xb = x(end);                      % ultimo elemento dle vector x, extremo superior
  if xa == xb
    msgID = 'DSIMPSON:tamaño';
    msg = 'Dominio no valido';
    error(msgID,msg);
  endif
  dx = (xb - xa)/(length(x)-1);     %diferencial de x
  N = (xb - xa)/(dx*2);             % N de la sumatoria
  y1 = 0;                           %Acumuladores
  y2 = 0; 
  for j = 1:N-1                     %Genera la sumatoria
    y1 = y1 + f(xa + (2*(j+1)-2)*dx);
  endfor
  y1 = 2*y1;
  for k=1:N                         %Genera la otra sumatoria
    y2 = y2 + f(xa + (2*k-1)*dx);
  endfor
  y2= 4*y2;
  simp = (f(xa)+f(xb)+y1+y2)*dx/3;  %Genera el resultado
endfunction