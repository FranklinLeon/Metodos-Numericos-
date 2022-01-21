close all; clear; clc

fprintf ("Ejercicio 1\nDatos\n");

%{
En optimización matemática, la función de Himmelblau es una función multimodal, 
definida sobre {R}^{2} y usada para comprobar el rendimiento de los algoritmos 
de optimización.
La función se define de la siguiente manera:
%}

x=-4:0.2:4;
y=x;
x0 = [0.5;1]
tol = 1e-4
Miter = 50
Z = @(x,y) (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2
grad = @(x,y) [[4*x.^3 + 4*x.*y - 42*x + 2*y.^2 - 14];[4*y.^3 + 4*x.*y - 26*y + 2*x.^2 - 22]];
hess = @(x,y) [[ 12*x.^2 + 4*y - 42 , 4*x + 4*y ];[ 4*x + 4*y , 12*y.^2 + 4*x - 26 ]];
figure(1)
[X,Y] = meshgrid(x);
surf(X,Y,(X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2); hold on;


try
  [sol, iters, convergencia] = newton_min(grad,hess,x0,tol,Miter);
  min=Z(sol(1),sol(2))
  plot3(sol(1),sol(2),min,'*r')
  
  switch (convergencia)
      case 0
          fprintf ("\nLa funcion si converge\n");
          fprintf("El minimo se encuentra en el punto: \n");
          disp(sol);
          fprintf("El numero de Iteraciones son %d.\n\n",iters);
      case 1
          fprintf ("La funcion si converge\n\n");
          fprintf("El minimo se encuentra en el punto: \n");
          disp(sol);
          fprintf("El numero de Iteraciones son %d.\n\n",iters);
      otherwise
          fprintf ("La funcion no converge\n\n");
   endswitch
 catch err
  fprintf('Error: %s\n',err.message);
end
%hold off

fprintf('\n********************************************************************************************************\n')
fprintf ("Ejercicio 2\nDatos\n");

%{
Apply the Newton’s method to minimize the following function:
%}

x=-10:0.2:10;
y=x;
x0 = [1;3]
tol = 1e-7
Miter = 100
Z = @(x,y) (x.^2 + 2*y.^2 - 4*x -2*x*y)
grad = @(x,y) [[2*x - 4 - 2*y];[4*y - 2*x]];
hess = @(x,y) [[ 2 -2 ];[ -2 4 ]];
figure(2)
[X,Y] = meshgrid(x);
surf(X,Y,X.^2 + 2.*Y.^2 - 4.*X - 2.*X.*Y); hold on

try
  

  [sol, iters, convergencia] = newton_min(grad,hess,x0,tol,Miter);
  
  min=Z(sol(1),sol(2))
  plot3(sol(1),sol(2),min,'*r')
  
  switch (convergencia)
      case 0
          fprintf ("\nLa funcion si converge\n");
          fprintf("El minimo se encuentra en el punto: \n");
          disp(sol);
          fprintf("El numero de Iteraciones son %d.\n\n",iters);
      case 1
          fprintf ("La funcion si converge\n\n");
          fprintf("El minimo se encuentra en el punto: \n");
          disp(sol);
          fprintf("El numero de Iteraciones son %d.\n\n",iters);
      otherwise
          fprintf ("La funcion no converge\n\n");
   endswitch
 catch err
  fprintf('Error: %s\n',err.message);
end
%hold off

