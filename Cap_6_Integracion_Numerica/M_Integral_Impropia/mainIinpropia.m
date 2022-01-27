clc; clear;
fprintf('\nEjecicio 1\n');
tic;
%Planteamiento del problema La distribución normal acumulativa es una fórmula importante en
%estadística (figura 22.10):

%determinar N(1) de la distribucion N(x)

f=@(x) (exp((-x.^2)./2));
a=-Inf;
b=1;
N=8;
M=2;

try
  
  h=figure(1);
  x=-5:0.04:5;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  [I_impropia]=i_impropia(f,a,b,M,N);
  Sol_analitica=integral(f,a,b);
  error_cometido=abs((Sol_analitica-I_impropia)/Sol_analitica)*100;
  disp(['Solucion M. Integral Impropia: ' num2str(I_impropia)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
  n=(1./sqrt(2*pi))*I_impropia;
  disp(['Solucion de N(1): ' num2str(n)]);
 
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
hold off;

fprintf('\n********************************************************************\n')

fprintf('\nEjecicio 2\n');
tic;
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
f=@(x) exp(2.*x);
a=-inf;
b=1;
N=10;
M=1;

try
  
  h=figure(2);
  x=-3:0.04:1.5;
  plot(x,f(x));grid on;hold on;
  plot(a,f(x),':.r');hold on;
  plot(b,f(x),':.r');hold on;
  plot([a b],[f(a) f(b)],'.-g'); hold on;
  
  [I_impropia]=i_impropia(f,a,b,M,N);
  Sol_analitica=integral(f,a,b);
  error_cometido=abs((Sol_analitica-I_impropia)/Sol_analitica)*100;
  disp(['Solucion M. Integral Impropia: ' num2str(I_impropia)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
 
catch err
  fprintf('Error: %s\n',err.message);
end
toc;

