% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 06/12/2021
%Ejercicio: Por la cuadratura de Gauss Hermite resuelva f(x).
f=@(x) sin(x)
n=5;

try
  
  [xx,ww]=hermite(n);
  disp(xx);
  disp(ww);
catch err
  fprintf('Error: %s\n',err.message);
end