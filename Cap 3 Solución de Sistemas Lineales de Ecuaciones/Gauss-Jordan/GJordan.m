% Funcion de resolucion de sistemas lineales por Gauss Jordan
% 
% Entradas:
% A=matriz cuadrada
% b=vector columna
%
% Salidas:
% x=Solucion del Sistema Lineal 
% 
% Se mostraran los pasos que se realizan
%
function [x,it] = GJordan(A,b)
  
  %Captura de Errores
  
  if nargin ~= 2     % verificamos que el numeros de argumentos de la funcion se correcto
    msgID = 'Gauss Jordan: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar una matriz cuadrada A y un vector columna B';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  else
    if size(A,1) ~= size(A,2)
      msgID = 'Gauss Jordan: Ingreso de datos matriz A no valido';
      msg = 'Error: Se necesita que la matriz A sea cuadrada';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    elseif size(b,2) ~= 1
      msgID = 'Gauss Jordan: Ingreso de datos vector b no valido';
      msg = 'Error: b debe ser un vector columna';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    elseif size(A,1) ~= size(b,1)
      msgID = 'Gauss Jordan: Datos con distintas dimenciones';
      msg = 'Error: El número de filas de A no coincide con el de B. Sistema inconsistente';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    endif
  endif
  if det(A)==0
    msgID = 'Gauss Jordan: No hay solucion';
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

  %Gauss Jordan
  it=1;
  paso = 0;
  for k = 1:n
    if A(k,k) ~= 1                   %%si el elemento i,i de la diagonal es diferente de 1
      b(k) = b(k)/A(k,k);            %% dividimos los valores de la fila para el valor del pivote
      A(k,:) = A(k,:)./A(k,k);       %%
      Realizando_Operaciones = [num2str(A) T num2str(b)] %%unión de los datos en una solo matriz
      paso = paso+1
    endif
    
    for i = 1:n
      if i ~= k                          %operamos fuera de la diagonal principal en la parte superior e inferir de la diagonal principal
        factor = A(i,k)/A(k,k);           
        A(i,:) = A(i,:) - factor*A(k,:); %restamos entre las filas de la fila pivote
        b(i) = b(i) - factor*b(k);       %
        Realizando_Operaciones = [num2str(A) T num2str(b)] %%unión de los datos en una solo matriz
        paso = paso+1
        it=it+1;
      endif
      
   endfor
   
  endfor
  x=b;   % mostramos la solucion del Sistema
 
 endfunction