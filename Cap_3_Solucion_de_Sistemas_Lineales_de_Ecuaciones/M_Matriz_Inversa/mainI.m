clear all; clc;

% dadas las siguientes matrices encontrar su matriz inversa

% Ejecicio 1

%A = [-1 -5 9;4 -3 -1;-3 14 -5];

A = [-1 1 0;2 4 -3;0 -1 3]

try
disp('Algoritmo matriz inversa') 
[matriz_inveresa] = Inversa(A)
disp('-----------------------------------------------------------------------')
disp('Comprobacion')
matriz_inveresa=inv(A)

catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
disp(newline);
disp('*************************************************************************')
disp(newline);
% Ejecicio 2
B = [3 6 -2 9;5 4 5 6;-3 8 2 -3;-4 10 3 9];
try
disp('Algoritmo matriz inversa') 
[matriz_inveresa] = Inversa(B)
disp('-----------------------------------------------------------------------')
disp('Comprobacion')
matriz_inveresa=inv(B)

catch err
  %warning(err.identifier,err.message);
  fprintf('Error: %s\n',err.message);
  %err.identifier
end