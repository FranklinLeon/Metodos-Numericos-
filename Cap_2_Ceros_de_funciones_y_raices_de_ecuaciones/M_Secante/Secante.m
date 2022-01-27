% Datos:
% y, expresión de f(x);
% xi y xf, aproximaciones iniciales de la raiz
% tol, tolerancia máxima entre aproximaciones sucesivas
% miter, número máximo de iteraciones a realizar.

function [aprox,err,niter,datos] = Secante(y,xi,xf,tol,miter)
  %funcion para aproximar a una raiz la funcion continua
  %inicializacion de variables
  i=1;
  n = 1;
  dif_iter_succ = xf - xi;   %diferencia entre iteraciones sucecivas
  %asignamos a las variable xn y xn_1 los valores inicial y final
  xn_1 = xi;
  xn = xf;
  %evaluamos la funcion en dichos puntos
  fxn_1 = feval(y,xn_1);
  fxn = feval(y,xn);
  %iteramos aplicando el metodo de la secante
  while abs(dif_iter_succ)>=tol &&n<= miter
    n=n+1;
    dif_iter_succ = fxn*(xn - xn_1)/(fxn - fxn_1);
    %se actualizan las variables
    xn_1 = xn;
    fxn_1 = fxn;
    xn = xn - dif_iter_succ;
    fxn = feval(y,xn);
    datos(i,1)=xn;
    datos(i,2)=fxn;
    i = i+1;
    endwhile
  if n>miter
    warning('el metodo ha llegado al numero maximo de iteraciones \n');
  endif
  %respuestas
  aprox = xn;
  err = abs(fxn);
  niter = n-1;
endfunction
% retorno:
% aprox = valor aproximado de la raíz;
% err = |f(c)|;
% niter = número de iteraciones realizadas.
