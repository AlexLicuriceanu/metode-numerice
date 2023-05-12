function testare_ec_dif_ordin1()
  % Testam solutia calculata folodind mai multe metode numerice a unei ecuatii diferentiale de ordinul 1 cu conditii initiale
  % Ecuatia diferentiala are forma: y' = f(t, y)

  [f y_exact y0 a b n] = exemplu1_ec_dif_ordin1();
  %[f y_exact y0 a b n] = exemplu2_ec_dif_ordin1();
  
  y_eul = euler(f, y0, a, b, n);
  y_rk4 = RK4(f, y0, a, b, n);
  y_rk2 = RK2(f, y0, a, b, n);
  y_pred_cor_3 = pred_cor_ordin3(f, y0, a, b, n);

  te = linspace(a, b, n+1);
	h = (b-a)/n;
	ta(1:n+1) = a + h*[0:n];
 
  plot(te,y_exact(te),"r", ta,y_eul,"g",  ta,y_rk2,"c", ta,y_pred_cor_3,"m", ta,y_rk4,"b"); 
  legend("y exact", "euler", "RK2", "predictor corector ordin3", "RK4", "location", "northwest");
endfunction