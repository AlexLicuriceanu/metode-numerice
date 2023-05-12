function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  % luam fiecare caz in parte
  if x >= 0 && x < val1
    % prima ramura
    y = 0;
  elseif x >= val1 && x <= val2
    % a doua ramura, calculam a si b folosind limite laterale
    a = 1/(val2 - val1);
    b = (-1) * val1 /(val2-val1);
    y = a * x + b;
  elseif x > val2 && x <= 1
    % a treia ramura
    y = 1;
  end
endfunction