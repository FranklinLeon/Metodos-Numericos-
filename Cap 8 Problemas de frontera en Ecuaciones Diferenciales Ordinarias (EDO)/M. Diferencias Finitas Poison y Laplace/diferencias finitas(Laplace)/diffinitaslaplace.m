%DIFERENCIAS FINITAS (APLICACIÓN LAPLACE):Halla la solucion numerica a la 
%                                         ec. diferencial de Laplace       
%             
%      [x,y,u] = diffinitaslaplace(ua,ub,uc,ud,n,m,maxiter,error)
%       Salidas:
%       w = valores calculados para la ec. diferencial
%       Entradas:
%       ua,ub,uc,ud = condiciones de frontera
%       m,n = nuumero de intervalos
%       maxiter = iteraciones maximas
%       error = error maximo 


function [x,y,u] = diffinitaslaplace(ua,ub,uc,ud,n,m,maxiter,error)
clear u

if nargin~=8   % verificamos que el numeros de argumentos de la funcion se correcto
    msgid = 'Diferencias Finitas: Numero de Argumentos no validos';
    msg = 'Error: Se debe ingresar 3 finciones p,q,r, los limites a,b  el intervalo N y alpha y beta';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msg, msgid)
endif
 
for i=1:n+2
 u(i,1)=uc;
 u(i,m+2)=ud;
end
for j=1:m+2
 u(1,j)=ua;
 u(n+2,j)=ub;
end
p=(ua+ub+uc+ud)/4;
for i=2:n+1
 for j=2:m+1
 u(i,j)=p;
 end
end
k=0;
conv=0;
while k<maxiter & conv==0
 k=k+1;
 t=u;
 for i=2:n+1
 for j=2:m+1
 u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1));
 end
 end
 if norm((u-t),inf)/norm(u,inf)<error
 conv=1;
 end
end
if conv==1
 [x,y]=meshgrid(1:m+2,1:n+2);

else
 msgid = 'Diferencias Finitas: No convergencia';
 msg = 'Error: No existe una convergencia';
end