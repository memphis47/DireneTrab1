todos_sao_diferentes([H|T]):-
	verificaLista(T,H).

verificaLista([],_):- !.

verificaLista([H1|T],H):-
	H=\=H1,
	verificaLista(T,H),
	verificaLista(T,H1).