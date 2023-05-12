function [x iter] = NewtonRaphson_sistem(x0, tol, maxiter)
	%	Rezolvare sistem de ecuatii neliniare folosind  metoda Newton-Raphson
	% Pentru proba rulati comanda: fsolve
	
  for iter=1:maxiter
    J=matrice_jacobiana(x0);
    F=evaluare_F(x0);
    
    [J,F]=G(J,-F);
    delta=SST(J,F);

    x=delta+x0;

    if norm(x-x0)<tol
       return;
    endif
    x0=x;
  endfor  
endfunction;
