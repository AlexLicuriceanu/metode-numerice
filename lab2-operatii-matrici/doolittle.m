function [L U] = doolittle(A)
  [n n] = size(A);
  L = eye(n);
  U = zeros(n);
  
  for p = 1 : n
    U(p, p:n) = A(p, p:n) - L(p, 1:p-1)*U(1:p-1, p);
    L(p+1:n, p) = ( A(p+1:n, p) - L(p+1:n, 1:p-1)*U(1:p-1, p) ) / U(p, p);
  endfor
