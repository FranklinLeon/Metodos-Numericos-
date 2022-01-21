clc; clear;
fprintf('\nEjecicio 1\n');
tic;
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
f=@(x) sin(x);
a=0;
b=8;
n=5;

try
  
  %h=figure(1);
  %x=0:0.01:3.1416*4;
  %plot(x,g(x));grid on;hold on;
  %plot(a,g(x),':.r');hold on;
  
  I=gaussh(f,a,b,n);
  Sol_analitica=integral(f,0,8);
  error_cometido=abs((Sol_analitica-I)/Sol_analitica)*100;
  disp(['Solucion Metodo Cuadratura de Gauss Hermite: ' num2str(I)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
 
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off
fprintf('\n********************************************************************************************************\n')
