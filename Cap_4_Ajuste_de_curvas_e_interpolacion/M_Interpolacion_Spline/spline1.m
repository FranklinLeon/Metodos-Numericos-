%  Interpolacion spline cuadratica.
%       [s,x] = spline1(f)
%       s = matriz con los coeficientes del polinomio
%       x = valores de nodo 
%       f = funcion a usar
function [s,x] = spline1(f)
  n = 19;                           % N�mero de subintervalos (n+1 nodos)
  x = linspace(-1,1,n+1);           % Nodos equiespaciados
  y = f(x);                         % Valores de la funci�n en los nodos
  d0 = 25/338;                      % Derivada en el primer nodo
  p = [0,0,y(1)]+[0,d0*poly(x(1))]; % T�rmino lineal del spline
  s = zeros(n,3);                   % Matriz que guarda, por filas, los coeficientes del polinomio de cada trozo
  gam = [];                         % Vector que guarda los valores de las gammas
  for j = 1:n                       % Determinamos las n gammas
  pot = poly([x(j),x(j)]);          % Potencia truncada cuadr�tica en x(j)
  gam(j) = (y(j+1)-polyval(p,x(j+1)))./polyval(pot,x(j+1));
  p = p+gam(j)*pot;
  s(j,:) = p;
  endfor                             
endfunction