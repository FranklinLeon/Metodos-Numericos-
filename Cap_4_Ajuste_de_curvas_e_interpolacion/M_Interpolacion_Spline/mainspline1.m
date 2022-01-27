% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
% Fecha: 19/11/2021
% Descripcion: La spline de interpolaci�n se compone de algunos polinomios, y cada polinomio est� determinado
% por dos puntos de datos adyacentes, de modo que dos polinomios adyacentes y sus derivados son continuos en el punto de conexi�n.
clc;
% Problema 1:
f = @(x) 1./(1+25*x.^2);            % Definimos la funci�n de Runge
try
  [s,x] = spline1(f)
  plotspline(s,x)
  hold on
  plot(x,y,'.*r');
  hold off
  
end  