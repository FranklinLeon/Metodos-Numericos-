%{
 Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
 Fecha: 07/01/2021 
 Metodo de busqueda de la seccion dorada
 la sección dorada es una técnica para hallar el extremo (mínimo o máximo)
 de una función unimodal, mediante reducciones sucesivas del rango de valores 
 en el cual se conoce que se encuentra el extremo.
 Entradas:
 n=numero de puntos n 
 f=funcion
 a=limite inferior
 b=limite superior
 E=Epsilon tolerancia permitida
 T=coeficiente de proporción áurea
 Miter=maximon numero de iteraciones 
 Salidas:
 integral=valor de la integral 
%}



% construccion del metodo de busqueda


function [datos]=sdorada(f,a,b,E,T,Miter)
  
%capturamos errores
    if nargin~=6   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Seccion Dorada: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar 1 fincion, los limites a,b  el numero de iteracionesy el el error';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif
    if a>b   % verificamos que en el intervalo [a-b] de analisis este bien definido siendo b mayor 
    msgid = 'Seccion Dorada: b debe ser mayor que a argumentos no validos';
    msg = 'Error: b>a';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif  
    if Miter<=1   % verificamos que en el intervalo [a-b] de analisis este bien definido siendo b mayor 
    msgid = 'Seccion Dorada: Miter debe ser mayor que 0 argumentos no validos';
    msg = 'Error: Miter>0';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif 
  
% determinamos los valores de x
x1=a+(1-T).*(b-a);
x2=a+T.*(b-a);
% determinamos los valores de la funcion en los puntos x determinados
fx1=f(x1);
fx2=f(x2);
%inicializamos el contador e iniciamos el buble donde se debe cumplir 
k=0;
while (abs(b-a)>E)&&(k<Miter)
  k+=1;
  %si la funciom de x2 es mayor a la x1 hay un minimo
  if(fx1<fx2)
    %actualizamos las variables   
    b=x2;
    x2=x1;
    x1=a+(1-T).*(b-a);
    %evaluamos y asignamos los nuevos valores  de las funciones
    fx1=f(x1);
    fx2=f(x2);
    datos(k,1)=x1;
    datos(k,2)=f(x1);
 else
    %actualizamos las variables 
    a=(x1);
    x1=(x2);
    x2=(a+T.*(b-a));
    %evaluamos y asignamos los nuevos valores  de las funciones
    fx1=f(x1);
    fx2=f(x2);
    datos(k,1)=x2;
    datos(k,2)=f(x2);
  endif
  %actualizamos el contador
k=k+1;  
endwhile
endfunction