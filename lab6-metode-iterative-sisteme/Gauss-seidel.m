function [x iter] = GS(A, b, x0, tol, maxiter)
	% Rezolvarea sistemului Ax=b folosind metoda Gauss-Seidel
	% Intrari:
	%		A - matricea sistemului
	%		b - vectorul termenilor liberi
	%		x0 - aproximatia intiala a solutiei
	%		tol - precizia determinarii solutiei
	%		maxiter - numarul maxim de iteratii permis
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge
  [n n]=size(A);
  x=zeros(n,1);
    
  for iter=1:maxiter
    for i=1:n
      x(i)=(b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    
    if norm(x-x0)<tol
      return;
    endif
    x0=x;
  endfor
endfunction