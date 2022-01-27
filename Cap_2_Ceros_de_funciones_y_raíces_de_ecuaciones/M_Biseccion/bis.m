%       La función bis calcula aproximadamente la raiz de cualquier ecuación
%       Como salida obtenemos la raiz, los valores en cada iteración organizados en una tabla y un gráfico que ilustra la aproximación. 
%
%       [ci,datos] = bis(funcion,ai,bi,it)
%       ci = raiz de la función
%       datos = todas las variables de la ejecución
%       funcion = la función a tratar
%       [ai,bi] = intervalo
%       it = número máximo de iteraciones

function []=bis(funcion,ai,bi,it)


fun = str2func(sprintf('@(x)%s',funcion));     %transformamos el string en funcion 
fplot(fun,[ai,bi]);   
hold on;
f = inline(funcion);
i=1;

if f(ai)*f(bi)<0    %si al evaluar los limites superior e inferior en la funcion los signos son diferentes, procedemos con el metodo

fprintf("%s\t%s\t%s\t%s\t%s\t\%s\t\%s\n", 'i','ai','bi','ci','f(ai)','f(ci)', 'f(ai)*f(ci)') % damos formato a la tabla que mostrará las iteraciones realizadas 
while i < it                  %siempre que no superemos el numero de iteraciones deseadas o se encuentre una raiz el bucle continuará
    ci = (ai + bi)/2;          %calculamos el valor intermedio de los limites
    fprintf("%d\t", i) 
    fprintf("%.4f\t", ai)
    fprintf("%.4f\t", bi)
    fprintf("%.4f\t", ci)
    fprintf("%.4f\t", f(ai))
    fprintf("%.4f\t", f(ci))
    plot(ci,f(ci))                     %graficamos cada punto
    hold on  
 if f(ai)*f(ci)<0                      %si la evaluacion de los limites en la funcion poseen diferentes signos, significa que el limite aun se encuentra 
    fprintf("%.4f\t", f(ai)*f(ci))     % entre estos limites, por lo que actualizamos el valor del limite superior por el intermedio
    bi = ci; 
   
     elseif f(ai)*f(ci)>0                    %caso contrario, el limite ya no se encuentra entre los limites por lo que el limite inferior
    fprintf("%.4f\t", f(ai)*f(ci))       % se actualiza por el intermedio
    ai = ci;
 
 elseif f(ci)==0                       %si la evaluacion del limite intermedio da cero, hemos encontrado la raiz 
    fprintf("%s","raíz encontrada")
    break 
     
 endif
fprintf("\n")
       
i++;

endwhile

       fprintf(" La raíz aproximada es: %.4f \n", ci)
else
 fprintf("%s","no se puede resolver por este metodo")
endif
endfunction