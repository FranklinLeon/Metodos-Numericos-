%  Ajuste con ecuaciones no lineales .
%       [V,a,z] = creada en base a la ecuacion a ajustar
%       L = matriz triangular inferior
%       tipo = tipo de metodo a emplear
%       A = matriz de variables
%       b = vector de resultados del sistema de ecuaciones
%       n = tamaño de la matriz
function [V,a,z] = ajustenolineal(x,y,num,const)
  m=length(x); 
  n=length(y); 
  if m != n                 %Deteccion de errores para que cada vector de datos tenga la misma dimension 
    msgID = 'AJUSTENOLIN:tamaño';
    msg = 'Los datos que se intentan ajustar a la ecuacion no lineal no tienen la misma dimension';
    error(msgID,msg);
  endif
  V=zeros(length(x),num)   %Crea una matriz de ceros para ir generando cada valor.
  V(:,1)=1;              %La fila 1 ira multplicada por la constante 1 y asi sucesivamente
  V(:,2)=cos(2*pi*x);
  V(:,3)=sin(2*pi*x);
  V(:,4)=cos(4*pi*x);
  a=(V'*V)\(V'*y');      %Encontramos las n incognitas de la ecuacion 
  z=@(x) a(1)+a(2)*cos(2*pi*x)+a(3)*sin(2*pi*x)+a(4)*cos(4*pi*x); %Generamos el modelo de ecuacion con todos los datos 



endfunction