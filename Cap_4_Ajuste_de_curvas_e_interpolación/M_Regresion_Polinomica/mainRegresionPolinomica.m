clc; clear;

%Los siguientes datos corresponden a los tiempos en segundos que tardaron en
%ejecutarse seis programas elegidos al azar en el entorno Windows y en DOS:

%DOS=[2.5;7.1;5;8.5;7;8.1]
%Windows=[2.3;6.5;4.5;6.9;6.3;7.3]

%el polinomio debe de ser de grado polinomialmayor a 2 
fprintf('Ejecicio 1\n')
D=[2.5;7.1;5;8.5;7;8.1];
w=[2.3;6.5;4.5;6.9;6.3;7.3];
m=2;

try
  [polinomio,erroraprox]= Reg_Pol(m,D,w);
  %Graficamo2 los puntos iniciales y la regrecion polinomial
   h=figure(1);
  c=1:.1:9;
  f_c=polyval(polinomio,c);
  plot(D,w,'ro',c,f_c)
  hold on;
  
  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('la funcion de regresion polinomial es:\n')
  fprintf('f(x)='),disp(polyout(polinomio,'x'));
  fprintf(newline)
  fprintf('El error cometido es:\n'),disp(erroraprox);
  
  %Capturamos errores
catch
   %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.identifier);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end_try_catch
hold off;
fprintf('**************************************************************************\n')

%los valores de un potenciometro de 10k varian segun el tiempo la tabla correspondiente es:  
%tiempo = 0s 2s 3s 6s 9s 10s 12s 13s 15s 18s 20s 
%potenciometro = 0.5k 1.7k 2k 3k 3.5k 5.2k 5.9k 7.1k 8.9k 9.5k 9.9k
%aproximarlo a una funcion bicuadratica
fprintf('Ejecicio 2\n')
P=[0;2;3;6;9;10;12;13;15;18;20];
R=[0.5;1.7;2;3;3.5;5.2;5.9;7.1;8.9;9.5;9.9];
m=3;

try
  [polinomio,erroraprox]= Reg_Pol(m,P,R);
  %Graficamo2 los puntos iniciales y la regrecion polinomial
  h=figure(2);
  c=-1:.1:21;
  f_c=polyval(polinomio,c);
  plot(P,R,'go',c,f_c)
  hold on;
  
  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('la funcion de regresion polinomial es:\n')
  fprintf('f(x)='),disp(polyout(polinomio,'x'));
  fprintf(newline)
  fprintf('El error cometido es:\n'),disp(erroraprox);
  
  %Capturamos errores
catch
   %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end_try_catch
hold off;
