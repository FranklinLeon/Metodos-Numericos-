clc; clear all; close all;
fprintf('\nEjercicio 1\n');
f=@(x,y) -2.*x.^3 + 12.*x^2 - 20.*x + 8.5
x=0
y=1
h=0.5
datos='';
u=@(x) -0.5*x.^4 + 4*x.^3 - 10*x.^2 + 8.5*x + 1;
v=x:h:4;

try
  
  %llamamos a la funcion y evaluamos con los datos de ingreso
  [datos,n]=rungeKutta(f,x,y,h,u);
  [r,s] = size(datos);
  fprintf(' %2.0f      %13.4f            %13.4f            %13.4f          %17.4f\n');
  q='iteracion'; w='Valor de x'; b='y actual'; t='Solucion y'; z='Error cometido';
  o='Valor de pendiente'; k='    ';
  a=[q,k,w,k,b,k,t,k,o,k,z];
  disp(a);
  
  %obtenemos y formamos la tabla de datos
  for i=1:r
    fprintf('      %d\t     ',i);
    for j=1:s
      fprintf('     %d\t   ',datos(i,j));
    endfor
    fprintf('   \n');
   endfor
  fprintf('\nSolucion: En el valor x igual a %f alcanzado en la %.0f iteracion, con un valor de y igual a %.4f\n',datos(i,1),n,datos(i,2)); 
  figure(1);
  p=1;
  %graficamos los puntos de aproximacion
  while p < n+1
      plot(datos(p,1),datos(p,2),'ko','markerfacecolor','r');
      hold on;
      plot(datos(p,1),datos(p,3),'ko','markerfacecolor','b');
      hold on;
      p++;
  endwhile;
  
  plot(v,u(v));
  
  catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
hold off

fprintf('-----------------------------------------------------------------------------')
fprintf('\nEjercicio 2\n');

f=@(x,y) 4.*exp(0.8.*x) - 0.5.*y
x=0
y=2
h=0.5
datos='';
u=@(x) ((3.2).*exp((0.8).*x))./(0.5) ;
v=x:h:4;

try
  
  %llamamos a la funcion y evaluamos con los datos de ingreso
  [datos,n]=rungeKutta(f,x,y,h,u);
  [r,s] = size(datos);
  fprintf(' %2.0f      %13.4f            %13.4f            %13.4f          %17.4f\n');
  q='iteracion'; w='Valor de x'; b='y actual'; t='Solucion y'; z='Error cometido';
  o='Valor de pendiente'; k='    ';
  a=[q,k,w,k,b,k,t,k,o,k,z];
  disp(a);
  
  %obtenemos y formamos la tabla de datos
  for i=1:r
    fprintf('      %d\t     ',i);
    for j=1:s
      fprintf('     %d\t   ',datos(i,j));
    endfor
    fprintf('   \n');
   endfor
  fprintf('\nSolucion: En el valor x igual a %f alcanzado en la %.0f iteracion, con un valor de y igual a %.4f\n',datos(i,1),n,datos(i,2)); 
  
  figure(2);
  p=1;
  %graficamos los puntos de aproximacion
  while p < n+1
      plot(datos(p,1),datos(p,2),'ko','markerfacecolor','r');
      hold on;
      plot(datos(p,1),datos(p,3),'ko','markerfacecolor','b');
      hold on;
      p++;
  endwhile;
  
  plot(v,u(v));
  
  catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
hold off