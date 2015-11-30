invertida([],[]):-!.

invertida([H|T],L):-
	invertida(T,P),
	append(P,[H],L).

simetrica(L):-
	invertida(L,In),
	L = In.