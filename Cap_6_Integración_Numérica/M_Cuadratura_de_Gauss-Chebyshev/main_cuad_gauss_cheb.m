clc; clear;

%Se requiere calcular la integral de la función (1 - x.^2)^3/2, mediante la 
%integración Gauss-Chebyshev entre los limites -1 y 1.  pag240

fprintf('\nEjecicio 1 \n');

f=@(x) (1 - x.^2).^2
a=-1;
b=1;
n=2;

try
  h=figure(1);
  x=-1:0.01:1.2;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  
  [I]=cuad_gauss_cheb(f,a,b,n);
  Sol_analitica=3*pi/8;
  error_cometido=abs(((Sol_analitica-I)/Sol_analitica)*100);
  disp(['Solucion Metodo Cuadratura de Gauss-Chebyshev: ' num2str(I)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  
  
catch err
  fprintf('Error: %s\n',err.message);
end
fprintf('\n----------------------------------------------------------------------------------------------------------\n')

%Se requiere calcular la integral de la función (1 - x.^2)^1/2 cos(x), mediante la 
%integración Gauss-Chebyshev entre los limites -1 y 1.

fprintf('\nEjecicio 2 \n');

f=@(x) (1 - x.^2).*cos(x)
a=-1;
b=1;
n=4;

try
  h=figure(2);
  x=-1:0.01:1.2;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  
  [I]=cuad_gauss_cheb(f,a,b,n);
  Sol_analitica=1.38245;
  error_cometido=abs(((Sol_analitica-I)/Sol_analitica)*100);
  disp(['Solucion Metodo Cuadratura de Gauss-Chebyshev: ' num2str(I)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  
  
catch err
  fprintf('Error: %s\n',err.message);
end
fprintf('\n----------------------------------------------------------------------------------------------------------\n')



