% PROGRAMA PARA RESOLVER SISTEMAS EDO USANDO EL METODO DE EULER
% Euler Halla una aproximación a la integral de una expresión
%      [x,t]= euleredos(x0,ne,t0,tf,dt,n)
%       Salidas:
%       x = Vector de valores solucion de cada EDO
%       t = vector con los datos del tiempo de ejecucion en cada iteracion
%       Entradas:
%       ne = numero de EDOs
%       dt = tamanio de paso en el tiempo
%       n = numero de iteraciones
%       x0 = Vector de valores iniciales de variables dependientes
%       t0 = Valor inicial del tiempo
%       tf = Valor final del tiempo



% dXi/dt = fi(X)

function [x,t]= euleredos(x0,ne,t0,tf,dt,n)
if nargin('euler')=!6
  msgID = 'Euler:datos de ingreso';   %capturamos el error de no tener un numero 
  msg = 'Datos de ingreso incompletos(xi,yi,h,n,xf,fn)'; % de entradas correcto
  error(msgID,msg);
endif  
if dt<=0 || dt>=1
  msgID = 'Euler:Paso de tiempo no valido';   %capturamos el error de no tener un numero de paso valido 
  msg = 'dt tiene que ser mayor que cero'; % de numero valido
  error(msgID,msg);
endif
% Inicialización del tiempo
t(1) = t0;

% Inicializacion de matriz x(i,j)
% i, denota el numero de la ecuación diferencial
% j, denota el numero de interación del metodo de Euler
for i = 1:ne
    x(i,1) = x0(i);
end

% Iteraciones de Metodo de Euler
for j = 1:n
    t(j+1) = t(j) + dt;
    [fx] = edos(x(:,j));
    for i=1:ne
        x(i,j+1)=x(i,j)+fx(i)*dt;
    end
end


disp(n)

endfunction