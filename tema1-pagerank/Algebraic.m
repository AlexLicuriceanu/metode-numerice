function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  fileID = fopen(nume, "r");              % deschidem fisierul
  N = fscanf(fileID, "%f", 1);            % citim numarul total de noduri
  matr = dlmread(fileID);                 % citim matricea din fisier
  nr_nodes_matr = matr([2:N+1], [2]);     % citim numarul de noduri cu care se invecineaza fiecare nod
  vecini = matr([2:N+1], [3:N]);          % extragem vecinii fiecarui nod
  
  
  A = zeros(N);                   % initializam matricea de adiacenta, de dimensiune NxN
  for i=1:N                       % completam matricea de adiacenta
    for j=1:nr_nodes_matr(i);     % daca exista legatura de la nodul i la nodul j
      A(i, vecini(i, j)) = 1;     % A(i, j) devine 1, altfel A(i, j) devine 0
    endfor
    
    if A(i, i) == 1
      A(i, i) = 0;          % punem pe diagonala principala 0-uri
      nr_nodes_matr(i)--;   % decrementam numarul de legaturi ale nodului i daca exista o legatura catre el insusi
    endif
  endfor
  
  inv_K = diag(1./nr_nodes_matr);   % formam inversa matricei K
  M = (inv_K * A)';                 % formam matricea M
  R(1:N, 1) = 1/N;                  % initializam vectorul de PageRank-uri
  
  x = zeros(N, 1);                          % initializam vectorul de necunoscute
  In = eye(N);                              % formam matricea unitate
  [gs_Q, gs_R] = PR_Inv(eye(N) - d * M);    % descompunere QR folosind Gram-Schmidt
  T = zeros(N);                             % initializam matricea T
  
  for i=1:N
    e = In(1:N, i);           % extragem coloana i din matricea unitate
    x = zeros(N, 1);
    x = gs_R \ (gs_Q' * e);   % rezolvam sistemul
    T(1:N, i) = x;            % rezultatul este pus in coloana i din matricea T
  endfor
  
  R = T * ((1-d)/N) * ones(N, 1);     % calculam vectorul cu PageRank-uri
  fclose(fileID);                     % inchidem fisierul
endfunction  