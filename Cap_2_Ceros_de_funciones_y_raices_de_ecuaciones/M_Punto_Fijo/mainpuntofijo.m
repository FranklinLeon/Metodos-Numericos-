clc; clear all;
tic;

f=@(x) sqrt(2400./(30-x)); %Función dependiente de x.

p=10; % x0 = valor inicial
maxiter=100; %Número de iteraciones. Recomiendo usar 100.
tolerancia=1e-6; %Tolerancia para el criterio de convergencia a superar o igualar (%)

try
  
  [xn,xvect,nit,mierror]=puntofijo(f,p,maxiter,tolerancia);
  
  h=figure(1);
  r=(-15:0.01:15);
  plot(xn,f(xn),'or');hold on;
  plot(r,f(r)); %Grafica la función de color negro y grosor 2
  title(func2str(f)); hold on; grid on; %Título de la función.
  
  disp(['Evaluando la función ' func2str(f) ', el resultado es: ' num2str(f(xn))]);
  disp(['Error relativo (%): ' num2str(mierror)]);
  disp(['Número de iteraciones: ' num2str(nit)]);
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
toc;