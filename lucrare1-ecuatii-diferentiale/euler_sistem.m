function [y1 y2] = euler_sistem(f1, f2, y10, y20, a, b, n)
  % Rezolvarea unui sistem de 2 ecuatii diferentiale de ordinul 1 cu conditii initiale folosind metoda Euler
  % Sistemul are forma:
  %		y'_1 = f1(t, y1, y2)
  %		y'_2 = f2(t, y1, y2)
	
	y1(1) = y10;	
	y2(1) = y20;
	
  h = (b-a)/n;
	t(1:n+1) = a + h*[0:n];

	for i = 1:n
    K1 = h * feval(f1, t(i), y1(i), y2(i));
    K2 = h * feval(f2, t(i), y1(i), y2(i));
  
    y1(i+1) = y1(i) + K1;
    y2(i+1) = y2(i) + K2;
	endfor	
endfunction
