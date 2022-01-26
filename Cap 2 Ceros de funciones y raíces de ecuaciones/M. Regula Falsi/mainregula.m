

f=@(x) x.^(10) - 1; %Función dependiente de x.

fplot(f,'k-','LineWidth',2); %Grafica la función de color negro y grosor 2
hold on;
title(func2str(f)); hold on; grid on; %Título de la función.
line([-5 5],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
line([0 0],[-5 5],'Color','k','LineStyle','--') %Marca el eje Y.
axis([-0.5 3 -5 15])
i=1;
xl=0; %Límite inferior.
xu=1.3; %Límite superior.
Miter=100; %Número de iteraciones. Recomiendo usar 100.
Tol=0.01; %Tolerancia para el criterio de convergencia a superar o igualar (%)
datos="";

try
  [datos,xr] = RegulaFalsi1(f, xl, xu, Miter, Tol);
  fprintf("%s\t%s\t%s\t%s\t%s\t\%s\t\%s\n", '       i',' xi','   xu','   xr','    f(xi)','f(xr)', 'f(xi)*f(xr)')
  fprintf("---------------------------------------------------------------------------\n")
  disp(datos)
  fprintf("---------------------------------------------------------------------------\n")
  disp(['Evaluando la función ' func2str(f) ', la raíz aproximada es: ' num2str(xr)]);
  while i < Miter
    plot(datos(i,4),datos(i,6),'ko','markerfacecolor','r')
    hold on;
    i++;
  endwhile
  end 