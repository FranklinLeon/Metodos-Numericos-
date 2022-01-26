clc,clear

%Calcule el area bajo la curva de la funcion x^(2) desde 0 a 1

f=@(x) x.^(2); %Función dependiente de x.

figure(1);
fplot(f,'k-','LineWidth',2); %Grafica la función de color negro y grosor 2
hold on;
title(func2str(f)); hold on; grid on; %Título de la función.
line([-5 5],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
line([0 0],[-5 5],'Color','k','LineStyle','--') %Marca el eje Y.

a=0;
b=1;
n=4;
datos="";

x1=[a a];
y=[-50, 100]; 
plot(x1,y,'r');
hold on;

x2=[b b];
y=[-50, 100]; 
plot(x2,y,'r');
axis([a-1 b+1 -5 15])

try
  [datos,s,h] =  Trapecio(f,b,a,n);
  disp("\nINTEGRACION METODO TRAPECIO\n");
  disp("\nEjercicio1\n");
  disp(['El valor de Delta de X es:',num2str(h)]);
  disp("");
  fprintf('    i        xi       coef     f(xi)    producto\n');
  fprintf("---------------------------------------------------------------------------\n")
  disp(datos)
  fprintf("---------------------------------------------------------------------------\n")
  fprintf('\nEl area aproximada es: %8.4f\n',s); %Mostramos el resultado final
catch err
fprintf('Error: %s\n',err.message);
end

%Calcule el area bajo la curva de la funcion x^(10) - 1 desde 1 a 3

f=@(x) x.^(10) - 1 %Función dependiente de x.

figure(2);
fplot(f,'k-','LineWidth',2); %Grafica la función de color negro y grosor 2
hold on;
title(func2str(f)); hold on; grid on; %Título de la función.
line([-5 5],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
line([0 0],[-5 5],'Color','k','LineStyle','--') %Marca el eje Y.

a=1;
b=3;
n=20;
datos="";

x1=[a a];
y=[-50, 2000]; 
plot(x1,y,'r');
hold on;

x2=[b b];
y=[-50, 20000]; 
plot(x2,y,'r');
axis([a-1 b+1 -5 20000])

try
  [datos,s,h] =  Trapecio(f,b,a,n);
  disp("\nEjercicio 2\n");
  disp(['El valor de Delta de X es:',num2str(h)]);
  disp("");
  fprintf('        i           xi         coef         f(xi)        producto\n');
  fprintf("---------------------------------------------------------------------------\n")
  disp(datos)
  fprintf("---------------------------------------------------------------------------\n")
  fprintf('\nEl area aproximada es: %8.4f\n',s); %Mostramos el resultado final
catch err
fprintf('Error: %s\n',err.message);
end
