function [f1 f2 y1_exact y2_exact y10 y20 a b n] = exemplu1_sistem_2ec_dif_ordin1()
  % exercitiul 2a de la pagina 337 (pagina pdf-ului) din cartea Burden&Faires
  f1 = @(t, y1, y2) y1-y2+2;
  f2 = @(t, y1, y2) -y1+y2+4*t;

	y1_exact = @(t) (-1/2)*e.^(2*t)+t.^2+2*t-1/2;
  y2_exact = @(t) (1/2)*e.^(2*t)+t.^2-1/2;
  
	% conditii initiale
  y10 = -1;
  y20 = 0;
  a = 0;
  b = 1;
  n = 10;
endfunction