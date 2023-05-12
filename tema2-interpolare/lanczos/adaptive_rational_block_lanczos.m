function [Am, Bm, Cm] = adaptive_rational_block_lanczos(A, B, C, sigma1, sigma2, tol)
  H0 = eye(size(A, 1));
  epsilon = 1;
  m = 1;
  
  while epsilon > tol
    [Vm, Wm] = rational_block_lanczos(A, B, C);
    Am  = Wm' * A * Vm;
    Bm = Wm' * B;
    Cm = C * Vm;
    
    H1 = C * inv((sigma1*eye(size(A, 1))) * (Vm*Wm - eye(size(A,1)) *
         A * V(m+1)*H(m+1, m)*E(m)' * inv(H(m)) * inv(sigma2 * eye(m * size(C, 2))) * B; 
    epsilon = norm(H0 - H1, Inf);
    m = m + 1;
  endwhile
endfunctionS