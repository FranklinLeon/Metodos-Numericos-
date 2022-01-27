% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 25/10/2021
% Descripcion: La regla de Simpson es un método que calcula una integral definida 
% al calcular el área de solapamiento de segmentos parabólicos en el intervalo de
% integración y luego sumándolos.%
% Problema 1: En la expresion  1 / (1 + x^2) encontrar la integral definida de la función f(X) en el intervalo [0, 10] usando el método de Simpson.
x = [0:1:10];
f = @funcione1;
try
  fprintf('EJercicio 1\n');
  [simp] = simpson(x,f)
  print(simp);
catch err
  warning(err.identifier, err.message);
end
% Problema 2: En la expresion  x^2+3; encontrar la integral definida de la función f(X) en el intervalo [0, 30] usando el método de Simpson.
x = [0:1:30];
f = @funcione2;
try
  fprintf('EJercicio 1\n');
  [simp] = simpson(x,f)
  print(simp);
catch err
  warning(err.identifier, err.message);
end