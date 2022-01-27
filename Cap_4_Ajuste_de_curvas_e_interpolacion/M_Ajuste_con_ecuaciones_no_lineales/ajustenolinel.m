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
    %Crea una matriz de ceros para ir generando cada valor.
  V=zeros(length(x),3);
  V(:,1)=log(x);
  V(:,2)=cos(x);
  V(:,3)=exp(x);
  a=(V'*V)\(V'*y');      %Encontramos las n incognitas de la ecuacion 
  z=@(x) a(1)*log(x)+a(2)*cos(x)+a(3)*exp(x); %Generamos el modelo de ecuacion con todos los datos 
endfunction