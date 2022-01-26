%GAUSS CON PIVOTACIÓN  Reduce la matriz ingresada a una matriz triangular superior.
% 
%       [C] = Gauss(A,b)
%       C = Matriz triangular superior resultante
%       A = Matriz de coeficientes, separando las filas con punto y coma(;) y las columnas con con comas(,) 
%       b = Matriz de los terminos independientes
function [C,A,b,it] = GaussPiv(A,b)
  n=length(b);     %numero de filas que tiene la matriz
  [m,n]=size(A);
  if m != n                      %capturamos el error de no tener una matriz cuadrada
    msgID = 'GAUSSPIV:tamaño';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg);
  endif
t = ' | '; 
T = repmat(t,length(A(:,1)),1);
it=1;
  for j = 1:n-1;                %escogemos la fila con el pivote de mayor valor 
    al = abs(A(j,j)); m=j;
    for k = j+1:n;
      if abs(A(k,j)) > al
        al = abs(A(k,j)); m=k;    %este valor ocupará la fila m
      endif
    endfor
    for l = j:n                    %intercambiamos las filas j y m 
      be = A(j,l);
      A(j,l) = A(m,l);
      A(m,l) = be;
    endfor
    be = b(j); b(j) = b(m); b(m) = be;
    for k = j+1:n;                      %hacemos cero por debajo del pivote (triangular inferior)
      al = -A(k,j)/A(j,j);
      for m = j:n;
        A(k,m) = A(k,m)+al*A(j,m); 
 
      endfor
  it=it+1;     
      b(k) = b(k)+al*b(j);
      C = [num2str(A) T num2str(b)];
    endfor
    
  endfor