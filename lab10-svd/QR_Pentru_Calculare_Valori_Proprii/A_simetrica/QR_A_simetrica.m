function [valp iter] = QR_A_simetrica(A, maxiter, tol)
  % matrice de test: B=A*A', unde A=[2 4 5; 6 1 0; 2 3 11]
	[n n] = size(A);
	
	A = transform_A(A);
 
  for iter = 1 : maxiter
		% factorizam Householder matricea A
		[Q R] = householder(A);
		% calculam matricea noua
		A = R * Q;
		
		if abs(A(n, n-1)) < tol
			valp(n) = A(n, n);
			
			% calculam matricea redusa
			A = A(1 : n-1, 1 : n-1);
			n--;
		endif	
		
		if n == 1 
			valp(n) = A(n, n);
			break;
		endif	
	endfor
endfunction