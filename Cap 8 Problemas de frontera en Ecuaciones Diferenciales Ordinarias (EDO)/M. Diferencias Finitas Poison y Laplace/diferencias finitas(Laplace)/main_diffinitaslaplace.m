
ua=60;
ub=60;
uc=50;
ud=70;
n=10;
m=10;
maxiter=100;
error=0.001;


try
  [x,y,u] = diffinitaslaplace(ua,ub,uc,ud,n,m,maxiter,error)
  surf(x,y,u);
  shading flat
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch