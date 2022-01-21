  % Funcion para resolver matrices por Gauss
  
  % Entradas
  % A = matriz cuadrada de coeficientes
  % b = vector de terminos independientes
  
  % Salidas
  % M = matriz triangular superior
  % s = valores del termino b de la matriz triangular superior luego de las operaciones 

function [M,s] = gauss(A,b)
  
  [m,n]=size(A);    % m=filas, n=columnas m=n para matrices cuadradas
  % Recorer pivotes en la matriz 
  if (m != n)
    msgID = 'GAUSS:matrizcuadrada';
    msg = 'Error: La matriz no es cuadrada';
    error(msgID,msg)
  endif
  
  for i = 1:n-1     % operamos hasta la penultima fila
    % Detectar la falta total de pivote (rango(A)!=n) 
    if A(i:n,i)==zeros(n+1-i,1)    %verificamos que en toda la columna haya un pivote 
                                   %en la fila correspondiente
      error('La matriz no es cuadrada')
    % Aplicacion del metodo de Gauss
    else
      % Buscamos el valor mas grande y lo asiganmos como pivote
      v=abs(A(i:n,i));
      [valormax,pos] = max(v);
      % Alternamos filas poniendo el piviote maximo en la parte superior
      A([i,pos+i-1],:) = A([pos+i-1,i],:);
      b([i,pos+i-1])=b([pos+i-1,i]);
      % Hacemos 0 bajo el pivote 
      for k=i+1:n
        m=A(k,i)/A(i,i);
        for j=i:n
          A(k,j)=A(k,j)-m*A(i,j);
        endfor
        b(k)=b(k)-m*b(i);
      endfor  
    endif  
  endfor
  % Asignamos la salida
  M = A;
  s = b;
  endfunction