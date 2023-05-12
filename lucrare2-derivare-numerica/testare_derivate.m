function testare_derivate()
	h = 0.01;
	x0 = [1:0.5:5];
	y = @(x) sin(x); % functie anonima
	dy = @(x) cos(x); % functie anonima, calculeaza derivata lui y
	
	for i = 1 : length(x0)
    % valoarea exacta a derivatei in punctele x0(i) 
		deriv_exacta(i) = dy(x0(i)); 

		% valorile aproximative ale derivatei in punctele x0(i)
		y_TwoPoints(i) = TwoPoints(y, h, x0(i));
		y_ThreePoints_Mid(i) = ThreePoints_Mid(y, h, x0(i));
		y_ThreePoints_End(i) = ThreePoints_End(y, h, x0(i));
	endfor
	
	deriv_exacta
	y_TwoPoints
	y_ThreePoints_Mid
	y_ThreePoints_End
endfunction