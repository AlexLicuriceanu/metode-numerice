function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    red_ch = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    green_ch = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    blue_ch = img(:, :, 3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    red_ch = proximal_2x2(red_ch, STEP);
    green_ch = proximal_2x2(green_ch, STEP);
    blue_ch = proximal_2x2(blue_ch, STEP);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red_ch, green_ch, blue_ch);
endfunction
