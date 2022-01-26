%DIFERENCIAS FINITAS (APLICACIÓN POISSON):Halla la solucion numerica a la 
%                                         ec. diferencial de poisson         
%             
%      [datos] = pmedio(f,x0,y0,x1,h)
%       Salidas:
%       w = valores calculados para la ec. diferencial
%       Entradas:
%       a,b,c,d = limites en x y y
%       m,n = nuumero de intervalos
%       tol = tolerancia admitida
%       f = funcion igualada 
%       g1, g2, g3 y g4 = condiciones de frontera


function [w] = diffinitasPoisson(a,b,c,d,m,n,tol,it,f,g1,g2,g3,g4)
if nargin~=13   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Diferencias Finitas: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar 3 finciones p,q,r, los limites a,b  el intervalo N y alpha y beta';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
    endif

h=(b-a)/(n);
k=(d-c)/(m);
for i=1:n-1
   x(i)=a+i*h;
end
for j=1:m-1
   y(j)=c+j*k;
end
for i=1:n-1
   for j=1:m-1
   w(i,j)=0;
   end
end
lam=(h*h)/(k*k);
u=2*(1+lam);
l=1;
r=1;
while l<=it
   z=(-(h^2)*f(x(1),y(m-1))+g4(a,y(m-1))+lam*g3(x(1),d)+lam*w(1,m-2)+w(2,m-1))/u;
   norma=abs(z-w(1,m-1));
   w(1,m-1)=z;
   for i=2:n-2
      z=(-(h^2)*f(x(i),y(m-1))+lam*g3(x(i),d)+w(i-1,m-1)+w(i+1,m-1)+lam*w(i,m-2))/u;
      if abs(w(i,m-1)-z)>norma
         norma=abs(w(i,m-1)-z);
      end
      w(i,m-1)=z;
   end
   z=(-(h^2)*f(x(n-1),y(m-1))+g2(b,y(m-1))+lam*g3(x(n-1),d)+w(n-2,m-1)+lam*w(n-1,m-2))/u;
   if abs(w(n-1,m-1)-z)>norma
      norma=abs(w(n-1,m-1)-z);
   end
   w(n-1,m-1)=z;
   for j=m-2:-1:2
      z=((-h^2)*f(x(1),y(j))+g4(a,y(j))+lam*w(1,j+1)+lam*w(1,j-1)+w(2,j))/u;
      if abs(w(1,j)-z)>norma
         norma=abs(w(1,j)-z);
      end
      w(1,j)=z;   
   
   for i=2:n-2
      z=((-h^2)*f(x(i),y(j))+w(i-1,j)+lam*w(i,j+1)+w(i+1,j)+lam*w(i,j-1))/u;
      if abs(w(i,j)-z)>norma
         norma=abs(w(i,j)-z);
      end
      w(i,j)=z;   
   end
   z=((-h^2)*f(x(n-1),y(j))+g2(b,y(j))+w(n-2,j)+lam*w(n-1,j+1)+lam*w(n-1,j-1))/u;
   if abs(w(n-1,j)-z)>norma
      norma=abs(w(n-1,j)-z);
   end
   w(n-1,j)=z;
   end
   z=((-h^2)*f(x(1),y(1))+g4(a,y(1))+lam*g1(x(1),c)+lam*w(1,2)+w(2,1))/u;
   if abs(w(1,1)-z)>norma
      norma=abs(w(1,1)-z);
   end
   w(1,1)=z; 
   for i=2:n-2
      z=((-h^2)*f(x(i),y(1))+lam*g1(x(i),c)+w(i-1,1)+lam*w(i,2)+w(i+1,1))/u;
      if abs(w(i,1)-z)>norma
         norma=abs(w(i,1)-z);
      end
      w(i,1)=z;
   end
   z=((-h^2)*f(x(n-1),y(1))+g2(b,y(1))+lam*g1(x(n-1),c)+w(n-2,1)+lam*w(n-1,2))/u;
   if abs(w(n-1,1)-z)>norma
      norma=abs(w(n-1,1)-z)
   end
   w(n-1,1)=z;
   l=l+1;
   s=l;
   if norma <= tol
   l=it+1; 
   end      
end
for i=1:n-1
   for j=1:m-1
     fprintf(' %2.0f %2.0f %4.4f %2.4f  %2.8f  \n' ,i,j,x(i), y(j),w(i,j))
   end
end
