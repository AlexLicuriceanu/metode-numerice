function y = RK2(f, y0, a, b, n)
  % Rezolvarea unei ecuatii diferentiale de ordinul 1 (y' = f(t, y)) cu conditii initiale folosind metoda RK22
  y(1) = y0;

	h = (b-a)/n;
	t(1:n+1) = a + h*[0:n];

	for i = 1:n
		K1 = h*feval(f, t(i), y(i));
		K2 = h*feval(f, t(i) + h, y(i) + K1);
    
		y(i+1) = y(i) + (K1 + K2 ) / 2;
 	endfor
endfunction

