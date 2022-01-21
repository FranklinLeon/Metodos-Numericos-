% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 19/11/2021 
% Funcion de diferencias Finitas
% Determina la derivada numerca de primer y segundo orden
% para esto nos basaremos en polinio de Newton para realizar un 
% una funcion a partir de las coordenadas (x,y) y en esta aplicar la derivacion
% cabe destacar que las diferencias divididas del polinomio tambien nos probeen esta informacion. 
%
% Entradas:
% x=vector absisas
% y=vector columnas
%
% Salidas:
% derivacion numerica de primer y segundo orden 
% estas diferencias finitas seran hacia adelante, atras y centradas
%

function [dhD,dhA,dC,dhD2,dhA2,dC2]=D_finitas(x,y)
  
  if nargin~=2   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Diferencias Dividas: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar un vector absisas, vector columnas  y el grado del polinomio';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    
  elseif length(x)~=length(y)
    msgid = 'Diferencias Dividas: Vetores de distintos tamaños';
    msg = 'Error: los vectores no dan el par ordenado (x,y) ya que sus tamaños son distintos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif
  
  
  n=length(x); 
  dhD=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones hacia delante 1d   
  dhA=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones hacia atras 1d
  dC=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones centradas 1d
  dhD2=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones hacia delante 2d   
  dhA2=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones hacia atras 2d
  dC2=zeros(n,1);  %creamos el vector donde se almacenaran las aproximaciones centradas 2d
  
  %Diferenciacion progresiva 1ra derivada
  for i=1:n-1
    dhD(i)=(y(i+1)-y(i))/(x(i+1)-x(i)); 
    if (x(i+1)-x(i))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
  
  %Diferenciacion progresiva 2da derivada
  for i=1:n-2
    dhD2(i)=(y(i+2)-2.*y(i+1)+y(i))/(x(i+1)-x(i)).^2;
    dhA2(i)=dhD2(i)/2;  
    if (x(i+1)-x(i))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
  
  %Diferenciacion regresiva 1ra derivada
  for i=2:n
    dhA(i)=(y(i)-y(i-1))/(x(i)-x(i-1)); 
    if (x(i)-x(i-1))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
  
  %Diferenciacion regresiva 2da derivada
  for i=3:n
    dhA2(i)=(y(i)-2.*y(i-1)+y(i-2))/(x(i)-x(i-1)).^2;
    dhA2(i)=dhA2(i)/2;
    if (x(i)-x(i-1))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
  
  %Diferenciacion centrada 1ra derivada
  for i=2:(n-1)
    dC(i)=(y(i+1)-y(i-1))/(x(i+1)-x(i-1)); 
    if (x(i)-x(i-1))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
  
  %Diferenciacion centrada 2da derivada
  for i=3:(n-2)
    dC2(i)=(y(i+1)-2.*y(i)+y(i-1))/(x(i+1)-x(i-1)).^2; 
    dC2(i)=dC2(i)/2; 
    if (x(i)-x(i-1))==0
      msgid = 'Diferencias Dividas: division por cer0';
      msg = 'Error: lla derivada no existe ya que se divide por cero';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      return
    endif
  endfor
endfunction