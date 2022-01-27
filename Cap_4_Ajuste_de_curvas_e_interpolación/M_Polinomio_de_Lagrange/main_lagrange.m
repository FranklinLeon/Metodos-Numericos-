clc
clear

%Problema 1
%Se tiene un conjuto de datos que relacionan la viscosidad dinámica del agua con
%la temeperatura de la misma y se requiere el valor de viscosidad para una temperatura 
%intermedia de 7.5ºC. 
%La matriz X contiene las temperaturas y la Y las viscosidades

X = [0 5 10 20 30 40];
Y = [1.787 1.519 1.307 1.002 0.796 0.653];
a = 7.5;

try
[C,L,y_a] = lagrange(X,Y,a);

figure(1);
scatter(X,Y);
hold on

x1 = linspace(min(X),max(X),1000);
y1=polyval(C,x1);  % EVALÚA EL POLINOMIO de lagrange C en el vector x1

n_c = length(C);
fprintf('Ejercicio 1 \n')
fprintf('Polinomio de Lagrange: \n')
for i = n_c-1:-1:1 
  fprintf('%.10fx^%i \n', C(1,(n_c-i)), i)
  i++;
endfor
fprintf('%.10f \n', C(1,n_c))
fprintf('La viscosidad a una temperatura de %iºC es %.3f \n',a,y_a)

plot(x1,y1,'m','linewidth',2)  % grafica el polinomio de lagrange
grid on
hold off
end

%Problema 2
%Se tiene un conjuto de datos que relacionan el dia de la medición y el número 
%de bacterias que se generaron ese día, se requiere saber el numero de bacterias
%que se generaron el día 3, del cual no existe datos.

X = [1 4 7 10];
Y = [13 43 54 24];
a = 3;

try
[C,L,y_a] = lagrange(X,Y,a);

figure(2);
scatter(X,Y);
hold on

x1 = linspace(min(X),max(X),1000);
y1=polyval(C,x1);  % EVALÚA EL POLINOMIO de lagrange C en el vector x1

n_c = length(C);
fprintf('Ejercicio 2 \n')
fprintf('Polinomio de Lagrange: \n')
for i = n_c-1:-1:1 
  fprintf('%.10fx^%i \n', C(1,(n_c-i)), i)
  i++;
endfor
fprintf('%.10f \n', C(1,n_c))
fprintf('El día %i se generaron %.0f bacterias \n',a,y_a)

plot(x1,y1,'m','linewidth',2)  % grafica el polinomio de lagrange
grid on
hold off

end
