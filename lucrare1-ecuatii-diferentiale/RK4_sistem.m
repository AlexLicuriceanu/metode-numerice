function [y1 y2] = RK4_sistem(f1, f2, y10, y20, a, b, n)
  % Rezolvarea unui sistem de 2 ecuatii diferentiale de ordinul 1 cu conditii initiale folosind metoda RK2
  % Sistemul are forma:
  %		y'_1 = f1(t, y1, y2)
  %		y'_2 = f2(t, y1, y2)

	y1(1) = y10;	
	y2(1) = y20;
	
  h = (b-a)/n;
	t(1:n+1) = a + h*[0:n];

  for i = 1:n
		K11 = h*feval(f1, t(i), y1(i), y2(i));
		K21 = h*feval(f2, t(i), y1(i), y2(i));

		K12 = h*feval(f1, t(i) + h, y1(i) + K11, y2(i) + K21);
		K22 = h*feval(f2, t(i) + h, y1(i) + K11, y2(i) + K21);
    
		y1(i+1) = y1(i) + (K11 + K12) / 2;
		y2(i+1) = y2(i) + (K21 + K22) / 2;
 	endfor
endfunction

