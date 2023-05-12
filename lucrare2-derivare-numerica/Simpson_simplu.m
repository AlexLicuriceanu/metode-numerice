function r = Simpson_simplu(f, a, b)
  h = (b-a)/2;
  r = h/3 * (f(a) + 4*f((a+b)/2) + f(b));
endfunction