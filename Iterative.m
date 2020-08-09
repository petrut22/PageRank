function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  fid = fopen(nume, 'r');
  %am citit toate valorile din fisier intr-o matrice patratica
  % si dupa am accesat elementele necesare in functie de cerinta
  A = dlmread(nume);
  %nr de pagini reprezinta primul element din matricea A
  n = A(1, 1);
  % am creat matricea de adiacenta a grafului din fisier
  % avand in vedere daca o pagina "nod" are legatura spre el
  %atunci puneam valorea 0
  for i = 1:n
      u =  A(i+1, 1); 
      %cand calculez nr de pagini unde pot naviga de la pagina i
      %am in vedere si faptul daca nodul are legatura spre el
      %in cazul acela scadem nr de pagini
      L(u) = A(i+1, 2);
      for j = 1:L(u)
          if( u == A(i+1,2+j) ) L(u)=  L(u) - 1;
          else m(u, A(i+1,2+j) ) = 1;  
          endif  
      endfor
  endfor
  val1 = A(n+2, 1);
  val2 = A(n+3, 1);
  %fiecare componenta din vectorul R va avea
  %valorea 1/n conform algoritmului
  R(1:n) = 1/n;
  nr = 0;
  do
    %retinem valoarea vveche a vecotrului pentru comparare
    Rvechi = R;
    for i = 1:n
        s = 0;
        for j = 1:n
          %cautam acele pagini care respecta conditia
          %adica sa existe trecere de la pagina j
          %la pagina i
             if(m(j, i) == 1) 
                s = s + Rvechi(j)/L(j);
             endif    
        endfor
        R(i) = (1 - d)/n + d * s;    
    endfor
 
  until(abs(R - Rvechi) <  eps)
 %vectorul final va fi in in Rvechi
  R = Rvechi';

  fclose(fid);  
  

 end 