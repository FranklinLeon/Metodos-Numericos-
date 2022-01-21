
function I=gaussh(f,a,b,n)
% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 06/12/2021 
% Cuadratura de Gauss o Gauss Hermite
% con esta funcion se aproximara a encontrar la integral de una funcion
%
% Entradas:
% n=numero de puntos n 
% f=funcion
% a=limite inferior
% b=limite superior
% Salidas:
% integral=valor de la integral

% construccion del polinomio de hermite
k=2;
p(1,1)=1;
p(2,1:2)=[2 0];
for k=2:n
   p(k+1,1:k+1)=2*[p(k,1:k) 0]-2*(k-1)*[0 0 p(k-1,1:k-1)];
endfor
polinomioH=p(n+1,:);
%determinamos las raices
x=roots(polinomioH);
g=f(x);
for i=1:n
   c(i)=(2.^(n-1)*(factorial(n)).*sqrt(pi))./(n.^2.*(polyval(p(n,1:n),x(i))).^2);
endfor
I=dot(c,g);
endfunction