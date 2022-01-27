% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 12/11/2021 
% Funcion de Regresion Polinomial
% Ajuste con ecuaciones cuadráticas y polinomios de orden superior
%
% Entradas:
% val_inter=punto donde se hara la interpolacion
% x=vector absisas
% y=vector columnas
%
% Salidas:
% polinomio=aproximacion polinomial del conjunto de datos
% erroraprox=error de aproximacion al conjunto de datos 
%

function [yo,pol_newton,b]=Int_Newton(val_inter,x,y)
  
  if nargin~=3   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Interpolacion de Newton: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar un vector absisas, vector columnas  y el grado del polinomio';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    
  elseif length(x)~=length(y)
    msgid = 'Interpolacion de Newton: Vetores de distintos tamaños';
    msg = 'Error: los vectores no dan el par ordenado (x,y) ya que sus tamaños son distintos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif
  
  
  n=length(x); 
  b=zeros(n);  %creamos la matriz donde se llenaran lso valores de las diferencias    
  b(:,1)=y(:); %asignamos a la primera columna los valores iniciales de y 
  
% Iniciamos el metodo
% calculamos las diferencias divididas
  for j=2:n                       %inicializamos en 2 ya que la primera columna esta llena
    for i=1:n-j+1                 % restamos los renglones cada que iteramos
      b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));   %diferencias divididas
    endfor
  endfor

  %Calculamos el valor interpolado
    xo=1;
    yo=b(1,1);
  for j=1:n-1
    xo=xo.*(val_inter-x(j));             %sumamos los valores en el punto donde vamos a interpolar
    yo=yo+b(1,j+i)*xo;            %evaluamos el punto yo donde se obtiene el valor interpolado
  endfor

  
 % Calculamos el polinomio
 % transformamos los valores numericos a str
 pol_newton=num2str(b(1,1));
 
  val_x=x*-1;
  for j=2:n
    signo='';        
    if b(1,j)>=0       
      signo='+';
    endif
    new_val_x='';
    for i=1:j-1
      new_signo='';
      if val_x(i)>0
        new_signo='+';
      endif
      new_val_x=strcat(new_val_x,'*(x ',new_signo,' ',num2str(val_x(i)), ')');     %damos formato a los terminos de salida del polinomio
    endfor
    pol_newton=strcat(pol_newton,signo,num2str(b(1,j)),new_val_x);         %concatenamos todos los terminos para finalmente almacenarlo
  endfor
  pol_newton = str2func(pol_newton);

endfunction