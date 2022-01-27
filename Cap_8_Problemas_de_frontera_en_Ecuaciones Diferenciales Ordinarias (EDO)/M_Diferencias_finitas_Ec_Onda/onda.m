% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 23/12/2021 
%
% alpha = valor
% beta = valor
% a = Límite inferior.
% b = Límite superior.
% N = Número de intervalos.
% p = Funcion evaluable sobre un vector
% r = Funcion evaluable sobre un vector
% r = Funcion evaluable sobre un vector
%
% VARIABLES DE SALIDA:
%
% soln = Representacion de la solucion numerica
% t = Intervalo de analisis numerico

function [soln,t] = onda(a,b,alpha,beta,r,N)
    
    if nargin~=6   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Diferencias Finitas: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar 3 finciones p,q,r, los limites a,b  el intervalo N y alpha y beta';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif
    if a>b   % verificamos que en el intervalo [a-b] de analisis este bien definido siendo b mayor 
    msgid = 'Diferencias finitas: b debe ser mayor que a argumentos no validos';
    msg = 'Error: b>a';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif
    
  
  %Iniciamos el metodo
  %Definimos la discretización
  h = (b-a)./(N+1);
  t =linspace(a,b,N+2); %Nodos,incluidos a y b
  aux =ones(N,1)./h.^2;
  % Definición de la matriz de coeficientes
  
  A=spdiags([aux -2.*aux aux],[-1 0 1],N,N);
  nodo_int=(t(2:N+1))';  %vector columna de N nodos interiores
  % Definición del vector detérminos independientes
  %rhs será el término independiente
  rhs = r(nodo_int);
  rhs(1) = rhs(1)-alpha./h.^2;
  rhs(N) = rhs(N)-beta./h.^2;
  %Resolucióndelsistema
  y = A\rhs
  %Representacióndelasoluciónnuméricaylaexacta
  soln = [alpha; y; beta];
endfunction