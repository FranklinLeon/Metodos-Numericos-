clear;
clc;

fprintf('\nEjercicio 1\n')
%pag 721
f=@(x)-2*x.^3+12*x.^2-20*x+8.5;
x0=0;
y0=1;
x1=4;
h=0.5;
datos="";

j=1;
x=0:0.01:4;
y1=-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+1;
fy1=@(x)-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+1;

try
  [datos] = pmedio(f,x0,y0,x1,h);
  [n,m]=size(datos);
  
  for k=1:n
    datos(k,3)=fy1(datos(k,1));
    datos(k,4)=((datos(k,3)-datos(k,2))/datos(k,3))*100;
  end
 
  fprintf('--------------------------------------------\n')
  fprintf('      x      y_aprox    y_real    error\n');
  fprintf('--------------------------------------------\n')
  disp(datos)
  figure(1);
  plot(x,y1);
  hold on;
  
  while j < n
    plot(datos(j,1),datos(j,2),'ro-')
    hold on;
    j++;
  endwhile
catch err
fprintf('Error: %s\n',err.message);
end

fprintf('\nEjercicio 2\n')

f=@(x)sin(x);
x0=0;
y0=-1;
x1=4;
h=0.5;
datos="";

j=1;
x=0:0.01:4;
y1=-cos(x);
fy1=@(x)-cos(x);

try
  [datos] = pmedio(f,x0,y0,x1,h);
  [n,m]=size(datos);
  
  for k=1:n
    datos(k,3)=fy1(datos(k,1));
    datos(k,4)=((datos(k,3)-datos(k,2))/datos(k,3))*100;
  end
 
  fprintf('--------------------------------------------\n')
  fprintf('      x      y_aprox    y_real    error\n');
  fprintf('--------------------------------------------\n')
  disp(datos)
  figure(2);
  plot(x,y1);
  hold on;
  
  while j < n
    plot(datos(j,1),datos(j,2),'ro-')
    hold on;
    j++;
  endwhile
catch err
fprintf('Error: %s\n',err.message);
end