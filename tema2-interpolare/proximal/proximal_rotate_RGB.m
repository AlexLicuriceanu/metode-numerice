function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    red_ch = img(:, :, 1);
    % TODO: Extrage canalul verde al imaginii.
    green_ch = img(:, :, 2);
    % TODO: Extrage canalul albastru al imaginii.
    blue_ch = img(:, :, 3);
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    red_ch = proximal_rotate(red_ch, rotation_angle);
    green_ch = proximal_rotate(green_ch, rotation_angle);
    blue_ch = proximal_rotate(blue_ch, rotation_angle);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red_ch, green_ch, blue_ch);
endfunction
