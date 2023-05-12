function r = ThreePoints_Mid(y, h, x0)
  r = (y(x0+h) - y(x0-h)) / (2*h);
endfunction