function [f y_exact y0 a b n] = exemplu1_ec_dif_ordin1()
  % Exemplu 1a de la pagina 327 (pagina pdf-ului) din cartea Burden&Faires
  % Fie ecuatia diferentiala de ordinul 1         y' = t*e^(3t)-2*y;
  f = @(t, y) t*e^(3*t)-2*y;                    
  % solutia exacta a ecuatiei diferentiale este   y(t) = (1/5)*t*e^(3t) - (1/25)*e^(3t) + (1/25)*e^(-2t); 
  y_exact = @(t) (1/5)*t.*e.^(3*t) - (1/25)*e.^(3*t) + (1/25)*e.^(-2*t); 
 
  % conditii initiale
  y0 = 0;
  a = 0;
  b = 1;
  n = 100;
endfunction