% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 25/10/2021
% Descripcion: Hay muchos casos en los que es preciso ajustar los datos exprimentales a una función no lineal f(x).
% A continuacion se [resentan 2 casos en los que se ajusta las ecuaciones a una serie de datos que se proveen.
clc;
% Problema 1:
%Ajustamos los datos (xj, yj) j=1,2...m de la tabla a la función y=a+b·cos(2?x)+c·sin(2?x)+d·cos(4?x)

x=[0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875];
y=[2.2,2.8,6.1,3.9,0,-1.1,0.6,1.1];

num=4;
figure(1);
try
  fprintf('EJercicio 1\n');  %Enunciado de ejercicio
  [V,a,z] = ajustenolineal(x,y,num)
  hold on
  plot(x,y,'ro','markersize',4,'markerfacecolor','r')
  fplot(z,[x(1),x(end)])
  xlabel('x')
  ylabel('y')
  grid on
  title('Ajuste no lineal')
  hold off
  catch err
  warning(err.identifier, err.message);
end

%Problema 2
%Supongamos que queremos ajustar los datos (xj,yj), j=1,2,...m a la función y=a·lnx+b·cosx+c·ex de modo que la suma S sea mínima
x=[1, 1.5, 2, 2.5, 3, 3.5, 4];
y=[-7.3,-13.9,-24.2,-42.1,-64.7,-103.5,-180.3];
figure(2);
try
  fprintf('EJercicio 2\n');  %Enunciado de ejercicio
  [V,a,z] = ajustenolinel(x,y,num)
  hold on
  plot(x,y,'ro','markersize',4,'markerfacecolor','r')
  fplot(z,[x(1),x(end)])
  xlabel('x')
  ylabel('y')
  grid on
  title('Ajuste no lineal')
  hold off
  catch err
  warning(err.identifier, err.message);
end