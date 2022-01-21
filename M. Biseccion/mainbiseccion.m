% Autores: 
%
% Fecha:
% Descripcion: 
%


% Problema 1:
%   
%   Descripción del problema 1
% 

f = @(x) x.^2 - 7*x;

%f = @(x)x^2 - (2*x)*e^(-x) + e^(-2*x);
%f = @(x) sin(x)+2*x+1;
a = -3;
b = 0;
delta = 2;
datos=""



try 
  [y, datos, iter] = biseccion(f,a,b);
  fprintf('El valor de corte es y=%d, el número de iteraciones es %d\n',y,iter);
  
  h=figure(1);
  x = a-delta:0.1:b+delta;
  plot (x, f(x), "linewidth", 4);
  hold on;
  plot([a a], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (a+0.1, 1, "a");
  plot([b b], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (b+0.1, 1, "b");
  plot([y y], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (y+0.1, 1, "y");
  
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  set(gca, "linewidth", 4, "fontsize", 12)
  #set(gca, "xaxislocation", "zero");
  set(gca, "xaxislocation", "origin")
  #set(gca, "yaxislocation", "zero");
  set(gca, "yaxislocation", "origin");
  set(gca, "box", "on")
  
  [n,m] = size(datos)
  fprintf('Interación\ta\tb\tc\tf(a)\tf(b)\tf(c)\terror\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

hold off;