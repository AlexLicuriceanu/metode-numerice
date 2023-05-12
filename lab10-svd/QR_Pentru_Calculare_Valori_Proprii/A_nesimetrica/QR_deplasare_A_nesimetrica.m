function [lambda iter] = QR_deplasare_A_nesimetrica(A, tol, maxiter)
  % functia calculeaza valorile proprii pentru o matrice nesimetrica folosind algoritmul QR cu deplasare simpla
  % matrice de test: A*A', unde A=[2 4 5; 6 1 0; 2 3 11]
  [n n] = size(A);
    
  A = transform_A(A);
  
  for iter = 1 : maxiter
    miu = A(n,n);
    [Q R] = householder(A - miu*eye(n));
    new_A = R*Q + miu*eye(n);
    
    if norm(diag(A) - diag(new_A)) < tol
      lambda = diag(new_A);
      break;
    endif
    A = new_A;
  endfor
endfunction