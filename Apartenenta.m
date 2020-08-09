function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
  %a si b se calculeaza folosind conditia de continuitate a functiei
  %in punctele val1 si val2
  a = 1/(val2 - val1);
  b= - val1/(val2 -val1);
  %fiecare valoare x va fi tratata in functie de intervalul
  %in care apartine 
  if(x >= 0 && x < val1) y =0;
  endif
  if(x >= val1 && x <= val2) y =a * x + b;
  endif
  if(x > val2 && x <= 1) y =1;
  endif
	% Stim ca 0 <= x <= 1 
  
end