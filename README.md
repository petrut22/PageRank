# PageRank

Arhiva contine programele necesare pentru cerintele temei si fiecare functie acopera
rezolvarea unui task anume. Implementarea temei a fost realizata intr-o singura zi.

Prima functie "Iterative.m" realizeaza prima cerinta din problema si a fost folosita
metoda "Iterativ" (ideile) de pe linkul wikipedia. Am citit mai intai toate datele din fisier
intr-o matrice cu n elemente, n - reprezinta numarul de pagini. Primul element din matrice
reprezinta chiar numarul de pagini, iar valorile de pe coloana 1 din ultimele 2 linii din A reprezinta val1 si val2, dupa am realizat graful necesar cu urmatoarele date.
Pentru fiecare linie am procedat astfel: am citit pagina i si dupa nr de pagini unde se poate
naviga, apoi in matricea m am completat astfel incat daca exista trecere de la pagina i la
pagina j atunci m(i, j) = 1 altfel 0. In vectorul L am retinut nr de pagini unde se poate naviga
pentru o anumita pagina. R va reprezenta vectorul cerut de primul task. Initial R va avea
pe fiecare componenta valoare 1/n apoi se va aplica algoritmul din cerinta. Algoritmul se
va termina in momentul in care valoarea absoluta a diferentei dintre R si Rvechi este mai
mica decat eps. In final R va primi Rvechi( sub forma de vector coloana).

Functia "Algebric.m" realizeaza matricea m ca si in prima functie, dupa creeaza "matrice" 
conform algoritmului din "Algebric". Inversa a fost calculata cu ajutorul functiei 
"PR_Inv.m" care descompune matricea A, folosind factorizari Gram-Schmidt, in Q R. Cum Q 
este ortogonala, atunci inversa ei este chiar transpusa. In final functia determina
inversa lui A. Dupa calcularea inversei de obtine R-ul cu ajutorul formulei(one este vector coloana cu valori de 1).

Functia "PageRank.m" apeleaza cele doua functii de mai sus pentru realizarea temei si printarea
lor in fisierul de iesire( denumirea acestuia a fost realizata cu ajutorul operatiilor cu
siruri, folosind numele initial al fisierului de intrare + ".out"). De asemenea, in functie
a fost redeschis fisierul de intrare pentru obtinerea valoriilor val1 si val2 pentru taskul3.
Algoritmul de sortare utilizat a fost bubble-sort cu conditia inversata pentru obtinerea vectorului
ordonat descrescator. In R3 am retinut pe prima coloana nodurile j a caror PageRank este PR1(i),
iar in a doua coloana valoarea functiei din "Apartenenta.m". Valorile a si b au fost obtinute
cu ajutorul conditiei de continuitate in punctele a si b. Dupa ce s-au obtinut cele doua ecuatii
in functie de a si b se rezolva sistemul si se obtin rezultatele. In final se afiseaza in fisierul
de iesire R3 precedat de valorea i pentru fiecare linie.

Observatie: Algoritmul Gram-Schmidt a fost luat din laborator.

Stingescu Andrei Petrut 314CC
