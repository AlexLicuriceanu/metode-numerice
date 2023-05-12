function r = ThreePoints_End(y, h, x0)
   r = (-3*y(x0) + 4*y(x0+h) - y(x0 + 2*h)) / (2*h);
endfunction