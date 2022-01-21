clc; clear;
fprintf('\nEjecicio 1\n');
tic;
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
g=@(x) ((sin(x))./(exp(x)));
f=@(x) sin(x)
a=0;
n=5;

try
  
  h=figure(1);
  x=0:0.01:3.1416*4;
  plot(x,g(x));grid on;hold on;
  plot(a,g(x),':.r');hold on;
  
  [ceros,pesos,integralaguerre]=gauss_la(f,n);
  Sol_analitica=integral(g,0,8);
  error_cometido=abs((Sol_analitica-integralaguerre)/Sol_analitica)*100;
  disp(['Solucion Metodo Cuadratura de Gauss Laguerre: ' num2str(integralaguerre)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
 
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off
fprintf('\n********************************************************************************************************\n')

fprintf('\nEjecicio 2\n');
tic;
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
g=@(x) ((x.^3)./(exp(x)))
f=@(x) (x.^3)
a=0
n=20;

try
  
  h=figure(2);
  x=0:0.01:20;
  plot(x,g(x));grid on;hold on;
  plot(a,g(x),':.r');hold on;

    
  [ceros,pesos,integralaguerre]=gauss_la(f,n);
  disp(pesos)
  disp(ceros)
  Sol_analitica=integral(g,0,15);
  error_cometido=abs((Sol_analitica-integralaguerre)/Sol_analitica)*100;
  disp(['Solucion Metodo Cuadratura de Gauss Laguerre: ' num2str(integralaguerre)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  
  
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off;