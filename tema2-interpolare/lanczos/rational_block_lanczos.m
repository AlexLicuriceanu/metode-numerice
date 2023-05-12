function [Vm, Wm] = rational_block_lanczos(A, B, C, sigma)
  S0 = inv(A - sigma(1) * eye(size(A, 1)) * B;
  R0 = inv((A - sigma(1) * eye(size(A, 1))') * C';
  
  V(1) = S0;
  W(1) = (eye(size(C, 2)) / V(1))';
  G(1, 0) = R0 / W(1);
  H(1, 0) = 1;
  
  Vm(1) = V(1);
  Wm(1) = W(1);
  m = length(sigma);
  for k=1:m
    if k<m
      if sigma(k+1)==Inf
        S = A * V(k);
        R = A' * W(k);
      else
        S = inv(A - sigma(k+1) * eye(size(A, 1)) * V(k);
        R = inv((A - sigma(k+1) * eye(size(A, 1))') * W(k);
      endif
      
      H(k) = Wm(k)' * S;
      G(k) = Vm(k)' * R;
      S = S - Vm(k) * H(k+1, k);
      R = R - Wm(k) * G(k+1, k);
      
      V(k+1) = S / H(k+1, k);
      W(k+1) = R / G(k+1, k);
      
      [P, D, Q] = svd(W(k+1)' * V(k+1));
      V(k+1) = V(k+1) * Q' * (1/sqrt(D));
      W(k+1) = W(k+1) * P * (1/sqrt(D));
      
      H(k+1, k) = sqrt(D) * Q' * H(k+1, k);
      G(k+1, k) = sqrt(D) * P * G(k+1, k);
      Vm(k+1) = [Vm(k), V(k+1)];
      Wm(k+1) = [Wm(k), W(k+1)];
    else
      if sigma(m+1)==Inf
        S = A * B;
        R = A' * C;
      else
        S = inv(A) * B;
        R = inv(A') * C';
      endif
      
      H(m) = Wm(m)' * S;
      G(m) = Vm(m)' * R;
      
      S = S - Vm(m) * H(m);
      R = R - Wm(m) * G(m);
      
      V(m+1) = S / H(m+1, m);
      W(m+1) = R / G(m+1, m);
      
      [P, D, Q] = svd(W(m+1)' * V(m+1));
      V(m+1) = V(m+1) * Q * (1/sqrt(D));
      W(m+1) = W(m+1) * P * (1/sqrt(D));
      
      H(m+1, m) = sqrt(D) * Q' * H(m+1, m);
      G(m+1, m) = sqrt(D) * P' * G(m+1, m);
      
      V(m+1) = [Vm(m), V(m+1)];
      W(m+1) = [Wm(m), W(m+1)];
    endif
  endfor
endfunction