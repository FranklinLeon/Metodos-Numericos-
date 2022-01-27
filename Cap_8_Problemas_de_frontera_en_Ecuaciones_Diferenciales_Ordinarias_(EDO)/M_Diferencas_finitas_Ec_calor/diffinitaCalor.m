%      Diferencias finitas para la ecuacion de calor
%       U = diffinitaCalor(f,c1,c2,a,b,c,n,m)
%       salida:
%       U = Matriz de valores encontrados
%       r = estabilizacion del calor 
%       entradas:
%       c1,c2 =  condiciones en la frontera
%       a,b = la variacion de x y t
%       c = coeficionete o parametro en la EEDD
%       n = cantidad de particiones en x
%       m= cantidad de particiones en t
function U = diffinitaCalor(f,c1,c2,a,b,c,n,m)

h = a/(n-1);  % se calcula el tamanio de particiones
k = b/(m-1);
r = c^2*(k/h^2)  % calculos del metodo
s = 1 - 2*r;
U = zeros(n,m);  % genera la matriz de solucion
U(1,1:m) = c1;
U(n,1:m) = c2;
U(2:n-1,1)= (f(h:h:(n-2)*h))';
for j =2:m
	for i=2:n-1
		U(i,j)=s * U(i , j-1) + r * (U(i-1, j-1)+ U(i+1, j-1));
	endfor
endfor
U=U'
endfunction