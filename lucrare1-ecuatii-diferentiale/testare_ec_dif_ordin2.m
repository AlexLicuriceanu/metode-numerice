function testare_ec_dif_ordin2()
  % Testam solutia calculata folosind mai multe metode numerice a unei ecuatii diferentiale de ordinul 2 cu conditii initiale
  % Ecuatia diferentiala are forma: y'' = f(t, y, y')
  
  [f1 f2 y_exact u10 u20 a b n] = exemplu1_ec_dif_ordin2();
  %[f1 f2 y_exact u10 u20 a b n] = exemplu2_ec_dif_ordin2();
  
  y_eul = euler_sistem(f1, f2, u10, u20, a, b, n);
  y_rk4 = RK4_sistem(f1, f2, u10, u20, a, b, n);
  y_rk2 = RK2_sistem(f1, f2, u10, u20, a, b, n);

  te = linspace(a, b, n+1);
	h = (b-a)/n;
	ta(1:n+1) = a + h*[0:n];
 
  plot(te,y_exact(te),"r", ta,y_eul,"g", ta,y_rk2,"c", ta,y_rk4, "b"); 
  legend("y exact", "euler", "RK2", "RK4", "location", "northwest");
  %plot(te,y_exact(te),"r", ta,y_eul,"g", ta,y_rk4,"b", ta,y_rk2,"c"); 
  %legend("y exact", "euler", "RK4", "RK2", "location", "northwest");
endfunction