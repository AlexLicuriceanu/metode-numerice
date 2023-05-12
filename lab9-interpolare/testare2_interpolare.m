% suportul interpolarii
xp = [0:10];
% valoarea functiei pentru punctele din suportul interpolarii
yp = sin(2*pi*xp/5);

% valoarea derivatei functiei pentru punctele din suportul interpolarii
dyp = (2*pi/5)*cos(2*pi*xp/5);

xf = [0:0.05:10];
yf = sin(2*pi*xf/5);

for i = 1 : length(xf)
  lag(i) = Lagrange(xp, yp, xf(i));
  C1(i) = splineC1(xp, yp, dyp, xf(i));
  C2_nat(i) = splineC2_natural(xp, yp, xf(i));
  C2_ten(i) = splineC2_tensionat(xp, yp, dyp(1), dyp(length(dyp)), xf(i));
endfor
  
plot(xf,yf,"r", xf,lag,"g", xf,C1,"m", xf,C2_nat,"b", xf,C2_ten,"c", xp,yp,"ko", "markersize", 15);
legend("original", "Lagrange", "splineC1", "splineC2natural", "splineC2tensionat");


