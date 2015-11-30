posicoes_das_listas(L,Posic):-
	recursao_verifica_lista(L,Posic,1), 
	!.


recursao_verifica_lista([],'',_):- !.

recursao_verifica_lista([H|T],[P|TP],Sum):-
		not(is_list(H)),
		Sum1 is Sum + 1,
		recursao_verifica_lista(T,[P|TP],Sum1).

recursao_verifica_lista([H|T],[P|TP],Sum):-
		is_list(H),
		P is Sum,
		Sum1 is Sum + 1,
		recursao_verifica_lista(T,TP,Sum1).
	