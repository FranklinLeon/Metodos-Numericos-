%Ejercicio 1
%Dado el siguiente polinomio x^3 + 2 x^2 + 10x -20 =0 encontrar las raíces para el
%intervalo [0, 1].

%Ejercicio 2
%Dada la siguiente función f(x) = e^(-x^(2)) - 2 hallar las raíces 
%para el intervalo [0, 1] con un error de 0.01.
%funcion = @(x) e.^(-x.^(2)) - 2;

funcion = @(x) x.^3 +2*x.^2 +10*x -20;
%funcion = @(x) e.^(-x.^(2)) - 2;
xi = 0;
xf = 1;
tol = 0.01;
miter = 10;
datos="";
p=1;


try
  [aproximacion,error,numero_de_iteraciones,datos]=Secante(funcion,xi,xf,tol,miter);
  
  fprintf('El valor de aproximacion es y=%d\nel error cometido es: %d\nel número de iteraciones es: %d\n',aproximacion,error,numero_de_iteraciones);
    
  h=figure(1);
  x = xi-1:0.1:xf+1;
  plot(x, funcion(x), "linewidth", .5);
  hold on; 
 
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");

  
 [n,m] = size(datos);
  fprintf('Interación\taproximacion\terror\n');
  for i=1:n
    fprintf('%d\t         ',i);
    for j=1:m
      fprintf('%d\t   ',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  
    while p < miter
      plot(datos(p,1),datos(p,2),'ko','markerfacecolor','r')
      hold on;
      p++;
    endwhile;
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
hold off;

funcion = @(x) e.^(-x.^(2)) - 2;
xi = 0;
xf = 1;
tol = 0.01;
miter = 10;
datos="";
p=1;


try
  [aproximacion,error,numero_de_iteraciones,datos]=Secante(funcion,xi,xf,tol,miter);
  
  fprintf('El valor de aproximacion es y=%d\nel error cometido es: %d\nel número de iteraciones es: %d\n',aproximacion,error,numero_de_iteraciones);
    
  h=figure(2);
  x = xi-1:0.001:xf+1;
  plot(x, funcion(x), "linewidth", .5);
  hold on; 
 
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");

  
 [n,m] = size(datos);
  fprintf('Interación\taproximacion\terror\n');
  for i=1:n
    fprintf('%d\t         ',i);
    for j=1:m
      fprintf('%d\t   ',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  
    while p < miter
      plot(datos(p,1),datos(p,2),'ko','markerfacecolor','r')
      hold on;
      p++;
    endwhile;
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
hold off;


