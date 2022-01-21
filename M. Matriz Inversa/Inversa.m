% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 05/11/2021 
% Funcion para determinar la matriz inversa 
% 
% Entradas:
% A=matriz cuadrada
%
% Salidas:
% x = matriz inversa 
% 
% Se mostraran los pasos que se realizan
%
function [x] = Inversa(A)
  
  %Captura de Errores
  
  if nargin ~= 1     % verificamos que el numeros de argumentos de la funcion se correcto
    msgID = 'Inversa: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar una matriz cuadrada A y un vector columna B';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  elseif size(A,1) ~= size(A,2)
    msgID = 'Inversa: Ingreso de datos matriz A no valido';
    msg = 'Error: Se necesita que la matriz A sea cuadrada';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  endif
  
  matident=eye(size(A)); %creamos la matriz identidad del tamaño de la matriza A
  
  % Mostrar el sistema [A|matriz identidad] unido
  
  
  n = size(A,1); 
  t = ' | '; 
  T = repmat(t,length(A(:,1)),1);                     % repetir simbolo | para separar la matriz A de la matriz  identidad
  Matriz_Original = [num2str(A) T num2str(matident)]  % unión de los datos en una solo matriz con los numeros como string
   
  %Reordenar Ecuaciones
  
  for k = 1:n                      % recorremos la matriz fila por fila
    if A(k,k) ~= max(abs(A(:,k)))  % buscamos el elemento de mayor magnitud dentro de las filas en la pocicion (k,k) que es la diagonal principal
      [filapivote,~] = find(abs(A) == max(abs(A(:,k))));               %% buscamos la fila donde se encuentra el pivote
      A([k,filapivote(1)],:) = A([filapivote(1),k],:);                 %%  intercambiamos las filas de la matriz A y la matriz identidad
      matident([k,filapivote(1)],:) = matident([filapivote(1),k],:);   %%  
      
    endif
  endfor
  Matriz_Ordenada = [num2str(A) T num2str(matident)] %%unión de los datos en una solo matriz

  %Usamos Gauss Jordan para encontar la inversa de la matriz A
  
  paso = 0;
  for k = 1:n
    if A(k,k) ~= 1                   %%si el elemento i,i de la diagonal es diferente de 1
      matident(k,:) = matident(k,:)/A(k,k);            %% dividimos los valores de la fila para el valor del pivote
      A(k,:) = A(k,:)./A(k,k);       %%
      Realizando_Operaciones = [num2str(A) T num2str(matident)] %%unión de los datos en una solo matriz
      paso = paso+1
    endif
    
    for i = 1:n
      if i ~= k                          %operamos fuera de la diagonal principal en la parte superior e inferir de la diagonal principal
        factor = A(i,k)/A(k,k);           
        A(i,:) = A(i,:) - factor*A(k,:); %restamos entre las filas de la fila pivote
        matident(i,:) = matident(i,:) - factor*matident(k,:);       %
        Realizando_Operaciones = [num2str(A) T num2str(matident)] %%unión de los datos en una solo matriz
        paso = paso+1
      endif
   endfor
  endfor
  x=matident;   % mostramos la matriz inversa
 
 endfunction