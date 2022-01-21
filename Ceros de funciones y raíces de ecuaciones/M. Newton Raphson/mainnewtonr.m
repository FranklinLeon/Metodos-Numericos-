clc; clear all;
tic;

f=@(x) x+exp(2*x); %Función dependiente de x.
fdx=@(x) 1+2*exp(2*x); %derivada de la funcion.
x0=-1; % x0 = valor inicial
maxIter=100; %Número de iteraciones. Recomiendo usar 100.
tol=1e-6; %Tolerancia para el criterio de convergencia a superar o igualar (%)

try
  
  [c,err,numiter] = newton(f,fdx,x0,tol,maxIter);
  
  h=figure(1);
  r=(-15:0.01:15);
  plot(c,f(c),'or');hold on;
  plot(r,f(r)); %Grafica la función de color negro y grosor 2
  title(func2str(f)); hold on; grid on; %Título de la función.
  
  disp(['El valor aproximado de la raiz es', num2str(c)]);
  disp(['Error relativo (%): ' num2str(err)]);
  disp(['Número de iteraciones: ' num2str(numiter)]);
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
toc;