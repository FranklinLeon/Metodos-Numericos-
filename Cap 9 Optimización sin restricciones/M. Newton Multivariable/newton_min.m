%{
 Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco
 Fecha: 14/01/2021 
 Metodo de Optimizacion de Newton Multivariable
 Este metodo encuentra el punto
 de una función unimodal, mediante reducciones sucesivas del rango de valores 
 en el cual se conoce que se encuentra el extremo.
 Entradas:
 n=numero de puntos n 
 f=funcion
 a=limite inferior
 b=limite superior
 E=Epsilon tolerancia permitida
 T=coeficiente de proporción áurea
 Miter=maximon numero de iteraciones 
 Salidas:
 integral=valor de la integral 
%}



% construccion del metodo de busqueda



function [sol, iters, convergencia] = newton_min(grad,hess,x0,tol,Miter);
    
    %capturamos errores
    if nargin~=5   % verificamos que el numeros de argumentos de la funcion se correcto
      msgid = 'Metodo de Newton: Numero de Argumentos no validos';
      msg = 'Error: Se debe ingresar el grdiente, hesiano, vector inicial, tolerancia y el maximo de iteraciones';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
    endif
    if tol<=0   % verificamos que en el intervalo [a-b] de analisis este bien definido siendo b mayor 
      msgid = 'Metodo de Newton: la tolerancia debe ser un numero positivo';
      msg = 'Error: tol>=0';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
    endif  
      if Miter<=1   % verificamos que en el intervalo [a-b] de analisis este bien definido siendo b mayor 
      msgid = 'Metodo de Newton: Miter debe ser mayor que 0 argumentos no validos';
      msg = 'Error: Miter>0';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msg, msgid)
      endif 
    
    x = x0(1); y = x0(2);
    sol = NaN;
    convergencia = -1;
    
    for iters = 1 : Miter
    
        x_old = [x;y];
        H=hess(x,y);
        
        if any(eig(H)<=0),H=eye(2);end
          
          x_new = x_old - 0.4*(H\grad(x,y));
          if norm(grad(x,y)) < tol
            
            convergencia = 0;
            sol = x_new;
            return;
        endif
        
        
        if norm(x_new - x_old) <= (tol + eps*norm(x_new))
            
            convergencia = 1;
            sol = x_new;
            return;
        
        endif
        
        x = x_new(1);
        y = x_new(2);
    
    endfor
endfunction