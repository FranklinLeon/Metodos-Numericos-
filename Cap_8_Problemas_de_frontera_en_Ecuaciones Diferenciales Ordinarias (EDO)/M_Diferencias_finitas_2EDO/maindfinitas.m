a = 1; b = 4;
alpha = 1; beta = 4.^(1/3)+log(4);
q = @(t) 1./(t.^2);
p = @(t) -11./(3*t) ;
r = @(t) 8./(3.*t.^2)-log(t)./(t.^2);
N = 30;

try
  [soln,t] = dfinitas(a,b,alpha,beta,p,q,r,N);
  figure(1)
  plot(t,soln,'*',t,t.^(1/3)+log(t)); hold on;
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch
hold off;
fprintf('------------------------------------------------------------------------')
