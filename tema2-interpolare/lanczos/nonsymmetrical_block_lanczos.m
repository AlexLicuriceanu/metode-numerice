function r = nonsymmetrical_block_lanczos(A, V, W, m)
    [delta0, beta0] = gram_schmidt(W' * V);
    
    Vm(1) = V * inv(beta0); 
    Wm(1) = W * delta0;
    Vn(2) = A * Vm(1);
    Wn(2) = A' * Wm(1);
    
    for j=1:m
      alpha(j) = W(j)' * Vn(j+1);
      Vn(j+1) = Vn(j+1) - Vm(j) * alpha(j);
      Wn(j+1) = Wn(j+1) - Wm(j) * alpha(j)';
      
      % scriem necunoscutele in functie de V si W
      beta = Vn(j+1) / Vm(j+1);
      delta = (Wn(j+1) / Wm(j+1))';
      
      [U, S, Z] = svd(Wn(j+1)' * Vn(j+1));
      delta = delta * U * sqrt(S);
      beta = sqrt(S) * Z' * beta;
      Vm(j+1) = Vm(j+1) * Z * (1/sqrt(S));
      Wm(j+1) = Wm(j+1) * U * (1/sqrt(S));
      
      Vn(j+2) = A * Vm(j+1) - V(j) * delta;
      Wn(j+2) = A' * Wm(j+1) - Wm(j) * beta';
    endfor
endfunction