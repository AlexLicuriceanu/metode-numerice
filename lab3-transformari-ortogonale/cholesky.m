function [L] = cholesky(A)
  [n n]=size(A);
  L=zeros(n);
  
  for j=1:n
    L(j,j)=sqrt(A(j,j) - L(j, 1:j-1)*L(j, 1:j-1)');
    for i=j+1:n
      L(i,j)=(A(j,i)- L(j,1:j-1)*L(i,1:j-1)')/L(j,j);
    endfor
  endfor
endfunction