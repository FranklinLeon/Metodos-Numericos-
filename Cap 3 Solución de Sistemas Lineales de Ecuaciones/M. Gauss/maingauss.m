%Ejercicio 1
%Luego de hacer el análisis de un circuito por el método de mallas se obtiene el
%siguiente sistema de ecuaciones,
%
%28I1-9I2+9I3=15
%-9I1+18I2+3I3=10
%9I1+3I2+2
%
%En donde I1, I2 E I3 representan las corrientes en cada malla.
A = [4,-1,-1,0;-1,4,-1,0;-1,0,4,-1;0,-1,-1,4];
b = [150;150;110;110];
tic
try
  [C,An,bn,it] = Gauss(A,b);

  [x]=sustreg(An,bn);
  display(C)
  fprintf('Solución:\n')
  fprintf('%.3f \n', x')
  fprintf('Iteraciones = %i \n', it')
  catch err
  fprintf('Error: %s\n',err.message);
end
toc
