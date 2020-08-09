function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  %pentru obtinerea fisierul de iesire se folosesc
  %operatii pe siruri
  numeout = nume;
  numeout = strcat(numeout, ".out");
  f = fopen(numeout, 'w');
  %obtinem vectorul corespunzator primului task
  R1 = Iterative(nume, d, eps);
  %aflam nr de pagini care corespunde dimensiunii
  %lui R1
  n = length(R1);
  %urmeaza partea de afisare a primului task
  fprintf(f, "%d\n\n", n);
  
  for i = 1:n
    fprintf(f, "%f\n", R1(i));
  end
 %obtinem vectorul corespunzator al doilea task
  R2 = Algebraic(nume, d);
  n = length(R2);
  %urmeaza partea de afisare pentru cel de-al doilea task
    fprintf(f, "\n");

  for i = 1:n
    fprintf(f, "%f\n", R2(i));
  end

  %am redeschis fisierul de intrare ca sa obtin valorile
  %val1 si val2 necesare pentru cel de-al treilea task
  fis = fopen(nume, "r");
  A = dlmread(nume);
  val1 = A(n+2, 1);
  val2 = A(n+3, 1);
  fclose(fis);
  %am retinut vectorul initial din taskul 2 pentru ordonare
  PR1 = R2;
  %urmeaza partea de sortare, am folosit bubble-sort
  ok = 1;
  while( ok == 1)
      ok = 0;
      for i = 1:n-1
        %am inversat conditia de sortare pentru a obtine vectorul
        %descrescator
          if( PR1(i) < PR1(i+1) )
              aux = PR1(i);
              PR1(i) = PR1(i+1);
              PR1(i+1) = aux;
              ok = 1;
          endif
      endfor
  endwhile
 
 %acum urmeaza partea de a determina nodul a carui PageRank este PR1(i),
  for i = 1:n
      for j = 1:n
            if( PR1(i) == R2(j) )
                  break;
            endif
      endfor
      %R3 va fi o matrice care va contine pe coloana 1 j-ul
      %iar pe a doua linie valoarea functiei
      R3(i,1) = j;
      R3(i, 2) = Apartenenta(PR1(i), val1, val2);
  endfor
  %afisam R3 in fisier
   fprintf(f, "\n");
  for i = 1:n
      fprintf(f, "%d %d %f \n", i, R3(i,1), R3(i, 2));
  endfor
  
  fclose(f);
  end