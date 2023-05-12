PROXIMAL:
Pentru fiecare pixel, am calculat distanta dintre x_int si y_int fata de 
(x1, y1), (x2, y1), (x1, y2) si (x2, y2) si am ales distanta minima. Pixelul
final va lua valoare lui f apelat cu x1/x2 sau y1/y2 in functie de care dintre
puncte determina distanta minima. 

Pentru 2x2_resize, am urmarit indicatiile din 
TODO, am definit matricea de transformare, am aplicat matricea de transformare 
inversa fiecarui pixel si am calculat valoarea pixelului final.

Pentru 2x2_rotate,  am parcurs fiecare pixel si am aplicat matricea de transformare
fiecaruia, verificand daca dupa rotatie pixelul iese din imagine, caz in care il 
facem negru. Am calculat coeficientii de interpolare, iar in functie de acestia, 
pixelul final.

BICUBIC:
Pentru bicubic_resize, am apelat functia precalc_d pentru a calcula derivatele, apoi
am parcurs fiecare pixel si am aplicat inversa matricei de transformare pe fiecare pixel. 
Coeficientii de interpolare sunt calculati apeland functia bicubic_coef iar apoi este
calculata valoarea pixelului final.

Pentru toate cerintele cu RGB am procedat la fel, doar am descompus imaginea pe canale
RGB si am apelat functia corespunzatoare pentru fiecare dintre acestea, ulterior
concatenand rezultatele pentru a forma imaginea finala.