function [L D] = LDLt(A)
  [n n]=size(A);
  L=eye(n);
  D=zeros(n);
  
  for j=1:n
    D(j,j)=A(j,j)-L(j,1:j-1)*D(1:j-1,1:j-1)*L(j,1:j-1)';
    for i=j+1:n
      L(i,j)=(A(j,i)-L(j,1:j-1)*D(1:j-1,1:j-1)*L(i,1:j-1)')/D(j,j);
    endfor
  endfor
endfunction