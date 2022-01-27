% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 25/10/2021
% Descripcion: La regla de Simpson es un m�todo que calcula una integral definida 
% al calcular el �rea de solapamiento de segmentos parab�licos en el intervalo de
% integraci�n y luego sum�ndolos.%
% Problema 1: En la expresion  1 / (1 + x^2) encontrar la integral definida de la funci�n f(X) en el intervalo [0, 10] usando el m�todo de Simpson.
x = [0:1:10];
f = @funcione1;
try
  fprintf('EJercicio 1\n');
  [simp] = simpson(x,f)
  print(simp);
catch err
  warning(err.identifier, err.message);
end
% Problema 2: En la expresion  x^2+3; encontrar la integral definida de la funci�n f(X) en el intervalo [0, 30] usando el m�todo de Simpson.
x = [0:1:30];
f = @funcione2;
try
  fprintf('EJercicio 1\n');
  [simp] = simpson(x,f)
  print(simp);
catch err
  warning(err.identifier, err.message);
end