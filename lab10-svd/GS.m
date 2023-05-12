function Q = GS(U)
  % U=[[0.3381 0.5506 0.7632]' [0.8480 0.1735 -0.5009]' rand(3,1)]
  [m n]=size(U);
  Q=zeros(m,n);
  R=zeros(n);
  
  for j=1:n
    for i=1:j-1
        R(i,j)=Q(:,i)'*U(:,j);
    endfor
    aux=U(:,j)- Q(:,1:j-1)*R(1:j-1,j);
    R(j,j)=norm(aux);
    Q(:,j)=aux/R(j,j);
  endfor  
endfunction