function[c,err,numiter] = newton(f,fdx,x0,tol,maxIter)
 %Estafuncióngeneraunaaproximacióndelaraízcdela
 %funciónderivablef(x)medianteelmétodoNewtonRaphson.
 %Datosnecesariosparallamaralafunción:
 %fyfdx,expresionesdef(x)yf'(x);
 %x0,aproximacióninicialdelaraízc;
 %tol,toleranciamáximaentreaproximacionessucesivas;
 %maxIter,númeromáximodeiteracionesarealizar.
 %Lafuncióndevuelvecomorespuestatresvalores:
 %
 %c=valoraproximadodelaraíz;
 %err=|f(c)|;

  %numiter=numerodeiteracionesrealizadas.
  %Iniciacióndevariables
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
    difsuc = fxn/fdxxn; %Guardadatosparalapróximaiteración
  endwhile
  if n>maxIter
    warning('NewtonRaphsonllegóalmáximodeiteraciones\n');
  endif
%Definiciónderespuestas
c = xn; err =abs(fxn); numiter = n;
endfunction