function [A,p,y]=difdiv(a,b,x,plotme)
  % A partir de dos vectores columna a,b de igual tamanno
  % calcula las diferencias divididas acumulandolas en una matriz
  % la primera columna de la matriz son las dif. div de orden 0
  % la segunda las de orden 1, etc.
  % Devuelve tambien los coeficientes en la base de Newton del
  % polinomio interpolador de la tabla, esto es, la primera fila de A
  % Finalmente devuelve el valor del polinomio en los valores de la lista x
  % Si "plotme" vale 1 entonces hace un dibujo de los datos y el polinomio
  
  n=length(a);
  A=zeros(n);
  vector=b;
  A(:,1)=vector;
  
  for j=2:n
  vector=(vector(2:end)-vector(1:end-1))./(a(j:n)-a(1:n-j+1));
  A(1:n-j+1,j)=vector;
  endfor
  
  A;
  p=A(1,:);
  y=zeros(size(x))+p(1);
  producto=1;
  
  for k=2:n
  producto=producto.*(x-a(k-1));
  y=y+p(k)*producto;
  endfor
  
  if plotme==1
  plot(a,b,'x',x,y);
  endif
endfunction