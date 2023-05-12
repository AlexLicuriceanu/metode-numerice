function [U S V] = mysvd(A)
  % Proba:
  % U*S*V' = A
  
  [m, n] = size(A);
  U = zeros(m, m);
  S = zeros(m, n);
  V = zeros(n, n);
  
  if  m >= n
    [vecp, valp] = eig(A'*A);
    
    [valp, i] = sort(abs(diag(valp)),'descend');

    % calculez matricea V
    V = vecp(:, i); 
    
    % calculez matricea S
    s = sqrt(valp);
    S = [diag(s); zeros(m-n, n)];
    
    % calculez coloanele 1:n din matricea U
    for i = 1 : n
      U(:,i) = A * V(:,i) / diag(S)(i);
    endfor
    % pentru a calcula coloanele n+1:m din U folosim algoritmul Gram-Schimidt
    U = [U(:,1:n) rand(m, m-n)];
    U = GS(U); % in final se obtine matricea ortonormata U

  else
    [vecp, valp] = eig(A'*A);
    
    [valp, i] = sort(abs(diag(valp)),'descend');
    
    V = vecp(:, i);
    
    s = sqrt(valp);
    S = [diag(s)(1:m,1:m) zeros(m,n-m)];
    
    for i = 1 : m
      U(:,i) = A * V(:,i) / diag(S)(i);
    endfor

  end
endfunction