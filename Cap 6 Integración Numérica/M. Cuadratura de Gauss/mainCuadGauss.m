clc; clear;
fprintf('\nEjecicio 1 \n2 puntos\n');
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion


f=@(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5
a=0;
b=0.8;
n=2;

try
  h=figure(1);
  x=-1:0.01:1.2;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  
  [integral]=cuad_gauss(f,a,b,n);
  Sol_analitica=1.6405333;
  error_cometido=abs((Sol_analitica-integral)/Sol_analitica)*100;
  disp(['Solucion Metodo Cuadratura de Gauss: ' num2str(integral)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  fprintf('la cuadratura de Gauss para 2 puntos se aproxima a la cuarta derivada de la funcion con cambio de variable\n')
  
catch err
  fprintf('Error: %s\n',err.message);
end
fprintf('\n----------------------------------------------------------------------------------------------------------\n')


fprintf('\nEjecicio 1 \n3 puntos\n');
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
f=@(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5
a=0;
b=0.8;
n=3;

try
  [integral]=cuad_gauss(f,a,b,n);
  Sol_analitica=1.6405333;
  error_cometido=abs((Sol_analitica-integral)/Sol_analitica)*100;
  disp(['Solucion Metodo Cuadratura de Gauss: ' num2str(integral)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  fprintf('la cuadratura de Gauss para 3 puntos se aproxima a la sexta derivada de la funcion con cambio de variable\n')
  
catch err
  fprintf('Error: %s\n',err.message);
end
hold off;
fprintf('\n********************************************************************************************************\n')

fprintf('\nEjecicio 2 \n2 puntos\n');
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion

f=@(x) sqrt(9-x.^2)
a=1;
b=2;
n=2;

try
  
  h=figure(2);
  x=0:0.01:3;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  [integral]=cuad_gauss(f,a,b,n);
  Sol_analitica=2.576362776;
  error_cometido=abs((Sol_analitica-integral)/Sol_analitica);
  disp(['Solucion Metodo Cuadratura de Gauss: ' num2str(integral)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  fprintf('la cuadratura de Gauss para 2 puntos se aproxima a la cuarta derivada de la funcion con cambio de variable\n')
  
catch err
  fprintf('Error: %s\n',err.message);
end
hold off;
fprintf('\n----------------------------------------------------------------------------------------------------------\n')

fprintf('\nEjecicio 2\n3 puntos\n');
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
f=@(x) sqrt(9-x.^2)
a=1;
b=2;
n=3;

try
  [integral]=cuad_gauss(f,a,b,n);
  Sol_analitica=2.576362776;
  error_cometido=abs((Sol_analitica-integral)/Sol_analitica);
  disp(['Solucion Metodo Cuadratura de Gauss: ' num2str(integral)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  fprintf('la cuadratura de Gauss para 2 puntos se aproxima a la cuarta derivada de la funcion con cambio de variable\n')
  
catch err
  fprintf('Error: %s\n',err.message);
end
