sat(ENTRADA) :-
	separa_entrada(ENTRADA, ENTRADA_F),
	verifica_sat(ENTRADA_F).

separa_entrada(ENTRADA,ENTRADA_F):-
	string_chars(ENTRADA,ENTRADA_F).

verifica_sat(ENTRADA_F):-
	separa_listas_parenteses(L,L1,L2).

separa_listas_parenteses([],_,_):-!.

separa_listas_parenteses([H|T],SAIDA,L2):-
	H \= '(',
	H \= ')',
	H \= '#',
	L1 is L2,
	append(L1,H,L2),
	separa_listas_parenteses(T,SAIDA,L2),
	L0 is SAIDA,
	append(L0,L2,SAIDA).

separa_listas_parenteses([H|T],SAIDA,L2):-
	H == '#',
	separa_listas_parenteses(T,SAIDA,L2).

separa_listas_parenteses([H|T],SAIDA,L2):-
	H ==')',
	separa_listas_parenteses(T,SAIDA,L2).

separa_listas_parenteses([H|T],SAIDA,L2):-
	H == '(',
	separa_listas_parenteses(T,SAIDA,L2).
