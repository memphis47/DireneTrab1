todos_sao_diferentes([], R) :- !.

todos_sao_diferentes([H|T], R) :-
	R is H,
	todos_sao_diferentes(T,R),
	H=\=R.
