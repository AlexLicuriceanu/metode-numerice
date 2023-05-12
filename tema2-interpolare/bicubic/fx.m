function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: calculeaza derivata
    [m n] = size(f);
    if (x == 1 || x == n)
      r = 0;
    else
	  % https://curs.upb.ro/2021/pluginfile.php/492953/mod_resource/content/3/__lab_11.pdf
      r = (f(y, x+1) - f(y, x-1)) / 2;
    endif
endfunction
