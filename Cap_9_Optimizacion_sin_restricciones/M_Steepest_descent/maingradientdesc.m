% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 13/1/2022 
%Descripcion: El gradiente descendente (GD) es un algoritmo de optimización genérico, 
%capaz de encontrar soluciones óptimas para una amplia gama de problemas.
%La idea del gradiente descendente es ajustar los parámetros de forma iterativa 
%para minimizar una función

%Ejercicio 1
%En la matriz de coeficientes a se da a conocer los valores de capacitancia de distintas partes de 
%un circuito se quiere encontrar  la aproximancion de un vector b que muestre los valores mas optimos para este circuito

A = [10, -1, 2, 0; -1, 11, -1, 3; 2 , -1, 10, -1; 0, 3, -1, 8];
b =[6; 25; -11; 15];
x0=[0 0 0 0]';
surf(A)
try
  [x,j] = gradientdesc(A,b,x0)
catch err
fprintf('Error: %s\n',err.message);
end

