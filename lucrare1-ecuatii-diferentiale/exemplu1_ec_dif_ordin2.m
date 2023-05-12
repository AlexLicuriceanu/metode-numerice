function [f1 f2 y_exact u10 u20 a b n] = exemplu1_ec_dif_ordin2()
  1% exercitiul 4a de la pagina 338 (pagina pdf-ului) din cartea Burden&Faires
  f1 = @(t, u1, u2) u2;
  f2 = @(t, u1, u2) 3*u2-2*u1+6*e^(-t);

	y_exact = @(t) 2*e.^(2*t) - e.^t + e.^(-t);
  
	% conditii initiale
  u10 = 2;
  u20 = 2;
  a = 0;
  b = 1;
  n = 10;
endfunction