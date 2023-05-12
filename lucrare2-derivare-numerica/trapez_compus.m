function r = trapez_compus(f, a, b, n)
  h = (b-a)/n;
  sum = 0;
  for i=1:n-1
    sum = sum + f(a + i*h);
  endfor
  
  r = h/2 * (f(a) + f(b) + 2*sum);
endfunction