function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  fileID = fopen(nume, "r");                      % deschidem fisierul
  fileOUT = fopen(strcat(nume, ".out"), "w");    % se creeaza fisierul nume.out
  R1 = Iterative(nume, d, eps);                   % apelam metoda iterativa
  R2 = Algebraic(nume, d);                        % apelam metoda algebrica
  
  N = fscanf(fileID, "%f", 1);    % citim numarul de noduri
  fprintf(fileOUT, "%d\n", N);    % scriem numarul de noduri
  fprintf(fileOUT, "%f\n", R1);   % scriem rezultatele pentru metoda iterativa
  fprintf(fileOUT, "\n");         % scriem newline
  fprintf(fileOUT, "%f\n", R2);   % scriem rezultatele pentru metoda algebrica
  fprintf(fileOUT, "\n");         % scriem newline
  
  matr = dlmread(fileID);   % citim matricea
  val_1 = matr(N+2, 1);     % extragem prima valoare
  val_2 = matr(N+3, 1);     % extragem a doua valoare
  [PR_1 I] = sort(R2, "descend");  % sortam descrescator vectorul R2 si il salvam in PR_1
                                   % in I se salveaza pozitia fiecarui element inainte de sortare
  for i=1:N
    fprintf(fileOUT, "%d %d ", i, I(i));
    fprintf(fileOUT, "%f\n", Apartenenta(PR_1(i), val_1, val_2));
  endfor
  
  fclose(fileOUT);      % inchidem fisierul nume.out
  fclose(fileID);       % inchidem fisierul nume
endfunction