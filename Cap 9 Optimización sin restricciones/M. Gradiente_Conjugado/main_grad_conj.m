clear all;
clc;


fprintf ("\nEjercicio 1\n");

syms x1 x2;

x0 = [1 1];
tol = 1e-3;
maxiter = 20;

f = x1-x2+2*x1^2+2*x1*x2+x2^2;

figure(1);
ezsurf(f);
hold on

try 
  [x0,iter] = gradiente_conjugado(f,x0,tol,maxiter);
  ans = subs(f,[x1,x2],x0);
  ans = double(ans);
  fprintf ("\nEjercicio 1\n");
  fprintf('\n*********************************************************************\n')
  fprintf('\n El minimo se encuentra en el punto: [%f, %f]\n',x0(1),x0(2));
  fprintf('\n Función evaluada en el punto minimo: %f \n',ans);
  fprintf('\n Resultado obtenido en %i iteraciones\n', iter);
  fprintf('\n********************************************************************\n')
  plot3(x0(1),x0(2),ans,'*');
  grid on
end

x0 = [1 1];
tol = 1e-3;
maxiter = 20;

f = x1^2+5*x2^2-4*x1-3*x1*x2;

figure(2)
ezsurf(f);
hold on

try 
  [x0] = gradiente_conjugado(f,x0,tol,maxiter);
  ans = subs(f,[x1,x2],x0);
  ans = double(ans);
  fprintf ("\nEjercicio 2\n");
  fprintf('\n*********************************************************************\n')
  fprintf('\n El minimo se encuentra en el punto: [%f, %f]\n',x0(1),x0(2));
  fprintf('\n Función evaluada en el punto minimo: %f \n',ans);
  fprintf('\n Resultado obtenido en %i iteraciones\n', iter);
  fprintf('\n********************************************************************\n')
  plot3(x0(1),x0(2),ans,'*');
  grid on
  end