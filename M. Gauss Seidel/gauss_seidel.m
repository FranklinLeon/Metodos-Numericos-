%GAUSS-SEIDEL  Halla una aproximaci�n de las soluciones del sistema ingresado,en base
%              a el n�mero m�ximo de iteraciones y la tolerancia ingresada
%      [x,error,it]=gauss_seidel(A,b,tol,itmax)
%       Salidas:
%       x = Soluci�n aproximada del sistema
%       error = error de la soluci�n
%       it = numero de iteraciones realizadas
%       Entradas:
%       A = Matriz de coeficientes, separando las filas con punto y coma(;) y las columnas con con comas(,) 
%       b = Matriz de los terminos independientes
%       tol = error maximo permitido
%       it = n�mero m�ximo de iteraciones
function [x,error,it]=gauss_seidel(A,b,tol,itmax)
  
 [m,n]=size(A);
 if m != n                      %capturamos el error de no tener una matriz cuadrada
    msgID = 'GAUSSPIV:tama�o';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg);
 endif
 if nargin('gauss_seidel')==4   %si se introducen todos los valores se crea una matriz 
   x0=zeros(n,1);              % en donde ir� la matriz de resultados
 else
    msgID = 'gauss_seidel:datos de ingreso';   %capturamos el error de no tener el numero 
    msg = 'Datos de ingreso gauss_seidelincompletos(A,b,tol,itmax)'; % de entradas correcto
    error(msgID,msg);
 endif
 
 it=0;               %iniciamos las variables
 error=1000.0;
 D=diag(diag(A));    %creamos una matriz diagonal con el tama�o de la matriz A
 E=-tril(A,-1);      %tomamos la matriz triangular inferior de la matriz A con los signos invertidos
 F=-triu(A,+1);      %tomamos la matriz triangular superior de la matriz A con los signos invertidos
 res=norm(A*x0 - b);  %sacamos la norma del vetor de residuos, que con las iteraciones se aproximar� a 0
 error=res/norm(b);   %calculamos el error
 
 
 while ((it<itmax) && (error>tol))
   it=it+1;
   x=(D-E)\(F*x0+b);     %aplicamos la formula de gauss-seidel
   res=norm(A*x-b);       %calculamos  nuevamente la norma del vetor residuo
   error=res/norm(b);     
   x0=x;
 endwhile
 
