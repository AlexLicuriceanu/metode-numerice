function [A x b] = GPP(A, b)
	[n n] = size(A);
	 x = zeros(n,1);

	for p = 1 : n -1
		pivot = -inf;
		lpiv = -1;
		
    [pivot lpiv] = max(abs(A(p:n,p)));
    lpiv += p-1;
    
		if p != lpiv
  		% interschimbarea liniilor lpiv si p
			t = A(p, p : n );
			A(p, p : n) = A(lpiv, p : n);
			A(lpiv, p : n ) = t;
			
			% interschimbarea elementelor b(lpiv) si b(p)
			t = b(p);
			b(p) = b(lpiv);
			b(lpiv) = t;
		endif
	
	  % eliminare gaussiana fara pivotare
		for i = p + 1 : n
		  tp = A(i, p)/A(p, p);
			A(i, p) = 0;
			A(i, p+1:n) = A(i, p+1:n) - tp*A(p, p+1:n);
			b(i) = b(i)-tp*b(p);
	 endfor	
 endfor
  
  % substitutia inapoi pentru rezolvarea SST
	for i = n : -1: 1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
	endfor
endfunction