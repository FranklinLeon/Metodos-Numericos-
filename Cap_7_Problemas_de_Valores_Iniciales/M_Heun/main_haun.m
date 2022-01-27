clear
clc
%pag 752
fprintf('\nEjercicio 1\n')
x0=0;
x1=3;
y0=[1;2];
ne=2;
f=@(x,y)[1/y(2);y(1)^2];
h=1/5;
datos="";

try
  [datos] = haun(x0,x1,y0,ne,f,h);
  fprintf('--------------------------------------------\n')
  fprintf('      x       y_1      y_2 \n');
  fprintf('--------------------------------------------\n')
  disp(datos)
catch err
fprintf('Error: %s\n',err.message);
end


fprintf('\nEjercicio 2\n')
x0=0;
x1=2;
y0=[4;6];
ne=2;
f=@(x,y)[-0.5*y(1);4-0.3*y(2)-0.1*y(1)];
h=0.5;
datos="";

try
  [datos] = haun(x0,x1,y0,ne,f,h);
  fprintf('--------------------------------------------\n')
  fprintf('      x       y_1      y_2 \n');
  fprintf('--------------------------------------------\n')
  disp(datos)
catch err
fprintf('Error: %s\n',err.message);
end