function [Q R b] = householder(A, b)
    [m n]=size(A);
    Q=eye(m);
    
    for p=1:min(m-1,n)
      sigma=norm(A(p:m,p));
      if A(p,p)<0
       sigma=-sigma;
      endif  
      
      vp(1:m,1)=0;
      vp(p)=A(p,p)+sigma;
      vp(p+1:m)=A(p+1:m,p);
      
      beta=vp(p)*sigma;
      
      A(p,p)=-sigma;
      A(p+1:m,p)=0;
      
      for j=p+1:n
        tau=vp(p:m)'*A(p:m,j)/beta;
        A(p:m, j)=A(p:m, j)-tau*vp(p:m);
      endfor
      
      t=vp(p:m)' * b(p:m)/beta;
      b(p:m)=b(p:m)- t*vp(p:m);
      
      for j=1:m
        tau=vp(p:m)'*Q(p:m,j)/beta;
        Q(p:m, j)=Q(p:m, j)-tau*vp(p:m);
      endfor       
    endfor
    
    R=A;
    Q=Q';

endfunction