function A = transform_A(A)
  % functia aduce o matrice nesimetrica la forma superior Hessenberg
  % functia aduce o matrice simetrica la forma tridiagonala simetrica
	[m m] = size(A);
	
 
  %for p = 1: m-1
	%	vp = zeros(m, 1);
	%	vp(p) = A(p, p) + (sign(A(p,p)) * norm(A(p:m, p)));
	%	vp(p+1:m) = A(p+1:m, p);

	%	Hp = eye(m) - 2*vp*vp'/(vp'*vp);
  % A = Hp*A*Hp';
  %endfor

  for p = 1: m-2
		vp = zeros(m, 1);
		vp(p+1) = A(p+1, p) + (sign(A(p+1,p)) * norm(A(p+1:m, p)));
		vp(p+2:m) = A(p+2:m, p);

		Hp = eye(m) - 2*vp*vp'/(vp'*vp);

		A = Hp*A*Hp';
  endfor
endfunction	
