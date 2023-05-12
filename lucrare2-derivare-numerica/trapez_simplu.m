function r = trapez_simplu(f, a, b)
  h = (b-a);
  r = h/2 * (f(a) + f(b));
endfunction