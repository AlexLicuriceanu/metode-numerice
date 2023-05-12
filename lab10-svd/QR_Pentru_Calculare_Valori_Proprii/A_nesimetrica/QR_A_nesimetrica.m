function [lambda iter] = QR_A_nesimetrica(A, tol, maxiter)
  % functia calculeaza valorile proprii pentru o matrice nesimetrica folosind algoritmul QR fara deplasare
  % matrice de test: A=[2 4 5; 6 1 0; 2 3 11]
  [n n] = size(A);
    
  A = transform_A(A);
  
  for iter = 1 : maxiter
    [Q R] = householder(A);
    new_A = R*Q;
    
    if norm(diag(A) - diag(new_A)) < tol
      lambda = diag(new_A);
      break;
    endif
    A = new_A;
  endfor
endfunction
