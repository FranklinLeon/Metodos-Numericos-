

f=@(x) x.^(10) - 1; %Funci�n dependiente de x.

fplot(f,'k-','LineWidth',2); %Grafica la funci�n de color negro y grosor 2
hold on;
title(func2str(f)); hold on; grid on; %T�tulo de la funci�n.
line([-5 5],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
line([0 0],[-5 5],'Color','k','LineStyle','--') %Marca el eje Y.
axis([-0.5 3 -5 15])
i=1;
xl=0; %L�mite inferior.
xu=1.3; %L�mite superior.
Miter=100; %N�mero de iteraciones. Recomiendo usar 100.
Tol=0.01; %Tolerancia para el criterio de convergencia a superar o igualar (%)
datos="";

try
  [datos,xr] = RegulaFalsi1(f, xl, xu, Miter, Tol);
  fprintf("%s\t%s\t%s\t%s\t%s\t\%s\t\%s\n", '       i',' xi','   xu','   xr','    f(xi)','f(xr)', 'f(xi)*f(xr)')
  fprintf("---------------------------------------------------------------------------\n")
  disp(datos)
  fprintf("---------------------------------------------------------------------------\n")
  disp(['Evaluando la funci�n ' func2str(f) ', la ra�z aproximada es: ' num2str(xr)]);
  while i < Miter
    plot(datos(i,4),datos(i,6),'ko','markerfacecolor','r')
    hold on;
    i++;
  endwhile
  end 