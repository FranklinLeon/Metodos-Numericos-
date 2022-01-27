% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
%
% Fecha: 10/09/2021
% Descripcion: Se presentan dos ejemplos de la implementaci�n del script que simula el m�todo
% de Euler, El m�todo de Euler es un m�todo de primer orden, lo que significa que el error local 
% es proporcional al cuadrado del tama�o del paso, y el error global es proporcional al tama�o del paso. 
% El m�todo de Euler regularmente sirve como base para construir m�todos m�s complejos. 

% Problema 1:
% Tomando el ejercicio del libro guia de chapra en la pagina 721.
clear all
clc
%condiciones inicales
xi = 0;
yi = 1;
%declarar el tamanio de paso
h = 0.5;

%declarar el punto final
xf = 4;
%agregarmos la EEDD
f = @(x,y) -2*x^3+12*x^2-20*x+8.5;
figure 1
hold on
%contador
n=2;
try
  [xi,yi,x,y] = euler(xi,yi,h,n,xf,f);
  b=size(y);
  plot (xi,yi, 'ro')%grafica resultados Euler
  plot(x,y)    %grafica resultados analiticos
  legend(strcat('Euler h=',num2str(h)),'Analitica')
  printf('Valores con Euler:')
  disp(yi)
  printf('Valores Reales   :')
  disp(y)
  ea = y-yi;
  printf('Error cometido   :')
  disp(ea)
  errm = (ea/y)*100
catch err
fprintf('Error: %s\n',err.message);
end
hold off
%
%
% Problema 2:
% funcion seno

%condiciones inicales
xi = 0;
yi = -1;
%declarar el tamanio de paso
h = 0.5;

%declarar el punto final
xf = 4;
%agregarmos la EEDD
f = @(x,y) sin(x);
figure 2
hold on
%contador
n=2;
try
  [xi,yi,x,y] = euler1(xi,yi,h,n,xf,f);
  b=size(y);
  plot (xi,yi, 'ro')   %grafica resultados Euler
  plot(x,y)    %grafica resultados analiticos
  legend(strcat('Euler h=',num2str(h)),'Analitica')
  printf('Valores con Euler:')
  disp(yi)
  printf('Valores Reales   :')
  disp(y)
  ea = y-yi;
  printf('Error cometido   :')
  disp(ea)
  errm = (ea/y)*100
catch err
fprintf('Error: %s\n',err.message);
end