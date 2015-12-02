%DPLL sat
:- dynamic elemento/1, ver/1, fal/1, clausulas_idefinidas/1.

assert_bt(X) :- assert(X).
assert_bt(X) :- retract(X), fail.

sat(ENTRADA) :-
	split_string(ENTRADA,'&'," ",L1),
	resolve_bloco(L1).

resolve_bloco([]).

resolve_bloco([H|T]):-
	sub_string(H,1,_,1,Res),
	split_string(Res,"#"," ",L2),
	atribui_elementos(L2),
	verifica_sat([H|T]).

atribui_elementos([]).

atribui_elementos([H|T]):-
	sub_string(H,1,_,0,Res),
	Res \= "",
	assert_bt(elemento(Res)),
	atribui_elementos(T).

atribui_elementos([H|T]):-
	assert_bt(elemento(H)),
	atribui_elementos(T).

atribui_verdade:-
	elemento(X),
	assert_bt(ver(X)).

atribui_falso:-
	elemento(X),
	assert_bt(fal(X)).

verifica_sat([H|T]):-
	atribui_verdade,
	verifica_blocos([H|T]).

verifica_sat([H|T]):-
	atribui_falso,
	verifica_blocos([H|T]).

verifica_blocos([H|T]):-
	sub_string(H,1,_,1,Res),
	split_string(Res,"#"," ",L2),
	verifica(Res,L2),
	verifica_blocos(T).

verifica(Res,[H|T]):-
	ver(X),
	verifica_total(Res,[H|T],X,Y).
	
verifica(Res,[H|T]):-
	fal(X),
	verifica_total(Res,[H|T],X,Y).

verifica_total(Res,[H|T],X):-
	X == H.

verifica_total(Res,[],_):-
	assert_bt(clausulas_idefinidas(Res)).

verifica_total(Res,[H|T],X):-
	sub_string(H,1,_,0,Res),
	Res \= "",
	X == Res,
	ver(X),
	verifica_total(Res,[H|T],X).

verifica_total(Res,[H|T],X):-
	sub_string(H,1,_,0,Res),
	Res \= "",
	X == Res,
	fal(X).

verifica_total(Res,[H|T],X):-
	sub_string(H,1,_,0,Res),
	Res \= "",
	X \= Res,
	verifica_total(Res,[H|T],X).

verifica_total(Res,[H|T],X):-
	X \= H,
	verifica_total(Res,[H|T],X).