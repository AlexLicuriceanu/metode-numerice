function x = sistem_LLt(A, b)
   [L] = cholesky(A);
   y=SIT(L,b);
   x=SST(L',y);
endfunction