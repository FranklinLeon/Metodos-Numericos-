function [datos,xr] = RegulaFalsi1(f, xi, xu, Miter, Tol)

i=1;

if f(xi)*f(xu)<0

while i < Miter 
    xr = xu-((f(xu)*(xi-xu))/(f(xi)-f(xu))); %RegulaFalsi con extremo fijo xu

    datos(i,1)=i;   %almaceno los datos 
    datos(i,2)=xi;
    datos(i,3)=xu;
    datos(i,4)=xr;
    datos(i,5)=f(xi);
    datos(i,6)=f(xr);
    
 if abs(f(xr))<= Tol
    fprintf("\n")   
    break
    
 elseif f(xi)*f(xr)<0
    datos(i,7)=f(xi)*f(xr); 
    xu = xr; 
   
 elseif f(xi)*f(xr)>0
    datos(i,7)=f(xi)*f(xr); 
    xi = xr;

 endif

i++;

endwhile

else
 fprintf("%s","no se puede resolver por este metodo")
endif