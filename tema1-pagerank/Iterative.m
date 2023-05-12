function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  fileID = fopen(nume, "r");              % deschidem fisierul
  N = fscanf(fileID, "%f", 1);            % citim numarul total de noduri
  matr = dlmread(fileID);                 % citim matricea din fisier
  nr_nodes_matr = matr([2:N+1], [2]);     % citim numarul de noduri cu care se invecineaza fiecare nod
  vecini = matr([2:N+1], [3:N]);          % extragem vecinii fiecarui nod
  
  
  A = zeros(N);                   % initializam matricea de adiacenta, de dimensiune NxN
  for i=1:N                       % completam matricea de adiacenta
    for j=1:nr_nodes_matr(i);
      A(i, vecini(i, j)) = 1;
    endfor
    
    if A(i, i) == 1
      A(i, i) = 0;          % setam diagonala principala cu 0-uri
      nr_nodes_matr(i)--;   % decrementam numarul de legaturi ale nodului i daca exista o legatura catre el insusi
    endif
  endfor
  
  inv_K = diag(1./nr_nodes_matr);   % formam inversa matricei K
  M = (inv_K * A)';                 % formam matricea M
  R(1:N, 1) = 1/N;                  % initializam vectorul de PageRank-uri cu valoarea 1/N pentru pasul t = 0
  
  % folosind formula, calculam R pana cand eroarea este mai mica decat epsilon
  % https://en.wikipedia.org/wiki/PageRank#Iterative
  do
    prev_R = R;                                  % salvam in prev_R matricea R la pasul t
    R = d * M * prev_R + (1-d)/N * ones(N, 1);   % calculam R la pasul t+1
  until norm(R-prev_R) < eps
  
  R = prev_R;       % do...while calculeaza pana la pasul t+1, dar ne intereseaza R la pasul t
  fclose(fileID);   % inchidem fisierul
endfunction