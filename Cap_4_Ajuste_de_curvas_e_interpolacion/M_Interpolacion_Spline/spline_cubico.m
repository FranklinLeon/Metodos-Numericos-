%  Interpolacion spline cubico
%       [a,b,c,d]=spline_cubico(X)
%       X= La matriz con los datos
%       a,b,c,d = los valores resultantes de los coeficienes
%       n= dimension de los datos

function [a,b,c,d,n]=spline_cubico(X)
n=length(X(1,:));  %calcula la dimension de los datos fila 1 x fila 2 y
for i=1:n
  a(i)=X(2-i);  %obtiene el valor de a
endfor
for i=2:n-1
  h(i)=X(1,i+1)-X(1,i); 
endfor
for i=2:n-1
  alfa(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
endfor 
l(1)=1;      %valores por defecto para calcular el valor de C
mu(1)=0;
z(1)=0;
for i=2:n-1  %resuelve un sistema tridiagonal
  l(i)=2*(X(1,i+1)-X(1,i-1))-h(i-1)*mu(i-1);
  mu(i)=h(i)/l(i);
  z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i);
endfor
l(n)=1;
z(n)=0;
c(n)=0;
for i=n-1:-1:1    %encontramos c,b,d
  c(i)=z(i)-mu(i)*c(i+1);
  b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
  d(i)=(c(i+1)-c(i))/(3*h(i));
endfor
endfunction