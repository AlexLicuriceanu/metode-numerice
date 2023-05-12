function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    red_ch = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    green_ch = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    blue_ch = img(:, :, 3);
    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    red_ch = bicubic_resize(red_ch, p, q);
    green_ch = bicubic_resize(green_ch, p, q);
    blue_ch = bicubic_resize(blue_ch, p, q);
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    out = cat(3, red_ch, green_ch, blue_ch);
endfunction
