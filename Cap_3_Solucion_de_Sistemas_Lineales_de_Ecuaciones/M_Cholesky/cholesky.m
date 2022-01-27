% FACTORIZACION lU CHOLESKY
%       [N,l,U,c,Z] = Cholesky(A,b)
%       U = matriz triangular superior
%       L = matriz triangular inferior
%       N = dimension de la matriz
%       c = Matriz aumentada
%       z = vector encontrado
%       A = matriz de variables
%       b = vector de resultados del sistema de ecuaciones
clc %permite borrar el area de trabajo
clear %permite borrar las variables almacenadas
format long %permite utilizar la maxima capacidad de la maquina

function [N,l,U,c,Z,X] = cholesky(A,b)
[n,m]=size(A);
if m != n
    msgID = 'DESCOMPLU:tamaño';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg);
endif
C=[A,b];
% la matriz C, representa la forma de la matriz aumentada [Ab]
if n==m
  for k=1:n
    %La instrucción iterativa for permite repetir estamentos a un numero específico de veces
    suma1=0;
    for p=1:k-1
      suma1=suma1+L(k,p)*u(p,k);
    end
    L(k,k)=sqrt(A(k,k)-suma1);
    u(k,k)=L(k,k); %princio del metodo
    for i=k+1:n
      suma2=0;
      for q=1:k-1
        suma2=suma2+L(i,q)*u(q,k);
      end
      L(i,k)=(A(i,k)-suma2)/L(k,k); %obtencion de la matriz L
    end
    for j=k+1:n
      suma3=0;
      for r=1:k-1
        suma3=suma3+L(k,r)*u(r,j);
      end
      u(k,j)=(A(k,j)-suma3)/L(k,k); %obtencion de la matriz U
    end
  end
  producto=det(L)*det(u); %calculo del determinante
  if producto~=0
    for i=1:n
      suma=0;
      for p=1:i-1
        suma=suma+L(i,p)*z(p);
      end
      z(i)=(b(i)-suma)/L(i,i); %obtencion del vector Z
    end
    for i=n:-1:1
      suma=0;
      for p=i+1:n
        suma = suma+u(i,p)*x(p);
      end
      x(i)=(z(i)-suma)/u(i,i); % solucion, calculos de las variables
    end
  else
    msgID = 'DETERMINANTE:Cero';
    msg = 'El determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion';
    error(msgID,msg);
  end
end
N=n;
l=L;
U=u;
c=C;
Z=z;
X=x;
endfunction