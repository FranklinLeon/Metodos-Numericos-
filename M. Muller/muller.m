% Metodo de Muller
%Ingresos - f es la function como string 'f'
  % - p0, p1, p2 son las aproximaciones iniciales
  % - delta tolerancia para p0, p1, p2
  % - epsilon la tolerancia para los valores de la función y
  % - max1 número máximo de iteraciones
  %salida- p aproximación de Muller al cero de f
  % - y valor de la function y = f(p)
  % - err error en la aproximación de p.
  %Inicializar las matrices P e Y
function [p,y,err,a,b,c]=muller(f,p0,p1,p2,delta,epsilon,max1)
  P=[p0 p1 p2];
  Y=feval(f,P);
  %Calcula a y b de formula (15)
  for k=1:max1
   h0=P(1)-P(3);h1=P(2)-P(3);e0=Y(1)-Y(3);e1=Y(2)-Y(3);c=Y(3);
   denom=h1*h0^2-h0*h1^2;
   a=(e0*h1-e1*h0)/denom;
   b=(e1*h0^2-e0*h1^2)/denom;
   %Suprime las raíces complejas
   if b^2-4*a*c > 0
    disc=sqrt(b^2-4*a*c);
   else
    disc=0;
   endif
   %halla la menor raíz de (17)
   if b < 0
    disc=-disc;
   endif
   z=-2*c/(b+disc);
   p=P(3)+z;
   %clasifica las entradas de p para hallar las dos más cercanas a p
   if abs(p-P(2))<abs(p-P(1))
     Q=[P(2) P(1) P(3)];
     P=Q;
     Y=feval(f,P);
   endif
   if abs(p-P(3))<abs(p-P(2))
     R=[P(1) P(3) P(2)];
     P=R;
     Y=feval(f,P);
   endif
   %Reemplaza las entradas de P más alejadas de p con p
   P(3)=p;
   Y(3) = feval(f,P(3));
   y=Y(3);

   %Determina criterio de parada
   err=abs(z);
   relerr=err/(abs(p)+delta);
   if (err<delta)||(relerr<delta)||(abs(y)<epsilon)
    break;
   endif
  endfor
  a;b;c;  
  endfunction
