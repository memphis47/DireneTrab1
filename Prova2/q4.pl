media_geometrica(Num,[A,B]):-
	divisor_exato(A,Num),
	multiplo_exato(B,Num),
	Mul is A*B,
	R is sqrt(Mul),
	Num == R.