clc; clear all;
tic;
hold off;


f=@(x) x.^3 - 13*x - 12 ; %Función dependiente de x.

delta= 0.1;
epsilon=0.1; 
max1=12; 
p0=4.5;
p1=pi./5.5;
p2=pi./5;



try
  
  [p,y,err,a,b,c]=muller(f,p0,p1,p2,delta,epsilon,max1);
  
  g=@(x) a*x.^2 + b*x +c;
  h=figure(1);
  r=(-15:0.01:15);
  plot(p,y,'or');hold on;
  plot(r,g(r)); %Grafica la función de color negro y grosor 2
  plot(r,f(r)); %Grafica la función de color negro y grosor 2
  title(func2str(f)); hold on; grid on; %Título de la función.
  
  disp(['Evaluando la función ' func2str(f) ', el resultado es: ' num2str(y)]);
  disp(['Error relativo (%): ' num2str(err)]);
  disp(['La aproximación de Muller al cero de f es: ' num2str(p)]);
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
toc;

fprintf('-------------------------------------------------------------------------')
fprintf(newline);

f=@(x) cos(x)-x ; %Función dependiente de x.

delta= 0.1;
epsilon=0.001; 
max1=12; 
p0=0.5;
p1=pi./3.5;
p2=pi./4;



try
  
  [p,y,err,a,b,c]=muller(f,p0,p1,p2,delta,epsilon,max1);
  
  g=@(x) a*x.^2 + b*x +c;
  h=figure(2);
  r=(-15:0.01:15);
  plot(p,y,'or');hold on;
  plot(r,g(r)); %Grafica la función de color negro y grosor 2
  plot(r,f(r)); %Grafica la función de color negro y grosor 2
  title(func2str(f)); hold on; grid on; %Título de la función.
  
  disp(['Evaluando la función ' func2str(f) ', el resultado es: ' num2str(y)]);
  disp(['Error relativo (%): ' num2str(err)]);
  disp(['La aproximación de Muller al cero de f es: ' num2str(p)]);
catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
toc;