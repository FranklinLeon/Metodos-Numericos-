% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 06/12/2021 
% Cuadratura de Gauss o Gauss Laguerre
% con esta funcion se aproximara a encontrar la integral de una funcion
%
% Entradas:
% n=numero de puntos n
%
% Salidas:
% ceros=valores donde la funcion obtiene un cero
% pesos=pesos del polinomio
% integral_laguerre=valor de la integral

function [ceros,pesos,integralaguerre]=gauss_la(f,n)
  if nargin~=2   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Cuadratura de Gauss Laguerre Se debe ingresar una funcion y el numero de puntos del polinomio';
    msg = 'Error: El numero de datos no es correto';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    
  elseif n<0
    msgid = 'Cuadratura de Gauss Laguerre: el numero de puntos no exite';
    msg = 'Error: los valores del polinomio no son validos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
  endif
  
  %primer termino del binomio
  p(1,1)=1;
  %creamos la matriz de valores de construccion del polinomio de laguerre
  p(2,1:2)=[-1 1]; 
  for k=2:n
     p(k+1,1:k+1)=((2*(k-2)*[0 p(k,1:k)]+3*[0 p(k,1:k)]-[p(k,1:k) 0]-(k-1).^2*[0 0 p(k-1,1:k-1)]));
  end
  coef_polinomio=p(n+1,:);
  
  pesos=roots(coef_polinomio);
  
  %determinamos los coeficientes de la primera derivada del polinomio
  for i=1:n
    derivada_polinomio(i)=coef_polinomio(i)*(n+1-i);
  endfor
  %evaluamos y obtenemos los ceros
  for i=1:n
    x=pesos(i);
    evaluar=0;
    for j=1:n
      evaluar=evaluar+derivada_polinomio(j)*(x.^(n-j));
    endfor
    ceros(i,1)=(factorial(n).^2)/(pesos(i)*(evaluar.^2));
  endfor
  num_datos=size(ceros,1);
  integralaguerre=0;
  for i=1:num_datos
    integralaguerre=integralaguerre+ceros(i)*f(pesos(i));
  endfor
endfunction