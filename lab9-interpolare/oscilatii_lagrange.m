function oscilatii_lagrange()
  %%%%%%%%%%%%%%%%%%%%%%%% Functia log(x)
  %n = 90; % n reprezinta gradul polinomului Lagrange
  %m = 25;
  % suportul interpolarii
  %xp = linspace(20, m, n+1);
  %yp = log(xp);

  %xf = [20 : 0.05 : m];
  %yf = log(xf);
  
  %%%%%%%%%%%%%%%%%%%%%%%% Functia 1/(1+25*x^2)
  n = 5; % n reprezinta gradul polinomului Lagrange
  % suportul interpolarii
  xp = linspace(-1,1, n+1);
  yp = 1./(1+25*xp.^2);

  xf = [-1:0.01:1];
  yf = 1./(1+25*xf.^2);

  for i = 1 : length(xf)
    lag(i) = Lagrange(xp, yp, xf(i));
    C2_nat(i) = splineC2_natural(xp, yp, xf(i));
  endfor
  
  plot(xf,yf,"k", xf,lag,"r", xf,C2_nat,"b", xp,yp,"mo", "markersize", 10);
  legend("original", "Lagrange", "splineC2natural", "suportul interpolarii");
endfunction