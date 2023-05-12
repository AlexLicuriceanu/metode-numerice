function [valp iter] = QR_deplasare_A_simetrica(A, maxiter, tol)
  % matrice de test: A*A', unde A=[2 4 5; 6 1 0; 2 3 11]
  [n n] = size(A);
	i = 1;
  
	for iter = 1 : maxiter
    % P retine coeficientii unui polinom caracteristic de gradul 2
		P = [1  -A(n,n)-A(n-1,n-1)  A(n,n)*A(n-1,n-1)-(A(n,n-1)^2)];
    % aflam radacinile lui P
		lambda = roots(P);
		
		if n == 2 
			valp(1) = lambda(1);
			valp(2) = lambda(2);
			break;
		endif

		% determinam valoarea proprie cea mai apropiata de A(n,n)
		if abs(lambda(1) - A(n,n)) >= abs(lambda(2) - A(n,n))
			miu(i) = lambda(2);
		else
			miu(i) = lambda(1);
		endif
		
		% factorizam Householder matricea A - miu(i) * eye(n)
		[Q R] = householder(A - miu(i) * eye(n));

		% calculam matricea noua
		A = R * Q + miu(i) * eye(n);
		
	  if abs(A(n, n-1)) < tol
			valp(n) = A(n, n);
			
			% calculam matricea redusa
			A = A(1:n-1, 1:n-1);
			n--;
		endif	
  	i++;
	endfor
endfunction