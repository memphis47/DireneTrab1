soma_de_2_primos(Num,L):-
	soma_de_2_naturais(Num,L),
	verificaPrimo(L).


verificaPrimo([H|T]):-
	e_primo(H),
	e_primo(T).