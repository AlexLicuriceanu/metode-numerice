function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    % TODO: calculeaza derivata
    [m n] = size(f);
    if (y == 1 || y == m)
      r = 0;
    else
      % https://curs.upb.ro/2021/pluginfile.php/492953/mod_resource/content/3/__lab_11.pdf
      r = (f(y+1, x) - f(y-1, x)) / 2;
    endif
endfunction
