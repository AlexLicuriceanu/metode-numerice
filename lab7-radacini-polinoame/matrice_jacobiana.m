function J = matrice_jacobiana(x)
  J=[2*x(1)+x(2) 2*x(2)+x(1); 3*x(1)^2  3*x(2)^2];
endfunction
