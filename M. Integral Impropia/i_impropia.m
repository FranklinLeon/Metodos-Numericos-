% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 09/12/2021 

% Integracion impropia.
%
% DATOS DE ENTRADA:
%
% fun = función
% a = Límite inferior.
% b = Límite superior.
% M = Valor intermedio de analisis del la integral impropia
% N = Número de intervalos.
%
% VARIABLES DE SALIDA:
%
% I_impropia = Integral

function [I_impropia]=i_impropia(f,a,b,M,N)
  
  if nargin~=5   % verificamos que el numeros de argumentos de la funcion se correcto
  msgid = 'Integral Impropia: Se debe ingresar una funcion los limites superior e inferior, numero de intervalos y el valor de division para el analisis';
  msg = 'Error: El numero de datos no es correto';
  #baseException = MException(msgID,msg);
  #throw(baseException);
  error(msg, msgid)
  elseif N<0 
  msgid = 'Integral Impropia: el punto no exite o la funcion no esta bien ingresada';
  msg = 'Error: los valores no son validos';
  #baseException = MException(msgID,msg);
  #throw(baseException);
  error(msg, msgid)
  endif
  
  %cambiamos los limites de integracion
  na=1./a;
  ni=(-1./M);
  nb=1./b;
  
  % caso -infinito a un numero cualquiera
  if a==-inf
    %establecemos el limite de integracion e integramos para el metodo del punto medio
      lmax=na;
      lmin=ni;
      %ajustamos la ecuacion al modelo indicado en el libro gia
      g=@(t) f(1./t).*(1./(t.^2));
      [integralpm] = pto_med_comp(g,lmin,lmax,N);
      I1 = integralpm;
      %establecemos el limite de integracion e integramos con la regla de simpson
      lsup=b;
      linf=-M;
      [ I ] = Simp(f,linf,lsup,N);
      I2 = I;
      %obetenemos el valor de la integral impropia
      I_impropia=I1+I2;
  endif
  
  % caso de un numero cualquiera a +infinito
  if  b==inf
    %establecemos el limite de integracion e integramos para el metodo del punto medio
      if a>=0
        lmax=-ni;
        lmin=nb;
      else 
        lmax=nb;
        lmin=ni;
      endif  
      %ajustamos la ecuacion al modelo indicado en el libro gia
      g=@(t) f(1./t).*(1./(t.^2));
      [integralpm] = pto_med_comp(g,lmin,lmax,N);
      I1 = integralpm;
      %establecemos el limite de integracion e integramos con la regla de simpson
      lsup=M;
      linf=a;
      [ I ] = Simp(f,linf,lsup,N);
      I2 = I;
      %obetenemos el valor de la integral impropia
      I_impropia=I1+I2;
  endif
  
  % caso -infinito a +infinito
  if a==-inf && b==inf
      %Integramos de -infinito a el punto de division de la integral pero negativo
      lmax=na;
      lmin=ni;
      g=@(t) f(1./t).*(1./(t.^2));
      [integralpm] = pto_med_comp(g,lmin,lmax,N);
      I1 = integralpm;
      %Integramos de +infinito a el punto de division de la integral pero positivo
      [integralpm] = pto_med_comp(g,ni,nb,N);
      I2 = integralpm;
      %Integramos el centro
      lsup=M;
      linf=-M;
      [ I ] = Simp(f,linf,lsup,N);
      I3=I;
      %obetenemos el valor de la integral impropia
      I_impropia=I1+I2+I3;
  endif
     
endfunction