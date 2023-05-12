function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel �nc�t aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    red_ch = img(:, :, 1);
    
    % TODO: Extrage canalul verde al imaginii.
    green_ch = img(:, :, 2);
    
    % TODO: Extrage canalul albastru al imaginii.
    blue_ch = img(:, :, 3);
    
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    red_ch = proximal_resize(red_ch, p, q);
    green_ch = proximal_resize(green_ch, p, q);
    blue_ch = proximal_resize(blue_ch, p, q);
    
    % TODO: Formeaza imaginea finala concaten�nd cele 3 canale de culori.
    out = cat(3, red_ch, green_ch, blue_ch);
endfunction
