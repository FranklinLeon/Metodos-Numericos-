%        Metodo de cuadratura gauss hermite .
%       [xx,ww] = hermite(n,f)
%       xx = salida de los valores de los zeron xi
%       ww = salida unica con el n dado
%       n = tamaño 
function [xx,ww]=hermite(n,f)
% Cálculo de ceros y pesos de la cuadratura de Gauss-Hermite
format long; 
if rem(n,2)==0, % PRIMER CASO: n par
nn=(n/2)+1; % Cálculo de la n ajustada
b=zeros(nn-1,nn-1);

% Cálculo de los primeros valores: b (n, 1)
b(1,1)=-2; % s
for i=2:nn-1, %
b(i,1)=((-1)^(i))*(2+4*(i-1))*abs(b(i-1,1));% Cálculo del n ajustado
end;

% Cálculo de los últimos valores: b (n, n)
b(1,2)=4; % valor incial
for i=2:nn-1,
b(i,i+1)=4*b(i-1,i);
end;
% cálculo de los valores de las columnas intermedias
for j=2:nn-1,
valmm=abs(b(j-1,j)/b(j-1,j-1));
valm=valmm+valmm;
for i=j:nn-1,
b(i,j)=(-1)*b(i,j-1)*valm;
valm=valm+valmm;
end;
end;
% Cálculo de ceros y pesos.
kk=1;
for i=1:nn,
poly=b(nn-1,nn-(i-1));% inversión de los coeficientes del polinomio
polyc(kk)=poly;
polyc(kk+1)=0;
kk=kk+2;
end;
ssp=size(polyc,2);
polycc=polyc(1:ssp-1)*((-1)^n);
xx=roots(polycc); % CALCULO DE LOS CEROS
polyd(i)=polycc(i)*(n+1-i);
end;
for i=1:n, % cálculo de los pesos
x=xx(i);
solde=0;
for k=1:n,
solde=solde+polyd(k)*(x^(n-k));
end;
ww(i,1)=((2^(n+1))*factorial(n)*(pi^(.5)))/(solde^2);
end;
end;
if rem(n,2)==1, % SEGUNDO CASO: n impar
nn=(n+1)/2; % Calculo del ajuste de n
b=zeros(nn,nn);
% Cálculo de los primeros valores brutos: b (n, 1)
b(1,1)=-2; % valor inicial
for i=2:nn,
b(i,1)=((-1)^(i))*(2+4*(i-1))*abs(b(i-1,1));
end;
% Cálculo de los últimos valores: b (n, n)
b(2,2)=-8; % valor inicial
for i=3:nn,
b(i,i)=4*b(i-1,i-1);
end;
% cálculo de valores de columnas intermedias
for j=2:nn-1,
valmm=abs(b(j,j)/b(j,j-1));
valm=valmm+valmm;
for i=j+1:nn,
b(i,j)=(-1)*b(i,j-1)*valm;
valm=valm+valmm;
end;
end;
% cálculo de ceros y pesos
kk=1;
for i=1:nn,
poly=b(nn,nn-(i-1));% inversión de los coeficientes polinomiales
polyc(kk)=poly;
polyc(kk+1)=0;
kk=kk+2;

end;
polycc=polyc*((-1)^n);
xx=roots(polycc); % calculo de los ceros
for i=1:n, % Coeficientes de la primera derivada del polinomio
polyd(i)=polycc(i)*(n+1-i);
end;
for i=1:n, % cálculo de los pesos
x=xx(i);
solde=0;
for k=1:n,
solde=solde+polyd(k)*(x^(n-k));
end;
ww(i,1)=((2^(n+1))*factorial(n)*(pi^(.5)))/(solde^2);
end;

end;
