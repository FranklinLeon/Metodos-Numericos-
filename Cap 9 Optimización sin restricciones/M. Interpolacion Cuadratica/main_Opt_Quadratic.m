clear;
clc; 

%Apply the quadratic interpolation search method to minimize the following function 
%f (x) = e^(?2x) + x^2 on interval [?5, 5]
fprintf('Ejercicio 1 \n');
f=@(x) e.^(-2*x)+x.^2;
x1 = -5;
x3 = 5;
error = 1e-7;
maxiter = 100;
datos = "";

try
[datos,xm,fxm] = Opt_Quadratic(f,x1,x3,error,maxiter);
fprintf('       k         x1        x2       x3        fx1       fx2      fx3\n' )
disp(datos);
fprintf('\n');
fprintf('Punto minimo %.4f \n',xm);
fprintf('Función evaluada en el punto minimo %.4f \n\n',fxm);
end


%Apply the golden section search method to minimize the function
%f(x)=x^3 + 5x^2 + 4x + 6 on the interval [-2, 2]

fprintf('Ejercicio 2 \n');
f=@(x) x.^3+5*x.^2+4*x+6;
x1 = -2;
x3 = 2;
error = 1e-7;
maxiter = 100;
datos = "";

try
[datos,xm,fxm] = Opt_Quadratic(f,x1,x3,error,maxiter);
fprintf('       k         x1        x2       x3        fx1       fx2      fx3\n' )
disp(datos);
fprintf('\n');
fprintf('Punto minimo %.4f \n',xm);
fprintf('Función evaluada en el punto minimo %.4f \n',fxm);
end