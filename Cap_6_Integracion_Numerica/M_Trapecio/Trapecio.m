%GAUSS-SEIDEL  Halla una aproximación de las soluciones del sistema ingresado,en base
%              a el número máximo de iteraciones y la tolerancia ingresada
%      [datos,s,h] =  Trapecio(f,b,a,n)
%       Salidas:
%       datos = Matriz con los datos internedios
%       s = sumatoria (valor de la integral)
%       h = delta de x
%       Entradas:
%       f = función a integrar 
%       a = limite inferior
%       b = limite superior
%       n = número de divisiones debajo de la función

function [datos,s,h] =  Trapecio(f,a,b,n)
  

if nargin('Trapecio')==4
  h=(b-a)/n;%Definimos el delta de la formula
  s=0; %Es la variable que va a ir sumando los calculos  
  i=0;
else
  msgID = 'Trapecio:datos de ingreso';   %capturamos el error de no tener el numero 
  msg = 'Datos de ingreso incompletos(f,b,a,n)'; % de entradas correcto
  error(msgID,msg);
endif

for i=0:n
    xi = a+i*h; %Definimos los xi de la formula
    delta = h/2; %Definimos el delta final el cual va a multiplicar cada expresion ded la sumatoria
    if (i==0 || i==n) %Si estoy en la primera o segunda itereacion el coeficiente que multiplica los terminos de la formula sera 1
      coef = 1;
      prod = coef*f(xi);
    else %Para el resto de los terminos de la formula tengo que indicar que el coeficiente que multiplica es 2
      coef = 2;
      prod = coef*f(xi); %Efectuo dicha multiplicacion
    end
    result=delta*prod; %Ahora si multiplicamos el producto anterior por el delta
    s=s+result; %Vamos acumulando los resultados en la sumatoria
    
    
    datos(i+1,1)=i;   %almaceno los datos 
    datos(i+1,2)=xi;
    datos(i+1,3)=coef;
    datos(i+1,4)=f(xi);
    datos(i+1,5)=prod;
    
    
  end
endfunction