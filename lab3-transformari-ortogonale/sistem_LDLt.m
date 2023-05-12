function x = sistem_LDLt(A, b)
  [L D] = LDLt(A);
  z=SIT(L,b);
  y=SIT(D,z);
  x=SST(L',y);
endfunction