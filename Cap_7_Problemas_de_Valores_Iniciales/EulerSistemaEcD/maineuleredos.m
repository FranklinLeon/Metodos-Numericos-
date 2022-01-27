% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
%
% Fecha: 20/12/2021
% Descripcion: Se presentan dos ejemplos de la implementaci�n del script que simula el m�todo
% de Euler, El m�todo de Euler es un m�todo de primer orden, lo que significa que el error local 
% es proporcional al cuadrado del tama�o del paso, y el error global es proporcional al tama�o del paso. 
% El m�todo de Euler regularmente sirve como base para construir m�todos m�s complejos. 
% Ejemplo 1
%v
x0 = [2,1.117];     % Vector de valores iniciales de variables dependientes
ne = 2;             % numero de EDO
t0 = 0;             % Valor inicial del tiempo
tf = 5;             % Valor final del tiempo

dt = 0.9;          % Tama?o de paso en el tiempo
n = (tf-t0)/dt;     % Numero de iteraciones
try
  [x,t]= euleredos(x0,ne,t0,tf,dt,n);
  disp(x)
  % Grafica tiempo vs xi
  for i = 1:ne
    subplot(ne,1,i), plot(t,x(i,:))
  end
  disp(t)
catch err
fprintf('Error: %s\n',err.message);
end
 %