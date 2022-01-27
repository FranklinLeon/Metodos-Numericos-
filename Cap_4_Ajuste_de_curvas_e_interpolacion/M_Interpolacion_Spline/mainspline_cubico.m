% Autores: Franklin Leon, Jonathan Pacheco, Luis Yanza
%
% Fecha: 18/11/2021
%Las funciones spline polin�micas de grado mayor que uno siguen una filosof�a id�ntica a las de grado uno,
% s�lo que al aumentar el grado se puede conseguir mayor regularidad global, sin que cambie mucho la dimensi�n del espacio vectorial.
%As�, los splines cuadr�ticos con nodos $x_{1}$, $\ldots$, $x_{n}$ est�n constituidos por par�bolas a trozos, unidas entre s� no s�lo
%con continuidad sino tambi�n con tangente continua, de tal forma que son funciones de clase uno en el intervalo [ a,b] . El espacio vectorial correspondiente se nota.

%Ejemplo 1
X=[0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44; 2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52]
try 
  [a,b,c,d,n]=spline_cubico(X)
  for i=1:n-1  %genera los subintervalos
  x=X(1,i):0.1:X(1,i+1);
  y=a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3;
  hold on;
  plot(x,y,'b');  
  endfor
  for i=1:n-1 %grafica todos los datos
  hold on
  plot(X(1,i),x(2,i),'`','MarkerEdgeColor','r','LineWidth',l);
  title('Interpolaci�n splines ');
end