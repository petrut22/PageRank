function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  
	[m n]=size(A);
	Q = A;
	R = zeros( m, n );
  %efectuam descompunerea lui A in QR cu ajutorul algoritmului Gram-Schmidt
	for k = 1 : n
           R( k, k ) = norm( Q( 1 : m, k ) );
	   Q( 1 : m, k ) = Q( 1 : m, k ) / R( k, k );
	   for j = k + 1 : n
		R( k, j ) = Q( 1 : m, k )' * Q( 1 : m, j );
		Q( 1 : m, j ) = Q(1 : m, j ) - Q( 1 : m, k ) * R( k, j );
	   endfor
	endfor
  %cum Q este ortogonala atunci inversa lui Q
  %este traspusa ei
  B = inv(R) * Q';
  
 
 end