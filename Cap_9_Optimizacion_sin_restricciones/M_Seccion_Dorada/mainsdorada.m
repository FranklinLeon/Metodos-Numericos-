clc; clear all;close all;
fprintf('\nEjecicio 1\n');
tic;
%{
Dado la siguente funcion determinar por el metodo de la seccion aurea 
(x.^2)-(3.*x)+1 para el intervalo [0,2] ejercicio libro Introduction to 
Unconstrained Optimization with R pagina 105 ejemplo
%}
f=@(x) (x.^2)-(3.*x)+1
a=0
b=2
E=1e-7;
Miter=50;
T=double((sqrt(5)-1)./2);    
datos="";
xab = a-1:0.1:b+1;
try
 h=figure(1);hold on;
 [datos]=sdorada(f,a,b,E,T,Miter);
 x=datos(end,1)
 fx=datos(end,2)
 plot(xab,f(xab),'-',x,fx,'go');hold on;
 p=1;
  while p < Miter
     plot(datos(p,1),datos(p,2),'rx');hold on;
      p++;
  endwhile;
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off

fprintf('\n********************************************************************************************************\n')
fprintf('\nEjecicio 2\n');

tic;
%{
Dado la siguente funcion determinar por el metodo de la seccion aurea 
x.^3 + 5.*x.^2 + 4.*x + 6 para el intervalo [-2,2] con Epsilon 1e-7 y 100 iteraciones ejercicio libro Introduction to 
Unconstrained Optimization with R pagina 107
%}
f=@(x) x.^3 + 5.*x.^2 + 4.*x + 6
a=-2
b=2
E=1e-7
Miter=100;
T=double((sqrt(5)-1)./2)    
datos="";
xab = a:0.01:b;
try
 h=figure(2);hold on;
 [datos]=sdorada(f,a,b,E,T,Miter);
 x=datos(end,1)
 fx=datos(end,2)
 plot(xab,f(xab),'-',x,fx,'go');hold on;
 p=1;
  while p < Miter
     plot(datos(p,1),datos(p,2),'rx');hold on;
      p++;
  endwhile;

catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off
fprintf('\n********************************************************************************************************\n')
