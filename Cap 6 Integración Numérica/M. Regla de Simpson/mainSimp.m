clc; clear;
fprintf('\nEjecicio 1\n');
tic;
%Dado la siguente funcion determinar el area bajo la cuva de la siguiente funcion
f=@(x) ((sin(x))./(exp(x)));
linf=0;
lsup=8;
intervalo=12;

try
  
  [ I ] = Simp(f,linf,lsup,intervalo);
  Sol_analitica=integral(f,0,8);
  error_cometido=abs((Sol_analitica-I)/Sol_analitica)*100;
  disp(['Solucion Metodo de Simpson: ' num2str(I)]);
  disp(['Solucion Analitica: ' num2str(Sol_analitica)]);
  disp(['Error (%): ' num2str(error_cometido)]);
 
catch err
  fprintf('Error: %s\n',err.message);
end
toc;
