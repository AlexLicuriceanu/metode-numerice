function testare_sistem_2ec_dif_ordin1()
  % Testam solutia calculata folosind mai multe metode numerice a unui sistem de 2 ecuatii diferentiale de ordinul 1 cu conditii initiale
  % Sistemul de ecuatii diferentiale are forma:
  %		y'_1 = f1(t, y1, y2)
  %		y'_2 = f2(t, y1, y2)
	[f1 f2 y1_exact y2_exact y10 y20 a b n] = exemplu1_sistem_2ec_dif_ordin1();
  
  [y1_eul y2_eul] = euler_sistem(f1, f2, y10, y20, a, b, n);
  %[y1_rk4 y2_rk4] = RK4_sistem(f1, f2, y10, y20, a, b, n);
  [y1_rk2 y2_rk2] = RK2_sistem(f1, f2, y10, y20, a, b, n);

  te = linspace(a, b, n+1);
	h = (b-a)/n;
	ta(1:n+1) = a + h*[0:n];
 
  plot(te,y1_exact(te),"r", te,y2_exact(te),"r",   ta,y1_eul,"g", ta,y2_eul,"g",  
       ta,y1_rk2,"c", ta,y2_rk2,"c"); 
  legend("y1 exact", "y2 exact", "y1 euler", "y2 euler", "y1 RK2", "y2 RK2", "location", "northwest");
endfunction