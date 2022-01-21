function [M, XR, ER, Iter] = RegulaFalsi(f, xl, xu, Niter, Tol)
  %Método Regula Falsi.
  %Llama a esta función desde la ventana de comandos o cualquier script para
  %encontrar la raíz de una función en un intervalo y obtén una tabla con el
  %proceso.

  % DATOS DE ENTRADA:

  % f = función como un identificador de función (function handle) 
  %   ej. @(x) cos(x)
  % xl = Límite inferior.
  % xu = Límite superior.
  % Niter = Número de iteraciones.
  % Tol = Tolerancia para el criterio de convergencia a superar o igualar en porcentaje.

  % VARIABLES DE SALIDA:

  % M = Tabla de resultados {'xl', 'xr', 'xu', 'f(xl)', 'f(xr)', 'f(xu)', 'Error relativo (%)'}
  % XR = Ultima iteración de la raíz de la función.
  % ER = Ultima iteracion del error relativo.
  % Iter = Número de iteraciones

  %METODOS DE SOLUCION

  %Método 1: Si Niter está vacío (Niter = []) entonces se debe especificar un
  %error relativo mínimo para converger.
  %Método 2: Si Tol está vacío (Tol = []) entonces se debe especificar un
  %número máximo de iteraciones para el código. Es posible que un número muy
  %grande de iteraciones cree un error y un mensaje aparecerá sugiriendo
  %reducir el número de iteraciones.

  %Si se ingresan menos de tres datos de entrada...

  if nargin < 5                 
      error('Se necesita definir una función, un intervalo a evaluar, un número máximo de iteraciones y un error relativo mínimo');
  %Si se ingresan todos los datos de entrada, elegir un método de solución

  else                          
      if  isempty(Niter) == 1  
          metodo = 1;
          Niter = 1000;
          disp('Solución por error relativo mínimo para converger');
      elseif isempty(Tol) == 1
          metodo = 2;
          disp('Solución por número máximo de iteraciones para converger');
      elseif isempty(Niter) == 0 && isempty(Tol) == 0
          error('Niter y Tol no pueden tener un dato de entrada al mismo tiempo, uno de los dos debe estar vacío (ejemplo: Niter = [])');
      endif
  endif

  fxl = f(xl); %Punto en Y para el límite inferior.
  fxu = f(xu); %Punto en Y para el límite superior.

  if fxl * fxu > 0 %Esta propiedad es la que hace que éste sea un método cerrado.
      error('No hay una raíz en ese intervalo!'); 
  endif

  for i = 1:Niter - 1
      xr(i) = xu(i) - fxu(i) * ((xu(i) - xl(i)) / (fxu(i) - fxl(i))); %Calcula el punto medio falso actual.
      fxr(i) = f(xr(i)); %Evalua la función en el punto medio falso actual.
      
      if f(xr(i)) * f(xl(i)) > 0 %Si esta condición se cumple, la raíz NO está entre xl y xr
          xl(i+1) = xr(i); %El punto medio es el nuevo límite inferior.
          xu(i+1) = xu(i); %El límite superior se mantiene igual.
          fxl(i+1) = f(xl(i+1));
          fxu(i+1) = f(xu(i+1));
      elseif f(xr(i)) * f(xu(i)) > 0 %Si esta condición se cumple, la raíz NO está entre xr y xu
          xu(i+1) = xr(i); %El punto medio es el nuevo límite superior.
          xl(i+1) = xl(i); %El límite inferior se mantiene igual.
          fxl(i+1) = f(xl(i+1));
          fxu(i+1) = f(xu(i+1));
      endif
      %Asegurarse de que si Niter es muy grande aparezca una alerta.
      try
          xr(i+1)=xu(i+1)-fxu(i+1)*((xu(i+1)-xl(i+1))/(fxu(i+1)-fxl(i+1))); %Actulizamos el punto medio falso y su punto en Y
      catch
          error('Intenta un número menor de iteraciones');
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