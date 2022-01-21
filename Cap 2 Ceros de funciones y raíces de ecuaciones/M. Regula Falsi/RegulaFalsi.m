function [M, XR, ER, Iter] = RegulaFalsi(f, xl, xu, Niter, Tol)
  %M�todo Regula Falsi.
  %Llama a esta funci�n desde la ventana de comandos o cualquier script para
  %encontrar la ra�z de una funci�n en un intervalo y obt�n una tabla con el
  %proceso.

  % DATOS DE ENTRADA:

  % f = funci�n como un identificador de funci�n (function handle) 
  %   ej. @(x) cos(x)
  % xl = L�mite inferior.
  % xu = L�mite superior.
  % Niter = N�mero de iteraciones.
  % Tol = Tolerancia para el criterio de convergencia a superar o igualar en porcentaje.

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

  if nargin < 5                 
      error('Se necesita definir una funci�n, un intervalo a evaluar, un n�mero m�ximo de iteraciones y un error relativo m�nimo');
  %Si se ingresan todos los datos de entrada, elegir un m�todo de soluci�n

  else                          
      if  isempty(Niter) == 1  
          metodo = 1;
          Niter = 1000;
          disp('Soluci�n por error relativo m�nimo para converger');
      elseif isempty(Tol) == 1
          metodo = 2;
          disp('Soluci�n por n�mero m�ximo de iteraciones para converger');
      elseif isempty(Niter) == 0 && isempty(Tol) == 0
          error('Niter y Tol no pueden tener un dato de entrada al mismo tiempo, uno de los dos debe estar vac�o (ejemplo: Niter = [])');
      endif
  endif

  fxl = f(xl); %Punto en Y para el l�mite inferior.
  fxu = f(xu); %Punto en Y para el l�mite superior.

  if fxl * fxu > 0 %Esta propiedad es la que hace que �ste sea un m�todo cerrado.
      error('No hay una ra�z en ese intervalo!'); 
  endif

  for i = 1:Niter - 1
      xr(i) = xu(i) - fxu(i) * ((xu(i) - xl(i)) / (fxu(i) - fxl(i))); %Calcula el punto medio falso actual.
      fxr(i) = f(xr(i)); %Evalua la funci�n en el punto medio falso actual.
      
      if f(xr(i)) * f(xl(i)) > 0 %Si esta condici�n se cumple, la ra�z NO est� entre xl y xr
          xl(i+1) = xr(i); %El punto medio es el nuevo l�mite inferior.
          xu(i+1) = xu(i); %El l�mite superior se mantiene igual.
          fxl(i+1) = f(xl(i+1));
          fxu(i+1) = f(xu(i+1));
      elseif f(xr(i)) * f(xu(i)) > 0 %Si esta condici�n se cumple, la ra�z NO est� entre xr y xu
          xu(i+1) = xr(i); %El punto medio es el nuevo l�mite superior.
          xl(i+1) = xl(i); %El l�mite inferior se mantiene igual.
          fxl(i+1) = f(xl(i+1));
          fxu(i+1) = f(xu(i+1));
      endif
      %Asegurarse de que si Niter es muy grande aparezca una alerta.
      try
          xr(i+1)=xu(i+1)-fxu(i+1)*((xu(i+1)-xl(i+1))/(fxu(i+1)-fxl(i+1))); %Actulizamos el punto medio falso y su punto en Y
      catch
          error('Intenta un n�mero menor de iteraciones');
      end
      
      fxr(i+1)=f(xr(i+1));
      Error(i+1)=abs((xr(i+1)-xr(i))/xr(i+1))*100; %Calcula el error relativo actual
      
      if metodo == 1
          if Error(i+1) < Tol %Si el error relativo es menor a la tolerancia exigida, se acaba el ciclo.
              break;
          endif
      endif
  endfor
M1 = {'xl', 'xr', 'xu', 'f(xl)', 'f(xr)', 'f(xu)', 'Error relativo (%)'};
M2 = num2cell([xl', xr', xu', fxl', fxr', fxu', Error']);
M=[M1; M2];
XR = xr(end);
ER = Error(end);
Iter = i+1;
endfunction