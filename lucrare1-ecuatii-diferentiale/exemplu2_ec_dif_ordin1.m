function [f y_exact y0 a b n] = exemplu2_ec_dif_ordin1()
  % exemplul 1d de la pagina 328 (pagina pdf-ului) din cartea Burden&Faires
  f = @(t, y) cos(2*t)+sin(3*t);                   % Fie ecuatia diferentiala de ordinul 1,   y' = cos(2t)+sin(3t);
  y_exact = @(t) 1/2*sin(2*t)-1/3*cos(3*t)+4/3;   % solutia exacta a ecuatiei diferentiale este   y(x) = 1/2*sin(2t)-1/3*cos(3t)+4/3
 
  % conditii initiale
  y0 = 1;
  a = 0;
  b = 1;
  n = 100;
endfunction