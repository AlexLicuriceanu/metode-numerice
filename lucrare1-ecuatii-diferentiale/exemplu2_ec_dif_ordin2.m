function [f1 f2 y_exact u10 u20 a b n] = exemplu2_ec_dif_ordin2()
  % exercitiul 4b de la pagina 338 (pagina pdf-ului) din cartea Burden&Faires
  f1 = @(t, u1, u2) u2;
  f2 = @(t, u1, u2) -(1/t)*u2+(4/(t^2))*u1-3/t;

	y_exact = @(t) 2*t.^2+t+t.^(-2);
  
	% conditii initiale
  u10 = 4;
  u20 = 3;
  a = 1;
  b = 3;
  n = 10;
endfunction