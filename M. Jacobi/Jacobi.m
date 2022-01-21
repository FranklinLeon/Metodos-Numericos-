% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 28/10/2021 
% Funcion de resolucion de sistemas lineales por el metodo de Jacobi
% 
% Entradas:
% A=matriz cuadrada
% b=vector columna
% xi=vector aproximacion a la solucion
% tol=error maximo permitido
% Miter=Maximo numero de iteraciones
%
% Salidas:
% x=Solucion del Sistema Lineal 
% 
% 
%
function [x,numiter,err] = Jacobi(A,b,xi,tol,Miter)
  
  %Captura de Errores
  
  if nargin ~= 5     % verificamos que el numeros de argumentos de la funcion se correcto
    msgID = 'Jacobi: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar una matriz cuadrada A y un vector columna B';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  else
    if size(A,1) ~= size(A,2)
      msgID = 'Jacobi: Ingreso de datos matriz A no valido';
      msg = 'Error: Se necesita que la matriz A sea cuadrada';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    elseif size(b,2) ~= 1
      msgID = 'Jacobi: Ingreso de datos vector b no valido';
      msg = 'Error: b debe ser un vector columna';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    elseif size(A,1) ~= size(b,1)
      msgID = 'Jacobi: Datos con distintas dimenciones';
      msg = 'Error: El número de filas de A no coincide con el de B. Sistema inconsistente';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    endif
  endif
  if det(A)==0
    msgID = 'Jacobi: No hay solucion';
    msg = 'Error: El sistema no tiene Solucion';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  endif
  
  % Mostrar el sistema [A|b] unido
  
  n = size(A,1); 
  t = ' | '; 
  T = repmat(t,length(A(:,1)),1);  % repetir simbolo | para separar A de b en toda la matriz
  Matriz_Original = [num2str(A) T num2str(b)]   % unión de los datos en una solo matriz con los numeros como string
   
  %Reordenar Ecuaciones
  
  for k = 1:n                      % recorremos la matriz fila por fila
    if A(k,k) ~= max(abs(A(:,k)))  % buscamos el elemento de mayor magnitud dentro de las filas en la pocicion (k,k) que es la diagonal principal
      [filapivote,~] = find(abs(A) == max(abs(A(:,k))));  % buscamos la fila donde se encuentra el pivote
        A([k,filapivote(1)],:) = A([filapivote(1),k],:);  %%  intercambiamos las filas de la matriz A y el vector b  
        b([k,filapivote(1)]) = b([filapivote(1),k]);      %%  
    endif
  endfor
  Matriz_Ordenada = [num2str(A) T num2str(b)] %%unión de los datos en una solo matriz

  %Jacobi
  
  numiter=0;       %inicializamos la variable contadora de iteraciones
  x=xi;            % asignamos a x el valor se solucion aproximado xi
  p=length(A(:,1));    % p sera igual al nuero de filas q hay en la columna 1 de la matriz A
  while(numiter<Miter)  %Iteramos mientras el error de la iteracion sea menor que el permitido 
  for i=1:p            %aplicamos el metodo de Jacobi aplicado a cada una de las ecuaciones del sistema
    x(i)=(b(i)-A(i,1:i-1)*xi(1:i-1)-A(i,i+1:p)*xi(i+1:p))/A(i,i);
  endfor
    err(numiter+1)=norm(x-xi,Inf); %al error en la iteracion n le asiganamos el error que se produce entre x y xi
  if (err(numiter+1)<tol);         % si el eror entre x y xi es mayor q la tolerancia entonces terminamos el bucle 
    break;
  endif
  xi=x;                         %asignamos los valores a las nuevas variables
  numiter=numiter+1;
  
  endwhile
 endfunction