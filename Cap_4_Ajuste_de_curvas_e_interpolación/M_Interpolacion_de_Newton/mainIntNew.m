clc; clear;

%Los siguientes datos corresponden a los tiempos en segundos que tardaron en
%ejecutarse seis programas elegidos al azar en el entorno Windows y en DOS:

%DOS=[2.5;7.1;5;8.5;7;8.1]
%Windows=[2.3;6.5;4.5;6.9;6.3;7.3]

fprintf('Ejecicio 1\n')
D=[2.5 7.1 5 8.5 7];
w=[2.3 6.5 4.5 6.9 7.3];
val_inter1=5.5;
try
  [yo,pol_newton,b]=Int_Newton(val_inter1,D,w);

  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('La matriz de diferencias divididas es:\n'),disp(b);
  fprintf(newline)
  fprintf('El polinomio de Newton es:\n')
  fprintf('f(x)='),disp(pol_newton);
  fprintf(newline)
  fprintf('El valor de interpolacion en el punto ingresado es:\n'),disp(yo);
  fprintf(newline);
  
  %Graficamo2 los puntos iniciales y el polinomio de Newton
    
  h=figure(1);
  plot(val_inter1,yo,'ro')
  hold on; 
  plot(D,w,'g*')
  hold on;
  x=0:0.1:10;
  funcion = @(x) 0.64256*x.^4-14.877505*x.^3+122.5075384*x.^2-417.63569*x+488.078145;
  plot(x,funcion(x))
    
  %Capturamos errores
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;

fprintf('**************************************************************************\n')

fprintf('\nEjecicio 2\n');
%los valores de un potenciometro de 10k varian segun el tiempo la tabla correspondiente es:  
%tiempo = 0s 2s 3s 6s 9s 10s 12s 13s 15s 18s 20s 
%potenciometro = 0.5k 1.7k 2k 3k 3.5k 5.2k 5.9k 7.1k 8.9k 9.5k 9.9k

P=[4 -4 3 -6];
R=[78 -210 28 -602];
val_inter2=1;

try
  [yo,pol_newton,b]=Int_Newton(val_inter2,P,R);

  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('La matriz de diferencias divididas es:\n'),disp(b);
  fprintf(newline)
  fprintf('El polinomio de Newton es:\n')
  fprintf('f(x)='),disp(pol_newton);
  fprintf(newline)
  fprintf('El valor de interpolacion en el punto ingresado es:\n'),disp(yo);
  fprintf(newline);
  
  %Graficamo2 los puntos iniciales y el polinomio de Newton
  
    
  h=figure(2);
  plot(val_inter1,yo,'ro')
  hold on; 
  plot(D,w,'g*')
  hold on;
  x=-200:0.5:200;
  funcion = @(x) 2*x.^3 - 4*x.^2 + 4*x - 2;
  plot(x,funcion(x))
    
  %Capturamos errores
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;