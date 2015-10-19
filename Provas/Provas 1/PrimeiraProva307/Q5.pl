compara_letra(Let,0):-
	'a'== Let, 
	Let = 'a'.
compara_letra(Let,1):-
	'b'== Let, 
	Let = 'b'.
compara_letra(Let,2):-
	'c'== Let,
	Let = 'c'.
compara_letra(Let,3):-
	'd'== Let,
	Let = 'd'.
compara_letra(Let,4):-
	'e'== Let,
	Let = 'e'.
compara_letra(Let,5):-
	'f'== Let,
	Let = 'f'.
compara_letra(Let,6):-
	'g'== Let,
	Let = 'g'.
compara_letra(Let,7):-
	'h'== Let,
	Let = 'h'.
compara_letra(Let,8):-
	'i'== Let,
	Let = 'i'.
compara_letra(Let,9):-
	'j'== Let,
	Let = 'j'.
compara_letra(Let,10):-
	'k' == Let,
	Let = 'k'.
compara_letra(Let,11):-
	'l' == Let,
	Let = 'l'.
compara_letra(Let,12):-
	'm' == Let,
	Let = 'm'.
compara_letra(Let,13):-
	'n' == Let,
	Let = 'n'.
compara_letra(Let,14):-
	'o' == Let,
	Let = 'o'.
compara_letra(Let,15):-
	'p' == Let,
	Let = 'p'.
compara_letra(Let,16):-
	'q' == Let,
	Let = 'q'.
compara_letra(Let,17):-
	'r' == Let,
	Let = 'r'.
compara_letra(Let,18):-
	's' == Let,
	Let = 's'.
compara_letra(Let,19):-
	't' == Let,
	Let = 't'.
compara_letra(Let,20):-
	'u' == Let,
	Let = 'u'.
compara_letra(Let,21):-
	'v' == Let,
	Let = 'v'.
compara_letra(Let,22):-
	'w' == Let,
	Let = 'w'.
compara_letra(Let,23):-
	'x' == Let,
	Let = 'x'.
compara_letra(Let,24):-
	'y' == Let,
	Let = 'y'.
compara_letra(Let,25):-
	'z' == Let,
	Let = 'z'.


compara_posicao(Let,Pos):-
	Pos is 0, 
	Let = 'a'.
compara_posicao(Let,Pos):-
	Pos is 1, 
	Let = 'b'.
compara_posicao(Let,Pos):-
	Pos is 2,
	Let = 'c'.
compara_posicao(Let,Pos):-
	Pos is 3,
	Let = 'd'.
compara_posicao(Let,Pos):-
	Pos is 4,
	Let = 'e'.
compara_posicao(Let,Pos):-
	Pos is 5,
	Let = 'f'.
compara_posicao(Let,Pos):-
	Pos is 6,
	Let = 'g'.
compara_posicao(Let,Pos):-
	Pos is 7,
	Let = 'h'.
compara_posicao(Let,Pos):-
	Pos is 8,
	Let = 'i'.
compara_posicao(Let,Pos):-
	Pos is 9,
	Let = 'j'.
compara_posicao(Let,Pos):-
	Pos is 10,
	Let = 'k'.
compara_posicao(Let,Pos):-
	Pos is 11,
	Let = 'l'.
compara_posicao(Let,Pos):-
	Pos is 12,
	Let = 'm'.
compara_posicao(Let,Pos):-
	Pos is 13,
	Let = 'n'.
compara_posicao(Let,Pos):-
	Pos is 14,
	Let = 'o'.
compara_posicao(Let,Pos):-
	Pos is 15,
	Let = 'p'.
compara_posicao(Let,Pos):-
	Pos is 16,
	Let = 'q'.
compara_posicao(Let,Pos):-
	Pos is 17,
	Let = 'r'.
compara_posicao(Let,Pos):-
	Pos is 18,
	Let = 's'.
compara_posicao(Let,Pos):-
	Pos is 19,
	Let = 't'.
compara_posicao(Let,Pos):-
	Pos is 20,
	Let = 'u'.
compara_posicao(Let,Pos):-
	Pos is 21,
	Let = 'v'.
compara_posicao(Let,Pos):-
	Pos is 22,
	Let = 'w'.
compara_posicao(Let,Pos):-
	Pos is 23,
	Let = 'x'.
compara_posicao(Let,Pos):-
	Pos is 24,
	Let = 'y'.
compara_posicao(Let,Pos):-
	Pos is 25,
	Let = 'z'.


devolve_nova_letra(LetraAtual,LetraNova,Deslocamento):-
	compara_letra(LetraAtual,Posicao),
	NewPos is Posicao + Deslocamento,
	compara_posicao(LetraNova,NewPos).

codificada([],_,X):- X = ''.

codificada([H|T],N,[NL|X]):-
	codificada(T,N,X),
	devolve_nova_letra(H,NL,N).
