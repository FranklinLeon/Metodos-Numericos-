clc; clear;

%Los siguientes datos corresponden a los tiempos en segundos que tardaron en
%ejecutarse seis programas elegidos al azar en el entorno Windows y en DOS:

%DOS=[2.5;7.1;5;8.5;7;8.1]
%Windows=[2.3;6.5;4.5;6.9;6.3;7.3]

fprintf('Ejecicio 1\n')
D=[2.5;7.1;5;8.5;7;8.1];
w=[2.3;6.5;4.5;6.9;6.3;7.3];
val_inter1=5.5;
try
  [yo,pol_newton,b]=Int_Newton(val_inter1,D,w);
  [dhD,dhA,dC,dhD2,dhA2,dC2]=D_finitas(D,w);

  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('La matriz de diferencias divididas es:\n'),disp(b);
  fprintf(newline)
  fprintf('El polinomio de Newton es:\n')
  fprintf('f(x)='),disp(pol_newton);

  
  %Graficamo2 los puntos iniciales y el polinomio de Newton
    
  h=figure(1);
  hold on; 
  plot(D,w,'b*')
  hold on;
  x=0:0.1:10;
  funcion = @(x) 0.64256*x.^4-14.877505*x.^3+122.5075384*x.^2-417.63569*x+488.078145;
  plot(x,funcion(x))
  
  % agregamos la primera derivada
  fprintf('**************************************************************************\n')
  fprintf(newline)
  fprintf('primera derivada')
  fprintf(newline)
  fprintf('\tprogresivo\tregresivo\tcentrado')
  [dhD dhA dC] 
  fprintf(newline)
  fprintf('**************************************************************************\n') 
  fprintf(newline)
  fprintf('segunda derivada')
  fprintf(newline)
  % agregamos la segunda derivada
  fprintf('\tprogresivo\tregresivo\tcentrado')
  [dhD2 dhA2 dC2] 
  fprintf(newline)

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

P=[1.1 1.2 1.3 1.4 1.5];
R=[8.2277 7.2428 5.9908 4.5260 2.912];
val_inter2=1;

try
  [yo,pol_newton,b]=Int_Newton(val_inter2,P,R);
  [dhD,dhA,dC,dhD2,dhA2,dC2]=D_finitas(P,R);

  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('La matriz de diferencias divididas es:\n'),disp(b);
  fprintf(newline)
  fprintf('El polinomio de Newton es:\n')
  fprintf('f(x)='),disp(pol_newton);

  %imprimimos en el Comand Center
  fprintf(newline)
  fprintf('La matriz de diferencias divididas es:\n'),disp(b);
  fprintf(newline)
  fprintf('El polinomio de Newton es:\n')
  fprintf('f(x)='),disp(pol_newton);

  
  %Graficamo2 los puntos iniciales y el polinomio de Newton
    
  h=figure(2);
  hold on; 
  plot(P,R,'b*')
  hold on;
  x=0.5:0.1:2.5;
  funcion = @(x) 3.875*x.^4-10.325 *x.^3-9.70375*x.^2+29.84175*x-4.7875;
  plot(x,funcion(x))
  
  % agregamos la primera derivada
  fprintf('**************************************************************************\n')
  fprintf(newline)
  fprintf('primera derivada')
  fprintf(newline)
  fprintf('\tprogresivo\tregresivo\tcentrado')
  [dhD dhA dC] 
  fprintf(newline)
  fprintf('**************************************************************************\n') 
  fprintf(newline)
  fprintf('segunda derivada')
  fprintf(newline)
  % agregamos la segunda derivada
  fprintf('\tprogresivo\tregresivo\tcentrado')
  [dhD2 dhA2 dC2] 
  fprintf(newline)

  %Capturamos errores
  catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;




