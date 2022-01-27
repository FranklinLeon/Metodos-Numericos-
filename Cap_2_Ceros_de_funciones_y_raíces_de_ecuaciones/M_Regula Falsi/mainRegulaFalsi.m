clc; clear all;
tic;
f=@(x) x.^(10) - 1; %Funci�n dependiente de x.
xl=0; %L�mite inferior.
xu=1.3; %L�mite superior.
Niter=[]; %N�mero de iteraciones. Recomiendo usar 100.
Tol=0.0001; %Tolerancia para el criterio de convergencia a superar o igualar (%)

try
  [M, XR, ER, Iter] = RegulaFalsi(f, xl, xu, Niter, Tol);
  h=figure(1);
  izq=(-0.5);
  der=(3);
  sup=(-5);
  inf=(15);
  axis([izq der sup inf]);
  plot(XR,f(XR),'or');hold on;
  fplot(f,'k-','LineWidth',1.5); %Grafica la funci�n de color negro y grosor 2
  title(func2str(f)); hold on; grid on; %T�tulo de la funci�n.
  
  
  
  disp(['Evaluando la funci�n ' func2str(f) ' con ' num2str(XR) ', el resultado es: ' num2str(f(XR))]);
  disp(['Error relativo (%): ' num2str(ER)]);
  disp(['N�mero de iteraciones: ' num2str(Iter)]);
  %disp(M)
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
toc;