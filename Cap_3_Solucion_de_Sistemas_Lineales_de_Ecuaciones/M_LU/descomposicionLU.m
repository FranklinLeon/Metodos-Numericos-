  %   Metodo de descomposion LU para sistemas de ecuaciones .
%       [U,L] = descomposicionLU(tipo,A,b,n)
%       U = matriz triangular superior
%       L = matriz triangular inferior
%       tipo = tipo de metodo a emplear
%       A = matriz de variables
%       b = vector de resultados del sistema de ecuaciones
%       n = tamaño de la matriz
function [l,u] = descomposicionLU(tipo,A,b)
[m,n]=size(A);
if m != n
    msgID = 'DESCOMPLU:tamaño';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg);
endif
if tipo=1  %Condicional para seleccion de metodo y construccion de las matrices L y U
  for i=1:n
		U(1,i)=A(1,i);
	endfor
	
	for j=1:n
		L(j,1)=A(j,1)/U(1,1);
	endfor
elseif tipo=2
	for i=1:n
		L(i,1)=A(i,1);
	endfor
	
	for j=1:n
		U(1,j)=A(1,j)/L(1,1);
	endfor
endif

for k=2:n       %Bucle para el calculo de la factorizacion
	for t=k:n
		Acumulador=0;   %Inicia el primer acumulador 
			for q=1:k-1
				Acumulador=Acumulador+(L(k,q)*U(q,t));  %Incrementa el acumulador
			endfor
		if tipo=1 %condicion acorde al  tipo de metodo
			U(k,t)=(A(k,t)-Acumulador); %Calculo de las componentes de U
		elseif tipo=2
			L(t,k)=(A(t,k)-Acumulador); %Calculo de las componentes de L
		endif
	endfor
	for r=i:n
    Acumulador2=0;  
      for y=1:k-1
        Acumuluador2=Acumulador2+(L(r,y)*U(y,k));  %actualizacion del acumulador
      endfor
		if tipo=1 %condicion segun el tipo de metodo
			L(r,k)=(A(r,k)-Acumulador2)/U(k,k); %Calcula las componente finales de la matriz L
		elseif tipo=2
			U(k,r)=(A(k,r)-Acumulador2)/L(k,k); %Calcula las componente finales de la matriz L
		endif
	endfor
endfor
l=L; %Asigna a l la matriz L para imprimirla en mainLU
u=U; %Asigna a  la matriz U para imprimirla en mainLU
endfunction