function [A_k] = compression(img, k)
  img_matrix = double(imread(img));
  [m n]=size(img_matrix)

  figure; 
  % double ->uint8 
  imshow(uint8(img_matrix));   
  
  [U,S,V] = svd(img_matrix);
  
  diag(S)
  
  U_k = U(:, 1:k);
  S_k = S(1:k, 1:k);
  V_k = V(:, 1:k);
  
  %U_k = U(:, k+1:m);
  %S_k = S(k+1:m, k+1:m);
  %V_k = V(:, k+1:m);
  
  A_k = U_k * S_k * V_k';
  figure; 
  imshow(uint8(A_k));   
end