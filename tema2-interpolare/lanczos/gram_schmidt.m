% algoritmul Gram-Schmidt modificat
% https://curs.upb.ro/2021/pluginfile.php/492902/mod_resource/content/3/Lab_3_MN_2017.pdf
function [Q, R] = gram_schmidt(A)
  [m n] = size(A);
  Q = zeros(m, n);
  R = zeros(n);  
  
  for j = 1:n
    for i = 1:j-1
      R(i, j) = Q(:, i)' * A(:, j);
    endfor

    s = zeros(m, 1);
    for i = 1:j-1
      s = s + R(i, j) * Q(:, i);
    endfor

    aux = A(:, j) - s;
    R(j, j) = norm(aux, 2);
    Q(:, j) = aux / R(j, j);
  endfor
endfunction