function[c,err,numiter] = newton(f,fdx,x0,tol,maxIter)
 %Estafunci�ngeneraunaaproximaci�ndelara�zcdela
 %funci�nderivablef(x)medianteelm�todoNewtonRaphson.
 %Datosnecesariosparallamaralafunci�n:
 %fyfdx,expresionesdef(x)yf'(x);
 %x0,aproximaci�ninicialdelara�zc;
 %tol,toleranciam�ximaentreaproximacionessucesivas;
 %maxIter,n�merom�ximodeiteracionesarealizar.
 %Lafunci�ndevuelvecomorespuestatresvalores:
 %
 %c=valoraproximadodelara�z;
 %err=|f(c)|;

  %numiter=numerodeiteracionesrealizadas.
  %Iniciaci�ndevariables
  n = 0; xn = x0;
  fxn =feval(f,xn);
  fdxxn =feval(fdx,xn);
  difsuc = fxn/fdxxn;%Diferenciaentreiteracionessucesivas
  %Bucle
  while abs(difsuc)>=tol && n<=maxIter
    n = n+1;
    xn = xn-difsuc;
    fxn =feval(f,xn);
    fdxxn =feval(fdx,xn);
    difsuc = fxn/fdxxn; %Guardadatosparalapr�ximaiteraci�n
  endwhile
  if n>maxIter
    warning('NewtonRaphsonlleg�alm�ximodeiteraciones\n');
  endif
%Definici�nderespuestas
c = xn; err =abs(fxn); numiter = n;
endfunction