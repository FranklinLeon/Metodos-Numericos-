clear; clc; close all;

%Problema 1
% Se requiere saber si existe una relación entre las notas de los estudiantes
% y las posibilidades de ser admitido que le otorga las universidades
%
%
data = csvread('Admision.csv',1,0);

x = data(:,2);
y = data(:,9);
figure(1);
try
[a0,a1,Sr]=minimos_cuadrados(x,y);

fprintf('Problema 1 \n')
fprintf('El ajuste por mínimos cuadrados es: y = %.4fx + %.4f \n', a1,a0)
fprintf('La sumatoria de errores cuadraticos es: Sr = %.4f \n', Sr)

scatter(x,y);
hold on

x1 = linspace(min(x),max(x),1000);
y1 = a0 + a1*x1;

plot(x1,y1,'r','linewidth',2);
title('Regresión Lineal');
xlabel('Eje x');
ylabel('Eje y');
legend ({"Datos", "y = a1x + a0"}, "location", "east");
legend hide
legend show

catch err
fprintf('Error: %s\n',err.message);
end

%Problema 2
% Se requiere saber si existe una relación entre la cantidad de recomendaciones de los estudiantes
% y las posibilidades de ser admitido que le otorga las universidades
%
data = csvread('Admision.csv',1,0);

x = data(:,4);
y = data(:,9);
figure(2);

try
[a0,a1,Sr]=minimos_cuadrados(x,y);

fprintf('Problema 2 \n')
fprintf('El ajuste por mínimos cuadrados es: y = %.4fx + %.4f \n', a1,a0)
fprintf('La sumatoria de errores cuadraticos es: Sr = %.4f \n', Sr)

scatter(x,y);
hold on

x1 = linspace(min(x),max(x),1000);
y1 = a0 + a1*x1;

plot(x1,y1,'r','linewidth',2);
title('Regresión Lineal');
xlabel('Eje x');
ylabel('Eje y');
legend ({"Datos", "y = a1x + a0"}, "location", "east");
legend hide
legend show

catch err
fprintf('Error: %s\n',err.message);
end