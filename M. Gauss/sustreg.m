% Funcion para solucionar sistemas lineales con matrices cuadradas
function [x]=sustreg(A,b)
  n=length(b);       
  x=zeros(n,1);    
  % Iteramos en la matriz de forma regresiva
  for k=n:-1:1
    % encontramos el valor de x en la pocicion k
    x(k)=b(k)/A(k,k);
    % Operamos hasta el penultimo termino(reversa)
    for i=1:k-1
      % Determinamos el termino b(i) y los asiganmos a la pocicion correspondiente 
      b(i)=b(i)-x(k)*A(i,k);
    endfor
  endfor
