function [M,XR,ER,Iter] = RegulaFalsi(f, xl, xu, Niter, Tol)
%Autor: Rolando Valdez Guzm�n
%Alias: Tutoingeniero
%Canal de Youtube: https://www.youtube.com/channel/UCU1pdvVscOdtLpRQBp-TbWg
%Versi�n: 2.0
%Actualizado: 30/jul/2020

%M�todo de la regla falsa modificada (versi�n funci�n) ESPA�OL.
%Llama a esta funci�n desde la ventana de comandos o cualquier script para
%encontrar la ra�z de una funci�n en un intervalo y obt�n una tabla con el
%proceso.

% ESTA FUNCION PIDE LOS SIGUIENTES DATOS DE ENTRADA:

% f = funci�n como un identificador de funci�n (function handle) 
%   ej. @(x) cos(x)
% xl = L�mite inferior. Este dato es un escalar.
% xu = L�mite superior. Este dato es un escalar.
% Niter = N�mero de iteraciones.
% Tol = Tolerancia para el criterio de convergencia a superar o igualar en
% porcentaje.

% VARIABLES DE SALIDA:

% M = Tabla de resultados {'xl', 'xr', 'xu', 'f(xl)', 'f(xr)', 'f(xu)', 'Error relativo (%)'}
% XR = Ultima iteraci�n de la ra�z de la funci�n.
% ER = Ultima iteracion del error relativo.
% Iter = N�mero de iteraciones

%METODOS DE SOLUCION

%M�todo 1: Si Niter est� vac�o (Niter = []) entonces se debe especificar un
%error relativo m�nimo para converger.
%M�todo 2: Si Tol est� vac�o (Tol = []) entonces se debe especificar un
%n�mero m�ximo de iteraciones para el c�digo. Es posible que un n�mero muy
%grande de iteraciones cree un error y un mensaje aparecer� sugiriendo
%reducir el n�mero de iteraciones.

%Si se ingresan menos de tres datos de entrada...

fxl = f(xl); %Punto en Y para el l�mite inferior.
fxu = f(xu); %Punto en Y para el l�mite superior.
il = 0;
iu = 0;

if fxl * fxu > 0 %Esta propiedad es la que hace que �ste sea un m�todo cerrado.
    error('No hay una ra�z en ese intervalo!'); 
end

for i = 1:Niter - 1
    xr(i) = xu(i) - fxu(i) * ((xu(i) - xl(i)) / (fxu(i) - fxl(i))); %Calcula el punto medio falso actual.
    fxr(i) = f(xr(i)); %Evalua la funci�n en el punto medio falso actual.
    
    if f(xr(i)) * f(xl(i)) > 0 %Si esta condici�n se cumple, la ra�z NO est� entre xl y xr
        xl(i+1) = xr(i); %El punto medio es el nuevo l�mite inferior.
        xu(i+1) = xu(i); %El l�mite superior se mantiene igual.
        fxl(i+1) = f(xl(i+1));
        fxu(i+1) = f(xu(i+1));
        il = 0;
        iu = iu + 1;
        %Si usamos dos o m�s veces seguidas el mismo l�mite superior, evaluar en la funci�n y dividir sobre 2
        if iu >= 2        
            fxu(i+1) = (fxu(i))/2;
        end
    elseif f(xr(i)) * f(xu(i)) > 0 %Si esta condici�n se cumple, la ra�z NO est� entre xl y xr
        xu(i+1) = xr(i); %El punto medio es el nuevo l�mite superior.
        xl(i+1) = xl(i); %El l�mite inferior se mantiene igual.
        fxl(i+1) = f(xl(i+1));
        fxu(i+1) = f(xu(i+1));
        iu = 0;
        il = il + 1;
        %Si usamos dos o m�s veces seguidas el mismo l�mite inferior, evaluar en la funci�n y dividir sobre 2
        if il >= 2
            fxl(i+1) = (fxl(i))/2;
        end
    end
    %Asegurarse de que si Niter es muy grande aparezca una alerta.
    try
        xr(i+1)=xu(i+1)-fxu(i+1)*((xu(i+1)-xl(i+1))/(fxu(i+1)-fxl(i+1))); %Actulizamos el punto medio falso y su punto en Y
    end
    
    fxr(i+1) = f(xr(i+1));
    Error(i+1) = abs((xr(i+1) - xr(i)) / xr(i+1)) * 100; %Calcula el error relativo actual
    
    datos(i,1)=x1;
    datos(i,2)=xr;
    datos(i,3)=xu;
    datos(i,4)=fx1;
    datos(i,5)=fxr;
    datos(i,6)=fxu;
    datos(i,7)=abs(c-a);
    
    if Error(i+1) < Tol %Si el error relativo es menor a la tolerancia exigida, se acaba el ciclo.
      break;
    end
end


fprintf("%s\t%s\t%s\t%s\t%s\t\%s\t\%s\n",'xl','xr','xu','f(xl)','f(xr)','f(xu)','Error relativo (%)')
fprintf("------------------------------------------------------------------\n")
fprintf("%.4f\t%.4f\t%.4f\t%.4f\t%.4f\t\%.4f\t\%.4f\n",xl', xr', xu', fxl', fxr', fxu', Error')
fprintf("------------------------------------------------------------------\n")

XR = xr(end);
ER = Error(end);
Iter = i+1;

%Evaluar la funci�n con la ra�z aproximada y mensaje de resumen.
Resultado = f(XR);disp(['Evaluando la funci�n ' func2str(f) ', la ra�z aproximada es: ' num2str(XR)]);
disp(['Error relativo (%): ' num2str(ER)]);
disp(['N�mero de iteraciones: ' num2str(Iter)]);