function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    [m n]=size(f);
    % TODO: calculeaza derivata
    if (y == 1 || x == 1 || y == m || x == n)
      r = 0;
    else
      % https://curs.upb.ro/2021/pluginfile.php/492953/mod_resource/content/3/__lab_11.pdf
      r = (f(y-1, x-1) + f(y+1, x+1) - f(y-1, x+1) - f(y+1, x-1)) / 4;
    endif
endfunction
