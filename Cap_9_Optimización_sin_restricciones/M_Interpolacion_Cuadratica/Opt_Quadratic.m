%PUNTO MEDIO Minimiza una funcion en un intervalo definido 
%             
%      [datos,xm,fxm] = Opt_Quadratic(f,x1,x3,error,maxiter)
%       Salidas:
%       datos = Matriz con los datos intermedios
%       Entradas:
%       f = función a optimizar 
%       x1 = limite inferior
%       x3 = limite superior
%       error = error minimo 
%       maxiter = numero maximo de iteraciones 
function [datos,xm,fxm] = Opt_Quadratic(f,x1,x3,error,maxiter)

x0bar = 1e99;
x2 = 0.5*(x1 + x3);
f1 =f(x1);
f2 = f(x2);
f3 = f(x3);
z1 = (x2 - x3)*f1;
z2 = (x3 - x1)*f2;
z3 = (x1 - x2)*f3;
z4 = (x2 + x3)*z1+(x3 + x1)*z2+(x1 + x2)*z3;
xbar = z4/(2*(z1 + z2 + z3));
fbar = f(xbar);
d = abs(x0bar - xbar);

for k = 0:maxiter;
  if ((x1 < xbar) & (xbar < x2))
    if (fbar <= f2)
      x3 = x2;
      f3 = f2;
      x2 = xbar;
      f2 = fbar;
     else
      x1 = xbar;
      f1 = fbar;
    endif
  elseif ((x2 < xbar) & (xbar < x3))
    if (fbar <= f2)
      x1 = x2;
      f1 = f2;
      x2 = xbar;
      f2 = fbar;
    else
      x1 = x2;
      f1 = f2;
      x2 = xbar;
      f2 = fbar;
    endif
  endif
  x0bar=xbar;
  z1 = (x2 - x3)*f1;
  z2 = (x3 - x1)*f2;
  z3 = (x1 - x2)*f3;
  z4 = (x2 + x3)*z1 + (x3 + x1)*z2 + (x1 + x2)*z3;
  xbar = z4/(2*(z1 + z2 + z3));
  fbar = f(xbar);
  d = abs(x0bar - xbar);
  
  datos(k+1,1)=k;
  datos(k+1,2)=x1;
  datos(k+1,3)=x2;
  datos(k+1,4)=x3;
  datos(k+1,5)=f1;
  datos(k+1,6)=f2 ;
  datos(k+1,7)=f3;
  
  if (d <error)
    break
  endif

xm=xbar;
fxm=f(xbar);
end 
