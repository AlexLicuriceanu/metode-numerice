function r = Simpson_compus(f, a, b, n)
  sum1 = 0;
  h = (b-a)/n;
  for i=1:n/2
    sum1 = sum1 + f(a + (2*i-1)*h);
  endfor
  
  sum2 = 0;
  for i=1:n/2-1
    sum2 = sum2 + f(a + 2*i*h); 
  endfor
  
  r = h/3 * (f(a) + f(b) + 4*sum1 + 2*sum2);
endfunction