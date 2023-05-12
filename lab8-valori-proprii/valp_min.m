function [lambda y iter] = valp_min(A, y, maxiter, tol)
  % Functia calculeaza cea mai mica valorea proprie pentru o matrice
  % Testare:
  %   A = [15 -2 2; 1 10 -3; -2 -1 0], y = [1 1 1]'
  %   [lambda yy iter] = valp_min(A, y, 100, 0.0001)
  % Pentru proba folositi comanda [vecp valp]=eig(A)
  
  %[lambda y iter] = mpd(inv(A), y, maxiter, tol);

  C=inv(A);
  
  for iter=1:maxiter
    [B,z]=G(A,y);
    z=SST(B,z);
    
    y=z/norm(z);
    lambda=y'*C*y;
    
    if norm(C*y-lambda*y)<tol
      break;
    endif
  endfor
  lambda=1/lambda;
endfunction