%{

Autores: Luis Yanza, Franklin Leon, Jonathan Pacheco

Metdodo de Runge Kutta

Fecha: 17/12/2021 

Entradas
m = Ecuancion Diferencia de Primer Orden
x = valor inicial de x
y = valor inicial de y
h = incremento
orden = orden del metodo
metodo_grado2 = elegimos la forma de resolver el metodo del grado 2 ('M. Heun, M. Punto Medio, M. Ralston')
forma_evaluar = Elegimos la forma de evaluar por incrementos o valor de aproximacion
itr = ingresamos el valor hasta donde vamos a iterar 
val = Ingresamos el valor donde vamos a evaluar
u=funcion de la integral de la funcion dada

Salidas
datos= Matriz con los datos almacenados
n= numero de iteraciones
%}


function [datos,n]=rungeKutta(f,x,y,h,u)
  
  if h<0
    error=('El incremento debe ser mayor a cero');
  elseif h>1
    warning=('El incremento es muy alto');
  endif
  
  %Inicializamos las Variables
  orden=0;
  metodo_grado2=0;
  n=0;
  forma_evaluar=0;
    
  %Elegimos el orden del metodo de Runge Kutta
  while orden==0
  orden=input('Ingrese el orden del metodo de Runge Kutta [1-5]:  ');
    if orden<1||orden>5
        error('Valor incorrecto! Solo se puede elegir un valor entre 1 y 5.');
        orden=0;
    endif
  endwhile
  
  %Elegimos el metodo del grado 2
  if orden==2
    while metodo_grado2==0
    metodo_grado2=input('Elija 1.- M. Heun 2.- M. Punto Medio 3.-M.Ralston:  ');
      if metodo_grado2<1||metodo_grado2>3
        error('Valor incorrecto! Solo se puede elegir un valor entre 1 y 3.');
        metodo_grado2=0;
      endif
    endwhile
  endif
  
  %Elegimos la forma de evaluar el metodo por incrementos o por aproximacion a un valor x
  while (forma_evaluar<1)||(forma_evaluar>2)
    forma_evaluar=input('Forma de evaluar por 1.- Valor a evaluar 2.- Incrementos:  ');
    if forma_evaluar==1
        val=input('Ingrese el valor a evaluar:  ');
        itr=(val-x)/h;
        break;
    endif
    if forma_evaluar==2
        itr=input('Ingrese el numero de Iteraciones:  ');
        break;
    endif
    error('Valor Incorrecto! Solo puede elegir entre 1 y 2.');   
  endwhile
  
  %Primer Orden
  if orden==1
    for i=1:itr+1
        l=x;
        datos(i,1)=l;
        p=y;
        datos(i,2)=p;
        k1=f(x,y);
        datos(i,4)=k1;
        y=p+(h*k1);
        datos(i,3)=y;
        x=x+h;
        n=n+1;
        datos(i,3)=u(datos(i,1));
        datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
  
  %Segundo Orden Metodo de Heun
  if metodo_grado2==1
    for i=1:itr+1
      l=x;
      datos(i,1)=l;
      p=y;
      datos(i,2)=p;
      x=x+h;
      k1=f(l,p);
      y=y+(k1*h);
      k2=f(x,y);
      fr=(0.5*k1)+(0.5*k2);
      datos(i,4)=fr;
      y=p+(h*fr);
      datos(i,3)=y;
      n=n+1;
      datos(i,3)=u(datos(i,1));
      datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
  
  %Segundo Orden Metodo Punto Medio
  if metodo_grado2==2
    for i=1:itr+1
        l=x;
        datos(i,1)=l;
        p=y;
        datos(i,2)=p;
        x=x+(0.5*h);
        k1=f(l,p);
        y=y+(0.5*k1*h);
        datos(i,3)=y;
        k2=f(x,y);
        datos(i,4)=k2;
        y=p+(h*k2);
        x=l+h;
        n=n+1;
        datos(i,3)=u(datos(i,1));
        datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
    
  endif
  
  %Segundo Orden Metodo de Ralston
  if metodo_grado2==3
    for i=1:itr+1
        l=x;
        datos(i,1)=l;
        p=y;
        datos(i,2)=p;
        x=x+(0.75*h);
        k1=f(l,p);
        y=y+(0.75*k1*h);
        datos(i,3)=y;
        k2=f(x,y);
        fr=(k1/3)+(2*k2/3);
        datos(i,4)=fr;
        y=p+(h*fr);
        x=l+h;
        n=n+1;
        datos(i,3)=u(datos(i,1));
        datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
  
  %Tercer Orden
  if orden==3
    for i=1:itr+1
        l=x;
        datos(i,1)=l;
        p=y;
        datos(i,2)=p;
        x=x+(0.50*h);
        k1=f(l,p);
        y=p+(0.50*k1*h);
        datos(i,3)=y;
        k2=f(x,y);
        y=p-(k1*h)+(2*k2*h);
        x=l+h;
        k3=f(x,y);
        fr=(k1/6)+(4*k2/6)+(k3/6);
        datos(i,4)=fr;
        y=p+(h*fr);
        n=n+1;
        datos(i,3)=u(datos(i,1));
        datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
  
  %Cuarto Orden 
  if orden==4
    for i=1:itr+1
        l=x;
        datos(i,1)=l;
        p=y;
        datos(i,2)=p;
        x=x+(0.50*h);
        k1=f(l,p);
        y=p+(0.50*k1*h);
        k2=f(x,y);
        y=p+(0.5*k2*h);
        datos(i,3)=y;
        k3=f(x,y);
        y=p+(k3*h);
        x=l+h;
        k4=f(x,y);
        fr=(k1/6)+(k2/3)+(k3/3)+(k4/6);
        datos(i,4)=fr;
        y=p+(h*fr);
        n=n+1;
        datos(i,3)=u(datos(i,1));
        datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
  
  %Quinto Orden Metodo de Butcher
  if orden==5
    for i=1:itr+1
      l=x;
      datos(i,1)=l;
      p=y;
      datos(i,2)=p;
      k1=f(l,p);
      
      x=l+(0.25*h);
      y=p+(0.25*k1*h);
      k2=f(x,y);
      
      y=p+(((k1/8)+(k2/8))*h);
      k3=f(x,y);
      
      x=l+(0.5*h);
      y=p+(((-k2/2)+k3)*h);
      k4=f(x,y);
      
      x=l+(0.75*h);
      y=p+(((3*k1/16)+(9*k4/16))*h);
      k5=f(x,y);
      
      x=l+h;
      y=p+(((-3*k1/7)+(2*k2/7)+(12*k3/7)-(12*k4/7)+(8*k5/7))*h);
      k6=f(x,y);
      
      fr=(7*k1/90)+(32*k3/90)+(12*k4/90)+(32*k5/90)+(7*k6/90);
      y=p+(h*fr);
      datos(i,3)=y;
      datos(i,4)=fr;
      n=n+1;
      datos(i,3)=u(datos(i,1));
      datos(i,5)=abs(((datos(i,3)-datos(i,2))./datos(i,3))*100);
    endfor
  endif
endfunction