function X = G_sisteme_multiple(A, B)
  [n n]=size(A);
  X=zeros(n,n);
  
  for p=1:n-1
    for i=p+1:n
      tp=A(i,p)/A(p,p);
      A(i,p)=0;
      A(i,p+1:n)=A(i,p+1:n)-tp*A(p,p+1:n);
      B(i,:)=B(i,:)-tp*B(p,:);
    endfor
  endfor
  
  for i=n:-1:1
    for k=1:n
      X(i,k)=(B(i,k)-A(i, i+1:n)*X(i+1:n,k))/A(i,i);
    endfor
  endfor
endfunction  