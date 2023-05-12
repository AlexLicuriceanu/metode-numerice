# Algoritmul Google PageRank Simplificat

## Utilizare
```
PageRank("nume", d, eps);

Unde nume este numele fisierului, d este coeficientul probabilitatii ca utilizatorul sa continue navigarea (de obicei 0.85) 
iar eps este eroarea pe care o poate avea algoritmul.
```

## PageRank.m
Functia controller, calculeaza indicii PageRank in doua moduri, dar si importanta paginilor din fisierul de intrare. Primul pas este sa deschidem fisierul din care citim datele, apoi se creeaza un nou fisier pentru a scrie datele de iesire. In vectorul `R1` se salveaza indicii calculati folosit algoritmul iterativ, iar in vectorul `R2` sunt valorile calculate cu algoritmul algebric. In `N` citim prima valoare din fisier, care reprezinta numarul de noduri si o scriem in fisier, urmata de valorile din `R1` si `R2`. Pentru a calcula gradul de apartenenta a fiecarei pagini, citim matricea din fisier si extragem valorile `val_1` si `val_2` care se afla pe ultima si respectiv penultima linie a primei coloane din matrice. Folosind functia `sort()` salvam in `PR_1` vectorul `R2` sortat descrescator si in `I` pozitiile fiecarui element inainte de sortare. Cu un for calculam pentru fiecare element al vectorului `PR_1` gradul de apartenenta apeland functia `Apartenenta()` si scriem indicii si rezultatele in fisier conform formatului specificat in cerinta. In final, se inchid cele doua fisiere si se inchide functia.

## Iterative.m
Deschidem fisierul pentru citire, salvam in `N` numarul total de noduri, in `matr` citim matricea din fisier, in `nr_nodes_matr` se extrage din matr primele `N` elemente din a doua coloana, care reprezinta numarul de noduri adiacente fiecarui nod. In matricea `vecini` se citesc numerele nodurilor care reprezinta vecinii fiecarui nod. Initializam matricea de adiacenta `A` cu zerouri, apoi cu doua for-uri parcurgem matricea `vecini` si punem 1 pe pozitia (i, j) pentru fiecare nod i cu legatura la j. Un if se ocupa de decrementarea numarului de vecini pentru nodul i daca exista o legatura de la nodul i la el insusi, iar diagonala matricei `A` este setata cu 0-uri. Matricea `K` are pe diagonala numarul de legaturi care ies din fiecare nod, inversa lui `K` este calculata in matricea `inv_K`, iar matricea `M` este transpusa lui `inv_K * A`. Initializam vectorul de PageRank-uri `R` cu 1/N si in do...until salvam `R` la pasul t in matricea `prev_R` si calculam `R` pana cand eroarea dintre pasul anterior si pasul curent este mai mica decat variabila `eps` (epsilon). Instructiunea do...until va calcula matricea `R` la pasul t+1, insa ne intereseaza pasul t, asa ca atribuim lui `R` valorile din `prev_R` si inchidem fisierul.

## Algebraic.m
Varianta algebrica este identica pana la initializarea vectorului `R` cu metoda iterativa. Vectorul de necunoscute `x` este initializat cu 0-uri, `In` este matricea unitate de dimensiune NxN, iar in `gs_Q` si `gs_R` se salveaza `Q` si `R` din descompunerea QR folosind algoritmul Gram-Schmidt modificat. Pentru fiecare iteratie i se extrage coloana i din matricea unitate si folosind operatorul backslash se rezolva sistemul iar rezultatul este pus in coloana i din matricea `T`. In final se calculeaza vectorul de PageRank-rui in `R` si se inchide fisierul.

## Apartenenta.m
Pentru a determina gradul de apartenenta a fiecarui nod, se evalueaza fiecare ramura a functiei membru. In cazul in care se intra pe prima sau a treia ramura, se returneaza in `y` valorile aferente. Cand se intra pe a doua ramura, calculam valorile `a` si `b` folosind limite laterale in felul urmator: 
Pentru ca functia u sa fie continua trebuie sa fie indeplinite:
```
(1)  lim x->val1 u(x) = u(val1)	<=>	(1)  0 = a * val1 + b
(2)  u(val2) = lim x->val2      <=>	(2)  a * val2 + b = 1
```
De aici avem 2 ecuatii, se reduce `b` si `a` este scris in functie de `val1` si `val2`. Valoarea lui b se calculeaza inlocuind `a` in una dintre cele doua ecuatii cu 1 / (val1 - val2). Apoi rezultatul `y` este calculat folosind valorile `a`,`b` aflate si `x` si este returnat.
