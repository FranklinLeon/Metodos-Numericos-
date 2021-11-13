%minimos_cuadrados   Realiza una regresi�n lineal por m�nimos cuadrados y gr�fica la 
%       linea de regresi�n junto a los datos ingresados
%      [a0,a1,Sr]=minimos_cuadrados(x,y)
%       Salidas:
%       a0 = El punto de corte con el eje y de la linea de regresi�n 
%       a1 = Pendiente de la linea de regresi�n 
%       Sr = Sumatoria de errores cuadr�ticos
%       Entradas:
%       x = matriz de nx1, en donde se encotrar� las primeros datos a relacionar
%       y = matriz de nx1, en donde se encotrar� los segundos datos a relacionar

function [a0,a1,Sr]=minimos_cuadrados(x,y)

n = numel(x);
m = numel(y);

if m != n                          %capturamos el error de no tener el mismo numero de elementos 
    msgID = 'minimos_cuadrados:tama�o';     % en las dos matrices
    msg = 'El numero de datos entre las matrices "x" y "y no coinciden" ';
    error(msgID,msg);
 endif

  if nargin('minimos_cuadrados') != 2   
    msgID = 'minimos_cuadrados:datos de ingreso';   %capturamos el error de no tener el numero 
    msg = 'Datos de ingreso incompletos (x,y)'; % de entradas correcto
    error(msgID,msg);
 endif
 
s_x = sum(x);
s_y = sum(y);
s_x2 = sum(x.^2);
s_xy = sum(x.*y);

xm = s_x/n;
ym = s_y/n;

% y = a0 + a1x
a1 = (n*s_xy-s_x*s_y)/((n*s_x2)-(s_x)^2);
a0 = ym-(a1*xm);

e = y-(a0-a1*x);
Sr = sum(e.^2);
   

 

