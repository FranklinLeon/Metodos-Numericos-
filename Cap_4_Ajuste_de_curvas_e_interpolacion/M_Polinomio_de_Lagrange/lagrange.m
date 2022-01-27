%DATOS 
%X es un vector que contiene la lista de abscisas
%Y es un vector que contiene la lista de ordenadas
%y_a es la evaluación del punto intermedio a en el polinomio
%RESULTADOS
% C es la matriz que contiene los coeficientes del polinomio
% interpolador de Lagrange
% L es la matriz que contiene los coeficientes de los polinomios 
% a es un punto intermedio ha evaluar en el polinomio resultante
function [C,L,y_a] = lagrange(X,Y,a)

w = length(X);
m = length(Y);

if m != w                          %capturamos el error de no tener el mismo numero de elementos 
    msgID = 'minimos_cuadrados:tamaño';     % en las dos matrices
    msg = 'El numero de datos entre las matrices "x" y "y no coinciden" ';
    error(msgID,msg);
 endif

if nargin('minimos_cuadrados') != 2   
    msgID = 'minimos_cuadrados:datos de ingreso';   %capturamos el error de no tener el numero 
    msg = 'Datos de ingreso incompletos (x,y)'; % de entradas correcto
    error(msgID,msg);
endif

L = zeros(w,w);

% FORMACION DE LOS POLINOMIOS Li DE LAGRANGE
for k = 1:w
    V = 1;
    for r = 1:w
        if k != r
            V = conv(V,poly(X(r)))/(X(k)-X(r)); %realiza el producto entre los coeficientes de los polinomios V 
                                               % y el polinomio cuyas raices son los elementos de X 
        end
    end
    L(k,:) = V;
end
% CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
C=Y*L;
y_a=polyval(C,a);      %evalúa el polinomio C para el valor de a