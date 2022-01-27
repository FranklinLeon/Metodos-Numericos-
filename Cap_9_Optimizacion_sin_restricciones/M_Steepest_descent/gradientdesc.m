%      Metodo del gradiente descendiente para n sistemas de ecuaciones con n variables 
%       [x,j] = gradientdesc(A,b,x0)
%       salida:
%       x = solucion del sistema
%       j = numero de iteraciones 
%       entradas:
%       A,b =  Matriz de coeficientes y vector solucion
%       x0 = parametros de inicio

function [x,j] = gradientdesc(A,b,x0)
  %Ax=b
  if nargin('gradientedesc')=!3
    msgID = 'Gradiente:datos de ingreso';   %capturamos el error de no tener un numero 
    msg = 'Datos de ingreso erroneos(A,b,x0)'; % de entradas correcto
    error(msgID,msg);
  endif  
  j=0;
  x=x0;           %punto inicial
  r=b-A*x;        %residuo obtenido
  d=r'*r;         %transpuesta de r por r
  tol=sqrt(eps)*norm(b); %se calcula la tolerancia
  while sqrt(d)>tol;
    j=j+1;        %inicializo contador
    v=A*r;        %se realizan los calculos del algoritmo
    alpha=d/(r'*v);  %alpha :cantidad de pasos en cada direccion    
    x=x+alpha*r;
    r=r-alpha*v;
    d=r'*r;
  endwhile  
endfunction