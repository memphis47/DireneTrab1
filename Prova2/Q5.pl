val(1).
val(2).
val(3).
val(4).
val(5).
val(6).
val(7).
val(8).
val(9).

gera_quadrado(L):-
	
	todos_sao_diferentes(L),
	soma_das_linhas(L,A),
	A == 15,
	soma_das_colunas(L,B),
	B == 15,
	soma_das_diagonais(L,C),
	C == 15.

um_quadrado_magico():-
	gera_quadrado(L),
	matriz_impressa(L).