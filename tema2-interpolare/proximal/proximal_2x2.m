function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    x1 = 1; x2 = 2;
    y1 = 1; y2 = 2;
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n, n);
    
    % Se parcurge fiecare pixel din imaginea finala.
    final_pixel = 0;
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            aux(1) = sqrt((x_int(i)-x1)^2 + (y_int(j)-y1)^2);
            aux(2) = sqrt((x_int(i)-x1)^2 + (y_int(j)-y2)^2);
            aux(3) = sqrt((x_int(i)-x2)^2 + (y_int(j)-y1)^2);
            aux(4) = sqrt((x_int(i)-x2)^2 + (y_int(j)-y2)^2);
            min_dist = min(aux);
            
            % TODO: Calculeaza pixelul din imaginea finala.
    	    if (j != ceil(n/2))
              if (min_dist == aux(3))
                final_pixel = f(y2,x1);
              elseif (min_dist == aux(4))
                final_pixel = f(y2,x2);
              elseif (min_dist == aux(1))
                final_pixel = f(y1,x1);
              elseif (min_dist == aux(2))
                final_pixel = f(y1,x2);
              endif
            elseif (j == ceil(n/2)) 
              if (i < ceil(n/2))
                final_pixel = f(y1,x2);
              elseif (i >= (n/2))
                final_pixel = f(y2,x2);
              endif
            endif
            
    	    out(i, j) = final_pixel;
        endfor
    endfor

endfunction
