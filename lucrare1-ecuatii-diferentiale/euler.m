function y = euler(f, y0, a, b, n)
  % Rezolvarea unei ecuatii diferentiale de ordinul 1 (y' = f(t, y)) cu conditii initiale folosind metoda Euler
	y(1) = y0;

  h = (b-a)/n;
	t(1:n+1) = a + h *[0:n];

	for i = 1:n
    K = h * feval(f, t(i), y(i)); % f(t(i), y(i))

		y(i+1) = y(i) + K;
	endfor	
endfunction
