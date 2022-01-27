% Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
% 
% Fecha: 23/12/2021 

%Ejercicio 1
f = @(x) 4*x-4*x.^2;
c1=0;
c2=0;
a=1;
b=0.20;
c=1;
n=6;
m=11;

try
  U = diffinitaCalor(f,c1,c2,a,b,c,n,m)
  figure(1)   %Grafica los datos en 3D
  surf(U)
  x=0:h:a
  figure(2)
  for i=1:n-1
    plot(x,U(i,:))
    hold on
  endfor  
end