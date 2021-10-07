clc
funcion = input('Escriba la funcion f(x): ','s')  %ingresamos la funcion 
f = inline(funcion);

ai = input('Ingrese el valor de ai inferior: '); %ingresamos los limites inferior y superior
bi = input('Ingrese el valor de bi superior: ');

it = input('Ingrese el numero de iteraciones:'); %ingresamos el numero de iteraciones
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
       
 if f(ai)*f(ci)<0                      %si la evaluacion de los limites en la funcion poseen diferentes signos, significa que el limite aun se encuentra 
    fprintf("%.4f\t", f(ai)*f(ci))     % entre estos limites, por lo que actualizamos el valor del limite superior por el intermedio
    bi = ci; 
   
 elseif f(ai)*f(ci)>0                    %caso contrario, el limite ya no se encuentra entre los limites por lo que el limite inferior se actualiza por el intermedio
    fprintf("%.4f\t", f(ai)*f(ci))
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