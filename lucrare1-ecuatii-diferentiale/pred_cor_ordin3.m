function y = pred_cor_ordin3(f, y0, a, b, n)
  % Rezolvarea unei ecuatii diferentiale de ordin 1 (y' = f(t, y)) cu conditii initiale folosind metoda predictor-corector astfel:
	% utilizam metoda Adams-Bashforth de ordinul 3 pentru predictia unei valori y_i+1 iar aceasta valoare se corecteza
  # apoi folosind metoda Adams-Moulton de ordinul 3
  y = RK2(f, y0, a, b, n);

	h = (b-a)/n;
  t(1:n+1) = a + h*[0:n];

	for i = 3:n
		aux1 = feval(f, t(i), y(i));
		aux2 = feval(f, t(i-1), y(i-1));
		aux3 = feval(f, t(i-2), y(i-2));
		
    ypred = y(i) + h/12*(23*aux1 - 16*aux2 + 5*aux3);			                % calculez y_i+1 folosind metoda Adams-Bashforth de ordinul 3
    ycor = y(i) + h/24*(9*feval(f, t(i+1), ypred)+19*aux1-5*aux2+aux3);	  % corectez y_i+1 obtinut anterior folosind metoda Adams-Moulton de ordinul 3 
    y(i+1) = ycor;
	endfor
endfunction
	

