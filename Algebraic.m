function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
  %aici urmeaza calcularea matricei care respecta
  %conditia din teorema( matrice este diferit fata de m)
  for i = 1:n
      for j =1:n
          if m(j,i) == 1
              matrice(i,j) = 1/L(j);
          endif
      endfor
  endfor
  %calculam inversa cu ajutorul functiei pentru inversare
  INV = PR_Inv(eye(n) - d*matrice);
  %one este vectorul coloana cu valori de 1
  one(1:n) = 1;
  one = one';
  R = INV * (1 - d)/n *one;
  
  fclose(fid);  
end 
  
  
  
  