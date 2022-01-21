function [xn,xvect,nit,mierror]=puntofijo(f,p,maxiter,tolerancia)
  
  % Implementa la iteracion de punto fijo
  % f = expresion de la funcion de iteracion
  % p = valor inicial
  
  % Como criterios de parada se usan:
  % maxiter = cantidad max de iteraciones admitidas
  % tolerancia = margen para error absoluto
  
  % En la salida:
  % x = resultado de la ultima iteracion
  % xvect = vector de los resultados de todas las iteraciones
  % nit = cantidad de iteraciones realizadas
  % Inicializando
  
  xn=f(p);
  xvect=xn;
  nit=0;
  while norm(xn-p)>tolerancia && nit<maxiter
    p=xn;
    xn=f(p);
    nit=nit+1;
    xvect=[xvect,xn];
    mierror=norm(xn-p);
  endwhile
  if nit>=maxiter
    xn='no converge';
  endif
endfunction