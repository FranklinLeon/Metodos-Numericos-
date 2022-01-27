%{
 Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
 Fecha: 14/01/2021 
 Método del gradiente conjugado
 Este metodo encuentra el punto minimo de una funcion y la grafica
 Entradas:
 x0=matriz con el punto maximo  y minimo
 f=funcion a evaluar
 tol=tolerancia permitida
 maxiter=maximo numero de iteraciones 
 Salidas:
 x0 = punto minimo encontrado
 iter = numero de iteraciones reailizadas en el proceso
%}


function [x0,iter] = gradiente_conjugado(f,x0,tol,maxiter);

iter = 1;
X = [];

grad = gradient(f);
G = function_handle(grad);
gradx = @(x) G(x(:,1),x(:,2));

H1 = hessian(f);
Hx = function_handle(H1);

S = 0;
Gpr = -gradx(x0);

while (norm(gradx(x0)) > tol) && (iter < maxiter)
  X = [X;x0];
  Gi = -gradx(x0);
  H = Hx(x0);
  bet = norm(Gi).^2./norm(Gpr).^2;
  S = Gi + bet.*S;
  lam = Gi'*Gi./(S'*H*S);
  Xnew = x0 + lam.*S';
  x0 = Xnew;
  Gpr = Gi;
  iter = iter+1; 
end




