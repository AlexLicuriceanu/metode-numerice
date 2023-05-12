function [x iter] = secanta(f, a, b, tol)
	%	Calculare solutie ecuatie neliniara folosind  metoda secantei
	% Pentru proba rulati comanda: fsolve 
  iter=0;
 
  if f(a)*f(b)>0
    error("Alegeti alt interval!");
  endif
  
  x=a-((b-a)*f(a))/(f(b)-f(a));
  while abs(f(x))>tol && abs(b-a)>tol
    iter++;
    if f(a)*f(x)<0
      b=x;
     else
      a=x;
    endif
    x=a-((b-a)*f(a))/(f(b)-f(a));
  endwhile
endfunction